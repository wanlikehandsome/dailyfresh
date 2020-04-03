/*
Navicat MySQL Data Transfer

Source Server         : web
Source Server Version : 80011
Source Host           : localhost:3306
Source Database       : dailyfresh

Target Server Type    : MYSQL
Target Server Version : 80011
File Encoding         : 65001

Date: 2020-04-03 21:44:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for df_order_info
-- ----------------------------
DROP TABLE IF EXISTS `df_order_info`;
CREATE TABLE `df_order_info` (
  `create_time` date NOT NULL,
  `update_time` date NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `order_id` varchar(128) NOT NULL,
  `pay_method` smallint(6) NOT NULL,
  `total_count` int(11) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `transit_price` decimal(10,2) NOT NULL,
  `order_status` smallint(6) NOT NULL,
  `trade_no` varchar(128) NOT NULL,
  `addr_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `df_order_info_90ccbf41` (`addr_id`),
  KEY `df_order_info_e8701ad4` (`user_id`),
  CONSTRAINT `df_order_info_addr_id_60dfb78fd758a606_fk_df_address_id` FOREIGN KEY (`addr_id`) REFERENCES `df_address` (`id`),
  CONSTRAINT `df_order_info_user_id_2c636009fa75274d_fk_df_user_id` FOREIGN KEY (`user_id`) REFERENCES `df_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of df_order_info
-- ----------------------------
INSERT INTO `df_order_info` VALUES ('2020-03-09', '2020-03-09', '0', '2020030911482536', '1', '7', '2660.00', '10.00', '1', '', '4', '36');
INSERT INTO `df_order_info` VALUES ('2020-03-09', '2020-03-09', '0', '2020030921414636', '1', '3', '1140.00', '10.00', '1', '', '4', '36');
INSERT INTO `df_order_info` VALUES ('2020-03-09', '2020-03-09', '0', '2020030922231136', '1', '6', '2280.00', '10.00', '1', '', '4', '36');
INSERT INTO `df_order_info` VALUES ('2020-03-09', '2020-03-09', '0', '2020030922304936', '1', '3', '1140.00', '10.00', '1', '', '4', '36');
INSERT INTO `df_order_info` VALUES ('2020-03-31', '2020-03-31', '0', '2020033120480136', '1', '3', '15.00', '10.00', '1', '', '4', '36');
INSERT INTO `df_order_info` VALUES ('2020-03-31', '2020-03-31', '0', '2020033120501236', '1', '3', '300.00', '10.00', '1', '', '3', '36');
INSERT INTO `df_order_info` VALUES ('2020-03-31', '2020-03-31', '0', '2020033121210636', '1', '6', '60.00', '10.00', '1', '', '4', '36');
INSERT INTO `df_order_info` VALUES ('2020-03-31', '2020-03-31', '0', '2020033122114436', '4', '3', '15.00', '10.00', '1', '', '4', '36');
INSERT INTO `df_order_info` VALUES ('2020-04-01', '2020-04-01', '0', '2020040108353936', '1', '3', '300.00', '10.00', '1', '', '4', '36');
INSERT INTO `df_order_info` VALUES ('2020-04-01', '2020-04-01', '0', '2020040108440736', '1', '3', '15.00', '10.00', '1', '', '4', '36');
INSERT INTO `df_order_info` VALUES ('2020-04-01', '2020-04-01', '0', '2020040114444836', '2', '3', '300.00', '10.00', '1', '', '4', '36');
