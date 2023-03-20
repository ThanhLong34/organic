<template>
   <div class="about">
      <TopPage :currentPage="'Giới thiệu'" />

      <div class="about-content">
         <!-- about -->
         <section class="about-section">
            <div class="grid wide">
               <div class="row">
                  <div class="col l-6 m-6 s-12">
                     <div class="about-section-img">
                        <img
                           src="@/assets/images/about/about_bg.png"
                           alt="image"
                        />
                     </div>
                  </div>
                  <div class="col l-6 m-6 s-12">
                     <div class="about-section-txt">
                        <div class="section-title">
                           <p>THỰC PHẨM HỮU CƠ</p>
                           <h5>Sự lựa chọn tuyệt vời cho sức khỏe của bạn</h5>
                        </div>
                        <p class="about-section-para">
                           Thực phẩm hữu cơ là thực phẩm được sản xuất theo
                           phương pháp tuân thủ các tiêu chuẩn của canh tác hữu
                           cơ. Các tiêu chuẩn khác nhau trên toàn thế giới,
                           nhưng canh tác hữu cơ có các thực hành xoay vòng các
                           nguồn lực, thúc đẩy cân bằng sinh thái và bảo tồn đa
                           dạng sinh học.
                        </p>
                        <ul class="about-section-feature-list">
                           <li class="about-section-feature-item">
                              <i class="fa-solid fa-circle-check"></i>
                              100% tự nhiên
                           </li>
                           <li class="about-section-feature-item">
                              <i class="fa-solid fa-circle-check"></i>
                              Tăng sức đề kháng
                           </li>
                           <li class="about-section-feature-item">
                              <i class="fa-solid fa-circle-check"></i>
                              Không sử dụng Hormone tăng trưởng
                           </li>
                        </ul>
                        <button-v-2>
                           Cửa hàng
                           <i class="fa-solid fa-arrow-right"></i>
                        </button-v-2>
                     </div>
                  </div>
               </div>
            </div>
         </section>
         <!-- category -->
         <section class="category-section">
            <div class="grid wide">
               <div class="row">
                  <div class="col l-12 m-12 s-12">
                     <div class="section-title">
                        <p>Thực phẩm hữu cơ</p>
                        <h5>Những gì chúng tôi cung cấp cho bạn</h5>
                     </div>
                  </div>
                  <div class="col l-3 m-6 s-6">
                     <div
                        class="category-section-item"
                        :style="{
                           backgroundImage: `url(${require('@/assets/images/about/category_1.png')})`,
                        }"
                     >
                        <p class="category-section-item-name">Rau củ</p>
                     </div>
                  </div>
                  <div class="col l-3 m-6 s-6">
                     <div
                        class="category-section-item"
                        :style="{
                           backgroundImage: `url(${require('@/assets/images/about/category_2.png')})`,
                        }"
                     >
                        <p class="category-section-item-name">Trái cây tươi</p>
                     </div>
                  </div>
                  <div class="col l-3 m-6 s-6">
                     <div
                        class="category-section-item"
                        :style="{
                           backgroundImage: `url(${require('@/assets/images/about/category_3.png')})`,
                        }"
                     >
                        <p class="category-section-item-name">Gia vị</p>
                     </div>
                  </div>
                  <div class="col l-3 m-6 s-6">
                     <div
                        class="category-section-item"
                        :style="{
                           backgroundImage: `url(${require('@/assets/images/about/category_4.png')})`,
                        }"
                     >
                        <p class="category-section-item-name">Thực phẩm khô</p>
                     </div>
                  </div>
               </div>
            </div>
         </section>
         <!-- solution -->
         <section class="solution-section">
            <div class="grid wide">
               <div class="row">
                  <div class="col l-12 m-12 s-12">
                     <div class="solution-section-content">
                        <p class="solution-section-ques">
                           BẠN CẦN GIÚP ĐIỀU GÌ KHÔNG?
                        </p>
                        <h5 class="solution-section-heading">
                           Giải đáp thắc mắc
                           <br />
                           <span>100% thành công</span>
                        </h5>
                     </div>
                  </div>
               </div>
            </div>
         </section>
         <!-- statistical -->
         <section class="statistical-section" ref="statisticalSection">
            <Statistical />
         </section>
         <!-- offer -->
         <section class="offer-section">
            <div class="grid wide">
               <div class="row">
                  <div class="col l-6 m-6 s-12">
                     <div class="offer-section-img">
                        <img
                           src="@/assets/images/about/offer_img.png"
                           alt="image"
                        />
                     </div>
                  </div>
                  <div class="col l-6 m-6 s-12">
                     <div class="offer-section-txt">
                        <div class="section-title">
                           <p>THỰC PHẨM HỮU CƠ 100% CHÍNH HÃNG</p>
                           <h5>
                              Luôn đem đến chất lượng tốt nhất tới khách hàng
                           </h5>
                        </div>
                        <ul class="offer-section-feature-list">
                           <li class="offer-section-feature-item">
                              <div class="offer-section-feature-item-icon">
                                 <img
                                    src="@/assets/images/about/security.svg"
                                    alt="icon"
                                 />
                              </div>
                              <div class="offer-section-feature-item-txt">
                                 <h6 class="offer-section-feature-item-heading">
                                    100% thanh toán an toàn
                                 </h6>
                                 <p class="offer-section-feature-item-para">
                                    Chúng tôi đảm bảo an toàn tuyệt đối việc
                                    thanh toán của bạn.
                                 </p>
                              </div>
                           </li>
                           <li class="offer-section-feature-item">
                              <div class="offer-section-feature-item-icon">
                                 <img
                                    src="@/assets/images/about/fresh.svg"
                                    alt="icon"
                                 />
                              </div>
                              <div class="offer-section-feature-item-txt">
                                 <h6 class="offer-section-feature-item-heading">
                                    Sản phẩm hoàn toàn tươi mới
                                 </h6>
                                 <p class="offer-section-feature-item-para">
                                    Tất cả sản phẩm của chúng tôi đã được kiểm
                                    nghiệm chặt chẽ và an toàn đến người tiêu
                                    dùng.
                                 </p>
                              </div>
                           </li>
                           <li class="offer-section-feature-item">
                              <div class="offer-section-feature-item-icon">
                                 <img
                                    src="@/assets/images/about/squad.svg"
                                    alt="icon"
                                 />
                              </div>
                              <div class="offer-section-feature-item-txt">
                                 <h6 class="offer-section-feature-item-heading">
                                    Bỏ hoặc hủy bất cứ lúc nào sản phẩm bị hư
                                    hại
                                 </h6>
                                 <p class="offer-section-feature-item-para">
                                    Chúng tôi sẵn sàng bỏ hoặc hủy những sản
                                    phẩm đã bị hư hại. Vì sự an toàn của người
                                    dùng.
                                 </p>
                              </div>
                           </li>
                        </ul>
                     </div>
                  </div>
               </div>
            </div>
         </section>
         <!-- team -->
         <section class="team-section">
            <div class="grid wide">
               <div class="row">
                  <div class="col l-12 m-12 s-12">
                     <div class="section-title">
                        <p>ĐỘI NGŨ CHUYÊN GIA</p>
                        <h5>Thành viên xuất sắc</h5>
                     </div>
                  </div>
                  <div class="col l-3 m-6 s-12">
                     <div class="team-section-item">
                        <div class="team-section-item-avatar">
                           <img
                              src="@/assets/images/about/huerose.png"
                              alt="avatar"
                           />
                        </div>
                        <h6 class="team-section-item-name">Huế Rose</h6>
                        <p class="team-section-item-role">TESTER</p>
                     </div>
                  </div>
                  <div class="col l-3 m-6 s-12">
                     <div class="team-section-item">
                        <div class="team-section-item-avatar">
                           <img
                              src="@/assets/images/about/ngocanh.png"
                              alt="avatar"
                           />
                        </div>
                        <h6 class="team-section-item-name">Ngọc Ánh</h6>
                        <p class="team-section-item-role">FRONTEND-DEV</p>
                     </div>
                  </div>
                  <div class="col l-3 m-6 s-12">
                     <div class="team-section-item">
                        <div class="team-section-item-avatar">
                           <img
                              src="@/assets/images/about/dunlok.png"
                              alt="avatar"
                           />
                        </div>
                        <h6 class="team-section-item-name">Dun Lok</h6>
                        <p class="team-section-item-role">FULLSTACK-DEV</p>
                     </div>
                  </div>
                  <div class="col l-3 m-6 s-12">
                     <div class="team-section-item">
                        <div class="team-section-item-avatar">
                           <img
                              src="@/assets/images/about/sonsoixam.png"
                              alt="avatar"
                           />
                        </div>
                        <h6 class="team-section-item-name">Phạm Sơn</h6>
                        <p class="team-section-item-role">DESIGNER</p>
                     </div>
                  </div>
               </div>
            </div>
         </section>
         <!-- contact mail -->
         <section class="contact-mail-section">
            <SubscribeMail />
         </section>
      </div>
   </div>
