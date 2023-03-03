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

$searchByEmail = "";
if (isset($_GET["email"])) {
   $searchByEmail = $_GET["email"];
}

$searchByStatus = "";
if (isset($_GET["status"])) {
   $searchByStatus = $_GET["status"];
}

getList($limit, $offset, $searchByEmail, $searchByStatus);

function getList($limit, $offset, $searchByEmail, $searchByStatus)
{
   global $connect;

   if ($limit < 0 || $offset < 0) {
      $response = new ResponseAPI(9, "Không đủ dữ liệu payload để thực hiện");
      $response->send();
      return;
   }

   $baseQuery = "SELECT * FROM `emailcontact` WHERE `DeletedAt` IS NULL";
   
   if ($limit == 0 && $offset == 0) {
      $query = $baseQuery;
   } else {
      if ($searchByEmail !== "" && $searchByStatus !== "") {
         $query = $baseQuery . " AND `Email` LIKE '%$searchByEmail%' AND `Status` = $searchByStatus LIMIT $limit OFFSET $offset";
      } else if ($searchByEmail !== "") {
         $query = $baseQuery . " AND `Email` LIKE '%$searchByEmail%' LIMIT $limit OFFSET $offset";
      } else if ($searchByStatus !== "") {
         $query = $baseQuery . " AND `Status` = $searchByStatus LIMIT $limit OFFSET $offset";
      } else {
         $query = $baseQuery . " LIMIT $limit OFFSET $offset";
      }
   }
   
   $result = mysqli_query($connect, $query);

   if ($result) {
      $emailContacts = [];
      
      while ($obj = $result->fetch_object()) {
         array_push($emailContacts, $obj);
      }

      $response = new ResponseAPI(1, "Lấy danh sách email liên hệ thành công", $emailContacts);
      $response->send();
   } else {
      $response = new ResponseAPI(2, "Lấy danh sách email liên hệ thất bại");
      $response->send();
   }

   $connect->close();
}
