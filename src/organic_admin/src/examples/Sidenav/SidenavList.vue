<template>
   <div
      class="collapse navbar-collapse w-auto h-auto h-100"
      id="sidenav-collapse-main"
   >
      <ul class="navbar-nav">
         <li class="nav-item" v-if="accessibleMenus?.includes('Dashboard')">
            <sidenav-item
               routeName="Dashboard"
               :class="getRoute() === 'dashboard-default' ? 'active' : ''"
               navText="Dashboard"
            >
               <template v-slot:icon>
                  <i class="ni ni-tv-2 text-primary text-sm opacity-10"></i>
               </template>
            </sidenav-item>
         </li>
         <li class="nav-item" v-if="accessibleMenus?.includes('SystemRole')">
            <sidenav-item
               routeName="SystemRole"
               :class="getRoute() === 'role' ? 'active' : ''"
               navText="Vai trò"
            >
               <template v-slot:icon>
                  <i
                     class="ni ni-controller text-danger text-sm opacity-10"
                  ></i>
               </template>
            </sidenav-item>
         </li>
         <li class="nav-item" v-if="accessibleMenus?.includes('SystemMenu')">
            <sidenav-item
               routeName="SystemMenu"
               :class="getRoute() === 'menu' ? 'active' : ''"
               navText="Menu"
            >
               <template v-slot:icon>
                  <i
                     class="ni ni-bullet-list-67 text-info text-sm opacity-10"
                  ></i>
               </template>
            </sidenav-item>
         </li>
         <li
            class="nav-item"
            v-if="accessibleMenus?.includes('SystemFunction')"
         >
            <sidenav-item
               routeName="SystemFunction"
               :class="getRoute() === 'function' ? 'active' : ''"
               navText="Chức năng"
            >
               <template v-slot:icon>
                  <i class="ni ni-atom text-success text-sm opacity-10"></i>
               </template>
            </sidenav-item>
         </li>
         <li class="nav-item" v-if="accessibleMenus?.includes('SystemAdmin')">
            <sidenav-item
               routeName="SystemAdmin"
               :class="getRoute() === 'system-admin' ? 'active' : ''"
               navText="Tài khoản Admin"
            >
               <template v-slot:icon>
                  <i
                     class="ni ni-single-02 text-secondary text-sm opacity-10"
                  ></i>
               </template>
            </sidenav-item>
         </li>
         <li class="nav-item" v-if="accessibleMenus?.includes('Image')">
            <sidenav-item
               routeName="Image"
               :class="getRoute() === 'image' ? 'active' : ''"
               navText="Tệp hình ảnh"
            >
               <template v-slot:icon>
                  <i class="ni ni-album-2 text-dark text-sm opacity-10"></i>
               </template>
            </sidenav-item>
         </li>
         <li
            class="nav-item"
            v-if="accessibleMenus?.includes('ProductCategory')"
         >
            <sidenav-item
               routeName="ProductCategory"
               :class="getRoute() === 'product-category' ? 'active' : ''"
               navText="Danh mục sản phẩm"
            >
               <template v-slot:icon>
                  <i
                     class="ni ni-collection text-warning text-sm opacity-10"
                  ></i>
               </template>
            </sidenav-item>
         </li>
         <li class="nav-item" v-if="accessibleMenus?.includes('Product')">
            <sidenav-item
               routeName="Product"
               :class="getRoute() === 'product' ? 'active' : ''"
               navText="Sản phẩm"
            >
               <template v-slot:icon>
                  <i class="ni ni-diamond text-pink text-sm opacity-10"></i>
               </template>
            </sidenav-item>
         </li>
         <li class="nav-item" v-if="accessibleMenus?.includes('Blog')">
            <sidenav-item
               routeName="Blog"
               :class="getRoute() === 'blog' ? 'active' : ''"
               navText="Bài viết"
            >
               <template v-slot:icon>
                  <i
                     class="ni ni-single-copy-04 text-info text-sm opacity-10"
                  ></i>
               </template>
            </sidenav-item>
         </li>
         <li class="nav-item" v-if="accessibleMenus?.includes('Subscribe')">
            <sidenav-item
               routeName="Subscribe"
               :class="getRoute() === 'subscribe' ? 'active' : ''"
               navText="KH Đăng ký"
            >
               <template v-slot:icon>
                  <i class="ni ni-send text-dark text-sm opacity-10"></i>
               </template>
            </sidenav-item>
         </li>
         <li class="nav-item" v-if="accessibleMenus?.includes('Contact')">
            <sidenav-item
               routeName="Contact"
               :class="getRoute() === 'contact' ? 'active' : ''"
               navText="KH Liên hệ"
            >
               <template v-slot:icon>
                  <i
                     class="ni ni-email-83 text-secondary text-sm opacity-10"
                  ></i>
               </template>
            </sidenav-item>
         </li>
         <li class="nav-item" v-if="accessibleMenus?.includes('CounponCode')">
            <sidenav-item
               routeName="CounponCode"
               :class="getRoute() === 'counpon-code' ? 'active' : ''"
               navText="Mã giảm giá"
            >
               <template v-slot:icon>
                  <i class="ni ni-tie-bow text-primary text-sm opacity-10"></i>
               </template>
            </sidenav-item>
         </li>
         <li class="nav-item" v-if="accessibleMenus?.includes('OrderStatus')">
            <sidenav-item
               routeName="OrderStatus"
               :class="getRoute() === 'order-status' ? 'active' : ''"
               navText="Trạng thái đơn hàng"
            >
               <template v-slot:icon>
                  <i class="ni ni-spaceship text-danger text-sm opacity-10"></i>
               </template>
            </sidenav-item>
         </li>
         <li class="nav-item" v-if="accessibleMenus?.includes('Order')">
            <sidenav-item
               routeName="Order"
               :class="getRoute() === 'order' ? 'active' : ''"
               navText="Đơn hàng"
            >
               <template v-slot:icon>
                  <i
                     class="ni ni-delivery-fast text-success text-sm opacity-10"
                  ></i>
               </template>
            </sidenav-item>
         </li>
         <li class="mt-3 nav-item">
            <h6
               class="text-xs ps-4 text-uppercase font-weight-bolder opacity-6 ms-2"
            >
               TÀI KHOẢN
            </h6>
         </li>
         <li class="nav-item" v-if="accessibleMenus?.includes('Profile')">
            <sidenav-item
               routeName="Profile"
               :class="getRoute() === 'profile' ? 'active' : ''"
               navText="Hồ sơ cá nhân"
            >
               <template v-slot:icon>
                  <i class="ni ni-settings text-dark text-sm opacity-10"></i>
               </template>
            </sidenav-item>
         </li>
         <li class="nav-item" v-if="accessibleMenus?.includes('Signin')">
            <sidenav-item
               routeName="Signin"
               :class="getRoute() === 'signin' ? 'active' : ''"
               navText="Đăng xuất"
            >
               <template v-slot:icon>
                  <i class="ni ni-user-run text-danger text-sm opacity-10"></i>
               </template>
            </sidenav-item>
         </li>
      </ul>
   </div>
   <div class="pt-3 mx-3 mt-3 sidenav-footer">
      <sidenav-card
         :class="cardBg"
         textPrimary="Cần trợ giúp?"
         textSecondary="Xem tài liệu bên dưới"
      />
   </div>
</template>
<script>
import SidenavItem from "./SidenavItem.vue";
import SidenavCard from "./SidenavCard.vue";

export default {
   name: "SidenavList",
   props: {
      cardBg: String,
   },
   data() {
      return {
         title: "Argon Dashboard 2",
         controls: "dashboardsExamples",
         isActive: "active",
      };
   },
   components: {
      SidenavItem,
      SidenavCard,
   },
   methods: {
      getRoute() {
         const routeArr = this.$route.path.split("/");
         return routeArr[1];
      },
   },
   computed: {
      accessibleMenus() {
         return this.$store.state.accountLogin?.menus?.map((i) => i.routeName);
      },
   },
};
</script>
