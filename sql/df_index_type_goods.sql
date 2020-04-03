/*
Navicat MySQL Data Transfer

Source Server         : web
Source Server Version : 80011
Source Host           : localhost:3306
Source Database       : dailyfresh

Target Server Type    : MYSQL
Target Server Version : 80011
File Encoding         : 65001

Date: 2020-04-03 21:44:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for df_index_type_goods
-- ----------------------------
DROP TABLE IF EXISTS `df_index_type_goods`;
CREATE TABLE `df_index_type_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` date NOT NULL,
  `update_time` date NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `display_type` smallint(6) NOT NULL,
  `index` smallint(6) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `df_index_type_goods_sku_id_6020dd2e4517ca1_fk_df_goods_sku_id` (`sku_id`),
  KEY `df_index_type_goods_type_id_4f35ae59bfc36c32_fk_df_goods_type_id` (`type_id`),
  CONSTRAINT `df_index_type_goods_sku_id_6020dd2e4517ca1_fk_df_goods_sku_id` FOREIGN KEY (`sku_id`) REFERENCES `df_goods_sku` (`id`),
  CONSTRAINT `df_index_type_goods_type_id_4f35ae59bfc36c32_fk_df_goods_type_id` FOREIGN KEY (`type_id`) REFERENCES `df_goods_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of df_index_type_goods
-- ----------------------------
INSERT INTO `df_index_type_goods` VALUES ('3', '2020-03-31', '2020-03-31', '0', '1', '0', '3', '4');
INSERT INTO `df_index_type_goods` VALUES ('4', '2020-03-31', '2020-03-31', '0', '1', '1', '4', '4');
INSERT INTO `df_index_type_goods` VALUES ('5', '2020-03-31', '2020-03-31', '0', '1', '2', '10', '4');
INSERT INTO `df_index_type_goods` VALUES ('6', '2020-03-31', '2020-03-31', '0', '1', '3', '11', '4');
