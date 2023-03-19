<template>
   <div class="card">
      <div class="card-header pb-0">
         <div class="row">
            <div class="col-md-12">
               <h6 class="mb-0 text-uppercase">Chi tiết đơn hàng</h6>
            </div>
         </div>
      </div>
      <div class="card-body pt-3 p-4">
         <div class="col-md-12">
            <!-- id -->
            <label for="example-text-input" class="form-control-label mt-3">
               &#35;ID (mã đơn hàng)
            </label>
            <div>&#35;{{ data.id }}</div>
            <!-- createdAt -->
            <label for="example-text-input" class="form-control-label mt-3">
               Thời gian tạo
            </label>
            <div>
               {{ data.createdAt }}
            </div>
            <!-- fullname -->
            <label for="example-text-input" class="form-control-label mt-3">
               Họ tên
            </label>
            <div>
               {{ data.fullname }}
            </div>
            <!-- streetAddress -->
            <label for="example-text-input" class="form-control-label mt-3">
               Địa chỉ
            </label>
            <div>
               {{ data.streetAddress }}
            </div>
            <!-- city -->
            <label for="example-text-input" class="form-control-label mt-3">
               Thành phố
            </label>
            <div>
               {{ data.city }}
            </div>
            <!-- phone -->
            <label for="example-text-input" class="form-control-label mt-3">
               Số điện thoại
            </label>
            <div>
               {{ data.phone }}
            </div>
            <!-- email -->
            <label for="example-text-input" class="form-control-label mt-3">
               Email
            </label>
            <div>
               {{ data.email }}
            </div>
            <!-- couponCodePercentValue -->
            <label for="example-text-input" class="form-control-label mt-3">
               Giá trị giảm (áp dụng cho mã giảm giá)
            </label>
            <div class="text-danger">
               {{ data.couponCodePercentValue }}&#37;
            </div>
            <!-- deliveryCost -->
            <label for="example-text-input" class="form-control-label mt-3">
               Tiền vận chuyển
            </label>
            <div>
               {{ toVND(data.deliveryCost) }}
            </div>
            <!-- totalCost -->
            <label for="example-text-input" class="form-control-label mt-3">
               Tổng tiền
            </label>
            <div class="text-warning">
               {{ toVND(data.totalCost) }}
            </div>
            <!-- paymentCost -->
            <label for="example-text-input" class="form-control-label mt-3">
               Tiền thanh toán
            </label>
            <div class="text-pink">
               {{ toVND(data.paymentCost) }}
            </div>
            <!-- notes -->
            <label for="example-text-input" class="form-control-label mt-3">
               Ghi chú
            </label>
            <div>
               {{ data.notes }}
            </div>
            <!-- orderStatusName -->
            <label for="example-text-input" class="form-control-label mt-3">
               Trạng thái đơn hàng
            </label>
            <div>
               <span class="badge badge-md bg-gradient-info">
                  {{ data.orderStatusName }}
               </span>
            </div>

            <!-- Product table -->
            <label for="example-text-input" class="form-control-label mt-4">
               Danh sách sản phẩm đặt mua
            </label>
            <div class="table-responsive p-0">
               <table
                  class="table align-items-center justify-content-center mb-0"
               >
                  <thead>
                     <tr>
                        <th
                           class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7"
                        >
                           Ảnh đặc trưng &amp; Tên sản phẩm
                        </th>
                        <th
                           class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2"
                        >
                           Giá gốc
                        </th>
                        <th
                           class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2"
                        >
                           Giá ưu đãi
                        </th>
                        <th
                           class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2"
                        >
                           Số lượng mua
                        </th>
                     </tr>
                  </thead>
                  <tbody>
                     <!-- Table List -->
                     <tr v-for="item in productListForOrder" :key="item.id">
                        <td>
                           <div class="d-flex px-3">
                              <div>
                                 <img
                                    :src="
                                       item.featureImageUrl
                                          ? item.featureImageUrl
                                          : `${require('@/assets/img/no-image.jpg')}`
                                    "
                                    class="image-contain avatar avatar-sm me-2"
                                    alt="feature image url"
                                 />
                              </div>
                              <div class="my-auto">
                                 <h6 class="mb-0 text-sm">
                                    {{ item.name }}
                                    <span
                                       v-if="item.productDeletedAt"
                                       class="text-danger"
                                    >
                                       &lpar;Đã xóa&rpar;
                                    </span>
                                 </h6>
                              </div>
                           </div>
                        </td>
                        <td>
                           <p
                              class="text-sm font-weight-bold mb-0 text-warning"
                           >
                              {{ toVND(item.originPrice) }}
                           </p>
                        </td>
                        <td>
                           <p class="text-sm font-weight-bold mb-0 text-pink">
                              {{ toVND(item.promotionPrice) }}
                           </p>
                        </td>
                        <td>
                           <p class="text-sm font-weight-bold mb-0">
                              {{ `${item.quantity} x ${item.unit}` }}
                           </p>
                        </td>
                     </tr>
                  </tbody>
               </table>
            </div>

            <!-- UPDATE ORDER STATUS FOR ORDER -->
            <div
               v-if="
                  checkPermissionFunction(functions.UpdateOrderStatusForOrder)
               "
            >
               <label for="example-text-input" class="form-control-label mt-3">
                  Thay đổi trạng thái đơn hàng
               </label>

               <div class="selection-wrap">
                  <el-select
                     v-model="dataChange.orderStatusId"
                     filterable
                     placeholder="Thay đổi trạng thái đơn hàng"
                  >
                     <el-option
                        v-for="item in orderStatusList"
                        :key="item.value"
                        :label="item.title"
                        :value="item.value"
                     />
                  </el-select>
               </div>
            </div>
         </div>
         <div class="col-md-12 pt-4">
            <div class="action-btns text-end">
               <argon-button
                  v-if="
                     checkPermissionFunction(
                        functions.UpdateOrderStatusForOrder
                     )
                  "
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

