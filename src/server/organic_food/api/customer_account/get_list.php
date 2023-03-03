<?php
require("../../core/config.php");
require("../../core/connect_db.php");

require("../../classes/ResponseAPI.php");
require("../../helpers/functions.php");

header("Access-Control-Allow-Origin: " . ACCESS_CONTROL_ALLOW_ORIGIN);
header("Access-Control-Allow-Methods: GET");
header("Content-Type: application/json");

$limit = $_GET["limit"];
$offset = $_GET["offset"];

$searchType = "";
$searchValue = "";

if (isset($_GET["searchType"])) {
   $searchType = strtolower($_GET["searchType"]);
   if ($searchType === "username") {
      $searchType = "Username";
   } else if ($searchType === "nickname") {
      $searchType = "Nickname";
   } else if ($searchType === "email") {
      $searchType = "Email";
   } else if ($searchType === "phone") {
      $searchType = "Phone";
   }
}
if (isset($_GET["searchValue"])) {
   $searchValue = $_GET["searchValue"];
}

getList($limit, $offset, $searchType, $searchValue);

function getList($limit, $offset, $searchType, $searchValue)
{
   global $connect;

   if ($limit < 0 || $offset < 0) {
      $response = new ResponseAPI(9, "Không đủ dữ liệu payload để thực hiện");
      $response->send();
      return;
   }

   $baseQuery = "SELECT * FROM `customeraccount` WHERE `DeletedAt` IS NULL";

   if ($limit == 0 && $offset == 0) {
      $query = $baseQuery;
   } else if ($searchType != '' && $searchValue != '') {
      $query = $baseQuery . " AND `$searchType` LIKE '%$searchValue%' LIMIT $limit OFFSET $offset";
   } else {
      $query = $baseQuery . " LIMIT $limit OFFSET $offset";
   }
   
   $result = mysqli_query($connect, $query);

   if ($result) {
      $customerAccounts = [];
      
      while ($obj = $result->fetch_object()) {
         array_push($customerAccounts, $obj);
      }

      $response = new ResponseAPI(1, "Lấy danh sách tài khoản khách hàng thành công", $customerAccounts);
      $response->send();
   } else {
      $response = new ResponseAPI(2, "Lấy danh sách tài khoản khách hàng thất bại");
      $response->send();
   }

   $connect->close();
}
