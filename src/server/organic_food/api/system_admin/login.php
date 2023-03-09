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
header("Access-Control-Allow-Methods: POST");
header("Content-Type: application/json");


//? ====================
//? CHECK PERMISSTION
//? ====================
// Không cần check
// $functionName = "LoginSystemAdmin";
// if (!checkPermissionFunction($functionName)) exit;


//? ====================
//? PARAMETERS & PAYLOAD
//? ====================
$tableName = "systemadmin";
$data = getJSONPayloadRequest();
$username = trim($data["username"] ?? "");
$password = trim($data["password"] ?? "");

//? ====================
//? START
//? ====================
// ✅ Cập nhật item
login($username, $password);


//? ====================
//? FUNCTIONS
//? ====================
function login($username, $password)
{
   global $connect, $tableName;

   // Kiểm tra dữ liệu payload
   if ($username === "" || $password === "") {
      $response = new ResponseAPI(9, "Không đủ payload để thực hiện");
      $response->send();
      return;
   }

   // MD5 mật khẩu
   $password = md5($password);

   // Thực thi query
   $query = "SELECT `$tableName`.`id`, `$tableName`.`createdAt`, `$tableName`.`updatedAt`, `$tableName`.`username`, `$tableName`.`nickname`, `$tableName`.`email`, `$tableName`.`phone`, `$tableName`.`avatarId`, `$tableName`.`systemRoleId`, `systemrole`.`name` as 'systemRoleName'
      FROM `$tableName`, `image`, `systemrole`
      WHERE `$tableName`.`username` = '$username'
      AND `$tableName`.`password` = '$password'
      AND `systemrole`.`id` = `$tableName`.`systemRoleId`
      AND `$tableName`.`deletedAt` IS NULL
      LIMIT 1";
   performsQueryAndResponseToClient($query);

   // Đóng kết nối
   $connect->close();
}

// Thực thi truy vấn và trả về kết quả cho Client
function performsQueryAndResponseToClient($query)
{
   global $connect;

   $result = mysqli_query($connect, $query);

   if ($result && ($obj = $result->fetch_object()) != null) {

      $obj->menus = getMenus($obj->systemRoleId);
      $obj->functions = getFunctions($obj->systemRoleId);

      $response = new ResponseAPI(1, "Thành công", $obj);
      $response->send();
   } else {
      $response = new ResponseAPI(2, "Thất bại");
      $response->send();
   }
}

function getMenus($systemRoleId)
{
   global $connect;

   $tableName = "systemmenu";
   $list = [];

   $query = "SELECT DISTINCT `$tableName`.`id`, `$tableName`.`routeName`, `$tableName`.`title`, `$tableName`.`isBase` 
      FROM `$tableName`, `systemrole_menu` 
      WHERE `systemrole_menu`.`systemRoleId` = '$systemRoleId' 
      AND `systemrole_menu`.`systemMenuId` = `$tableName`.`id`
      OR `$tableName`.`isBase` = 1
      AND `$tableName`.`deletedAt` IS NULL";
   $result = mysqli_query($connect, $query);

   if ($result) {
      while ($obj = $result->fetch_object()) {
         array_push($list, $obj);
      }
   }

   return $list;
}

function getFunctions($systemRoleId)
{
   global $connect;

   $tableName = "systemfunction";
   $list = [];

   $query = "SELECT DISTINCT `$tableName`.`id`, `$tableName`.`apiPath`, `$tableName`.`name`, `$tableName`.`description`, `$tableName`.`method`, `$tableName`.`isBase` 
      FROM `$tableName`, `systemrole_function` 
      WHERE `systemrole_function`.`systemRoleId` = '$systemRoleId' 
      AND `systemrole_function`.`systemFunctionId` = `$tableName`.`id`
      OR `$tableName`.`isBase` = 1
      AND `$tableName`.`deletedAt` IS NULL";
   $result = mysqli_query($connect, $query);

   if ($result) {
      while ($obj = $result->fetch_object()) {
         array_push($list, $obj);
      }
   }

   return $list;
}
