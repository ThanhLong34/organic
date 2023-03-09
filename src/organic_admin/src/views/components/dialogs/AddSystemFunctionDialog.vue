<template>
   <div class="card">
      <div class="card-header pb-0">
         <div class="row">
            <div class="col-md-12">
               <h6 class="mb-0 text-uppercase">Thêm chức năng</h6>
            </div>
            <div class="col-md-12 pt-3">
               <!-- name -->
               <label for="example-text-input" class="form-control-label">
                  Tên chức năng
                  <span class="star-input-required">*</span>
               </label>
               <argon-input
                  type="text"
                  placeholder="Nhập tên chức năng. VD: AddAccount"
                  v-model="data.name"
               />
               <!-- description -->
               <label for="example-text-input" class="form-control-label">
                  Mô tả
               </label>
               <argon-input
                  type="text"
                  placeholder="Nhập mô tả"
                  v-model="data.description"
               />
               <!-- apiPath -->
               <label for="example-text-input" class="form-control-label">
                  Đường dẫn API
               </label>
               <argon-input
                  type="text"
                  placeholder="Nhập đường dẫn API. VD: account/add.php"
                  v-model="data.apiPath"
               />
               <!-- method -->
               <label for="example-text-input" class="form-control-label">
                  Phương thức
               </label>
               <argon-input
                  type="text"
                  placeholder="Nhập phương thức. VD: GET, POST"
                  v-model="data.method"
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
const apiGroup = "system_function";

export default {
   name: "AddSystemFunctionDialog",
   components: { ArgonButton, ArgonInput, ArgonSwitch },
   emits: ["onCloseDialog"],
   data() {
      return {
         data: {
            name: "",
            description: "",
            apiPath: "",
            method: "",
            isBase: false,
         },
      };
   },
   methods: {
      handleDataProcessing() {
         // Chế biến lại dữ liệu

         if (typeof this.data.name === "string") {
            this.data.name = this.data.name.trim();
         }

         if (typeof this.data.description === "string") {
            this.data.description = this.data.description.trim();
         }

         if (typeof this.data.apiPath === "string") {
            this.data.apiPath = this.data.apiPath.trim();
         }

         if (typeof this.data.method === "string") {
            this.data.method = this.data.method.trim();
         }
      },
      validateBeforeSubmit() {
         this.handleDataProcessing();

         if (this.data.name === "") {
            ElMessage({
               message: "Không được để trống tên chức năng",
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
