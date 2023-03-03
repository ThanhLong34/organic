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
   $data["name"],
   $data["avatar"],
   $data["imageIDList"],
   $data["price"],
   $data["details"],
   $data["linkDemo"],
   $data["linkDownload"],
   $data["isFree"],
   $data["isFeatured"],
   $data["categoryID"],
   $data["tagIDList"],
);

function addItem($name, $avatar, $imageIDList, $price, $details, $linkDemo, $linkDownload, $isFree, $isFeatured, $categoryID, $tagIDList)
{
   global $connect;

   if (empty($name) || !$categoryID || $categoryID < 0) {
      $response = new ResponseAPI(9, "Không đủ dữ liệu payload để thực hiện");
      $response->send();
      return;
   }

   $imageIDList = implode(",", $imageIDList);
   $tagIDList = implode(",", $tagIDList);
   $createdAt = getCurrentDatetime();

   $query = "INSERT INTO `project`(`CreatedAt`, `Name`, `Avatar`, `ImageIDList`, `Price`, `Details`, `LinkDemo`, `LinkDownload`, `IsFree`, `IsFeatured`, `CategoryID`, `TagIDList`) 
         VALUES('$createdAt', '$name', '$avatar', '$imageIDList', '$price', '$details', '$linkDemo', '$linkDownload', '$isFree', '$isFeatured', '$categoryID', '$tagIDList')";
   $result = mysqli_query($connect, $query);

   if ($result) {
      $response = new ResponseAPI(1, "Tạo dự án thành công");
      $response->send();
   } else {
      $response = new ResponseAPI(2, "Tạo dự án thất bại");
      $response->send();
   }

   $connect->close();
}
