<?php
require("../../core/config.php");
require("../../core/connect_db.php");

require("../../classes/ResponseAPI.php");
require("../../helpers/functions.php");

header("Access-Control-Allow-Origin: " . ACCESS_CONTROL_ALLOW_ORIGIN);
header("Access-Control-Allow-Methods: GET");
header("Content-Type: application/json");

$ids = "";
if (isset($_GET["ids"])) {
   $ids = $_GET["ids"];
}

getListByIDs($ids);

function getListByIDs($ids)
{
   global $connect;

   if (empty($ids)) {
      $response = new ResponseAPI(9, "Không đủ dữ liệu payload để thực hiện");
      $response->send();
      return;
   }

   $baseQuery = "SELECT `project`.`ID`, `project`.`CreatedAt`, `project`.`UpdatedAt`, `project`.`DeletedAt`, `project`.`Name`, `project`.`Avatar`, `project`.`ImageIDList`, `project`.`Price`, `project`.`Details`, `project`.`LinkDemo`, `project`.`LinkDownload`, `project`.`IsFree`, `project`.`IsFeatured`, `project`.`NumberOfPurchased`, `project`.`CategoryID`, `project`.`TagIDList`, `category`.`Name` AS `CategoryName`
     FROM `project`, `category`
     WHERE `project`.`CategoryID` = `category`.`ID`";

   $query = $baseQuery . " AND `project`.`ID` IN ($ids)";
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