</template>

<script>
/* eslint-disable */
import TopPage from "@/components/TopPage.vue";
import ButtonV2 from "@/components/ButtonV2.vue";
import Statistical from "@/components/Statistical.vue";
import SubscribeMail from "@/components/SubscribeMail.vue";

export default {
   name: "AboutPage",
   components: {
      TopPage,
      ButtonV2,
      Statistical,
      SubscribeMail,
   },
   setup() {
      return {};
   },
};
</script>

<style lang="scss" scoped>
@use "@/assets/scss/variables.scss" as *;

@keyframes animateOfferImage {
   0% {
      transform: translateY(-10px);
   }
   50% {
      transform: translateY(10px);
   }
   100% {
      transform: translateY(-10px);
   }
}

.about {
   &-content {
      background: url("@/assets/images/home/bodybg.png") no-repeat left center
         $bodyColor;
   }

   .section-title {
      text-align: center;
      margin-bottom: 30px;

      p {
         color: $primaryColor;
         font-size: 18px;
         text-transform: uppercase;
         margin-bottom: 12px;
      }

      h5 {
         color: $darkTextColor;
         font-size: 38px;
         line-height: 1.2;
         font-weight: bold;
      }
   }

   @media (max-width: $maxMobile) {
      .section-title {
         p {
            font-size: 16px;
            margin-bottom: 10px;
         }

         h5 {
            font-size: 30px;
         }
      }
   }
}

