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
$functionName = "UpdateSystemFunction";
if (!checkPermissionFunction($functionName)) exit;


//? ====================
//? PARAMETERS & PAYLOAD
//? ====================
$tableName = "systemfunction";
$data = getJSONPayloadRequest();
$id = $data["id"] ?? 0;
$apiPath = trim($data["apiPath"] ?? "");
$name = trim($data["name"] ?? "");
$description = trim($data["description"] ?? "");
$method = trim($data["method"] ?? "");
$isBase = trim($data["isBase"] ?? "");


//? ====================
//? START
//? ====================
// ✅ Cập nhật item
updateItem($id, $apiPath, $name, $description, $method, $isBase);


//? ====================
//? FUNCTIONS
//? ====================
function updateItem($id, $apiPath, $name, $description, $method, $isBase)
{
   global $connect, $tableName;

   // Kiểm tra dữ liệu payload
   if ($id === 0 || ($apiPath === "" && $name === "" && $description === "" && $method === "" && $isBase === "")) {
      $response = new ResponseAPI(9, "Không đủ payload để thực hiện");
      $response->send();
      return;
   }

   // createdAt, updateAt, deletedAt
   $updatedAt = getCurrentDatetime();

   // Các chuỗi truy vấn
   $baseQuery = "UPDATE `$tableName` SET `updatedAt` = '$updatedAt'";
   $mainQuery = "";
   $endQuery = "WHERE `id` = $id AND `deletedAt` IS NULL";

   // Cập nhật name
   if ($name !== "") {
      if (checkItemExist($name)) {
         $response = new ResponseAPI(3, "Tên chức năng đã tồn tại");
         $response->send();
         return;
      } else {
         $mainQuery .= "," . "`name` = '$name'";
      }
   }

   // Cập nhật apiPath
   if ($apiPath !== "") {
      $mainQuery .= "," . "`apiPath` = '$apiPath'";
   }

   // Cập nhật description
   if ($description !== "") {
      $mainQuery .= "," . "`description` = '$description'";
   }

   // Cập nhật method
   if ($method !== "") {
      $mainQuery .= "," . "`method` = '$method'";
   }

   // Cập nhật isBase
   if ($isBase !== "") {
      $mainQuery .= "," . "`isBase` = '$isBase'";
   }

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
