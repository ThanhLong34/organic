import { createStore } from "vuex";
import * as LocalStorage from "@/helpers/local_storage";

export default createStore({
	state() {
		return {
			isRouterLinkClicked: false,
			saleTime: 216000,
			systemRoleId: 2, // 2: for role client,
			wishlist: LocalStorage.getWishlist(),
			cart: LocalStorage.getCart(),
		};
	},
	getters: {
		getRouterLinkClicked(state) {
			return state.isRouterLinkClicked;
		},
		getSaleTime(state) {
			return state.saleTime;
		},
		getWishlist(state) {
			return state.wishlist;
		},
		getCart(state) {
			return state.cart;
		},
	},
	mutations: {
		changeRouterLinkClicked(state, value) {
			state.isRouterLinkClicked = value;
		},
		decreaseSaleTime(state) {
			state.saleTime -= 1;
		},
		addItemWishlist(state, payload) {
			if (Array.isArray(state.wishlist)) {
				state.wishlist.push(payload);
			}
		},
		removeItemWishlist(state, payload) {
			if (Array.isArray(state.wishlist)) {
				let idx = state.wishlist.indexOf(payload);
				if (idx > -1) {
					state.wishlist.splice(idx, 1);
				}
			}
		},
		setCart(state, payload) {
			state.cart.length = 0;
			if (Array.isArray(payload)) {
				payload.forEach((o) => state.cart.push(o));
			}
		},
		resetCart(state) {
			// Không gán lại vì sẽ mất tham chiếu
			state.cart.length = 0;
		},
		addItemCart(state, payload) {
			if (Array.isArray(state.cart)) {
				state.cart.push(payload);
			}
		},
		removeItemCart(state, payload) {
			if (Array.isArray(state.cart)) {
				let idx = state.cart.findIndex((i) => i.id === payload);
				if (idx > -1) {
					state.cart.splice(idx, 1);
				}
			}
		},
		updateItemCart(state, payload) {
			if (Array.isArray(state.cart)) {
				const p = state.cart.find((i) => i.id === payload.id);
				if (p) {
					p.quantity = payload.quantity;
				}
			}
		},
	},
	actions: {
		changeRouterLinkClicked(ctx, payload) {
			ctx.commit("changeRouterLinkClicked", payload);
		},
		decreaseSaleTime(ctx) {
			ctx.commit("decreaseSaleTime");
		},
		addItemWishlist(ctx, productId) {
			ctx.commit("addItemWishlist", productId);
			LocalStorage.addItemWishlist(productId);
		},
		removeItemWishlist(ctx, productId) {
			ctx.commit("removeItemWishlist", productId);
			LocalStorage.removeItemWishlist(productId);
		},
		setCart(ctx, cart) {
			ctx.commit("setCart", cart);
			LocalStorage.setCart(cart);
		},
		resetCart(ctx) {
			ctx.commit("resetCart");
			LocalStorage.resetCart();
		},
		addItemCart(ctx, product) {
			ctx.commit("addItemCart", product);
			LocalStorage.addItemCart(product);
		},
		removeItemCart(ctx, productId) {
			ctx.commit("removeItemCart", productId);
			LocalStorage.removeItemCart(productId);
		},
		updateItemCart(ctx, product) {
			ctx.commit("updateItemCart", product);
			LocalStorage.updateItemCart(product);
		},
	},
});
