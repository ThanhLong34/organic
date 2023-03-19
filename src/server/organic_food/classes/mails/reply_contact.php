<?php
require("../../classes/mails/mail.php");

class ReplyContactMail extends Mail
{
   public function __construct($mailTo, $contact, $replyMessage)
   {
      $this->mailTo = $mailTo;
      $this->subject = "Phản hồi từ liên hệ của: $contact->fullname";
      $this->body = "
         <div>Thời gian gửi liên hệ: <span style='color: #e6802e;'>$contact->createdAt</span></div>
         <div>
            <p>Nội dung liên hệ của bạn:</p>
            <p style='color: #c9223e;'>$contact->message</p>
         </div>
         <div>
            <p>Phản hồi từ chúng tôi:</p>
            <p style='color: #22995a;'>$replyMessage</p>
         </div>
      ";
   }
}
