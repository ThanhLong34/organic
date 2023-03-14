<?php
//? ====================
//? IMPORTS
//? ====================
require("../../core/config.php");
require("../../core/connect_db.php");
require("../../classes/ResponseAPI.php");
require("../../helpers/functions.php");


//? ====================
//? HEADERS
//? ====================
header("Access-Control-Allow-Origin: " . ACCESS_CONTROL_ALLOW_ORIGIN);
header("Access-Control-Allow-Headers: " . ACCESS_CONTROL_ALLOW_HEADERS);
header("Access-Control-Allow-Methods: GET");
header("Content-Type: application/json");


//? ====================
//? CHECK PERMISSTION
//? ====================
$functionName = "GetImageList";
if (!checkPermissionFunction($functionName)) exit;


//? ====================
//? PARAMETERS & PAYLOAD
//? ====================
$tableName = "image";
$target = trim($_GET["target"] ?? "all"); // Hợp lệ: all, using, dont_using
$limit = $_GET["limit"] ?? 0; // limit = 0, hoặc không có payload để lấy tất cả
$offset = $_GET["offset"] ?? 0;
$searchType = trim($_GET["searchType"] ?? ""); // Hợp lệ: filename
$searchValue = trim($_GET["searchValue"] ?? "");
$fillType = trim($_GET["fillType"] ?? ""); // Hợp lệ: 
$fillValue = trim($_GET["fillValue"] ?? "");
$orderby = trim($_GET["orderby"] ?? "id");
$reverse = $_GET["reverse"] ?? "false"; // Hợp lệ: true, 1


//? ====================
//? START
//? ====================
// ✅ Lấy danh sách item 
getList($limit, $offset, $searchType, $searchValue, $fillType, $fillValue, $orderby, $reverse, $target);


//? ====================
//? FUNCTIONS
//? ====================
function getList($limit, $offset, $searchType, $searchValue, $fillType, $fillValue, $orderby, $reverse, $target)
{
   global $connect, $tableName;

   // Không cần kiểm tra dữ liệu payload

   //! Thêm tùy chỉnh Code ở đây
   $baseQuery = "SELECT * FROM `$tableName` WHERE `deletedAt` IS NULL";
   $optionQuery = "";

   if ($target === "using" || $target === "dont_using") {

      // using & dont_using
      $usingImageIdList = [];

      // Lấy danh sách id hình ảnh đang sử dụng
      $queries = [
         "SELECT `featureImageId` FROM `blog` WHERE `featureImageId` IS NOT NULL",
         "SELECT `featureImageId` FROM `productcategory` WHERE `featureImageId` IS NOT NULL",
         "SELECT `featureImageId` FROM `product` WHERE `featureImageId` IS NOT NULL AND `deletedAt` IS NULL",
         "SELECT `imageId` FROM `product_image`, `product` WHERE `imageId` IS NOT NULL AND `product`.`deletedAt` IS NULL",
         "SELECT `avatarId` FROM `systemadmin` WHERE `avatarId` IS NOT NULL"
      ];
      foreach ($queries as $key => $value) {
         $result = mysqli_query($connect, $value);
         if ($result) {
            while ($obj = $result->fetch_row()) {
               array_push($usingImageIdList, (int)$obj[0]);
            }
         } else {
            $response = new ResponseAPI(2, "Thất bại");
            $response->send();

            // Đóng kết nối
            $connect->close();
            return;
         }
      }

      // Lấy danh sách id hình ảnh đang sử dụng
      $usingImageIdListString = implode(",", $usingImageIdList);

      if ($target === "using") {

         $optionQuery = "AND `$tableName`.`id` IN ($usingImageIdListString)";
      } else if ($target === "dont_using") {

         $optionQuery = "AND `$tableName`.`id` NOT IN ($usingImageIdListString)";
      }
   }

   //! Cẩn thận khi sửa Code ở đây
   //! Tùy chỉnh truy vấn theo các tiêu chí
   $querySelectAllRecord = $baseQuery . " " . $optionQuery;
   $orderbyQuery = "ORDER BY `$tableName`.`$orderby` ASC";
   if ($reverse == "true" || $reverse == 1) {
      $orderbyQuery = "ORDER BY `$tableName`.`$orderby` DESC";
   }
   $limitQuery = "LIMIT $limit OFFSET $offset";

   if ($limit == 0) {
      $query = $querySelectAllRecord;
   } else {
      if ($searchType !== "" && $searchValue !== "" && $fillType !== "" && $fillValue !== "") {
         $querySelectAllRecord .= " AND `$tableName`.`$searchType` LIKE '%$searchValue%' AND `$tableName`.`$fillType` = '$fillValue'";
      } else if ($searchType !== "" && $searchValue !== "") {
         $querySelectAllRecord .= " AND `$tableName`.`$searchType` LIKE '%$searchValue%'";
      } else if ($fillType !== "" && $fillValue !== "") {
         $querySelectAllRecord .= " AND `$tableName`.`$fillType` = '$fillValue'";
      }

      $query = $querySelectAllRecord . " " . $orderbyQuery . " " . $limitQuery;
   }

   // Thực thi truy vấn
   performsQueryAndResponseToClient($query, $querySelectAllRecord);

   // Đóng kết nối
   $connect->close();
}

// Thực thi truy vấn và trả về kết quả cho Client
function performsQueryAndResponseToClient($query, $querySelectAllRecord)
{
   global $connect;

   $result = mysqli_query($connect, $query);
   $resultSelectAllRecord = mysqli_query($connect, $querySelectAllRecord);

   if ($result && $resultSelectAllRecord) {
      $list = [];

      while ($obj = $result->fetch_object()) {
         array_push($list, $obj);
      }

      $response = new ResponseAPI(1, "Thành công", $list, mysqli_num_rows($resultSelectAllRecord));
      $response->send();
   } else {
      $response = new ResponseAPI(2, "Thất bại");
      $response->send();
   }
}
