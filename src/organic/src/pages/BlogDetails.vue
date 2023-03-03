<template>
   <div class="blog-details">
      <TopPage :currentPage="'Blog Details'" />

      <div class="blog-details-content">
         <div class="grid wide">
            <div class="row">
               <div class="col l-9 m-8 s-12">
                  <div class="blog-details-main">
                     <div
                        class="blog-details-top"
                        :style="{
                           backgroundImage: `url(${require('@/assets/images/blog_details/exp.jpg')})`,
                        }"
                     >
                        <div class="blog-details-top-txt">
                           <div class="blog-details-row">
                              <h6 class="blog-details-author">
                                 <i class="fa-solid fa-circle-user"></i>
                                 Đăng bởi <span>Admin</span>
                              </h6>
                              <time class="blog-details-time">
                                 <i class="fa-solid fa-calendar-days"></i>
                                 20/05/2023
                              </time>
                           </div>
                           <h5 class="blog-details-title">
                              Easy way to Build a Perfect Agency Website.
                           </h5>
                        </div>
                     </div>
                     <div class="blog-details-body">
                        <p>
                           Morbi mollis vestibulum sollicitudin. Nunc in eros a
                           justo facilisis rutrum. Aenean id ullamcorper libero.
                           Vestibulum imperdiet nibh vel magna lacinia ultrices.
                           Sed id interdum urna.
                        </p>
                        <img
                           src="@/assets/images/blog_details/exp1.jpg"
                           alt="image"
                        />
                        <p>
                           Nam ac elit a ante commodo tristique. Duis lacus
                           urna, condimentum a vehicula a, hendrerit ac nisi
                           Lorem ipsum dolor sit amet, consectetur adipiscing
                           elit. Aliquam vulputate, tortor nec commodo
                           ultricies, vitae viverra urna nulla sed turpis.
                           Nullam lacinia faucibus risus, a euismod lorem
                           tincidunt id.
                        </p>
                        <a href="#">This is link</a>
                     </div>
                  </div>
               </div>
               <div class="col l-3 m-4 s-12">
                  <!-- about admin -->
                  <Author />
               </div>
               <div class="col l-12 m-12 s-12">
                  <div class="blog-details-new">
                     <div class="row">
                        <div class="col l-12 m-12 s-12">
                           <div class="blog-details-new-title">
                              <h5>Bài viết mới</h5>
                           </div>
                        </div>
                        <div class="col l-12 m-12 s-12">
                           <div>
                              <swiper
                                 :speed="600"
                                 :loop="true"
                                 :spaceBetween="25"
                                 :autoplay="{
                                    delay: 2000,
                                    disableOnInteraction: false,
                                    pauseOnMouseEnter: true,
                                 }"
                                 :breakpoints="{
                                    0: {
                                       slidesPerView: 1,
                                    },
                                    450: {
                                       slidesPerView: 2,
                                    },
                                    740: {
                                       slidesPerView: 3,
                                    },
                                    1024: {
                                       slidesPerView: 4,
                                    },
                                 }"
                                 :modules="modulesSwiper"
                              >
                                 <swiper-slide
                                    v-for="(item, index) in blogs"
                                    :key="index"
                                 >
                                    <BlogV1 :blog="item" />
                                 </swiper-slide>
                              </swiper>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</template>

<script>
/* eslint-disable */
import TopPage from "@/components/TopPage.vue";
import Author from "@/components/Author.vue";
import BlogV1 from "@/components/BlogV1.vue";

//#region Slider Swiper
// Import Swiper Vue.js components
import { Swiper, SwiperSlide } from "swiper/vue";
// import required modules
import { Autoplay } from "swiper";
//#endregion

import { reactive } from "vue";

