<?php
require("../../core/config.php");
require("../../core/connect_db.php");

require("../../classes/ResponseAPI.php");
require("../../helpers/functions.php");

header("Access-Control-Allow-Origin: " . ACCESS_CONTROL_ALLOW_ORIGIN);
header("Access-Control-Allow-Methods: PUT");
header("Content-Type: application/json");

$data = getJSONPayloadRequest();

// ✅ Cập nhật item
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
      $response = new ResponseAPI(3, "Tên vai trò đã tồn tại");
      $response->send();
   } else {
      $updatedAt = getCurrentDatetime();

      $query = "UPDATE `systemrole` SET `updatedAt` = '$updatedAt', `name` = '$name' WHERE `id` = $id AND `deletedAt` IS NULL";
      $result = mysqli_query($connect, $query);

      if ($result) {
         $response = new ResponseAPI(1, "Cập nhật vai trò thành công");
         $response->send();
      } else {
         $response = new ResponseAPI(2, "Cập nhật vai trò thất bại");
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
