import store from "@/store/index.js";
import { ElMessage } from "element-plus";

export function get(
	url,
	params = {},
	resolveCallback = () => {},
	rejectCallback = () => {}
) {
	let api = url;

	if (typeof params === "object" && params !== null) {
		api += "?";
		Object.entries(params).forEach(([key, value]) => {
			api += `${key}=${value}&`;
		});
	}

	return fetch(api, {
		method: "GET",
		headers: {
			"system-role-id": store.state.accountLogin?.systemRoleId ?? 0,
		},
	})
		.then((response) => response.json())
		.then((data) => {
			resolveCallback(data);
			if (data.code === 9) {
				ElMessage({
					message: data.message,
					type: "error",
				});
			}
		})
		.catch((error) => {
			ElMessage({
				message: "Lỗi",
				type: "error",
			});
			console.error(error);
			rejectCallback(error);
		});
}

export function post(
	url,
	payload = {},
	resolveCallback = () => {},
	rejectCallback = () => {}
) {
	let api = url;

	return fetch(api, {
		method: "POST",
		headers: {
			"system-role-id": store.state.accountLogin?.systemRoleId ?? 0,
		},
		body: JSON.stringify(payload),
	})
		.then((response) => response.json())
		.then((data) => {
			resolveCallback(data);
			if (data.code === 9) {
				ElMessage({
					message: data.message,
					type: "error",
				});
			}
		})
		.catch((error) => {
			ElMessage({
				message: "Lỗi",
				type: "error",
			});
			console.error(error);
			rejectCallback(error);
		});
}

export function put(
	url,
	payload = {},
	resolveCallback = () => {},
	rejectCallback = () => {}
) {
	let api = url;

	return fetch(api, {
		method: "PUT",
		headers: {
			"system-role-id": store.state.accountLogin?.systemRoleId ?? 0,
		},
		body: JSON.stringify(payload),
	})
		.then((response) => response.json())
		.then((data) => {
			resolveCallback(data);
			if (data.code === 9) {
				ElMessage({
					message: data.message,
					type: "error",
				});
			}
		})
		.catch((error) => {
			ElMessage({
				message: "Lỗi",
				type: "error",
			});
			console.error(error);
			rejectCallback(error);
		});
}

export function deleteById(
	url,
	id,
	resolveCallback = () => {},
	rejectCallback = () => {}
) {
	let api = url;

	return fetch(api, {
		method: "PUT",
		headers: {
			"system-role-id": store.state.accountLogin?.systemRoleId ?? 0,
		},
		body: JSON.stringify({
			id,
		}),
	})
		.then((response) => response.json())
		.then((data) => {
			resolveCallback(data);
			if (data.code === 9) {
				ElMessage({
					message: data.message,
					type: "error",
				});
			}
		})
		.catch((error) => {
			ElMessage({
				message: "Lỗi",
				type: "error",
			});
			console.error(error);
			rejectCallback(error);
		});
}

export function uploadFile(
	url,
	formData = new FormData(),
	resolveCallback,
	rejectCallback
) {
	let api = url;

	return fetch(api, {
		method: "POST",
		headers: {
			"system-role-id": store.state.accountLogin?.systemRoleId ?? 0,
		},
		body: formData,
	})
		.then((response) => response.json())
		.then((data) => {
			resolveCallback(data);
			if (data.code === 9) {
				ElMessage({
					message: data.message,
					type: "error",
				});
			}
		})
		.catch((error) => {
			ElMessage({
				message: "Lỗi",
				type: "error",
			});
			console.error(error);
			rejectCallback(error);
		});
}

export function uploadImage(
	url,
	file,
	resolveCallback = () => {},
	rejectCallback = () => {}
) {
	const imageExts = ["jpeg", "jpg", "jfif", "png", "gif", "webp"];
	// Lấy ext file và kiểm tra định dạng file có hợp lệ với định dạng file server không
	if (!imageExts.includes(file.type.split("/")[1])) {
		ElMessage({
			message:
				"Chỉ chấp nhận các định dạng file sau: " + imageExts.join(" | "),
			type: "error",
		});
		return false;
	}

	let api = url;

	const formData = new FormData();
	formData.append("image", file);

	return fetch(api, {
		method: "POST",
		headers: {
			"system-role-id": store.state.accountLogin?.systemRoleId ?? 0,
		},
		body: formData,
	})
		.then((response) => response.json())
		.then((data) => {
			resolveCallback(data);
			if (data.code === 9) {
				ElMessage({
					message: data.message,
					type: "error",
				});
			}
		})
		.catch((error) => {
			ElMessage({
				message: "Lỗi",
				type: "error",
			});
			console.error(error);
			rejectCallback(error);
		});
}
