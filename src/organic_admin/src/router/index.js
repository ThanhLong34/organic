import { createRouter, createWebHistory } from "vue-router";
import store from "@/store/index.js";

import * as SessionStorage from "@/helpers/session_storage.js";
import { menus } from "@/helpers/constants.js";

// Add
import Dashboard from "../views/Dashboard.vue";
import SystemRole from "../views/SystemRole.vue";
import SystemMenu from "../views/SystemMenu.vue";
import SystemFunction from "../views/SystemFunction.vue";
import SystemAdmin from "../views/SystemAdmin.vue";
import Image from "../views/Image.vue";
import ProductCategory from "../views/ProductCategory.vue";
import Product from "../views/Product.vue";
import AddProduct from "../views/AddProduct.vue";
import EditProduct from "../views/EditProduct.vue";
import ProductReview from "../views/ProductReview.vue";
import Blog from "../views/Blog.vue";
import AddBlog from "../views/AddBlog.vue";
import EditBlog from "../views/EditBlog.vue";
import Subscribe from "../views/Subscribe.vue";
import Contact from "../views/Contact.vue";
import CouponCode from "../views/CouponCode.vue";
import OrderStatus from "../views/OrderStatus.vue";
import Order from "../views/Order.vue";
import Profile from "../views/Profile.vue";
import Signin from "../views/Signin.vue";

const routes = [
	{
		//? Error path
		path: "/:pathMatch(.*)*",
		redirect: "/dashboard",
		meta: {
			breadcrumbName: "",
		},
	},
	{
		path: "/",
		name: "/",
		redirect: "/dashboard",
		meta: {
			breadcrumbName: "",
		},
	},
	{
		path: "/dashboard",
		name: menus.Dashboard,
		component: Dashboard,
		meta: {
			breadcrumbName: "Dashboard",
		},
	},
	{
		path: "/system-role",
		name: menus.SystemRole,
		component: SystemRole,
		meta: {
			breadcrumbName: "Vai trò",
		},
	},
	{
		path: "/system-menu",
		name: menus.SystemMenu,
		component: SystemMenu,
		meta: {
			breadcrumbName: "Menu",
		},
	},
	{
		path: "/system-function",
		name: menus.SystemFunction,
		component: SystemFunction,
		meta: {
			breadcrumbName: "Chức năng",
		},
	},
	{
		path: "/system-admin",
		name: menus.SystemAdmin,
		component: SystemAdmin,
		meta: {
			breadcrumbName: "Tài khoản Admin",
		},
	},
	{
		path: "/image",
		name: menus.Image,
		component: Image,
		meta: {
			breadcrumbName: "Tệp hình ảnh",
		},
	},
	{
		path: "/product-category",
		name: menus.ProductCategory,
		component: ProductCategory,
		meta: {
			breadcrumbName: "Danh mục sản phẩm",
		},
	},
	{
		path: "/product",
		name: menus.Product,
		component: Product,
		meta: {
			breadcrumbName: "Sản phẩm",
		},
	},
	{
		path: "/add-product",
		name: menus.AddProduct,
		component: AddProduct,
		meta: {
			breadcrumbName: "Thêm sản phẩm",
		},
	},
	{
		path: "/edit-product/:id",
		name: menus.EditProduct,
		component: EditProduct,
		meta: {
			breadcrumbName: "Chỉnh sửa thông tin sản phẩm",
		},
	},
	{
		path: "/product-preview/:id",
		name: menus.ProductReview,
		component: ProductReview,
		meta: {
			breadcrumbName: "Đánh giá sản phẩm",
		},
	},
	{
		path: "/blog",
		name: menus.Blog,
		component: Blog,
		meta: {
			breadcrumbName: "Bài viết",
		},
	},
	{
		path: "/add-blog",
		name: menus.AddBlog,
		component: AddBlog,
		meta: {
			breadcrumbName: "Thêm bài viết",
		},
	},
	{
		path: "/edit-blog/:id",
		name: menus.EditBlog,
		component: EditBlog,
		meta: {
			breadcrumbName: "Chỉnh sửa thông tin bài viết",
		},
	},
	{
		path: "/subscribe",
		name: menus.Subscribe,
		component: Subscribe,
		meta: {
			breadcrumbName: "KH Đăng ký",
		},
	},
	{
		path: "/contact",
		name: menus.Contact,
		component: Contact,
		meta: {
			breadcrumbName: "KH Liên hệ",
		},
	},
	{
		path: "/coupon-code",
		name: menus.CouponCode,
		component: CouponCode,
		meta: {
			breadcrumbName: "Mã giảm giá",
		},
	},
	{
		path: "/order-status",
		name: menus.OrderStatus,
		component: OrderStatus,
		meta: {
			breadcrumbName: "Trạng thái đơn hàng",
		},
	},
	{
		path: "/order",
		name: menus.Order,
		component: Order,
		meta: {
			breadcrumbName: "Đơn hàng",
		},
	},
	{
		path: "/profile",
		name: menus.Profile,
		component: Profile,
		meta: {
			breadcrumbName: "Hồ sơ cá nhân",
		},
	},
	{
		path: "/signin",
		name: menus.Signin,
		component: Signin,
		meta: {
			breadcrumbName: "Đăng nhập",
		},
	},
];

const router = createRouter({
	history: createWebHistory(process.env.BASE_URL),
	routes,
	linkActiveClass: "active",
});

router.beforeEach((to) => {
	// Lấy tài khoản đã đăng nhập trước đó nếu có tồn tại trong Session
	store.dispatch("setAccountLogin", SessionStorage.getAccountLogin());

	// Kiểm tra người dùng chưa đăng nhập thì chuyển hướng về trang đăng nhập
	// và ngăn chặn chuyển hướng tới các trang khác ngoài các trang được định nghĩa ở trên
	if (
		!store.state.accountLogin &&
		!SessionStorage.getAccountLogin() &&
		//❗ Avoid an infinite redirect
		to.name !== "Signin"
	) {
		return { name: "Signin" };
	}

	// Kiểm tra quyền truy cập các Menu
	if (store.state.accountLogin?.menus) {
		const accessibleMenus = store.state.accountLogin.menus;
		if (!accessibleMenus.includes(to.name)) {
			return { name: "Dashboard" };
		}
	}
});

export default router;