.about-section {
   padding: 100px 0 50px;

   .section-title {
      text-align: left;
      margin-bottom: 0;
   }

   &-txt {
      padding-left: 20px;
   }

   &-para {
      margin: 20px 0;
      font-size: 18px;
      line-height: 1.3;
      color: #656565;
   }

   &-feature-list {
      display: flex;
      flex-direction: column;
   }

   &-feature-item {
      width: fit-content;
      padding: 12px 12px;
      border-radius: 20px;
      font-weight: bold;
      color: #5e5e5e;
      background: #f4f4f4;
      box-shadow: $cardShadow;

      & + & {
         margin-top: 12px;
      }

      i {
         color: $primaryColor;
         margin-right: 5px;
         position: relative;
      }
   }

   .button-v2 {
      margin-top: 40px;
   }

   @media (max-width: $maxTablet) {
      .button-v2 {
         margin-top: 30px;
      }
   }

   @media (max-width: $maxMobile) {
      &-img {
         margin-bottom: 60px;
      }
   }
}

.category-section {
   padding: 100px 0 80px;
   text-align: center;

   &-item {
      padding-top: 100%;
      width: 100%;
      border-radius: 20px;
      box-shadow: $cardShadow;
      background-position: center;
      background-repeat: no-repeat;
      background-size: contain;
      background-color: white;
      margin-bottom: 40px;
      position: relative;

      &:hover &-name {
         color: white;
         background-color: $primaryColor;
      }

      &-name {
         position: absolute;
         bottom: -20px;
         left: 50%;
         transform: translateX(-50%);
         padding: 12px 30px;
         background: #e7efd3;
         color: $darkTextColor;
         font-weight: 600;
         font-size: 18px;
         border-radius: 40px;
         width: max-content;
         box-shadow: 0 2px 6px -1px rgb(0 0 0 / 14%);
         transition: all ease 0.5s;
      }
   }

   @media (max-width: $maxMobile) {
      &-item {
         &-name {
            padding: 12px 24px;
            font-size: 16px;
         }
      }
   }

   @media (max-width: 400px) {
      &-item {
         &-name {
            padding: 10px 20px;
            font-size: 14px;
         }
      }
   }
}

