/*
Navicat MySQL Data Transfer

Source Server         : web
Source Server Version : 80011
Source Host           : localhost:3306
Source Database       : dailyfresh

Target Server Type    : MYSQL
Target Server Version : 80011
File Encoding         : 65001

Date: 2020-04-03 21:43:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for df_goods_image
-- ----------------------------
DROP TABLE IF EXISTS `df_goods_image`;
CREATE TABLE `df_goods_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` date NOT NULL,
  `update_time` date NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `image` varchar(100) NOT NULL,
  `sku_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `df_goods_image_22ad5bca` (`sku_id`),
  CONSTRAINT `df_goods_image_sku_id_33dd2517b1409bbf_fk_df_goods_sku_id` FOREIGN KEY (`sku_id`) REFERENCES `df_goods_sku` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of df_goods_image
-- ----------------------------
