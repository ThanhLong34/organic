<template>
   <div class="blog-v2">
      <div class="blog-v2-img">
         <div class="blog-v2-time-top">
            09 <br />
            Thg.12
         </div>
         <img
            :src="`${require(`@/assets/images/blog/${blog.image}`)}`"
            alt="blog image"
         />
      </div>
      <div class="blog-v2-txt">
         <div class="blog-v2-row">
            <h6 class="blog-v2-author">
               <i class="fa-solid fa-circle-user"></i>
               Đăng bởi <span>Admin</span>
            </h6>
            <time class="blog-v2-time">
               <i class="fa-solid fa-calendar-days"></i>
               {{ blog.date }}
            </time>
         </div>
         <h6 class="blog-v2-title">
            <router-link
               :to="{
                  name: 'blog_details',
                  params: {
                     blogId: 1,
                     blogTitle: 'blog-title',
                  },
               }"
            >
               {{ blog.title }}
            </router-link>
         </h6>
         <p class="blog-v2-desc">
            {{ blog.description }}
         </p>
         <router-link
            :to="{
               name: 'blog_details',
               params: {
                  blogId: 1,
                  blogTitle: 'blog-title',
               },
            }"
         >
            <button-v-2>
               Đọc thêm
               <i class="fa-solid fa-arrow-right"></i>
            </button-v-2>
         </router-link>
      </div>
   </div>
</template>

<script>
/* eslint-disable */
import ButtonV2 from "@/components/ButtonV2.vue";

export default {
   name: "BlogV2Component",
   components: {
      ButtonV2,
   },
   props: {
      blog: Object,
   },
};
</script>

<style lang="scss" scoped>
@use "@/assets/scss/variables.scss" as *;

.blog-v2 {
   filter: $dropCardShadow;
   border-radius: 30px;

   &-row {
      display: flex;
      align-items: center;
      margin-bottom: 20px;
   }

   &-img {
      position: relative;

      img {
         border-top-left-radius: 30px;
         border-top-right-radius: 30px;
      }

      &::before {
         background: rgba(255, 255, 255, 0.2);
         bottom: 0;
         content: "";
         left: 50%;
         position: absolute;
         right: 51%;
         top: 0;
         opacity: 1;
         pointer-events: none;
         transition: all 400ms linear;
      }

      &:hover::before {
         left: 0;
         right: 0;
         opacity: 0;
         transition: all 400ms linear;
      }
   }

   &-txt {
      padding: 28px 24px;
      background-color: white;
      border-bottom-left-radius: 30px;
      border-bottom-right-radius: 30px;
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

   &-time-top {
      position: absolute;
      top: -32px;
      left: 26px;
      width: 70px;
      height: 70px;
      display: flex;
      justify-content: center;
      align-items: center;
      text-align: center;
      font-size: 18px;
      border-radius: 50%;
      font-weight: bold;
      background-color: #fff;
      box-shadow: $cardShadow;
   }

   &-title {
      a {
         display: block;
         font-size: 36px;
         line-height: 1.1;
         color: $darkTextColor;
         font-weight: bold;
         transition: color ease 0.5s;
         margin-bottom: 20px;

         &:hover {
            color: $primaryColor;
         }
      }
   }

   &-desc {
      font-size: 19px;
      line-height: 1.3;
      color: #656565;
      margin-bottom: 30px;
   }

   @media (max-width: $maxTablet) {
      &-title {
         a {
            font-size: 32px;
         }
      }

      &-desc {
         font-size: 18px;
      }
   }

   @media (max-width: 500px) {
      &-txt {
         padding: 22px 16px;
      }

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
         a {
            font-size: 28px;
         }
      }

      &-desc {
         font-size: 16px;
      }
   }
}
</style>