.solution-section {
   background: url("@/assets/images/about/solution_bg.jpg") no-repeat;
   background-position: center;
   background-size: cover;
   padding: 200px 0;
   position: relative;

   &::after {
      position: absolute;
      left: 0;
      top: 0;
      width: 100%;
      height: 100%;
      content: "";
      background: rgba(13, 13, 13, 0.58);
      z-index: 1;
   }

   &-content {
      padding-left: 120px;
      position: relative;
      z-index: 2;
   }

   &-ques {
      font-size: 24px;
      color: $primaryColor;
      text-transform: uppercase;
      text-shadow: 0 1px rgb(0 0 0 / 18%);
   }

   &-heading {
      font-size: 50px;
      font-weight: 800;
      margin-top: 24px;
      color: white;
      text-shadow: 0 1px rgb(0 0 0 / 18%);
      line-height: 1.2;

      span {
         color: $primaryColor;
      }
   }

   @media (max-width: $maxMobile) {
      padding: 100px 0;

      &-content {
         padding-left: 0px;
      }

      &-ques {
         font-size: 18px;
      }

      &-heading {
         font-size: 32px;
         margin-top: 18px;
      }
   }
}

.statistical-section {
   background-image: url("@/assets/images/about/statistical_bg.jpg");
   .statistical {
      background-image: none;
      padding: 100px 0 60px;
   }
}

.offer-section {
   padding: 100px 0;

   .section-title {
      text-align: left;
   }

   .row {
      align-items: center;
   }

   &-img {
      background-image: url("@/assets/images/about/offer_bg.png");
      background-position: center;
      background-size: contain;
      background-repeat: no-repeat;

      img {
         position: relative;
         left: 20%;
         top: 60px;
         animation: animateOfferImage linear 3s infinite;
         max-width: 450px;
         width: calc(100% - 120px);
      }
   }

   &-txt {
      padding-left: 10px;
   }

   &-feature-item {
      display: flex;
      align-items: center;

      & + & {
         margin-top: 36px;
      }

      &-icon {
         margin-right: 20px;
         background-color: white;
         padding: 20px;
         border-radius: 50%;
         box-shadow: $cardShadow;

         img {
            width: 38px;
            height: 38px;
         }
      }

      &-txt {
         color: $darkTextColor;
      }

      &-heading {
         font-size: 22px;
         line-height: 1.2;
         margin-bottom: 8px;
      }

      &-para {
         color: #646464;
         font-size: 18px;
         line-height: 1.2;
      }
   }

   @media (max-width: $maxTablet) {
      &-img {
         img {
            top: 40px;
         }
      }

      &-feature-item {
         align-items: flex-start;
      }
   }

   @media (max-width: $maxMobile) {
      &-img {
         margin-bottom: 50px;

         img {
            top: 58px;
         }
      }

      &-feature-item {
         & + & {
            margin-top: 24px;
         }

         &-icon {
            padding: 16px;

            img {
               width: 32px;
               height: 32px;
            }
         }

         &-heading {
            font-size: 20px;
         }

         &-para {
            font-size: 16px;
         }
      }
   }

   @media (max-width: 450px) {
      &-img {
         img {
            top: 38px;
            left: 22%;
         }
      }
   }

   @media (max-width: 350px) {
      &-img {
         img {
            left: 24%;
            top: 25px;
         }
      }
   }
}

.team-section {
   padding: 100px 0 60px;
   background: url("@/assets/images/about/team_bg.png") no-repeat center
      center/cover #f8f8f8;

   &-item {
      margin-bottom: 40px;
      padding: 0 12px;
      text-align: center;

      &-avatar {
         filter: $dropCardShadow;
         max-width: 400px;
         margin: 0 auto;

         img {
            border-radius: 50%;
         }
      }

      &-name {
         font-size: 24px;
         color: $darkTextColor;
         margin: 18px 0 12px;
      }

      &-role {
         font-size: 18px;
         color: #9298a3;
         text-transform: uppercase;
      }
   }
}

.contact-mail-section {
   padding: 100px 0;
}
</style>
