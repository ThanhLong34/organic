<template>
   <div class="contact">
      <TopPage :currentPage="'Liên hệ'" />
      <div class="contact-map">
         <iframe
            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3903.287790240573!2d108.44201621522129!3d11.9545656396095!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x317112d959f88991%3A0x9c66baf1767356fa!2zVHLGsOG7nW5nIMSQ4bqhaSBI4buNYyDEkMOgIEzhuqF0!5e0!3m2!1svi!2s!4v1656916094966!5m2!1svi!2s"
            width="600"
            height="450"
            style="border: 0"
            allowfullscreen=""
            loading="lazy"
            referrerpolicy="no-referrer-when-downgrade"
         ></iframe>
      </div>
      <div class="contact-content">
         <div class="grid wide">
            <div class="row">
               <div class="col l-5 m-12 s-12">
                  <div class="contact-txt">
                     <h6 class="contact-heading">Liên hệ với chúng tôi</h6>
                     <p class="contact-para">
                        Hãy liên hệ để thảo luận về nhu cầu phúc lợi của nhân
                        viên của bạn ngay hôm nay. Vui lòng gọi cho chúng tôi,
                        gửi email cho chúng tôi hoặc điền vào biểu mẫu liên hệ
                        và chúng tôi sẽ phản hồi lại với bạn.
                     </p>
                     <address class="contact-address">
                        <div
                           class="contact-address-item contact-address-item-mail"
                        >
                           <i class="fa-solid fa-envelope"></i>
                           <p>dragondevshop@gmail.com</p>
                        </div>
                        <div class="contact-address-item">
                           <i class="fa-solid fa-phone"></i>
                           <p>035 329 2241 - Văn phòng chính</p>
                        </div>
                        <div class="contact-address-item">
                           <i class="fa-solid fa-location-dot"></i>
                           <p>TP Đà Lạt - Lâm Đồng</p>
                        </div>
                     </address>
                     <div class="contact-social">
                        <div class="contact-social-item">
                           <a href="https://vi-vn.facebook.com/">
                              <i class="fa-brands fa-facebook-f"></i>
                           </a>
                        </div>
                        <div class="contact-social-item">
                           <a href="https://www.instagram.com/">
                              <i class="fa-brands fa-instagram"></i>
                           </a>
                        </div>
                        <div class="contact-social-item">
                           <a href="https://www.linkedin.com/">
                              <i class="fa-brands fa-linkedin-in"></i>
                           </a>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="col l-7 m-12 s-12">
                  <div class="contact-form">
                     <h6 class="contact-heading">Gửi góp ý của bạn</h6>
                     <div class="contact-input-row">
                        <div class="row">
                           <div class="col l-6 m-12 s-12">
                              <label for="" class="form-label">
                                 Họ tên
                                 <span class="required">*</span>
                              </label>
                              <InputV1
                                 ref="fullnameRef"
                                 placeholder="Nhập họ tên"
                                 v-model="contact.fullname"
                              />
                           </div>
                           <div class="col l-6 m-12 s-12">
                              <label for="" class="form-label">
                                 Email
                                 <span class="required">*</span>
                              </label>
                              <InputV1
                                 ref="emailRef"
                                 placeholder="Nhập email"
                                 v-model="contact.email"
                              />
                           </div>
                        </div>
                     </div>
                     <label for="" class="form-label">
                        Chủ đề
                        <span class="required">*</span>
                     </label>
                     <InputV1
                        ref="subjectRef"
                        placeholder="Nhập chủ đề"
                        v-model="contact.subject"
                     />
                     <label for="" class="form-label">
                        Lời nhắn
                        <span class="required">*</span>
                     </label>
                     <TextAreaV1
                        ref="messageRef"
                        placeholder="Nhập lời nhắn"
                        v-model="contact.message"
                     />
                     <button-v-2 @click="handleSubmit">
                        Gửi góp ý
                        <i class="fa-solid fa-arrow-right"></i>
                     </button-v-2>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</template>

<script>
import { ref, reactive } from "vue";

import { ElNotification } from "element-plus";

import TopPage from "@/components/TopPage.vue";
import ButtonV2 from "@/components/ButtonV2.vue";
import InputV1 from "@/components/InputV1.vue";
import TextAreaV1 from "@/components/TextAreaV1.vue";

import * as API from "@/helpers/api.js";
const apiPath = process.env.VUE_APP_SERVER_PATH_API;

