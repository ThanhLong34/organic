import { createRouter, createWebHistory } from "vue-router";
import store from "@/store/index.js";

import * as SessionStorage from "@/helpers/session_storage.js";

import Category from "../views/Category.vue";
import Project from "../views/Project.vue";
import AddProject from "../views/AddProject.vue";
import EditProject from "../views/EditProject.vue";
import CustomerAccount from "../views/CustomerAccount.vue";
import EmailContact from "../views/EmailContact.vue";

// Add
import Dashboard from "../views/Dashboard.vue";
import Role from "../views/Role.vue";
import MenuView from "../views/Menu.vue";
import FunctionView from "../views/Function.vue";
import SystemAdmin from "../views/SystemAdmin.vue";
import Image from "../views/Image.vue";
import ProductCategory from "../views/ProductCategory.vue";
import Product from "../views/Product.vue";
import AddProduct from "../views/AddProduct.vue";
import EditProduct from "../views/EditProduct.vue";
import Blog from "../views/Blog.vue";
import AddBlog from "../views/AddBlog.vue";
import EditBlog from "../views/EditBlog.vue";
import Subscribe from "../views/Subscribe.vue";
import Contact from "../views/Contact.vue";
import CounponCode from "../views/CounponCode.vue";
import OrderStatus from "../views/OrderStatus.vue";
import Order from "../views/Order.vue";
import Profile from "../views/Profile.vue";
import Signin from "../views/Signin.vue";

const routes = [
	{
		path: "/",
		name: "/",
		redirect: "/dashboard-default",
		meta: {
			breadcrumbName: "",
		},
	},
	{
		path: "/dashboard-default",
		name: "Dashboard",
		component: Dashboard,
		meta: {
			breadcrumbName: "Dashboard",
		},
	},
	{
		path: "/role",
		name: "Role",
		component: Role,
		meta: {
			breadcrumbName: "Vai trò",
		},
	},
	{
		path: "/menu",
		name: "Menu",
		component: MenuView,
		meta: {
			breadcrumbName: "Menu",
		},
	},
	{
		path: "/function",
		name: "Function",
		component: FunctionView,
		meta: {
			breadcrumbName: "Chức năng",
		},
	},
	{
		path: "/system-admin",
		name: "SystemAdmin",
		component: SystemAdmin,
		meta: {
			breadcrumbName: "Tài khoản Admin",
		},
	},
	{
		path: "/image",
		name: "Image",
		component: Image,
		meta: {
			breadcrumbName: "Tệp hình ảnh",
		},
	},
	{
		path: "/product-category",
		name: "ProductCategory",
		component: ProductCategory,
		meta: {
			breadcrumbName: "Danh mục sản phẩm",
		},
	},
	{
		path: "/product",
		name: "Product",
		component: Product,
		meta: {
			breadcrumbName: "Sản phẩm",
		},
	},
	{
		path: "/add-product",
		name: "AddProduct",
		component: AddProduct,
		meta: {
			breadcrumbName: "Thêm sản phẩm",
		},
	},
	{
		path: "/edit-product/:id",
		name: "EditProduct",
		component: EditProduct,
		meta: {
			breadcrumbName: "Chỉnh sửa thông tin sản phẩm",
		},
	},
	{
		path: "/blog",
		name: "Blog",
		component: Blog,
		meta: {
			breadcrumbName: "Bài viết",
		},
	},
	{
		path: "/add-blog",
		name: "AddBlog",
		component: AddBlog,
		meta: {
			breadcrumbName: "Thêm bài viết",
		},
	},
	{
		path: "/edit-blog/:id",
		name: "EditBlog",
		component: EditBlog,
		meta: {
			breadcrumbName: "Chỉnh sửa thông tin bài viết",
		},
	},
	{
		path: "/subscribe",
		name: "Subscribe",
		component: Subscribe,
		meta: {
			breadcrumbName: "KH Đăng ký",
		},
	},
	{
		path: "/contact",
		name: "Contact",
		component: Contact,
		meta: {
			breadcrumbName: "KH Liên hệ",
		},
	},
	{
		path: "/counpon-code",
		name: "CounponCode",
		component: CounponCode,
		meta: {
			breadcrumbName: "Mã giảm giá",
		},
	},
	{
		path: "/order-status",
		name: "OrderStatus",
		component: OrderStatus,
		meta: {
			breadcrumbName: "Trạng thái đơn hàng",
		},
	},
	{
		path: "/order",
		name: "Order",
		component: Order,
		meta: {
			breadcrumbName: "Đơn hàng",
		},
	},
	{
		path: "/profile",
		name: "Profile",
		component: Profile,
		meta: {
			breadcrumbName: "Hồ sơ cá nhân",
		},
	},
	{
		path: "/signin",
		name: "Signin",
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
});

export default router;
