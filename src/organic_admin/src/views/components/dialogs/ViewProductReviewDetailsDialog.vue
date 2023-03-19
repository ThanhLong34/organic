<template>
   <div class="card">
      <div class="card-header pb-0">
         <div class="row">
            <div class="col-md-12">
               <h6 class="mb-0 text-uppercase">Chi tiết đánh giá</h6>
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
            <!-- repliedAt -->
            <label for="example-text-input" class="form-control-label mt-4">
               Thời gian phản hồi
            </label>
            <div v-if="hasReply">
               {{ data.repliedAt }}
            </div>
            <!-- REPLY - replyMessage -->
            <div v-if="checkPermissionFunction(functions.ReplyProductReview)">
               <argon-textarea
                  ref="replyMessageRef"
                  class="form-control-label mt-3"
                  placeholder="Nhập phản hồi"
                  v-model="reply.message"
               >
                  NỘI DUNG PHẢN HỒI
               </argon-textarea>
            </div>
         </div>
         <div class="col-md-12 pt-3">
            <div class="action-btns text-end">
               <argon-button
                  v-if="checkPermissionFunction(functions.ReplyProductReview)"
                  color="success"
                  size="sm"
                  variant="gradient"
                  class="action-btn me-4"
                  :disabled="isReplyClicked"
                  @click="() => !isReplyClicked && handleSubmit()"
               >
                  {{ isReplyClicked ? "Đã gửi phản hồi" : "Gửi phản hồi" }}
               </argon-button>
               <argon-button
                  v-if="
                     checkPermissionFunction(functions.RemoveReplyProductReview)
                  "
                  color="danger"
                  size="sm"
                  variant="gradient"
                  class="action-btn me-4"
                  :disabled="!hasReply"
                  @click="() => hasReply && handleOpenConfirmRemoveReply()"
               >
                  Xóa phản hồi
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
import { markRaw } from "vue";

import { ElMessage, ElNotification, ElMessageBox } from "element-plus";
import { Delete } from "@element-plus/icons-vue";
import ArgonButton from "@/components/ArgonButton.vue";
import ArgonTextarea from "@/components/ArgonTextarea.vue";

import * as API from "@/helpers/api.js";
const apiPath = process.env.VUE_APP_SERVER_PATH_API;
const apiGroup = "product_review";

import { functions } from "@/helpers/constants.js";
import Funcs from "@/helpers/funcs.js";

export default {
   name: "ViewProductReviewDetailsDialog",
   components: { ArgonButton, ArgonTextarea },
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

         if (typeof this.reply.message === "string") {
            this.reply.message = this.reply.message.trim();
         }
      },
      validateBeforeSubmit() {
         this.handleDataProcessing();

         if (this.reply.message === "") {
            ElMessage({
               message: "Nhập nội dung phản hồi mới hoặc không được để trống",
               type: "warning",
            });

            return false;
         }

         return true;
      },
      handleSubmit() {
         if (!this.validateBeforeSubmit()) return;

         this.isReplyClicked = true;

         ElNotification({
            title: "Đang gửi phản hồi",
            message: "Vui lòng chờ cho đến khi có thông báo mới...",
            type: "success",
         });

         return API.post(
            apiPath + `/${apiGroup}/reply.php`,
            {
               id: this.data.id,
               replyMessage: this.reply.message,
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
      handleRemoveReply() {
         this.hasReply = false;
         this.reply.message = "";
         this.$refs.replyMessageRef?.setValue("");

         return API.put(
            apiPath + `/${apiGroup}/remove_reply.php`,
            {
               id: this.data.id,
            },
            (data) => {
               if (data.code === 1) {
                  ElMessage({
                     message: "Xóa phản hồi thành công",
                     type: "success",
                  });
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
         this.$emit("onCloseDialog", "view");
      },
      handleOpenConfirmRemoveReply() {
         ElMessageBox.confirm(
            "Bạn có chắc chắn muốn xóa phản hồi không?",
            "Xác nhận xóa phản hồi",
            {
               type: "warning",
               icon: markRaw(Delete),
            }
         )
            .then(() => {
               this.handleRemoveReply();
            });
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
