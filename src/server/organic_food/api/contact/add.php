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
$functionName = "AddContact";
if (!checkPermissionFunction($functionName)) exit;


//? ====================
//? PARAMETERS & PAYLOAD
//? ====================
$tableName = "contact";
$data = getJSONPayloadRequest();

$fullname = trim($data["fullname"] ?? ""); // string
$email = trim($data["email"] ?? ""); // string
$subject = trim($data["subject"] ?? ""); // string
$message = trim($data["message"] ?? ""); // string


//? ====================
//? START
//? ====================
// ✅ Thêm item 
addItem($fullname, $email, $subject, $message);


//? ====================
//? FUNCTIONS
//? ====================
function addItem($fullname, $email, $subject, $message)
{
   global $connect, $tableName;

   // Kiểm tra dữ liệu payload
   if ($fullname === "" || $email === "" || $subject === "" || $message === "") {
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

   // createdAt, updateAt, deletedAt
   $createdAt = getCurrentDatetime();

   // Thực thi query
   $query = "INSERT INTO `$tableName`(`createdAt`, `fullname`, `email`, `subject`, `message`) 
      VALUES('$createdAt', '$fullname', '$email', '$subject', '$message')";
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
