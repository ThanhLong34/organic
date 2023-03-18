<?php
require("../../lib/mail/sendmail.php");

class Mail {
   public $mailTo;
   public $subject;
   public $body;
   
   public function send() {
      return sendMail($this->mailTo, $this->subject, $this->body);
   }
}
