<?php
require("../../core/config.php");
require("../../core/connect_db.php");

require("../../classes/ResponseAPI.php");
require("../../helpers/functions.php");

header("Access-Control-Allow-Origin: " . ACCESS_CONTROL_ALLOW_ORIGIN);
header("Access-Control-Allow-Methods: POST");
header("Content-Type: application/json");

$data = getJSONPayloadRequest();

addItem($data["fullname"], $data["email"], $data["message"]);

function addItem($name, $email, $message)
{
   global $connect;

   if (empty($name) || empty($email) || empty($message)) {
      $response = new ResponseAPI(9, "Không đủ dữ liệu payload để thực hiện");
      $response->send();
      return;
   }

   if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
      $response = new ResponseAPI(4, "Không đúng định dạng Email");
      $response->send();
   } else {
      $createdAt = getCurrentDatetime();

      $query = "INSERT INTO `emailcontact`(`CreatedAt`, `Fullname`, `Email`, `Message`) VALUES('$createdAt', '$name', '$email', '$message')";
      $result = mysqli_query($connect, $query);

      if ($result) {
         $response = new ResponseAPI(1, "Tạo email liên hệ thành công");
         $response->send();
      } else {
         $response = new ResponseAPI(2, "Tạo email liên hệ thất bại");
         $response->send();
      }
   }

   $connect->close();
}
