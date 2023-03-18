<?php
//? ====================
//? IMPORTS
//? ====================
require("../../core/config.php");
require("../../core/connect_db.php");
require("../../classes/ResponseAPI.php");
require("../../helpers/functions.php");


//? ====================
//? HEADERS
//? ====================
header("Access-Control-Allow-Origin: " . ACCESS_CONTROL_ALLOW_ORIGIN);
header("Access-Control-Allow-Headers: " . ACCESS_CONTROL_ALLOW_HEADERS);
header("Access-Control-Allow-Methods: GET");
header("Content-Type: application/json");


//? ====================
//? CHECK PERMISSTION
//? ====================
$functionName = "GetOrderItem";
if (!checkPermissionFunction($functionName)) exit;


//? ====================
//? PARAMETERS & PAYLOAD
//? ====================
$tableName = "order";

$id = $_GET["id"] ?? ""; // int


//? ====================
//? START
//? ====================
// ✅ Lấy item theo id
getItem($id);


//? ====================
//? FUNCTIONS
//? ====================
function getItem($id)
{
   global $connect, $tableName;

   // Kiểm tra dữ liệu payload
   if ($id === "" || !is_numeric($id)) {
      $response = new ResponseAPI(9, "Không đủ payload để thực hiện");
      $response->send();
      return;
   }

   // Thực thi query
   $query = "SELECT `$tableName`.*, `couponcode`.`code` AS 'couponCodeCode', `couponcode`.`percentValue` AS 'couponCodePercentValue', `orderstatus`.`name` AS 'orderStatusName' 
      FROM `$tableName`
      LEFT JOIN `couponcode` ON `couponcode`.`id` = `$tableName`.`couponCodeId`
      LEFT JOIN `orderstatus` ON `orderstatus`.`id` = `$tableName`.`orderStatusId`
      WHERE `$tableName`.`id` = '$id' AND `$tableName`.`deletedAt` IS NULL LIMIT 1";
   performsQueryAndResponseToClient($query);

   // Đóng kết nối
   $connect->close();
}

// Thực thi truy vấn và trả về kết quả cho Client
function performsQueryAndResponseToClient($query)
{
   global $connect;

   $result = mysqli_query($connect, $query);

   if ($result) {
      $item = $result->fetch_object();
      if ($item != null) {
         $response = new ResponseAPI(1, "Thành công", $item, 1);
         $response->send();
      } else {
         $response = new ResponseAPI(2, "Không tìm thấy");
         $response->send();
      }
   } else {
      $response = new ResponseAPI(3, "Thất bại");
      $response->send();
   }
}
