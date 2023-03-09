<?php
require("../../core/config.php");
require("../../core/connect_db.php");

require("../../classes/ResponseAPI.php");
require("../../helpers/functions.php");

header("Access-Control-Allow-Origin: " . ACCESS_CONTROL_ALLOW_ORIGIN);
header("Access-Control-Allow-Headers: " . ACCESS_CONTROL_ALLOW_HEADERS);
header("Access-Control-Allow-Methods: GET");
header("Content-Type: application/json");

$productId = $_GET["productId"];

// Lấy danh sách ảnh của sản phẩm theo id sản phẩm
getListByProductId($productId);

function getListByProductId($productId)
{
   global $connect;

   if (!$productId || $productId < 0) {
      $response = new ResponseAPI(9, "Không đủ dữ liệu payload để thực hiện");
      $response->send();
      return;
   }

   $query = "SELECT `image`.`id`, `image`.`createdAt`, `image`.`link`, `image`.`filename`, `image`.`size` 
            FROM `image`, `product_image` 
            WHERE  `image`.`id` = `product_image`.`imageId` 
            AND `product_image`.`productId` = $productId";
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
