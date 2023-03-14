<template>
   <div class="py-4 container-fluid">
      <div class="row">
         <div class="col-12">
            <!-- Controllers -->
            <div class="card mb-4">
               <div class="card-body px-4 pt-4 pb-4">
                  <div class="row">
                     <div class="col-12 mb-4">
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
                                 Lọc theo loại
                              </h6>
                           </div>
                           <div class="selection-wrap">
                              <el-select
                                 v-model="fillTypeByType"
                                 filterable
                                 :placeholder="fillByTypePlaceholder"
                                 @change="handleFillByType"
                              >
                                 <el-option
                                    v-for="item in fillByTypeOptions"
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
                                 Lọc theo danh mục
                              </h6>
                           </div>
                           <div class="selection-wrap">
                              <el-select
                                 v-model="fillValueByProductCategory"
                                 filterable
                                 :placeholder="fillByProductCategoryPlaceholder"
                                 @change="handleFillByProductCategory"
                              >
                                 <el-option
                                    v-for="item in fillByProductCategoryOptions"
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
                           <h6>Danh sách sản phẩm ({{ tableData.length }})</h6>
                        </div>
                        <div
                           class="col-6 text-end"
                           v-if="checkPermissionFunction(functions.AddProduct)"
                        >
                           <argon-button
                              color="info"
                              variant="gradient"
                              @click="handleRedirectToAddProductView"
                           >
                              <i class="fas fa-plus me-2"></i>
                              Thêm sản phẩm
                           </argon-button>
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
                                    Loại đặc biệt
                                 </th>
                                 <th
                                    class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2"
                                 >
                                    Loại mới
                                 </th>
                                 <th
                                    class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2"
                                 >
                                    Loại ưu đãi tốt
                                 </th>
                                 <th
                                    class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2"
                                 >
                                    Danh mục
                                 </th>
                                 <th></th>
                              </tr>
                           </thead>
                           <tbody>
                              <!-- Table List -->
                              <tr v-for="item in tableData" :key="item.id">
                                 <td>
                                    <div class="d-flex px-2">
                                       <div>
                                          <img
                                             :src="
                                                item.featureImageUrl
                                                   ? item.featureImageUrl
                                                   : `${require('@/assets/img/no-image.jpg')}`
                                             "
                                             class="avatar avatar-sm rounded-circle me-2"
                                             alt="feature image url"
                                          />
                                       </div>
                                       <div class="my-auto">
                                          <h6 class="mb-0 text-sm">
                                             {{ item.name }}
                                          </h6>
                                       </div>
                                    </div>
                                 </td>
                                 <td>
                                    <p class="text-sm font-weight-bold mb-0">
                                       {{ toVND(item.originPrice, "đ") }}
                                    </p>
                                 </td>
                                 <td>
                                    <p class="text-sm font-weight-bold mb-0">
                                       {{ toVND(item.promotionPrice, "đ") }}
                                    </p>
                                 </td>
                                 <td>
                                    <p class="text-sm font-weight-bold mb-0">
                                       {{ item.isSpecial ? "Có" : "Không" }}
                                    </p>
                                 </td>
                                 <td>
                                    <p class="text-sm font-weight-bold mb-0">
                                       {{ item.isNew ? "Có" : "Không" }}
                                    </p>
                                 </td>
                                 <td>
                                    <p class="text-sm font-weight-bold mb-0">
                                       {{ item.isBestOffer ? "Có" : "Không" }}
                                    </p>
                                 </td>
                                 <td>
                                    <p class="text-sm font-weight-bold mb-0">
                                       {{ item.productCategoryName }}
                                    </p>
                                 </td>
                                 <td class="align-middle">
                                    <div class="ms-auto text-end action-btns">
                                       <a
                                          v-if="
                                             checkPermissionFunction(
                                                functions.UpdateProduct
                                             )
                                          "
                                          class="btn btn-link text-dark text-gradient px-2 mb-0"
                                          href="javascript:;"
                                          @click.prevent="() => handleRedirectToEditProductView(item.id)"
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
                                                functions.TrashProduct
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
const apiGroup = "product";

import { menus, functions } from "@/helpers/constants.js";
import Funcs from "@/helpers/funcs.js";

