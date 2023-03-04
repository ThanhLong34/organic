<?php
require("../../core/config.php");
require("../../core/connect_db.php");

require("../../classes/ResponseAPI.php");
require("../../helpers/functions.php");

header("Access-Control-Allow-Origin: " . ACCESS_CONTROL_ALLOW_ORIGIN);
header("Access-Control-Allow-Methods: POST");
header("Content-Type: application/json");

$data = getJSONPayloadRequest();

addItem(
   $data["customerAccountID"],
   $data["projectID"],
   $data["total"]
);

function addItem($customerAccountID, $projectID, $total)
{
   global $connect;

   if (!$customerAccountID || $customerAccountID < 0 || !$projectID || $projectID < 0) {
      $response = new ResponseAPI(9, "Không đủ dữ liệu payload để thực hiện");
      $response->send();
      return;
   }

   $code = makeOrderCode($customerAccountID, $projectID);

   if (checkItemExist($code)) {
      $response = new ResponseAPI(3, "Đơn hàng đã tồn tại");
      $response->send();
   } else {
      $createdAt = getCurrentDatetime();

      $query = "INSERT INTO `order`(`CreatedAt`, `CustomerAccountID`, `ProjectID`, `Code`, `Total`) VALUES ('$createdAt', '$customerAccountID','$projectID','$code','$total')";
      $result = mysqli_query($connect, $query);

      if ($result) {
         $response = new ResponseAPI(1, "Tạo đơn hàng thành công");
         $response->send();
      } else {
         $response = new ResponseAPI(2, "Tạo đơn hàng thất bại");
         $response->send();
      }
   }

   $connect->close();
}

function makeOrderCode($customerAccountID, $projectID)
{
   global $connect;

   $code = "";

   $query = "SELECT * FROM `customeraccount` WHERE `ID` = $customerAccountID AND `DeletedAt` IS NULL LIMIT 1";
   $result = mysqli_query($connect, $query);

   if ($result) {
      $customerAccount = $result->fetch_object();
      $code .= base64_encode($customerAccount->Username . $projectID);
   }

   return $code;
}

function checkItemExist($code)
{
   global $connect;

   $query = "SELECT * FROM `order` WHERE `DeletedAt` IS NULL AND `Code` = '$code' LIMIT 1";
   $result = mysqli_query($connect, $query);

   if ($result && mysqli_num_rows($result) > 0) {
      return true;
   }

   return false;
}
