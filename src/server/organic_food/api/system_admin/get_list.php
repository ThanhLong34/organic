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
$searchBySystemRoleId = 0;

if (isset($_GET["searchType"])) {
   $searchType = strtolower($_GET["searchType"]);
   if ($searchType !== "username" && $searchType !== "nickname" && $searchType !== "email" && $searchType !== "phone") {
      $searchType = "";
   }
}

if (isset($_GET["searchValue"])) {
   $searchValue = $_GET["searchValue"];
}

if (isset($_GET["systemRoleId"])) {
   $searchBySystemRoleId = $_GET["systemRoleId"];
}

// ✅ Lấy danh sách tài khoản admin
getList($limit, $offset, $searchType, $searchValue, $searchBySystemRoleId);

function getList($limit, $offset, $searchType, $searchValue, $searchBySystemRoleId)
{
   global $connect;

   if ($limit < 0 || $offset < 0) {
      $response = new ResponseAPI(9, "Không đủ dữ liệu payload để thực hiện");
      $response->send();
      return;
   }

   $baseQuery = "SELECT * FROM `systemadmin` WHERE `deletedAt` IS NULL";

   if ($limit == 0 && $offset == 0) {
      $query = $baseQuery;
   } else if ($searchType != '' && $searchValue != '' && $searchBySystemRoleId != 0) {
      $query = $baseQuery . " AND `$searchType` LIKE '%$searchValue%' AND `systemRoleId` = $searchBySystemRoleId LIMIT $limit OFFSET $offset";
   } else if ($searchType != '' && $searchValue != '') {
      $query = $baseQuery . " AND `$searchType` LIKE '%$searchValue%' LIMIT $limit OFFSET $offset";
   } else {
      $query = $baseQuery . " LIMIT $limit OFFSET $offset";
   }

   $result = mysqli_query($connect, $query);

   if ($result) {
      $systemAdmins = [];

      while ($obj = $result->fetch_object()) {
         array_push($systemAdmins, $obj);
      }

      $response = new ResponseAPI(1, "Lấy danh sách tài khoản admin thành công", $systemAdmins);
      $response->send();
   } else {
      $response = new ResponseAPI(2, "Lấy danh sách tài khoản admin thất bại");
      $response->send();
   }

   $connect->close();
}
