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
               <argon-input
                  ref="routeNameRef"
                  type="text"
                  placeholder="Nhập tên Route"
                  v-model="dataChange.routeName"
               />

               <!-- isBase -->
               <label for="example-text-input" class="form-control-label">
                  Trạng thái Base
               </label>
               <argon-switch v-model="dataChange.isBase" :checked="data.isBase">
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
import ArgonButton from "@/components/ArgonButton.vue";
import ArgonSwitch from "@/components/ArgonSwitch.vue";
import ArgonInput from "@/components/ArgonInput.vue";

import * as API from "@/helpers/api.js";
const apiPath = process.env.VUE_APP_SERVER_PATH_API;

export default {
   name: "edit-menu-dialog",
   components: { ArgonButton, ArgonSwitch, ArgonInput },
   emits: ["onCloseDialog"],
   props: {
      itemIdSelect: {
         type: Number,
         required: true,
      },
   },
   data() {
      return {
         data: {
            id: 0,
            routeName: "",
            isBase: false,
         },
         dataChange: {
            routeName: null,
            isBase: null,
         },
      };
   },
   methods: {
      getData() {
         return API.get(
            apiPath + "/system_menu/get_item.php",
            {
               id: this.data.id,
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
            }
         );
      },
      bindingData() {
         this.$refs.routeNameRef?.setValue(this.data.routeName);
      },
      validateBeforeSubmit() {
         if (this.dataChange.routeName === "") {
            ElMessage({
               message: "Nhập tên Route mới hoặc không được để trống",
               type: "warning",
            });

            return false;
         }

         return true;
      },
      handleSubmit() {
         if (!this.validateBeforeSubmit()) return;

         return API.post(
            apiPath + "/system_menu/update.php",
            {
               id: this.data.id,
               ...this.dataChange,
            },
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
         this.$emit("onCloseDialog", "edit");
      },
   },
   created() {
      this.data.id = this.$props.itemIdSelect;
      this.getData();
   },
};
</script>

<style lang="scss" scoped>
@import "@/assets/scss/my_styles/table.scss";
</style>
