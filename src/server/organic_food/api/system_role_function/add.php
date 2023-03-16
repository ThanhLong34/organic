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
$functionName = "AddSystemRoleFunction";
if (!checkPermissionFunction($functionName)) exit;


//? ====================
//? PARAMETERS & PAYLOAD
//? ====================
$tableName = "systemrole_function";
$data = getJSONPayloadRequest();

$systemRoleId = $data["systemRoleId"] ?? ""; // int
$systemFunctionId = $data["systemFunctionId"] ?? ""; // int


//? ====================
//? START
//? ====================
// ✅ Thêm item 
addItem($systemRoleId, $systemFunctionId);


//? ====================
//? FUNCTIONS
//? ====================
function addItem($systemRoleId, $systemFunctionId)
{
   global $connect, $tableName;

   // Kiểm tra dữ liệu payload
   if (!is_numeric($systemRoleId) || !is_numeric($systemFunctionId)) {
      $response = new ResponseAPI(9, "Không đủ payload để thực hiện");
      $response->send();
      return;
   }

   // Kiểm tra item tồn tại trong CSDL theo các tiêu chí
   if (checkItemExist($systemRoleId, $systemFunctionId)) {
      $response = new ResponseAPI(3, "Vai trò này đã có sẵn chức năng");
      $response->send();
      return;
   }

   // Thực thi query
   $query = "INSERT INTO `$tableName`(`systemRoleId`, `systemFunctionId`) VALUES('$systemRoleId', '$systemFunctionId')";
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
function checkItemExist($systemRoleId, $systemFunctionId)
{
   global $connect, $tableName;

   $query = "SELECT * FROM `$tableName` WHERE `systemRoleId` = '$systemRoleId' AND `systemFunctionId` = '$systemFunctionId' LIMIT 1";
   $result = mysqli_query($connect, $query);

   if ($result && mysqli_num_rows($result) > 0) {
      return true;
   }

   return false;
}
