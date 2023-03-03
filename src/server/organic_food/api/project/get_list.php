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
$searchByCategoryID = 0;

if (isset($_GET["name"])) {
   $searchByName = $_GET["name"];
}
if (isset($_GET["categoryID"])) {
   $searchByCategoryID = $_GET["categoryID"];
}

getList($limit, $offset, $searchByName, $searchByCategoryID);

function getList($limit, $offset, $searchByName, $searchByCategoryID)
{
   global $connect;

   if ($limit < 0 || $offset < 0) {
      $response = new ResponseAPI(9, "Không đủ dữ liệu payload để thực hiện");
      $response->send();
      return;
   }

   $baseQuery = "SELECT `project`.`ID`, `project`.`Name`, `project`.`Avatar`, `project`.`ImageIDList`, `project`.`Price`, `project`.`Details`, `project`.`LinkDemo`, `project`.`LinkDownload`, `project`.`CreatedAt`, `project`.`UpdatedAt`, `project`.`IsFree`, `project`.`IsFeatured`, `project`.`NumberOfPurchased`, `project`.`CategoryID`, `project`.`TagIDList`, `category`.`Name` AS `CategoryName`
       FROM `project`, `category`
       WHERE `project`.`CategoryID` = `category`.`ID` AND `project`.`DeletedAt` IS NULL";

   if ($limit == 0 && $offset == 0) {
      $query = $baseQuery;
   } else {
      if ($searchByName !== "" && $searchByCategoryID != 0) {
         $query = $baseQuery . " AND `project`.`Name` LIKE '%$searchByName%' AND `project`.`CategoryID` = $searchByCategoryID LIMIT $limit OFFSET $offset";
      } else if ($searchByName !== "") {
         $query = $baseQuery . " AND `project`.`Name` LIKE '%$searchByName%' LIMIT $limit OFFSET $offset";
      } else if ($searchByCategoryID != 0) {
         $query = $baseQuery . " AND `project`.`CategoryID` = $searchByCategoryID LIMIT $limit OFFSET $offset";
      } else {
         $query = $baseQuery . " LIMIT $limit OFFSET $offset";
      }
   }

   $result = mysqli_query($connect, $query);

   if ($result) {
      $projects = [];

      while ($obj = $result->fetch_object()) {
         array_push($projects, $obj);
      }

      $response = new ResponseAPI(1, "Lấy danh sách dự án thành công", $projects);
      $response->send();
   } else {
      $response = new ResponseAPI(2, "Lấy danh sách dự án thất bại");
      $response->send();
   }

   $connect->close();
}
