<template>
   <div class="error-404">
      <TopPage :currentPage="'404'" />
      <div class="error-404-content">
         <p class="error-404-title">404</p>
         <p class="error-404-para">
            Liên kết bạn đã theo dõi có thể bị hỏng
            <br />
            hoặc trang đã bị xóa...
         </p>
         <router-link :to="{ name: 'home' }">
            <button-v-2>Về trang chủ</button-v-2>
         </router-link>
      </div>
   </div>
</template>

<script>

import TopPage from "@/components/TopPage.vue";
import ButtonV2 from "@/components/ButtonV2.vue";

export default {
   name: "Error404Page",
   components: {
      TopPage,
      ButtonV2,
   },
   setup() {},
};
</script>

<style lang="scss" scoped>
@use "@/assets/scss/variables.scss" as *;

.error-404 {
   &-content {
      padding: 60px 0 100px;
      text-align: center;
   }

   &-title {
      font-size: 260px;
      font-weight: bold;
      color: $primaryColor;
   }

   &-para {
      font-size: 38px;
      line-height: 1.2;
      color: #252525;
      font-weight: 400;
      margin-bottom: 50px;
   }
}
</style>
