<?php
require("../../core/config.php");
require("../../core/connect_db.php");

require("../../classes/ResponseAPI.php");
require("../../helpers/functions.php");

header("Access-Control-Allow-Origin: " . ACCESS_CONTROL_ALLOW_ORIGIN);
header("Access-Control-Allow-Methods: POST");
header("Content-Type: application/json");

$data = getJSONPayloadRequest();

// ✅ Thêm item 
addItem($data["name"]);

function addItem($name)
{
   global $connect;

   if (empty($name)) {
      $response = new ResponseAPI(9, "Không đủ dữ liệu payload để thực hiện");
      $response->send();
      return;
   }

   if (checkItemExist($name)) {
      $response = new ResponseAPI(3, "Tên vai trò đã tồn tại");
      $response->send();
   } else {
      $createdAt = getCurrentDatetime();

      $query = "INSERT INTO `systemrole`(`createdAt`, `name`) VALUES('$createdAt', '$name')";
      $result = mysqli_query($connect, $query);

      if ($result) {
         $response = new ResponseAPI(1, "Tạo vai trò thành công");
         $response->send();
      } else {
         $response = new ResponseAPI(2, "Tạo vai trò thất bại");
         $response->send();
      }
   }

   $connect->close();
}

function checkItemExist($name)
{
   global $connect;

   $query = "SELECT * FROM `systemrole` WHERE `deletedAt` IS NULL AND `name` = '$name' LIMIT 1";
   $result = mysqli_query($connect, $query);

   if ($result && mysqli_num_rows($result) > 0) {
      return true;
   }

   return false;
}
