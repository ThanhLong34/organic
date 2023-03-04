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

$searchByName = "";
if (isset($_GET["name"])) {
   $searchByName = $_GET["name"];
}

// Lấy danh sách item
getList($limit, $offset, $searchByName);

function getList($limit, $offset, $searchByName)
{
   global $connect;

   if ($limit < 0 || $offset < 0 && $offset == 0) {
      $response = new ResponseAPI(9, "Không đủ dữ liệu payload để thực hiện");
      $response->send();
      return;
   }

   $baseQuery = "SELECT * FROM `systemrole` WHERE `deletedAt` IS NULL";

   if ($limit == 0 && $offset == 0) {
      $query = $baseQuery;
   } else {
      if ($searchByName !== "") {
         $query = $baseQuery . " AND `name` LIKE '%$searchByName%' LIMIT $limit OFFSET $offset";
      } else {
         $query = $baseQuery . " LIMIT $limit OFFSET $offset";
      }
   }

   $result = mysqli_query($connect, $query);

   if ($result) {
      $systemRoles = [];

      while ($obj = $result->fetch_object()) {
         array_push($systemRoles, $obj);
      }

      $response = new ResponseAPI(1, "Lấy danh sách vai trò thành công", $systemRoles);
      $response->send();
   } else {
      $response = new ResponseAPI(2, "Lấy danh sách vai trò thất bại");
      $response->send();
   }

   $connect->close();
}
