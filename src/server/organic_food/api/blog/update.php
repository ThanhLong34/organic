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
$functionName = "UpdateBlog";
if (!checkPermissionFunction($functionName)) exit;


//? ====================
//? PARAMETERS & PAYLOAD
//? ====================
$tableName = "blog";
$data = getJSONPayloadRequest();

$id = $data["id"] ?? ""; // int
$featureImageId = $data["featureImageId"] ?? ""; // int
$title = trim($data["title"] ?? ""); // string
$description = trim($data["description"] ?? ""); // string
$content = trim($data["content"] ?? ""); // string


//? ====================
//? START
//? ====================
// ✅ Cập nhật item
updateItem(
   $id,
   $featureImageId,
   $title,
   $description,
   $content
   // không cho phép cập nhật systemAdminId
);


//? ====================
//? FUNCTIONS
//? ====================
function updateItem(
   $id,
   $featureImageId,
   $title,
   $description,
   $content
) {
   global $connect, $tableName;

   // Kiểm tra dữ liệu payload
   if ($id === "" || !is_numeric($id)) {
      $response = new ResponseAPI(9, "Không đủ payload để thực hiện");
      $response->send();
      return;
   }

   // createdAt, updateAt, deletedAt
   $updatedAt = getCurrentDatetime();

   // Các chuỗi truy vấn
   $baseQuery = "UPDATE `$tableName` SET `updatedAt` = '$updatedAt'";
   $mainQuery = "";
   $endQuery = "WHERE `id` = '$id' AND `deletedAt` IS NULL";

   if ($featureImageId !== "" && is_numeric($featureImageId)) {
      $mainQuery .= "," . "`featureImageId` = '$featureImageId'";
   }

   if ($title !== '') {
      $mainQuery .= "," . "`title` = '$title'";
   }

   $mainQuery .= "," . "`description` = '$description'";

   $mainQuery .= "," . "`content` = '$content'";

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
