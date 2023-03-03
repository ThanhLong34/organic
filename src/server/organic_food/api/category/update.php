<?php
require("../../core/config.php");
require("../../core/connect_db.php");

require("../../classes/ResponseAPI.php");
require("../../helpers/functions.php");

header("Access-Control-Allow-Origin: " . ACCESS_CONTROL_ALLOW_ORIGIN);
header("Access-Control-Allow-Methods: PUT");
header("Content-Type: application/json");

$data = getJSONPayloadRequest();

updateItem($data["id"], $data["name"]);

function updateItem($id, $name)
{
   global $connect;

   if (!$id || $id < 0 || empty($name)) {
      $response = new ResponseAPI(9, "Không đủ dữ liệu payload để thực hiện");
      $response->send();
      return;
   }

   if (checkItemExist($name)) {
      $response = new ResponseAPI(3, "Tên danh mục đã tồn tại");
      $response->send();
   } else {
      $updatedAt = getCurrentDatetime();

      $query = "UPDATE `category` SET `UpdatedAt` = '$updatedAt', `Name` = '$name' WHERE `ID` = $id AND `DeletedAt` IS NULL";
      $result = mysqli_query($connect, $query);

      if ($result) {
         $response = new ResponseAPI(1, "Cập nhật danh mục thành công");
         $response->send();
      } else {
         $response = new ResponseAPI(2, "Cập nhật danh mục thất bại");
         $response->send();
      }
   }

   $connect->close();
}

function checkItemExist($name)
{
   global $connect;

   $query = "SELECT * FROM `category` WHERE `DeletedAt` IS NULL AND `Name` = '$name' LIMIT 1";
   $result = mysqli_query($connect, $query);

   if (mysqli_num_rows($result) > 0) {
      return true;
   }

   return false;
}
