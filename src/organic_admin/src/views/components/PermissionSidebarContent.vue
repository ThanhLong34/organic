<template>
   <div class="permission-sidebar-content">
      <div class="permission-sidebar-menu">
         <h6 class="mb-0 mb-2">Menu:</h6>
         <div v-for="item in permission.menus" :key="item.id">
            <el-checkbox
					:disabled="item.isBase"
               :label="`${item.routeName} (${item.title})`"
               :checked="accessible.menus.includes(item.routeName)"
               @change="(checked) => handleChangePermissionMenuCheckbox(checked, item.id)"
            />
         </div>
      </div>
      <el-divider />
      <div class="permission-sidebar-function">
         <h6 class="mb-0 mb-2">Chức năng:</h6>
			<div v-for="item in permission.functions" :key="item.id">
            <el-checkbox
					:disabled="item.isBase"
               :label="`${item.name} (${item.method})`"
               :checked="accessible.functions.includes(item.name)"
               @change="(checked) => handleChangePermissionFunctionCheckbox(checked, item.id)"
            />
         </div>
      </div>
   </div>
</template>

<script>
import { ElMessage } from "element-plus";

import * as API from "@/helpers/api.js";
const apiPath = process.env.VUE_APP_SERVER_PATH_API;
const apiGroupSystemMenu = "system_menu";
const apiGroupSystemFunction = "system_function";

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
         accessible: {
				menus: [],
            functions: [],
			},
      };
   },
   methods: {
      getAccessibleMenusForSystemRole() {
         return API.get(
            apiPath + `/${apiGroupSystemMenu}/get_list_by_system_role_id.php`,
            {
               systemRoleId: this.$props.systemRoleId,
            },
            (data) => {
               if (data.code === 1) {
                  this.accessible.menus = data.data.map((i) => i.routeName);
               } else {
                  ElMessage({
                     message: data.message,
                     type: "error",
                  });
               }
            }
         );
      },
		getAccessibleFunctionsForSystemRole() {
         return API.get(
            apiPath + `/${apiGroupSystemFunction}/get_list_by_system_role_id.php`,
            {
               systemRoleId: this.$props.systemRoleId,
            },
            (data) => {
               if (data.code === 1) {
                  this.accessible.functions = data.data.map((i) => i.name);
						console.log(this.accessible.functions);
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
         return API.get(apiPath + `/${apiGroupSystemMenu}/get_list.php`, {}, (data) => {
            if (data.code === 1) {
               this.permission.menus = data.data.map(i => ({
						...i,
						id: +i.id,
						isBase: +i.isBase == 1
					}));

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
		getPermissionFunctions() {
         return API.get(apiPath + `/${apiGroupSystemFunction}/get_list.php`, {
				orderby: "apiPath"
			}, (data) => {
            if (data.code === 1) {
               this.permission.functions = data.data.map(i => ({
						...i,
						id: +i.id,
						isBase: +i.isBase == 1
					}));

               // Not found data
               if (data.data.length === 0) {
                  ElMessage({
                     message: "Không lấy được danh sách chức năng",
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
      handleChangePermissionMenuCheckbox(checked, systemMenuId) {
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
		handleChangePermissionFunctionCheckbox(checked, systemFunctionId) {
         if (checked) {
            return API.post(
               apiPath + `/system_role_function/add.php`,
               {
                  systemRoleId: this.$props.systemRoleId,
                  systemFunctionId,
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
               apiPath + `/system_role_function/delete.php`,
               {
                  systemRoleId: this.$props.systemRoleId,
                  systemFunctionId,
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
      await this.getAccessibleMenusForSystemRole();
		await this.getAccessibleFunctionsForSystemRole();

		await this.getPermissionMenus();
      await this.getPermissionFunctions();
   },
};
</script>
