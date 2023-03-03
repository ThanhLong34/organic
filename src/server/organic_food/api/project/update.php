<?php
require("../../core/config.php");
require("../../core/connect_db.php");

require("../../classes/ResponseAPI.php");
require("../../helpers/functions.php");

header("Access-Control-Allow-Origin: " . ACCESS_CONTROL_ALLOW_ORIGIN);
header("Access-Control-Allow-Methods: PUT");
header("Content-Type: application/json");

$data = getJSONPayloadRequest();

updateItem(
   $data["id"],
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

function updateItem($id, $name, $avatar, $imageIDList, $price, $details, $linkDemo, $linkDownload, $isFree, $isFeatured, $categoryID, $tagIDList)
{
   global $connect;

   if (!$id || $id < 0 || empty($name) || !$categoryID || $categoryID < 0) {
      $response = new ResponseAPI(9, "Không đủ dữ liệu payload để thực hiện");
      $response->send();
      return;
   }

   $imageIDList = implode(",", $imageIDList);
   $tagIDList = implode(",", $tagIDList);
   $updatedAt = getCurrentDatetime();

   $query = "UPDATE `project` SET `UpdatedAt` = '$updatedAt', `Name` = '$name', `Avatar` = '$avatar', `ImageIDList` = '$imageIDList', `Price` = '$price', `Details` = '$details', `LinkDemo` = '$linkDemo', `LinkDownload` = '$linkDownload', `IsFree` = '$isFree', `IsFeatured` = '$isFeatured', `CategoryID` = '$categoryID', `TagIDList` = '$tagIDList'
    WHERE `ID` = $id AND `DeletedAt` IS NULL LIMIT 1";
   $result = mysqli_query($connect, $query);

   if ($result) {
      $response = new ResponseAPI(1, "Cập nhật dự án thành công");
      $response->send();
   } else {
      $response = new ResponseAPI(2, "Cập nhật dự án thất bại", $query);
      $response->send();
   }

   $connect->close();
}
