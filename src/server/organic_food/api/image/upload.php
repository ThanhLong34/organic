<?php
require("../../core/config.php");
require("../../core/connect_db.php");

require("../../classes/ResponseAPI.php");
require("../../helpers/functions.php");

header("Access-Control-Allow-Origin: " . ACCESS_CONTROL_ALLOW_ORIGIN);
header("Access-Control-Allow-Methods: POST");
header("Content-Type: application/json");

$file = null;
if (isset($_FILES['image'])) {
   $file = $_FILES['image'];
}

// ✅ Tải ảnh lên server
uploadItem($file);

function uploadItem($file)
{
   global $connect;

   if (!$file) {
      $response = new ResponseAPI(9, "Không đủ dữ liệu payload để thực hiện");
      $response->send();
      return;
   }

   $createdAt = getCurrentDatetime();
   $filename = $file['name'];
   $fileTmpName = $file['tmp_name'];
   $size = $file['size'];

   // Lấy file extension
   $imageFileType = strtolower(pathinfo($filename, PATHINFO_EXTENSION));

   /* Check file extension */
   if (in_array($imageFileType, IMAGE_EXTENSIONS_VALIDATE)) {
      // Generate filename
      while (true) {
         $filename = uniqid('project_image', false) . ".$imageFileType";
         if (!file_exists(LOCATION_UPLOAD_IMAGE . $filename)) break;
      }

      $link = PATH_UPLOAD_IMAGE . $filename;

      /* Upload file */
      if (move_uploaded_file($fileTmpName, LOCATION_UPLOAD_IMAGE . $filename)) {
         /* Lưu thông tin image trong DB */

         $query = "INSERT INTO `image`(`createdAt`, `link`, `filename`, `size`) VALUES('$createdAt', '$link', '$filename', $size)";
         $result = mysqli_query($connect, $query);

         if ($result) {
            $imageObj = new stdClass;

            $imageObj->id = mysqli_insert_id($connect);
            $imageObj->createdAt = $createdAt;
            $imageObj->link = $link;
            $imageObj->filename = $filename;
            $imageObj->size = $size;

            $response = new ResponseAPI(1, "Tạo file ảnh thành công", $imageObj);
            $response->send();
         } else {
            $response = new ResponseAPI(2, "Tạo file ảnh thất bại");
            $response->send();
         }
      } else {
         $response = new ResponseAPI(2, "Tạo file ảnh thất bại");
         $response->send();
      }
   } else {
      $response = new ResponseAPI(3, "Chỉ chấp nhận các định dạng file sau: " . implode(" | ", IMAGE_EXTENSIONS_VALIDATE));
      $response->send();
   }

   $connect->close();
}
