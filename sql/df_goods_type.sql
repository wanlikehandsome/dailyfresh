/*
Navicat MySQL Data Transfer

Source Server         : web
Source Server Version : 80011
Source Host           : localhost:3306
Source Database       : dailyfresh

Target Server Type    : MYSQL
Target Server Version : 80011
File Encoding         : 65001

Date: 2020-04-03 21:43:35
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for df_goods_type
-- ----------------------------
DROP TABLE IF EXISTS `df_goods_type`;
CREATE TABLE `df_goods_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` date NOT NULL,
  `update_time` date NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `name` varchar(20) NOT NULL,
  `logo` varchar(20) NOT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of df_goods_type
-- ----------------------------
INSERT INTO `df_goods_type` VALUES ('4', '2020-03-26', '2020-03-26', '0', '新鲜水果', 'fruit', 'type/banner01.jpg');
INSERT INTO `df_goods_type` VALUES ('5', '2020-03-26', '2020-03-26', '0', '海鲜水产', 'seafood', 'type/banner02.jpg');
INSERT INTO `df_goods_type` VALUES ('6', '2020-03-31', '2020-03-31', '0', '猪牛羊肉', 'meet', 'type/banner03.jpg');
INSERT INTO `df_goods_type` VALUES ('7', '2020-03-31', '2020-03-31', '0', '禽类蛋品', 'egg', 'type/banner04.jpg');
INSERT INTO `df_goods_type` VALUES ('8', '2020-03-31', '2020-03-31', '0', '新鲜蔬菜', 'vegetables', 'type/banner05.jpg');
INSERT INTO `df_goods_type` VALUES ('9', '2020-03-31', '2020-03-31', '0', '速冻食品', 'ice', 'type/banner06.jpg');
