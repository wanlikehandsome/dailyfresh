/*
Navicat MySQL Data Transfer

Source Server         : web
Source Server Version : 80011
Source Host           : localhost:3306
Source Database       : dailyfresh

Target Server Type    : MYSQL
Target Server Version : 80011
File Encoding         : 65001

Date: 2020-04-03 21:43:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for df_goods_sku
-- ----------------------------
DROP TABLE IF EXISTS `df_goods_sku`;
CREATE TABLE `df_goods_sku` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` date NOT NULL,
  `update_time` date NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `name` varchar(20) NOT NULL,
  `desc` varchar(256) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `unite` varchar(20) NOT NULL,
  `image` varchar(100) NOT NULL,
  `stock` int(11) NOT NULL,
  `sales` int(11) NOT NULL,
  `status` smallint(6) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `df_goods_sku_goods_id_2550804d25cb3dc0_fk_df_goods_id` (`goods_id`),
  KEY `df_goods_sku_94757cae` (`type_id`),
  CONSTRAINT `df_goods_sku_goods_id_2550804d25cb3dc0_fk_df_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `df_goods` (`id`),
  CONSTRAINT `df_goods_sku_type_id_2f50ca0493ed8eb4_fk_df_goods_type_id` FOREIGN KEY (`type_id`) REFERENCES `df_goods_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of df_goods_sku
-- ----------------------------
INSERT INTO `df_goods_sku` VALUES ('3', '2020-03-31', '2020-03-31', '0', '葡萄', '酸甜', '5.00', '500', 'goods/goods.jpg', '94', '6', '1', '7', '4');
INSERT INTO `df_goods_sku` VALUES ('4', '2020-03-31', '2020-03-31', '0', '草莓', '个大红润, 盘它', '5.00', '500', 'goods/goods_detail.jpg', '97', '3', '1', '8', '4');
INSERT INTO `df_goods_sku` VALUES ('5', '2020-03-31', '2020-03-31', '0', '秋刀鱼', '海鲜', '20.00', '500', 'goods/goods020.jpg', '100', '0', '1', '12', '5');
INSERT INTO `df_goods_sku` VALUES ('6', '2020-03-31', '2020-03-31', '0', '猪肉', '贵', '30.00', '500', 'goods/goods021.jpg', '100', '0', '1', '13', '6');
INSERT INTO `df_goods_sku` VALUES ('7', '2020-03-31', '2020-03-31', '0', '鸡蛋', '香', '15.00', '500', 'goods/goods015.jpg', '100', '0', '1', '15', '7');
INSERT INTO `df_goods_sku` VALUES ('8', '2020-03-31', '2020-03-31', '0', '白菜', '白菜', '3.00', '500', 'goods/banner05.jpg', '1', '0', '1', '16', '8');
INSERT INTO `df_goods_sku` VALUES ('9', '2020-03-31', '2020-03-31', '0', '冰激凌', '冰激凌', '5.00', '500', 'goods/banner06.jpg', '100', '0', '1', '17', '9');
INSERT INTO `df_goods_sku` VALUES ('10', '2020-03-31', '2020-03-31', '0', '柠檬', '酸', '10.00', '500', 'goods/goods001_1dFUONz.jpg', '94', '6', '1', '9', '4');
INSERT INTO `df_goods_sku` VALUES ('11', '2020-03-31', '2020-03-31', '0', '奇异果', '没吃过', '100.00', '500', 'goods/goods012.jpg', '91', '9', '1', '10', '4');
