/*
Navicat MySQL Data Transfer

Source Server         : web
Source Server Version : 80011
Source Host           : localhost:3306
Source Database       : dailyfresh

Target Server Type    : MYSQL
Target Server Version : 80011
File Encoding         : 65001

Date: 2020-04-03 21:44:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for df_index_promotion
-- ----------------------------
DROP TABLE IF EXISTS `df_index_promotion`;
CREATE TABLE `df_index_promotion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` date NOT NULL,
  `update_time` date NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `name` varchar(20) NOT NULL,
  `url` varchar(200) NOT NULL,
  `image` varchar(100) NOT NULL,
  `index` smallint(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of df_index_promotion
-- ----------------------------
INSERT INTO `df_index_promotion` VALUES ('3', '2020-03-26', '2020-03-26', '0', '吃货暑假趴', 'https://search.jd.com/Search?keyword=%E5%90%83%E8%B4%A7%E6%B4%BB%E5%8A%A8&enc=utf-8&wq=%E5%90%83%E8%B4%A7%E6%B4%BB%E5%8A', 'banner/adv01.jpg', '0');
INSERT INTO `df_index_promotion` VALUES ('4', '2020-03-26', '2020-03-26', '0', '零食保健0元抢', 'https://www.taobao.com/', 'banner/adv02.jpg', '1');
