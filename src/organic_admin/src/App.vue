<!--
=========================================================
* Vue Argon Dashboard 2 - v3.0.0
=========================================================

* Product Page: https://creative-tim.com/product/vue-argon-dashboard
* Copyright 2022 Creative Tim (https://www.creative-tim.com)

Coded by www.creative-tim.com

=========================================================

* The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
-->
<template>
   <div
      v-show="this.$store.state.layout === 'landing'"
      class="landing-bg h-100 bg-gradient-primary position-fixed w-100"
   ></div>
   <sidenav
      :custom_class="this.$store.state.mcolor"
      :class="[
         this.$store.state.isTransparent,
         this.$store.state.isRTL ? 'fixed-end' : 'fixed-start',
      ]"
      v-if="this.$store.state.showSidenav"
   />
   <main
      class="
         main-content
         position-relative
         max-height-vh-100
         h-100
         border-radius-lg
      "
   >
      <!-- nav -->
      <navbar
         :class="[navClasses]"
         :textWhite="
            this.$store.state.isAbsolute ? 'text-white opacity-8' : 'text-white'
         "
         :minNav="navbarMinimize"
         v-if="this.$store.state.showNavbar"
      />
      <router-view />
      <app-footer v-show="this.$store.state.showFooter" />
      <configurator
         :toggle="toggleConfigurator"
         :class="[
            this.$store.state.showConfig ? 'show' : '',
            this.$store.state.hideConfigButton ? 'd-none' : '',
         ]"
      />
   </main>
</template>
<script>
import Sidenav from "./examples/Sidenav";
import Configurator from "@/examples/Configurator.vue";
import Navbar from "@/examples/Navbars/Navbar.vue";
import AppFooter from "@/examples/Footer.vue";
import { mapMutations } from "vuex";

export default {
   name: "App",
   components: {
      Sidenav,
      Configurator,
      Navbar,
      AppFooter,
   },
   methods: {
      ...mapMutations(["toggleConfigurator", "navbarMinimize"]),
   },
   computed: {
      navClasses() {
         return {
            "position-sticky bg-white left-auto top-2 z-index-sticky":
               this.$store.state.isNavFixed && !this.$store.state.darkMode,
            "position-sticky bg-default left-auto top-2 z-index-sticky":
               this.$store.state.isNavFixed && this.$store.state.darkMode,
            "position-absolute px-4 mx-0 w-100 z-index-2":
               this.$store.state.isAbsolute,
            "px-0 mx-4": !this.$store.state.isAbsolute,
         };
      },
   },
   beforeMount() {
      this.$store.state.isTransparent = "bg-transparent";
   },
};
</script>

<style lang="scss">
body,
div, aside {
   &::-webkit-scrollbar {
      width: 5px;
      height: 5px;
   }

   &::-webkit-scrollbar-track {
      -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
      background-color: white;
   }

   &::-webkit-scrollbar-thumb {
      border-radius: 20px;
      background-image: linear-gradient(45deg, #2dce89 0%, #2dcecc 100%);
   }
}

.el-select {
   width: 100%;
   .el-input__wrapper {
      border-radius: 0.5rem;
      padding: 5px 12px !important;
   }
}

.el-select .select-trigger .el-input.is-focus .el-input__wrapper {
   box-shadow: 0 0 0 1px #5e72e4 inset !important;
}

.el-select .select-trigger .el-input .el-input__wrapper {
   box-shadow: 0 0 0 1px #d2d6da inset !important;
}

.project-upload-avatar-images {
   .el-upload-list.el-upload-list--picture-card {
      li.el-upload-list__item:first-child {
         border-style: dashed;
         border-color: #5e72e4;
      }
   }
}

span.star-input-required {
   color: orangered;
}

.text-pink {
   color: rgb(255, 35, 152) !important;
}

.el-dialog {
   border-radius: 1rem !important;
}

.avatar.avatar-sm.rounded-circle {
   margin-left: 8px;
}

.el-overlay {
   z-index: 99999 !important;
}
</style>
