<template>
   <div class="card">
      <div class="card-header pb-0">
         <div class="row">
            <div class="col-md-12">
               <h6 class="mb-0 text-uppercase">Thêm menu</h6>
            </div>
            <div class="col-md-12 pt-3">
               <!-- routeName -->
               <label for="example-text-input" class="form-control-label">
                  Tên Route
                  <span class="star-input-required">*</span>
               </label>
               <argon-input
                  type="text"
                  placeholder="Nhập tên Route"
                  v-model="data.routeName"
               />
               <!-- title -->
               <label for="example-text-input" class="form-control-label">
                  Tiêu đề
                  <span class="star-input-required">*</span>
               </label>
               <argon-input
                  type="text"
                  placeholder="Nhập tiêu đề"
                  v-model="data.title"
               />
               <!-- isBase -->
               <label for="example-text-input" class="form-control-label">
                  Trạng thái Base
               </label>
               <argon-switch v-model="data.isBase">
                  {{ data.isBase ? "Có" : "Không" }}
               </argon-switch>
            </div>
         </div>
      </div>
      <div class="card-body pt-4 p-4">
         <div class="action-btns text-end">
            <argon-button
               color="success"
               size="sm"
               variant="gradient"
               class="action-btn me-4"
               @click="handleSubmit"
            >
               Lưu
            </argon-button>
            <argon-button
               color="warning"
               size="sm"
               variant="gradient"
               class="action-btn"
               @click="handleCloseDialog"
            >
               Hủy
            </argon-button>
         </div>
      </div>
   </div>
</template>

<script>
import { ElMessage } from "element-plus";
import ArgonInput from "@/components/ArgonInput.vue";
import ArgonButton from "@/components/ArgonButton.vue";
import ArgonSwitch from "@/components/ArgonSwitch.vue";

import * as API from "@/helpers/api.js";
const apiPath = process.env.VUE_APP_SERVER_PATH_API;
const apiGroup = "system_menu";

export default {
   name: "AddSystemMenuDialog",
   components: { ArgonButton, ArgonInput, ArgonSwitch },
   emits: ["onCloseDialog"],
   data() {
      return {
         data: {
            routeName: "",
            title: "",
            isBase: false,
         },
      };
   },
   methods: {
      validateBeforeSubmit() {
         if (this.data.routeName === "") {
            ElMessage({
               message: "Không được để trống tên Route",
               type: "warning",
            });

            return false;
         }

         if (this.data.title === "") {
            ElMessage({
               message: "Không nên để trống tiêu đề",
               type: "warning",
            });

            return false;
         }

         return true;
      },
      handleSubmit() {
         if (!this.validateBeforeSubmit()) return;

         return API.post(
            apiPath + `/${apiGroup}/add.php`,
            this.data,
            (data) => {
               if (data.code === 1) {
                  ElMessage({
                     message: data.message,
                     type: "success",
                  });

                  this.handleCloseDialog();
               } else {
                  ElMessage({
                     message: data.message,
                     type: "error",
                  });
               }
            }
         );
      },
      handleCloseDialog() {
         this.$emit("onCloseDialog", "add");
      },
   },
};
</script>

<style lang="scss" scoped>
@import "@/assets/scss/my_styles/table.scss";
</style>
