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
                                    searchType === 'username'
                                       ? 'Nhập tên đăng nhập'
                                       : searchType === 'nickname'
                                       ? 'Nhập biệt danh'
                                       : searchType === 'email'
                                       ? 'Nhập email'
                                       : searchType === 'phone'
                                       ? 'Nhập số điện thoại'
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
                           <h6>Danh sách admin ({{ tableData.length }})</h6>
                        </div>
                        <div
                           class="col-6 text-end"
                           v-if="
                              checkPermissionFunction(
                                 functions.RegisterSystemAdmin
                              )
                           "
                        >
                           <argon-button
                              color="info"
                              variant="gradient"
                              @click="handleOpenAddDialog"
                           >
                              <i class="fas fa-plus me-2"></i>
                              Thêm admin
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
                                    Avatar &amp; Tên đăng nhập
                                 </th>
                                 <th
                                    class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2"
                                 >
                                    Biệt danh
                                 </th>
                                 <th
                                    class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2"
                                 >
                                    Email
                                 </th>
                                 <th
                                    class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2"
                                 >
                                    Số điện thoại
                                 </th>
                                 <th
                                    class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2"
                                 >
                                    Vai trò
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
                                                item.avatarUrl
                                                   ? item.avatarUrl
                                                   : `${require('@/assets/img/no-image.jpg')}`
                                             "
                                             class="avatar avatar-sm rounded-circle me-2"
                                             alt="avatar url"
                                          />
                                       </div>
                                       <div class="my-auto">
                                          <h6 class="mb-0 text-sm">
                                             {{ item.username }}
                                          </h6>
                                       </div>
                                    </div>
                                 </td>
                                 <td>
                                    <p class="text-sm font-weight-bold mb-0">
                                       {{ item.nickname }}
                                    </p>
                                 </td>
                                 <td>
                                    <p class="text-sm font-weight-bold mb-0">
                                       {{ item.email }}
                                    </p>
                                 </td>
                                 <td>
                                    <p class="text-sm font-weight-bold mb-0">
                                       {{ item.phone }}
                                    </p>
                                 </td>
                                 <td>
                                    <p class="text-sm font-weight-bold mb-0">
                                       {{ item.systemRoleName }}
                                    </p>
                                 </td>
                                 <td class="align-middle">
                                    <div class="ms-auto text-end action-btns">
                                       <a
                                          v-if="
                                             checkPermissionFunction(
                                                functions.ResetPasswordSystemAdmin
                                             )
                                          "
                                          :class="{
                                             'btn btn-link text-warning text-gradient px-2 mb-0': true,
                                             notAllowCursor:
                                                resetPasswordButtonClicked,
                                          }"
                                          href="javascript:;"
                                          @click.prevent="
                                             () =>
                                                !resetPasswordButtonClicked &&
                                                handleResetPassword(item.id)
                                          "
                                       >
                                          <tippy
                                             content="Mật khẩu mới sẽ được gửi về email"
                                             theme="light"
                                          >
                                             <i
                                                class="fas fa-key me-2"
                                                aria-hidden="true"
                                             ></i>
                                             {{
                                                resetPasswordButtonClicked
                                                   ? "Vui lòng đợi..."
                                                   : "Reset mật khẩu"
                                             }}
                                          </tippy>
                                       </a>
													<a
														v-if="checkPermissionFunction(functions.UpdateSystemRoleForSystemAdmin)"
                                          class="btn btn-link text-dark text-gradient px-2 mb-0"
                                          href="javascript:;"
                                          @click.prevent="() => handleOpenEditDialog(item.id)"
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
                                                functions.TrashSystemAdmin
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
            <!-- Add dialog -->
            <div v-if="addDialog.visible">
               <el-dialog v-model="addDialog.visible">
                  <RegisterSystemAdminDialog
                     @onCloseDialog="handleCloseDialog"
                  />
               </el-dialog>
            </div>
				<!-- Edit dialog -->
            <div v-if="editDialog.visible">
               <el-dialog v-model="editDialog.visible">
                  <EditSystemAdminDialog
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

import RegisterSystemAdminDialog from "./components/dialogs/RegisterSystemAdminDialog.vue";
import EditSystemAdminDialog from "./components/dialogs/EditSystemAdminDialog.vue";

import * as API from "@/helpers/api.js";
const apiPath = process.env.VUE_APP_SERVER_PATH_API;
const apiGroup = "system_admin";

import { functions } from "@/helpers/constants.js";
import Funcs from "@/helpers/funcs.js";

export default {
   name: "SystemAdminView",
   components: {
      ArgonInput,
      ArgonButton,
      ArgonPagination,
      ArgonPaginationItem,
      RegisterSystemAdminDialog,
      EditSystemAdminDialog,
   },
   data() {
      return {
         // Import constants
         functions,

         // Search
         searchPlaceholder: "Nhập tên đăng nhập...",
         searchType: "username",
         searchValue: "",
         searchOptions: [
            { value: "username", title: "Tên đăng nhập" },
            { value: "nickname", title: "Biệt danh" },
            { value: "email", title: "Email" },
            { value: "phone", title: "Số điện thoại" },
         ],

         // Fill
         fillPlaceholder: "Chọn vai trò",
         fillType: "systemRoleId",
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
         addDialog: {
            visible: false,
         },
			// Edit dialog
         editDialog: {
            visible: false,
         },

         // Label reset password button
         resetPasswordButtonClicked: false,
      };
   },
   methods: {
      async getSystemRoleList() {
         return API.get(apiPath + `/system_role/get_list.php`, {}, (data) => {
            if (data.code === 1) {
               this.fillOptions = data.data.map((i) => ({
                  value: +i.id,
                  title: i.name,
               }));

               // Not found data
               if (data.data.length === 0) {
                  ElMessage({
                     message: "Không có dữ liệu danh sách vai trò",
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
      async getTableData() {
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
                     systemRoleId: +item.systemRoleId,
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
      handleOpenAddDialog() {
         this.addDialog.visible = true;
      },
		handleOpenEditDialog(id) {
			this.itemIdSelect = id;
			this.editDialog.visible = true;
		},
      handleCloseDialog(type) {
         if (type === "add") {
            this.addDialog.visible = false;
         } else if (type === "edit") {
            this.editDialog.visible = false;
         }

         this.reloadDataCurrentPage();
      },
      handleResetPassword(systemAdminId) {
         this.resetPasswordButtonClicked = true;
         return API.put(
            apiPath + `/${apiGroup}/reset_password.php`,
            {
               id: systemAdminId,
            },
            (data) => {
               if (data.code === 1) {
                  this.resetPasswordButtonClicked = false;
                  ElMessage({
                     message: "Reset mật khẩu thành công",
                     type: "success",
                  });
               } else {
                  ElMessage({
                     message: data.message,
                     type: "error",
                  });
               }
            }
         );
      },
   },
   async created() {
      await this.getSystemRoleList();
      await this.getTableData();
   },
};
</script>

<style lang="scss" scoped>
@import "@/assets/scss/my_styles/table.scss";
</style>
