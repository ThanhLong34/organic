<template>
   <div class="py-4 container-fluid">
      <div class="row">
         <div class="col-12">
            <!-- Controllers -->
            <div class="card mb-4">
               <div class="card-body px-4 pt-4 pb-4">
                  <div class="row">
                     <div class="col-5">
                        <div>
                           <div class="pb-1">
                              <h6 class="controller-title">
                                 <i class="controller-icon red"></i>
                                 Ô tìm kiếm
                              </h6>
                           </div>
                           <div class="search-wrap">
                              <argon-input
                                 ref="searchRef"
                                 type="search"
                                 icon="fas fa-search"
                                 iconDir="left"
                                 :placeholder="
                                    searchType === 'id'
                                       ? 'Nhập ID (mã đơn hàng)...'
                                       : searchType === 'fullname'
                                       ? 'Nhập họ tên...'
                                       : searchType === 'streetAddress'
                                       ? 'Nhập địa chỉ...'
                                       : searchType === 'city'
                                       ? 'Nhập thành phố...'
                                       : searchType === 'phone'
                                       ? 'Nhập số điện thoại...'
                                       : searchType === 'email'
                                       ? 'Nhập email...'
                                       : ''
                                 "
                                 v-model="searchValue"
                              />
                              <argon-button
                                 color="primary"
                                 size="sm"
                                 variant="gradient"
                                 @click="handleSearch"
                              >
                                 Tìm kiếm
                              </argon-button>
                              <argon-button
                                 color="dark"
                                 size="sm"
                                 class="reload-button"
                                 @click="handleReload"
                              >
                                 Tải lại
                              </argon-button>
                           </div>
                        </div>
                     </div>
                     <div class="col-3">
                        <div>
                           <div class="pb-1">
                              <h6 class="controller-title">
                                 <i class="controller-icon yellow"></i>
                                 Tiêu chí tìm kiếm
                              </h6>
                           </div>
                           <div class="selection-wrap">
                              <el-select
                                 v-model="searchType"
                                 filterable
                                 placeholder="Chọn kiểu tìm kiếm"
                              >
                                 <el-option
                                    v-for="item in searchOptions"
                                    :key="item.value"
                                    :label="item.title"
                                    :value="item.value"
                                 />
                              </el-select>
                           </div>
                        </div>
                     </div>
                     <div class="col-4">
                        <div>
                           <div class="pb-1">
                              <h6 class="controller-title">
                                 <i class="controller-icon green"></i>
                                 Lọc dữ liệu
                              </h6>
                           </div>
                           <div class="selection-wrap">
                              <el-select
                                 v-model="fillValue"
                                 filterable
                                 :placeholder="fillPlaceholder"
                                 @change="handleFill"
                              >
                                 <el-option
                                    v-for="item in fillOptions"
                                    :key="item.value"
                                    :label="item.title"
                                    :value="item.value"
                                 />
                              </el-select>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            <!-- Content -->
            <div class="col-12">
               <div class="card mb-4">
                  <!-- Title -->
                  <div class="card-header pb-0">
                     <div class="row">
                        <div class="col-6 d-flex align-items-center">
                           <h6>Danh sách đơn hàng ({{ tableData.length }})</h6>
                        </div>
                     </div>
                  </div>
                  <!-- Table -->
                  <div class="card-body px-0 pt-2 pb-2">
                     <div class="table-responsive p-0">
                        <table
                           class="table align-items-center justify-content-center mb-0"
                        >
                           <thead>
                              <tr>
                                 <th
                                    class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7"
                                 >
                                    &#35;ID
                                 </th>
                                 <th
                                    class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2"
                                 >
                                    Thời gian tạo
                                 </th>
                                 <th
                                    class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2"
                                 >
                                    Họ tên
                                 </th>
                                 <th
                                    class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2"
                                 >
                                    Địa chỉ
                                 </th>
                                 <th
                                    class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2"
                                 >
                                    Thành phố
                                 </th>
                                 <th
                                    class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2"
                                 >
                                    Số điện thoại
                                 </th>
                                 <th
                                    class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2"
                                 >
                                    Email
                                 </th>
                                 <th
                                    class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2"
                                 >
                                    Tiền vận chuyển
                                 </th>
                                 <th
                                    class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2"
                                 >
                                    Tổng tiền
                                 </th>
                                 <th
                                    class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2"
                                 >
                                    Tiền phải trả
                                 </th>
                                 <th
                                    class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2"
                                 >
                                    Trạng thái đơn hàng
                                 </th>
                                 <th></th>
                              </tr>
                           </thead>
                           <tbody>
                              <!-- Table List -->
                              <tr v-for="item in tableData" :key="item.id">
                                 <td>
                                    <div
                                       class="my-auto"
                                       style="margin-left: 16px"
                                    >
                                       <h6 class="mb-0 text-sm">
                                          &#35;{{ item.id }}
                                       </h6>
                                    </div>
                                 </td>
                                 <td>
                                    <p class="text-sm font-weight-bold mb-0">
                                       {{ item.createdAt }}
                                    </p>
                                 </td>
                                 <td>
                                    <p class="text-sm font-weight-bold mb-0">
                                       {{ item.fullname }}
                                    </p>
                                 </td>
                                 <td>
                                    <p class="text-sm font-weight-bold mb-0">
                                       {{ item.streetAddress }}
                                    </p>
                                 </td>
                                 <td>
                                    <p class="text-sm font-weight-bold mb-0">
                                       {{ item.city }}
                                    </p>
                                 </td>
                                 <td>
                                    <p class="text-sm font-weight-bold mb-0">
                                       {{ item.phone }}
                                    </p>
                                 </td>
                                 <td>
                                    <p class="text-sm font-weight-bold mb-0">
                                       {{ item.email }}
                                    </p>
                                 </td>
                                 <td>
                                    <p class="text-sm font-weight-bold mb-0">
                                       {{ toVND(item.deliveryCost) }}
                                    </p>
                                 </td>
                                 <td>
                                    <p class="text-sm font-weight-bold mb-0">
                                       {{ toVND(item.totalCost) }}
                                    </p>
                                 </td>
                                 <td>
                                    <p class="text-sm font-weight-bold mb-0">
                                       {{ toVND(item.paymentCost) }}
                                    </p>
                                 </td>
                                 <td>
                                    <span
                                       class="badge badge-md bg-gradient-info"
                                    >
                                       {{ item.orderStatusName }}
                                    </span>
                                 </td>
                                 <td class="align-middle">
                                    <div class="ms-auto text-end action-btns">
                                       <a
														v-if="checkPermissionFunction(functions.ViewOrderDetails)"
                                          class="btn btn-link text-info text-gradient px-2 mb-0"
                                          href="javascript:;"
                                          @click.prevent="
                                             () => handleOpenViewDetailsDialog(item.id)
                                          "
                                       >
                                          <i
                                             class="fas fa-eye me-2"
                                             aria-hidden="true"
                                          ></i
                                          >Xem chi tiết
                                       </a>
                                       <el-popconfirm
                                          v-if="
                                             checkPermissionFunction(
                                                functions.TrashOrder
                                             )
                                          "
                                          confirm-button-text="OK"
                                          cancel-button-text="Hủy"
                                          title="Xác nhận xóa"
                                          @confirm="handleDeleteItem(item.id)"
                                       >
                                          <template #reference>
                                             <a
                                                class="btn btn-link text-danger text-gradient px-2 mb-0"
                                                href="javascript:;"
                                             >
                                                <i
                                                   class="fa fa-trash-alt me-2"
                                                   aria-hidden="true"
                                                ></i
                                                >Xóa
                                             </a>
                                          </template>
                                       </el-popconfirm>
                                    </div>
                                 </td>
                              </tr>
                           </tbody>
                        </table>
                     </div>
                     <div
                        class="not-found-data-text"
                        v-show="tableData.length === 0"
                     >
                        Không tìm thấy dữ liệu
                     </div>
                     <!-- Pagination -->
                     <div class="pagination">
                        <argon-pagination size="sm" color="primary">
                           <argon-pagination-item
                              prev
                              @click="handlePrevPage"
                           />
                           <argon-pagination-item
                              v-for="page in numberOfPage"
                              :key="page"
                              :label="`${page}`"
                              :class="{
                                 active: currentPage === page,
                              }"
                              @click="handleChoosePage(page)"
                           />
                           <argon-pagination-item
                              next
                              @click="handleNextPage"
                           />
                        </argon-pagination>
                        <div class="table-statistics">
                           <span
                              class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7"
                              >{{ limit }} kết quả trên 1 trang (Tổng
                              <span class="text-dark">{{ totalItem }}</span
                              >)</span
                           >
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            <!-- View dialog -->
            <div v-if="viewDialog.visible">
               <el-dialog v-model="viewDialog.visible">
                  <ViewOrderDetailsDialog
                     :itemIdSelect="itemIdSelect"
                     @onCloseDialog="handleCloseDialog"
                  />
               </el-dialog>
            </div>
         </div>
      </div>
   </div>
