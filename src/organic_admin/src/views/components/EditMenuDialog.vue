<template>
   <div class="card">
      <div class="card-header pb-0">
         <div class="row">
            <div class="col-md-12">
               <h6 class="mb-0 text-uppercase">Chỉnh sửa menu</h6>
            </div>
            <div class="col-md-12 pt-3">
               <!-- routeName -->
               <label for="example-text-input" class="form-control-label">
                  Tên Route
                  <span class="star-input-required">*</span>
               </label>
               <PrimaryInput
                  ref="routeNameRef"
                  type="text"
                  isRequired
                  v-model="data.routeName"
                  placeholder="Nhập tên Route"
                  @onSave="handleUpdateRouteName"
               />
               <label for="example-text-input" class="form-control-label">
                  Trạng thái Base
               </label>
               <argon-switch
                  v-model="data.isBase"
                  :checked="data.isBase"
                  @change="handleUpdateIsBase"
               >
                  {{ data.isBase ? "Có" : "Không" }}
               </argon-switch>
            </div>
         </div>
      </div>
      <div class="card-body pt-4 p-4">
         <div class="action-btns text-end">
            <argon-button
               color="warning"
               size="sm"
               variant="gradient"
               class="action-btn"
               @click="handleCloseDialog"
            >
               Đóng
            </argon-button>
         </div>
      </div>
   </div>
</template>

<script>
import { ElMessage } from "element-plus";
import ArgonButton from "@/components/ArgonButton.vue";
import ArgonSwitch from "@/components/ArgonSwitch.vue";
import PrimaryInput from "@/examples/Inputs/PrimaryInput.vue";

import * as API from "@/helpers/api.js";
const apiPath = process.env.VUE_APP_SERVER_PATH_API;

export default {
   name: "edit-menu-dialog",
   components: { ArgonButton, ArgonSwitch, PrimaryInput },
   emits: ["onCloseDialog", "onReloadDataCurrentPage"],
   props: {
      itemIdSelect: {
         type: Number,
         required: true,
      },
   },
   data() {
      return {
         data: {
            routeName: "",
            isBase: false,
         },
      };
   },
   methods: {
      getData() {
         return API.get(
            apiPath + "/system_menu/get_item.php",
            {
               id: this.$props.itemIdSelect,
            },
            (data) => {
               if (data.code === 1) {
                  this.data.routeName = data.data.routeName;
                  this.data.isBase = +data.data.isBase == 1;

                  // Binding data
                  this.bindingData();
               } else {
                  ElMessage({
                     message: data.message,
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
      bindingData() {
         this.$refs.routeNameRef?.setValue(this.data.routeName);
      },
      validateBeforeSubmit() {
         if (this.data.routeName === "") {
            ElMessage({
               message: "Không được để trống tên Route",
               type: "warning",
            });

            return false;
         }

         return true;
      },
      handleUpdateRouteName() {
         if (!this.validateBeforeSubmit()) return;

         return API.post(
            apiPath + "/system_menu/update_route_name.php",
            {
               id: this.$props.itemIdSelect,
               routeName: this.data.routeName,
            },
            (data) => {
               if (data.code === 1) {
                  ElMessage({
                     message: data.message,
                     type: "success",
                  });

                  this.handleAfterUpdate();
               } else {
                  ElMessage({
                     message: data.message,
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
      handleUpdateIsBase() {
         // Không cần validate trước khi submit ở dây

         return API.post(
            apiPath + "/system_menu/update_is_base.php",
            {
               id: this.$props.itemIdSelect,
               isBase: this.data.isBase,
            },
            (data) => {
               if (data.code === 1) {
                  ElMessage({
                     message: data.message,
                     type: "success",
                  });

                  this.handleAfterUpdate();
               } else {
                  ElMessage({
                     message: data.message,
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
      handleCloseDialog() {
         this.$emit("onCloseDialog", "edit");
      },
      handleAfterUpdate() {
         this.$emit("onReloadDataCurrentPage");
      },
   },
   created() {
      this.getData();
   },
};
</script>

<style lang="scss" scoped>
@import "@/assets/scss/my_styles/table.scss";
</style>
