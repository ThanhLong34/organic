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
                           backgroundImage: `url(${blog.featureImageUrl})`,
                        }"
                     >
                        <div class="blog-details-top-txt">
                           <div class="blog-details-row">
                              <h6 class="blog-details-author">
                                 <i class="fa-solid fa-circle-user"></i>
                                 Đăng bởi
                                 <span>{{ blog.systemAdminNickname }}</span>
                              </h6>
                              <time class="blog-details-time">
                                 <i class="fa-solid fa-calendar-days"></i>
                                 {{ blog.createdAt }}
                              </time>
                           </div>
                           <h5 class="blog-details-title">
                              {{ blog.title }}
                           </h5>
                        </div>
                     </div>
                     <div
                        ref="contentRef"
                        class="blog-details-body content-render"
                     ></div>
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
                                    v-for="item in blogListNew"
                                    :key="item.id"
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

import TopPage from "@/components/TopPage.vue";
import Author from "@/components/Author.vue";
import BlogV1 from "@/components/BlogV1.vue";

//#region Slider Swiper
// Import Swiper Vue.js components
import { Swiper, SwiperSlide } from "swiper/vue";
// import required modules
import { Autoplay } from "swiper";
//#endregion

import { ref, reactive, onBeforeMount, onMounted, watch } from "vue";

import { useRoute } from "vue-router";

import * as API from "@/helpers/api.js";
const apiPath = process.env.VUE_APP_SERVER_PATH_API;

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
      const route = useRoute();

      const modulesSwiper = [Autoplay];
      const contentRef = ref(null);

      const blogListNew = ref([]);

      const blog = ref({});
      blog.value.id = +route.params.id;

      function getBlog() {
         return API.get(
            apiPath + `/blog/get_item.php`,
            {
               id: blog.value.id,
            },
            (data) => {
               if (data.code === 1) {
                  blog.value = {
                     ...data.data,
                     id: +data.data.id,
                  };
               }
            }
         );
      }

      function getBlogListNew() {
         return API.get(
            apiPath + `/blog/get_list.php`,
            {
               limit: 4,
               offset: 0,
               reverse: true,
            },
            (data) => {
               if (data.code === 1) {
                  blogListNew.value = data.data.map((item) => ({
                     ...item,
                     id: +item.id,
                  }));
               }
            }
         );
      }

      onBeforeMount(() => {
         getBlog();
         getBlogListNew();
      });

		watch(blog, () => {
			contentRef.value.innerHTML = blog.value.content;
		});

      return {
         modulesSwiper,
         contentRef,
         blog,
         blogListNew,
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