import * as API from "@/helpers/api.js";
const apiPath = process.env.VUE_APP_SERVER_PATH_API;
const apiGroup = "order";

import { functions } from "@/helpers/constants.js";
import Funcs from "@/helpers/funcs.js";

export default {
   name: "ViewOrderDetailsDialog",
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
         // Funcs
         toVND: Funcs.toVND,

         // Import constants
         functions,

         data: {},

         dataChange: {
            orderStatusId: "",
         },

         orderStatusList: [],

         productListForOrder: [],
      };
   },
   methods: {
      getProductListForOrder() {
         return API.get(
            apiPath + `/product_order/get_list_by_order_id.php`,
            {
               orderId: this.data.id,
            },
            (data) => {
               if (data.code === 1) {
                  this.productListForOrder = data.data.map((i) => ({
                     ...i,
                     id: +i.id,
                     featureImageId: +i.featureImageId,
                     originPrice: +i.originPrice,
                     promotionPrice: +i.promotionPrice,
                     isSpecial: +i.isSpecial == 1,
                     isNew: +i.isNew == 1,
                     isBestOffer: +i.isBestOffer == 1,
                     productCategoryId: +i.productCategoryId,
                  }));

                  // Not found data
                  if (data.data.length === 0) {
                     ElMessage({
                        message: "Không tìm thấy sản phẩm cho đơn hàng này",
                        type: "warning",
                     });
                  }
               } else {
                  ElMessage({
                     message: data.message,
                     type: "error",
                  });
               }
            }
         );
      },
      getOrderStatusList() {
         return API.get(apiPath + `/order_status/get_list.php`, {}, (data) => {
            if (data.code === 1) {
               this.orderStatusList = data.data.map((i) => ({
                  value: +i.id,
                  title: i.name,
               }));

               // Not found data
               if (data.data.length === 0) {
                  ElMessage({
                     message: "Không có dữ liệu danh sách trạng thái đơn hàng",
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
                     couponCodeId: +data.data.couponCodeId,
                     couponCodePercentValue: +data.data.couponCodePercentValue,
                     deliveryCost: +data.data.deliveryCost,
                     totalCost: +data.data.totalCost,
                     paymentCost: +data.data.paymentCost,
                     orderStatusId: +data.data.orderStatusId,
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
      handleDataProcessing() {},
      validateBeforeSubmit() {
         this.handleDataProcessing();

         if (this.dataChange.orderStatusId === "") {
            ElMessage({
               message: "Bạn phải thay đổi trạng thái đơn hàng",
               type: "warning",
            });

            return false;
         }

         return true;
      },
      handleSubmit() {
         if (!this.validateBeforeSubmit()) return;

         return API.put(
            apiPath + `/${apiGroup}/update_order_status_for_order.php`,
            {
               id: this.data.id,
               orderStatusId: this.dataChange.orderStatusId,
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
   async created() {
      this.data.id = this.$props.itemIdSelect;
      await this.getOrderStatusList();
      await this.getProductListForOrder();
      await this.getData();
   },
};
</script>

<style lang="scss" scoped>
@import "@/assets/scss/my_styles/table.scss";

label.form-control-label {
   text-transform: uppercase;
}
</style>
