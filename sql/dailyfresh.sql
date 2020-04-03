/*
Navicat MySQL Data Transfer

Source Server         : web
Source Server Version : 80011
Source Host           : localhost:3306
Source Database       : dailyfresh

Target Server Type    : MYSQL
Target Server Version : 80011
File Encoding         : 65001

Date: 2020-04-03 23:08:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_p_permission_id_c67160e566af6de_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_p_permission_id_c67160e566af6de_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permission_group_id_65f08be2693a05b7_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  CONSTRAINT `auth__content_type_id_72c68724ac9dad6b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('5', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('8', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('9', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can add content type', '4', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('11', 'Can change content type', '4', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('12', 'Can delete content type', '4', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('13', 'Can add session', '5', 'add_session');
INSERT INTO `auth_permission` VALUES ('14', 'Can change session', '5', 'change_session');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete session', '5', 'delete_session');
INSERT INTO `auth_permission` VALUES ('16', 'Can add 用户', '6', 'add_user');
INSERT INTO `auth_permission` VALUES ('17', 'Can change 用户', '6', 'change_user');
INSERT INTO `auth_permission` VALUES ('18', 'Can delete 用户', '6', 'delete_user');
INSERT INTO `auth_permission` VALUES ('19', 'Can add 地址', '7', 'add_address');
INSERT INTO `auth_permission` VALUES ('20', 'Can change 地址', '7', 'change_address');
INSERT INTO `auth_permission` VALUES ('21', 'Can delete 地址', '7', 'delete_address');
INSERT INTO `auth_permission` VALUES ('22', 'Can add 订单', '8', 'add_orderinfo');
INSERT INTO `auth_permission` VALUES ('23', 'Can change 订单', '8', 'change_orderinfo');
INSERT INTO `auth_permission` VALUES ('24', 'Can delete 订单', '8', 'delete_orderinfo');
INSERT INTO `auth_permission` VALUES ('25', 'Can add 订单商品', '9', 'add_ordergoods');
INSERT INTO `auth_permission` VALUES ('26', 'Can change 订单商品', '9', 'change_ordergoods');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete 订单商品', '9', 'delete_ordergoods');
INSERT INTO `auth_permission` VALUES ('28', 'Can add 商品种类', '10', 'add_goodstype');
INSERT INTO `auth_permission` VALUES ('29', 'Can change 商品种类', '10', 'change_goodstype');
INSERT INTO `auth_permission` VALUES ('30', 'Can delete 商品种类', '10', 'delete_goodstype');
INSERT INTO `auth_permission` VALUES ('31', 'Can add 商品', '11', 'add_goodssku');
INSERT INTO `auth_permission` VALUES ('32', 'Can change 商品', '11', 'change_goodssku');
INSERT INTO `auth_permission` VALUES ('33', 'Can delete 商品', '11', 'delete_goodssku');
INSERT INTO `auth_permission` VALUES ('34', 'Can add 商品SPU', '12', 'add_goods');
INSERT INTO `auth_permission` VALUES ('35', 'Can change 商品SPU', '12', 'change_goods');
INSERT INTO `auth_permission` VALUES ('36', 'Can delete 商品SPU', '12', 'delete_goods');
INSERT INTO `auth_permission` VALUES ('37', 'Can add 商品图片', '13', 'add_goodsimage');
INSERT INTO `auth_permission` VALUES ('38', 'Can change 商品图片', '13', 'change_goodsimage');
INSERT INTO `auth_permission` VALUES ('39', 'Can delete 商品图片', '13', 'delete_goodsimage');
INSERT INTO `auth_permission` VALUES ('40', 'Can add 首页轮播商品', '14', 'add_indexgoodsbanner');
INSERT INTO `auth_permission` VALUES ('41', 'Can change 首页轮播商品', '14', 'change_indexgoodsbanner');
INSERT INTO `auth_permission` VALUES ('42', 'Can delete 首页轮播商品', '14', 'delete_indexgoodsbanner');
INSERT INTO `auth_permission` VALUES ('43', 'Can add 主页分类展示商品', '15', 'add_indextypegoodsbanner');
INSERT INTO `auth_permission` VALUES ('44', 'Can change 主页分类展示商品', '15', 'change_indextypegoodsbanner');
INSERT INTO `auth_permission` VALUES ('45', 'Can delete 主页分类展示商品', '15', 'delete_indextypegoodsbanner');
INSERT INTO `auth_permission` VALUES ('46', 'Can add 主页促销活动', '16', 'add_indexpromotionbanner');
INSERT INTO `auth_permission` VALUES ('47', 'Can change 主页促销活动', '16', 'change_indexpromotionbanner');
INSERT INTO `auth_permission` VALUES ('48', 'Can delete 主页促销活动', '16', 'delete_indexpromotionbanner');

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

-- ----------------------------
-- Table structure for df_user
-- ----------------------------
DROP TABLE IF EXISTS `df_user`;
CREATE TABLE `df_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `create_time` date NOT NULL,
  `update_time` date NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of df_user
-- ----------------------------
INSERT INTO `df_user` VALUES ('1', 'pbkdf2_sha256$20000$pwHLKzvXhqc4$FJF77r/L3pTQBI4wrXLOorp3MFNTLbA7kNZn1QaoCSs=', null, '0', 'wanlike', '', '', '2563418641@qq.com', '0', '1', '2020-02-11 04:50:57.641319', '2020-02-11', '2020-02-11', '0');
INSERT INTO `df_user` VALUES ('3', 'pbkdf2_sha256$20000$qu60NNEQAmwp$ntdprfmCj9FibZDNJp7M0CjY58k/NbxfttG7+l4Up6w=', null, '0', 'txbhandsome', '', '', '2563418641@qq.com', '0', '1', '2020-02-11 04:54:31.666552', '2020-02-11', '2020-02-11', '0');
INSERT INTO `df_user` VALUES ('4', 'pbkdf2_sha256$20000$rSvjvpdfIu91$QCoiqOh3U+Ikd+RbLeAhQKrKPEc/C+6M+r/3zJ1+9Uc=', null, '0', '撒旦法放假了', '', '', '2563418641@qq.com', '0', '1', '2020-02-11 05:27:54.386141', '2020-02-11', '2020-02-11', '0');
INSERT INTO `df_user` VALUES ('5', 'pbkdf2_sha256$20000$4C4AmWQ7E0ak$BMPK9vpI3muUxoJkqYT30J73Ses7nRe5ThzTUns+8oo=', null, '0', 'afsdjl', '', '', '2563418641@qq.com', '0', '1', '2020-02-11 05:29:36.711170', '2020-02-11', '2020-02-11', '0');
INSERT INTO `df_user` VALUES ('6', 'pbkdf2_sha256$20000$PcBr1VBMmtNx$gYg2J8Guw+FsHS+S4chapLuAbURR2a10U6EyeXSylDo=', null, '0', 'afjdal', '', '', '2563418641@qq.com', '0', '1', '2020-02-11 05:35:25.276619', '2020-02-11', '2020-02-11', '0');
INSERT INTO `df_user` VALUES ('7', 'pbkdf2_sha256$20000$W7jUDHVQQcA3$jIwylPw6S22vSQaYTqRqbLrUhTChzcJKBDfyyXjekUw=', null, '0', 'akfldjaf', '', '', '2563418641@qq.com', '0', '1', '2020-02-11 05:37:48.573566', '2020-02-11', '2020-02-11', '0');
INSERT INTO `df_user` VALUES ('8', 'pbkdf2_sha256$20000$voCa2cAeGIQM$7+dTrdmuvH0jccOP5cplXlnllNCYKYUa9KVWSYzjetw=', null, '0', 'jasfoa', '', '', '2563418641@qq.com', '0', '1', '2020-02-11 05:39:11.286803', '2020-02-11', '2020-02-11', '0');
INSERT INTO `df_user` VALUES ('9', 'pbkdf2_sha256$20000$13cau10ppx5T$KlkicxlBaSEwIfql0HicMGDv893uMezMj/3QFhCBAq8=', null, '0', 'lafdjsl', '', '', '2563418641@qq.com', '0', '0', '2020-02-11 05:45:37.844651', '2020-02-11', '2020-02-11', '0');
INSERT INTO `df_user` VALUES ('10', 'pbkdf2_sha256$20000$VFHhocJQpXBM$eiYUhNn+GfqxJ4vrc/ctII5URADaLmhzFWsoSu8gGTc=', null, '0', '抄给你', '', '', '2563418641@qq.com', '0', '0', '2020-02-11 11:24:32.943015', '2020-02-11', '2020-02-11', '0');
INSERT INTO `df_user` VALUES ('11', 'pbkdf2_sha256$20000$5n6cQ4Yxu3hH$7c2QgFfAOXUN8NILn0JBRqw4TMOaRpbTI1Y6E7TPyeM=', null, '0', 'afafjlk', '', '', '2563418641@qq.com', '0', '0', '2020-02-11 11:24:47.015655', '2020-02-11', '2020-02-11', '0');
INSERT INTO `df_user` VALUES ('12', 'pbkdf2_sha256$20000$XcTMmyYzhrGR$CSgX7sczGaoiXUhVIKT5/bd/JXoAoQTojpkAkHK8HZg=', null, '0', '重庆', '', '', '2563418641@qq.com', '0', '0', '2020-02-11 11:25:50.960012', '2020-02-11', '2020-02-11', '0');
INSERT INTO `df_user` VALUES ('13', 'pbkdf2_sha256$20000$Scp4d7tkmAzK$ofVi9Xa7imDRI02Xayr3FL37uTTfPOB7/0V7ycpIRkE=', null, '0', 'afdafljakfj', '', '', '2563418641@qq.com', '0', '0', '2020-02-14 06:32:54.999371', '2020-02-14', '2020-02-14', '0');
INSERT INTO `df_user` VALUES ('14', 'pbkdf2_sha256$20000$GOXPmzPlcz1Q$HHQAkXmtdecYTtpcdstwQbwalnGRPExYdvJrJ9uEH4c=', null, '0', 'txbjaslf', '', '', '2563418641@qq.com', '0', '0', '2020-02-14 10:32:01.648647', '2020-02-14', '2020-02-14', '0');
INSERT INTO `df_user` VALUES ('15', 'pbkdf2_sha256$20000$A4jnVQrNfN2B$2ySi7EbyA8qsEGr3/cl8iwyPJ7VLAEBQ5qig2X7OLXs=', null, '0', 'aklfja;ljfd', '', '', '2563418641@qq.com', '0', '0', '2020-02-14 10:32:55.807032', '2020-02-14', '2020-02-14', '0');
INSERT INTO `df_user` VALUES ('16', 'pbkdf2_sha256$20000$nKh68IEyojXO$eJAI1JE54d6fALBJmfz6zyn1NviedADlAEMOlvPWfZU=', null, '0', 'akjfkjadlkfd', '', '', 'txbhandsome564@163.com', '0', '0', '2020-02-14 10:33:57.693149', '2020-02-14', '2020-02-14', '0');
INSERT INTO `df_user` VALUES ('17', 'pbkdf2_sha256$20000$TPJLOIeV6SdQ$xRMu3myxallaznMOjn9M3yJTVAjmEucAxNEben890vU=', null, '0', '46465', '', '', 'txbhandsome564@163.com', '0', '0', '2020-02-14 14:08:06.541471', '2020-02-14', '2020-02-14', '0');
INSERT INTO `df_user` VALUES ('18', 'pbkdf2_sha256$20000$y8zYYb27wv8Q$3ZS12r826IrAcurfB/maYF1VIf3jXowncZ5BPo7wjAs=', null, '0', 'jlajfdlafdasdf', '', '', '2563418641@qq.com', '0', '0', '2020-02-14 14:09:19.522694', '2020-02-14', '2020-02-14', '0');
INSERT INTO `df_user` VALUES ('19', 'pbkdf2_sha256$20000$v3gyAu2CVD37$bxXbSeVjFiboIVvwr74jb8SzGd7s+kp8tfoPEdqEEbI=', null, '0', 'adfkhafkjdhakf', '', '', '2563418641@qq.com', '0', '0', '2020-02-14 14:17:00.097526', '2020-02-14', '2020-02-14', '0');
INSERT INTO `df_user` VALUES ('20', 'pbkdf2_sha256$20000$yIUDPKuZIgC1$G8Db89QLVP2PhkKhBxjfnx/goZC+pVaJE85LY9wchLI=', null, '0', 'jalsfdjal;gnka', '', '', '2563418641@qq.com', '0', '0', '2020-02-14 14:21:29.591200', '2020-02-14', '2020-02-14', '0');
INSERT INTO `df_user` VALUES ('21', 'pbkdf2_sha256$20000$5lb3NQ5H90By$T7V4AJxYfYUyMY43tMq6bNrY4Olj80M5o3YdoT+94nE=', null, '0', 'asfalsfjlakjsfd', '', '', '2563418641@qq.com', '0', '0', '2020-02-14 14:23:05.275771', '2020-02-14', '2020-02-14', '0');
INSERT INTO `df_user` VALUES ('22', 'pbkdf2_sha256$20000$FYJNMGxXbGmp$k8s8wruWIhhB016kEG2xpTPxew0qcmwZFdoXh1b/6Iw=', null, '0', 'dlajfdlasjfd', '', '', '2563418641@qq.com', '0', '0', '2020-02-14 14:26:11.457154', '2020-02-14', '2020-02-14', '0');
INSERT INTO `df_user` VALUES ('23', 'pbkdf2_sha256$20000$ESaXMxq2aQ1W$/vyX1dTNS4tSN9g1aA9VLNbJk+1LwJPeNsL7mODxR14=', null, '0', 'asdfalkfjdlakfjd', '', '', '2563418641@qq.com', '0', '0', '2020-02-14 14:28:47.032159', '2020-02-14', '2020-02-14', '0');
INSERT INTO `df_user` VALUES ('24', 'pbkdf2_sha256$20000$oKVxkRRbJsbI$UKknfgpMrn5WGujs4KyPrllAxrrqqy5dp5lcOZytFW8=', null, '0', 'asdfaklsfjd', '', '', '2563418641@qq.com', '0', '0', '2020-02-14 14:30:25.050254', '2020-02-14', '2020-02-14', '0');
INSERT INTO `df_user` VALUES ('25', 'pbkdf2_sha256$20000$mXID7ag9aGvj$Bz0u0SpGhYb0NHSfSfzotCPvHvofUoJzxb05xRyyB+Y=', null, '0', 'jaslfjasl', '', '', '2563418641@qq.com', '0', '0', '2020-02-14 14:32:52.375212', '2020-02-14', '2020-02-14', '0');
INSERT INTO `df_user` VALUES ('26', 'pbkdf2_sha256$20000$dvljVnX5QoKL$hRP6VMloiG5uBhO8cDMpLKPi+UsWHM9o+NC80wrDKP0=', null, '0', 'jadsfjadflkhak', '', '', '2563418641@qq.com', '0', '0', '2020-02-14 14:35:56.051858', '2020-02-14', '2020-02-14', '0');
INSERT INTO `df_user` VALUES ('27', 'pbkdf2_sha256$20000$IsuA5oeWGDOq$ra1/iYySwIgYO8egUCeCPr3NpjjgWCXOoVH5d2jslzo=', null, '0', 'asfhdklzjfdh', '', '', '2563418641@qq.com', '0', '0', '2020-02-14 14:38:24.277159', '2020-02-14', '2020-02-14', '0');
INSERT INTO `df_user` VALUES ('28', 'pbkdf2_sha256$20000$MG3u0nwJfXZv$psq3n+YRcpMUOHfNmZrptrwlZq64fnTUfE5zqf0/qnw=', null, '0', 'afhdkjackk', '', '', '2563418641@qq.com', '0', '0', '2020-02-14 14:41:33.606991', '2020-02-14', '2020-02-14', '0');
INSERT INTO `df_user` VALUES ('29', 'pbkdf2_sha256$20000$aYrCpMQJ4I3j$vvSOGVXEwKOWCc9T9NPEEr15Z3NTAZdLd2RvXERQclc=', null, '0', 'asfdkjzxlvjlxv', '', '', '2563418641@qq.com', '0', '1', '2020-02-14 14:42:51.516243', '2020-02-14', '2020-02-14', '0');
INSERT INTO `df_user` VALUES ('30', 'pbkdf2_sha256$20000$nVQ9VE8wNCsO$nfisZV610lpJG0UUDRqPtVZynMYezhmIufPr/G+XUv8=', null, '0', '飞机飞飞飞', '', '', '2563418641@qq.com', '0', '0', '2020-02-15 13:17:41.162557', '2020-02-15', '2020-02-15', '0');
INSERT INTO `df_user` VALUES ('31', 'pbkdf2_sha256$20000$fhpx8S9FfzZg$KDtpZl7IiC8mkIBTF9DgCnRYcgJFnr0g6B8F6DnVHHM=', null, '0', '我最666', '', '', '2563418641@qq.com', '0', '0', '2020-02-15 13:35:31.229107', '2020-02-15', '2020-02-15', '0');
INSERT INTO `df_user` VALUES ('32', 'pbkdf2_sha256$20000$R4e7oMqo6CNa$jain/AoHxa5EFlWPA1DQV1BG3lZktrpGIYAlQPF0Njk=', null, '0', '我最667', '', '', '2563418641@qq.com', '0', '0', '2020-02-15 13:39:08.645968', '2020-02-15', '2020-02-15', '0');
INSERT INTO `df_user` VALUES ('33', 'pbkdf2_sha256$20000$LBnPMRyGSZQB$yW4G8Zp5IIeqZrI7M6lToW5Qqk/r4Bd9Xb0aDoBx7oc=', null, '0', '大飞哥带路', '', '', '2563418641@qq.com', '0', '0', '2020-02-15 13:42:02.817472', '2020-02-15', '2020-02-15', '0');
INSERT INTO `df_user` VALUES ('34', 'pbkdf2_sha256$20000$hvKiJi77g8gw$YMTmmo/laUwkEK+MMpRMyG8KYtEYL+Sib61Eea7enIg=', null, '0', '拉数据分类', '', '', '2563418641@qq.com', '0', '0', '2020-02-15 13:44:51.919602', '2020-02-15', '2020-02-15', '0');
INSERT INTO `df_user` VALUES ('35', 'pbkdf2_sha256$20000$BOqK4xErBkQ9$IY6I6ywV7/vtfaQCOF4M5ZFN8qLMRFv7GpGBpjcBlw8=', '2020-02-17 07:44:58.432561', '0', 'aaaaa', '', '', '2563418641@qq.com', '0', '1', '2020-02-15 14:14:47.784680', '2020-02-15', '2020-02-15', '0');
INSERT INTO `df_user` VALUES ('36', 'pbkdf2_sha256$20000$VBEteM38v8Sq$WT0aylqXDZaRXBeZ9ob7YFdG4I1RpOP/Jr92r2VfHzE=', '2020-03-31 04:33:24.876771', '1', 'txb', '', '', '2563418641@qq.com', '1', '1', '2020-02-17 13:02:06.623796', '2020-02-17', '2020-02-17', '0');
INSERT INTO `df_user` VALUES ('37', 'pbkdf2_sha256$20000$OUZtVhq2z1l4$lVVEgOgWEwe3Cp1zhrlwuxCvNnbJ/Mtc31JKH41+wHQ=', null, '0', 'wanlike1', '', '', '2563418641@qq.com', '0', '0', '2020-03-27 03:54:49.476382', '2020-03-27', '2020-03-27', '0');
INSERT INTO `df_user` VALUES ('38', 'pbkdf2_sha256$20000$pt58emMgLYmN$/dLfk9ZOELyMRoQkgEJj6kr2B5U1hGMSp1Aperl+qlw=', null, '0', 'wanlike2', '', '', '2563418641@qq.com', '0', '0', '2020-03-27 05:08:46.429050', '2020-03-27', '2020-03-27', '0');
INSERT INTO `df_user` VALUES ('39', 'pbkdf2_sha256$20000$Rrfm9yJqSQGf$k7Fvv7GU9Bbno2zrk4tp7p2usmSkrDNXgoEXI2g5Ipc=', null, '0', 'wanlike3', '', '', '2563418641@qq.com', '0', '0', '2020-03-27 05:14:32.935895', '2020-03-27', '2020-03-27', '0');
INSERT INTO `df_user` VALUES ('40', 'pbkdf2_sha256$20000$iotZGdqNk3Ba$Yr02xn1Imd7OndfYxRWn5LwyMJp8Gnp95vRQtdK9AIY=', null, '0', 'wanlike4', '', '', '2563418641@qq.com', '0', '0', '2020-03-27 05:43:16.235866', '2020-03-27', '2020-03-27', '0');
INSERT INTO `df_user` VALUES ('41', 'pbkdf2_sha256$20000$wkEfiHFjzbtP$fGhhhbEyW6eZa8hs3JDMX2074nPwxDTUUOWllxE5kfg=', null, '0', 'wanlike10', '', '', '2563418641@qq.com', '0', '0', '2020-03-27 06:41:35.331724', '2020-03-27', '2020-03-27', '0');

-- ----------------------------
-- Table structure for df_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `df_user_groups`;
CREATE TABLE `df_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `df_user_groups_group_id_72ab44311ed5c3bc_fk_auth_group_id` (`group_id`),
  CONSTRAINT `df_user_groups_group_id_72ab44311ed5c3bc_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `df_user_groups_user_id_6fb554975d912da8_fk_df_user_id` FOREIGN KEY (`user_id`) REFERENCES `df_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of df_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for df_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `df_user_user_permissions`;
CREATE TABLE `df_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `df_user_use_permission_id_58e6acdb12061c12_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `df_user_use_permission_id_58e6acdb12061c12_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `df_user_user_permissions_user_id_6de08d73a45fb049_fk_df_user_id` FOREIGN KEY (`user_id`) REFERENCES `df_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of df_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `djang_content_type_id_185434e099a3f681_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_7106daf170324296_fk_df_user_id` (`user_id`),
  CONSTRAINT `djang_content_type_id_185434e099a3f681_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_7106daf170324296_fk_df_user_id` FOREIGN KEY (`user_id`) REFERENCES `df_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES ('1', '2020-02-20 08:00:54.923953', '1', '香瓜', '1', '', '10', '36');
INSERT INTO `django_admin_log` VALUES ('2', '2020-02-22 00:35:29.456213', '1', '菠萝', '2', '已修改 name，logo 和 image 。', '10', '36');
INSERT INTO `django_admin_log` VALUES ('3', '2020-02-22 00:35:51.008683', '2', '香瓜', '1', '', '10', '36');
INSERT INTO `django_admin_log` VALUES ('4', '2020-02-22 00:36:10.797493', '3', '啤', '1', '', '10', '36');
INSERT INTO `django_admin_log` VALUES ('5', '2020-02-22 02:51:25.706984', '1', 'Goods object', '1', '', '12', '36');
INSERT INTO `django_admin_log` VALUES ('6', '2020-02-22 02:51:41.281511', '1', 'Goods object', '2', '没有字段被修改。', '12', '36');
INSERT INTO `django_admin_log` VALUES ('7', '2020-02-22 02:53:01.153790', '2', 'Goods object', '1', '', '12', '36');
INSERT INTO `django_admin_log` VALUES ('8', '2020-02-22 02:55:58.232482', '1', 'GoodsSKU object', '1', '', '11', '36');
INSERT INTO `django_admin_log` VALUES ('9', '2020-02-22 02:56:52.118147', '2', 'GoodsSKU object', '1', '', '11', '36');
INSERT INTO `django_admin_log` VALUES ('10', '2020-02-22 02:58:14.944329', '1', 'IndexGoodsBanner object', '1', '', '14', '36');
INSERT INTO `django_admin_log` VALUES ('11', '2020-02-22 02:58:30.068855', '2', 'IndexGoodsBanner object', '1', '', '14', '36');
INSERT INTO `django_admin_log` VALUES ('12', '2020-02-22 03:01:20.689979', '1', 'IndexPromotionBanner object', '1', '', '16', '36');
INSERT INTO `django_admin_log` VALUES ('13', '2020-02-22 03:10:20.411082', '2', '睡觉小长假', '1', '', '16', '36');
INSERT INTO `django_admin_log` VALUES ('14', '2020-02-22 03:10:57.517942', '1', 'IndexTypeGoodsBanner object', '1', '', '15', '36');
INSERT INTO `django_admin_log` VALUES ('15', '2020-02-22 03:11:09.379035', '2', 'IndexTypeGoodsBanner object', '1', '', '15', '36');
INSERT INTO `django_admin_log` VALUES ('16', '2020-03-26 04:15:12.949914', '2', '睡觉小长假', '3', '', '16', '36');
INSERT INTO `django_admin_log` VALUES ('17', '2020-03-26 04:15:23.299508', '1', '停课又停学', '3', '', '16', '36');
INSERT INTO `django_admin_log` VALUES ('18', '2020-03-26 04:15:31.787608', '2', '香瓜', '3', '', '15', '36');
INSERT INTO `django_admin_log` VALUES ('19', '2020-03-26 04:15:34.853019', '1', '菠萝', '3', '', '15', '36');
INSERT INTO `django_admin_log` VALUES ('20', '2020-03-26 04:15:47.024766', '2', '研究生', '3', '', '11', '36');
INSERT INTO `django_admin_log` VALUES ('21', '2020-03-26 04:15:52.066510', '1', '本科生', '3', '', '11', '36');
INSERT INTO `django_admin_log` VALUES ('22', '2020-03-26 04:16:01.707045', '3', '啤', '3', '', '10', '36');
INSERT INTO `django_admin_log` VALUES ('23', '2020-03-26 04:16:07.119404', '2', '香瓜', '3', '', '10', '36');
INSERT INTO `django_admin_log` VALUES ('24', '2020-03-26 04:16:10.706649', '1', '菠萝', '3', '', '10', '36');
INSERT INTO `django_admin_log` VALUES ('25', '2020-03-26 04:16:19.597817', '2', '衡阳师范大学', '3', '', '12', '36');
INSERT INTO `django_admin_log` VALUES ('26', '2020-03-26 04:16:23.437941', '1', '重庆邮电大学', '3', '', '12', '36');
INSERT INTO `django_admin_log` VALUES ('27', '2020-03-26 04:17:55.640123', '3', '吃货暑假趴', '1', '', '16', '36');
INSERT INTO `django_admin_log` VALUES ('28', '2020-03-26 04:18:21.039385', '4', '零食保健0元抢', '1', '', '16', '36');
INSERT INTO `django_admin_log` VALUES ('29', '2020-03-26 04:20:08.475433', '4', '新鲜水果', '1', '', '10', '36');
INSERT INTO `django_admin_log` VALUES ('30', '2020-03-26 04:20:36.247777', '5', '海鲜水产', '1', '', '10', '36');
INSERT INTO `django_admin_log` VALUES ('31', '2020-03-31 04:43:02.076009', '6', '猪牛羊肉', '1', '', '10', '36');
INSERT INTO `django_admin_log` VALUES ('32', '2020-03-31 04:43:46.736836', '7', '禽类蛋品', '1', '', '10', '36');
INSERT INTO `django_admin_log` VALUES ('33', '2020-03-31 05:38:40.845006', '8', '新鲜蔬菜', '1', '', '10', '36');
INSERT INTO `django_admin_log` VALUES ('34', '2020-03-31 05:40:54.379989', '9', '速冻食品', '1', '', '10', '36');
INSERT INTO `django_admin_log` VALUES ('35', '2020-03-31 05:47:33.732039', '4', '新鲜水果', '2', '已修改 logo 。', '10', '36');
INSERT INTO `django_admin_log` VALUES ('36', '2020-03-31 05:47:55.049290', '5', '海鲜水产', '2', '已修改 logo 。', '10', '36');
INSERT INTO `django_admin_log` VALUES ('37', '2020-03-31 05:48:37.664745', '6', '猪牛羊肉', '2', '已修改 logo 。', '10', '36');
INSERT INTO `django_admin_log` VALUES ('38', '2020-03-31 05:49:06.243163', '8', '新鲜蔬菜', '2', '已修改 logo 。', '10', '36');
INSERT INTO `django_admin_log` VALUES ('39', '2020-03-31 05:49:23.073530', '9', '速冻食品', '2', '已修改 logo 。', '10', '36');
INSERT INTO `django_admin_log` VALUES ('40', '2020-03-31 05:54:19.659967', '3', '草莓', '1', '', '12', '36');
INSERT INTO `django_admin_log` VALUES ('41', '2020-03-31 05:54:34.823314', '4', '葡萄', '1', '', '12', '36');
INSERT INTO `django_admin_log` VALUES ('42', '2020-03-31 05:54:53.735346', '5', '柠檬', '1', '', '12', '36');
INSERT INTO `django_admin_log` VALUES ('43', '2020-03-31 05:55:09.565079', '6', '奇异果', '1', '', '12', '36');
INSERT INTO `django_admin_log` VALUES ('44', '2020-03-31 05:57:36.105737', '6', '奇异果', '3', '', '12', '36');
INSERT INTO `django_admin_log` VALUES ('45', '2020-03-31 05:57:36.172556', '5', '柠檬', '3', '', '12', '36');
INSERT INTO `django_admin_log` VALUES ('46', '2020-03-31 05:57:36.182530', '4', '葡萄', '3', '', '12', '36');
INSERT INTO `django_admin_log` VALUES ('47', '2020-03-31 05:57:36.186519', '3', '草莓', '3', '', '12', '36');
INSERT INTO `django_admin_log` VALUES ('48', '2020-03-31 06:03:19.452139', '7', '葡萄', '1', '', '12', '36');
INSERT INTO `django_admin_log` VALUES ('49', '2020-03-31 06:04:29.187558', '8', '草莓', '1', '', '12', '36');
INSERT INTO `django_admin_log` VALUES ('50', '2020-03-31 06:04:56.332801', '9', '柠檬', '1', '', '12', '36');
INSERT INTO `django_admin_log` VALUES ('51', '2020-03-31 06:05:04.215642', '10', '奇异果', '1', '', '12', '36');
INSERT INTO `django_admin_log` VALUES ('52', '2020-03-31 06:08:03.514502', '11', '扇贝', '1', '', '12', '36');
INSERT INTO `django_admin_log` VALUES ('53', '2020-03-31 06:08:33.910858', '12', '秋刀鱼', '1', '', '12', '36');
INSERT INTO `django_admin_log` VALUES ('54', '2020-03-31 06:08:57.946182', '13', '猪肉', '1', '', '12', '36');
INSERT INTO `django_admin_log` VALUES ('55', '2020-03-31 06:09:13.991384', '14', '牛肉', '1', '', '12', '36');
INSERT INTO `django_admin_log` VALUES ('56', '2020-03-31 06:10:17.786444', '15', '鸡蛋', '1', '', '12', '36');
INSERT INTO `django_admin_log` VALUES ('57', '2020-03-31 06:10:30.499325', '16', '白菜', '1', '', '12', '36');
INSERT INTO `django_admin_log` VALUES ('58', '2020-03-31 06:10:55.263865', '17', '冰激凌', '1', '', '12', '36');
INSERT INTO `django_admin_log` VALUES ('59', '2020-03-31 06:12:12.982548', '3', '葡萄', '1', '', '11', '36');
INSERT INTO `django_admin_log` VALUES ('60', '2020-03-31 06:13:02.808281', '4', '草莓', '1', '', '11', '36');
INSERT INTO `django_admin_log` VALUES ('61', '2020-03-31 06:17:48.609267', '5', '秋刀鱼', '1', '', '11', '36');
INSERT INTO `django_admin_log` VALUES ('62', '2020-03-31 06:18:49.793075', '6', '猪肉', '1', '', '11', '36');
INSERT INTO `django_admin_log` VALUES ('63', '2020-03-31 06:21:35.667166', '7', '鸡蛋', '1', '', '11', '36');
INSERT INTO `django_admin_log` VALUES ('64', '2020-03-31 06:22:26.098821', '8', '白菜', '1', '', '11', '36');
INSERT INTO `django_admin_log` VALUES ('65', '2020-03-31 06:23:11.052367', '9', '冰激凌', '1', '', '11', '36');
INSERT INTO `django_admin_log` VALUES ('66', '2020-03-31 06:23:38.987121', '3', 'banner/goods002.jpg', '1', '', '14', '36');
INSERT INTO `django_admin_log` VALUES ('67', '2020-03-31 06:23:53.064016', '4', 'banner/goods003.jpg', '1', '', '14', '36');
INSERT INTO `django_admin_log` VALUES ('68', '2020-03-31 06:24:06.451839', '5', 'banner/goods020.jpg', '1', '', '14', '36');
INSERT INTO `django_admin_log` VALUES ('69', '2020-03-31 06:24:47.661012', '5', 'banner/goods020_J3Xe0lx.jpg', '2', '已修改 image 和 index 。', '14', '36');
INSERT INTO `django_admin_log` VALUES ('70', '2020-03-31 06:25:12.735409', '5', 'banner/goods020_J3Xe0lx.jpg', '3', '', '14', '36');
INSERT INTO `django_admin_log` VALUES ('71', '2020-03-31 06:25:12.824174', '4', 'banner/goods003.jpg', '3', '', '14', '36');
INSERT INTO `django_admin_log` VALUES ('72', '2020-03-31 06:25:12.831153', '3', 'banner/goods002.jpg', '3', '', '14', '36');
INSERT INTO `django_admin_log` VALUES ('73', '2020-03-31 06:25:38.622471', '6', 'banner/slide03.jpg', '1', '', '14', '36');
INSERT INTO `django_admin_log` VALUES ('74', '2020-03-31 06:25:59.332287', '7', 'banner/slide.jpg', '1', '', '14', '36');
INSERT INTO `django_admin_log` VALUES ('75', '2020-03-31 06:26:30.474146', '8', 'banner/slide04.jpg', '1', '', '14', '36');
INSERT INTO `django_admin_log` VALUES ('76', '2020-03-31 07:40:28.673462', '6', 'banner/goods002_fU9gch4.jpg', '2', '已修改 sku 和 image 。', '14', '36');
INSERT INTO `django_admin_log` VALUES ('77', '2020-03-31 07:44:13.065815', '6', 'banner/slide03_ouHm8EK.jpg', '2', '已修改 sku 和 image 。', '14', '36');
INSERT INTO `django_admin_log` VALUES ('78', '2020-03-31 07:45:20.603852', '6', '猪肉', '2', '已修改 image 。', '11', '36');
INSERT INTO `django_admin_log` VALUES ('79', '2020-03-31 09:19:36.464759', '10', '柠檬', '1', '', '11', '36');
INSERT INTO `django_admin_log` VALUES ('80', '2020-03-31 09:20:23.323568', '11', '奇异果', '1', '', '11', '36');
INSERT INTO `django_admin_log` VALUES ('81', '2020-04-01 02:11:20.574142', '4', '零食保健0元抢', '2', '已修改 url 。', '16', '36');
INSERT INTO `django_admin_log` VALUES ('82', '2020-04-01 02:11:41.642036', '3', '吃货暑假趴', '2', '已修改 url 。', '16', '36');
INSERT INTO `django_admin_log` VALUES ('83', '2020-04-01 02:30:22.576067', '3', '吃货暑假趴', '2', '已修改 url 。', '16', '36');

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_59b771761b2b486f_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('4', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('12', 'goods', 'goods');
INSERT INTO `django_content_type` VALUES ('13', 'goods', 'goodsimage');
INSERT INTO `django_content_type` VALUES ('11', 'goods', 'goodssku');
INSERT INTO `django_content_type` VALUES ('10', 'goods', 'goodstype');
INSERT INTO `django_content_type` VALUES ('14', 'goods', 'indexgoodsbanner');
INSERT INTO `django_content_type` VALUES ('16', 'goods', 'indexpromotionbanner');
INSERT INTO `django_content_type` VALUES ('15', 'goods', 'indextypegoodsbanner');
INSERT INTO `django_content_type` VALUES ('9', 'order', 'ordergoods');
INSERT INTO `django_content_type` VALUES ('8', 'order', 'orderinfo');
INSERT INTO `django_content_type` VALUES ('5', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('7', 'user', 'address');
INSERT INTO `django_content_type` VALUES ('6', 'user', 'user');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2020-02-10 14:08:35.617438');
INSERT INTO `django_migrations` VALUES ('2', 'contenttypes', '0002_remove_content_type_name', '2020-02-10 14:08:35.832863');
INSERT INTO `django_migrations` VALUES ('3', 'auth', '0001_initial', '2020-02-10 14:08:36.499546');
INSERT INTO `django_migrations` VALUES ('4', 'auth', '0002_alter_permission_name_max_length', '2020-02-10 14:08:36.650145');
INSERT INTO `django_migrations` VALUES ('5', 'auth', '0003_alter_user_email_max_length', '2020-02-10 14:08:36.670091');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0004_alter_user_username_opts', '2020-02-10 14:08:36.683057');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0005_alter_user_last_login_null', '2020-02-10 14:08:36.705997');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0006_require_contenttypes_0002', '2020-02-10 14:08:36.717963');
INSERT INTO `django_migrations` VALUES ('9', 'user', '0001_initial', '2020-02-10 14:08:37.782622');
INSERT INTO `django_migrations` VALUES ('10', 'admin', '0001_initial', '2020-02-10 14:08:38.329161');
INSERT INTO `django_migrations` VALUES ('11', 'goods', '0001_initial', '2020-02-10 14:08:41.270193');
INSERT INTO `django_migrations` VALUES ('12', 'order', '0001_initial', '2020-02-10 14:08:41.405830');
INSERT INTO `django_migrations` VALUES ('13', 'order', '0002_auto_20200210_2206', '2020-02-10 14:08:42.832708');
INSERT INTO `django_migrations` VALUES ('14', 'sessions', '0001_initial', '2020-02-10 14:08:42.943416');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('z0lciby2oewe6dcoizy4z0soe4axm5v1', 'NTkwNTk4ZmY3MjZkZDliYWVjNjMyYzQwZmIyYjQ4MmQxNGE1YmY2NDp7Il9hdXRoX3VzZXJfaWQiOiIzNSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNThkZDUwZTIyYjc3ZThlMTJlMGVlMjJjY2IzMTdlMWQzZTZmOGFjNiJ9', '2020-02-29 14:18:57.166442');
