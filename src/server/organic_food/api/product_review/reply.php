<?php
//? ====================
//? IMPORTS
//? ====================
require("../../core/config.php");
require("../../core/connect_db.php");
require("../../classes/ResponseAPI.php");
require("../../helpers/functions.php");
require("../../classes/mails/reply_product_review.php");


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
$functionName = "ReplyProductReview";
if (!checkPermissionFunction($functionName)) exit;


//? ====================
//? PARAMETERS & PAYLOAD
//? ====================
$tableName = "productreview";
$data = getJSONPayloadRequest();

$id = $data["id"] ?? ""; // int
$replyMessage = trim($data["replyMessage"] ?? ""); // string


//? ====================
//? START
//? ====================
// ✅ Thêm item 
reply($id, $replyMessage);


//? ====================
//? FUNCTIONS
//? ====================
function reply($id, $replyMessage)
{
   global $connect, $tableName;

   // Kiểm tra dữ liệu payload
   if ($id === "" || !is_numeric($id) || $replyMessage === "") {
      $response = new ResponseAPI(9, "Không đủ payload để thực hiện");
      $response->send();
      return;
   }

   // Lấy thông tin đánh giá sản phẩm
   $querySelect = "SELECT * FROM `$tableName` WHERE `id` = '$id'";
   $resultSelect = mysqli_query($connect, $querySelect);

   if ($resultSelect) {
      $objSelect = $resultSelect->fetch_object();

      // Nếu tìm thấy
      if ($objSelect != null) {

         // repliedAt
         $repliedAt = getCurrentDatetime();

         // Các chuỗi truy vấn
         $baseQuery = "UPDATE `$tableName` SET `repliedAt` = '$repliedAt'";
         $mainQuery = "";
         $endQuery = "WHERE `id` = '$id' AND `deletedAt` IS NULL";

         // Cập nhật replyMessage
         $mainQuery .= "," . "`replyMessage` = '$replyMessage'";

         // Thực thi query
         $query = $baseQuery . " " . $mainQuery . " " . $endQuery;
         if (performsQueryAndResponseToClient($query)) {

            // Tạo đối đượng mail
            $mail = new ReplyProductReviewMail($objSelect->email, $objSelect, $replyMessage);

            // Gửi email
            if ($mail->send()) {
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
