<?php
require("../../core/config.php");
require("../../core/connect_db.php");

require("../../classes/ResponseAPI.php");
require("../../helpers/functions.php");

header("Access-Control-Allow-Origin: " . ACCESS_CONTROL_ALLOW_ORIGIN);
header("Access-Control-Allow-Methods: DELETE");
header("Content-Type: application/json");

$data = getJSONPayloadRequest();

deleteItem($data["id"]);

function deleteItem($id)
{
   global $connect;

   if (!$id || $id < 0) {
      $response = new ResponseAPI(9, "Không đủ dữ liệu payload để thực hiện");
      $response->send();
      return;
   }

   $query = "DELETE FROM `customeraccount` WHERE `ID` = $id AND `DeletedAt` IS NOT NULL";
   $result = mysqli_query($connect, $query);

   if ($result) {
      $response = new ResponseAPI(1, "Xóa tài khoản khách hàng thành công");
      $response->send();
   } else {
      $response = new ResponseAPI(2, "Xóa tài khoản khách hàng thất bại");
      $response->send();
   }

   $connect->close();
}
