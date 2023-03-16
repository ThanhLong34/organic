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
$functionName = "AddSystemMenu";
if (!checkPermissionFunction($functionName)) exit;


//? ====================
//? PARAMETERS & PAYLOAD
//? ====================
$tableName = "systemmenu";
$data = getJSONPayloadRequest();

$routeName = trim($data["routeName"] ?? ""); // string
$title = trim($data["title"] ?? ""); // string
$isBase = $data["isBase"] ?? false; // boolean


//? ====================
//? START
//? ====================
// ✅ Thêm item 
addItem($routeName, $isBase, $title);


//? ====================
//? FUNCTIONS
//? ====================
function addItem($routeName, $isBase, $title)
{
   global $connect, $tableName;

   // Kiểm tra dữ liệu payload
   if ($routeName === "" || $title === "" || !is_bool($isBase)) {
      $response = new ResponseAPI(9, "Không đủ payload để thực hiện");
      $response->send();
      return;
   }

   // Kiểm tra item tồn tại trong CSDL theo các tiêu chí
   if (checkItemExist($routeName)) {
      $response = new ResponseAPI(3, "Tên route đã tồn tại");
      $response->send();
      return;
   }

   // createdAt, updateAt, deletedAt
   $createdAt = getCurrentDatetime();

   // Thực thi query
   $query = "INSERT INTO `$tableName`(`createdAt`, `routeName`, `title`, `isBase`) VALUES('$createdAt', '$routeName', '$title', '$isBase')";
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

// Kiểm tra item tồn tại trong CSDL theo các tiêu chí
function checkItemExist($routeName)
{
   global $connect, $tableName;

   $query = "SELECT * FROM `$tableName` WHERE `deletedAt` IS NULL AND `routeName` = '$routeName' LIMIT 1";
   $result = mysqli_query($connect, $query);

   if ($result && mysqli_num_rows($result) > 0) {
      return true;
   }

   return false;
}
