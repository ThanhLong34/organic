<?php
require("../../core/config.php");
require("../../core/connect_db.php");

require("../../classes/ResponseAPI.php");
require("../../helpers/functions.php");

header("Access-Control-Allow-Origin: " . ACCESS_CONTROL_ALLOW_ORIGIN);
header("Access-Control-Allow-Methods: PUT");
header("Content-Type: application/json");

$data = getJSONPayloadRequest();

// Chuyển item vào thùng rác
trashItem($data["id"]);

function trashItem($id)
{
   global $connect;

   if (!$id || $id < 0) {
      $response = new ResponseAPI(9, "Không đủ dữ liệu payload để thực hiện");
      $response->send();
      return;
   }

   $deletedAt = getCurrentDatetime();

   $query = "UPDATE `systemrole` SET `deletedAt` = '$deletedAt' WHERE `id` = $id AND `deletedAt` IS NULL";
   $result = mysqli_query($connect, $query);

   if ($result) {
      $response = new ResponseAPI(1, "Chuyển vai trò vào thùng rác thành công");
      $response->send();
   } else {
      $response = new ResponseAPI(2, "Chuyển vai trò vào thùng rác thất bại");
      $response->send();
   }

   $connect->close();
}
