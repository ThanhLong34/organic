/* eslint-disable */
import { createRouter, createWebHistory } from "vue-router";
import store from "@/store/index.js";

import Home from "../pages/Home.vue";
import Error404 from "../pages/404.vue";

const routes = [
	{
		path: "/",
		name: "home",
		component: Home,
	},
	{
		path: "/shop",
		name: "shop",
		component: () => import("../pages/Shop.vue"),
	},
	{
		path: "/shop-search/:productName",
		name: "shop_search",
		component: () => import("../pages/ShopSearch.vue"),
	},
	{
		path: "/shop-details/:productName",
		name: "shop_details",
		component: () => import("../pages/ShopDetails.vue"),
	},
	{
		path: "/wishlist",
		name: "wishlist",
		component: () => import("../pages/Wishlist.vue"),
	},
	{
		path: "/viewcart",
		name: "viewcart",
		component: () => import("../pages/ViewCart.vue"),
	},
	{
		path: "/checkout",
		name: "checkout",
		component: () => import("../pages/Checkout.vue"),
	},
	{
		path: "/checkout-success",
		name: "checkout_success",
		component: () => import("../pages/CheckoutSuccess.vue"),
	},
	{
		path: "/blog",
		name: "blog",
		component: () => import("../pages/Blog.vue"),
	},
	{
		path: "/blog-details/:blogTitle",
		name: "blog_details",
		component: () => import("../pages/BlogDetails.vue"),
	},
	{
		path: "/about",
		name: "about",
		component: () => import("../pages/About.vue"),
	},
	{
		path: "/contact",
		name: "contact",
		component: () => import("../pages/Contact.vue"),
	},
	{
		path: "/tracking-order",
		name: "tracking_order",
		component: () => import("../pages/TrackingOrder.vue"),
	},
	{
		path: "/policy",
		name: "policy",
		component: () => import("../pages/Policy.vue"),
	},
	{
		path: "/help-and-faq",
		name: "help_and_faq",
		component: () => import("../pages/HelpAndFAQ.vue"),
	},
	{
		path: "/:pathMatch(.*)*",
		component: Error404,
	},
];

const router = createRouter({
	history: createWebHistory(process.env.BASE_URL),
	routes,
	scrollBehavior() {
		// always scroll to top
		return { top: 0 };
	},
});

router.beforeEach(() => {
	store.dispatch("changeRouterLinkClicked", true);
});

export default router;
