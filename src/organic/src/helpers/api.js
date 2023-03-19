import store from "@/store/index.js";

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
			"system-role-id": store.state.systemRoleId ?? 0,
		},
	})
		.then((response) => response.json())
		.then((data) => {
			resolveCallback(data);
		})
		.catch((error) => {
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
			"system-role-id": store.state.systemRoleId ?? 0,
		},
		body: JSON.stringify(payload),
	})
		.then((response) => response.json())
		.then((data) => {
			resolveCallback(data);
		})
		.catch((error) => {
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
			"system-role-id": store.state.systemRoleId ?? 0,
		},
		body: JSON.stringify(payload),
	})
		.then((response) => response.json())
		.then((data) => {
			resolveCallback(data);
		})
		.catch((error) => {
			console.error(error);
			rejectCallback(error);
		});
}
