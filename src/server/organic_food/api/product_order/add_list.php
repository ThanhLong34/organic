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
$functionName = "AddProductOrderList";
if (!checkPermissionFunction($functionName)) exit;


//? ====================
//? PARAMETERS & PAYLOAD
//? ====================
$tableName = "product_order";
$data = getJSONPayloadRequest();

$orderId = $data["orderId"] ?? "";
$productListInCart = $data["productListInCart"] ?? [];
// {
//    id: // productId,
//    quantity: // quantity
// }


//? ====================
//? START
//? ====================
// ✅ Thêm list 
addList($orderId, $productListInCart);


//? ====================
//? FUNCTIONS
//? ====================
function addList($orderId, $productListInCart)
{
   global $connect, $tableName;

   // Kiểm tra dữ liệu payload
   if ($orderId === "" || !is_numeric($orderId) || !is_array($productListInCart)) {
      $response = new ResponseAPI(9, "Không đủ payload để thực hiện");
      $response->send();
      return;
   }


   // Lặp qua từng item trong productListInCart để thêm vào CSDL
   foreach ($productListInCart as $key => $product) {
      $productId = $product['id'] ?? "";
      $quantity = $product['quantity'] ?? "";

      if ($productId === "" || !is_numeric($productId) || $quantity === "" || !is_numeric($quantity)) {

         $response = new ResponseAPI(9, "Không đủ payload để thực hiện");
         $response->send();

         // Đóng kết nối
         $connect->close();

         return;
      } else {
         // Thực thi query
         $query = "INSERT INTO `$tableName`(`orderId`, `productId`, `quantity`) 
            VALUES('$orderId', '$productId', '$quantity')";

         if (!performsQueryAndResponseToClient($query)) {
            $response = new ResponseAPI(2, "Thất bại");
            $response->send();

            // Đóng kết nối
            $connect->close();

            return;
         }
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
