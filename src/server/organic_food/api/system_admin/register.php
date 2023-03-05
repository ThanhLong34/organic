<?php
require("../../core/config.php");
require("../../core/connect_db.php");

require("../../classes/ResponseAPI.php");
require("../../helpers/functions.php");

header("Access-Control-Allow-Origin: " . ACCESS_CONTROL_ALLOW_ORIGIN);
header("Access-Control-Allow-Methods: POST");
header("Content-Type: application/json");

$data = getJSONPayloadRequest();

// ✅ Đăng ký tài khoản truy cập vào hệ thống
register($data["username"], $data["password"], $data["nickname"], $data["email"], $data["phone"], $data["systemRoleId"]);

function register($username, $password, $nickname, $email, $phone, $systemRoleId)
{
   global $connect;

   if (empty($username) || empty($password) || empty($nickname) || empty($email) || empty($phone) || !$systemRoleId || $systemRoleId < 0) {
      $response = new ResponseAPI(9, "Không đủ dữ liệu payload để thực hiện");
      $response->send();
      return;
   }

   // Kiểm tra tên đăng nhập đã tồn tại chưa
   if (checkItemExist($username)) {
      $response = new ResponseAPI(3, "Tên đăng nhập đã tồn tại");
      $response->send();
   } else {
      $password = md5($password);

      // Kiểm tra định dạng email
      if (validateEmail($email)) {
         // Kiểm tra định dạng số điện thoại
         if (validatePhoneNumber($phone)) {
            $createdAt = getCurrentDatetime();

            $query = "INSERT INTO `systemadmin`(`createdAt`, `username`, `password`, `nickname`, `email`, `phone`, `systemRoleId`) 
               VALUES('$createdAt', '$username', '$password', '$nickname', '$email', '$phone', '$systemRoleId')";
            $result = mysqli_query($connect, $query);

            if ($result) {
               $response = new ResponseAPI(1, "Tạo tài khoản admin thành công");
               $response->send();
            } else {
               $response = new ResponseAPI(2, "Tạo tài khoản admin thất bại");
               $response->send();
            }
         } else {
            $response = new ResponseAPI(5, "Không đúng định dạng số điện thoại");
            $response->send();
         }
      } else {
         $response = new ResponseAPI(4, "Không đúng định dạng Email");
         $response->send();
      }
   }

   $connect->close();
}

function checkItemExist($username)
{
   global $connect;

   $query = "SELECT * FROM `systemadmin` WHERE `username` = '$username' LIMIT 1";
   $result = mysqli_query($connect, $query);

   if ($result && mysqli_num_rows($result) > 0) {
      return true;
   }

   return false;
}
