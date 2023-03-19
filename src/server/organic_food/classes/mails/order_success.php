<?php
require("../../classes/mails/mail.php");

class OrderSuccessMail extends Mail
{
   public function __construct($mailTo, $order)
   {
      $this->mailTo = $mailTo;
      $this->subject = "Đặt đơn hàng thành công cho đơn hàng có mã: #$order->id";
      $this->body = "
         <div>Thời gian đặt đơn hàng: <span style='color: #e6802e;'>$order->createdAt</span></div>
         <div>
            <span>ID (mã đơn hàng): </span>
            <span style='color: #c9223e;'>$order->id</span>
         </div>
         <div>
            <span>Họ tên: </span>
            <span style='color: #c9223e;'>$order->fullname</span>
         </div>
         <div>
            <span>Địa chỉ: </span>
            <span style='color: #c9223e;'>$order->streetAddress</span>
         </div>
         <div>
            <span>Thành phố: </span>
            <span style='color: #c9223e;'>$order->city</span>
         </div>
         <div>
            <span>Số điện thoại: </span>
            <span style='color: #c9223e;'>$order->phone</span>
         </div>
         <div>
            <span>Email: </span>
            <span style='color: #c9223e;'>$order->email</span>
         </div>
         <div>
            <span>Giá trị giảm (%): </span>
            <span style='color: #c9223e;'>$order->couponCodePercentValue&#37;</span>
         </div>
         <div>
            <span>Tiền vận chuyển: </span>
            <span style='color: #c9223e;'>$order->deliveryCost</span>
         </div>
         <div>
            <span>Tổng tiền: </span>
            <span style='color: #c9223e;'>$order->totalCost</span>
         </div>
         <div>
            <span>Tiền thanh toán: </span>
            <span style='color: #ff2398;'>$order->paymentCost</span>
         </div>
         <div>
            <p>Ghi chú đơn hàng: </p>
            <p style='color: #22995a;'>$order->notes</p>
         </div>
      ";
   }
}
