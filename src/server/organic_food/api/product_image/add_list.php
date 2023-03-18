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
$functionName = "AddProductImageList";
if (!checkPermissionFunction($functionName)) exit;


//? ====================
//? PARAMETERS & PAYLOAD
//? ====================
$tableName = "product_image";
$data = getJSONPayloadRequest();

$productId = $data["productId"] ?? "";
$imageIdList = $data["imageIdList"] ?? [];


//? ====================
//? START
//? ====================
// ✅ Thêm list 
addList($productId, $imageIdList);


//? ====================
//? FUNCTIONS
//? ====================
function addList($productId, $imageIdList)
{
   global $connect, $tableName;

   // Kiểm tra dữ liệu payload
   if ($productId === "" || !is_numeric($productId) || !is_array($imageIdList)) {
      $response = new ResponseAPI(9, "Không đủ payload để thực hiện");
      $response->send();
      return;
   }

   // Lặp qua từng item trong imageIdList để thêm vào CSDL
   foreach ($imageIdList as $key => $imageId) {
      // Thực thi query
      $query = "INSERT INTO `$tableName`(`productId`, `imageId`) 
         VALUES('$productId', '$imageId')";
      if (!performsQueryAndResponseToClient($query)) {
         $response = new ResponseAPI(2, "Thất bại");
         $response->send();

         // Đóng kết nối
         $connect->close();

         return;
      }
   }

   $response = new ResponseAPI(1, "Thành công");
   $response->send();

   // Đóng kết nối
   $connect->close();
}

// Thực thi truy vấn và trả về kết quả cho Client
function performsQueryAndResponseToClient($query)
{
   global $connect;

   $result = mysqli_query($connect, $query);

   return $result;
}
