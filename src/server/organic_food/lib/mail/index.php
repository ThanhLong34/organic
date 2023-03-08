<?php
include "../../lib/mail/PHPMailer/src/PHPMailer.php";
include "../../lib/mail/PHPMailer/src/Exception.php";
include "../../lib/mail/PHPMailer/src/OAuth.php";
include "../../lib/mail/PHPMailer/src/POP3.php";
include "../../lib/mail/PHPMailer/src/SMTP.php";

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

function sendMail($mailTo, $subject, $message)
{
   $mail = new PHPMailer(true);                             // Passing `true` enables exceptions
   $mail->CharSet = "UTF-8";

   try {

      //Server settings
      $mail->SMTPDebug = 0;                                 // Enable verbose debug output
      $mail->isSMTP();                                      // Set mailer to use SMTP
      $mail->Host = 'smtp.gmail.com';  // Specify main and backup SMTP servers
      $mail->SMTPAuth = true;                               // Enable SMTP authentication
      $mail->Username = 'dragondevshop@gmail.com';                 // SMTP username
      $mail->Password = 'mqthesuvmsbyraxj';                           // SMTP password, Password App
      $mail->SMTPSecure = 'tls';                            // Enable TLS encryption, `ssl` also accepted
      $mail->Port = 587;                                    // TCP port to connect to

      //Recipients
      $mail->setFrom('dragondevshop@gmail.com', 'Mailer');
      $mail->addAddress($mailTo, 'Client');     // Add a recipient
      // $mail->addAddress('2014468@dlu.edu.vn');               // Name is optional
      // $mail->addReplyTo('info@example.com', 'Information');
      // $mail->addCC('dragondevshop@gmail.com');
      // $mail->addBCC('bcc@example.com');

      //Attachments
      // $mail->addAttachment('/var/tmp/file.tar.gz');         // Add attachments
      // $mail->addAttachment('/tmp/image.jpg', 'new.jpg');    // Optional name

      //Content
      $mail->isHTML(true);                                  // Set email format to HTML
      $mail->Subject = $subject;
      $mail->Body    = $message;
      // $mail->AltBody = 'This is the body in plain text for non-HTML mail clients';

      $mail->send();
      return true;
   } catch (Exception $e) {
      // echo 'Message could not be sent. Mailer Error: ', $mail->ErrorInfo;
      return false;
   }
}
