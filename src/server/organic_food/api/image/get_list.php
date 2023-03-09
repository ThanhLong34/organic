<?php
require("../../core/config.php");
require("../../core/connect_db.php");

require("../../classes/ResponseAPI.php");
require("../../helpers/functions.php");

header("Access-Control-Allow-Origin: " . ACCESS_CONTROL_ALLOW_ORIGIN);
header("Access-Control-Allow-Headers: " . ACCESS_CONTROL_ALLOW_HEADERS);
header("Access-Control-Allow-Methods: GET");
header("Content-Type: application/json");

$limit = $_GET["limit"];
$offset = $_GET["offset"];

$target = "all";
if (isset($_GET["target"])) {
   $target = $_GET["target"];
}

// ✅ Lấy danh sách hình ảnh
getList($limit, $offset, $target);

function getList($limit, $offset, $target)
{
   global $connect;

   if ($limit < 0 || $offset < 0) {
      $response = new ResponseAPI(9, "Không đủ dữ liệu payload để thực hiện");
      $response->send();
      return;
   }

   //!
   //! TRUY VẤN QUA CÁC BẢNG: product_image, productcategory, blog, systemadmin
   //! Tìm item nào không có id trong các bảng trên tức là đang không được sử dụng

   // IDs lấy từ DB
   $ids = implode(",", getIDsIsUsing());

   if ($limit == 0 && $offset == 0) {
      if ($ids == "") {
         $query = "SELECT * FROM `image`";
      } else {
         if ($target == "all") {
            $query = "SELECT * FROM `image`";
         } else if ($target == "is_using") {
            $query = "SELECT * FROM `image` WHERE `id` IN ($ids)";
         } else if ($target == "dont_using") {
            $query = "SELECT * FROM `image` WHERE `id` NOT IN ($ids)";
         }
      }
   } else {
      if ($target == "all") {
         $query = "SELECT * FROM `image` LIMIT $limit OFFSET $offset";
      } else if ($target == "is_using") {
         $query = "SELECT * FROM `image` WHERE `id` IN ($ids) LIMIT $limit OFFSET $offset";
      } else if ($target == "dont_using") {
         $query = "SELECT * FROM `image` WHERE `id` NOT IN ($ids) LIMIT $limit OFFSET $offset";
      }
   }

   $result = mysqli_query($connect, $query);

   if ($result) {
      $images = [];

      while ($obj = $result->fetch_object()) {
         array_push($images, $obj);
      }
      $response = new ResponseAPI(1, "Lấy danh sách hình ảnh thành công", $images);
      $response->send();
   } else if (!$result && $target != "all") {
      $response = new ResponseAPI(1, "Không có dữ liệu", []);
      $response->send();
   } else {
      $response = new ResponseAPI(2, "Lấy danh sách hình ảnh thất bại");
      $response->send();
   }

   $connect->close();
}

function getIDsIsUsing()
{
   global $connect;

   $ids = [];

   $query = "SELECT `ImageIDList` FROM `project` WHERE `ImageIDList` != ''";
   $result = mysqli_query($connect, $query);

   if ($result) {
      while ($obj = $result->fetch_object()) {
         array_push($ids, $obj->ImageIDList);
      }
   }

   return $ids;
}
