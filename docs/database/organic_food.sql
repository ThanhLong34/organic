-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 14, 2023 at 11:17 AM
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
(18, '21:13:02 06/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image6405f4ee67a37.jpg', 'project_image6405f4ee67a37.jpg', 7662),
(26, '10:10:06 11/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image640bf10e41356.jpg', 'project_image640bf10e41356.jpg', 26476),
(28, '15:01:59 12/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image640d86f7b8e5b.jpg', 'project_image640d86f7b8e5b.jpg', 7662),
(126, '14:36:38 14/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image64102406c72a2.png', 'project_image64102406c72a2.png', 47416),
(127, '14:36:58 14/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image6410241a5b2aa.png', 'project_image6410241a5b2aa.png', 13416),
(128, '14:37:20 14/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image64102430619d9.png', 'project_image64102430619d9.png', 14888),
(129, '14:43:57 14/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image641025bda1e04.png', 'project_image641025bda1e04.png', 38067),
(130, '14:45:00 14/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image641025fcb5903.png', 'project_image641025fcb5903.png', 42383),
(131, '14:47:33 14/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image64102695a0782.png', 'project_image64102695a0782.png', 72083),
(132, '14:49:35 14/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image6410270f66330.png', 'project_image6410270f66330.png', 58229),
(133, '14:55:35 14/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image64102877b161b.png', 'project_image64102877b161b.png', 34717),
(134, '14:56:20 14/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image641028a41d12a.png', 'project_image641028a41d12a.png', 31169),
(144, '16:04:09 14/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image6410388936975.png', 'project_image6410388936975.png', 52020),
(145, '16:04:12 14/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image6410388c35fa8.png', 'project_image6410388c35fa8.png', 52020),
(146, '16:04:14 14/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image6410388e7831a.jpg', 'project_image6410388e7831a.jpg', 82600),
(147, '16:04:16 14/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image64103890a5ec5.jpg', 'project_image64103890a5ec5.jpg', 218814),
(148, '16:05:06 14/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image641038c2b9034.png', 'project_image641038c2b9034.png', 97796),
(149, '16:05:09 14/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image641038c55b79e.png', 'project_image641038c55b79e.png', 97796),
(150, '16:05:11 14/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image641038c7080c2.jpg', 'project_image641038c7080c2.jpg', 82600),
(157, '16:19:05 14/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image64103c090ef22.png', 'project_image64103c090ef22.png', 95033),
(158, '16:19:09 14/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image64103c0d3669a.png', 'project_image64103c0d3669a.png', 95033),
(159, '16:19:09 14/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image64103c0d39059.jpg', 'project_image64103c0d39059.jpg', 82600),
(160, '16:19:09 14/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image64103c0d3923e.jpg', 'project_image64103c0d3923e.jpg', 218814),
(165, '16:21:45 14/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image64103ca92305b.png', 'project_image64103ca92305b.png', 131565),
(166, '16:21:58 14/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image64103cb655c1c.png', 'project_image64103cb655c1c.png', 131565),
(167, '16:22:02 14/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image64103cba8074e.jpg', 'project_image64103cba8074e.jpg', 218814),
(168, '16:23:18 14/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image64103d06e6474.png', 'project_image64103d06e6474.png', 177127),
(169, '16:23:25 14/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image64103d0d83db9.jpg', 'project_image64103d0d83db9.jpg', 82600),
(170, '16:23:25 14/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image64103d0d83db5.png', 'project_image64103d0d83db5.png', 177127),
(171, '16:24:06 14/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image64103d361b4ec.png', 'project_image64103d361b4ec.png', 199249),
(172, '16:24:11 14/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image64103d3bbfac7.png', 'project_image64103d3bbfac7.png', 199249),
(173, '16:24:15 14/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image64103d3f086e3.jpg', 'project_image64103d3f086e3.jpg', 82600),
(174, '16:25:40 14/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image64103d94c785b.png', 'project_image64103d94c785b.png', 110896),
(175, '16:25:44 14/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image64103d980b86d.png', 'project_image64103d980b86d.png', 110896),
(176, '16:25:45 14/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image64103d99bec9a.jpg', 'project_image64103d99bec9a.jpg', 218814),
(177, '16:26:25 14/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image64103dc1932f4.png', 'project_image64103dc1932f4.png', 111711),
(178, '16:26:52 14/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image64103ddc8094b.png', 'project_image64103ddc8094b.png', 111711),
(179, '16:26:52 14/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image64103ddc810ad.jpg', 'project_image64103ddc810ad.jpg', 82600),
(180, '16:28:39 14/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image64103e47bb96f.png', 'project_image64103e47bb96f.png', 103649),
(181, '16:28:43 14/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image64103e4bef8fa.png', 'project_image64103e4bef8fa.png', 103649),
(182, '16:28:43 14/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image64103e4beffb9.jpg', 'project_image64103e4beffb9.jpg', 82600),
(183, '16:29:36 14/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image64103e8038cd1.png', 'project_image64103e8038cd1.png', 114609),
(184, '16:29:40 14/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image64103e84830f6.png', 'project_image64103e84830f6.png', 114609),
(185, '16:29:40 14/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image64103e8485116.jpg', 'project_image64103e8485116.jpg', 218814),
(186, '16:30:09 14/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image64103ea1d4834.png', 'project_image64103ea1d4834.png', 89306),
(187, '16:30:38 14/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image64103ebe01624.png', 'project_image64103ebe01624.png', 89306),
(188, '16:30:40 14/03/2023', NULL, NULL, 'http://localhost/projects/organic_food/upload/images/project_image64103ec037d3f.jpg', 'project_image64103ec037d3f.jpg', 218814);

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
  `unit` varchar(255) NOT NULL,
  `shortDescription` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `isSpecial` tinyint(1) DEFAULT 0,
  `isNew` tinyint(1) DEFAULT 0,
  `isBestOffer` tinyint(1) DEFAULT 0,
  `productCategoryId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `createdAt`, `updatedAt`, `deletedAt`, `featureImageId`, `name`, `originPrice`, `promotionPrice`, `unit`, `shortDescription`, `description`, `isSpecial`, `isNew`, `isBestOffer`, `productCategoryId`) VALUES
(16, '16:04:36 14/03/2023', '16:05:58 14/03/2023', NULL, 144, 'Ớt cay hủy diệt', 150000, 120000, 'kg', 'Ớt này ăn cay lắm nha :))', '<p>Organic food is usually good for the environment. However, it is also relatively more expensive: the USDA (US Department of Agriculture) reports that the cost of organic fruits and vegetables is often 20% more than conventional products. Sometimes the difference can be much higher, especially for certain items like organic milk and eggs.</p><p><br></p><p>You know how to read labels on organic products to help us make better food choices. There are three common types of organic labels:</p><p><br></p><ul><li>“100% organic”: ie all ingredients in the food are certified organic.</li><li>“Organic”: at least 95% of ingredients are certified organic.</li><li>“Made with organic products”: at least 70% of ingredients are certified organic.</li></ul>', 0, 0, 0, 4),
(17, '16:05:46 14/03/2023', NULL, NULL, 148, 'Dền tươi', 99000, 99000, 'kg', 'Organic food is usually good for the environment.', '<p>Organic food is usually good for the environment. However, it is also relatively more expensive: the USDA (US Department of Agriculture) reports that the cost of organic fruits and vegetables is often 20% more than conventional products. Sometimes the difference can be much higher, especially for certain items like organic milk and eggs.</p><p><br></p><p>You know how to read labels on organic products to help us make better food choices. There are three common types of organic labels:</p><p><br></p><ul><li>“100% organic”: ie all ingredients in the food are certified organic.</li><li>“Organic”: at least 95% of ingredients are certified organic.</li><li>“Made with organic products”: at least 70% of ingredients are certified organic.</li></ul>', 0, 0, 0, 4),
(18, '16:19:34 14/03/2023', '16:20:00 14/03/2023', NULL, 157, 'Dưa không biết tên', 250000, 120000, 'kg', 'Dưa này tên gì chính nó cũng không biết nữa', '<p>Organic food is usually good for the environment. However, it is also relatively more expensive: the USDA (US Department of Agriculture) reports that the cost of organic fruits and vegetables is often 20% more than conventional products. Sometimes the difference can be much higher, especially for certain items like organic milk and eggs.</p><p><br></p><p>You know how to read labels on organic products to help us make better food choices. There are three common types of organic labels:</p><p><br></p><ul><li>“100% organic”: ie all ingredients in the food are certified organic.</li><li>“Organic”: at least 95% of ingredients are certified organic.</li><li>“Made with organic products”: at least 70% of ingredients are certified organic.</li></ul>', 1, 0, 1, 2),
(19, '16:22:49 14/03/2023', NULL, NULL, 165, 'Bắp cãi lại vợ', 80000, 80000, 'kg', 'Bắp cãi này dám cãi lại nóc nhà lun. Thật là đáng bị bỏ vào nồi mà...', '<p>Organic food is usually good for the environment. However, it is also relatively more expensive: the USDA (US Department of Agriculture) reports that the cost of organic fruits and vegetables is often 20% more than conventional products. Sometimes the difference can be much higher, especially for certain items like organic milk and eggs.</p><p><br></p><p>You know how to read labels on organic products to help us make better food choices. There are three common types of organic labels:</p><p><br></p><ul><li>“100% organic”: ie all ingredients in the food are certified organic.</li><li>“Organic”: at least 95% of ingredients are certified organic.</li><li>“Made with organic products”: at least 70% of ingredients are certified organic.</li></ul>', 1, 0, 0, 1),
(20, '16:23:40 14/03/2023', '16:29:03 14/03/2023', NULL, 168, 'Bắp cải loại 1', 65000, 65000, 'kg', 'Organic food is usually good for the environment', '<p>Organic food is usually good for the environment. However, it is also relatively more expensive: the USDA (US Department of Agriculture) reports that the cost of organic fruits and vegetables is often 20% more than conventional products. Sometimes the difference can be much higher, especially for certain items like organic milk and eggs.</p><p><br></p><p>You know how to read labels on organic products to help us make better food choices. There are three common types of organic labels:</p><p><br></p><ul><li>“100% organic”: ie all ingredients in the food are certified organic.</li><li>“Organic”: at least 95% of ingredients are certified organic.</li><li>“Made with organic products”: at least 70% of ingredients are certified organic.</li></ul>', 0, 0, 0, 1),
(21, '16:24:31 14/03/2023', NULL, NULL, 171, 'Súp lơ', 100000, 100000, 'kg', 'Organic food is usually good for the environment', '<p>Organic food is usually good for the environment. However, it is also relatively more expensive: the USDA (US Department of Agriculture) reports that the cost of organic fruits and vegetables is often 20% more than conventional products. Sometimes the difference can be much higher, especially for certain items like organic milk and eggs.</p><p><br></p><p>You know how to read labels on organic products to help us make better food choices. There are three common types of organic labels:</p><p><br></p><ul><li>“100% organic”: ie all ingredients in the food are certified organic.</li><li>“Organic”: at least 95% of ingredients are certified organic.</li><li>“Made with organic products”: at least 70% of ingredients are certified organic.</li></ul>', 0, 1, 0, 1),
(22, '16:25:58 14/03/2023', NULL, NULL, 174, 'Mứt dâu', 230000, 210000, 'hũ', 'Organic food is usually good for the environment', '<p>Organic food is usually good for the environment. However, it is also relatively more expensive: the USDA (US Department of Agriculture) reports that the cost of organic fruits and vegetables is often 20% more than conventional products. Sometimes the difference can be much higher, especially for certain items like organic milk and eggs.</p><p><br></p><p>You know how to read labels on organic products to help us make better food choices. There are three common types of organic labels:</p><p><br></p><ul><li>“100% organic”: ie all ingredients in the food are certified organic.</li><li>“Organic”: at least 95% of ingredients are certified organic.</li><li>“Made with organic products”: at least 70% of ingredients are certified organic.</li></ul>', 0, 1, 0, 3),
(23, '16:27:14 14/03/2023', NULL, NULL, 177, 'Củ hành tươi', 72000, 72000, 'kg', 'Organic food is usually good for the environment', '<p>Organic food is usually good for the environment. However, it is also relatively more expensive: the USDA (US Department of Agriculture) reports that the cost of organic fruits and vegetables is often 20% more than conventional products. Sometimes the difference can be much higher, especially for certain items like organic milk and eggs.</p><p><br></p><p>You know how to read labels on organic products to help us make better food choices. There are three common types of organic labels:</p><p><br></p><ul><li>“100% organic”: ie all ingredients in the food are certified organic.</li><li>“Organic”: at least 95% of ingredients are certified organic.</li><li>“Made with organic products”: at least 70% of ingredients are certified organic.</li></ul>', 0, 0, 0, 4),
(24, '16:28:50 14/03/2023', NULL, NULL, 180, 'Cà chua alpha', 65000, 55000, 'kg', 'Cà chua như cuộc đời của bạn vậy', '<p>Organic food is usually good for the environment. However, it is also relatively more expensive: the USDA (US Department of Agriculture) reports that the cost of organic fruits and vegetables is often 20% more than conventional products. Sometimes the difference can be much higher, especially for certain items like organic milk and eggs.</p><p><br></p><p>You know how to read labels on organic products to help us make better food choices. There are three common types of organic labels:</p><p><br></p><ul><li>“100% organic”: ie all ingredients in the food are certified organic.</li><li>“Organic”: at least 95% of ingredients are certified organic.</li><li>“Made with organic products”: at least 70% of ingredients are certified organic.</li></ul>', 0, 0, 1, 4),
(25, '16:30:01 14/03/2023', NULL, NULL, 183, 'Táo thần', 320000, 300000, 'kg', 'Táo này ăn ngon lắm nha', '<p>Organic food is usually good for the environment. However, it is also relatively more expensive: the USDA (US Department of Agriculture) reports that the cost of organic fruits and vegetables is often 20% more than conventional products. Sometimes the difference can be much higher, especially for certain items like organic milk and eggs.</p><p><br></p><p>You know how to read labels on organic products to help us make better food choices. There are three common types of organic labels:</p><p><br></p><ul><li>“100% organic”: ie all ingredients in the food are certified organic.</li><li>“Organic”: at least 95% of ingredients are certified organic.</li><li>“Made with organic products”: at least 70% of ingredients are certified organic.</li></ul>', 1, 0, 1, 2),
(26, '16:31:21 14/03/2023', NULL, NULL, 186, 'Chuối rừng Amazon', 400000, 300000, 'kg', 'Chuối này hái ở tận rừng Amazon, nơi có những con khỉ vô cùng hung hãn', '<p>Organic food is usually good for the environment. However, it is also relatively more expensive: the USDA (US Department of Agriculture) reports that the cost of organic fruits and vegetables is often 20% more than conventional products. Sometimes the difference can be much higher, especially for certain items like organic milk and eggs.</p><p><br></p><p>You know how to read labels on organic products to help us make better food choices. There are three common types of organic labels:</p><p><br></p><ul><li>“100% organic”: ie all ingredients in the food are certified organic.</li><li>“Organic”: at least 95% of ingredients are certified organic.</li><li>“Made with organic products”: at least 70% of ingredients are certified organic.</li></ul>', 1, 1, 1, 2);

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

--
-- Dumping data for table `productcategory`
--

INSERT INTO `productcategory` (`id`, `createdAt`, `updatedAt`, `deletedAt`, `name`, `featureImageId`) VALUES
(1, '15:32:45 12/03/2023', '14:43:58 14/03/2023', NULL, 'Rau xanh', 129),
(2, '15:57:54 12/03/2023', '14:49:36 14/03/2023', NULL, 'Trái cây', 132),
(3, '16:53:17 12/03/2023', '14:51:49 14/03/2023', NULL, 'Mứt & Thức uống', 128),
(4, '18:23:24 12/03/2023', '15:32:03 14/03/2023', NULL, 'Củ & Quả', 131),
(12, '13:41:29 14/03/2023', '15:03:22 14/03/2023', NULL, 'Thịt & Hải sản', 133),
(13, '13:43:28 14/03/2023', '14:45:36 14/03/2023', NULL, 'Quả mọng & Hạt', 130),
(14, '13:43:44 14/03/2023', '14:36:40 14/03/2023', NULL, 'Nấm', 126),
(15, '14:25:59 14/03/2023', '14:56:20 14/03/2023', NULL, 'Gia vị', 134),
(16, '14:27:36 14/03/2023', '14:36:59 14/03/2023', NULL, 'Trứng', 127);

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

--
-- Dumping data for table `product_image`
--

INSERT INTO `product_image` (`productId`, `imageId`) VALUES
(16, 145),
(16, 146),
(16, 147),
(17, 149),
(17, 150),
(18, 158),
(18, 159),
(18, 160),
(19, 166),
(19, 167),
(20, 170),
(20, 169),
(21, 172),
(21, 173),
(22, 175),
(22, 176),
(23, 178),
(23, 179),
(24, 181),
(24, 182),
(25, 184),
(25, 185),
(26, 187),
(26, 188);

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
(5, '18:46:33 04/03/2023', '10:35:10 11/03/2023', NULL, 'client', '1f9dba959b73019bcd2688ae7b70db1f', 'Client', 'dragondevshop@gmail.com', '0353292241', 26, 2),
(16, '14:26:09 07/03/2023', '10:47:42 11/03/2023', NULL, 'websitemanager1', '6c6f8143b6241ee993cedd1ad5f402cc', 'Quản lý website 1', '2014468@dlu.edu.vn', '0000001234', NULL, 3),
(17, '11:36:09 11/03/2023', '15:01:59 12/03/2023', NULL, 'admin123', '72bfb23a06b036130967f222965b1c3d', 'Admin 123', '2014468@dlu.edu.vn', '1234567891', 28, 3);

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
  `method` varchar(255) DEFAULT NULL,
  `isBase` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `systemfunction`
--

INSERT INTO `systemfunction` (`id`, `createdAt`, `updatedAt`, `deletedAt`, `apiPath`, `name`, `description`, `method`, `isBase`) VALUES
(2, '22:14:51 07/03/2023', NULL, NULL, 'system_menu/add.php', 'AddSystemMenu', 'Add system menu', 'POST', 0),
(3, '22:15:19 07/03/2023', NULL, NULL, 'system_menu/delete.php', 'DeleteSystemMenu', 'Delete system menu by id', 'DELETE', 0),
(4, '22:15:43 07/03/2023', NULL, NULL, 'system_menu/get_item.php', 'GetSystemMenuItem', 'Get system menu item by id', 'GET', 0),
(5, '22:18:16 07/03/2023', NULL, NULL, 'system_menu/get_list_by_system_role_id.php', 'GetSystemMenuListBySystemRoleId', 'Get system menu list by system role id ', 'GET', 0),
(6, '22:25:58 07/03/2023', NULL, NULL, 'system_menu/get_list.php', 'GetSystemMenuList', 'Get system menu list', 'GET', 0),
(7, '22:26:26 07/03/2023', NULL, NULL, 'system_menu/trash.php', 'TrashSystemMenu', 'Trash system menu by id', 'PUT', 0),
(8, '22:26:48 07/03/2023', NULL, NULL, 'system_menu/update.php', 'UpdateSystemMenu', 'Update system menu', 'PUT', 0),
(9, '22:36:47 07/03/2023', NULL, NULL, 'system_role/add.php', 'AddSystemRole', 'Add system role', 'POST', 0),
(10, '22:37:58 07/03/2023', NULL, NULL, 'system_role/delete.php', 'DeleteSystemRole', 'Delete system role by id', 'DELETE', 0),
(11, '22:38:31 07/03/2023', '11:18:53 09/03/2023', NULL, 'system_role/get_item.php', 'GetSystemRoleItem', 'Get system role item by id', 'GET', 0),
(12, '22:38:48 07/03/2023', NULL, NULL, 'system_role/get_list.php', 'GetSystemRoleList', 'Get system role list', 'GET', 0),
(13, '22:39:13 07/03/2023', NULL, NULL, 'system_role/trash.php', 'TrashSystemRole', 'Trash system role by id', 'PUT', 0),
(14, '22:39:38 07/03/2023', NULL, NULL, 'system_role/update.php', 'UpdateSystemRole', 'Update system role', 'PUT', 0),
(15, '14:57:26 08/03/2023', NULL, NULL, 'system_function/add.php', 'AddSystemFunction', 'Add system function', 'POST', 0),
(16, '14:59:45 08/03/2023', NULL, NULL, 'system_function/delete.php', 'DeleteSystemFunction', 'Delete system function by id', 'DELETE', 0),
(17, '15:00:08 08/03/2023', NULL, NULL, 'system_function/get_item.php', 'GetSystemFunctionItem', 'Get system function item by id', 'GET', 0),
(18, '15:00:30 08/03/2023', NULL, NULL, 'system_function/get_list_by_system_role_id.php', 'GetSystemFunctionListBySystemRoleId', 'Get system function list by system role id', 'GET', 0),
(19, '15:00:45 08/03/2023', NULL, NULL, 'system_function/get_list.php', 'GetSystemFunctionList', 'Get system function list', 'GET', 0),
(20, '15:01:06 08/03/2023', NULL, NULL, 'system_function/trash.php', 'TrashSystemFunction', 'Trash system function', 'PUT', 0),
(21, '15:01:20 08/03/2023', NULL, NULL, 'system_function/update.php', 'UpdateSystemFunction', 'Update system function', 'PUT', 0),
(22, '15:02:27 08/03/2023', NULL, NULL, 'system_role_menu/add.php', 'AddSystemRoleMenu', 'Add system role menu', 'POST', 0),
(23, '15:02:56 08/03/2023', NULL, NULL, 'system_role_menu/delete.php', 'DeleteSystemRoleMenu', 'Delete system role menu', 'POST, DELETE', 0),
(24, '15:03:24 08/03/2023', NULL, NULL, 'system_role_function/add.php', 'AddSystemRoleFunction', 'Add system role function', 'POST', 0),
(25, '15:03:44 08/03/2023', NULL, NULL, 'system_role_function/delete.php', 'DeleteSystemRoleFunction', 'Delete system role function', 'POST, DELETE', 0),
(26, '15:04:17 08/03/2023', NULL, NULL, 'system_admin/login.php', 'LoginSystemAdmin', 'Login system admin', 'POST', 1),
(27, '15:04:58 08/03/2023', NULL, NULL, 'system_admin/register.php', 'RegisterSystemAdmin', 'Register system admin', 'POST', 0),
(28, '15:05:33 08/03/2023', NULL, NULL, 'system_admin/delete.php', 'DeleteSystemAdmin', 'Delete system admin by id', 'DELETE', 0),
(29, '15:05:58 08/03/2023', NULL, NULL, 'system_admin/get_item.php', 'GetSystemAdminItem', 'Get system admin item by id', 'GET', 0),
(30, '15:06:19 08/03/2023', NULL, NULL, 'system_admin/get_list.php', 'GetSystemAdminList', 'Get system admin list', 'GET', 0),
(31, '15:06:56 08/03/2023', NULL, NULL, 'system_admin/reset_password.php', 'ResetPasswordSystemAdmin', 'Reset password system admin, send new password in email', 'PUT', 0),
(32, '15:07:16 08/03/2023', NULL, NULL, 'system_admin/trash.php', 'TrashSystemAdmin', 'Trash system admin', 'PUT', 0),
(33, '15:08:08 08/03/2023', NULL, NULL, 'system_admin/update_avatar.php', 'UpdateAvatarSystemAdmin', 'Update avatar system admin', 'PUT', 0),
(34, '15:08:29 08/03/2023', NULL, NULL, 'system_admin/update_email.php', 'UpdateEmailSystemAdmin', 'Update email system admin', 'PUT', 0),
(35, '15:08:43 08/03/2023', NULL, NULL, 'system_admin/update_nickname.php', 'UpdateNicknameSystemAdmin', 'Update nickname system admin', 'PUT', 0),
(36, '15:09:06 08/03/2023', NULL, NULL, 'system_admin/update_password.php', 'UpdatePasswordSystemAdmin', 'Update password system admin', 'PUT', 0),
(37, '15:09:15 08/03/2023', NULL, NULL, 'system_admin/update_phone.php', 'UpdatePhoneSystemAdmin', 'Update phone system admin', 'PUT', 0),
(44, '11:52:12 11/03/2023', NULL, NULL, 'system_admin/update_system_role.php', 'UpdateSystemRoleForSystemAdmin', 'Update system role for system admin', 'PUT', 0),
(45, '18:10:15 11/03/2023', '14:35:30 12/03/2023', NULL, 'image/delete.php', 'DeleteImage', 'Delete image', 'POST, PUT, DELETE', 0),
(46, '18:10:44 11/03/2023', NULL, NULL, 'image/get_item.php', 'GetImageItem', 'Get image item', 'GET', 0),
(47, '18:11:21 11/03/2023', NULL, NULL, 'image/get_list.php', 'GetImageList', 'Get image list', 'GET', 0),
(48, '18:11:54 11/03/2023', NULL, NULL, 'image/upload.php', 'UploadImage', 'Upload image', 'POST', 0),
(49, '18:15:08 11/03/2023', NULL, NULL, '', 'RemoveImageDontUse', 'Remove image dont use', '', 0),
(50, '18:15:46 11/03/2023', NULL, NULL, '', 'ViewImage', 'View image', '', 0),
(51, '15:41:03 12/03/2023', NULL, NULL, 'product_category/add.php', 'AddProductCategory', 'Add product category', 'POST', 0),
(52, '15:41:27 12/03/2023', NULL, NULL, 'product_category/delete.php', 'DeleteProductCategory', 'Delete product category', 'DELETE', 0),
(53, '15:41:48 12/03/2023', NULL, NULL, 'product_category/delete.php', 'GetProductCategoryItem', 'Get product category item', 'GET', 0),
(54, '15:42:20 12/03/2023', NULL, NULL, 'product_category/get_list.php', 'GetProductCategoryList', 'Get product category list', 'GET', 0),
(55, '15:42:49 12/03/2023', NULL, NULL, 'product_category/trash.php', 'TrashProductCategory', 'Trash product category', 'PUT', 0),
(56, '15:43:30 12/03/2023', NULL, NULL, 'product_category/update.php', 'UpdateProductCategory', 'Update product category', 'PUT', 0),
(57, '08:58:15 13/03/2023', NULL, NULL, 'product/add.php', 'AddProduct', 'Add product', 'POST', 0),
(58, '08:58:39 13/03/2023', NULL, NULL, 'product/delete.php', 'DeleteProduct', 'Delete product', 'DELETE', 0),
(59, '08:58:58 13/03/2023', NULL, NULL, 'product/get_item.php', 'GetProductItem', 'Get product item', 'GET', 0),
(60, '08:59:18 13/03/2023', NULL, NULL, 'product/get_list.php', 'GetProductList', 'Get product list', 'GET', 0),
(61, '08:59:43 13/03/2023', NULL, NULL, 'product/trash.php', 'TrashProduct', 'Trash product', 'PUT', 0),
(62, '09:00:05 13/03/2023', NULL, NULL, 'product/update.php', 'UpdateProduct', 'Update product', 'PUT', 0),
(63, '09:49:20 14/03/2023', NULL, NULL, 'product_image/add_list.php', 'AddProductImageList', 'Add product image list', 'POST', 0),
(64, '10:05:12 14/03/2023', NULL, NULL, 'product_image/delete_list.php', 'DeleteProductImageList', 'Delete product image list', 'DELETE', 0),
(65, '12:09:36 14/03/2023', NULL, NULL, 'product_image/get_list_by_product_id.php', 'GetProductImageListByProductId', 'Get product image list by product id', 'GET', 0),
(66, '16:35:46 14/03/2023', NULL, NULL, '', 'ViewProductDetails', 'View product details', '', 0);

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
(1, 3),
(1, 26),
(1, 16),
(1, 17),
(1, 18),
(1, 19),
(1, 4),
(1, 5),
(1, 6),
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
(1, 37),
(1, 2),
(1, 8),
(1, 7),
(1, 20),
(1, 21),
(3, 33),
(3, 34),
(3, 35),
(3, 36),
(3, 37),
(3, 26),
(2, 33),
(2, 34),
(2, 35),
(2, 36),
(2, 37),
(1, 44),
(1, 45),
(1, 46),
(1, 47),
(1, 48),
(1, 49),
(1, 50),
(3, 46),
(3, 47),
(3, 48),
(3, 50),
(3, 51),
(3, 53),
(3, 54),
(3, 55),
(3, 56),
(3, 57),
(3, 59),
(3, 60),
(3, 61),
(3, 62),
(3, 63),
(3, 64),
(3, 65),
(3, 66);

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
(3, 18),
(1, 6);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=189;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `productcategory`
--
ALTER TABLE `productcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `systemfunction`
--
ALTER TABLE `systemfunction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `systemmenu`
--
ALTER TABLE `systemmenu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `systemrole`
--
ALTER TABLE `systemrole`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

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
