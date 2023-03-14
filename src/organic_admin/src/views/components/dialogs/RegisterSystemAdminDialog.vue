<template>
   <div class="card">
      <div class="card-header pb-0">
         <div class="row">
            <div class="col-md-12">
               <h6 class="mb-0 text-uppercase">Thêm admin</h6>
            </div>
         </div>
      </div>
      <div class="card-body pt-3 p-4">
         <div class="col-md-12">
            <!-- username -->
            <label for="example-text-input" class="form-control-label">
               Tên đăng nhập
               <span class="star-input-required">*</span>
            </label>
            <argon-input
               type="text"
               placeholder="Nhập tên đăng nhập, viết liền không dấu. VD: admin123"
               v-model="data.username"
            />
            <!-- password -->
            <label for="example-text-input" class="form-control-label">
               Mật khẩu
               <span class="star-input-required">*</span>
            </label>
            <argon-input
               type="text"
               placeholder="Nhập mật khẩu"
               v-model="data.password"
            />
            <!-- nickname -->
            <label for="example-text-input" class="form-control-label">
               Biệt danh
               <span class="star-input-required">*</span>
            </label>
            <argon-input
               type="text"
               placeholder="Nhập biệt danh"
               v-model="data.nickname"
            />
            <!-- email -->
            <label for="example-text-input" class="form-control-label">
               Email
               <span class="star-input-required">*</span>
            </label>
            <argon-input
               type="text"
               placeholder="Nhập email"
               v-model="data.email"
            />
            <!-- phone -->
            <label for="example-text-input" class="form-control-label">
               Số điện thoại
               <span class="star-input-required">*</span>
            </label>
            <argon-input
               type="text"
               placeholder="Nhập số điện thoại"
               v-model="data.phone"
            />
            <!-- systemRoleId -->
            <div class="selection-wrap">
               <label for="example-text-input" class="form-control-label"
                  >Vai trò <span class="star-input-required">*</span></label
               >
               <el-select
                  v-model="data.systemRoleId"
                  filterable
                  placeholder="Chọn vai trò"
               >
                  <el-option
                     v-for="item in systemRoleList"
                     :key="item.id"
                     :label="item.name"
                     :value="item.id"
                  />
               </el-select>
            </div>
         </div>
         <div class="col-md-12 pt-3">
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
   </div>
</template>

<script>
import { ElMessage } from "element-plus";
import ArgonInput from "@/components/ArgonInput.vue";
import ArgonButton from "@/components/ArgonButton.vue";

import * as API from "@/helpers/api.js";
const apiPath = process.env.VUE_APP_SERVER_PATH_API;
const apiGroup = "system_admin";

export default {
   name: "RegisterSystemAdminDialog",
   components: { ArgonButton, ArgonInput },
   emits: ["onCloseDialog"],
   data() {
      return {
         data: {
            username: "",
            password: "",
            nickname: "",
            email: "",
            phone: "",
            systemRoleId: null,
         },
         systemRoleList: [],
      };
   },
   methods: {
      getSystemRoleList() {
         return API.get(apiPath + `/system_role/get_list.php`, {}, (data) => {
            if (data.code === 1) {
               this.systemRoleList = data.data.map((i) => ({
                  ...i,
                  id: +i.id,
               }));

               // Not found data
               if (data.data.length === 0) {
                  ElMessage({
                     message: "Không có dữ liệu danh sách vai trò",
                     type: "warning",
                  });
               }
            } else {
               ElMessage({
                  message: data.message,
                  type: "error",
               });
            }
         });
      },
      handleDataProcessing() {
         // Chế biến lại dữ liệu

         if (typeof this.data.username === "string") {
            this.data.username = this.data.username.trim();
         }

         if (typeof this.data.password === "string") {
            this.data.password = this.data.password.trim();
         }

         if (typeof this.data.nickname === "string") {
            this.data.nickname = this.data.nickname.trim();
         }

         if (typeof this.data.email === "string") {
            this.data.email = this.data.email.trim();
         }

         if (typeof this.data.phone === "string") {
            this.data.phone = this.data.phone.trim();
         }
      },
      validateBeforeSubmit() {
         this.handleDataProcessing();

         if (this.data.username === "") {
            ElMessage({
               message: "Không được để trống tên đăng nhập",
               type: "warning",
            });

            return false;
         }

         if (this.data.password === "") {
            ElMessage({
               message: "Không được để trống mật khẩu",
               type: "warning",
            });

            return false;
         }

         if (this.data.nickname === "") {
            ElMessage({
               message: "Không được để trống biệt danh",
               type: "warning",
            });

            return false;
         }

         if (this.data.email === "") {
            ElMessage({
               message: "Không được để trống email",
               type: "warning",
            });

            return false;
         }

         if (this.data.phone === "") {
            ElMessage({
               message: "Không được để trống số điện thoại",
               type: "warning",
            });

            return false;
         }

         if (this.data.systemRoleId === null) {
            ElMessage({
               message: "Bạn phải chọn vai trò cho admin này",
               type: "warning",
            });

            return false;
         }

         return true;
      },
      handleSubmit() {
         if (!this.validateBeforeSubmit()) return;

         return API.post(
            apiPath + `/${apiGroup}/register.php`,
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
   created() {
      this.getSystemRoleList();
   },
};
</script>

<style lang="scss" scoped>
@import "@/assets/scss/my_styles/table.scss";
</style>
