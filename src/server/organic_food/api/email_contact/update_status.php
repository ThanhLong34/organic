<?php
require("../../core/config.php");
require("../../core/connect_db.php");

require("../../classes/ResponseAPI.php");
require("../../helpers/functions.php");

header("Access-Control-Allow-Origin: " . ACCESS_CONTROL_ALLOW_ORIGIN);
header("Access-Control-Allow-Methods: PUT");
header("Content-Type: application/json");

$data = getJSONPayloadRequest();

updateItem($data["id"], $data["status"]);

function updateItem($id, $status)
{
   global $connect;

   if (!$id || $id < 0 || $status < 0 || $status == "") {
      $response = new ResponseAPI(9, "Không đủ dữ liệu payload để thực hiện");
      $response->send();
      return;
   }

   $updatedAt = getCurrentDatetime();

   $query = "UPDATE `emailcontact` SET `UpdatedAt` = '$updatedAt', `Status` = $status WHERE `ID` = $id AND `DeletedAt` IS NULL";
   $result = mysqli_query($connect, $query);

   if ($result) {
      $response = new ResponseAPI(1, "Cập nhật trạng thái email liên hệ thành công");
      $response->send();
   } else {
      $response = new ResponseAPI(2, "Cập nhật trạng thái email liên hệ thất bại");
      $response->send();
   }

   $connect->close();
}
