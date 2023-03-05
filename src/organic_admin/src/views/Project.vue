<template>
   <div class="py-4 container-fluid">
      <div class="row">
         <div class="col-12">
            <div class="card mb-4">
               <div class="card-header pb-2">
                  <h6>Tìm kiếm &amp; Lọc</h6>
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
                              placeholder="Nhập tên dự án..."
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
                     <div class="col-4">
                        <div class="selection-wrap">
                           <el-select
                              v-model="filterInfo.categoryID"
                              filterable
                              placeholder="Chọn danh mục"
                              @change="filtering"
                           >
                              <el-option
                                 v-for="item in categories"
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
            <ProjectTable ref="tableRef" />
         </div>
      </div>
   </div>
</template>

<script>
import * as API from "@/helpers/api.js";

import ProjectTable from "./components/ProjectTable.vue";
import ArgonInput from "@/components/ArgonInput.vue";
import ArgonButton from "@/components/ArgonButton.vue";

const apiPath = process.env.VUE_APP_SERVER_PATH_API;

export default {
   name: "project",
   components: {
      ProjectTable,
      ArgonInput,
      ArgonButton,
   },
   data() {
      return {
         categories: [],
         searchInfo: {
            name: "",
         },
         filterInfo: {
            categoryID: "",
         },
      };
   },
   methods: {
      reloadTableData() {
         this.$refs.tableRef.reload();
      },
      reload() {
         this.$refs.tableRef.choosePage(1);
         this.$refs.searchRef.setValue("");

         this.searchInfo.name = "";
         this.filterInfo.categoryID = "";
      },
      search() {
         if (this.searchInfo.name === "") return;
         this.$refs.tableRef.getTableData(this.searchInfo, this.filterInfo);
      },
      filtering() {
         if (!this.filterInfo.categoryID) return;
         this.$refs.tableRef.getTableData(null, this.filterInfo);
      },
      getCategories() {
         return API.get(
            apiPath + "/category/get_list.php",
            {
               limit: 0,
               offset: 0,
            },
            (data) => {
               if (data.code === 1) {
                  this.categories = data.data.map((item) => ({
                     id: +item.id,
                     name: item.Name,
                  }));
               } else if (data.code === 2) {
                  console.error(data.message);
               }
            },
            (error) => {
               console.error(error);
            }
         );
      },
   },
   created() {
      this.getCategories();
   },
};
</script>

<style lang="scss" scoped>
.reload-button,
.close-add-button {
   margin-left: 20px;
}
</style>
