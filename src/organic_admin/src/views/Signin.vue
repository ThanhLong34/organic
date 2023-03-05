<template>
   <div class="container top-0 position-sticky z-index-sticky">
      <div class="row">
         <div class="col-12">
            <navbar
               isBlur="blur  border-radius-lg my-3 py-2 start-0 end-0 mx-4 shadow"
               v-bind:darkMode="true"
               isBtn="bg-gradient-success"
            />
         </div>
      </div>
   </div>
   <main class="mt-0 main-content">
      <section>
         <div class="page-header min-vh-100">
            <div class="container">
               <div class="row">
                  <div
                     class="mx-auto col-xl-4 col-lg-5 col-md-7 d-flex flex-column mx-lg-0"
                  >
                     <div class="card card-plain">
                        <div class="pb-0 card-header text-start">
                           <h4 class="font-weight-bolder">Đăng nhập</h4>
                           <p class="mb-0">Nhập tên đăng nhập và mật khẩu.</p>
                        </div>
                        <div class="card-body">
                           <form action="" @submit.prevent="login">
                              <div class="mb-3">
                                 <argon-input
                                    type="text"
                                    placeholder="Tên đăng nhập"
                                    size="lg"
                                    v-model="accountInfo.username"
                                    isRequired
                                 />
                              </div>
                              <div class="mb-3">
                                 <argon-input
                                    type="password"
                                    placeholder="Mật khẩu"
                                    size="lg"
                                    v-model="accountInfo.password"
                                    isRequired
                                 />
                              </div>
                              <!-- <argon-switch id="rememberMe"
                                 >Ghi nhớ tài khoản</argon-switch
                              > -->
                              <div class="text-center">
                                 <argon-button
                                    class="mt-3"
                                    variant="gradient"
                                    color="success"
                                    fullWidth
                                    size="lg"
                                    >Đăng nhập</argon-button
                                 >
                              </div>
                           </form>
                        </div>
                     </div>
                  </div>
                  <div
                     class="top-0 my-auto text-center col-6 d-lg-flex d-none h-100 pe-0 position-absolute end-0 justify-content-center flex-column"
                  >
                     <div
                        class="position-relative bg-gradient-primary h-100 m-3 px-7 border-radius-lg d-flex flex-column justify-content-center overflow-hidden"
                        :style="{
                           backgroundImage: `url('${require(`@/assets/img/signin_bg.jpg`)}')`,
                           backgroundSize: 'cover',
                        }"
                     >
                        <span class="mask bg-gradient-success opacity-2"></span>
                        <h4
                           class="mt-5 text-white font-weight-bolder position-relative"
                        >
                           "Nothing is impossible."
                        </h4>
                        <p class="text-white position-relative">
                           Không gì là không thể.
                        </p>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </section>
   </main>
</template>

<script>
import * as SessionStorage from "@/helpers/session_storage.js";
import * as API from "@/helpers/api.js";

import Navbar from "@/examples/PageLayout/Navbar.vue";
import ArgonInput from "@/components/ArgonInput.vue";
// import ArgonSwitch from "@/components/ArgonSwitch.vue";
import ArgonButton from "@/components/ArgonButton.vue";

import { ElMessage } from "element-plus";

const body = document.getElementsByTagName("body")[0];
const apiPath = process.env.VUE_APP_SERVER_PATH_API;

export default {
   name: "signin",
   components: {
      Navbar,
      ArgonInput,
      ArgonButton,
   },
   data() {
      return {
         accountInfo: {
            username: "",
            password: "",
         },
      };
   },
   methods: {
      login() {
         return API.post(
            apiPath + "/system_admin/login.php",
            this.accountInfo,
            (data) => {
               if (data.code === 1) {
                  ElMessage({
                     message: "Đăng nhập thành công",
                     type: "success",
                  });

                  const accountLogin = {
                     ...data.data,
                     id: +data.data.id,
                     avatarId: +data.data.avatarId,
                     systemRoleId: +data.data.systemRoleId,
                  };

                  this.$store.dispatch("setAccountLogin", accountLogin);
                  SessionStorage.setAccountLogin(accountLogin);

                  // Chuyển về trang Dashboard
                  this.$router.push({ name: "/" });
               } else if (data.code === 2) {
                  ElMessage({
                     message: "Sai tên đăng nhập hoặc mật khẩu",
                     type: "error",
                  });
               }
            },
            (error) => {
               ElMessage({
                  message: "Có lỗi, thử lại sau",
                  type: "error",
               });
               console.error(error);
            }
         );
      },
   },
   created() {
      this.$store.state.hideConfigButton = true;
      this.$store.state.showNavbar = false;
      this.$store.state.showSidenav = false;
      this.$store.state.showFooter = false;

      this.$store.dispatch("setAccountLogin", null);
      SessionStorage.setAccountLogin(null);

      body.classList.remove("bg-gray-100");
   },
   beforeUnmount() {
      this.$store.state.hideConfigButton = false;
      this.$store.state.showNavbar = true;
      this.$store.state.showSidenav = true;
      this.$store.state.showFooter = true;
      body.classList.add("bg-gray-100");
   },
};
</script>
