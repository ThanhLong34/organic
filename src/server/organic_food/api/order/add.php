<?php
//? ====================
//? IMPORTS
//? ====================
require("../../core/config.php");
require("../../core/connect_db.php");
require("../../classes/ResponseAPI.php");
require("../../helpers/functions.php");
require("../../classes/mails/order_success.php");


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
   $totalCost
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
   $totalCost
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
      ($totalCost !== "" && !is_numeric($totalCost))
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

   // Tiền thanh toán
   $paymentCost = $totalCost + $deliveryCost;

   if ($couponCodeId !== "" && is_numeric($couponCodeId)) {
      // Cập nhật số lượng áp dụng còn lại của mã giảm giá
      if (($couponCodePercentValue = updateQuantityAppliedForCouponCode($couponCodeId)) >= 0) {
         // Tính toán tiền phải thanh toán
         $paymentCost = calculatePaymentCost($deliveryCost, $totalCost, $couponCodePercentValue);
      }
   }

   // Thực thi query
   $query = "INSERT 
      INTO `$tableName`(`createdAt`, `fullname`, `streetAddress`, `city`, `phone`, `email`, `notes`, `couponCodeId`, `deliveryCost`, `totalCost`, `paymentCost`) 
      VALUES('$createdAt', '$fullname', '$streetAddress', '$city', '$phone', '$email', '$notes', '$couponCodeId', '$deliveryCost', '$totalCost', '$paymentCost')";


   if (performsQueryAndResponseToClient($query)) {
      $response = new ResponseAPI(1, "Thành công");
      $response->send();

      $newOrder = getOrderHasJustBeenInserted();

      // Tạo đối tượng gửi mail
      $mail = new OrderSuccessMail($email, $newOrder);

      // Gửi mail
      $mail->send();

   } else {
      $response = new ResponseAPI(2, "Thất bại");
      $response->send();
   }

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

// Lấy ra order vừa mới được thêm vào trong CSDL để gửi mail
function getOrderHasJustBeenInserted() {
   global $connect, $tableName;

   $lastId = $connect->insert_id;

   $query = "SELECT `$tableName`.*, `couponcode`.`code` AS 'couponCodeCode', `couponcode`.`percentValue` AS 'couponCodePercentValue', `orderstatus`.`name` AS 'orderStatusName' 
      FROM `$tableName`
      LEFT JOIN `couponcode` ON `couponcode`.`id` = `$tableName`.`couponCodeId`
      LEFT JOIN `orderstatus` ON `orderstatus`.`id` = `$tableName`.`orderStatusId`
      WHERE `$tableName`.`id` = '$lastId' AND `$tableName`.`deletedAt` IS NULL LIMIT 1";

   $result = mysqli_query($connect, $query);
   if ($result && ($order = $result->fetch_object()) != null) {
      return $order;
   }

   return null;
}

// Cập nhật lại remainingQuantityApplied cho mã giảm giá (coupon code)
function updateQuantityAppliedForCouponCode($couponCodeId) {
   global $connect;

   // Tìm coupon code
   $query = "SELECT * FROM `couponcode` WHERE `id` = '$couponCodeId' LIMIT 1";
   $result = mysqli_query($connect, $query);

   // Nếu tìm thấy coupon code
   if ($result && ($couponCode = $result->fetch_object()) != null) {

      // Cast to int
      $couponCode->remainingQuantityApplied = (int)$couponCode->remainingQuantityApplied;

      // Cập nhật lại remainingQuantityApplied
      if ($couponCode->remainingQuantityApplied > 0) {
         $quantityAppliedUpdated = $couponCode->remainingQuantityApplied - 1;

         $query = "UPDATE `couponcode` SET `remainingQuantityApplied` = '$quantityAppliedUpdated' WHERE `id` = '$couponCodeId' AND `deletedAt` IS NULL";
         $result = mysqli_query($connect, $query);

         return $couponCode->percentValue;
      }
   }

   return -1;
}

// Tính toán số tiền cần phải thanh toán của đơn hàng
function calculatePaymentCost($deliveryCost, $totalCost, $couponCodePercentValue) {
   $totalCost += $deliveryCost;
   return $totalCost - ($totalCost / 100 * $couponCodePercentValue);
}
