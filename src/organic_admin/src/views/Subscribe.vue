<template>
   <div class="py-4 container-fluid">
      <div class="row">
         <div class="col-12">
            <!-- Controllers -->
            <div class="card mb-4">
               <div class="card-body px-4 pt-4 pb-4">
                  <div class="row">
                     <div class="col-12">
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
                                 :placeholder="searchPlaceholder"
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
                           <h6>Danh sách KH đăng ký ({{ tableData.length }})</h6>
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
                                    Email
                                 </th>
											<th
                                    class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2"
                                 >
                                    Thời gian đăng ký
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
                                          {{ item.email }}
                                       </h6>
                                    </div>
                                 </td>
											<td>
                                    <p class="text-sm font-weight-bold mb-0">
                                       {{ item.createdAt }}
                                    </p>
                                 </td>
                                 <td class="align-middle">
                                    <div class="ms-auto text-end action-btns">
                                       <el-popconfirm
														v-if="checkPermissionFunction(functions.TrashSubscribe)"
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

import * as API from "@/helpers/api.js";
const apiPath = process.env.VUE_APP_SERVER_PATH_API;
const apiGroup = "subscribe";

import { functions } from "@/helpers/constants.js";
import Funcs from "@/helpers/funcs.js";

export default {
   name: "SubscribeView",
   components: {
      ArgonInput,
      ArgonButton,
      ArgonPagination,
      ArgonPaginationItem,
   },
   data() {
      return {
			// Import constants
			functions,

         // Search
         searchPlaceholder: "Nhập email...",
         searchType: "email",
         searchValue: "",

         // Table states
         tableData: [],
         totalItem: 0,
         numberOfPage: 1,
         currentPage: 1,
         limit: 10,
         offset: 0,

         // Actions
         itemIdSelect: "",
      };
   },
   methods: {
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
            },
            (data) => {
               if (data.code === 1) {
                  // TABLE STATES
                  this.tableData = data.data.map((item) => ({
                     ...item,
                     id: +item.id,
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
   },
   created() {
      this.getTableData();
   },
};
</script>

<style lang="scss" scoped>
@import "@/assets/scss/my_styles/table.scss";
</style>
