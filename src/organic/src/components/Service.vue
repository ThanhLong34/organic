<template>
   <div class="service">
      <div class="grid wide">
         <div class="row">
            <div class="col l-3 m-6 s-12">
               <div class="service-item">
                  <div class="service-item-img">
                     <img
                        src="@/assets/images/shop/service_1.jpg"
                        alt="service image"
                     />
                  </div>
                  <div class="service-item-txt">
                     <h6 class="service-item-name">MIỄN PHÍ VẬN CHUYỂN</h6>
                     <p class="service-item-desc">
                        Miễn phí vận chuyển cho tất cả đơn hàng
                     </p>
                  </div>
               </div>
            </div>
            <div class="col l-3 m-6 s-12">
               <div class="service-item">
                  <div class="service-item-img">
                     <img
                        src="@/assets/images/shop/service_2.jpg"
                        alt="service image"
                     />
                  </div>
                  <div class="service-item-txt">
                     <h6 class="service-item-name">PHIẾU QUÀ TẶNG</h6>
                     <p class="service-item-desc">
                        30% cơ hội nhận phiếu quà tặng khi mua hàng
                     </p>
                  </div>
               </div>
            </div>
            <div class="col l-3 m-6 s-12">
               <div class="service-item">
                  <div class="service-item-img">
                     <img
                        src="@/assets/images/shop/service_3.jpg"
                        alt="service image"
                     />
                  </div>
                  <div class="service-item-txt">
                     <h6 class="service-item-name">HOÀN TRẢ SẢN PHẨM</h6>
                     <p class="service-item-desc">
                        Hoàn trả sản phẩm khi không đúng yêu cầu
                     </p>
                  </div>
               </div>
            </div>
            <div class="col l-3 m-6 s-12">
               <div class="service-item">
                  <div class="service-item-img">
                     <img
                        src="@/assets/images/shop/service_4.jpg"
                        alt="service image"
                     />
                  </div>
                  <div class="service-item-txt">
                     <h6 class="service-item-name">THANH TOÁN AN TOÀN</h6>
                     <p class="service-item-desc">
                        Thanh toán tiền mặt an toàn và tiện lợi
                     </p>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</template>

<script>

export default {
   name: "ServiceComponent",
};
</script>

<style lang="scss" scoped>
@use "@/assets/scss/variables.scss" as *;

.service {
   padding: 50px 0;

   &-item {
      display: flex;
      margin-bottom: 28px;

      &-img {
         margin-right: 14px;
         min-width: fit-content;
      }

      &-txt {
         color: $darkTextColor;
      }

      &-name {
         font-size: 18px;
         margin-bottom: 8px;
      }

      &-desc {
         font-size: 16px;
         font-weight: 500;
         line-height: 1.2;
      }
   }
}
</style>
