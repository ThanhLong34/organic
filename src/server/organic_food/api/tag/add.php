<?php
require("../../core/config.php");
require("../../core/connect_db.php");

require("../../classes/ResponseAPI.php");
require("../../helpers/functions.php");

header("Access-Control-Allow-Origin: " . ACCESS_CONTROL_ALLOW_ORIGIN);
header("Access-Control-Allow-Methods: POST");
header("Content-Type: application/json");

$data = getJSONPayloadRequest();

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
      $response = new ResponseAPI(3, "Tên thẻ đã tồn tại");
      $response->send();
   } else {
      $createdAt = getCurrentDatetime();

      $query = "INSERT INTO `tag`(`CreatedAt`, `Name`) VALUES('$createdAt', '$name')";
      $result = mysqli_query($connect, $query);

      if ($result) {
         $response = new ResponseAPI(1, "Tạo thẻ thành công");
         $response->send();
      } else {
         $response = new ResponseAPI(2, "Tạo thẻ thất bại");
         $response->send();
      }
   }

   $connect->close();
}

function checkItemExist($name)
{
   global $connect;

   $query = "SELECT * FROM `tag` WHERE `DeletedAt` IS NULL AND `Name` = '$name' LIMIT 1";
   $result = mysqli_query($connect, $query);

   if (mysqli_num_rows($result) > 0) {
      return true;
   }

   return false;
}
