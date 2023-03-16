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

$featureImageId = $data["featureImageId"] ?? ""; // int
$name = trim($data["name"] ?? ""); // string
$originPrice = $data["originPrice"] ?? ""; // int
$promotionPrice = $data["promotionPrice"] ?? $data["originPrice"] ?? ""; // int
$unit = trim($data["unit"] ?? ""); // string
$shortDescription = trim($data["shortDescription"] ?? ""); // string
$description = trim($data["description"] ?? ""); // string
$isSpecial = $data["isSpecial"] ?? false; // boolean
$isNew = $data["isNew"] ?? false; // boolean
$isBestOffer = $data["isBestOffer"] ?? false; // boolean
$productCategoryId = $data["productCategoryId"] ?? ""; // int


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
   if (
      ($featureImageId !== "" && !is_numeric($featureImageId)) ||
      $name === "" ||
      !is_numeric($originPrice) ||
      !is_numeric($promotionPrice) ||
      $unit === "" ||
      !is_bool($isSpecial) ||
      !is_bool($isNew) ||
      !is_bool($isBestOffer) ||
      $productCategoryId === "" ||
      !is_numeric($productCategoryId)
   ) {
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
      // Trả về product id để gọi API lưu images của product
      $obj->productId = $connect->insert_id;

      $response = new ResponseAPI(1, "Thành công", $obj);
      $response->send();
   } else {
      $response = new ResponseAPI(2, "Thất bại");
      $response->send();
   }
}
