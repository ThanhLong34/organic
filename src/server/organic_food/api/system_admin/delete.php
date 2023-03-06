<?php
require("../../core/config.php");
require("../../core/connect_db.php");

require("../../classes/ResponseAPI.php");
require("../../helpers/functions.php");

header("Access-Control-Allow-Origin: " . ACCESS_CONTROL_ALLOW_ORIGIN);
header("Access-Control-Allow-Methods: DELETE");
header("Content-Type: application/json");

$data = getJSONPayloadRequest();

// ✅ Xóa item 
deleteItem($data["id"]);

function deleteItem($id)
{
   global $connect;

   if (!$id || $id < 0) {
      $response = new ResponseAPI(9, "Không đủ dữ liệu payload để thực hiện");
      $response->send();
      return;
   }

   if (checkItemInTrash($id)) {
      $query = "DELETE FROM `systemadmin` WHERE `id` = $id AND `deletedAt` IS NOT NULL";
      $result = mysqli_query($connect, $query);

      if ($result) {
         $response = new ResponseAPI(1, "Xóa tài khoản admin thành công");
         $response->send();
      } else {
         $response = new ResponseAPI(2, "Xóa tài khoản admin thất bại");
         $response->send();
      }

      $connect->close();
   } else {
      $response = new ResponseAPI(3, "Xóa tài khoản admin thất bại, tài khoản admin chưa được chuyển vào thùng rác");
      $response->send();
   }
}

function checkItemInTrash($id)
{
   global $connect;

   $query = "SELECT * FROM `systemadmin` WHERE `id` = $id AND `deletedAt` IS NOT NULL LIMIT 1";
   $result = mysqli_query($connect, $query);

   if ($result && mysqli_num_rows($result) > 0) {
      return true;
   }

   return false;
}
