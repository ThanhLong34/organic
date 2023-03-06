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
   return preg_match("/^[0-9]{10}$/", $phone);
}

function validateEmail($email)
{
   return filter_var($email, FILTER_VALIDATE_EMAIL);
}
