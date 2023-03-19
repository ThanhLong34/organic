<template>
   <div class="py-4 container-fluid">
      <div class="row">
         <div class="col-12">
            <!-- Controllers -->
            <div class="card mb-4">
               <div class="card-body px-4 pt-4 pb-4">
                  <div class="row">
                     <div class="col-8">
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
                           <h6>
                              Danh sách tệp hình ảnh ({{ tableData.length }})
                           </h6>
                        </div>
                        <div
                           class="col-6 text-end"
                           v-if="
                              checkPermissionFunction(
                                 functions.RemoveImageDontUse
                              )
                           "
                        >
                           <argon-button
                              color="danger"
                              variant="gradient"
                              @click="
                                 () =>
                                    !disableRemoveAllImageFileDontUsing &&
                                    handleRemoveImageDontUsing()
                              "
                              :disabled="disableRemoveAllImageFileDontUsing"
                           >
                              <i class="fas fa-plus me-2"></i>
                              Xóa các hình ảnh không sử dụng
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
                                    Hình ảnh
                                 </th>
                                 <th
                                    class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2"
                                 >
                                    Tên tệp
                                 </th>
                                 <th
                                    class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2"
                                 >
                                    Kích thước tệp (MB)
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
                                    <div class="d-flex px-2">
                                       <img
                                          :src="
                                             item.link
                                                ? item.link
                                                : `${require('@/assets/img/no-image.jpg')}`
                                          "
                                          class="avatar avatar-sm rounded-circle me-2"
                                          alt="avatar"
                                       />
                                    </div>
                                 </td>
                                 <td>
                                    <p class="text-sm font-weight-bold mb-0">
                                       {{ item.filename }}
                                    </p>
                                 </td>
                                 <td>
                                    <p class="text-sm font-weight-bold mb-0">
                                       {{ getMbFromFileSize(item.size) }}
                                    </p>
                                 </td>
                                 <td>
                                    <span
                                       class="badge badge-md"
                                       :class="
                                          dontUsingImageIdListValue.includes(
                                             item.id
                                          )
                                             ? 'bg-gradient-secondary'
                                             : 'bg-gradient-success'
                                       "
                                    >
                                       {{
                                          dontUsingImageIdListValue.includes(
                                             item.id
                                          )
                                             ? "Không sử dụng"
                                             : "Đang sử dụng"
                                       }}
                                    </span>
                                 </td>
                                 <td class="align-middle">
                                    <div class="ms-auto text-end action-btns">
                                       <a
                                          v-if="
                                             checkPermissionFunction(
                                                functions.ViewImage
                                             )
                                          "
                                          class="btn btn-link text-info text-gradient px-2 mb-0"
                                          href="javascript:;"
                                          @click="handleViewImage(item.link)"
                                       >
                                          <i
                                             class="fas fa-eye me-2"
                                             aria-hidden="true"
                                          ></i
                                          >Xem
                                       </a>
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
            <!-- View image dialog -->
            <el-dialog v-model="viewImageDialog.visible">
               <img
                  class="image-preview"
                  w-full
                  :src="viewImageDialog.url"
                  alt="Preview Image"
               />
            </el-dialog>
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
const apiGroup = "image";

import { functions } from "@/helpers/constants.js";
import Funcs from "@/helpers/funcs.js";

export default {
   name: "ImageView",
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
         searchPlaceholder: "Nhập tên tệp...",
         searchType: "filename",
         searchValue: "",

         // Fill
         fillPlaceholder: "Chọn trạng thái",
         fillType: "target",
         fillValue: "",
         fillOptions: [
            { value: "using", title: "Đang sử dụng" },
            { value: "dont_using", title: "Không sử dụng" },
         ],

         // Table states
         tableData: [],
         totalItem: 0,
         numberOfPage: 1,
         currentPage: 1,
         limit: 10,
         offset: 0,

         // View image dialog
         viewImageDialog: {
            visible: false,
            url: null,
         },

         // Actions
         disableRemoveAllImageFileDontUsing: false,

         // Dont usingimage id list
         dontUsingImageIdList: [],
      };
   },
   computed: {
      dontUsingImageIdListValue() {
         return this.dontUsingImageIdList;
      },
   },
   methods: {
      async getDontUsingImageIdList() {
         return API.get(
            apiPath + `/${apiGroup}/get_list.php`,
            {
               target: "dont_using",
            },
            (data) => {
               if (data.code === 1) {
                  this.dontUsingImageIdList = data.data.map((i) => +i.id);
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
               target: this.fillValue === "" ? "all" : this.fillValue,
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
            apiPath + `/${apiGroup}/delete.php`,
            id,
            (data) => {
               if (data.code === 1) {
                  //
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
      handleViewImage(url) {
         this.viewImageDialog.url = url;
         this.viewImageDialog.visible = true;
      },
      handleRemoveImageDontUsing() {
         this.disableRemoveAllImageFileDontUsing = true;
         this.dontUsingImageIdList &&
            this.dontUsingImageIdList.forEach(async (id, index, array) => {
               await this.handleDeleteItem(id);
               if (index >= array.length - 1) {
                  ElMessage({
                     message: "Xóa thành công",
                     type: "success",
                  });
						this.handleReload();
               }
            });
      },
      getMbFromFileSize(fileSize) {
         return (fileSize / (1024 * 1024)).toFixed(2);
      },
   },
   async created() {
      await this.getDontUsingImageIdList();
      await this.getTableData();
   },
};
</script>

<style lang="scss" scoped>
@import "@/assets/scss/my_styles/table.scss";
</style>
