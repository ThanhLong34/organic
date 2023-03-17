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
$functionName = "AddOrder";
if (!checkPermissionFunction($functionName)) exit;


//? ====================
//? PARAMETERS & PAYLOAD
//? ====================
$tableName = "order";
$data = getJSONPayloadRequest();

$fullname = trim($data["fullname"] ?? ""); // string
$streetAddress = trim($data["streetAddress"] ?? ""); // string
$city = trim($data["city"] ?? ""); // string
$phone = trim($data["phone"] ?? ""); // string
$email = trim($data["email"] ?? ""); // string
$notes = trim($data["notes"] ?? ""); // string
$couponCodeId = $data["couponCodeId"] ?? ""; // int
$deliveryCost = $data["deliveryCost"] ?? ""; // int
$totalCost = $data["totalCost"] ?? ""; // int
$paymentCost = $data["paymentCost"] ?? ""; // int


//? ====================
//? START
//? ====================
// ✅ Thêm item 
addItem(
   $fullname,
   $streetAddress,
   $city,
   $phone,
   $email,
   $notes,
   $couponCodeId,
   $deliveryCost,
   $totalCost,
   $paymentCost
);


//? ====================
//? FUNCTIONS
//? ====================
function addItem(
   $fullname,
   $streetAddress,
   $city,
   $phone,
   $email,
   $notes,
   $couponCodeId,
   $deliveryCost,
   $totalCost,
   $paymentCost
) {
   global $connect, $tableName;

   // Kiểm tra dữ liệu payload
   if (
      $fullname === "" ||
      $streetAddress === "" ||
      $city === "" ||
      $phone === "" ||
      $email === "" ||
      ($couponCodeId !== "" && !is_numeric($couponCodeId)) ||
      ($deliveryCost !== "" && !is_numeric($deliveryCost)) ||
      ($totalCost !== "" && !is_numeric($totalCost)) ||
      ($paymentCost !== "" && !is_numeric($paymentCost))
   ) {
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

   // Kiểm tra định dạng số điện thoại
   if (!validatePhoneNumber($phone)) {
      $response = new ResponseAPI(5, "Không đúng định dạng số điện thoại");
      $response->send();
      return;
   }

   // createdAt, updateAt, deletedAt
   $createdAt = getCurrentDatetime();

   // Thực thi query
   $query = "INSERT 
      INTO `$tableName`(`createdAt`, `fullname`, `streetAddress`, `city`, `phone`, `email`, `notes`, `couponCodeId`, `deliveryCost`, `totalCost`, `paymentCost`) 
      VALUES('$createdAt', '$fullname', '$streetAddress', '$city', '$phone', '$email', '$notes', '$couponCodeId', '$deliveryCost', '$totalCost', '$paymentCost')";
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