export default {
   name: "ProductView",
   components: {
      ArgonInput,
      ArgonButton,
      ArgonPagination,
      ArgonPaginationItem,
   },
   data() {
      return {
         // funcs
         toVND: Funcs.toVND,

         // Import constants
         functions,

         // Search
         searchPlaceholder: "Nhập tên danh mục...",
         searchType: "name",
         searchValue: "",

         // Fill by type
         fillByTypePlaceholder: "Chọn loại",
         fillTypeByType: "",
         fillValueByType: 1,
         fillByTypeOptions: [
            { value: "isSpecial", title: "Đặc biệt" },
            { value: "isNew", title: "Mới" },
            { value: "isBestOffer", title: "Ưu đãi tốt" },
         ],

         // Fill by product category
         fillByProductCategoryPlaceholder: "Chọn danh mục",
         fillTypeByProductCategory: "productCategoryId",
         fillValueByProductCategory: "",
         fillByProductCategoryOptions: [],

         // Sort
         sortPlaceholder: "Chọn kiểu sắp xếp",
         sortValue: "",
         sortOptions: [
            { value: "originPrice_ASC", title: "Tăng theo giá gốc" },
            { value: "originPrice_DESC", title: "Giảm theo giá gốc" },
            { value: "promotionPrice_ASC", title: "Tăng theo giá ưu đãi" },
            { value: "promotionPrice_DESC", title: "Giảm theo giá ưu đãi" },
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
         addDialog: {
            visible: false,
         },
         // Edit dialog
         editDialog: {
            visible: false,
         },
      };
   },
   methods: {
      async getProductCategoryList() {
         return API.get(
            apiPath + `/product_category/get_list.php`,
            {},
            (data) => {
               if (data.code === 1) {
                  this.fillByProductCategoryOptions = data.data.map((i) => ({
                     value: +i.id,
                     title: i.name,
                  }));

                  // Not found data
                  if (data.data.length === 0) {
                     ElMessage({
                        message: "Không có dữ liệu danh mục sản phẩm",
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
      checkPermissionFunction(functionName) {
         return Funcs.checkPermissionFunction(functionName);
      },
      async getTableData() {
         return API.get(
            apiPath + `/${apiGroup}/get_list.php`,
            {
               limit: this.limit,
               offset: this.offset,
               searchType: this.searchType,
               searchValue: this.searchValue,
               fillType: (() => {
                  if (this.fillTypeByType !== "") {
                     return this.fillTypeByType;
                  }

                  if (this.fillValueByProductCategory !== "") {
							return this.fillTypeByProductCategory;
						}

						return '';
               })(),
               fillValue: (() => {
                  if (this.fillTypeByType !== "") {
                     return this.fillValueByType;
                  }

						if (this.fillValueByProductCategory !== "") {
							return this.fillValueByProductCategory;
						}

						return '';
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
            },
            (data) => {
               if (data.code === 1) {
                  // TABLE STATES
                  this.tableData = data.data.map((item) => ({
                     ...item,
                     id: +item.id,
                     originPrice: +item.originPrice,
                     promotionPrice: +item.promotionPrice,
                     isSpecial: +item.isSpecial == 1,
                     isNew: +item.isNew == 1,
                     isBestOffer: +item.isBestOffer == 1,
                     productCategoryId: +item.productCategoryId,
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
         // Reset fill type & value
         this.fillTypeByType = "";
         this.fillValueByProductCategory = "";
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
      handleFillByType() {
         if (this.fillTypeByType === "") return;

         this.fillValueByProductCategory = "";

         // Reset limit & offset
         this.currentPage = 1;
         this.limit = 10;
         this.offset = 0;

         this.getTableData();
      },
      handleFillByProductCategory() {
         if (this.fillValueByProductCategory === "") return;

         this.fillTypeByType = "";

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
      handleRedirectToAddProductView() {
			this.$router.push({ name: menus.AddProduct });
      },
      handleRedirectToEditProductView(id) {
			this.$router.push({ name: menus.EditProduct, params: { id } });
      }
   },
   async created() {
      await this.getProductCategoryList();
      await this.getTableData();
   },
};
</script>

<style lang="scss" scoped>
@import "@/assets/scss/my_styles/table.scss";
</style>
