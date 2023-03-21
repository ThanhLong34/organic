<template>
   <div class="contact-mail">
      <div class="grid wide">
         <div class="row">
            <div class="col l-4 m-12 s-12">
               <div class="contact-mail-txt">
                  <p class="contact-mail-title">ĐỪNG BỎ LỠ ƯU ĐÃI NÀY</p>
                  <p class="contact-mail-heading">
                     ƯU ĐÃI <br />
                     LỚN &amp; GIẢM GIÁ
                  </p>
                  <p class="contact-mail-para">
                     Đăng ký để nhận mã giảm giá -20%
                  </p>
               </div>
            </div>
            <div class="col l-8 m-12 s-12">
               <div class="contact-mail-send-wrap">
                  <input
                     type="text"
                     class="contact-mail-input"
                     placeholder="Nhập email của bạn"
                     v-model="email"
                  />
                  <button-v-2 @click="() => !isClickedSubmit && handleSubmit()" :disable="isClickedSubmit">
                     {{ isClickedSubmit ? "Vui lòng chờ..." : "Đăng ký ngay" }}
                     <i class="fa-solid fa-angles-right"></i>
                  </button-v-2>
               </div>
            </div>
         </div>
      </div>
   </div>
</template>

<script>

import { ref } from "vue";

import ButtonV2 from "@/components/ButtonV2.vue";
import { ElNotification } from "element-plus";

import * as API from "@/helpers/api.js";
const apiPath = process.env.VUE_APP_SERVER_PATH_API;

export default {
   name: "SubscribeMailComponent",
   components: {
      ButtonV2,
   },
   setup() {
      const email = ref("");
      const isClickedSubmit = ref(false);

      function handleDataProcessing() {
         // Chế biến lại dữ liệu

         if (typeof email.value === "string") {
            email.value = email.value.trim();
         }
      }

      function validateBeforeSubmit() {
         handleDataProcessing();

         if (email.value === "") {
            ElNotification({
               title: "Cảnh báo",
               message: "Bạn chưa nhập email",
               type: "warning",
            });

            return false;
         }

         return true;
      }

      function handleSubmit() {
         if (!validateBeforeSubmit()) return;

         return API.post(
            apiPath + `/subscribe/add.php`,
            {
               email: email.value,
            },
            (data) => {
               if (data.code === 1) {
                  handleSendMailCouponCode();
               } else {
                  ElNotification({
                     title: "Có lỗi",
                     message: data.message,
                     type: "error",
                  });
               }
            }
         );
      }

      function handleSendMailCouponCode() {
         isClickedSubmit.value = true;

         const couponCode = "wtCrhTjWZdKC";

         ElNotification({
            title: "Thông báo",
            message: "Đang gửi mail, vui lòng chờ",
            type: "info",
         });

         return API.post(
            apiPath + `/mail/send_customize.php`,
            {
               mailTo: email.value,
               subject: "Gửi tặng bạn yêu mã giảm giá khi đăng ký",
               body: `Mã giảm giá: <span style='color: #ff0d3d;'>${couponCode}</span>. Lưu ý mã chỉ áp dụng cho 1 lần đặt đơn hàng.`,
            },
            (data) => {
               if (data.code === 1) {
                  ElNotification({
                     title: "Đăng ký thành công",
                     message: "Bạn hãy kiểm tra email",
                     type: "success",
                  });
               } else {
                  ElNotification({
                     title: "Có lỗi",
                     message: data.message,
                     type: "error",
                  });
               }

               isClickedSubmit.value = false;
            }
         );
      }

      return {
         email,
         isClickedSubmit,
         handleSubmit,
      };
   },
};
</script>

<style lang="scss" scoped>
@use "@/assets/scss/variables.scss" as *;

.contact-mail {
   .row {
      margin-left: 0;
      margin-right: 0;
      padding: 90px 30px 60px;
      background-position: 30% center;
      border-radius: 18px;
      background: url("@/assets/images/contact_mail/bg.jpg") no-repeat center
         center/cover;
      align-items: center;
      box-shadow: $cardShadow;
   }

   &-title {
      color: $primaryColor;
      font-size: 22px;
   }

   &-heading {
      color: white;
      font-size: 36px;
      font-weight: bold;
      margin: 12px 0;
      line-height: 1.2;
   }

   &-para {
      color: $primaryColor;
      font-size: 18px;
      line-height: 1.4;
   }

   &-send-wrap {
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      padding-left: 4%;
   }

   &-input {
      display: block;
      width: 100%;
      max-width: 500px;
      margin-bottom: 20px;
      border-radius: 50px;
      height: 65px;
      line-height: 65px;
      font-size: 20px;
      font-weight: 500;
      padding: 0 40px;
      background: #fbfbfb;
      z-index: 2;
      border: 4px solid white;
      -webkit-transition: all ease 400ms;
      box-shadow: 0 3px 20px -1px rgb(0 0 0 / 18%);
      color: $primaryColor;
   }

   .button-v2 {
      width: 100%;
      max-width: 500px;
      height: 65px;
      line-height: 65px;
      font-size: 22px;
   }

   @media (max-width: $maxTablet) {
      .row {
         padding: 62px 0 50px;
         background-position: 72% center;
      }

      &-txt {
         margin-bottom: 40px;
         text-align: center;
      }

      &-send-wrap {
         padding-left: 0;
      }

      &-title {
         font-size: 26px;
      }

      &-heading {
         color: $darkTextColor;
         font-size: 42px;
      }

      &-para {
         font-size: 24px;
      }
   }

   @media (max-width: $maxMobile) {
      .row {
         padding: 50px 15px 28px;
         background-position: 72% center;
      }

      &-txt {
         margin-bottom: 22px;
      }

      &-title {
         font-size: 18px;
      }

      &-heading {
         font-size: 32px;
      }

      &-para {
         font-size: 18px;
      }

      &-input {
         height: 55px;
         line-height: 55px;
      }

      .button-v2 {
         height: 55px;
         line-height: 55px;
      }
   }
}
</style>
