<template>
   <div class="card">
      <div class="card-header pb-0">
         <div class="row">
            <div class="col-md-12">
               <h6 class="mb-0 text-uppercase">Thêm mã giảm giá</h6>
            </div>
         </div>
      </div>
      <div class="card-body pt-3 p-4">
         <div class="col-md-12">
            <!-- description -->
            <label for="example-text-input" class="form-control-label">
               Mô tả
            </label>
            <argon-input
               type="text"
               placeholder="Nhập mô tả"
               v-model="data.description"
            />
            <!-- percentValue -->
            <label for="example-text-input" class="form-control-label">
               Giá trị giảm (%)
               <span class="star-input-required">*</span>
            </label>
            <argon-input
               type="number"
               placeholder="Nhập giá trị giảm (%)"
					:min="1"
					:max="100"
               v-model="data.percentValue"
            />
            <!-- quantityApplied -->
            <label for="example-text-input" class="form-control-label">
               Số lượng áp dụng
            </label>
            <argon-input
               type="number"
               placeholder="Nhập số lượng áp dụng"
               v-model="data.quantityApplied"
            />
				<!-- isLimited -->
            <label for="example-text-input" class="form-control-label">
               Trạng thái giới hạn
            </label>
            <argon-switch v-model="data.isLimited">
               {{ data.isLimited ? "Có" : "Không" }}
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
import ArgonInput from "@/components/ArgonInput.vue";
import ArgonButton from "@/components/ArgonButton.vue";
import ArgonSwitch from "@/components/ArgonSwitch.vue";

import * as API from "@/helpers/api.js";
const apiPath = process.env.VUE_APP_SERVER_PATH_API;
const apiGroup = "coupon_code";

export default {
   name: "AddCouponCodeDialog",
   components: { ArgonButton, ArgonInput, ArgonSwitch },
   emits: ["onCloseDialog"],
   data() {
      return {
         data: {
            description: "",
            percentValue: "",
            quantityApplied: "",
            isLimited: false,
         },
      };
   },
   methods: {
      handleDataProcessing() {
         // Chế biến lại dữ liệu

         if (typeof this.data.description === "string") {
            this.data.description = this.data.description.trim();
         }

         if (typeof this.data.percentValue === "string") {
            this.data.percentValue = +this.data.percentValue.trim();
         }

         if (typeof this.data.quantityApplied === "string") {
            this.data.quantityApplied = +this.data.quantityApplied.trim();
         }
      },
      validateBeforeSubmit() {
         this.handleDataProcessing();

         if (this.data.percentValue === "") {
            ElMessage({
               message: "Không được để trống giá trị giảm",
               type: "warning",
            });

            return false;
         }

			if (this.data.percentValue != null && (this.data.percentValue <= 0 || this.data.percentValue > 100)) {
				ElMessage({
               message: "Giá trị giảm phải nằm trong khoảng 1 -> 100",
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
