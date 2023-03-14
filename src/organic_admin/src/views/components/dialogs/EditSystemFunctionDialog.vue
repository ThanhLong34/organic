<template>
   <div class="card">
      <div class="card-header pb-0">
         <div class="row">
            <div class="col-md-12">
               <h6 class="mb-0 text-uppercase">Chỉnh sửa chức năng</h6>
            </div>
         </div>
      </div>
      <div class="card-body pt-3 p-4">
         <div class="col-md-12">
            <!-- name -->
            <label for="example-text-input" class="form-control-label">
               Tên chức năng
               <span class="star-input-required">*</span>
            </label>
            <argon-input
               ref="nameRef"
               type="text"
               placeholder="Nhập tên chức năng"
               v-model="dataChange.name"
            />
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
            <!-- apiPath -->
            <label for="example-text-input" class="form-control-label">
               Đường dẫn API
            </label>
            <argon-input
               ref="apiPathRef"
               type="text"
               placeholder="Nhập đường dẫn API"
               v-model="dataChange.apiPath"
            />
            <!-- method -->
            <label for="example-text-input" class="form-control-label">
               Phương thức
            </label>
            <argon-input
               ref="methodRef"
               type="text"
               placeholder="Nhập phương thức"
               v-model="dataChange.method"
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
const apiGroup = "system_function";

export default {
   name: "EditSystemFunctionDialog",
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
            name: null,
            description: null,
            apiPath: null,
            method: null,
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
         this.$refs.nameRef?.setValue(this.data.name);
         this.$refs.descriptionRef?.setValue(this.data.description);
         this.$refs.apiPathRef?.setValue(this.data.apiPath);
         this.$refs.methodRef?.setValue(this.data.method);
      },
      handleDataProcessing() {
         // Chế biến lại dữ liệu

         if (typeof this.dataChange.name === "string") {
            this.dataChange.name = this.dataChange.name.trim();
         }

         if (typeof this.dataChange.description === "string") {
            this.dataChange.description = this.dataChange.description.trim();
         }

         if (typeof this.dataChange.apiPath === "string") {
            this.dataChange.apiPath = this.dataChange.apiPath.trim();
         }

         if (typeof this.dataChange.method === "string") {
            this.dataChange.method = this.dataChange.method.trim();
         }
      },
      validateBeforeSubmit() {
         this.handleDataProcessing();

         if (
            this.dataChange.name === "" ||
            (this.dataChange.name === null &&
               this.dataChange.description === null &&
               this.dataChange.apiPath === null &&
               this.dataChange.method === null &&
               this.dataChange.isBase === null)
         ) {
            ElMessage({
               message: "Nhập tên chức năng mới hoặc không được để trống",
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
