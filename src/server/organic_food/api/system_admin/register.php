<?php
require("../../core/config.php");
require("../../core/connect_db.php");

require("../../classes/ResponseAPI.php");
require("../../helpers/functions.php");

header("Access-Control-Allow-Origin: " . ACCESS_CONTROL_ALLOW_ORIGIN);
header("Access-Control-Allow-Methods: POST");
header("Content-Type: application/json");

$data = getJSONPayloadRequest();

register($data["username"], $data["password"], $data["email"], $data["nickname"]);

function register($username, $password, $email, $nickname)
{
   global $connect;

   if (empty($username) || empty($password) || empty($email) || empty($nickname)) {
      $response = new ResponseAPI(9, "Không đủ dữ liệu payload để thực hiện");
      $response->send();
      return;
   }

   if (checkItemExist($username)) {
      $response = new ResponseAPI(3, "Tên đăng nhập đã tồn tại");
      $response->send();
   } else {
      $password = md5($password);
      if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
         $response = new ResponseAPI(4, "Không đúng định dạng Email");
         $response->send();
      } else {
         $createdAt = getCurrentDatetime();

         $query = "INSERT INTO `systemadmin`(`createdAt`, `username`, `password`, `email`, `nickname`) 
               VALUES('$createdAt', '$username', '$password', '$email', '$nickname')";
         $result = mysqli_query($connect, $query);

         if ($result) {
            $response = new ResponseAPI(1, "Tạo tài khoản admin thành công");
            $response->send();
         } else {
            $response = new ResponseAPI(2, "Tạo tài khoản admin thất bại");
            $response->send();
         }
      }
   }

   $connect->close();
}

function checkItemExist($username)
{
   global $connect;

   $query = "SELECT * FROM `systemadmin` WHERE `username` = '$username' LIMIT 1";
   $result = mysqli_query($connect, $query);

   if (mysqli_num_rows($result) > 0) {
      return true;
   }

   return false;
}
