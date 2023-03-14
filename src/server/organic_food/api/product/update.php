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
$id = $data["id"] ?? 0;
$featureImageId = $data["featureImageId"] ?? 0;
$name = trim($data["name"] ?? "");
$originPrice = trim($data["originPrice"]) === '' ? 0 : trim($data["originPrice"]);
$promotionPrice = trim($data["promotionPrice"]) === '' ? $originPrice : trim($data["promotionPrice"]);
$unit = trim($data["unit"] ?? "");
$shortDescription = trim($data["shortDescription"] ?? ""); // nvarchar(1000)
$description = trim($data["description"] ?? ""); // text
$isSpecial = trim($data["isSpecial"] ?? '');
$isNew = trim($data["isNew"] ?? '');
$isBestOffer = trim($data["isBestOffer"] ?? '');
$productCategoryId = $data["productCategoryId"] ?? 0;


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
   if ($id === 0 || $name === "" || $unit === "" || $productCategoryId === 0) {
      $response = new ResponseAPI(9, "Không đủ payload để thực hiện");
      $response->send();
      return;
   }

   // createdAt, updateAt, deletedAt
   $updatedAt = getCurrentDatetime();

   // Các chuỗi truy vấn
   $baseQuery = "UPDATE `$tableName` SET `updatedAt` = '$updatedAt'";
   $mainQuery = "";
   $endQuery = "WHERE `id` = $id AND `deletedAt` IS NULL";

   if ($featureImageId !== 0) {
      $mainQuery .= "," . "`featureImageId` = '$featureImageId'";
   }

   if ($name !== '') {
      $mainQuery .= "," . "`name` = '$name'";
   }

   if ($originPrice !== '') {
      $mainQuery .= "," . "`originPrice` = '$originPrice'";
   }

   if ($promotionPrice !== '') {
      $mainQuery .= "," . "`promotionPrice` = '$promotionPrice'";
   }

   if ($unit !== '') {
      $mainQuery .= "," . "`unit` = '$unit'";
   }

   if ($shortDescription !== '') {
      $mainQuery .= "," . "`shortDescription` = '$shortDescription'";
   }

   if ($description !== '') {
      $mainQuery .= "," . "`description` = '$description'";
   }

   if ($isSpecial !== '') {
      $mainQuery .= "," . "`isSpecial` = '$isSpecial'";
   }

   if ($isNew !== '') {
      $mainQuery .= "," . "`isNew` = '$isNew'";
   }

   if ($isBestOffer !== '') {
      $mainQuery .= "," . "`isBestOffer` = '$isBestOffer'";
   }

   if ($productCategoryId !== 0) {
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
