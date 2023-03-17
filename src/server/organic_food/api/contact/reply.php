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
header("Access-Control-Allow-Methods: POST");
header("Content-Type: application/json");


//? ====================
//? CHECK PERMISSTION
//? ====================
$functionName = "ReplyContact";
if (!checkPermissionFunction($functionName)) exit;


//? ====================
//? PARAMETERS & PAYLOAD
//? ====================
$tableName = "contact";
$data = getJSONPayloadRequest();

$id = $data["id"] ?? ""; // int
$subject = trim($data["subject"] ?? ""); // string
$message = trim($data["message"] ?? ""); // string


//? ====================
//? START
//? ====================
// ✅ Thêm item 
reply($id, $subject, $message);


//? ====================
//? FUNCTIONS
//? ====================
function reply($id, $subject, $message)
{
   global $connect, $tableName;

   // Kiểm tra dữ liệu payload
   if ($id === "" || !is_numeric($id) || $subject === "" || $message === "") {
      $response = new ResponseAPI(9, "Không đủ payload để thực hiện");
      $response->send();
      return;
   }

   // Lấy thông tin liên hệ của KH
   $querySelect = "SELECT * FROM `$tableName` WHERE `id` = '$id'";
   $resultSelect = mysqli_query($connect, $querySelect);

   if ($resultSelect) {
      $objSelect = $resultSelect->fetch_object();

      // Nếu tìm thấy
      if ($objSelect != null) {

         // createdAt, updateAt, deletedAt
         $updatedAt = getCurrentDatetime();

         // Các chuỗi truy vấn
         $baseQuery = "UPDATE `$tableName` SET `updatedAt` = '$updatedAt'";
         $mainQuery = "";
         $endQuery = "WHERE `id` = '$id' AND `deletedAt` IS NULL";

         // Cập nhật status
         $mainQuery .= "," . "`status` = '1'";

         // Thực thi query
         $query = $baseQuery . " " . $mainQuery . " " . $endQuery;
         if (performsQueryAndResponseToClient($query)) {
            // Gửi email
            if (sendMail($objSelect->email, $subject, $message)) {
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
      }
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
