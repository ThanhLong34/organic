/* eslint-disable */

import { createStore } from "vuex";

export default createStore({
	state() {
		return {
			isRouterLinkClicked: false,
			saleTime: 216000,
			systemRoleId: 2, // 2: for role client
		};
	},
	getters: {
		getRouterLinkClicked(state) {
			return state.isRouterLinkClicked;
		},
		getSaleTime(state) {
			return state.saleTime;
		},
	},
	mutations: {
		changeRouterLinkClicked(state, value) {
			state.isRouterLinkClicked = value;
		},
		decreaseSaleTime(state) {
			state.saleTime -= 1;
		},
	},
	actions: {
		changeRouterLinkClicked(ctx, payload) {
			ctx.commit("changeRouterLinkClicked", payload);
		},
		decreaseSaleTime(ctx) {
			ctx.commit("decreaseSaleTime");
		},
	},
});
