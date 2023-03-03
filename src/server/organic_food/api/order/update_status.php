<?php
require("../../core/config.php");
require("../../core/connect_db.php");

require("../../classes/ResponseAPI.php");
require("../../helpers/functions.php");

header("Access-Control-Allow-Origin: " . ACCESS_CONTROL_ALLOW_ORIGIN);
header("Access-Control-Allow-Methods: PUT");
header("Content-Type: application/json");

$data = getJSONPayloadRequest();

updateItem($data["id"], $data["status"]);

function updateItem($id, $status)
{
   global $connect;

   if (!$id || $id < 0 || $status < 0 || $status == "") {
      $response = new ResponseAPI(9, "Không đủ dữ liệu payload để thực hiện");
      $response->send();
      return;
   }

   $updatedAt = getCurrentDatetime();

   $query = "UPDATE `order` SET `UpdatedAt` = '$updatedAt', `Status` = $status WHERE `ID` = $id AND `DeletedAt` IS NULL";
   $result = mysqli_query($connect, $query);

   if ($result) {

      $query2 = "SELECT `order`.`CustomerAccountID`, `order`.`ProjectID`, `customeraccount`.`PurchasedProjects` FROM `order`, `customeraccount` WHERE `order`.`ID` = $id AND `order`.`DeletedAt` IS NULL AND `order`.`CustomerAccountID` = `customeraccount`.`ID`";
      $result2 = mysqli_query($connect, $query2);

      if ($result2) {

         $order = $result2->fetch_object();

         if ($order != null) {
            $purchasedProjects = $order->PurchasedProjects;

            if (!empty($purchasedProjects)) {
               $purchasedProjects = explode(",", $purchasedProjects);

               if ($status == 1) {
                  array_push($purchasedProjects, $order->ProjectID);
                  $purchasedProjectsStr = implode(",", $purchasedProjects);
               } else if ($status == 2) {
                  $index = array_search($order->ProjectID, $purchasedProjects);
                  if ($index !== FALSE) {
                     unset($purchasedProjects[$index]);
                  }
                  $purchasedProjectsStr = implode(",", $purchasedProjects);
               }

               $query3 = "UPDATE `customeraccount` SET `UpdatedAt` = '$updatedAt', `PurchasedProjects` = '$purchasedProjectsStr' WHERE `ID` = $order->CustomerAccountID AND `DeletedAt` IS NULL";
               $result3 = mysqli_query($connect, $query3);

               if ($result3) {
                  $response = new ResponseAPI(1, "Cập nhật trạng thái đơn hàng thành công");
                  $response->send();
               } else {
                  $response = new ResponseAPI(12, "Cập nhật trạng thái đơn hàng thất bại");
                  $response->send();
               }
            } else {
               if ($status == 1) {
                  $query3 = "UPDATE `customeraccount` SET `UpdatedAt` = '$updatedAt', `PurchasedProjects` = $order->ProjectID WHERE `ID` = $order->CustomerAccountID AND `DeletedAt` IS NULL";
                  $result3 = mysqli_query($connect, $query3);

                  if ($result3) {
                     $response = new ResponseAPI(1, "Cập nhật trạng thái đơn hàng thành công");
                     $response->send();
                  } else {
                     $response = new ResponseAPI(22, "Cập nhật trạng thái đơn hàng thất bại");
                     $response->send();
                  }
               } else {
                  $response = new ResponseAPI(1, "Cập nhật trạng thái đơn hàng thành công");
                  $response->send();
               }
            }
         } else {
            $response = new ResponseAPI(42, "Cập nhật trạng thái đơn hàng thất bại");
            $response->send();
         }
      } else {
         $response = new ResponseAPI(52, "Cập nhật trạng thái đơn hàng thất bại");
         $response->send();
      }
   } else {
      $response = new ResponseAPI(62, "Cập nhật trạng thái đơn hàng thất bại");
      $response->send();
   }

   $connect->close();
}
