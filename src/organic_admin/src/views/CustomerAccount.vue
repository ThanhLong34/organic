<template>
   <div class="py-4 container-fluid">
      <div class="row">
         <div class="col-12">
            <div class="card mb-4">
               <div class="card-header pb-2">
                  <h6>Tìm kiếm</h6>
               </div>
               <div class="card-body px-4 pt-0 pb-4">
                  <div class="row">
                     <div class="col-8">
                        <div class="search-wrap">
                           <argon-input
                              ref="searchRef"
                              type="search"
                              icon="fas fa-search"
                              iconDir="left"
                              :placeholder="
                                 searchType == 'nickname' ? 'Nhập biệt danh...' :
                                 searchType == 'email' ? 'Nhập email...' :
                                 searchType == 'phone' ? 'Nhập số điện thoại...' :
                                 'Nhập tên đăng nhập...'
                              "
                              v-model="searchValue"
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
                     <div class="col-4">
                        <div class="selection-wrap">
                           <el-select
                              v-model="searchType"
                              filterable
                              placeholder="Chọn kiểu tìm kiếm"
                           >
                              <el-option
                                 v-for="item in searchTypes"
                                 :key="item.id"
                                 :label="item.name"
                                 :value="item.id"
                              />
                           </el-select>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         <div class="col-12">
            <CustomerAccountTable ref="tableRef" />
         </div>
      </div>
   </div>
</template>

<script>
// import * as API from "@/helpers/api.js";

import CustomerAccountTable from "./components/CustomerAccountTable.vue";
import ArgonInput from "@/components/ArgonInput.vue";
import ArgonButton from "@/components/ArgonButton.vue";

// const apiPath = process.env.VUE_APP_SERVER_PATH_API;

export default {
   name: "customer-account",
   components: {
      CustomerAccountTable,
      ArgonInput,
      ArgonButton,
   },
   data() {
      return {
         searchTypes: [
            { id: "username", name: "Tên đăng nhập" },
            { id: "nickname", name: "Biệt danh" },
            { id: "email", name: "Email" },
            { id: "phone", name: "Số điện thoại" },
         ],
         searchType: "username",
         searchValue: "",
      };
   },
   methods: {
      reloadTableData() {
         this.$refs.tableRef.reload();
      },
      reload() {
         this.$refs.tableRef.choosePage(1);
         this.$refs.searchRef.setValue("");

         this.searchType = "username";
         this.searchValue = "";
      },
      search() {
         if (this.searchValue === "") return;
         
         this.$refs.tableRef.getTableData({
            searchType: this.searchType,
            searchValue: this.searchValue
         });
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
