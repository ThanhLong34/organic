<template>
   <div class="card bg-transparent shadow-xl">
      <div
         class="overflow-hidden position-relative border-radius-xl"
         :style="{
            backgroundImage:
               'url(' + require('../../assets/img/card-visa.jpg') + ')',
         }"
      >
         <span class="mask bg-gradient-dark"></span>
         <div class="card-body position-relative z-index-1 p-3">
            <div class="text-info">
               <i class="fas fa-wifi p-2" aria-hidden="true"></i>
               <span>VIETCOMBANK</span>
            </div>
            <h5 class="text-white mt-4 mb-5 pb-2 card-number">
               101&nbsp;&nbsp;&nbsp;697&nbsp;&nbsp;&nbsp;0194
            </h5>
            <div class="d-flex">
               <div class="d-flex">
                  <div :class="this.$store.state.isRTL ? 'ms-4' : 'me-4'">
                     <p class="text-white text-sm opacity-8 mb-0">
                        TÊN NGƯỜI DÙNG
                     </p>
                     <h6 class="text-white mb-0">NGUYEN THANH LONG</h6>
                  </div>
                  <div>
                     <p class="text-white text-sm opacity-8 mb-0">HẠN THẺ</p>
                     <h6 class="text-white mb-0">26/10</h6>
                  </div>
               </div>
               <div
                  class="w-20 d-flex align-items-end justify-content-end"
                  :class="this.$store.state.isRTL ? 'me-auto' : 'ms-auto'"
               >
                  <argon-avatar class="w-60 mt-2" :img="img1" alt="logo" />
               </div>
            </div>
         </div>
      </div>
   </div>
</template>

<script>
import ArgonAvatar from "@/components/ArgonAvatar.vue";
import img from "../../assets/img/card-visa.jpg";
import img1 from "../../assets/img/logos/mastercard.png";

export default {
   name: "master-card",
   components: {
      ArgonAvatar,
   },
   data() {
      return {
         img,
         img1,
      };
   },
};
</script>

<style lang="scss" scoped>
.card-number {
   font-size: 2.85rem;
   padding-bottom: 0 !important;
   margin-bottom: 1.5rem !important;
   margin-top: 1.1rem !important;
}
</style>
