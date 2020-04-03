/*
Navicat MySQL Data Transfer

Source Server         : web
Source Server Version : 80011
Source Host           : localhost:3306
Source Database       : dailyfresh

Target Server Type    : MYSQL
Target Server Version : 80011
File Encoding         : 65001

Date: 2020-04-03 21:43:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for df_index_banner
-- ----------------------------
DROP TABLE IF EXISTS `df_index_banner`;
CREATE TABLE `df_index_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` date NOT NULL,
  `update_time` date NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `image` varchar(100) NOT NULL,
  `index` smallint(6) NOT NULL,
  `sku_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `df_index_banner_sku_id_10cbeeb148d737ee_fk_df_goods_sku_id` (`sku_id`),
  CONSTRAINT `df_index_banner_sku_id_10cbeeb148d737ee_fk_df_goods_sku_id` FOREIGN KEY (`sku_id`) REFERENCES `df_goods_sku` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of df_index_banner
-- ----------------------------
INSERT INTO `df_index_banner` VALUES ('6', '2020-03-31', '2020-03-31', '0', 'banner/slide03_ouHm8EK.jpg', '0', '6');
INSERT INTO `df_index_banner` VALUES ('7', '2020-03-31', '2020-03-31', '0', 'banner/slide.jpg', '1', '3');
INSERT INTO `df_index_banner` VALUES ('8', '2020-03-31', '2020-03-31', '0', 'banner/slide04.jpg', '2', '9');
