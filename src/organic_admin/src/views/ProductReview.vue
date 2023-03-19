<template>
   <div class="py-4 container-fluid">
      <div class="row">
         <div class="col-12">
            <!-- Controllers -->
            <div class="card mb-4">
               <div class="card-body px-4 pt-4 pb-4">
                  <div class="row">
                     <div class="col-9 mb-4">
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
                                    searchType === 'fullname'
                                       ? 'Nhập họ tên...'
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
                     <div class="col-3 mb-4">
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
                                 Sắp xếp
                              </h6>
                           </div>
                           <div class="selection-wrap">
                              <el-select
                                 v-model="sortValue"
                                 filterable
                                 :placeholder="sortPlaceholder"
                                 @change="handleSort"
                              >
                                 <el-option
                                    v-for="item in sortOptions"
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
                                 Lọc theo trạng thái hiển thị / ẩn
                              </h6>
                           </div>
                           <div class="selection-wrap">
                              <el-select
                                 v-model="fillByIsShowValue"
                                 filterable
                                 :placeholder="fillByIsShowPlaceholder"
                                 @change="handleFillByIsShow"
                              >
                                 <el-option
                                    v-for="item in fillByIsShowOptions"
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
                                 Lọc theo trạng thái phản hồi
                              </h6>
                           </div>
                           <div class="selection-wrap">
                              <el-select
                                 v-model="fillByReplyStatusValue"
                                 filterable
                                 :placeholder="fillByReplyStatusPlaceholder"
                                 @change="handleFillByReplyStatus"
                              >
                                 <el-option
                                    v-for="item in fillByReplyStatusOptions"
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
                           <h6>
                              Danh sách đánh giá ({{ tableData.length }})
                           </h6>
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
                                    Họ tên
                                 </th>
                                 <th
                                    class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2"
                                 >
                                    Email
                                 </th>
                                 <th
                                    class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2"
                                 >
                                    Đánh giá
                                 </th>
                                 <th
                                    class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2"
                                 >
                                    Hiển thị
                                 </th>
                                 <th
                                    class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2"
                                 >
                                    Thời gian gửi
                                 </th>
                                 <th
                                    class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2"
                                 >
                                    Trạng thái phản hồi
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
                                          {{ item.fullname }}
                                       </h6>
                                    </div>
                                 </td>
                                 <td>
                                    <p class="text-sm font-weight-bold mb-0">
                                       {{ item.email }}
                                    </p>
                                 </td>
                                 <td>
                                    <p class="text-sm font-weight-bold mb-0">
                                       {{ item.rating }}
                                       <i
                                          class="fa fa-star rating-star"
                                          aria-hidden="true"
                                       ></i>
                                    </p>
                                 </td>
                                 <td>
                                    <p class="text-sm font-weight-bold mb-0">
                                       {{ item.isShow ? "Có" : "Không" }}
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
                                       :class="
                                          item.repliedAt
                                             ? 'bg-gradient-success'
                                             : 'bg-gradient-secondary'
                                       "
                                    >
                                       {{
                                          item.repliedAt
                                             ? "Đã phản hồi"
                                             : "Chưa phản hồi"
                                       }}
                                    </span>
                                 </td>
                                 <td class="align-middle">
                                    <div class="ms-auto text-end action-btns">
                                       <a
                                          v-if="
                                             checkPermissionFunction(
                                                functions.ViewProductReviewDetails
                                             )
                                          "
                                          class="btn btn-link text-info text-gradient px-2 mb-0"
                                          href="javascript:;"
                                          @click.prevent="
                                             () =>
                                                handleOpenViewDetailsDialog(
                                                   item.id
                                                )
                                          "
                                       >
                                          <i
                                             class="fas fa-eye me-2"
                                             aria-hidden="true"
                                          ></i
                                          >Xem bình luận
                                       </a>
                                       <a
                                          v-if="
                                             checkPermissionFunction(
                                                functions.UpdateProductReview
                                             )
                                          "
                                          class="btn btn-link text-dark text-gradient px-2 mb-0"
                                          href="javascript:;"
                                          @click.prevent="
                                             () =>
                                                handleOpenEditDialog(
                                                   item.id
                                                )
                                          "
                                       >
                                          <i
                                             class="fas fa-pencil-alt me-2"
                                             aria-hidden="true"
                                          ></i
                                          >Thay đổi
                                       </a>
                                       <el-popconfirm
                                          v-if="
                                             checkPermissionFunction(
                                                functions.TrashSystemRole
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
                  <!-- Buttons -->
                  <div class="card-footer">
                     <div class="col-md-12 pt-0 text-end">
                        <argon-button
                           color="warning"
                           size="sm"
                           variant="gradient"
                           class="action-btn"
                           @click="handleRedirectToBack"
                        >
                           Quay lại
                        </argon-button>
                     </div>
                  </div>
               </div>
            </div>
            <!-- View dialog -->
            <div v-if="viewDialog.visible">
               <el-dialog v-model="viewDialog.visible">
                  <ViewProductReviewDetailsDialog
                     :itemIdSelect="itemIdSelect"
                     @onCloseDialog="handleCloseDialog"
                  />
               </el-dialog>
            </div>
            <!-- Edit dialog -->
            <div v-if="editDialog.visible">
               <el-dialog v-model="editDialog.visible">
                  <EditProductReviewDialog
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

import ViewProductReviewDetailsDialog from "./components/dialogs/ViewProductReviewDetailsDialog.vue";
import EditProductReviewDialog from "./components/dialogs/EditProductReviewDialog.vue";

import * as API from "@/helpers/api.js";
const apiPath = process.env.VUE_APP_SERVER_PATH_API;
const apiGroup = "product_review";

import { functions } from "@/helpers/constants.js";
import Funcs from "@/helpers/funcs.js";

export default {
   name: "ProductReviewView",
   components: {
      ArgonInput,
      ArgonButton,
      ArgonPagination,
      ArgonPaginationItem,
      ViewProductReviewDetailsDialog,
      EditProductReviewDialog,
   },
   data() {
      return {
         // Import constants
         functions,

         data: {},

         // Search
         searchPlaceholder: "Nhập họ tên...",
         searchType: "fullname",
         searchValue: "",
         searchOptions: [
            { value: "fullname", title: "Họ tên" },
            { value: "email", title: "Email" },
         ],

         // Fill by is show
         fillByIsShowPlaceholder: "Chọn trạng thái hiển thị / ẩn",
         fillByIsShowType: "isShow",
         fillByIsShowValue: "",
         fillByIsShowOptions: [
            { value: 1, title: "Hiển thị" },
            { value: 0, title: "Ẩn" },
         ],

         // Fill by reply status
         fillByReplyStatusPlaceholder: "Chọn trạng thái hiển thị / ẩn",
         fillByReplyStatusType: "repliedAt",
         fillByReplyStatusValue: "",
         fillByReplyStatusOptions: [
            { value: "replied", title: "Đã phản hồi" },
            { value: "not_reply", title: "Chưa phản hồi" },
         ],

         // Sort
         sortPlaceholder: "Chọn kiểu sắp xếp",
         sortValue: "",
         sortOptions: [
            { value: "rating_ASC", title: "Tăng theo đánh giá" },
            { value: "rating_DESC", title: "Giảm theo đánh giá" },
         ],

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
			// Edit dialog
         editDialog: {
            visible: false,
         },
      };
   },
   methods: {
      checkPermissionFunction(functionName) {
         return Funcs.checkPermissionFunction(functionName);
      },
      getTableData() {
         return API.get(
            apiPath + `/${apiGroup}/get_list_for_product.php`,
            {
               limit: this.limit,
               offset: this.offset,
               searchType: this.searchType,
               searchValue: this.searchValue,
               fillType: (() => {
                  if (this.fillByIsShowValue !== "") {
                     return this.fillByIsShowType;
                  }

                  return "";
               })(),
               fillValue: (() => {
                  if (this.fillByIsShowValue !== "") {
                     return this.fillByIsShowValue;
                  }

                  return "";
               })(),
               orderby: (() => {
                  if (this.sortValue) {
                     return this.sortValue.split("_")[0];
                  }
                  return "id";
               })(),
               reverse: (() => {
                  if (this.sortValue) {
                     return this.sortValue.split("_")[1] === "DESC";
                  }
                  return false;
               })(),
               productId: this.data.id,
               target:
                  this.fillByReplyStatusValue === ""
                     ? "all"
                     : this.fillByReplyStatusValue,
            },
            (data) => {
               if (data.code === 1) {
                  // TABLE STATES
                  this.tableData = data.data.map((item) => ({
                     ...item,
                     id: +item.id,
                     rating: +item.rating,
                     isShow: +item.isShow == 1,
                     productId: +item.productId,
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
         this.fillByIsShowValue = "";
         this.fillByReplyStatusValue = "";
         // Reset sort value
         this.sortValue = "";

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
      handleFillByIsShow() {
         if (this.fillByIsShowValue === "") return;

         this.fillByReplyStatusValue = "";

         // Reset limit & offset
         this.currentPage = 1;
         this.limit = 10;
         this.offset = 0;

         this.getTableData();
      },
      handleFillByReplyStatus() {
         if (this.fillByReplyStatusValue === "") return;

         this.fillByIsShowValue = "";

         // Reset limit & offset
         this.currentPage = 1;
         this.limit = 10;
         this.offset = 0;

         this.getTableData();
      },
      handleSort() {
         if (this.sortValue === "") return;

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
		handleOpenEditDialog(id) {
         this.itemIdSelect = id;
         this.editDialog.visible = true;
      },
      handleCloseDialog(type) {
         if (type === "edit") {
            this.editDialog.visible = false;
         } else if (type === "view") {
            this.viewDialog.visible = false;
         }

         this.reloadDataCurrentPage();
      },
      handleRedirectToBack() {
         this.$router.go(-1);
      },
   },
   created() {
      this.data.id = this.$route.params.id;

      this.getTableData();
   },
};
</script>

<style lang="scss" scoped>
@import "@/assets/scss/my_styles/table.scss";
</style>
