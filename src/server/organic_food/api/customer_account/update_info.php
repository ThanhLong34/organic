<?php
require("../../core/config.php");
require("../../core/connect_db.php");

require("../../classes/ResponseAPI.php");
require("../../helpers/functions.php");

header("Access-Control-Allow-Origin: " . ACCESS_CONTROL_ALLOW_ORIGIN);
header("Access-Control-Allow-Methods: PUT");
header("Content-Type: application/json");

$data = getJSONPayloadRequest();

updateInfo($data["id"], $data["nickname"], $data["phone"]);

function updateInfo($id, $nickname, $phone)
{
   global $connect;

   if (!$id || $id < 0) {
      $response = new ResponseAPI(9, "Không đủ dữ liệu payload để thực hiện");
      $response->send();
      return;
   }

   $updatedAt = getCurrentDatetime();

   if ($nickname != "" && $phone != "") {
      $query = "UPDATE `customeraccount` SET `UpdatedAt` = '$updatedAt', `Nickname` = '$nickname', `Phone` = '$phone' WHERE `ID` = $id AND `DeletedAt` IS NULL";
   } else if ($nickname != "") {
      $query = "UPDATE `customeraccount` SET `UpdatedAt` = '$updatedAt', `Nickname` = '$nickname' WHERE `ID` = $id AND `DeletedAt` IS NULL";
   } else if ($phone != "") {
      $query = "UPDATE `customeraccount` SET `UpdatedAt` = '$updatedAt', `Phone` = '$phone' WHERE `ID` = $id AND `DeletedAt` IS NULL";
   }
   
   $result = mysqli_query($connect, $query);

   if ($result) {
      $response = new ResponseAPI(1, "Cập nhật thông tin tài khoản khách hàng thành công");
      $response->send();
   } else {
      $response = new ResponseAPI(2, "Cập nhật thông tin tài khoản khách hàng thất bại");
      $response->send();
   }

   $connect->close();
}
