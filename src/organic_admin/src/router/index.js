import { createRouter, createWebHistory } from "vue-router";
import store from "@/store/index.js";

import * as SessionStorage from "@/helpers/session_storage.js";

import Dashboard from "../views/Dashboard.vue";
import Category from "../views/Category.vue";
import Tag from "../views/Tag.vue";
import Project from "../views/Project.vue";
import AddProject from "../views/AddProject.vue";
import EditProject from "../views/EditProject.vue";
import Image from "../views/Image.vue";
import CustomerAccount from "../views/CustomerAccount.vue";
import Order from "../views/Order.vue";
import EmailContact from "../views/EmailContact.vue";
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
		path: "/category",
		name: "Category",
		component: Category,
		meta: {
			breadcrumbName: "Danh mục",
		},
	},
	{
		path: "/tag",
		name: "Tag",
		component: Tag,
		meta: {
			breadcrumbName: "Thẻ",
		},
	},
	{
		path: "/project",
		name: "Project",
		component: Project,
		meta: {
			breadcrumbName: "Dự án",
		},
	},
	{
		path: "/add-project",
		name: "AddProject",
		component: AddProject,
		meta: {
			breadcrumbName: "Thêm dự án",
		},
	},
	{
		path: "/edit-project/:id",
		name: "EditProject",
		component: EditProject,
		meta: {
			breadcrumbName: "Chỉnh sửa thông tin dự án",
		},
	},
	{
		path: "/image",
		name: "Image",
		component: Image,
		meta: {
			breadcrumbName: "Hình ảnh tải lên",
		},
	},
	{
		path: "/customer-account",
		name: "CustomerAccount",
		component: CustomerAccount,
		meta: {
			breadcrumbName: "Tài khoản khách hàng",
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
		path: "/email-contact",
		name: "EmailContact",
		component: EmailContact,
		meta: {
			breadcrumbName: "Email liên hệ",
		},
	},
	{
		path: "/profile",
		name: "Profile",
		component: Profile,
		meta: {
			breadcrumbName: "Hồ sơ",
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
