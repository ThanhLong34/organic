import store from "@/store/index.js";

const VND = new Intl.NumberFormat("vi-VN", {
	style: "currency",
	currency: "VND",
});

const Funcs = {
	checkPermissionFunction(functionName) {
		return store.state.accountLogin?.functions?.includes(functionName);
	},
	toVND(price) {
		return VND.format(price);
	},
};

export default Funcs;
