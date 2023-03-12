import store from "@/store/index.js";

const Funcs = {
	checkPermissionFunction(functionName) {
		return store.state.accountLogin?.functions?.includes(functionName);
	}
};

export default Funcs;
