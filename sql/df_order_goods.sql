/*
Navicat MySQL Data Transfer

Source Server         : web
Source Server Version : 80011
Source Host           : localhost:3306
Source Database       : dailyfresh

Target Server Type    : MYSQL
Target Server Version : 80011
File Encoding         : 65001

Date: 2020-04-03 21:44:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for df_order_goods
-- ----------------------------
DROP TABLE IF EXISTS `df_order_goods`;
CREATE TABLE `df_order_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` date NOT NULL,
  `update_time` date NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `count` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `comment` varchar(256) NOT NULL,
  `order_id` varchar(128) NOT NULL,
  `sku_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `df_order_goods_69dfcb07` (`order_id`),
  KEY `df_order_goods_22ad5bca` (`sku_id`),
  CONSTRAINT `df_order_goo_order_id_4675dfeaaa3dcd11_fk_df_order_info_order_id` FOREIGN KEY (`order_id`) REFERENCES `df_order_info` (`order_id`),
  CONSTRAINT `df_order_goods_sku_id_ee466972370fd48_fk_df_goods_sku_id` FOREIGN KEY (`sku_id`) REFERENCES `df_goods_sku` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of df_order_goods
-- ----------------------------
INSERT INTO `df_order_goods` VALUES ('21', '2020-03-31', '2020-03-31', '0', '1', '5.00', '', '2020033120480136', '3');
INSERT INTO `df_order_goods` VALUES ('22', '2020-03-31', '2020-03-31', '0', '1', '5.00', '', '2020033120480136', '3');
INSERT INTO `df_order_goods` VALUES ('23', '2020-03-31', '2020-03-31', '0', '1', '5.00', '', '2020033120480136', '3');
INSERT INTO `df_order_goods` VALUES ('24', '2020-03-31', '2020-03-31', '0', '1', '100.00', '', '2020033120501236', '11');
INSERT INTO `df_order_goods` VALUES ('25', '2020-03-31', '2020-03-31', '0', '1', '100.00', '', '2020033120501236', '11');
INSERT INTO `df_order_goods` VALUES ('26', '2020-03-31', '2020-03-31', '0', '1', '100.00', '', '2020033120501236', '11');
INSERT INTO `df_order_goods` VALUES ('27', '2020-03-31', '2020-03-31', '0', '2', '10.00', '', '2020033121210636', '10');
INSERT INTO `df_order_goods` VALUES ('28', '2020-03-31', '2020-03-31', '0', '2', '10.00', '', '2020033121210636', '10');
INSERT INTO `df_order_goods` VALUES ('29', '2020-03-31', '2020-03-31', '0', '2', '10.00', '', '2020033121210636', '10');
INSERT INTO `df_order_goods` VALUES ('30', '2020-03-31', '2020-03-31', '0', '1', '5.00', '', '2020033122114436', '4');
INSERT INTO `df_order_goods` VALUES ('31', '2020-03-31', '2020-03-31', '0', '1', '5.00', '', '2020033122114436', '4');
INSERT INTO `df_order_goods` VALUES ('32', '2020-03-31', '2020-03-31', '0', '1', '5.00', '', '2020033122114436', '4');
INSERT INTO `df_order_goods` VALUES ('33', '2020-04-01', '2020-04-01', '0', '1', '100.00', '', '2020040108353936', '11');
INSERT INTO `df_order_goods` VALUES ('34', '2020-04-01', '2020-04-01', '0', '1', '100.00', '', '2020040108353936', '11');
INSERT INTO `df_order_goods` VALUES ('35', '2020-04-01', '2020-04-01', '0', '1', '100.00', '', '2020040108353936', '11');
INSERT INTO `df_order_goods` VALUES ('36', '2020-04-01', '2020-04-01', '0', '1', '5.00', '', '2020040108440736', '3');
INSERT INTO `df_order_goods` VALUES ('37', '2020-04-01', '2020-04-01', '0', '1', '5.00', '', '2020040108440736', '3');
INSERT INTO `df_order_goods` VALUES ('38', '2020-04-01', '2020-04-01', '0', '1', '5.00', '', '2020040108440736', '3');
INSERT INTO `df_order_goods` VALUES ('39', '2020-04-01', '2020-04-01', '0', '1', '100.00', '', '2020040114444836', '11');
INSERT INTO `df_order_goods` VALUES ('40', '2020-04-01', '2020-04-01', '0', '1', '100.00', '', '2020040114444836', '11');
INSERT INTO `df_order_goods` VALUES ('41', '2020-04-01', '2020-04-01', '0', '1', '100.00', '', '2020040114444836', '11');
