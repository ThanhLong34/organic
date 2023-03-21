export function initWishlist() {
	if (localStorage.getItem("wishlist") === null) {
		localStorage.setItem("wishlist", JSON.stringify([]));
	}
}

export function getWishlist() {
	initWishlist();

	return JSON.parse(localStorage.getItem("wishlist"));
}

export function checkItemExistWishlist(productId) {
	const wishlist = JSON.parse(localStorage.getItem("wishlist"));

	if (Array.isArray(wishlist)) {
		return wishlist.includes(productId);
	}

	return false;
}

export function addItemWishlist(productId) {
	const wishlist = JSON.parse(localStorage.getItem("wishlist"));

	if (Array.isArray(wishlist)) {
		if (!wishlist.includes(productId)) {
			wishlist.push(productId);
		}
	}

	localStorage.setItem("wishlist", JSON.stringify(wishlist));
}

export function removeItemWishlist(productId) {
	let wishlist = JSON.parse(localStorage.getItem("wishlist"));

	if (Array.isArray(wishlist)) {
		let idx = wishlist.indexOf(productId);
		if (idx > -1) {
			wishlist.splice(idx, 1);
		}
	}

	localStorage.setItem("wishlist", JSON.stringify(wishlist));
}

export function initCart() {
	if (localStorage.getItem("cart") === null) {
		localStorage.setItem("cart", JSON.stringify([]));
	}
}

export function getCart() {
	initCart();

	return JSON.parse(localStorage.getItem("cart"));
}

export function setCart(cart = []) {
	if (Array.isArray(cart)) {
		localStorage.setItem("cart", JSON.stringify(cart));
	}
}

export function resetCart() {
	localStorage.setItem("cart", JSON.stringify([]));
}

export function checkItemExistCart(productId) {
	const cart = JSON.parse(localStorage.getItem("cart"));

	if (Array.isArray(cart)) {
		return cart.find((i) => i.id === productId);
	}

	return false;
}

export function addItemCart(product) {
	const cart = JSON.parse(localStorage.getItem("cart"));

	if (Array.isArray(cart)) {
		if (!cart.find((i) => i.id === product.id)) {
			cart.push(product);
		}
	}

	localStorage.setItem("cart", JSON.stringify(cart));
}

export function removeItemCart(productId) {
	let cart = JSON.parse(localStorage.getItem("cart"));

	if (Array.isArray(cart)) {
		let idx = cart.findIndex((i) => i.id === productId);
		if (idx > -1) {
			cart.splice(idx, 1);
		}
	}

	localStorage.setItem("cart", JSON.stringify(cart));
}

export function updateItemCart(product) {
	let cart = JSON.parse(localStorage.getItem("cart"));

	if (Array.isArray(cart)) {
		const p = cart.find((i) => i.id === product.id);
		if (p) {
			p.quantity = product.quantity;
		}
	}

	localStorage.setItem("cart", JSON.stringify(cart));
}
