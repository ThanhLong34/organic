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
$functionName = "GetProductOrderListByOrderId";
if (!checkPermissionFunction($functionName)) exit;


//? ====================
//? PARAMETERS & PAYLOAD
//? ====================
$tableName = "product_order";

$orderId = $_GET["orderId"] ?? ""; // int


//? ====================
//? START
//? ====================
// ✅ Lấy danh sách item 
getList($orderId);


//? ====================
//? FUNCTIONS
//? ====================
function getList($orderId)
{
   global $connect, $tableName;

   // Kiểm tra dữ liệu payload
   if ($orderId === "" || !is_numeric($orderId)) {
      $response = new ResponseAPI(9, "Không đủ payload để thực hiện");
      $response->send();
      return;
   }

   // Thực thi truy vấn
   $query = "SELECT `$tableName`.*, `product`.*, `product`.`deletedAt` AS 'productDeletedAt', `image`.`link` AS 'featureImageUrl', `productcategory`.`name` AS 'productCategoryName'
      FROM `$tableName` 
      LEFT JOIN `product` ON `product`.`id` = `$tableName`.`productId`
      LEFT JOIN `image` ON `image`.`id` = `product`.`featureImageId`
      LEFT JOIN `productcategory` ON `productcategory`.`id` = `product`.`productCategoryId`
      WHERE `$tableName`.`orderId` = $orderId";
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
      $list = [];

      while ($obj = $result->fetch_object()) {
         array_push($list, $obj);
      }

      $response = new ResponseAPI(1, "Thành công", $list);
      $response->send();
   } else {
      $response = new ResponseAPI(2, "Thất bại");
      $response->send();
   }
}
