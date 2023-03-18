<template>
   <div class="card">
      <div class="card-header pb-0">
         <div class="row">
            <div class="col-md-12">
               <h6 class="mb-0 text-uppercase">Chỉnh sửa mã giảm giá</h6>
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
               ref="descriptionRef"
               type="text"
               placeholder="Nhập mô tả"
               v-model="dataChange.description"
            />
            <!-- percentValue -->
            <label for="example-text-input" class="form-control-label">
               Giá trị giảm (%)
               <span class="star-input-required">*</span>
            </label>
            <argon-input
					ref="percentValueRef"
               type="number"
               placeholder="Nhập giá trị giảm (%)"
					:min="1"
					:max="100"
               v-model="dataChange.percentValue"
            />
				<!-- remainingQuantityApplied -->
            <label for="example-text-input" class="form-control-label">
               Số lượng áp dụng còn lại
            </label>
            <argon-input
					ref="quantityAppliedRef"
               type="number"
               placeholder="Nhập số lượng áp dụng"
               v-model="dataChange.remainingQuantityApplied"
            />
            <!-- isLimited -->
            <label for="example-text-input" class="form-control-label">
               Trạng thái giới hạn
            </label>
            <argon-switch v-model="dataChange.isLimited" :checked="data.isLimited">
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
import ArgonButton from "@/components/ArgonButton.vue";
import ArgonSwitch from "@/components/ArgonSwitch.vue";
import ArgonInput from "@/components/ArgonInput.vue";

import * as API from "@/helpers/api.js";
const apiPath = process.env.VUE_APP_SERVER_PATH_API;
const apiGroup = "coupon_code";

export default {
   name: "EditCouponCodeDialog",
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
            description: null,
            percentValue: null,
            remainingQuantityApplied: null,
            isLimited: null,
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
                     isLimited: +data.data.isLimited == 1,
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
         this.$refs.descriptionRef?.setValue(this.data.description);
         this.$refs.percentValueRef?.setValue(this.data.percentValue);
         this.$refs.quantityAppliedRef?.setValue(this.data.remainingQuantityApplied);
      },
      handleDataProcessing() {
         // Chế biến lại dữ liệu

         if (typeof this.dataChange.description === "string") {
            this.dataChange.description = this.dataChange.description.trim();
         }

         if (typeof this.dataChange.percentValue === "string") {
            this.dataChange.percentValue = +this.dataChange.percentValue.trim();
         }

         if (typeof this.dataChange.remainingQuantityApplied === "string") {
            this.dataChange.remainingQuantityApplied = +this.dataChange.remainingQuantityApplied.trim();
         }
      },
      validateBeforeSubmit() {
         this.handleDataProcessing();

         if (
            this.dataChange.percentValue === "" ||
            (this.dataChange.percentValue === null &&
               this.dataChange.description === null &&
               this.dataChange.remainingQuantityApplied === null &&
               this.dataChange.isLimited === null)
         ) {
            ElMessage({
               message: "Nhập giá trị giảm mới hoặc không được để trống",
               type: "warning",
            });

            return false;
         }

			if (this.dataChange.percentValue != null && (this.dataChange.percentValue <= 0 || this.dataChange.percentValue > 100)) {
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
