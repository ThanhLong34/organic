-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 08, 2023 at 12:07 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `organic_food`
--

-- --------------------------------------------------------

--
-- Table structure for table `blog`
--

CREATE TABLE `blog` (
  `id` int(11) NOT NULL,
  `createdAt` varchar(255) DEFAULT NULL,
  `updatedAt` varchar(255) DEFAULT NULL,
  `deletedAt` varchar(255) DEFAULT NULL,
  `featureImageId` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `systemAdminId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `createdAt` varchar(255) DEFAULT NULL,
  `updatedAt` varchar(255) DEFAULT NULL,
  `deletedAt` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `couponcode`
--

CREATE TABLE `couponcode` (
  `id` int(11) NOT NULL,
  `createdAt` varchar(255) DEFAULT NULL,
  `updatedAt` varchar(255) DEFAULT NULL,
  `deletedAt` varchar(255) DEFAULT NULL,
  `code` varchar(255) NOT NULL,
  `applyToEmail` varchar(255) NOT NULL,
  `percentValue` int(11) DEFAULT 0,
  `isUsed` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `image`
--

CREATE TABLE `image` (
  `id` int(11) NOT NULL,
  `createdAt` varchar(255) DEFAULT NULL,
  `updatedAt` varchar(255) DEFAULT NULL,
  `deletedAt` varchar(255) DEFAULT NULL,
  `link` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `size` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `image`
--

INSERT INTO `image` (`id`, `createdAt`, `updatedAt`, `deletedAt`, `link`, `filename`, `size`) VALUES
(2, '11:17:07 04/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image6402c643a64cc.jpg', 'project_image6402c643a64cc.jpg', 18581),
(3, '20:20:52 04/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image640345b4d71c9.jpg', 'project_image640345b4d71c9.jpg', 7662),
(4, '20:21:00 04/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image640345bc33a5e.jpg', 'project_image640345bc33a5e.jpg', 3659),
(5, '11:17:42 05/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image640417e6659d3.jpg', 'project_image640417e6659d3.jpg', 7176),
(6, '11:25:40 05/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image640419c421456.jpg', 'project_image640419c421456.jpg', 6700),
(7, '11:26:36 05/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image640419fcd2585.jpg', 'project_image640419fcd2585.jpg', 18912),
(8, '11:27:19 05/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image64041a27747fa.jpg', 'project_image64041a27747fa.jpg', 39745),
(9, '11:28:03 05/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image64041a5358b14.jpg', 'project_image64041a5358b14.jpg', 18912),
(10, '11:31:00 05/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image64041b0423f18.jpg', 'project_image64041b0423f18.jpg', 7176),
(11, '11:32:14 05/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image64041b4e26560.gif', 'project_image64041b4e26560.gif', 754376),
(12, '11:33:01 05/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image64041b7d7095b.jpg', 'project_image64041b7d7095b.jpg', 7662),
(13, '11:33:49 05/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image64041bad5d063.jpg', 'project_image64041bad5d063.jpg', 7662),
(14, '13:36:26 05/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image6404386af0f74.gif', 'project_image6404386af0f74.gif', 754376),
(15, '16:01:51 05/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image64045a7f89053.jpg', 'project_image64045a7f89053.jpg', 8166),
(16, '16:02:12 05/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image64045a948dfdc.jpg', 'project_image64045a948dfdc.jpg', 7176),
(17, '21:12:16 06/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image6405f4c0dc783.jpg', 'project_image6405f4c0dc783.jpg', 8595),
(18, '21:13:02 06/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image6405f4ee67a37.jpg', 'project_image6405f4ee67a37.jpg', 7662);

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `createdAt` varchar(255) DEFAULT NULL,
  `updatedAt` varchar(255) DEFAULT NULL,
  `deletedAt` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) NOT NULL,
  `streetAddress` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `couponCodeId` int(11) DEFAULT NULL,
  `deliveryCost` int(11) DEFAULT 0,
  `totalCost` int(11) DEFAULT 0,
  `paymentCost` int(11) DEFAULT 0,
  `orderStatusId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `orderstatus`
--

CREATE TABLE `orderstatus` (
  `id` int(11) NOT NULL,
  `createdAt` varchar(255) DEFAULT NULL,
  `updatedAt` varchar(255) DEFAULT NULL,
  `deletedAt` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orderstatus`
--

INSERT INTO `orderstatus` (`id`, `createdAt`, `updatedAt`, `deletedAt`, `name`) VALUES
(1, '09:43:18 04/03/2023', NULL, NULL, 'Đang chờ duyệt'),
(2, '09:43:18 04/03/2023', NULL, NULL, 'Đã duyệt'),
(3, '09:43:18 04/03/2023', NULL, NULL, 'Đã từ chối'),
(4, '09:43:18 04/03/2023', NULL, NULL, 'Đã thanh toán'),
(5, '09:43:18 04/03/2023', NULL, NULL, 'Yêu cầu hủy'),
(6, '09:43:18 04/03/2023', NULL, NULL, 'Đã hủy'),
(7, '09:43:18 04/03/2023', NULL, NULL, 'Yêu cầu hoàn tiền'),
(8, '09:43:18 04/03/2023', NULL, NULL, 'Đã hoàn tiền');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `createdAt` varchar(255) DEFAULT NULL,
  `updatedAt` varchar(255) DEFAULT NULL,
  `deletedAt` varchar(255) DEFAULT NULL,
  `featureImageId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `originPrice` int(11) DEFAULT 0,
  `promotionPrice` int(11) DEFAULT 0,
  `shortDescription` varchar(1000) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `isSpecial` tinyint(1) DEFAULT 0,
  `isNew` tinyint(1) DEFAULT 0,
  `isBestOffer` tinyint(1) DEFAULT 0,
  `productCategoryId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `productcategory`
--

CREATE TABLE `productcategory` (
  `id` int(11) NOT NULL,
  `createdAt` varchar(255) DEFAULT NULL,
  `updatedAt` varchar(255) DEFAULT NULL,
  `deletedAt` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `featureImageId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `productreview`
--

CREATE TABLE `productreview` (
  `id` int(11) NOT NULL,
  `createdAt` varchar(255) DEFAULT NULL,
  `updatedAt` varchar(255) DEFAULT NULL,
  `deletedAt` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `comment` varchar(1000) NOT NULL,
  `rating` tinyint(4) NOT NULL,
  `isShow` tinyint(1) NOT NULL DEFAULT 1,
  `productId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `product_image`
--

CREATE TABLE `product_image` (
  `productId` int(11) NOT NULL,
  `imageId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `product_order`
--

CREATE TABLE `product_order` (
  `productId` int(11) NOT NULL,
  `orderId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `subscribe`
--

CREATE TABLE `subscribe` (
  `id` int(11) NOT NULL,
  `createdAt` varchar(255) DEFAULT NULL,
  `updatedAt` varchar(255) DEFAULT NULL,
  `deletedAt` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `systemadmin`
--

CREATE TABLE `systemadmin` (
  `id` int(11) NOT NULL,
  `createdAt` varchar(255) DEFAULT NULL,
  `updatedAt` varchar(255) DEFAULT NULL,
  `deletedAt` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nickname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `avatarId` int(11) DEFAULT NULL,
  `systemRoleId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `systemadmin`
--

INSERT INTO `systemadmin` (`id`, `createdAt`, `updatedAt`, `deletedAt`, `username`, `password`, `nickname`, `email`, `phone`, `avatarId`, `systemRoleId`) VALUES
(4, '18:08:50 04/03/2023', '10:08:36 07/03/2023', NULL, 'dragondev0304', '202cb962ac59075b964b07152d234b70', 'Thành Long', 'dragondevshop@gmail.com', '0353292241', 18, 1),
(5, '18:46:33 04/03/2023', '13:36:27 05/03/2023', NULL, 'client', '62608e08adc29a8d6dbc9754e659f125', 'Client', 'dragondevshop@gmail.com', '0353292241', 14, 2),
(16, '14:26:09 07/03/2023', '18:06:13 08/03/2023', NULL, 'websitemanager1', '31ab87da1483902d91ead5c5e21bf462', 'Quản lý website 1', '2014468@dlu.edu.vn', '0123456789', NULL, 3);

-- --------------------------------------------------------

--
-- Table structure for table `systemfunction`
--

CREATE TABLE `systemfunction` (
  `id` int(11) NOT NULL,
  `createdAt` varchar(255) DEFAULT NULL,
  `updatedAt` varchar(255) DEFAULT NULL,
  `deletedAt` varchar(255) DEFAULT NULL,
  `apiPath` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `method` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `systemfunction`
--

INSERT INTO `systemfunction` (`id`, `createdAt`, `updatedAt`, `deletedAt`, `apiPath`, `name`, `description`, `method`) VALUES
(2, '22:14:51 07/03/2023', NULL, NULL, 'system_menu/add.php', 'AddSystemMenu', 'Add system menu', 'POST'),
(3, '22:15:19 07/03/2023', NULL, NULL, 'system_menu/delete.php', 'DeleteSystemMenu', 'Delete system menu by id', 'DELETE'),
(4, '22:15:43 07/03/2023', NULL, NULL, 'system_menu/get_item.php', 'GetSystemMenuItem', 'Get system menu item by id', 'GET'),
(5, '22:18:16 07/03/2023', NULL, NULL, 'system_menu/get_list_by_system_role_id.php', 'GetSystemMenuListBySystemRoleId', 'Get system menu list by system role id ', 'GET'),
(6, '22:25:58 07/03/2023', NULL, NULL, 'system_menu/get_list.php', 'GetSystemMenuList', 'Get system menu list', 'GET'),
(7, '22:26:26 07/03/2023', NULL, NULL, 'system_menu/trash.php', 'TrashSystemMenu', 'Trash system menu by id', 'PUT'),
(8, '22:26:48 07/03/2023', NULL, NULL, 'system_menu/update.php', 'UpdateSystemMenu', 'Update system menu', 'PUT'),
(9, '22:36:47 07/03/2023', NULL, NULL, 'system_role/add.php', 'AddSystemRole', 'Add system role', 'POST'),
(10, '22:37:58 07/03/2023', NULL, NULL, 'system_role/delete.php', 'DeleteSystemRole', 'Delete system role by id', 'DELETE'),
(11, '22:38:31 07/03/2023', NULL, NULL, 'system_role/get_item.php', 'GetSystemRoleItem', 'Get system role item by id', 'GET'),
(12, '22:38:48 07/03/2023', NULL, NULL, 'system_role/get_list.php', 'GetSystemRoleList', 'Get system role list', 'GET'),
(13, '22:39:13 07/03/2023', NULL, NULL, 'system_role/trash.php', 'TrashSystemRole', 'Trash system role by id', 'PUT'),
(14, '22:39:38 07/03/2023', NULL, NULL, 'system_role/update.php', 'UpdateSystemRole', 'Update system role', 'PUT'),
(15, '14:57:26 08/03/2023', NULL, NULL, 'system_function/add.php', 'AddSystemFunction', 'Add system function', 'POST'),
(16, '14:59:45 08/03/2023', NULL, NULL, 'system_function/delete.php', 'DeleteSystemFunction', 'Delete system function by id', 'DELETE'),
(17, '15:00:08 08/03/2023', NULL, NULL, 'system_function/get_item.php', 'GetSystemFunctionItem', 'Get system function item by id', 'GET'),
(18, '15:00:30 08/03/2023', NULL, NULL, 'system_function/get_list_by_system_role_id.php', 'GetSystemFunctionListBySystemRoleId', 'Get system function list by system role id', 'GET'),
(19, '15:00:45 08/03/2023', NULL, NULL, 'system_function/get_list.php', 'GetSystemFunctionList', 'Get system function list', 'GET'),
(20, '15:01:06 08/03/2023', NULL, NULL, 'system_function/trash.php', 'TrashSystemFunction', 'Trash system function', 'PUT'),
(21, '15:01:20 08/03/2023', NULL, NULL, 'system_function/update.php', 'UpdateSystemFunction', 'Update system function', 'PUT'),
(22, '15:02:27 08/03/2023', NULL, NULL, 'system_role_menu/add.php', 'AddSystemRoleMenu', 'Add system role menu', 'POST'),
(23, '15:02:56 08/03/2023', NULL, NULL, 'system_role_menu/delete.php', 'DeleteSystemRoleMenu', 'Delete system role menu', 'POST, DELETE'),
(24, '15:03:24 08/03/2023', NULL, NULL, 'system_role_function/add.php', 'AddSystemRoleFunction', 'Add system role function', 'POST'),
(25, '15:03:44 08/03/2023', NULL, NULL, 'system_role_function/delete.php', 'DeleteSystemRoleFunction', 'Delete system role function', 'POST, DELETE'),
(26, '15:04:17 08/03/2023', NULL, NULL, 'system_admin/login.php', 'LoginSystemAdmin', 'Login system admin', 'POST'),
(27, '15:04:58 08/03/2023', NULL, NULL, 'system_admin/register.php', 'RegisterSystemAdmin', 'Register system admin', 'POST'),
(28, '15:05:33 08/03/2023', NULL, NULL, 'system_admin/delete.php', 'DeleteSystemAdmin', 'Delete system admin by id', 'DELETE'),
(29, '15:05:58 08/03/2023', NULL, NULL, 'system_admin/get_item.php', 'GetSystemAdminItem', 'Get system admin item by id', 'GET'),
(30, '15:06:19 08/03/2023', NULL, NULL, 'system_admin/get_list.php', 'GetSystemAdminList', 'Get system admin list', 'GET'),
(31, '15:06:56 08/03/2023', NULL, NULL, 'system_admin/reset_password.php', 'ResetPasswordSystemAdmin', 'Reset password system admin, send new password in email', 'PUT'),
(32, '15:07:16 08/03/2023', NULL, NULL, 'system_admin/trash.php', 'TrashSystemAdmin', 'Trash system admin', 'PUT'),
(33, '15:08:08 08/03/2023', NULL, NULL, 'system_admin/update_avatar.php', 'UpdateAvatarSystemAdmin', 'Update avatar system admin', 'PUT'),
(34, '15:08:29 08/03/2023', NULL, NULL, 'system_admin/update_email.php', 'UpdateEmailSystemAdmin', 'Update email system admin', 'PUT'),
(35, '15:08:43 08/03/2023', NULL, NULL, 'system_admin/update_nickname.php', 'UpdateNicknameSystemAdmin', 'Update nickname system admin', 'PUT'),
(36, '15:09:06 08/03/2023', NULL, NULL, 'system_admin/update_password.php', 'UpdatePasswordSystemAdmin', 'Update password system admin', 'PUT'),
(37, '15:09:15 08/03/2023', NULL, NULL, 'system_admin/update_phone.php', 'UpdatePhoneSystemAdmin', 'Update phone system admin', 'PUT');

-- --------------------------------------------------------

--
-- Table structure for table `systemmenu`
--

CREATE TABLE `systemmenu` (
  `id` int(11) NOT NULL,
  `createdAt` varchar(255) DEFAULT NULL,
  `updatedAt` varchar(255) DEFAULT NULL,
  `deletedAt` varchar(255) DEFAULT NULL,
  `routeName` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `isBase` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `systemmenu`
--

INSERT INTO `systemmenu` (`id`, `createdAt`, `updatedAt`, `deletedAt`, `routeName`, `title`, `isBase`) VALUES
(1, '15:17:32 05/03/2023', NULL, NULL, 'Dashboard', 'Dashboard', 1),
(2, '15:18:38 05/03/2023', '18:26:55 06/03/2023', NULL, 'SystemRole', 'Vai trò', 0),
(3, '15:19:39 05/03/2023', '18:27:01 06/03/2023', NULL, 'SystemMenu', 'Menu', 0),
(4, '15:19:43 05/03/2023', '18:27:26 06/03/2023', NULL, 'SystemFunction', 'Chức năng', 0),
(5, '15:19:46 05/03/2023', NULL, NULL, 'SystemAdmin', 'Tài khoản Admin', 0),
(6, '15:19:51 05/03/2023', NULL, NULL, 'Image', 'Tệp hình ảnh', 0),
(7, '15:19:55 05/03/2023', NULL, NULL, 'ProductCategory', 'Danh mục sản phẩm', 0),
(8, '15:19:59 05/03/2023', NULL, NULL, 'Product', 'Sản phẩm', 0),
(9, '15:27:14 05/03/2023', NULL, NULL, 'AddProduct', 'Thêm sản phẩm', 0),
(10, '15:27:17 05/03/2023', NULL, NULL, 'EditProduct', 'Chỉnh sửa sản phẩm', 0),
(11, '15:27:21 05/03/2023', NULL, NULL, 'Blog', 'Bài viết', 0),
(12, '15:27:25 05/03/2023', NULL, NULL, 'AddBlog', 'Thêm bài viết', 0),
(13, '15:27:29 05/03/2023', NULL, NULL, 'EditBlog', 'Chỉnh sửa bài viết', 0),
(14, '15:27:34 05/03/2023', NULL, NULL, 'Subscribe', 'Khách hàng đăng ký', 0),
(15, '15:27:38 05/03/2023', NULL, NULL, 'Contact', 'Khách hàng liên hệ', 0),
(16, '15:27:41 05/03/2023', NULL, NULL, 'CounponCode', 'Mã giảm giá', 0),
(17, '15:27:45 05/03/2023', NULL, NULL, 'OrderStatus', 'Trạng thái đơn hàng', 0),
(18, '15:27:48 05/03/2023', NULL, NULL, 'Order', 'Đơn hàng', 0),
(19, '15:27:52 05/03/2023', '10:06:35 07/03/2023', NULL, 'Profile', 'Hồ sơ cá nhân', 1),
(20, '15:28:12 05/03/2023', NULL, NULL, 'Signin', 'Đăng nhập', 1);

-- --------------------------------------------------------

--
-- Table structure for table `systemrole`
--

CREATE TABLE `systemrole` (
  `id` int(11) NOT NULL,
  `createdAt` varchar(255) DEFAULT NULL,
  `updatedAt` varchar(255) DEFAULT NULL,
  `deletedAt` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `systemrole`
--

INSERT INTO `systemrole` (`id`, `createdAt`, `updatedAt`, `deletedAt`, `name`) VALUES
(1, '09:43:18 04/03/2023', '13:17:33 07/03/2023', NULL, 'Quản lý hệ thống'),
(2, '09:44:00 04/03/2023', '09:52:19 04/03/2023', NULL, 'Ứng dụng'),
(3, '09:49:56 04/03/2023', '13:17:24 07/03/2023', NULL, 'Quản lý website'),
(4, '09:50:15 04/03/2023', NULL, NULL, 'Hỗ trợ khách hàng');

-- --------------------------------------------------------

--
-- Table structure for table `systemrole_function`
--

CREATE TABLE `systemrole_function` (
  `systemRoleId` int(11) NOT NULL,
  `systemFunctionId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `systemrole_function`
--

INSERT INTO `systemrole_function` (`systemRoleId`, `systemFunctionId`) VALUES
(1, 12),
(1, 15),
(1, 24),
(1, 25),
(1, 2),
(1, 3),
(1, 26),
(1, 16),
(1, 17),
(1, 18),
(1, 19),
(1, 20),
(1, 21),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 13),
(1, 14),
(1, 22),
(1, 23),
(1, 27),
(1, 28),
(1, 29),
(1, 30),
(1, 31),
(1, 32),
(1, 33),
(1, 34),
(1, 35),
(1, 36),
(1, 37);

-- --------------------------------------------------------

--
-- Table structure for table `systemrole_menu`
--

CREATE TABLE `systemrole_menu` (
  `systemRoleId` int(11) NOT NULL,
  `systemMenuId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `systemrole_menu`
--

INSERT INTO `systemrole_menu` (`systemRoleId`, `systemMenuId`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(3, 7),
(3, 8),
(3, 9),
(3, 10),
(3, 11),
(3, 12),
(3, 13),
(3, 14),
(3, 15),
(3, 16),
(3, 17),
(3, 18);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adminId` (`systemAdminId`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `couponcode`
--
ALTER TABLE `couponcode`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `link` (`link`),
  ADD UNIQUE KEY `filename` (`filename`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `couponCodeId` (`couponCodeId`),
  ADD KEY `orderStatusId` (`orderStatusId`);

--
-- Indexes for table `orderstatus`
--
ALTER TABLE `orderstatus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productCategoryId` (`productCategoryId`);

--
-- Indexes for table `productcategory`
--
ALTER TABLE `productcategory`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `productreview`
--
ALTER TABLE `productreview`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productId` (`productId`);

--
-- Indexes for table `product_image`
--
ALTER TABLE `product_image`
  ADD KEY `productId` (`productId`),
  ADD KEY `imageId` (`imageId`);

--
-- Indexes for table `product_order`
--
ALTER TABLE `product_order`
  ADD KEY `productId` (`productId`),
  ADD KEY `orderId` (`orderId`);

--
-- Indexes for table `subscribe`
--
ALTER TABLE `subscribe`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `systemadmin`
--
ALTER TABLE `systemadmin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `systemRoleId` (`systemRoleId`);

--
-- Indexes for table `systemfunction`
--
ALTER TABLE `systemfunction`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `systemmenu`
--
ALTER TABLE `systemmenu`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `routeName` (`routeName`);

--
-- Indexes for table `systemrole`
--
ALTER TABLE `systemrole`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `systemrole_function`
--
ALTER TABLE `systemrole_function`
  ADD KEY `systemRoleId` (`systemRoleId`),
  ADD KEY `systemFunctionId` (`systemFunctionId`);

--
-- Indexes for table `systemrole_menu`
--
ALTER TABLE `systemrole_menu`
  ADD KEY `systemRoleId` (`systemRoleId`),
  ADD KEY `systemMenuId` (`systemMenuId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blog`
--
ALTER TABLE `blog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `couponcode`
--
ALTER TABLE `couponcode`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `image`
--
ALTER TABLE `image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orderstatus`
--
ALTER TABLE `orderstatus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `productcategory`
--
ALTER TABLE `productcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `productreview`
--
ALTER TABLE `productreview`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscribe`
--
ALTER TABLE `subscribe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `systemadmin`
--
ALTER TABLE `systemadmin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `systemfunction`
--
ALTER TABLE `systemfunction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `systemmenu`
--
ALTER TABLE `systemmenu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `systemrole`
--
ALTER TABLE `systemrole`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `blog`
--
ALTER TABLE `blog`
  ADD CONSTRAINT `blog_ibfk_1` FOREIGN KEY (`systemAdminId`) REFERENCES `systemadmin` (`id`);

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`couponCodeId`) REFERENCES `couponcode` (`id`),
  ADD CONSTRAINT `order_ibfk_2` FOREIGN KEY (`orderStatusId`) REFERENCES `orderstatus` (`id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`productCategoryId`) REFERENCES `productcategory` (`id`);

--
-- Constraints for table `productreview`
--
ALTER TABLE `productreview`
  ADD CONSTRAINT `productreview_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `product` (`id`);

--
-- Constraints for table `product_image`
--
ALTER TABLE `product_image`
  ADD CONSTRAINT `product_image_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `product_image_ibfk_2` FOREIGN KEY (`imageId`) REFERENCES `image` (`id`);

--
-- Constraints for table `product_order`
--
ALTER TABLE `product_order`
  ADD CONSTRAINT `product_order_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `product_order_ibfk_2` FOREIGN KEY (`orderId`) REFERENCES `order` (`id`);

--
-- Constraints for table `systemadmin`
--
ALTER TABLE `systemadmin`
  ADD CONSTRAINT `systemadmin_ibfk_1` FOREIGN KEY (`systemRoleId`) REFERENCES `systemrole` (`id`);

--
-- Constraints for table `systemrole_function`
--
ALTER TABLE `systemrole_function`
  ADD CONSTRAINT `systemrole_function_ibfk_1` FOREIGN KEY (`systemRoleId`) REFERENCES `systemrole` (`id`),
  ADD CONSTRAINT `systemrole_function_ibfk_2` FOREIGN KEY (`systemFunctionId`) REFERENCES `systemfunction` (`id`);

--
-- Constraints for table `systemrole_menu`
--
ALTER TABLE `systemrole_menu`
  ADD CONSTRAINT `systemrole_menu_ibfk_1` FOREIGN KEY (`systemRoleId`) REFERENCES `systemrole` (`id`),
  ADD CONSTRAINT `systemrole_menu_ibfk_2` FOREIGN KEY (`systemMenuId`) REFERENCES `systemmenu` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
