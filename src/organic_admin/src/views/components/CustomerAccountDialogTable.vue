<template>
   <div class="card">
      <div class="card-header pb-0">
         <div class="row">
            <div class="col-6 d-flex align-items-center">
               <h6>{{ title }} ({{ tableData.length }})</h6>
            </div>
         </div>
      </div>
      <div class="card-body px-0 pt-0 pb-2">
         <div class="table-responsive p-0">
            <table class="table align-items-center justify-content-center mb-0">
               <thead>
                  <tr>
                     <th
                        class="
                           text-uppercase text-secondary text-xxs
                           font-weight-bolder
                           opacity-7
                        "
                     >
                        Avatar &amp; Tên dự án
                     </th>
                     <th
                        class="
                           text-uppercase text-secondary text-xxs
                           font-weight-bolder
                           opacity-7
                           ps-2
                        "
                     >
                        Giá (VND)
                     </th>
                     <th
                        class="
                           text-uppercase text-secondary text-xxs
                           font-weight-bolder
                           opacity-7
                           ps-2
                        "
                     >
                        Danh mục
                     </th>
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
                                    item.avatar
                                       ? item.avatar
                                       : `${require('@/assets/img/no-image.jpg')}`
                                 "
                                 class="avatar avatar-sm rounded-circle me-2"
                                 alt="avatar"
                              />
                           </div>
                           <div class="my-auto">
                              <h6 class="mb-0 text-sm">
                                 {{ item.name }} <span class="text-warning">{{ item.deletedAt ? '(đã xóa)' : '' }}</span>
                              </h6>
                           </div>
                        </div>
                     </td>
                     <td>
                        <p class="text-sm font-weight-bold mb-0">
                           {{ item.price.toLocaleString('it-IT', {style : 'currency', currency : 'VND'}) }}
                        </p>
                     </td>
                     <td>
                        <p class="text-sm font-weight-bold mb-0">
                           {{ item.categoryName }}
                        </p>
                     </td>
                  </tr>
               </tbody>
            </table>
         </div>
         <div class="not-found-data-text" v-show="tableData.length === 0">
            Không tìm thấy dữ liệu
         </div>
      </div>
   </div>
</template>

<script>
import * as API from "@/helpers/api.js";

import { ElMessage } from "element-plus";

const apiPath = process.env.VUE_APP_SERVER_PATH_API;

export default {
   name: "customer-account-dialog-table",
   components: {},
   props: {
      title: String,
      projectIDs: String,
   },
   data() {
      return {
         tableData: [],
         categories: [],
      };
   },
   methods: {
      getTableData() {
         return API.get(
            apiPath + "/project/get_list_by_ids.php",
            {
               ids: this.$props.projectIDs,
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
                     id: parseInt(item.ID),
                     deletedAt: item.DeletedAt,
                     name: item.Name,
                     avatar: item.Avatar,
                     price: parseInt(item.Price),
                     categoryName: item.CategoryName != "" ? item.CategoryName : "Trống",
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
   },
   created() {
      this.getTableData();
   },
};
</script>

<style lang="scss" scoped>
.pagination {
   justify-content: center;
   margin-top: 20px;
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
