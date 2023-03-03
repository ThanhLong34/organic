<template>
   <nav class="navigator">
      <div class="navigator-link">
         <router-link :to="{ name: 'home' }">
            <i class="fa-solid fa-house-chimney" v-if="icons"></i>
            Trang chủ
         </router-link>
      </div>
      <div class="navigator-link">
         <router-link
            :to="{ name: 'shop', params: { categoryName: 'category-name' } }"
         >
            <i class="fa-solid fa-shop" v-if="icons"></i>
            Cửa hàng
         </router-link>
      </div>
      <div class="navigator-link">
         <router-link :to="{ name: 'blog' }">
            <i class="fa-solid fa-book" v-if="icons"></i>
            Bài viết
         </router-link>
      </div>
      <div class="navigator-link">
         <router-link :to="{ name: 'about' }">
            <i class="fa-solid fa-circle-exclamation" v-if="icons"></i>
            Giới thiệu
         </router-link>
      </div>
      <div class="navigator-link">
         <router-link :to="{ name: 'contact' }">
            <i class="fa-solid fa-circle-question" v-if="icons"></i>
            Liên hệ
         </router-link>
      </div>
   </nav>
</template>

<script>
/* eslint-disable */
export default {
   name: "NavigatorComponent",
   props: {
      icons: {
         type: Boolean,
         default: false,
      },
   },
   setup() {},
};
</script>

<style lang="scss" scoped>
@use "@/assets/scss/variables.scss" as *;

.navigator {
   display: flex;
   justify-content: center;
   align-items: center;
   &-link {
      & + & {
         margin-left: 10px;
      }

      a {
         font-size: 20px;
         font-weight: bold;
         color: $lightTextColor;
         padding: 10px 20px;
         border-radius: 40px;
         background-color: transparent;
         transition: all ease 0.4s;

         &:hover {
            background-color: $primaryColor;
         }
      }

      i {
         min-width: 24px;
         margin-right: 4px;
         display: inline-flex;
         justify-content: center;
         align-items: center;
      }
   }

   .router-link-active {
      background-color: $primaryColor;
   }
}

@media (max-width: 1140px) {
   .navigator-link a {
      font-size: 15px;
   }
}
</style>
