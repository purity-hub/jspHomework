/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80026
 Source Host           : localhost:3306
 Source Schema         : userdb

 Target Server Type    : MySQL
 Target Server Version : 80026
 File Encoding         : 65001

 Date: 26/04/2022 11:44:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `CategoryId` int NOT NULL,
  `CategoryName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Description` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Active` bit(1) NOT NULL,
  PRIMARY KEY (`CategoryId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, 'FASHION', NULL, b'1');
INSERT INTO `category` VALUES (2, 'HOUSEHOLD', NULL, b'1');
INSERT INTO `category` VALUES (3, 'INTERIORS', NULL, b'1');
INSERT INTO `category` VALUES (4, 'CLOTHING', NULL, b'1');
INSERT INTO `category` VALUES (5, 'BAGS', NULL, b'1');
INSERT INTO `category` VALUES (6, 'SHOES', NULL, b'1');
INSERT INTO `category` VALUES (7, 'BOOKS', NULL, b'1');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `OrderId` int NOT NULL,
  `CutomerId` int NULL DEFAULT NULL,
  `PaymentId` int NULL DEFAULT NULL,
  `OrderDate` datetime NULL DEFAULT NULL,
  `FirstName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LastName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Address1` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Address2` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `city` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `State` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PostalCode` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Country` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Notes` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `OrderTotal` decimal(18, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`OrderId`) USING BTREE,
  INDEX `order_usertable_id_fk`(`CutomerId`) USING BTREE,
  INDEX `order_payment_PaymentId_fk`(`PaymentId`) USING BTREE,
  CONSTRAINT `order_payment_PaymentId_fk` FOREIGN KEY (`PaymentId`) REFERENCES `payment` (`PaymentId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `order_usertable_id_fk` FOREIGN KEY (`CutomerId`) REFERENCES `usertable` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order
-- ----------------------------

-- ----------------------------
-- Table structure for orderdetail
-- ----------------------------
DROP TABLE IF EXISTS `orderdetail`;
CREATE TABLE `orderdetail`  (
  `OrderDetailId` int NOT NULL,
  `OrderId` int NULL DEFAULT NULL,
  `ProductId` int NULL DEFAULT NULL,
  `Price` decimal(18, 2) NULL DEFAULT NULL,
  `Quantity` int NULL DEFAULT NULL,
  `Total` decimal(18, 2) NULL DEFAULT NULL,
  `Fuifilled` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`OrderDetailId`) USING BTREE,
  INDEX `orderdetail_order_OrderId_fk`(`OrderId`) USING BTREE,
  CONSTRAINT `orderdetail_order_OrderId_fk` FOREIGN KEY (`OrderId`) REFERENCES `order` (`OrderId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orderdetail
-- ----------------------------

-- ----------------------------
-- Table structure for payment
-- ----------------------------
DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment`  (
  `PaymentId` int NOT NULL,
  `PaymentType` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Allowed` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`PaymentId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of payment
-- ----------------------------
INSERT INTO `payment` VALUES (1, 'Online Banking', b'1');
INSERT INTO `payment` VALUES (2, 'Wechat Pay', b'1');
INSERT INTO `payment` VALUES (3, 'Ali Pay', b'1');
INSERT INTO `payment` VALUES (4, 'Paypal', b'1');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `ProductId` int NOT NULL,
  `ProductName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ProductDescription` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `picture` blob NULL,
  `price` decimal(18, 2) NULL DEFAULT NULL,
  `CategoryId` int NULL DEFAULT NULL,
  PRIMARY KEY (`ProductId`) USING BTREE,
  INDEX `product_category_CategoryId_fk`(`CategoryId`) USING BTREE,
  CONSTRAINT `product_category_CategoryId_fk` FOREIGN KEY (`CategoryId`) REFERENCES `category` (`CategoryId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------

-- ----------------------------
-- Table structure for usertable
-- ----------------------------
DROP TABLE IF EXISTS `usertable`;
CREATE TABLE `usertable`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `password` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `gender` int NULL DEFAULT NULL,
  `birthday` date NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of usertable
-- ----------------------------
INSERT INTO `usertable` VALUES (4, 'purity', '11111111', '1580575248@qq.com', 1, '2022-02-28');
INSERT INTO `usertable` VALUES (5, 'purity-good', '1111111111', '1580575248@qq.com', 0, '2022-03-08');
INSERT INTO `usertable` VALUES (6, 'luohongyun', '22222222222222', '1580575248@qq.com', 1, '2022-03-07');
INSERT INTO `usertable` VALUES (7, 'luohongyun', '222222222222', '1580575248@qq.com', 1, '2022-02-28');
INSERT INTO `usertable` VALUES (8, '18870745179', '111111111111', '1580575248@qq.com', 0, '2022-02-27');
INSERT INTO `usertable` VALUES (9, '罗', '22222222222', '1580575248@qq.com', 1, '2022-03-15');

SET FOREIGN_KEY_CHECKS = 1;
