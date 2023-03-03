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

   $query = "SELECT * FROM `project` WHERE `ID` = '$id' AND `DeletedAt` IS NULL LIMIT 1";
   $result = mysqli_query($connect, $query);

   if ($result) {
      $project = $result->fetch_object();
      if ($project != null) {
         $response = new ResponseAPI(1, "Lấy thông tin dự án thành công", $project);
         $response->send();
      } else {
         $response = new ResponseAPI(2, "Không tìm thấy dự án cần lấy");
         $response->send();
      }
   } else {
      $response = new ResponseAPI(3, "Lấy thông tin dự án thất bại");
      $response->send();
   }

   $connect->close();
}
