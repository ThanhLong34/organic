<template>
   <div class="card">
      <div class="card-header pb-0">
         <div class="row">
            <div class="col-md-12">
               <h6 class="mb-0 text-uppercase">Chỉnh sửa đánh giá</h6>
            </div>
         </div>
      </div>
      <div class="card-body pt-3 p-4">
         <div class="col-md-12">
            <!-- fullname -->
            <label for="example-text-input" class="form-control-label mt-3">
               Họ tên
            </label>
            <div>
               {{ data.fullname }}
            </div>
            <!-- email -->
            <label for="example-text-input" class="form-control-label mt-3">
               Email
            </label>
            <div>
               {{ data.email }}
            </div>
            <!-- rating -->
            <label for="example-text-input" class="form-control-label mt-3">
               Đánh giá
            </label>
            <div>
               {{ data.rating }}
               <i class="fa fa-star rating-star" aria-hidden="true"></i>
            </div>
            <!-- isShow -->
            <label for="example-text-input" class="form-control-label mt-3">
               Hiển thị
            </label>
            <div>
               {{ data.isShow ? "Có" : "Không" }}
            </div>
            <!-- createdAt -->
            <label for="example-text-input" class="form-control-label mt-3">
               Thời gian gửi
            </label>
            <div>
               {{ data.createdAt }}
            </div>
            <!-- comment -->
            <label for="example-text-input" class="form-control-label mt-3">
               Bình luận
            </label>
            <div>
               {{ data.comment }}
            </div>
            <!-- Trạng thái phản hồi -->
            <label for="example-text-input" class="form-control-label mt-3">
               Trạng thái phản hồi
            </label>
            <div>
               <span
                  class="badge badge-md"
                  :class="
                     hasReply ? 'bg-gradient-success' : 'bg-gradient-secondary'
                  "
               >
                  {{ hasReply ? "Đã phản hồi" : "Chưa phản hồi" }}
               </span>
            </div>
            <!-- Thay đổi trạng thái hiển thị / ẩn -->
            <label for="example-text-input" class="form-control-label mt-3">
               Thay đổi trạng thái hiển thị / ẩn
            </label>
				<argon-switch v-model="dataChange.isShow" :checked="data.isShow">
               {{ dataChange.isShow ? "Có" : "Không" }}
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
                  Đóng
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

import * as API from "@/helpers/api.js";
const apiPath = process.env.VUE_APP_SERVER_PATH_API;
const apiGroup = "product_review";

import { functions } from "@/helpers/constants.js";
import Funcs from "@/helpers/funcs.js";

export default {
   name: "EditProductReviewDialog",
   components: { ArgonButton, ArgonSwitch },
   emits: ["onCloseDialog"],
   props: {
      itemIdSelect: {
         type: Number,
         required: true,
      },
   },
   data() {
      return {
         // Import constants
         functions,

         data: {},
         dataChange: {
            isShow: "",
         },

         reply: {
            message: "",
         },

         isReplyClicked: false,

         hasReply: false,
      };
   },
   methods: {
      checkPermissionFunction(functionName) {
         return Funcs.checkPermissionFunction(functionName);
      },
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
                     id: +data.data.id,
                     isShow: +data.data.isShow == 1,
                     rating: +data.data.rating,
                     productId: +data.data.productId,
                  };

                  // Has reply
                  this.hasReply = !!this.data.repliedAt;

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
         this.$refs.replyMessageRef?.setValue(this.data.replyMessage);
      },
      handleDataProcessing() {
         // Chế biến lại dữ liệu
      },
      validateBeforeSubmit() {
         this.handleDataProcessing();

         if (this.dataChange.isShow === "") {
            ElMessage({
               message: "Không có gì để thay đổi",
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
               isShow: this.dataChange.isShow,
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

label.form-control-label {
   text-transform: uppercase;
}
</style>
