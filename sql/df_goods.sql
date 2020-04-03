/*
Navicat MySQL Data Transfer

Source Server         : web
Source Server Version : 80011
Source Host           : localhost:3306
Source Database       : dailyfresh

Target Server Type    : MYSQL
Target Server Version : 80011
File Encoding         : 65001

Date: 2020-04-03 21:42:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for df_goods
-- ----------------------------
DROP TABLE IF EXISTS `df_goods`;
CREATE TABLE `df_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` date NOT NULL,
  `update_time` date NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `name` varchar(20) NOT NULL,
  `detail` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of df_goods
-- ----------------------------
INSERT INTO `df_goods` VALUES ('7', '2020-03-31', '2020-03-31', '0', '葡萄', '<p style=\"text-align: center;\"><strong>新疆的葡萄很甜</strong></p>');
INSERT INTO `df_goods` VALUES ('8', '2020-03-31', '2020-03-31', '0', '草莓', '<p style=\"text-align: center;\"><strong>个大红润, 香甜可口</strong></p>');
INSERT INTO `df_goods` VALUES ('9', '2020-03-31', '2020-03-31', '0', '柠檬', '<p>酸</p>');
INSERT INTO `df_goods` VALUES ('10', '2020-03-31', '2020-03-31', '0', '奇异果', '<p>贵</p>');
INSERT INTO `df_goods` VALUES ('11', '2020-03-31', '2020-03-31', '0', '扇贝', '<p>便宜的海鲜</p>');
INSERT INTO `df_goods` VALUES ('12', '2020-03-31', '2020-03-31', '0', '秋刀鱼', '<p>没吃过的海鲜</p>');
INSERT INTO `df_goods` VALUES ('13', '2020-03-31', '2020-03-31', '0', '猪肉', '<p>猪肉好贵</p>');
INSERT INTO `df_goods` VALUES ('14', '2020-03-31', '2020-03-31', '0', '牛肉', '<p>牛肉少见有卖</p>');
INSERT INTO `df_goods` VALUES ('15', '2020-03-31', '2020-03-31', '0', '鸡蛋', '<p>穷乡僻壤老母鸡下的蛋</p>');
INSERT INTO `df_goods` VALUES ('16', '2020-03-31', '2020-03-31', '0', '白菜', '<p>大白菜</p>');
INSERT INTO `df_goods` VALUES ('17', '2020-03-31', '2020-03-31', '0', '冰激凌', '<p>少吃</p>');
