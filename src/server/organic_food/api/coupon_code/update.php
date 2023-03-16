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
header("Access-Control-Allow-Methods: PUT");
header("Content-Type: application/json");


//? ====================
//? CHECK PERMISSTION
//? ====================
$functionName = "UpdateCouponCode";
if (!checkPermissionFunction($functionName)) exit;


//? ====================
//? PARAMETERS & PAYLOAD
//? ====================
$tableName = "couponcode";
$data = getJSONPayloadRequest();

$id = $data["id"] ?? ""; // int
$description = $data["description"] ?? ""; // string
$isLimited = $data["isLimited"] ?? ""; // boolean
$percentValue = $data["percentValue"] ?? 0; // int, vd: 30 -> 30%
$quantityApplied = $data["quantityApplied"] ?? 0; // int


//? ====================
//? START
//? ====================
// ✅ Cập nhật item
updateItem($id, $description, $isLimited, $percentValue, $quantityApplied);


//? ====================
//? FUNCTIONS
//? ====================
function updateItem($id, $description, $isLimited, $percentValue, $quantityApplied)
{
   global $connect, $tableName;

   // Kiểm tra dữ liệu payload
   if ($id === "" || !is_numeric($id)) {
      $response = new ResponseAPI(9, "Không đủ payload để thực hiện");
      $response->send();
      return;
   }

   // createdAt, updateAt, deletedAt
   $updatedAt = getCurrentDatetime();

   // Các chuỗi truy vấn
   $baseQuery = "UPDATE `$tableName` SET `updatedAt` = '$updatedAt'";
   $mainQuery = "";
   $endQuery = "WHERE `id` = '$id' AND `deletedAt` IS NULL";

   // Cập nhật description
   if ($description !== "") {
      $mainQuery .= "," . "`description` = '$description'";
   }

   // Cập nhật isLimited
   if ($isLimited !== "" && is_bool($isLimited)) {
      $mainQuery .= "," . "`isLimited` = '$isLimited'";
   }

   // Cập nhật percentValue
   if ($percentValue !== "" && is_numeric($percentValue)) {
      $mainQuery .= "," . "`percentValue` = '$percentValue'";
   }

   // Cập nhật quantityApplied
   if ($quantityApplied !== "" && is_numeric($quantityApplied)) {
      $mainQuery .= "," . "`quantityApplied` = '$quantityApplied'";
   }

   // Thực thi query
   $query = $baseQuery . " " . $mainQuery . " " . $endQuery;
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
