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
$functionName = "UpdateProduct";
if (!checkPermissionFunction($functionName)) exit;


//? ====================
//? PARAMETERS & PAYLOAD
//? ====================
$tableName = "product";
$data = getJSONPayloadRequest();

$id = $data["id"] ?? ""; // int
$featureImageId = $data["featureImageId"] ?? ""; // int
$name = trim($data["name"] ?? ""); // string
$originPrice = trim($data["originPrice"]) === '' ? 0 : trim($data["originPrice"]); // int
$promotionPrice = trim($data["promotionPrice"]) === '' ? $originPrice : trim($data["promotionPrice"]); // int
$unit = trim($data["unit"] ?? ""); // string
$shortDescription = trim($data["shortDescription"] ?? ""); // string
$description = trim($data["description"] ?? ""); // string
$isSpecial = $data["isSpecial"] ?? ''; // boolean
$isNew = $data["isNew"] ?? ''; // boolean
$isBestOffer = $data["isBestOffer"] ?? ''; // boolean
$productCategoryId = $data["productCategoryId"] ?? ""; // int


//? ====================
//? START
//? ====================
// ✅ Cập nhật item
updateItem(
   $id,
   $featureImageId,
   $name,
   $originPrice,
   $promotionPrice,
   $unit,
   $shortDescription,
   $description,
   $isSpecial,
   $isNew,
   $isBestOffer,
   $productCategoryId
);


//? ====================
//? FUNCTIONS
//? ====================
function updateItem(
   $id,
   $featureImageId,
   $name,
   $originPrice,
   $promotionPrice,
   $unit,
   $shortDescription,
   $description,
   $isSpecial,
   $isNew,
   $isBestOffer,
   $productCategoryId
) {
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

   if ($featureImageId !== "" && is_numeric($featureImageId)) {
      $mainQuery .= "," . "`featureImageId` = '$featureImageId'";
   }

   if ($name !== '') {
      $mainQuery .= "," . "`name` = '$name'";
   }

   if ($originPrice !== '' && is_numeric($originPrice)) {
      $mainQuery .= "," . "`originPrice` = '$originPrice'";
   }

   if ($promotionPrice !== '' && is_numeric($promotionPrice)) {
      $mainQuery .= "," . "`promotionPrice` = '$promotionPrice'";
   }

   if ($unit !== '') {
      $mainQuery .= "," . "`unit` = '$unit'";
   }

   $mainQuery .= "," . "`shortDescription` = '$shortDescription'";

   $mainQuery .= "," . "`description` = '$description'";

   if ($isSpecial !== '' && is_bool((boolean)$isSpecial)) {
      $mainQuery .= "," . "`isSpecial` = '$isSpecial'";
   }

   if ($isNew !== '' && is_bool((boolean)$isNew)) {
      $mainQuery .= "," . "`isNew` = '$isNew'";
   }

   if ($isBestOffer !== '' && is_bool((boolean)$isBestOffer)) {
      $mainQuery .= "," . "`isBestOffer` = '$isBestOffer'";
   }

   if ($productCategoryId !== 0 && is_numeric($productCategoryId)) {
      $mainQuery .= "," . "`productCategoryId` = '$productCategoryId'";
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