</template>

<script>
import { ElMessage } from "element-plus";

import ArgonInput from "@/components/ArgonInput.vue";
import ArgonButton from "@/components/ArgonButton.vue";
import ArgonPagination from "@/components/ArgonPagination.vue";
import ArgonPaginationItem from "@/components/ArgonPaginationItem.vue";

import ViewOrderDetailsDialog from "./components/dialogs/ViewOrderDetailsDialog.vue";

import * as API from "@/helpers/api.js";
const apiPath = process.env.VUE_APP_SERVER_PATH_API;
const apiGroup = "order";

import { functions } from "@/helpers/constants.js";
import Funcs from "@/helpers/funcs.js";

export default {
   name: "OrderView",
   components: {
      ArgonInput,
      ArgonButton,
      ArgonPagination,
      ArgonPaginationItem,
      ViewOrderDetailsDialog,
   },
   data() {
      return {
			// Funcs
         toVND: Funcs.toVND,

         // Import constants
         functions,

         // Search
         searchPlaceholder: "Nhập ID (mã đơn hàng)...",
         searchType: "id",
         searchValue: "",
         searchOptions: [
            { value: "id", title: "ID (mã đơn hàng)" },
            { value: "fullname", title: "Họ tên" },
            { value: "streetAddress", title: "Địa chỉ" },
            { value: "city", title: "Thành phố" },
            { value: "phone", title: "Số điện thoại" },
            { value: "email", title: "Email" },
         ],

         // Fill
         fillPlaceholder: "Chọn trạng thái đơn hàng",
         fillType: "orderStatusId",
         fillValue: "",
         fillOptions: [],

         // Table states
         tableData: [],
         totalItem: 0,
         numberOfPage: 1,
         currentPage: 1,
         limit: 10,
         offset: 0,

         // Actions
         itemIdSelect: "",

         // Add dialog
         viewDialog: {
            visible: false,
         },
      };
   },
   methods: {
      getOrderStatusList() {
         return API.get(apiPath + `/order_status/get_list.php`, {}, (data) => {
            if (data.code === 1) {
               this.fillOptions = data.data.map((i) => ({
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
      getTableData() {
         return API.get(
            apiPath + `/${apiGroup}/get_list.php`,
            {
               limit: this.limit,
               offset: this.offset,
               searchType: this.searchType,
               searchValue: this.searchValue,
               fillType: this.fillType,
               fillValue: this.fillValue,
            },
            (data) => {
               if (data.code === 1) {
                  // TABLE STATES
                  this.tableData = data.data.map((item) => ({
                     ...item,
                     id: +item.id,
                     couponCodeId: +item.couponCodeId,
                     deliveryCost: +item.deliveryCost,
                     totalCost: +item.totalCost,
                     paymentCost: +item.paymentCost,
                     orderStatusId: +item.orderStatusId,
                  }));
                  this.totalItem = +data.totalItem;
                  this.numberOfPage = Math.ceil(this.totalItem / this.limit);

                  // Not found data
                  if (data.data.length === 0) {
                     if (+data.totalItem <= 0) {
                        ElMessage({
                           message: "Không có dữ liệu",
                           type: "warning",
                        });
                     } else {
                        this.handlePrevPage();
                     }
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
      reloadDataCurrentPage() {
         this.getTableData();
      },
      handleChoosePage(page) {
         this.currentPage = page;
         this.offset = (page - 1) * this.limit;
         this.getTableData();
      },
      handleNextPage() {
         this.currentPage++;
         if (this.currentPage >= this.numberOfPage) {
            this.currentPage = this.numberOfPage;
         }
         this.offset = (this.currentPage - 1) * this.limit;
         this.getTableData();
      },
      handlePrevPage() {
         this.currentPage--;
         if (this.currentPage <= 1) {
            this.currentPage = 1;
         }
         this.offset = (this.currentPage - 1) * this.limit;
         this.getTableData();
      },
      handleDeleteItem(id) {
         return API.deleteById(
            apiPath + `/${apiGroup}/trash.php`,
            id,
            (data) => {
               if (data.code === 1) {
                  ElMessage({
                     message: "Xóa thành công",
                     type: "success",
                  });
                  this.reloadDataCurrentPage();
               } else {
                  ElMessage({
                     message: data.message,
                     type: "error",
                  });
               }
            }
         );
      },
      handleReload() {
         // Reset search value
         this.$refs.searchRef.resetValue();
         this.searchValue = "";
         // Reset fill value
         this.fillValue = "";

         // Reset page
         this.handleChoosePage(1);
      },
      handleSearch() {
         if (this.searchValue === "") {
            ElMessage({
               message: "Thông tin tìm kiếm trống",
               type: "warning",
            });
            return;
         }

         // Reset limit & offset
         this.currentPage = 1;
         this.limit = 10;
         this.offset = 0;

         this.getTableData();
      },
      handleFill() {
         if (this.fillValue === "") return;

         // Reset limit & offset
         this.currentPage = 1;
         this.limit = 10;
         this.offset = 0;

         this.getTableData();
      },
      handleOpenViewDetailsDialog(id) {
         this.itemIdSelect = id;
         this.viewDialog.visible = true;
      },
      handleCloseDialog(type) {
         if (type === "view") {
            this.viewDialog.visible = false;
         }

         this.reloadDataCurrentPage();
      },
   },
   async created() {
      await this.getOrderStatusList();
      await this.getTableData();
   },
};
</script>

<style lang="scss" scoped>
@import "@/assets/scss/my_styles/table.scss";
</style>
