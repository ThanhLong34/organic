<?php
require("../../core/config.php");
require("../../core/connect_db.php");

require("../../classes/ResponseAPI.php");
require("../../helpers/functions.php");

header("Access-Control-Allow-Origin: " . ACCESS_CONTROL_ALLOW_ORIGIN);
header("Access-Control-Allow-Methods: PUT");
header("Content-Type: application/json");

$data = getJSONPayloadRequest();

// ✅ Thay đổi mật khẩu
changePassword($data["id"], $data["password"]);

function changePassword($id, $password)
{
   global $connect;

   if (!$id || $id < 0 || empty($password)) {
      $response = new ResponseAPI(9, "Không đủ dữ liệu payload để thực hiện");
      $response->send();
      return;
   }

   $password = md5($password);
   $updatedAt = getCurrentDatetime();

   $query = "UPDATE `systemadmin` SET `updatedAt` = '$updatedAt', `password` = '$password' WHERE `id` = $id AND `deletedAt` IS NULL LIMIT 1";
   $result = mysqli_query($connect, $query);

   if ($result) {
      $response = new ResponseAPI(1, "Thay đổi mật khẩu thành công");
      $response->send();
   } else {
      $response = new ResponseAPI(2, "Thay đổi mật khẩu thất bại");
      $response->send();
   }

   $connect->close();
}
