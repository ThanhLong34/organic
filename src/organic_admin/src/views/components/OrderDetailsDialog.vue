<template>
   <div class="card">
      <div class="card-header pb-0">
         <div class="row">
            <div class="col-md-4">
               <h6 class="mb-0">Chi tiết đơn hàng</h6>
            </div>
            <div class="col-md-4 text-center created-at-text">
               <i class="far fa-calendar-alt me-2" aria-hidden="true"></i>
               <small>{{ order.createdAt }}</small>
            </div>
            <div class="col-md-4 text-end created-at-text">
               <span
                  class="badge badge-md"
                  :class="{
                     'bg-gradient-info': order.status == 0,
                     'bg-gradient-success': order.status == 1,
                     'bg-gradient-secondary': order.status == 2,
                  }"
               >
                  {{
                     order.status == 0
                        ? "Đang chờ duyệt"
                        : order.status == 1
                        ? "Đã duyệt"
                        : order.status == 2
                        ? "Đã từ chối"
                        : "Không biết"
                  }}
               </span>
            </div>
         </div>
      </div>
      <div class="card-body pt-4 p-4">
         <h6 class="text-uppercase text-body text-xs font-weight-bolder mb-3">
            THÔNG TIN KHÁCH HÀNG
         </h6>
         <div class="d-flex flex-column">
            <span class="mb-3 text-xs">
               Tên đăng nhập:
               <span class="text-dark font-weight-bold ms-sm-2">{{
                  order.username
               }}</span>
            </span>
            <span class="mb-3 text-xs">
               Email:
               <span class="text-dark font-weight-bold ms-sm-2">{{
                  order.email
               }}</span>
            </span>
            <span class="mb-3 text-xs">
               Số điện thoại:
               <span class="text-dark font-weight-bold ms-sm-2">{{
                  order.phone
               }}</span>
            </span>
            <span class="mb-3 text-xs">
               Mã đơn hàng:
               <span class="text-dark font-weight-bold ms-sm-2">{{
                  order.code
               }}</span>
            </span>
            <span class="mb-4 text-xs">
               Tổng tiền (VND):
               <span class="text-dark font-weight-bold ms-sm-2">{{
                  order.total.toLocaleString('it-IT', {style : 'currency', currency : 'VND'})
               }}</span>
            </span>
         </div>
         <h6 class="text-uppercase text-body text-xs font-weight-bolder mb-3">
            THÔNG TIN DỰ ÁN <span class="text-warning">{{ order.projectDeletedAt ? '(ĐÃ XÓA)' : '' }}</span>
         </h6>
         <div class="d-flex flex-column">
            <span class="mb-3 text-xs">
               Avatar:
               <img
                  :src="
                     order.projectAvatar
                        ? order.projectAvatar
                        : `${require('@/assets/img/no-image.jpg')}`
                  "
                  class="avatar avatar-sm rounded-circle me-2"
                  alt="avatar"
               /> </span
            ><span class="mb-3 text-xs">
               Tên dự án:
               <span class="text-dark font-weight-bold ms-sm-2">{{
                  order.projectName
               }}</span>
            </span>
            <span class="mb-5 text-xs">
               Danh mục:
               <span class="text-dark font-weight-bold ms-sm-2">{{
                  order.categoryName
               }}</span>
            </span>
         </div>
         <div class="action-btns text-end">
            <argon-button
               color="success"
               size="sm"
               variant="gradient"
               class="action-button"
               @click="resolveOrder"
               :disabled="order.status === 1"
            >
               Duyệt
            </argon-button>
            <argon-button
               color="warning"
               size="sm"
               variant="gradient"
               class="action-button"
               @click="rejectOrder"
               :disabled="order.status === 2"
            >
               Từ chối
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
   name: "order-details-dialog",
   components: { ArgonButton },
   props: {
      orderID: Number,
   },
   emits: ['onCloseDialog'],
   data() {
      return {
         order: {
            total: 0,
         },
      };
   },
   methods: {
      getOrderDetails() {
         return API.get(
            apiPath + "/order/get_item.php",
            {
               id: this.$props.orderID,
            },
            (data) => {
               if (data.code === 1) {
                  if (data.data.length === 0) {
                     ElMessage({
                        message: "Không có dữ liệu",
                        type: "warning",
                     });
                  }
                  this.order = {
                     id: parseInt(data.data.ID),
                     createdAt: data.data.CreatedAt,
                     username: data.data.Username,
                     email: data.data.Email,
                     phone: data.data.Phone,
                     code: data.data.Code,
                     total: parseInt(data.data.Total),
                     status: parseInt(data.data.Status),
                     projectDeletedAt: data.data.ProjectDeletedAt,
                     projectAvatar: data.data.ProjectAvatar,
                     projectName: data.data.ProjectName,
                     categoryName: data.data.CategoryName,
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
      resolveOrder() {
         return API.put(
            apiPath + "/order/update_status.php",
            {
               id: this.$props.orderID,
               status: 1
            },
            (data) => {
               if (data.code === 1) {
                  ElMessage({
                     message: "Duyệt đơn hàng thành công",
                     type: "success",
                  });
                  this.$emit('onCloseDialog');
               } else if (data.code === 2) {
                  ElMessage({
                     message: "Duyệt đơn hàng thất bại",
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
      rejectOrder() {
         return API.put(
            apiPath + "/order/update_status.php",
            {
               id: this.$props.orderID,
               status: 2
            },
            (data) => {
               if (data.code === 1) {
                  ElMessage({
                     message: "Từ chối đơn hàng thành công",
                     type: "success",
                  });
                  this.$emit('onCloseDialog');
               } else if (data.code === 2) {
                  ElMessage({
                     message: "Từ chối đơn hàng thất bại",
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
      this.getOrderDetails();
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
