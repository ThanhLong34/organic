<?php
require("../../core/config.php");
require("../../core/connect_db.php");

require("../../classes/ResponseAPI.php");
require("../../helpers/functions.php");

header("Access-Control-Allow-Origin: " . ACCESS_CONTROL_ALLOW_ORIGIN);
header("Access-Control-Allow-Methods: PUT");
header("Content-Type: application/json");

$data = getJSONPayloadRequest();

// ✅ Thay đổi email
changeEmail($data["id"], $data["email"]);

function changeEmail($id, $email)
{
   global $connect;

   if (!$id || $id < 0 || empty($email)) {
      $response = new ResponseAPI(9, "Không đủ dữ liệu payload để thực hiện");
      $response->send();
      return;
   }

   // Kiểm tra định dạng email
   if (validateEmail($email)) {
      $updatedAt = getCurrentDatetime();

      $query = "UPDATE `systemadmin` SET `updatedAt` = '$updatedAt', `email` = '$email' WHERE `id` = $id AND `deletedAt` IS NULL LIMIT 1";
      $result = mysqli_query($connect, $query);

      if ($result) {
         $response = new ResponseAPI(1, "Thay đổi email thành công");
         $response->send();
      } else {
         $response = new ResponseAPI(2, "Thay đổi email thất bại");
         $response->send();
      }
   } else {
      $response = new ResponseAPI(3, "Không đúng định dạng email");
      $response->send();
   }

   $connect->close();
}