export default {
   name: "ContactPage",
   components: {
      TopPage,
      ButtonV2,
      InputV1,
      TextAreaV1,
   },
   setup(props) {
      const fullnameRef = ref(null);
      const emailRef = ref(null);
      const subjectRef = ref(null);
      const messageRef = ref(null);

      const contact = reactive({
         fullname: "",
         email: "",
         subject: "",
         message: "",
      });

      function handleDataProcessing() {
         // Chế biến lại dữ liệu

         if (typeof contact.fullname === "string") {
            contact.fullname = contact.fullname.trim();
         }

         if (typeof contact.email === "string") {
            contact.email = contact.email.trim();
         }

         if (typeof contact.subject === "string") {
            contact.subject = contact.subject.trim();
         }

         if (typeof contact.message === "string") {
            contact.message = contact.message.trim();
         }
      }

      function validateBeforeSubmit() {
         handleDataProcessing();

         if (contact.fullname === "") {
            ElNotification({
               title: "Cảnh báo",
               message: "Bạn chưa nhập họ tên",
               type: "warning",
            });

            return false;
         }

         if (contact.email === "") {
            ElNotification({
               title: "Cảnh báo",
               message: "Bạn chưa nhập email",
               type: "warning",
            });

            return false;
         }

         if (contact.subject === "") {
            ElNotification({
               title: "Cảnh báo",
               message: "Bạn chưa nhập chủ đề",
               type: "warning",
            });

            return false;
         }

         if (contact.message === "") {
            ElNotification({
               title: "Cảnh báo",
               message: "Bạn chưa nhập lời nhắn",
               type: "warning",
            });

            return false;
         }

         return true;
      }

      function handleSubmit() {
         if (!validateBeforeSubmit()) return;

         return API.post(apiPath + `/contact/add.php`, contact, (data) => {
            if (data.code === 1) {
               ElNotification({
                  title: "Thành công",
                  message: "Góp ý của bạn đã được gửi thành công",
                  type: "success",
               });

               // Reset value
               contact.fullname = "";
               contact.email = "";
               contact.subject = "";
               contact.message = "";

               fullnameRef.value.resetValue();
               emailRef.value.resetValue();
               subjectRef.value.resetValue();
               messageRef.value.resetValue();
            } else {
               ElNotification({
                  title: "Có lỗi",
                  message: data.message,
                  type: "error",
               });
            }
         });
      }

      return {
         contact,
         handleSubmit,
         fullnameRef,
         emailRef,
         subjectRef,
         messageRef,
      };
   },
};
</script>

<style lang="scss" scoped>
@use "@/assets/scss/variables.scss" as *;

.contact {
   &-map {
      iframe {
         width: 100%;
         height: 100%;
         min-height: 550px;
      }
   }

   &-content {
      padding: 100px 0 40px;
      color: $darkTextColor;
   }

   &-txt {
      margin-bottom: 80px;
   }

   &-heading {
      font-size: 38px;
      margin-bottom: 30px;
   }

   &-para {
      font-size: 20px;
      line-height: 1.3;
      color: #656565;
      margin-bottom: 40px;
   }

   &-address {
      &-item {
         display: flex;
         align-items: center;
         margin-bottom: 18px;

         i {
            margin-right: 22px;
            min-width: 55px;
            height: 55px;
            line-height: 57px;
            border-radius: 50%;
            background: $primaryColor;
            color: white;
            text-align: center;
         }

         p {
            font-size: 22px;
            font-weight: 700;
            line-height: 1.2;
         }

         &-mail {
            word-break: break-all;
         }
      }
   }

   &-social {
      display: flex;
      align-items: center;
      padding-top: 30px;

      &-item {
         a {
            display: inline-block;
            margin-right: 10px;
            min-width: 40px;
            height: 40px;
            line-height: 44px;
            border-radius: 50%;
            background: #e6e6e6;
            color: inherit;
            text-align: center;
            transition: all ease 0.4s;

            &:hover {
               background: $primaryColor;
               color: white;
            }
         }
      }
   }

   .button-v2 {
      display: block;
      height: 65px;
      line-height: 65px;
      margin-top: 12px;
   }

   @media (max-width: $maxTablet) {
      &-content {
         padding: 80px 0;
      }
   }

   @media (max-width: $maxMobile) {
      &-map {
         iframe {
            min-height: 400px;
         }
      }

      &-content {
         padding: 60px 0;
      }

      &-txt {
         margin-bottom: 60px;
      }

      &-heading {
         font-size: 30px;
         margin-bottom: 26px;
      }

      &-para {
         font-size: 18px;
         margin-bottom: 36px;
      }

      &-address {
         &-item {
            margin-bottom: 18px;

            i {
               margin-right: 18px;
               min-width: 45px;
               height: 45px;
               line-height: 47px;
            }

            p {
               font-size: 20px;
            }
         }
      }

      &-social {
         padding-top: 20px;
      }

      .button-v2 {
         margin-top: 22px;
         height: 55px;
         line-height: 55px;
      }
   }
}
</style>
