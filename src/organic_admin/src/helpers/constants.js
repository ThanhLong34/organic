const menus = {
	Dashboard: "Dashboard", // ✅
	SystemRole: "SystemRole", // ✅
	SystemMenu: "SystemMenu", // ✅
	SystemFunction: "SystemFunction", // ✅
	SystemAdmin: "SystemAdmin", // ✅
	Image: "Image", // ✅
	ProductCategory: "ProductCategory", // ✅
	Product: "Product", // ✅
	AddProduct: "AddProduct", // ✅
	EditProduct: "EditProduct", // ✅
	ProductReview: "ProductReview", // ✅
	Blog: "Blog", // ✅
	AddBlog: "AddBlog", // ✅
	EditBlog: "EditBlog", // ✅
	Subscribe: "Subscribe", // ✅
	Contact: "Contact", // ✅
	CouponCode: "CouponCode", // ✅
	OrderStatus: "OrderStatus", // ✅
	Order: "Order", // ✅
	Profile: "Profile", // ✅
	Signin: "Signin" // ✅
};

const functions = {
	// SystemRole
	AddSystemRole: "AddSystemRole", // ✅
	DeleteSystemRole: "DeleteSystemRole", // ✅
	GetSystemRoleItem: "GetSystemRoleItem", // ✅
	GetSystemRoleList: "GetSystemRoleList", // ✅
	TrashSystemRole: "TrashSystemRole", // ✅
	UpdateSystemRole: "UpdateSystemRole", // ✅
	// SystemMenu
	AddSystemMenu: "AddSystemMenu", // ✅
	DeleteSystemMenu: "DeleteSystemMenu", // ✅
	GetSystemMenuItem: "GetSystemMenuItem", // ✅
	GetSystemMenuListBySystemRoleId: "GetSystemMenuListBySystemRoleId", // ✅
	GetSystemMenuList: "GetSystemMenuList", // ✅
	TrashSystemMenu: "TrashSystemMenu", // ✅
	UpdateSystemMenu: "UpdateSystemMenu", // ✅
	// SystemFunction
	AddSystemFunction: "AddSystemFunction", // ✅
	DeleteSystemFunction: "DeleteSystemFunction", // ✅
	GetSystemFunctionItem: "GetSystemFunctionItem", // ✅
	GetSystemFunctionListBySystemRoleId: "GetSystemFunctionListBySystemRoleId", // ✅
	GetSystemFunctionList: "GetSystemFunctionList", // ✅
	TrashSystemFunction: "TrashSystemFunction", // ✅
	UpdateSystemFunction: "UpdateSystemFunction", // ✅
	// SystemRoleMenu
	AddSystemRoleMenu: "AddSystemRoleMenu", // ✅
	DeleteSystemRoleMenu: "DeleteSystemRoleMenu", // ✅
	// SystemRoleFunction
	AddSystemRoleFunction: "AddSystemRoleFunction", // ✅
	DeleteSystemRoleFunction: "DeleteSystemRoleFunction", // ✅
	// SystemAdmin
	LoginSystemAdmin: "LoginSystemAdmin", // ✅
	RegisterSystemAdmin: "RegisterSystemAdmin", // ✅
	DeleteSystemAdmin: "DeleteSystemAdmin", // ✅
	GetSystemAdminItem: "GetSystemAdminItem", // ✅
	GetSystemAdminList: "GetSystemAdminList", // ✅
	ResetPasswordSystemAdmin: "ResetPasswordSystemAdmin", // ✅
	TrashSystemAdmin: "TrashSystemAdmin", // ✅
	UpdateAvatarSystemAdmin: "UpdateAvatarSystemAdmin", // ✅
	UpdateEmailSystemAdmin: "UpdateEmailSystemAdmin", // ✅
	UpdateNicknameSystemAdmin: "UpdateNicknameSystemAdmin", // ✅
	UpdatePasswordSystemAdmin: "UpdatePasswordSystemAdmin", // ✅
	UpdatePhoneSystemAdmin: "UpdatePhoneSystemAdmin", // ✅
	UpdateSystemRoleForSystemAdmin: "UpdateSystemRoleForSystemAdmin", // ✅
	// Image
	DeleteImage: "DeleteImage", // ✅
	GetImageItem: "GetImageItem", // ✅
	GetImageList: "GetImageList", // ✅
	UploadImage: "UploadImage", // ✅
	RemoveImageDontUse: "RemoveImageDontUse", // ✅
	ViewImage: "ViewImage", // ✅
	// ProductCategory
	AddProductCategory: "AddProductCategory", // ✅
	DeleteProductCategory: "DeleteProductCategory", // ✅
	GetProductCategoryItem: "GetProductCategoryItem", // ✅
	GetProductCategoryList: "GetProductCategoryList", // ✅
	TrashProductCategory: "TrashProductCategory", // ✅
	UpdateProductCategory: "UpdateProductCategory", // ✅
	// Product
	AddProduct: "AddProduct", // ✅
	DeleteProduct: "DeleteProduct", // ✅
	GetProductItem: "GetProductItem", // ✅
	GetProductList: "GetProductList", // ✅
	TrashProduct: "TrashProduct", // ✅
	UpdateProduct: "UpdateProduct", // ✅
	ViewProductDetails: "ViewProductDetails", // ✅
	// ProductImage
	AddProductImageList: "AddProductImageList", // ✅
	DeleteProductImageList: "DeleteProductImageList", // ✅
	GetProductImageListByProductId: "GetProductImageListByProductId", // ✅
	// Blog
	AddBlog: "AddBlog", // ✅
	DeleteBlog: "DeleteBlog", // ✅
	GetBlogItem: "GetBlogItem", // ✅
	GetBlogList: "GetBlogList", // ✅
	TrashBlog: "TrashBlog", // ✅
	UpdateBlog: "UpdateBlog", // ✅
	ViewBlogDetails: "ViewBlogDetails",
	// Contact
	AddContact: "AddContact", // ✅
	DeleteContact: "DeleteContact", // ✅
	GetContactItem: "GetContactItem", // ✅
	GetContactList: "GetContactList", // ✅
	ReplyContact: "ReplyContact", // ✅
	TrashContact: "TrashContact", // ✅
	ViewContactDetails: "ViewContactDetails",
	// Subscribe
	AddSubscribe: "AddSubscribe", // ✅
	DeleteSubscribe: "DeleteSubscribe", // ✅
	GetSubscribeItem: "GetSubscribeItem", // ✅
	GetSubscribeList: "GetSubscribeList", // ✅
	TrashSubscribe: "TrashSubscribe", // ✅
	// CouponCode
	AddCouponCode: "AddCouponCode", // ✅
	DeleteCouponCode: "DeleteCouponCode", // ✅
	GetCouponCodeItemByCode: "GetCouponCodeItemByCode", // ✅
	GetCouponCodeItem: "GetCouponCodeItem", // ✅
	GetCouponCodeList: "GetCouponCodeList", // ✅
	TrashCouponCode: "TrashCouponCode", // ✅
	UpdateCouponCode: "UpdateCouponCode", // ✅
	// OrderStatus
	AddOrderStatus: "AddOrderStatus", // ✅
	DeleteOrderStatus: "DeleteOrderStatus", // ✅
	GetOrderStatusItem: "GetOrderStatusItem", // ✅
	GetOrderStatusList: "GetOrderStatusList", // ✅
	TrashOrderStatus: "TrashOrderStatus", // ✅
	UpdateOrderStatus: "UpdateOrderStatus", // ✅
	// Order
	AddOrder: "AddOrder", // ✅
	DeleteOrder: "DeleteOrder", // ✅
	GetOrderItem: "GetOrderItem", // ✅
	GetOrderList: "GetOrderList", // ✅
	TrashOrder: "TrashOrder", // ✅
	UpdateOrderStatusForOrder: "UpdateOrderStatusForOrder", // ✅
	ViewOrderDetails: "ViewOrderDetails", // ✅
	// ProductOrder
	AddProductOrderList: "AddProductOrderList", // ✅
	GetProductOrderListByOrderId: "GetProductOrderListByOrderId", // ✅
	// Mail
	SendCustomizeMail: "SendCustomizeMail", // ✅
	// ProductReview
	AddProductReview: "AddProductReview", // ✅
	DeleteProductReview: "DeleteProductReview", // ✅
	GetProductReviewItem: "GetProductReviewItem", // ✅
	GetProductReviewListForProduct: "GetProductReviewListForProduct", // ✅
	RemoveReplyProductReview: "RemoveReplyProductReview", // ✅
	ReplyProductReview: "ReplyProductReview", // ✅
	TrashProductReview: "TrashProductReview", // ✅
	UpdateProductReview: "UpdateProductReview", // ✅
	ViewProductReviewDetails: "ViewProductReviewDetails", // ✅
};

export { menus, functions };
