<?php
require("../../core/config.php");
require("../../core/connect_db.php");

require("../../classes/ResponseAPI.php");
require("../../helpers/functions.php");

header("Access-Control-Allow-Origin: " . ACCESS_CONTROL_ALLOW_ORIGIN);
header("Access-Control-Allow-Headers: " . ACCESS_CONTROL_ALLOW_HEADERS);
header("Access-Control-Allow-Methods: POST, PUT, DELETE");
header("Content-Type: application/json");

$data = getJSONPayloadRequest();

// ✅ Xóa file ảnh trên server và dữ liệu trong CSDL
deleteItem($data["id"]);

function deleteItem($id)
{
   global $connect;

   if (!$id || $id < 0) {
      $response = new ResponseAPI(9, "Không đủ dữ liệu payload để thực hiện");
      $response->send();
      return;
   }

   $query = "SELECT * FROM `image` WHERE `id` = $id LIMIT 1";
   $result = mysqli_query($connect, $query);
   if ($obj = $result->fetch_object()) {
      $fileLocation = LOCATION_UPLOAD_IMAGE . $obj->filename;

      if (unlink($fileLocation)) {
         /* Xóa thông tin image trong DB */
         $query = "DELETE FROM `image` WHERE `id` = $id";
         $result = mysqli_query($connect, $query);

         if ($result) {
            $response = new ResponseAPI(1, "Xóa file ảnh thành công");
            $response->send();
         } else {
            $response = new ResponseAPI(2, "Xóa file ảnh thất bại");
            $response->send();
         }
      } else {
         $response = new ResponseAPI(2, "Xóa file ảnh thất bại");
         $response->send();
      }
   } else {
      $response = new ResponseAPI(3, "Không tìm thấy file ảnh");
      $response->send();
   }

   $connect->close();
}
