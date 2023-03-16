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
header("Access-Control-Allow-Methods: GET");
header("Content-Type: application/json");


//? ====================
//? CHECK PERMISSTION
//? ====================
$functionName = "GetSystemMenuListBySystemRoleId";
if (!checkPermissionFunction($functionName)) exit;


//? ====================
//? PARAMETERS & PAYLOAD
//? ====================
$tableName = "systemmenu";

$systemRoleId = $_GET["systemRoleId"] ?? ""; // int


//? ====================
//? START
//? ====================
// ✅ Lấy danh sách item 
getList($systemRoleId);


//? ====================
//? FUNCTIONS
//? ====================
function getList($systemRoleId)
{
   global $connect, $tableName;

   // Kiểm tra dữ liệu payload
   if ($systemRoleId === "" || !is_numeric($systemRoleId)) {
      $response = new ResponseAPI(9, "Không đủ payload để thực hiện");
      $response->send();
      return;
   }

   // Thực thi truy vấn
   $query = "SELECT DISTINCT `$tableName`.* 
      FROM `$tableName`, `systemrole_menu` 
      WHERE `systemrole_menu`.`systemRoleId` = '$systemRoleId' 
      AND `systemrole_menu`.`systemMenuId` = `$tableName`.`id`
      OR `$tableName`.`isBase` = 1
      AND `$tableName`.`deletedAt` IS NULL";
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
      $list = [];

      while ($obj = $result->fetch_object()) {
         array_push($list, $obj);
      }

      $response = new ResponseAPI(1, "Thành công", $list);
      $response->send();
   } else {
      $response = new ResponseAPI(2, "Thất bại");
      $response->send();
   }
}
