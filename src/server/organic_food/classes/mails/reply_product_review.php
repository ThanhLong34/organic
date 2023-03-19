<?php
require("../../classes/mails/mail.php");

class ReplyProductReviewMail extends Mail
{
   public function __construct($mailTo, $productReview, $replyMessage)
   {
      $this->mailTo = $mailTo;
      $this->subject = "Phản hồi từ đánh giá sản phẩm của: $productReview->fullname";
      $this->body = "
         <div>Thời gian gửi đánh giá: <span style='color: #e6802e;'>$productReview->createdAt</span></div>
         <div>Đánh giá của bạn: <span style='color: #ffa500;'>$productReview->rating sao</span></div>
         <div>
            <p>Nội dung bình luận của bạn:</p>
            <p style='color: #c9223e;'>$productReview->comment</p>
         </div>
         <div>
            <p>Phản hồi từ chúng tôi:</p>
            <p style='color: #22995a;'>$replyMessage</p>
         </div>
      ";
   }
}
