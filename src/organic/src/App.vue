<template>
   <!-- View Layout -->
   <Loader :class="{ hide: isHideLoader }" />
   <div
      :class="{
         'overlay-main': true,
         show: isShowOverlayMain,
      }"
      @click="handleHideOverlayMain"
   ></div>
   <GoToTopButton :isShowGoToTopBtn="isShowGoToTopBtn" />
   <MenuSidebar
      @closeMenuSidebar="handleCloseMenuSidebar"
      v-show="isOpenMenuSidebar"
   />
   <!-- Top Website -->
   <TopWebsite />
   <!-- Header -->
   <Header
      @openMenuSidebar="handleOpenMenuSidebar"
      @showOverlayMain="handleShowOverlayMain"
      @hideOverlayMain="handleHideOverlayMain"
      :isHideCategoryBox="!isShowOverlayMain"
   />
   <!-- Header fixed -->
   <div
      :class="{
         'header-fixed': true,
         show: isShowHeaderFixed,
      }"
   >
      <Header
         @openMenuSidebar="handleOpenMenuSidebar"
         @showOverlayMain="handleShowOverlayMain"
         @hideOverlayMain="handleHideOverlayMain"
         :isHideCategoryBox="!isShowOverlayMain"
      />
   </div>

   <!-- Router View -->
   <main class="router-view">
      <RouterView :key="$route.fullPath" />
   </main>

   <!-- Footer -->
   <Footer />
</template>

<script>
/* eslint-disable */
import Loader from "@/components/Loader.vue";
import TopWebsite from "@/components/TopWebsite.vue";
import GoToTopButton from "@/components/GoToTopButton.vue";
import Header from "@/components/Header.vue";
import MenuSidebar from "@/components/MenuSidebar.vue";
import Footer from "@/components/Footer.vue";

import { ref, watch, onMounted, computed } from "vue";
import { useStore } from "vuex";

export default {
   name: "App",
   components: {
      Loader,
      TopWebsite,
      GoToTopButton,
      Header,
      MenuSidebar,
      Footer,
   },
   setup() {
      const store = useStore();

      const isHideLoader = ref(false);
      const isShowGoToTopBtn = ref(false);
      const isShowHeaderFixed = ref(false);
      const isOpenMenuSidebar = ref(false);
      const isShowOverlayMain = ref(false);
      const scrTop = ref(0);

      // theo dõi sự thay đổi của hành động click vào các router link
      watch(
         () => store.getters.getRouterLinkClicked,
         () => {
            isOpenMenuSidebar.value = false;

            callLoaderScrollTop();

            // reset status
            store.dispatch("changeRouterLinkClicked", false);
         }
      );

      onMounted(() => {
         // callLoaderInit();
      });

      // gọi Loader Component khi mới đầu vào trang web
      function callLoaderInit() {
         // show loader
         isHideLoader.value = false;

         document.body.style.overflowY = "hidden";

         setTimeout(() => {
            isHideLoader.value = true;
            document.body.style.overflowY = "auto";
         }, 1200);
      }

      // gọi Loader Component khi chuyển router
      function callLoaderScrollTop() {
         // show loader
         isHideLoader.value = false;

         document.body.style.overflowY = "hidden";

         const inter = setInterval(() => {
            if (
               document.body.scrollTop === 0 ||
               document.documentElement.scrollTop === 0
            ) {
               isHideLoader.value = true;
               document.body.style.overflowY = "auto";
               clearInterval(inter);
            }
         }, 1000);
      }

      //todo: function handle window scroll
      (function handleWindowScroll() {
         window.onscroll = () => {
            scrTop.value =
               document.body.scrollTop || document.documentElement.scrollTop;
            //todo: show header fixed & show go to top button
            (() => {
               if (scrTop.value > 200) {
                  isShowGoToTopBtn.value = true; // show go to top button
                  isShowHeaderFixed.value = true; // show header fixed
               } else {
                  isShowGoToTopBtn.value = false; // hide go to top button
                  isShowHeaderFixed.value = false; // hide header fixed
               }
            })();
         };
      })();

      function handleCloseMenuSidebar() {
         isOpenMenuSidebar.value = false;
      }

      function handleOpenMenuSidebar() {
         isOpenMenuSidebar.value = true;
      }

      function handleShowOverlayMain() {
         isShowOverlayMain.value = true;
      }

      function handleHideOverlayMain() {
         isShowOverlayMain.value = false;
      }

      //todo: run sale time
      (function () {
         setInterval(() => {
            store.dispatch("decreaseSaleTime");
         }, 1000);
      })();

      return {
         isHideLoader,
         isShowGoToTopBtn,
         isShowHeaderFixed,
         isOpenMenuSidebar,
         isShowOverlayMain,
         handleCloseMenuSidebar,
         handleOpenMenuSidebar,
         handleShowOverlayMain,
         handleHideOverlayMain,
      };
   },
};
</script>

<style lang="scss">
@use "@/assets/scss/variables.scss" as *;
@import url("@/assets/scss/base.scss");
@import url("https://fonts.googleapis.com/css2?family=Signika:wght@300;400;500;600;700&display=swap");

#app {
   font-family: "Signika", sans-serif;
   -webkit-font-smoothing: antialiased;
   -moz-osx-font-smoothing: grayscale;
   min-height: 100%;
   width: 100vw;
   position: relative;
   /* user-select: none; */
}

* {
   &::selection {
      color: white;
      background-color: $primaryColor;
   }
}

body {
   &::-webkit-scrollbar {
      width: 5px;
   }

   &::-webkit-scrollbar-track {
      -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
      background-color: $bodyColor;
   }

   &::-webkit-scrollbar-thumb {
      border-radius: 20px;
      background-image: linear-gradient(45deg, #92c64e 0%, #4baf50 100%);
   }
}

.router-view {
   z-index: 0;
}

.header-fixed {
   position: fixed;
   top: -100px;
   left: 0;
   width: 100%;
   z-index: $zIHeader + 1;
   transition: all ease 0.3s;
   opacity: 0;

   &.show {
      top: 0;
      opacity: 1;
   }
}

.overlay-main {
   display: none;
   position: fixed;
   inset: 0;
   z-index: $zIHeader - 900;
   background-color: transparent;

   &.show {
      display: block;
   }
}

.primary-text {
   color: $primaryColor;

   &.bold {
      font-weight: bold;
   }
}

.align-start {
   align-items: flex-start !important;
}

/* Override Swiper navigation */
.swiper-button-next,
.swiper-button-prev {
   width: 30px !important;
   height: 30px !important;
   border-radius: 50% !important;
   color: white !important;
   background-image: linear-gradient(360deg, #92c64e, #4baf50) !important;
   box-shadow: 0 1px 12px rgb(0 0 0 / 25%);
   &::after {
      font-size: 12px !important;
      font-weight: bold !important;
   }
}

//? CUSTOMIZE ELEMENT UI PLUS
.el-dialog {
   border-radius: 1rem !important;
}

.el-overlay {
   z-index: 9999 !important;
}

.el-popper {
   z-index: 9000 !important;
}

.el-message,
.el-notification {
   z-index: 10000 !important;
}

.el-checkbox {
   margin-bottom: 0;
   margin-left: 0;

   &:hover {
      color: #409eff;
   }
}

.el-select__popper {
   z-index: 10001 !important;
}

.el-drawer__header {
   margin-bottom: 8px !important;
}

.content-render {
   * {
      font-size: 1.2rem;
   }

   p + p {
      padding: 10px 0;
   }

   ul {
      list-style-type: disc;
      padding: 14px 18px;
   }

   li + li {
      margin-top: 10px;
   }
}
</style>
