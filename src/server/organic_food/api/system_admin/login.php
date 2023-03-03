<?php
require("../../core/config.php");
require("../../core/connect_db.php");

require("../../classes/ResponseAPI.php");
require("../../helpers/functions.php");

header("Access-Control-Allow-Origin: " . ACCESS_CONTROL_ALLOW_ORIGIN);
header("Access-Control-Allow-Methods: POST");
header("Content-Type: application/json");

$data = getJSONPayloadRequest();

// Đăng nhập hệ thống
login($data["username"], $data["password"]);

function login($username, $password)
{
   global $connect;

   if (empty($username) || empty($password)) {
      $response = new ResponseAPI(9, "Không đủ dữ liệu payload để thực hiện");
      $response->send();
      return;
   }

   $password = md5($password);

   $query = "SELECT * FROM `systemadmin` WHERE `username` = '$username' AND `password` = '$password' LIMIT 1";
   $result = mysqli_query($connect, $query);

   $systemAdmin = $result->fetch_object();

   if ($systemAdmin != null) {
      $response = new ResponseAPI(1, "Đăng nhập vào hệ thống thành công", $systemAdmin);
      $response->send();
   } else {
      $response = new ResponseAPI(2, "Không tìm thấy tài khoản");
      $response->send();
   }

   $connect->close();
}
