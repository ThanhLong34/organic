<?php
require("../../core/config.php");
require("../../core/connect_db.php");

require("../../classes/ResponseAPI.php");
require("../../helpers/functions.php");

header("Access-Control-Allow-Origin: " . ACCESS_CONTROL_ALLOW_ORIGIN);
header("Access-Control-Allow-Methods: POST");
header("Content-Type: application/json");

$data = getJSONPayloadRequest();

register($data["username"], $data["password"], $data["nickname"], $data["email"], $data["phone"]);

function register($username, $password, $nickname, $email, $phone)
{
   global $connect;

   if (empty($username) || empty($password) || empty($nickname) || empty($email) || empty($phone)) {
      $response = new ResponseAPI(9, "Không đủ dữ liệu payload để thực hiện");
      $response->send();
      return;
   }

   if (checkItemExist($username, $email)) {
      $response = new ResponseAPI(2, "Tên đăng nhập hoặc email đã tồn tại");
      $response->send();
   } else {
      $password = md5($password);
      $createdAt = getCurrentDatetime();

      if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
         $response = new ResponseAPI(4, "Không đúng định dạng email");
         $response->send();
      } else {
         $query = "INSERT INTO `customeraccount`(`CreatedAt`, `Username`, `Password`, `Nickname`, `Email`, `Phone`) 
               VALUES('$createdAt', '$username', '$password', '$nickname', '$email', '$phone')";
         $result = mysqli_query($connect, $query);

         if ($result) {
            $accountID = mysqli_insert_id($connect);

            $query2 = "SELECT * FROM `customeraccount` WHERE `ID` = $accountID AND `DeletedAt` IS NULL LIMIT 1";
            $result2 = mysqli_query($connect, $query2);

            $customerAccount = $result2->fetch_object();

            if ($customerAccount != null) {
               $response = new ResponseAPI(1, "Tạo tài khoản thành công", $customerAccount);
               $response->send();
            }
         } else {
            $response = new ResponseAPI(3, "Lỗi tạo tài khoản, thử lại sau");
            $response->send();
         }
      }
   }

   $connect->close();
}

function checkItemExist($username, $email)
{
   global $connect;

   $query = "SELECT * FROM `customeraccount` WHERE `DeletedAt` IS NULL AND `Username` = '$username' OR `Email` = '$email' LIMIT 1";
   $result = mysqli_query($connect, $query);

   if (mysqli_num_rows($result) > 0) {
      return true;
   }

   return false;
}
