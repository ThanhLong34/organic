<template>
   <div class="card">
      <div class="card-header pb-0">
         <div class="row">
            <div class="col-md-12">
               <h6 class="mb-0 text-uppercase">Chỉnh sửa menu</h6>
            </div>
         </div>
      </div>
      <div class="card-body pt-3 p-4">
         <div class="col-md-12">
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
            <!-- title -->
            <label for="example-text-input" class="form-control-label">
               Tiêu đề
               <span class="star-input-required">*</span>
            </label>
            <argon-input
               ref="titleRef"
               type="text"
               placeholder="Nhập tiêu đề"
               v-model="dataChange.title"
            />
            <!-- isBase -->
            <label for="example-text-input" class="form-control-label">
               Trạng thái Base
            </label>
            <argon-switch v-model="dataChange.isBase" :checked="data.isBase">
               {{ data.isBase ? "Có" : "Không" }}
            </argon-switch>
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
import ArgonButton from "@/components/ArgonButton.vue";
import ArgonSwitch from "@/components/ArgonSwitch.vue";
import ArgonInput from "@/components/ArgonInput.vue";

import * as API from "@/helpers/api.js";
const apiPath = process.env.VUE_APP_SERVER_PATH_API;
const apiGroup = "system_menu";

export default {
   name: "EditSystemMenuDialog",
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
         data: {},
         dataChange: {
            routeName: null,
            title: null,
            isBase: null,
         },
      };
   },
   methods: {
      getData() {
         return API.get(
            apiPath + `/${apiGroup}/get_item.php`,
            {
               id: this.data.id,
            },
            (data) => {
               if (data.code === 1) {
                  this.data = {
                     ...data.data,
                     isBase: +data.data.isBase == 1,
                  };

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
         this.$refs.titleRef?.setValue(this.data.title);
      },
      handleDataProcessing() {
         // Chế biến lại dữ liệu

         if (typeof this.dataChange.routeName === "string") {
            this.dataChange.routeName = this.dataChange.routeName.trim();
         }

         if (typeof this.dataChange.title === "string") {
            this.dataChange.title = this.dataChange.title.trim();
         }
      },
      validateBeforeSubmit() {
         this.handleDataProcessing();

         if (
            this.dataChange.routeName === "" ||
            (this.dataChange.routeName === null &&
               this.dataChange.title === null &&
               this.dataChange.isBase === null)
         ) {
            ElMessage({
               message: "Nhập tên Route mới hoặc không được để trống",
               type: "warning",
            });

            return false;
         }

         if (this.dataChange.title === "") {
            ElMessage({
               message: "Tên tiêu đề không nên để trống",
               type: "warning",
            });

            return false;
         }

         return true;
      },
      handleSubmit() {
         if (!this.validateBeforeSubmit()) return;

         return API.put(
            apiPath + `/${apiGroup}/update.php`,
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
