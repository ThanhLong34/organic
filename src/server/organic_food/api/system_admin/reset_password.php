<?php
//? ====================
//? IMPORTS
//? ====================
require("../../core/config.php");
require("../../core/connect_db.php");
require("../../classes/ResponseAPI.php");
require("../../helpers/functions.php");
require("../../lib/mail/sendmail.php");

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
$functionName = "ResetPasswordSystemAdmin";
if (!checkPermissionFunction($functionName)) exit;


//? ====================
//? PARAMETERS & PAYLOAD
//? ====================
$tableName = "systemadmin";
$data = getJSONPayloadRequest();

$id = $data["id"] ?? ""; // int


//? ====================
//? START
//? ====================
// ✅ Cập nhật item
updateItem($id);


//? ====================
//? FUNCTIONS
//? ====================
function updateItem($id)
{
   global $connect, $tableName;

   // Kiểm tra dữ liệu payload
   if ($id === "" || !is_numeric($id)) {
      $response = new ResponseAPI(9, "Không đủ payload để thực hiện");
      $response->send();
      return;
   }

   // createdAt, updateAt, deletedAt
   $updatedAt = getCurrentDatetime();

   // Tạo mật khẩu và MD5 mật khẩu
   $newPassword = generateRandomString(12);
   $password = md5($newPassword);

   // Lấy email tài khoản admin
   $email = getEmailSystemAdmin($id);
   if (empty($email)) {
      $response = new ResponseAPI(3, "Không tìm thấy email");
      $response->send();
      return;
   }

   // Các chuỗi truy vấn
   $baseQuery = "UPDATE `$tableName` SET `updatedAt` = '$updatedAt'";
   $mainQuery = "," . "`password` = '$password'";
   $endQuery = "WHERE `id` = '$id' AND `deletedAt` IS NULL";

   // Thực thi query
   $query = $baseQuery . " " . $mainQuery . " " . $endQuery;
   if (performsQueryAndResponseToClient($query)) {
      // Send mail
      if (sendMail($email, "[Organic-Food] Lấy lại mật khẩu", "Mật khẩu mới là: $newPassword")) {
         $response = new ResponseAPI(1, "Thành công");
         $response->send();
      } else {
         $response = new ResponseAPI(4, "Gửi mail không thành công");
         $response->send();
      }
   } else {
      $response = new ResponseAPI(2, "Thất bại");
      $response->send();
   }

   // Đóng kết nối
   $connect->close();
}

// Thực thi truy vấn và trả về kết quả cho Client
function performsQueryAndResponseToClient($query)
{
   global $connect;

   $result = mysqli_query($connect, $query);
   return $result;
}

// Lấy email tài khoản admin
function getEmailSystemAdmin($systemAdminId)
{
   global $connect;

   $query = "SELECT `email` FROM `systemadmin` WHERE `id` = '$systemAdminId' AND `deletedAt` IS NULL LIMIT 1";
   $result = mysqli_query($connect, $query);

   if ($result && ($obj = $result->fetch_object()) != null) {
      return $obj->email;
   }

   return "";
}
