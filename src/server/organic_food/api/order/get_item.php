<?php
require("../../core/config.php");
require("../../core/connect_db.php");

require("../../classes/ResponseAPI.php");
require("../../helpers/functions.php");

header("Access-Control-Allow-Origin: " . ACCESS_CONTROL_ALLOW_ORIGIN);
header("Access-Control-Allow-Methods: GET");
header("Content-Type: application/json");

$id = 0;
if (isset($_GET["id"])) {
   $id = $_GET["id"];
}

getItem($id);

function getItem($id)
{
   global $connect;

   if (!$id || $id < 0) {
      $response = new ResponseAPI(9, "Không đủ dữ liệu payload để thực hiện");
      $response->send();
      return;
   }
   
   $baseQuery = "SELECT `order`.`ID`, `order`.`CreatedAt`, `order`.`CustomerAccountID`, `order`.`ProjectID`, `order`.`Code`, `order`.`Total`, `order`.`Status`, `customeraccount`.`Username`, `customeraccount`.`Email`, `customeraccount`.`Phone`, `project`.`DeletedAt` AS `ProjectDeletedAt`, `project`.`Avatar` AS `ProjectAvatar`, `project`.`Name` AS `ProjectName`, `category`.`Name` AS `CategoryName`
       FROM `order`, `customeraccount`, `project`, `category`
       WHERE `order`.`DeletedAt` IS NULL AND `order`.`CustomerAccountID` = `customeraccount`.`ID` AND `order`.`ProjectID` = `project`.`ID` AND `project`.`CategoryID` = `category`.`ID`";
   $query = $baseQuery . " AND `order`.`ID` = $id LIMIT 1";
   $result = mysqli_query($connect, $query);

   if ($result) {
      $order = $result->fetch_object();
      if ($order != null) {
         $response = new ResponseAPI(1, "Lấy thông tin đơn hàng thành công", $order);
         $response->send();
      } else {
         $response = new ResponseAPI(2, "Không tìm thấy đơn hàng cần lấy");
         $response->send();
      }
   } else {
      $response = new ResponseAPI(3, "Lấy thông tin đơn hàng thất bại");
      $response->send();
   }

   $connect->close();
}
