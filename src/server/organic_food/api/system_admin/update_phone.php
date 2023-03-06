<?php
require("../../core/config.php");
require("../../core/connect_db.php");

require("../../classes/ResponseAPI.php");
require("../../helpers/functions.php");

header("Access-Control-Allow-Origin: " . ACCESS_CONTROL_ALLOW_ORIGIN);
header("Access-Control-Allow-Methods: PUT");
header("Content-Type: application/json");

$data = getJSONPayloadRequest();

// ✅ Thay đổi số điện thoại
changePhone($data["id"], $data["phone"]);

function changePhone($id, $phone)
{
   global $connect;

   if (!$id || $id < 0 || empty($phone)) {
      $response = new ResponseAPI(9, "Không đủ dữ liệu payload để thực hiện");
      $response->send();
      return;
   }

   // Kiểm tra định dạng số điện thoại
   if (validatePhoneNumber($phone)) {
      $updatedAt = getCurrentDatetime();

      $query = "UPDATE `systemadmin` SET `updatedAt` = '$updatedAt', `phone` = '$phone' WHERE `id` = $id AND `deletedAt` IS NULL LIMIT 1";
      $result = mysqli_query($connect, $query);

      if ($result) {
         $response = new ResponseAPI(1, "Thay đổi số điện thoại thành công");
         $response->send();
      } else {
         $response = new ResponseAPI(2, "Thay đổi số điện thoại thất bại");
         $response->send();
      }
   } else {
      $response = new ResponseAPI(3, "Không đúng định dạng số điện thoại");
      $response->send();
   }

   $connect->close();
}
