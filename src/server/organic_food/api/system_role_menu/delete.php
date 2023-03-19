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
header("Access-Control-Allow-Methods: DELETE");
header("Content-Type: application/json");


//? ====================
//? CHECK PERMISSTION
//? ====================
$functionName = "DeleteSystemRoleMenu";
if (!checkPermissionFunction($functionName)) exit;


//? ====================
//? PARAMETERS & PAYLOAD
//? ====================
$tableName = "systemrole_menu";
$data = getJSONPayloadRequest();

$systemRoleId = $data["systemRoleId"] ?? ""; // int
$systemMenuId = $data["systemMenuId"] ?? ""; // int


//? ====================
//? START
//? ====================
// ✅ Xóa item 
deleteItem($systemRoleId, $systemMenuId);


//? ====================
//? FUNCTIONS
//? ====================
function deleteItem($systemRoleId, $systemMenuId)
{
   global $connect, $tableName;

   // Kiểm tra dữ liệu payload
   if (!is_numeric($systemRoleId) || !is_numeric($systemMenuId)) {
      $response = new ResponseAPI(9, "Không đủ payload để thực hiện");
      $response->send();
      return;
   }

   // Thực thi query
   $query = "DELETE FROM `$tableName` WHERE `systemRoleId` = '$systemRoleId' AND `systemMenuId` = '$systemMenuId'";
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
