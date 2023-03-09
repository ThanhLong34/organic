<?php
function getJSONPayloadRequest()
{
   $data = json_decode(trim(file_get_contents("php://input")), true);
   return $data;
}

function generateRandomString($length = 10)
{
   $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
   $charactersLength = strlen($characters);
   $randomString = '';
   for ($i = 0; $i < $length; $i++) {
      $randomString .= $characters[random_int(0, $charactersLength - 1)];
   }
   return $randomString;
}

function getCurrentDatetime()
{
   date_default_timezone_set('Asia/Ho_Chi_Minh');
   return date('H:i:s d/m/Y');
}

function validatePhoneNumber($phone)
{
   return preg_match("/^[0-9]{10,11}$/", $phone);
}

function validateEmail($email)
{
   return filter_var($email, FILTER_VALIDATE_EMAIL);
}

function checkPermissionFunction($functionName)
{
   global $connect;

   $headers = apache_request_headers();

   if ($headers != null && isset($headers["system-role-id"])) {
      $systemRoleId = $headers["system-role-id"];

      $systemFunctionTableName = "systemfunction";
      $systemRoleFunctionTableName = "systemrole_function";

      $query = "SELECT * FROM `$systemFunctionTableName`, `$systemRoleFunctionTableName`
         WHERE `$systemRoleFunctionTableName`.`systemRoleId` = $systemRoleId
         AND `$systemRoleFunctionTableName`.`systemFunctionId` = `$systemFunctionTableName`.`id`
         AND `$systemFunctionTableName`.`name` = '$functionName'
         AND `$systemFunctionTableName`.`isBase` = 0 LIMIT 1";

      $result = mysqli_query($connect, $query);

      if ($result && mysqli_num_rows($result) > 0) {
         return true;
      }
   }

   $response = new ResponseAPI(10, "Không được quyền sử dụng chức năng $functionName");
   $response->send();

   return false;
}
