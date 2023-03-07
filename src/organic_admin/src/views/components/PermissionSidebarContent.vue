<template>
   <div class="permission-sidebar-content">
      <div class="permission-sidebar-menu">
         <h6 class="mb-0 mb-2">Menu:</h6>
         <div v-for="item in permission.menus" :key="item.id">
            <el-checkbox
               :label="`${item.routeName} (${item.title})`"
               :checked="accessibleMenus.includes(item.routeName)"
               @change="(checked) => handleChangeCheckbox(checked, item.id)"
            />
         </div>
      </div>
      <el-divider />
      <div class="permission-sidebar-function">
         <h6 class="mb-0 mb-2">Chức năng:</h6>
      </div>
   </div>
</template>

<script>
import { ElMessage } from "element-plus";

import * as API from "@/helpers/api.js";
const apiPath = process.env.VUE_APP_SERVER_PATH_API;
const apiGroup = "system_menu";

export default {
   name: "PermissionSidebarContent",
   props: {
      systemRoleId: {
         type: Number,
         required: true,
      },
   },
   data() {
      return {
         // Permission
         permission: {
            menus: [],
            functions: [],
         },

         // Các menu có thể truy cập
         accessibleMenus: [],
      };
   },
   methods: {
      getAccessibleMenusForSystemRole(systemRoleId) {
         return API.get(
            apiPath + `/${apiGroup}/get_list_by_system_role_id.php`,
            {
               systemRoleId,
            },
            (data) => {
               if (data.code === 1) {
                  this.accessibleMenus = data.data.map((i) => i.routeName);

                  // Not found data
                  if (data.data.length === 0) {
                     ElMessage({
                        message:
                           "Không lấy được danh sách menu cho vai trò này",
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
      getPermissionMenus() {
         return API.get(apiPath + `/${apiGroup}/get_list.php`, {}, (data) => {
            if (data.code === 1) {
               this.permission.menus = data.data;

               // Not found data
               if (data.data.length === 0) {
                  ElMessage({
                     message: "Không lấy được danh sách menu",
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
      handleChangeCheckbox(checked, systemMenuId) {
         if (checked) {
            return API.post(
               apiPath + `/system_role_menu/add.php`,
               {
                  systemRoleId: this.$props.systemRoleId,
                  systemMenuId,
               },
               (data) => {
                  if (data.code === 1) {
                     ElMessage({
                        message: "Đặt quyền thành công",
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
         } else {
            return API.post(
               apiPath + `/system_role_menu/delete.php`,
               {
                  systemRoleId: this.$props.systemRoleId,
                  systemMenuId,
               },
               (data) => {
                  if (data.code === 1) {
                     ElMessage({
                        message: "Gỡ quyền thành công",
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
         }
      },
   },
   async created() {
      await this.getAccessibleMenusForSystemRole(this.$props.systemRoleId);
      await this.getPermissionMenus();
   },
};
</script>
