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
$functionName = "AddProductPreview";
if (!checkPermissionFunction($functionName)) exit;


//? ====================
//? PARAMETERS & PAYLOAD
//? ====================
$tableName = "productreview";
$data = getJSONPayloadRequest();

$fullname = trim($data["fullname"] ?? ""); // string
$email = trim($data["email"] ?? ""); // string
$comment = trim($data["comment"] ?? ""); // string
$rating = $data["rating"] ?? ""; // int
$productId = $data["productId"] ?? ""; // int


//? ====================
//? START
//? ====================
// ✅ Thêm item 
addItem($fullname, $email, $comment, $rating, $productId);


//? ====================
//? FUNCTIONS
//? ====================
function addItem($fullname, $email, $comment, $rating, $productId)
{
   global $connect, $tableName;

   // Kiểm tra dữ liệu payload
   if ($fullname === "" || $email === "" || $comment === "" || $rating === "" || !is_numeric($rating) || $productId === "" || !is_numeric($productId)) {
      $response = new ResponseAPI(9, "Không đủ payload để thực hiện");
      $response->send();
      return;
   }

   // Kiểm tra định dạng email
   if (!validateEmail($email)) {
      $response = new ResponseAPI(3, "Không đúng định dạng email");
      $response->send();
      return;
   }

   // Kiểm tra định dạng email
   if (!checkEmailBuyProduct($email, $productId)) {
      $response = new ResponseAPI(4, "Email này không được phép gửi đánh giá bởi vì chưa mua sản phẩm này");
      $response->send();
      return;
   }

   // createdAt, updateAt, deletedAt
   $createdAt = getCurrentDatetime();

   // Thực thi query
   $query = "INSERT INTO `$tableName`(`createdAt`, `fullname`, `email`, `comment`, `rating`, `productId`) 
      VALUES('$createdAt', '$fullname', '$email', '$comment', '$rating', '$productId')";
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


// Kiểm tra xem email có mua hàng không, nếu không mua sản phẩm thì không được phép gửi đánh giá
function checkEmailBuyProduct($email, $productId) {
   global $connect;

   $query = "SELECT `order`.`id` FROM `order`, `product_order`
      WHERE `order`.`email` = '$email'
      AND `product_order`.`orderId` = `order`.`id`
      AND `product_order`.`productId` = '$productId'
      LIMIT 1";
   $result = mysqli_query($connect, $query);

   if ($result && mysqli_num_rows($result) > 0) {
      return true;
   }

   return false;
}
