<?php
require("../../core/config.php");
require("../../core/connect_db.php");

require("../../classes/ResponseAPI.php");
require("../../helpers/functions.php");

header("Access-Control-Allow-Origin: " . ACCESS_CONTROL_ALLOW_ORIGIN);
header("Access-Control-Allow-Methods: GET");
header("Content-Type: application/json");

$id = 0;
if (isset($_GET["id"])) {
   $id = $_GET["id"];
}

getItem($id);

function getItem($id)
{
   global $connect;

   if (!$id || $id < 0) {
      $response = new ResponseAPI(9, "Không đủ dữ liệu payload để thực hiện");
      $response->send();
      return;
   }
   
   $query = "SELECT * FROM `emailcontact` WHERE `ID` = $id AND `DeletedAt` IS NULL LIMIT 1";
   $result = mysqli_query($connect, $query);

   if ($result) {
      $order = $result->fetch_object();
      if ($order != null) {
         $response = new ResponseAPI(1, "Lấy thông tin email liên hệ thành công", $order);
         $response->send();
      } else {
         $response = new ResponseAPI(2, "Không tìm thấy email liên hệ cần lấy");
         $response->send();
      }
   } else {
      $response = new ResponseAPI(3, "Lấy thông tin email liên hệ thất bại");
      $response->send();
   }

   $connect->close();
}
