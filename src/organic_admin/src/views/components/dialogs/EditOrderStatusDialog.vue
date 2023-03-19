<template>
   <div class="card">
      <div class="card-header pb-0">
         <div class="row">
            <div class="col-md-12">
               <h6 class="mb-0 text-uppercase">Chỉnh sửa trạng thái đơn hàng</h6>
            </div>
         </div>
      </div>
      <div class="card-body pt-3 p-4">
         <div class="col-md-12">
            <!-- name -->
            <label for="example-text-input" class="form-control-label">
               Tên trạng thái đơn hàng
               <span class="star-input-required">*</span>
            </label>
            <argon-input
               ref="nameRef"
               type="text"
               placeholder="Nhập tên trạng thái đơn hàng"
               v-model="dataChange.name"
            />
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
import ArgonInput from "@/components/ArgonInput.vue";

import * as API from "@/helpers/api.js";
const apiPath = process.env.VUE_APP_SERVER_PATH_API;
const apiGroup = "order_status";

export default {
   name: "EditOrderStatusDialog",
   components: { ArgonButton, ArgonInput },
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
            name: "",
         },
         dataChange: {
            name: null,
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
                  this.data.name = data.data.name;

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
         this.$refs.nameRef?.setValue(this.data.name);
      },
      handleDataProcessing() {
         // Chế biến lại dữ liệu

         if (typeof this.dataChange.name === "string") {
            this.dataChange.name = this.dataChange.name.trim();
         }
      },
      validateBeforeSubmit() {
         this.handleDataProcessing();

         if (this.dataChange.name === "" || this.dataChange.name === null) {
            ElMessage({
               message: "Nhập tên trạng thái đơn hàng mới hoặc không được để trống",
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
