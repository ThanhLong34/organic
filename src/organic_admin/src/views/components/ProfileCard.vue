<template>
   <div class="card card-profile">
      <img
         src="../../assets/img/dlu.jpg"
         alt="Image placeholder"
         class="card-img-top"
      />
      <div class="row justify-content-center">
         <div class="col-4 col-lg-4 order-lg-2">
            <div class="mt-n4 mt-lg-n6 mb-4 mb-lg-0">
               <div class="avatar-wrapper">
                  <img
                     :src="profile.avatarUrl ?? NoImage"
                     class="rounded-circle img-fluid border border-2 border-white avatar-circle"
                     style="
                        object-fit: cover;
                        object-position: top;
                        aspect-ratio: 1;
                     "
                  />
                  <input
                     ref="uploadAvatarInputRef"
                     type="file"
                     accept="image/*"
                     class="upload-avatar-input"
                     @change="handleUploadAvatar"
                  />
                  <button
                     type="button"
                     class="upload-avatar-btn"
                     @click="handleUploadAvatarClick"
                  >
                     <i class="ni ni-camera-compact"></i>
                  </button>
               </div>
            </div>
         </div>
      </div>
      <div class="card-header text-center border-0 pt-0 pt-lg-2 pb-4 pb-lg-3">
         <div class="d-flex justify-content-between">
            <a
               href="javascript:;"
               class="btn btn-sm btn-info mb-0 d-none d-lg-block"
               >Facebook</a
            >
            <a
               href="javascript:;"
               class="btn btn-sm btn-info mb-0 d-block d-lg-none"
            >
               <i class="ni ni-collection"></i>
            </a>
            <a
               href="javascript:;"
               class="btn btn-sm btn-dark float-right mb-0 d-none d-lg-block"
               >Zalo</a
            >
            <a
               href="javascript:;"
               class="btn btn-sm btn-dark float-right mb-0 d-block d-lg-none"
            >
               <i class="ni ni-email-83"></i>
            </a>
         </div>
      </div>
      <div class="card-body pt-0">
         <div class="row">
            <div class="col">
               <div class="d-flex justify-content-center">
                  <div class="d-grid text-center">
                     <span class="text-lg font-weight-bolder">99+</span>
                     <span class="text-sm opacity-8">Bạn bè</span>
                  </div>
                  <div class="d-grid text-center mx-4">
                     <span class="text-lg font-weight-bolder">99+</span>
                     <span class="text-sm opacity-8">Ảnh</span>
                  </div>
                  <div class="d-grid text-center">
                     <span class="text-lg font-weight-bolder">0</span>
                     <span class="text-sm opacity-8">Bình luận</span>
                  </div>
               </div>
            </div>
         </div>
         <div class="text-center mt-4">
            <h5>
               {{ profile.nickname }}
            </h5>
            <div class="h6 font-weight-300">
               <i class="ni location_pin mr-2"></i>{{ profile.systemRoleName }}
            </div>
            <div class="h6 mt-4">
               <i class="ni business_briefcase-24 mr-2"></i>
               DragonDev Organic-Food
            </div>
            <div><i class="ni education_hat mr-2"></i>CHÀO MỪNG BẠN</div>
         </div>
      </div>
   </div>
</template>

<script>
import { ElMessage } from "element-plus";
import * as API from "@/helpers/api.js";
const apiPath = process.env.VUE_APP_SERVER_PATH_API;
import * as SessionStorage from "@/helpers/session_storage.js";

import NoImage from "@/assets/img/no-image.jpg";

export default {
   name: "profile-card",
   props: {
      NoImage,
      profile: {
         type: Object,
      },
   },
   emits: ["onReloadAvatarUrl"],
   methods: {
      handleUploadAvatarClick() {
         const uploadAvatarInputRef = this.$refs["uploadAvatarInputRef"];
         uploadAvatarInputRef?.click();
      },
      handleUploadAvatar(e) {
         const image = e.target.files[0];
         if (image) {
            return API.uploadImage(
               apiPath + "/image/upload.php",
               image,
               (data) => {
                  if (data.code === 1) {
                     this.handleUpdateAvatar(data.data.id);
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
         }
      },
      handleUpdateAvatar($avatarId) {
         return API.put(
            apiPath + "/system_admin/update_avatar.php",
            {
               id: this.profile.id,
               avatarId: $avatarId,
            },
            (data) => {
               if (data.code === 1) {
                  ElMessage({
                     message: "Thay đổi ảnh đại diện thành công",
                     type: "success",
                  });

                  this.$store.state.accountLogin.avatarId = $avatarId;
                  SessionStorage.setAccountLogin(
                     this.$store.state.accountLogin
                  );
                  this.$emit("onReloadAvatarUrl");
               } else if (data.code === 2) {
                  ElMessage({
                     message: "Thay đổi ảnh đại diện thất bại",
                     type: "error",
                  });
               }
            }
         );
      },
   },
};
</script>

<style lang="scss" scoped>
.avatar-circle {
   margin-bottom: 12px;
   box-shadow: 0 0.3125rem 0.625rem 0 rgb(0 0 0 / 12%) !important;
}

.avatar-wrapper {
   position: relative;

   &:hover {
      .upload-avatar-btn {
         opacity: 1;
         bottom: 25%;
      }
   }
}

.upload-avatar-input {
   display: none;
}

.upload-avatar-btn {
   opacity: 0;
   position: absolute;
   bottom: 0;
   left: 50%;
   transform: translate(-50%, -50%);
   background-color: white;
   box-shadow: 0 0.3125rem 0.625rem 0 rgb(0 0 0 / 12%);
   border: 1px solid #ccc;
   transition: all 0.1s;
}
</style>
