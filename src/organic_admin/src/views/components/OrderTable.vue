<template>
   <div class="card mb-4">
      <div class="card-header pb-0">
         <div class="row">
            <div class="col-6 d-flex align-items-center">
               <h6>Danh sách đơn hàng ({{ tableData.length }})</h6>
            </div>
         </div>
      </div>
      <div class="card-body px-0 pt-0 pb-2">
         <div class="table-responsive p-0">
            <table class="table align-items-center justify-content-center mb-0">
               <thead>
                  <tr>
                     <th
                        class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7"
                     >
                        Tên đăng nhập
                     </th>
                     <th
                        class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2"
                     >
                        Mã đơn hàng
                     </th>
                     <th
                        class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2"
                     >
                        Tổng tiền (VND)
                     </th>
                     <th
                        class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2"
                     >
                        Tạo lúc
                     </th>
                     <th
                        class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2"
                     >
                        Trạng thái
                     </th>
                     <th></th>
                  </tr>
               </thead>
               <tbody>
                  <!-- Table List -->
                  <tr v-for="item in tableData" :key="item.id">
                     <td>
                        <div class="my-auto" style="margin-left: 16px">
                           <h6 class="mb-0 text-sm">{{ item.username }}</h6>
                        </div>
                     </td>
                     <td>
                        <p class="text-sm font-weight-bold mb-0">
                           {{ item.code }}
                        </p>
                     </td>
                     <td>
                        <p class="text-sm font-weight-bold mb-0">
                           {{
                              item.total.toLocaleString("it-IT", {
                                 style: "currency",
                                 currency: "VND",
                              })
                           }}
                        </p>
                     </td>
                     <td>
                        <p class="text-sm font-weight-bold mb-0">
                           {{ item.createdAt }}
                        </p>
                     </td>
                     <td>
                        <span
                           class="badge badge-md"
                           :class="{
                              'bg-gradient-secondary': item.status == 0,
                              'bg-gradient-success': item.status == 1,
                              'bg-gradient-warning': item.status == 2,
                           }"
                        >
                           {{
                              item.status == 0
                                 ? "Đang chờ duyệt"
                                 : item.status == 1
                                 ? "Đã duyệt"
                                 : item.status == 2
                                 ? "Đã từ chối"
                                 : "Không biết"
                           }}
                        </span>
                     </td>
                     <td class="align-middle">
                        <div class="ms-auto text-end action-btns">
                           <a
                              class="btn btn-link text-info text-gradient px-2 mb-0"
                              href="javascript:;"
                              @click="openOrderDetailsDialog(item.id)"
                           >
                              <i class="fas fa-eye me-2" aria-hidden="true"></i
                              >Xem
                           </a>
                           <el-popconfirm
                              confirm-button-text="OK"
                              cancel-button-text="Hủy"
                              title="Xác nhận xóa"
                              @confirm="deleteItem(item.id)"
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
         <div class="not-found-data-text" v-show="tableData.length === 0">
            Không tìm thấy dữ liệu
         </div>
         <!-- Pagination -->
         <div class="pagination">
            <argon-pagination size="sm" color="primary">
               <argon-pagination-item prev @click="prevPage" />
               <argon-pagination-item
                  v-for="page in numberOfPage"
                  :key="page"
                  :label="`${page}`"
                  :class="{
                     active: currentPage === page,
                  }"
                  @click="choosePage(page)"
               />
               <argon-pagination-item next @click="nextPage" />
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
         <!-- Dialog table -->
         <div v-if="dialogDetails.visible">
            <el-dialog v-model="dialogDetails.visible">
               <OrderDetailsDialog
                  :orderID="dialogDetails.orderID"
                  @onCloseDialog="closeOrderDetailsDialog"
               />
            </el-dialog>
         </div>
      </div>
   </div>
</template>

<script>
import * as API from "@/helpers/api.js";

import ArgonPagination from "@/components/ArgonPagination.vue";
import ArgonPaginationItem from "@/components/ArgonPaginationItem.vue";
import OrderDetailsDialog from "@/views/components/OrderDetailsDialog.vue";

import { ElMessage } from "element-plus";

const apiPath = process.env.VUE_APP_SERVER_PATH_API;

export default {
   name: "order-table",
   components: {
      ArgonPagination,
      ArgonPaginationItem,
      OrderDetailsDialog,
   },
   data() {
      return {
         tableData: [],
         totalItem: 0,
         numberOfPage: 1,
         currentPage: 1,
         limit: 10,
         offset: 0,
         dialogDetails: {
            visible: false,
            orderID: 0,
         },
      };
   },
   methods: {
      getTableData(searchInfo = {}, filterInfo = {}) {
         this.createPagination();

         return API.get(
            apiPath + "/order/get_list.php",
            {
               limit: this.limit,
               offset: this.offset,
               ...searchInfo,
               ...filterInfo,
            },
            (data) => {
               if (data.code === 1) {
                  if (data.data.length === 0) {
                     ElMessage({
                        message: "Không có dữ liệu",
                        type: "warning",
                     });
                  }
                  this.tableData = data.data.map((item) => ({
                     id: +item.ID,
                     username: item.Username,
                     email: item.Email,
                     phone: item.Phone,
                     code: item.Code,
                     total: +item.Total,
                     createdAt: item.CreatedAt,
                     status: item.Status,
                  }));
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
      createPagination() {
         return API.get(
            apiPath + "/order/get_list.php",
            {
               limit: 0,
               offset: 0,
            },
            (data) => {
               if (data.code === 1) {
                  this.totalItem = data.data.length;
                  this.numberOfPage = Math.ceil(data.data.length / this.limit);
               } else if (data.code === 2) {
                  ElMessage({
                     message: "Không tạo được trang cho bảng dữ liệu",
                     type: "error",
                  });
                  console.error(data.message);
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
      choosePage(page) {
         this.currentPage = page;
         this.offset = (page - 1) * this.limit;
         this.getTableData();
      },
      nextPage() {
         this.currentPage++;
         if (this.currentPage >= this.numberOfPage) {
            this.currentPage = this.numberOfPage;
         }
         this.offset = (this.currentPage - 1) * this.limit;
         this.getTableData();
      },
      prevPage() {
         this.currentPage--;
         if (this.currentPage <= 1) {
            this.currentPage = 1;
         }
         this.offset = (this.currentPage - 1) * this.limit;
         this.getTableData();
      },
      reload() {
         this.getTableData();
      },
      deleteItem(id) {
         return API.deleteById(
            apiPath + "/order/trash.php",
            id,
            (data) => {
               if (data.code === 1) {
                  ElMessage({
                     message: "Xóa thành công",
                     type: "success",
                  });
                  this.reload();
               } else if (data.code === 2) {
                  ElMessage({
                     message: "Xóa thất bại",
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
      openOrderDetailsDialog(orderID) {
         this.dialogDetails.visible = true;
         this.dialogDetails.orderID = orderID;
      },
      closeOrderDetailsDialog() {
         this.dialogDetails.visible = false;
         this.reload();
      },
   },
   created() {
      this.currentPage = 1;
      this.getTableData();
   },
};
</script>

<style lang="scss" scoped>
.pagination {
   position: relative;
   justify-content: center;
   margin-top: 20px;
}

.table-statistics {
   font-size: 12px;
   display: flex;
   align-items: center;
   position: absolute;
   right: 24px;
   top: 50%;
   transform: translateY(-50%);
}

.action-btns {
   position: relative;
   padding-right: 8px;
   a {
      font-size: 12px;
   }
}

.not-found-data-text {
   text-align: center;
   margin-top: 20px;
   font-size: 12px;
}
</style>
