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
header("Access-Control-Allow-Methods: PUT");
header("Content-Type: application/json");


//? ====================
//? CHECK PERMISSTION
//? ====================
$functionName = "UpdateNicknameSystemAdmin";
if (!checkPermissionFunction($functionName)) exit;


//? ====================
//? PARAMETERS & PAYLOAD
//? ====================
$tableName = "systemadmin";
$data = getJSONPayloadRequest();
$id = $data["id"] ?? 0;
$nickname = $data["nickname"] ?? "";


//? ====================
//? START
//? ====================
// ✅ Cập nhật item
updateItem($id, $nickname);


//? ====================
//? FUNCTIONS
//? ====================
function updateItem($id, $nickname)
{
   global $connect, $tableName;

   // Kiểm tra dữ liệu payload
   if ($id === 0 || $nickname === "") {
      $response = new ResponseAPI(9, "Không đủ payload để thực hiện");
      $response->send();
      return;
   }

   // createdAt, updateAt, deletedAt
   $updatedAt = getCurrentDatetime();

   // Các chuỗi truy vấn
   $baseQuery = "UPDATE `$tableName` SET `updatedAt` = '$updatedAt'";
   $mainQuery = "," . "`nickname` = '$nickname'";
   $endQuery = "WHERE `id` = $id AND `deletedAt` IS NULL";

   // Thực thi query
   $query = $baseQuery . " " . $mainQuery . " " . $endQuery;
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
