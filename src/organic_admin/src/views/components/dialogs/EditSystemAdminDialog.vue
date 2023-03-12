<template>
   <div class="card">
      <div class="card-header pb-0">
         <div class="row">
            <div class="col-md-12">
               <h6 class="mb-0 text-uppercase">Chỉnh sửa admin</h6>
            </div>
            <div class="col-md-12 pt-3">
               <!-- systemRoleId -->
               <div class="selection-wrap">
                  <label for="example-text-input" class="form-control-label"
                     >Vai trò <span class="star-input-required">*</span></label
                  >
                  <el-select
                     v-model="dataChange.systemRoleId"
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

import * as API from "@/helpers/api.js";
const apiPath = process.env.VUE_APP_SERVER_PATH_API;
const apiGroup = "system_admin";

export default {
   name: "EditSystemAdminDialog",
   components: { ArgonButton },
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
         },
			dataChange: {
				systemRoleId: null,
			},
			systemRoleList: []
      };
   },
   methods: {
		async getSystemRoleList() {
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
      async getData() {
         return API.get(
            apiPath + `/${apiGroup}/get_item.php`,
            {
               id: this.data.id,
            },
            (data) => {
               if (data.code === 1) {
                  this.dataChange.systemRoleId = +data.data.systemRoleId;

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
      bindingData() {},
      handleDataProcessing() {},
      validateBeforeSubmit() {
         this.handleDataProcessing();

         if (this.dataChange.systemRoleId === null) {
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
            apiPath + `/${apiGroup}/update_system_role.php`,
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
   async created() {
      this.data.id = this.$props.itemIdSelect;

      await this.getSystemRoleList();
      await this.getData();
   },
};
</script>

<style lang="scss" scoped>
@import "@/assets/scss/my_styles/table.scss";
</style>
