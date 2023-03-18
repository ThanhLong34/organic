<?php
require("../../classes/mails/mail.php");

class ResetPasswordSystemAdminMail extends Mail
{
   public function __construct($mailTo, $newPassword)
   {
      $this->mailTo = $mailTo;
      $this->subject = "Lấy lại mật khẩu";
      $this->body = "Mật khẩu mới là: $newPassword";
   }
}
