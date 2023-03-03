<template>
   <div class="py-4 container-fluid">
      <div class="row">
         <div class="col-12">
            <div class="card mb-4">
               <div class="card-header pb-2">
                  <h6>Tìm kiếm</h6>
               </div>
               <div class="card-body px-4 pt-0 pb-4">
                  <div class="search-wrap">
                     <argon-input
                        ref="searchTagNameRef"
                        type="search"
                        icon="fas fa-search"
                        iconDir="left"
                        placeholder="Nhập tên thẻ..."
                        v-model="searchInfo.name"
                     />
                     <argon-button
                        color="primary"
                        size="sm"
                        variant="gradient"
                        @click="search"
                     >
                        Tìm kiếm
                     </argon-button>
                     <argon-button
                        color="dark"
                        size="sm"
                        class="reload-button"
                        @click="reload"
                     >
                        Tải lại
                     </argon-button>
                  </div>
               </div>
            </div>
         </div>
         <div class="col-12" v-show="action === 'add' || action === 'edit'">
            <div class="card mb-4">
               <div class="card-header pb-2">
                  <h6>Thêm &amp; Thay đổi</h6>
               </div>
               <div class="card-body px-4 pt-0 pb-4">
                  <div class="search-wrap">
                     <argon-input
                        ref="tagNameRef"
                        :icon="
                           action === 'add'
                              ? 'fas fa-plus'
                              : 'fas fa-pencil-alt'
                        "
                        iconDir="left"
                        placeholder="Nhập tên thẻ"
                        v-model="addOrEditValue.name"
                     />
                     <argon-button
                        color="primary"
                        size="sm"
                        variant="gradient"
                        @click="addOrEditSubmit"
                     >
                        {{ action === "add" ? "Thêm" : "Cập nhật" }}
                     </argon-button>
                     <argon-button
                        color="dark"
                        size="sm"
                        class="close-add-button"
                        @click="closeAddOrEditCard"
                     >
                        Đóng
                     </argon-button>
                  </div>
               </div>
            </div>
         </div>
         <div class="col-12">
            <TagTable ref="tableRef" @onShowAddOrEditCard="showAddOrEditCard" />
         </div>
      </div>
   </div>
</template>

<script>
import * as API from "@/helpers/api.js";

import TagTable from "./components/TagTable.vue";
import ArgonInput from "@/components/ArgonInput.vue";
import ArgonButton from "@/components/ArgonButton.vue";

import { ElMessage } from "element-plus";

const apiPath = process.env.VUE_APP_SERVER_PATH_API;

export default {
   name: "tag",
   components: {
      TagTable,
      ArgonInput,
      ArgonButton,
   },
   data() {
      return {
         action: "",
         addOrEditValue: {
            name: "",
         },
         itemIDActionEdit: 0,
         searchInfo: {
            name: "",
         },
      };
   },
   methods: {
      showAddOrEditCard(action, tag) {
         this.action = action;

         if (action === "add") {
            this.$refs.tagNameRef.resetValue();
         } else if (action === "edit" && tag != null) {
            this.itemIDActionEdit = tag.id;
            this.$refs.tagNameRef.setValue(tag.name);
         }
      },
      closeAddOrEditCard() {
         this.action = "";
      },
      addOrEditSubmit() {
         if (this.action === "") return;

         if (this.action === "add" && this.addOrEditValue.name === "") {
            ElMessage({
               message: "Tên thẻ không được để trống",
               type: "warning",
            });
            return;
         }

         if (this.action === "edit" && this.addOrEditValue.name === "") {
            ElMessage({
               message:
                  "Tên thẻ không được để trống hoặc không được trùng với tên hiện tại",
               type: "warning",
            });
            return;
         }

         if (this.action === "add") {
            return API.post(
               apiPath + "/tag/add.php",
               { name: this.addOrEditValue.name },
               (data) => {
                  if (data.code === 1) {
                     ElMessage({
                        message: "Thêm thành công",
                        type: "success",
                     });
                     
                     this.addOrEditValue.name = "";
                     this.$refs.tagNameRef.resetValue();

                     this.reloadTableData();
                  } else if (data.code === 2) {
                     ElMessage({
                        message: "Thêm thất bại",
                        type: "error",
                     });
                  } else if (data.code === 3) {
                     ElMessage({
                        message: "Tên thẻ đã tồn tại",
                        type: "warning",
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
         } else if (this.action === "edit") {
            return API.post(
               apiPath + "/tag/update.php",
               {
                  id: this.itemIDActionEdit,
                  name: this.addOrEditValue.name,
               },
               (data) => {
                  if (data.code === 1) {
                     ElMessage({
                        message: "Thay đổi thành công",
                        type: "success",
                     });
                     this.reloadTableData();
                  } else if (data.code === 2) {
                     ElMessage({
                        message: "Thay đổi thất bại",
                        type: "error",
                     });
                  } else if (data.code === 3) {
                     ElMessage({
                        message: "Tên thẻ đã tồn tại",
                        type: "warning",
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
         }
      },
      reloadTableData() {
         this.$refs.tableRef.reload();
      },
      reload() {
         this.$refs.tableRef.choosePage(1);
         this.$refs.searchTagNameRef.setValue("");

         this.searchInfo.name = "";
      },
      search() {
         if (this.searchInfo.name === "") {
            ElMessage({
               message: "Tên danh mục tìm kiếm trống",
               type: "warning",
            });
            return;
         }
         this.$refs.tableRef.getTableData(this.searchInfo);
      },
   },
};
</script>

<style lang="scss" scoped>
.reload-button,
.close-add-button {
   margin-left: 20px;
}
</style>
