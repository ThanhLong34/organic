<?php
require("../../core/config.php");
require("../../core/connect_db.php");

require("../../classes/ResponseAPI.php");
require("../../helpers/functions.php");

header("Access-Control-Allow-Origin: " . ACCESS_CONTROL_ALLOW_ORIGIN);
header("Access-Control-Allow-Methods: GET");
header("Content-Type: application/json");

// ✅ Lấy ảnh theo id
getItemById($_GET["id"]);

function getItemById($id)
{
   global $connect;

   if (!$id || $id < 0) {
      $response = new ResponseAPI(9, "Không đủ dữ liệu payload để thực hiện");
      $response->send();
      return;
   }

   $query = "SELECT * FROM `image` WHERE `id` = $id LIMIT 1";
   $result = mysqli_query($connect, $query);
   if ($obj = $result->fetch_object()) {
      $response = new ResponseAPI(1, "Lấy file ảnh thành công", $obj);
      $response->send();
   } else {
      $response = new ResponseAPI(2, "Không tìm thấy file ảnh");
      $response->send();
   }

   $connect->close();
}
