<?php
require("../../core/config.php");
require("../../core/connect_db.php");

require("../../classes/ResponseAPI.php");
require("../../helpers/functions.php");

header("Access-Control-Allow-Origin: " . ACCESS_CONTROL_ALLOW_ORIGIN);
header("Access-Control-Allow-Methods: GET");
header("Content-Type: application/json");

$id = "";
if (isset($_GET["id"])) {
   $id = $_GET["id"];
}

// 
getListByProductId($id);

function getListByProductId($id)
{
   global $connect;

   if (empty($id)) {
      $response = new ResponseAPI(10, "Sản phẩm này không có hình ảnh");
      $response->send();
      return;
   }

   //!
   //! TRUY VẤN VÀO BẢNG product_image
   //!

   $query = "SELECT * FROM `image` WHERE `ID` IN ($id)";
   $result = mysqli_query($connect, $query);

   if ($result) {
      $images = [];

      while ($obj = $result->fetch_object()) {
         array_push($images, $obj);
      }
      $response = new ResponseAPI(1, "Lấy danh sách hình ảnh thành công", $images);
      $response->send();
   } else {
      $response = new ResponseAPI(2, "Lấy danh sách hình ảnh thất bại");
      $response->send();
   }

   $connect->close();
}
