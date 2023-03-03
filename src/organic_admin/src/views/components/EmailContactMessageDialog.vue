<template>
   <div class="card">
      <div class="card-header pb-0">
         <div class="row">
            <div class="col-md-4">
               <h6 class="mb-0">Nội dung tin nhắn</h6>
            </div>
            <div class="col-md-4 text-center created-at-text">
               <i class="far fa-calendar-alt me-2" aria-hidden="true"></i>
               <small>{{ emailContact.createdAt }}</small>
            </div>
            <div class="col-md-4 text-end created-at-text">
               <span
                  class="badge badge-md"
                  :class="{
                     'bg-gradient-secondary': emailContact.status == 0,
                     'bg-gradient-info': emailContact.status == 1,
                     'bg-gradient-success': emailContact.status == 2,
                  }"
               >
                  {{
                     emailContact.status == 0
                        ? "Chưa xem"
                        : emailContact.status == 1
                        ? "Đã xem"
                        : emailContact.status == 2
                        ? "Đã trả lời"
                        : "Không biết"
                  }}
               </span>
            </div>
         </div>
      </div>
      <div class="card-body pt-4 p-4">
         <p class="mb-5 text-xs">{{ emailContact.message }}</p>
         <div class="action-btns text-end">
            <argon-button
               color="info"
               size="sm"
               variant="gradient"
               class="action-button"
               @click="updateStatusToViewed"
               :disabled="emailContact.status === 1"
            >
               Đánh dấu đã xem
            </argon-button>
            <argon-button
               color="success"
               size="sm"
               variant="gradient"
               class="action-button"
               @click="updateStatusToReplied"
               :disabled="emailContact.status === 2"
            >
               Đánh dấu đã trả lời
            </argon-button>
         </div>
      </div>
   </div>
</template>

<script>
import * as API from "@/helpers/api.js";

import ArgonButton from "@/components/ArgonButton.vue";

import { ElMessage } from "element-plus";

const apiPath = process.env.VUE_APP_SERVER_PATH_API;

export default {
   name: "email-contact-message-dialog",
   components: { ArgonButton },
   props: {
      emailContactID: Number,
   },
   emits: ["onCloseDialog"],
   data() {
      return {
         emailContact: {},
      };
   },
   methods: {
      getEmailContactMessage() {
         return API.get(
            apiPath + "/email_contact/get_item.php",
            {
               id: this.$props.emailContactID,
            },
            (data) => {
               if (data.code === 1) {
                  if (data.data.length === 0) {
                     ElMessage({
                        message: "Không có dữ liệu",
                        type: "warning",
                     });
                  }
                  this.emailContact = {
                     id: parseInt(data.data.ID),
                     message: data.data.Message,
                     status: parseInt(data.data.Status),
                     createdAt: data.data.CreatedAt,
                  };
               } else if (data.code === 2) {
                  ElMessage({
                     message: "Không lấy được dữ liệu",
                     type: "error",
                  });
               }
            },
            (error) => {
               ElMessage({
                  message: "Có lỗi, thử lại sau",
                  type: "error",
               });
               console.error(error);
            }
         );
      },
      updateStatusToViewed() {
         return API.put(
            apiPath + "/email_contact/update_status.php",
            {
               id: this.$props.emailContactID,
               status: 1,
            },
            (data) => {
               if (data.code === 1) {
                  ElMessage({
                     message: "Đánh dấu đã xem thành công",
                     type: "success",
                  });
                  this.$emit("onCloseDialog");
               } else if (data.code === 2) {
                  ElMessage({
                     message: "Đánh dấu đã xem thất bại",
                     type: "error",
                  });
               }
            },
            (error) => {
               ElMessage({
                  message: "Có lỗi, thử lại sau",
                  type: "error",
               });
               console.error(error);
            }
         );
      },
      updateStatusToReplied() {
         return API.put(
            apiPath + "/email_contact/update_status.php",
            {
               id: this.$props.emailContactID,
               status: 2,
            },
            (data) => {
               if (data.code === 1) {
                  ElMessage({
                     message: "Đánh dấu đã trả lời thành công",
                     type: "success",
                  });
                  this.$emit("onCloseDialog");
               } else if (data.code === 2) {
                  ElMessage({
                     message: "Đánh dấu đã trả lời thất bại",
                     type: "error",
                  });
               }
            },
            (error) => {
               ElMessage({
                  message: "Có lỗi, thử lại sau",
                  type: "error",
               });
               console.error(error);
            }
         );
      },
   },
   created() {
      this.getEmailContactMessage();
   },
};
</script>

<style lang="scss" scoped>
.pagination {
   justify-content: center;
   margin-top: 20px;
}

.action-btns {
   position: relative;
   a {
      font-size: 12px;
   }
}

.action-button {
   & + & {
      margin-left: 20px;
   }
}

.not-found-data-text {
   text-align: center;
   margin-top: 20px;
   font-size: 12px;
}

.created-at-text {
   padding-top: 4px !important;
}
</style>
