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


// //? ====================
// //? CHECK PERMISSTION
// //? ====================
$functionName = "AddProduct";
if (!checkPermissionFunction($functionName)) exit;


//? ====================
//? PARAMETERS & PAYLOAD
//? ====================
$tableName = "product";
$data = getJSONPayloadRequest();
$featureImageId = $data["featureImageId"] ?? 0;
$name = trim($data["name"] ?? "");
$originPrice = $data["originPrice"] ?? 0;
$promotionPrice = $data["promotionPrice"] ?? $data["originPrice"] ?? 0;
$unit = trim($data["unit"] ?? "");
$shortDescription = trim($data["shortDescription"] ?? ""); // nvarchar(1000)
$description = trim($data["description"] ?? ""); // text
$isSpecial = $data["isSpecial"] ?? false;
$isNew = $data["isNew"] ?? false;
$isBestOffer = $data["isBestOffer"] ?? false;
$productCategoryId = $data["productCategoryId"] ?? 0;


//? ====================
//? START
//? ====================
// ✅ Thêm item 
addItem($featureImageId, $name, $originPrice, $promotionPrice, $unit, $shortDescription, $description, $isSpecial, $isNew, $isBestOffer, $productCategoryId);


//? ====================
//? FUNCTIONS
//? ====================
function addItem($featureImageId, $name, $originPrice, $promotionPrice, $unit, $shortDescription, $description, $isSpecial, $isNew, $isBestOffer, $productCategoryId)
{
   global $connect, $tableName;

   // Kiểm tra dữ liệu payload
   if ($name === "" || $unit === "" || $productCategoryId === 0) {
      $response = new ResponseAPI(9, "Không đủ payload để thực hiện");
      $response->send();
      return;
   }

   // createdAt, updateAt, deletedAt
   $createdAt = getCurrentDatetime();

   // Thực thi query
   $query = "INSERT INTO `$tableName`(`createdAt`, `featureImageId`, `name`, `originPrice`, `promotionPrice`, `unit`, `shortDescription`, `description`, `isSpecial`, `isNew`, `isBestOffer`, `productCategoryId`) 
      VALUES('$createdAt', '$featureImageId', '$name', '$originPrice', '$promotionPrice', '$unit', '$shortDescription', '$description', '$isSpecial', '$isNew', '$isBestOffer', '$productCategoryId')";
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
      $obj = new stdClass();
      $obj->productId = $connect->insert_id;

      $response = new ResponseAPI(1, "Thành công", $obj);
      $response->send();
   } else {
      $response = new ResponseAPI(2, "Thất bại");
      $response->send();
   }
}
