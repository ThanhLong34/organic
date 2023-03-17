<template>
   <div class="card">
      <div class="card-header pb-0">
         <div class="row">
            <div class="col-md-12">
               <h6 class="mb-0 text-uppercase">Chi tiết liên hệ</h6>
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
            <!-- subject -->
            <label for="example-text-input" class="form-control-label mt-3">
               Chủ đề
            </label>
            <div>
               {{ data.subject }}
            </div>
            <!-- createdAt -->
            <label for="example-text-input" class="form-control-label mt-3">
               Thời gian gửi
            </label>
            <div>
               {{ data.createdAt }}
            </div>
            <!-- status -->
            <label for="example-text-input" class="form-control-label mt-3">
               Trạng thái
            </label>
            <div>
               <span
                  class="badge badge-md"
                  :class="
                     data.status == 1
                        ? 'bg-gradient-success'
                        : 'bg-gradient-secondary'
                  "
               >
                  {{ data.status == 1 ? "Đã phản hồi" : "Chưa phản hồi" }}
               </span>
            </div>
            <!-- REPLY -->
            <div class="form-control-label mt-3" v-if="data.status == 0">
               <argon-textarea
                  placeholder="Nhập phản hồi"
                  v-model="reply.message"
               >
                  PHẢN HỒI
               </argon-textarea>
            </div>
         </div>
         <div class="col-md-12 pt-3">
            <div class="action-btns text-end">
               <argon-button
                  v-if="data.status == 0"
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
import { ElMessage, ElNotification } from "element-plus";
import ArgonButton from "@/components/ArgonButton.vue";
import ArgonTextarea from "@/components/ArgonTextarea.vue";

import * as API from "@/helpers/api.js";
const apiPath = process.env.VUE_APP_SERVER_PATH_API;
const apiGroup = "contact";

export default {
   name: "ViewContactDetailsDialog",
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
         data: {},
         reply: {
            subject: "",
            message: "",
         },
         isReplyClicked: false,
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
                     id: +data.data.id,
                     status: +data.data.status,
                  };
               } else {
                  ElMessage({
                     message: data.message,
                     type: "error",
                  });
               }
            }
         );
      },
      handleDataProcessing() {
         // Chế biến lại dữ liệu

         if (typeof this.data.message === "string") {
            this.data.message = this.data.message.trim();
         }
      },
      validateBeforeSubmit() {
         this.handleDataProcessing();

         if (this.data.message === "") {
            ElMessage({
               message: "Không được để trống nội dung phản hồi",
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
               subject: `Phản hồi từ liên hệ của: ${this.data.fullname}`,
               message: `
						<div>Thời gian gửi: <span style='color: #e6802e;'>${this.data.createdAt}</span></div>
						<div>
							<p>Nội dung liên hệ của bạn:</p>
							<p style='color: #c9223e;'>${this.data.message}</p>
						</div>
						<div>
							<p>Phản hồi từ chúng tôi:</p>
							<p style='color: #22995a;'>${this.reply.message}</p>
						</div>
					`,
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
         this.$emit("onCloseDialog", "view");
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
