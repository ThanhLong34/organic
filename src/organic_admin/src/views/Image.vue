<template>
   <div class="py-4 container-fluid">
      <div class="row">
         <div class="col-12">
            <div class="card mb-4">
               <div class="card-header pb-2">
                  <h6>Lọc</h6>
               </div>
               <div class="card-body px-4 pt-0 pb-4">
                  <div class="row">
                     <div class="col-12">
                        <div class="search-wrap">
                           <div class="selection-wrap">
                              <el-select
                                 v-model="filterInfo.target"
                                 filterable
                                 placeholder="Chọn trạng thái"
                                 @change="filtering"
                              >
                                 <el-option
                                    v-for="item in imageStatus"
                                    :key="item.id"
                                    :label="item.name"
                                    :value="item.id"
                                 />
                              </el-select>
                           </div>
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
            </div>
         </div>
         <div class="col-12">
            <ImageTable ref="tableRef" />
         </div>
      </div>
   </div>
</template>

<script>
// import * as API from "@/helpers/api.js";

import ImageTable from "./components/ImageTable.vue";
import ArgonButton from "@/components/ArgonButton.vue";

// const apiPath = process.env.VUE_APP_SERVER_PATH_API;

export default {
   name: "Image",
   components: {
      ImageTable,
      ArgonButton,
   },
   data() {
      return {
         imageStatus: [
            {
               id: "is_using",
               name: "Đang sử dụng",
            },
            {
               id: "dont_using",
               name: "Không sử dụng",
            },
         ],
         filterInfo: {
            target: "",
         },
      };
   },
   methods: {
      reloadTableData() {
         this.$refs.tableRef.reload();
      },
      reload() {
         this.$refs.tableRef.choosePage(1);
         this.filterInfo.target = "";
      },
      filtering() {
         if (!this.filterInfo.target) return;
         this.$refs.tableRef.getTableData(null, this.filterInfo);
      },
   },
};
</script>

<style lang="scss" scoped>
.reload-button {
   margin-top: 16px;
}
</style>
