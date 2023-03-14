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
$functionName = "AddBlog";
if (!checkPermissionFunction($functionName)) exit;


//? ====================
//? PARAMETERS & PAYLOAD
//? ====================
$tableName = "blog";
$data = getJSONPayloadRequest();
$featureImageId = $data["featureImageId"] ?? 0;
$title = trim($data["title"] ?? "");
$description = trim($data["description"] ?? ""); // text
$content = trim($data["content"] ?? ""); // text
$systemAdminId = $data["systemAdminId"] ?? 0;


//? ====================
//? START
//? ====================
// ✅ Thêm item 
addItem($featureImageId, $title, $description, $content, $systemAdminId);


//? ====================
//? FUNCTIONS
//? ====================
function addItem($featureImageId, $title, $description, $content, $systemAdminId)
{
   global $connect, $tableName;

   // Kiểm tra dữ liệu payload
   if ($title === "" || $systemAdminId === 0) {
      $response = new ResponseAPI(9, "Không đủ payload để thực hiện");
      $response->send();
      return;
   }

   // createdAt, updateAt, deletedAt
   $createdAt = getCurrentDatetime();

   // Thực thi query
   $query = "INSERT INTO `$tableName`(`createdAt`, `featureImageId`, `title`, `description`, `content`, `systemAdminId`) 
      VALUES('$createdAt', '$featureImageId', '$title', '$description', '$content', '$systemAdminId')";
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
      $obj = new stdClass();
      $obj->productId = $connect->insert_id;

      $response = new ResponseAPI(1, "Thành công", $obj);
      $response->send();
   } else {
      $response = new ResponseAPI(2, "Thất bại");
      $response->send();
   }
}
