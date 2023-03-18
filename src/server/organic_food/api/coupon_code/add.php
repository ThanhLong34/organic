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
header("Access-Control-Allow-Methods: POST");
header("Content-Type: application/json");


//? ====================
//? CHECK PERMISSTION
//? ====================
$functionName = "AddCouponCode";
if (!checkPermissionFunction($functionName)) exit;


//? ====================
//? PARAMETERS & PAYLOAD
//? ====================
$tableName = "couponcode";
$data = getJSONPayloadRequest();

$description = trim($data["description"] ?? ""); // string
$isLimited = $data["isLimited"] ?? false; // boolean
$percentValue = $data["percentValue"] ?? ""; // int, vd: 30 -> 30%
$remainingQuantityApplied = $data["remainingQuantityApplied"] ?? ""; // int


//? ====================
//? START
//? ====================
// ✅ Thêm item 
addItem($description, $isLimited, $percentValue, $remainingQuantityApplied);


//? ====================
//? FUNCTIONS
//? ====================
function addItem($description, $isLimited, $percentValue, $remainingQuantityApplied)
{
   global $connect, $tableName;

   // Kiểm tra dữ liệu payload
   if (!is_bool($isLimited) || $percentValue === "" || !is_numeric($percentValue)) {
      $response = new ResponseAPI(9, "Không đủ payload để thực hiện");
      $response->send();
      return;
   }

   // createdAt, updateAt, deletedAt
   $createdAt = getCurrentDatetime();

   // Tạo code
   $code = generateRandomString(12);

   // Thực thi query
   $query = "INSERT INTO `$tableName`(`createdAt`, `code`, `description`, `isLimited`, `percentValue`, `remainingQuantityApplied`) 
      VALUES('$createdAt', '$code', '$description', '$isLimited', '$percentValue', '$remainingQuantityApplied')";
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
      $response = new ResponseAPI(1, "Thành công");
      $response->send();
   } else {
      $response = new ResponseAPI(2, "Thất bại");
      $response->send();
   }
}
