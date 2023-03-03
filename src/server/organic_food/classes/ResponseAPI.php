<?php
class ResponseAPI
{
   public $code, $message, $data;

   public function __construct($code = 0, $message = '', $data = null)
   {
      $this->code = $code;
      $this->message = $message;
      $this->data = $data;
   }

   public function send() {
      echo(json_encode($this));
   }
}