export default {
   name: "BlogDetailsPage",
   components: {
      TopPage,
      Author,
      BlogV1,
      Swiper,
      SwiperSlide,
   },
   setup() {
      const modulesSwiper = [Autoplay];
      const blogs = reactive([
         {
            image: "exp.jpg",
            date: "20/05/2023",
            title: "Food industry leaders often change",
         },
         {
            image: "exp2.jpg",
            date: "20/05/2023",
            title: "Strategy for Norway's Peion Fund Global",
         },
         {
            image: "exp3.jpg",
            date: "20/05/2023",
            title: "Strategy for Norway's Peion Fund Global",
         },
         {
            image: "exp4.jpg",
            date: "20/05/2023",
            title: "Strategy for Norway's Peion Fund Global",
         },
         {
            image: "exp2.jpg",
            date: "20/05/2023",
            title: "Strategy for Norway's Peion Fund Global",
         },
      ]);

      return {
         modulesSwiper,
         blogs,
      };
   },
};
</script>

<style lang="scss" scoped>
@use "@/assets/scss/variables.scss" as *;

.blog-details {
   &-main {
      box-shadow: $cardShadow;
      border-radius: 20px;
      background-color: white;
   }

   &-top {
      position: relative;
      width: 100%;
      padding-top: 70%;
      background-size: cover;
      background-position: center;
      background-repeat: no-repeat;
      background-color: white;
      border-radius: 20px 20px 0 0;
      overflow: hidden;

      &::after {
         position: absolute;
         z-index: 1;
         inset: 0;
         content: "";
         background: rgba(0, 0, 0, 0.2);
      }

      &-txt {
         position: absolute;
         z-index: 2;
         bottom: 0;
         padding: 20px;
         color: white;
      }
   }

   &-row {
      display: flex;
      align-items: center;
      margin-bottom: 20px;
   }

   &-content {
      padding: 50px 0;
   }

   &-author {
      font-size: 18px;
      font-weight: 600;
      margin-right: 24px;

      i {
         color: $primaryColor;
         margin-right: 5px;
         font-size: 20px;
         position: relative;
         top: 1px;
      }
   }

   &-time {
      display: inline-block;
      font-size: 18px;
      font-weight: 600;

      i {
         color: $primaryColor;
         margin-right: 5px;
         font-size: 20px;
         position: relative;
         top: 1px;
      }
   }

   &-title {
      display: block;
      font-size: 36px;
      line-height: 1.1;
      font-weight: bold;
      transition: color ease 0.5s;
   }

   &-body {
      border-radius: 0 0 20px 20px;
      padding: 30px;
      color: $darkTextColor;
      background-color: white;

      *,
      *::before,
      *::after {
         font-size: 18px;
      }

      h1,
      h2,
      h3,
      h4,
      h5,
      h6,
      p,
      strong,
      div,
      span,
      a {
         display: inline-block;
         line-height: 1.2;
         font-size: 18px;
         margin: 8px 0;
      }

      a {
         text-decoration: none;
         color: $primaryColor;
      }

      img {
         width: 100%;
         height: auto;
         margin: 12px auto;
         object-fit: contain;
         object-position: center;
      }
   }

   &-new {
      padding: 100px 0 50px;

      &-title {
         text-align: center;
         margin-bottom: 50px;

         h5 {
            color: $darkTextColor;
            font-size: 38px;
            line-height: 1.2;
            font-weight: bold;
         }
      }
   }

   @media (max-width: $maxTablet) {
      &-content {
         padding: 50px 0 0;
      }

      &-title {
         font-size: 26px;
      }
   }

   @media (max-width: $maxMobile) {
      &-title {
         font-size: 24px;
      }

      .author {
         margin-top: 100px;
      }

      &-body {
         padding: 18px;
      }
   }

   @media (max-width: 500px) {
      &-row {
         align-items: flex-start;
         flex-direction: column;
      }

      &-author {
         font-size: 15px;
         margin-right: 0;
         margin-bottom: 10px;

         i {
            top: 2px;
         }
      }

      &-time {
         font-size: 15px;

         i {
            top: 2px;
         }
      }

      &-title {
         font-size: 22px;
      }
   }
}
</style>
