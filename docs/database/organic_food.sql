CREATE TABLE `SystemMenu` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `createdAt` varchar(255),
  `updatedAt` varchar(255),
  `deletedAt` varchar(255),
  `routeName` varchar(255) UNIQUE NOT NULL,
  `isBase` boolean DEFAULT 0
);

CREATE TABLE `SystemFunction` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `createdAt` varchar(255),
  `updatedAt` varchar(255),
  `deletedAt` varchar(255),
  `api` varchar(255),
  `description` varchar(1000),
  `method` varchar(255)
);

CREATE TABLE `SystemRole` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `createdAt` varchar(255),
  `updatedAt` varchar(255),
  `deletedAt` varchar(255),
  `name` varchar(255) UNIQUE NOT NULL
);

CREATE TABLE `SystemRoleMenu` (
  `systemRoleId` int NOT NULL,
  `systemMenuId` int NOT NULL
);

CREATE TABLE `SystemRoleFunction` (
  `systemRoleId` int NOT NULL,
  `systemFunctionId` int NOT NULL
);

CREATE TABLE `SystemAdmin` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `createdAt` varchar(255),
  `updatedAt` varchar(255),
  `deletedAt` varchar(255),
  `username` varchar(255) UNIQUE NOT NULL,
  `password` varchar(255) NOT NULL,
  `nickname` varchar(255) NOT NULL,
  `avatar` varchar(255),
  `systemRoleId` int NOT NULL
);

CREATE TABLE `ProductCategory` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `createdAt` varchar(255),
  `updatedAt` varchar(255),
  `deletedAt` varchar(255),
  `name` varchar(255) UNIQUE NOT NULL,
  `featureImage` varchar(255)
);

CREATE TABLE `Image` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `createdAt` varchar(255),
  `updatedAt` varchar(255),
  `deletedAt` varchar(255),
  `link` varchar(255) UNIQUE NOT NULL,
  `filename` varchar(255) UNIQUE NOT NULL,
  `size` int DEFAULT 0
);

CREATE TABLE `Product` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `createdAt` varchar(255),
  `updatedAt` varchar(255),
  `deletedAt` varchar(255),
  `featureImage` varchar(255),
  `name` varchar(255) UNIQUE NOT NULL,
  `originPrice` int DEFAULT 0,
  `promotionPrice` int DEFAULT 0,
  `shortDescription` varchar(1000),
  `description` text,
  `isSpecial` boolean DEFAULT 0,
  `isNew` boolean DEFAULT 0,
  `isBestOffer` boolean DEFAULT 0,
  `productCategoryId` int NOT NULL
);

CREATE TABLE `ProductImage` (
  `productId` int NOT NULL,
  `imageId` int NOT NULL
);

CREATE TABLE `ProductReview` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `createdAt` varchar(255),
  `updatedAt` varchar(255),
  `deletedAt` varchar(255),
  `fullname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `comment` varchar(1000) NOT NULL,
  `rating` tinyint NOT NULL,
  `productId` int NOT NULL
);

CREATE TABLE `Blog` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `createdAt` varchar(255),
  `updatedAt` varchar(255),
  `deletedAt` varchar(255),
  `featureImage` varchar(255),
  `title` varchar(255) UNIQUE NOT NULL,
  `description` varchar(1000),
  `content` text,
  `adminId` int NOT NULL
);

CREATE TABLE `Subscribe` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `createdAt` varchar(255),
  `updatedAt` varchar(255),
  `deletedAt` varchar(255),
  `email` varchar(255) UNIQUE NOT NULL
);

CREATE TABLE `Contact` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `createdAt` varchar(255),
  `updatedAt` varchar(255),
  `deletedAt` varchar(255),
  `fullname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` varchar(1000) NOT NULL
);

CREATE TABLE `CouponCode` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `createdAt` varchar(255),
  `updatedAt` varchar(255),
  `deletedAt` varchar(255),
  `code` varchar(255) UNIQUE NOT NULL,
  `applyToEmail` varchar(255) NOT NULL,
  `percentValue` int DEFAULT 0,
  `isUsed` boolean DEFAULT 0
);

CREATE TABLE `Order` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `createdAt` varchar(255),
  `updatedAt` varchar(255),
  `deletedAt` varchar(255),
  `fullname` varchar(255) NOT NULL,
  `streetAddress` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `notes` varchar(255),
  `couponCodeId` int,
  `deliveryCost` int DEFAULT 0,
  `totalCost` int DEFAULT 0,
  `paymentCost` int DEFAULT 0
);

CREATE TABLE `ProductOrder` (
  `productId` int NOT NULL,
  `orderId` int NOT NULL
);

ALTER TABLE `SystemRoleMenu` ADD FOREIGN KEY (`systemRoleId`) REFERENCES `SystemRole` (`id`);

ALTER TABLE `SystemRoleMenu` ADD FOREIGN KEY (`systemMenuId`) REFERENCES `SystemMenu` (`id`);

ALTER TABLE `SystemRoleFunction` ADD FOREIGN KEY (`systemRoleId`) REFERENCES `SystemRole` (`id`);

ALTER TABLE `SystemRoleFunction` ADD FOREIGN KEY (`systemFunctionId`) REFERENCES `SystemFunction` (`id`);

ALTER TABLE `SystemAdmin` ADD FOREIGN KEY (`systemRoleId`) REFERENCES `SystemRole` (`id`);

ALTER TABLE `Product` ADD FOREIGN KEY (`productCategoryId`) REFERENCES `ProductCategory` (`id`);

ALTER TABLE `ProductImage` ADD FOREIGN KEY (`productId`) REFERENCES `Product` (`id`);

ALTER TABLE `ProductImage` ADD FOREIGN KEY (`imageId`) REFERENCES `Image` (`id`);

ALTER TABLE `ProductReview` ADD FOREIGN KEY (`productId`) REFERENCES `Product` (`id`);

ALTER TABLE `Blog` ADD FOREIGN KEY (`adminId`) REFERENCES `SystemAdmin` (`id`);

ALTER TABLE `Order` ADD FOREIGN KEY (`couponCodeId`) REFERENCES `CouponCode` (`id`);

ALTER TABLE `ProductOrder` ADD FOREIGN KEY (`productId`) REFERENCES `Product` (`id`);

ALTER TABLE `ProductOrder` ADD FOREIGN KEY (`orderId`) REFERENCES `Order` (`id`);
