/*
Navicat MySQL Data Transfer

Source Server         : web
Source Server Version : 80011
Source Host           : localhost:3306
Source Database       : dailyfresh

Target Server Type    : MYSQL
Target Server Version : 80011
File Encoding         : 65001

Date: 2020-04-03 21:42:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for df_address
-- ----------------------------
DROP TABLE IF EXISTS `df_address`;
CREATE TABLE `df_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` date NOT NULL,
  `update_time` date NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `receiver` varchar(20) NOT NULL,
  `addr` varchar(256) NOT NULL,
  `zip_code` varchar(6) DEFAULT NULL,
  `phone` varchar(11) NOT NULL,
  `is_default` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `df_address_user_id_37db24a7c449efd9_fk_df_user_id` (`user_id`),
  CONSTRAINT `df_address_user_id_37db24a7c449efd9_fk_df_user_id` FOREIGN KEY (`user_id`) REFERENCES `df_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of df_address
-- ----------------------------
INSERT INTO `df_address` VALUES ('1', '2020-02-17', '2020-02-17', '0', '老王', '北京市', '', '13696402738', '1', '35');
INSERT INTO `df_address` VALUES ('2', '2020-02-17', '2020-02-17', '0', '老狗', '长沙市', '', '13696402738', '0', '35');
INSERT INTO `df_address` VALUES ('3', '2020-02-18', '2020-02-18', '0', '老王', '快手主播李佳欢', '', '13696402738', '1', '36');
INSERT INTO `df_address` VALUES ('4', '2020-03-08', '2020-03-08', '0', '武当王也', '武当山', '', '13696402738', '0', '36');
