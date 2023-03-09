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
$functionName = "AddSystemFunction";
if (!checkPermissionFunction($functionName)) exit;


//? ====================
//? PARAMETERS & PAYLOAD
//? ====================
$tableName = "systemfunction";
$data = getJSONPayloadRequest();
$apiPath = $data["apiPath"] ?? "";
$name = $data["name"] ?? "";
$description = $data["description"] ?? "";
$method = $data["method"] ?? "";
$isBase = $data["isBase"] ?? false;


//? ====================
//? START
//? ====================
// ✅ Thêm item 
addItem($apiPath, $name, $description, $method, $isBase);


//? ====================
//? FUNCTIONS
//? ====================
function addItem($apiPath, $name, $description, $method, $isBase)
{
   global $connect, $tableName;

   // Kiểm tra dữ liệu payload
   if ($name === "" || !is_bool($isBase)) {
      $response = new ResponseAPI(9, "Không đủ payload để thực hiện");
      $response->send();
      return;
   }

   // Kiểm tra item tồn tại trong CSDL theo các tiêu chí
   if (checkItemExist($name)) {
      $response = new ResponseAPI(3, "Tên chức năng đã tồn tại");
      $response->send();
      return;
   }

   // createdAt, updateAt, deletedAt
   $createdAt = getCurrentDatetime();

   // Thực thi query
   $query = "INSERT INTO `$tableName`(`createdAt`, `apiPath`, `name`, `description`, `method`, `isBase`) 
      VALUES('$createdAt', '$apiPath', '$name', '$description', '$method', '$isBase')";
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
function checkItemExist($name)
{
   global $connect, $tableName;

   $query = "SELECT * FROM `$tableName` WHERE `deletedAt` IS NULL AND `name` = '$name' LIMIT 1";
   $result = mysqli_query($connect, $query);

   if ($result && mysqli_num_rows($result) > 0) {
      return true;
   }

   return false;
}
