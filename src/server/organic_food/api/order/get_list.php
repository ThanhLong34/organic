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

$searchByCode = "";
if (isset($_GET["code"])) {
   $searchByCode = $_GET["code"];
}

$searchByStatus = "";
if (isset($_GET["status"])) {
   $searchByStatus = $_GET["status"];
}

getList($limit, $offset, $searchByCode, $searchByStatus);

function getList($limit, $offset, $searchByCode, $searchByStatus)
{
   global $connect;

   if ($limit < 0 || $offset < 0) {
      $response = new ResponseAPI(9, "Không đủ dữ liệu payload để thực hiện");
      $response->send();
      return;
   }

   $baseQuery = "SELECT `order`.`ID`, `order`.`CreatedAt`, `order`.`CustomerAccountID`, `order`.`ProjectID`, `order`.`Code`, `order`.`Total`, `order`.`Status`, `customeraccount`.`Username`
       FROM `order`, `customeraccount`
       WHERE `order`.`DeletedAt` IS NULL AND `order`.`CustomerAccountID` = `customeraccount`.`ID`";

   if ($limit == 0 && $offset == 0) {
      $query = $baseQuery;
   } else {
      if ($searchByCode !== "" && $searchByStatus !== "") {
         $query = $baseQuery . " AND `order`.`Code` LIKE '%$searchByCode%' AND `order`.`Status` = $searchByStatus LIMIT $limit OFFSET $offset";
      } else if ($searchByCode !== "") {
         $query = $baseQuery . " AND `order`.`Code` LIKE '%$searchByCode%' LIMIT $limit OFFSET $offset";
      } else if ($searchByStatus !== "") {
         $query = $baseQuery . " AND `order`.`Status` = $searchByStatus LIMIT $limit OFFSET $offset";
      } else {
         $query = $baseQuery . " LIMIT $limit OFFSET $offset";
      }
   }

   $result = mysqli_query($connect, $query);

   if ($result) {
      $orders = [];

      while ($obj = $result->fetch_object()) {
         array_push($orders, $obj);
      }

      $response = new ResponseAPI(1, "Lấy danh sách đơn hàng thành công", $orders);
      $response->send();
   } else {
      $response = new ResponseAPI(2, "Lấy danh sách đơn hàng thất bại");
      $response->send();
   }

   $connect->close();
}
