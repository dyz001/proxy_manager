/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1_56
Source Server Version : 50505
Source Host           : 192.168.1.36:3306
Source Database       : game_record

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-01-29 20:44:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for config
-- ----------------------------
DROP TABLE IF EXISTS `config`;
CREATE TABLE `config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT '0' COMMENT '0:系统配置，1: 平台抽水分成配置, 2:捕鱼抽水分成配置',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '配置的键值',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of config
-- ----------------------------
INSERT INTO `config` VALUES ('1', '1', 'system_first', '40', '平台代理一级分成');
INSERT INTO `config` VALUES ('2', '1', 'system_second', '15', '平台代理二级分成');
INSERT INTO `config` VALUES ('3', '1', 'system_third', '5', '平台代理三级分成');
INSERT INTO `config` VALUES ('4', '2', 'fish_first', '40', '捕鱼一级分成');
INSERT INTO `config` VALUES ('5', '2', 'fish_second', '15', '捕鱼二级分成');
INSERT INTO `config` VALUES ('6', '2', 'fish_third', '5', '捕鱼三级分成');
INSERT INTO `config` VALUES ('7', '0', 'proxy_min_players', '20', '申请代理的最小人数');
INSERT INTO `config` VALUES ('8', '0', 'mail_cost_gold', '100', '发送邮件消耗的金币');

-- ----------------------------
-- Table structure for fish_record_sum_201801
-- ----------------------------
DROP TABLE IF EXISTS `fish_record_sum_201801`;
CREATE TABLE `fish_record_sum_201801` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` varchar(255) DEFAULT '' COMMENT '对应unionid',
  `account_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '对方账号id',
  `cost_sum` float DEFAULT '0' COMMENT '消耗总额',
  `bonus_sum` float DEFAULT '0' COMMENT '收益总额',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '记录产生时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fish_record_sum_201801
-- ----------------------------
INSERT INTO `fish_record_sum_201801` VALUES ('59', 'sftest001', '140139', '51.12', '50.03', '1516773188');
INSERT INTO `fish_record_sum_201801` VALUES ('60', 'user124', '140150', '2276.4', '1812.02', '1516773188');
INSERT INTO `fish_record_sum_201801` VALUES ('61', 'user125', '140151', '4039.63', '3193.12', '1516773188');
INSERT INTO `fish_record_sum_201801` VALUES ('62', 'user135', '140155', '1774.23', '1335.76', '1516773188');
INSERT INTO `fish_record_sum_201801` VALUES ('63', 'user136', '140156', '1660.76', '1307.83', '1516773188');
INSERT INTO `fish_record_sum_201801` VALUES ('64', 'user141', '140182', '244.56', '192.05', '1516773188');
INSERT INTO `fish_record_sum_201801` VALUES ('65', 'user147', '140159', '1.95', '0.96', '1516773188');
INSERT INTO `fish_record_sum_201801` VALUES ('66', 'user148', '140162', '5.81', '5.11', '1516773188');
INSERT INTO `fish_record_sum_201801` VALUES ('67', 'user149', '140161', '10124.7', '8420.63', '1516773188');
INSERT INTO `fish_record_sum_201801` VALUES ('68', 'user150', '140160', '3.78', '1.82', '1516773188');
INSERT INTO `fish_record_sum_201801` VALUES ('69', 'user151', '140163', '1', '0', '1516773188');
INSERT INTO `fish_record_sum_201801` VALUES ('70', 'user163', '140176', '1.07', '0.07', '1516773188');
INSERT INTO `fish_record_sum_201801` VALUES ('71', 'user164', '140177', '1841.73', '1556.62', '1516773189');
INSERT INTO `fish_record_sum_201801` VALUES ('72', 'user165', '140178', '176.4', '155.6', '1516773189');
INSERT INTO `fish_record_sum_201801` VALUES ('73', 'user173', '140183', '1', '0', '1516773189');
INSERT INTO `fish_record_sum_201801` VALUES ('74', 'user179', '140181', '3.99', '5.53', '1516773189');
INSERT INTO `fish_record_sum_201801` VALUES ('75', 'user24', '140180', '53.55', '52.15', '1516773189');
INSERT INTO `fish_record_sum_201801` VALUES ('76', 'user34', '140114', '1632.11', '1382.91', '1516773189');
INSERT INTO `fish_record_sum_201801` VALUES ('77', 'user37', '140125', '6098.48', '5174', '1516773189');
INSERT INTO `fish_record_sum_201801` VALUES ('78', 'user61', '140122', '328.8', '304.4', '1516773189');
INSERT INTO `fish_record_sum_201801` VALUES ('79', 'user69', '140124', '21.57', '20.9', '1516773189');
INSERT INTO `fish_record_sum_201801` VALUES ('80', 'user74', '140140', '0.14', '0', '1516773189');
INSERT INTO `fish_record_sum_201801` VALUES ('81', 'user88', '140138', '1.96', '0.98', '1516773189');
INSERT INTO `fish_record_sum_201801` VALUES ('82', 'user89', '140134', '94.78', '91.21', '1516773189');
INSERT INTO `fish_record_sum_201801` VALUES ('83', 'user95', '140112', '1583.2', '1391.6', '1516773189');
INSERT INTO `fish_record_sum_201801` VALUES ('84', 'ww001', '140172', '179.3', '79.3', '1516773189');

-- ----------------------------
-- Table structure for game_record
-- ----------------------------
DROP TABLE IF EXISTS `game_record`;
CREATE TABLE `game_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户平台id',
  `proxy_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '玩家的上级代理',
  `game_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '游戏编码',
  `water` bigint(20) NOT NULL DEFAULT '0' COMMENT '抽水值',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '产生时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of game_record
-- ----------------------------

-- ----------------------------
-- Table structure for item_config
-- ----------------------------
DROP TABLE IF EXISTS `item_config`;
CREATE TABLE `item_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL DEFAULT '0' COMMENT '物品id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '物品名称',
  `price` bigint(20) NOT NULL,
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '物品图标',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_config
-- ----------------------------
INSERT INTO `item_config` VALUES ('1', '10', '50元话费卡', '550000', 'sell_item_10.png');
INSERT INTO `item_config` VALUES ('2', '20', '100元话费卡', '1050000', 'sell_item_20.png');
INSERT INTO `item_config` VALUES ('3', '30', '200元话费卡', '2100000', 'sell_item_30.png');
INSERT INTO `item_config` VALUES ('4', '40', '500元话费卡', '5250000', 'sell_item_40.png');
INSERT INTO `item_config` VALUES ('5', '50', '100元话费卡', '10500000', 'sell_item_50.png');
INSERT INTO `item_config` VALUES ('6', '60', '美的扫地机器人', '10500000', 'sell_item_60.png');
INSERT INTO `item_config` VALUES ('7', '70', 'DELSEY-20寸拉杆箱', '15750000', 'sell_item_70.png');
INSERT INTO `item_config` VALUES ('8', '80', '茶叶', '21000000', 'sell_item_80.png');
INSERT INTO `item_config` VALUES ('9', '90', 'Ipad-32G', '31500000', 'sell_item_90.png');
INSERT INTO `item_config` VALUES ('10', '100', 'Iphone7-32G', '52500000', 'sell_item_100.png');
INSERT INTO `item_config` VALUES ('11', '110', 'Iphone8 Plus-64G', '73500000', 'sell_item_110.png');

-- ----------------------------
-- Table structure for item_oper_record
-- ----------------------------
DROP TABLE IF EXISTS `item_oper_record`;
CREATE TABLE `item_oper_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户的pid',
  `item_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '物品id',
  `item_cnt` int(11) NOT NULL DEFAULT '0' COMMENT '操作数量',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `oper_user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '客服',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_oper_record
-- ----------------------------
INSERT INTO `item_oper_record` VALUES ('1', '135829611', '10', '12', '1517221468', 'admin');
INSERT INTO `item_oper_record` VALUES ('2', '135829611', '10', '-24', '1517221654', 'admin');
INSERT INTO `item_oper_record` VALUES ('3', '135829611', '20', '-7', '1517221974', 'admin');
INSERT INTO `item_oper_record` VALUES ('4', '135829611', '30', '-7', '1517222144', 'admin');
INSERT INTO `item_oper_record` VALUES ('5', '135829611', '40', '-5', '1517222274', 'admin');
INSERT INTO `item_oper_record` VALUES ('6', '135829611', '50', '-5', '1517222288', 'admin');
INSERT INTO `item_oper_record` VALUES ('7', '135829611', '60', '-4', '1517222314', 'admin');
INSERT INTO `item_oper_record` VALUES ('8', '135829611', '10', '4', '1517222414', 'admin');
INSERT INTO `item_oper_record` VALUES ('9', '135829611', '10', '4', '1517222420', 'admin');
INSERT INTO `item_oper_record` VALUES ('10', '135829611', '20', '4', '1517222420', 'admin');
INSERT INTO `item_oper_record` VALUES ('11', '135829611', '10', '4', '1517222458', 'admin');
INSERT INTO `item_oper_record` VALUES ('12', '135829611', '20', '4', '1517222459', 'admin');
INSERT INTO `item_oper_record` VALUES ('13', '135829611', '30', '4', '1517222459', 'admin');
INSERT INTO `item_oper_record` VALUES ('14', '135829611', '40', '1', '1517222632', 'admin');
INSERT INTO `item_oper_record` VALUES ('15', '135829611', '40', '2', '1517222638', 'admin');
INSERT INTO `item_oper_record` VALUES ('16', '135829611', '40', '2', '1517222638', 'admin');
INSERT INTO `item_oper_record` VALUES ('17', '135829611', '40', '1', '1517222644', 'admin');
INSERT INTO `item_oper_record` VALUES ('18', '135829611', '40', '1', '1517222645', 'admin');
INSERT INTO `item_oper_record` VALUES ('19', '135829611', '50', '1', '1517222645', 'admin');
INSERT INTO `item_oper_record` VALUES ('20', '135829611', '10', '-2', '1517222749', 'admin');
INSERT INTO `item_oper_record` VALUES ('21', '135829611', '10', '-3', '1517222757', 'admin');
INSERT INTO `item_oper_record` VALUES ('22', '135829611', '40', '3', '1517222757', 'admin');
INSERT INTO `item_oper_record` VALUES ('23', '135829611', '10', '3', '1517222822', 'admin');
INSERT INTO `item_oper_record` VALUES ('24', '135829611', '10', '2', '1517222827', 'admin');
INSERT INTO `item_oper_record` VALUES ('25', '135829611', '30', '2', '1517222828', 'admin');
INSERT INTO `item_oper_record` VALUES ('26', '135829611', '20', '1', '1517224359', 'admin');
INSERT INTO `item_oper_record` VALUES ('27', '135829611', '20', '1', '1517224370', 'admin');
INSERT INTO `item_oper_record` VALUES ('28', '135829611', '50', '1', '1517224370', 'admin');
INSERT INTO `item_oper_record` VALUES ('29', '135829611', '20', '1', '1517224458', 'admin');
INSERT INTO `item_oper_record` VALUES ('30', '135829611', '50', '1', '1517224458', 'admin');
INSERT INTO `item_oper_record` VALUES ('31', '135829611', '60', '1', '1517224458', 'admin');
INSERT INTO `item_oper_record` VALUES ('32', '135829611', '10', '1', '1517224458', 'admin');
INSERT INTO `item_oper_record` VALUES ('33', '135829611', '40', '1', '1517224803', 'admin');
INSERT INTO `item_oper_record` VALUES ('34', '135829611', '40', '1', '1517224809', 'admin');
INSERT INTO `item_oper_record` VALUES ('35', '135829611', '30', '1', '1517224809', 'admin');
INSERT INTO `item_oper_record` VALUES ('36', '135829611', '30', '5', '1517224816', 'admin');
INSERT INTO `item_oper_record` VALUES ('37', '135829611', '40', '5', '1517224816', 'admin');
INSERT INTO `item_oper_record` VALUES ('38', '135829611', '30', '-5', '1517224816', 'admin');
INSERT INTO `item_oper_record` VALUES ('39', '135829611', '40', '5', '1517224826', 'admin');
INSERT INTO `item_oper_record` VALUES ('40', '135829611', '30', '5', '1517224826', 'admin');
INSERT INTO `item_oper_record` VALUES ('41', '135829611', '30', '-5', '1517224826', 'admin');
INSERT INTO `item_oper_record` VALUES ('42', '135829611', '30', '-5', '1517224826', 'admin');
INSERT INTO `item_oper_record` VALUES ('43', '135829611', '40', '1', '1517224849', 'admin');
INSERT INTO `item_oper_record` VALUES ('44', '135829611', '30', '-1', '1517224850', 'admin');
INSERT INTO `item_oper_record` VALUES ('45', '135829611', '30', '1', '1517224850', 'admin');
INSERT INTO `item_oper_record` VALUES ('46', '135829611', '30', '-1', '1517224850', 'admin');
INSERT INTO `item_oper_record` VALUES ('47', '135829611', '30', '-1', '1517224850', 'admin');
INSERT INTO `item_oper_record` VALUES ('48', '135829611', '40', '1', '1517224859', 'admin');
INSERT INTO `item_oper_record` VALUES ('49', '135829611', '30', '1', '1517224859', 'admin');
INSERT INTO `item_oper_record` VALUES ('50', '135829611', '30', '-1', '1517224859', 'admin');
INSERT INTO `item_oper_record` VALUES ('51', '135829611', '30', '1', '1517225117', 'admin');
INSERT INTO `item_oper_record` VALUES ('52', '135829611', '30', '2', '1517225122', 'admin');
INSERT INTO `item_oper_record` VALUES ('53', '135829611', '30', '2', '1517225122', 'admin');
INSERT INTO `item_oper_record` VALUES ('54', '135829611', '30', '1', '1517225129', 'admin');
INSERT INTO `item_oper_record` VALUES ('55', '135829611', '30', '1', '1517225129', 'admin');
INSERT INTO `item_oper_record` VALUES ('56', '135829611', '40', '1', '1517225129', 'admin');
INSERT INTO `item_oper_record` VALUES ('57', '135829611', '30', '-3', '1517225215', 'admin');
INSERT INTO `item_oper_record` VALUES ('58', '135829611', '20', '1', '1517227140', 'admin');
INSERT INTO `item_oper_record` VALUES ('59', '135829611', '70', '1', '1517227140', 'admin');
INSERT INTO `item_oper_record` VALUES ('60', '135829611', '90', '1', '1517227140', 'admin');
INSERT INTO `item_oper_record` VALUES ('61', '135829611', '10', '1', '1517227140', 'admin');
INSERT INTO `item_oper_record` VALUES ('62', '135829611', '20', '1', '1517227140', 'admin');
INSERT INTO `item_oper_record` VALUES ('63', '135829611', '10', '1', '1517227141', 'admin');
INSERT INTO `item_oper_record` VALUES ('64', '135829611', '20', '2', '1517227146', 'admin');
INSERT INTO `item_oper_record` VALUES ('65', '135829611', '70', '2', '1517227146', 'admin');
INSERT INTO `item_oper_record` VALUES ('66', '135829611', '90', '2', '1517227146', 'admin');
INSERT INTO `item_oper_record` VALUES ('67', '135829611', '10', '2', '1517227146', 'admin');
INSERT INTO `item_oper_record` VALUES ('68', '135829611', '20', '2', '1517227147', 'admin');
INSERT INTO `item_oper_record` VALUES ('69', '135829611', '10', '2', '1517227147', 'admin');
INSERT INTO `item_oper_record` VALUES ('70', '135829611', '20', '2', '1517227147', 'admin');
INSERT INTO `item_oper_record` VALUES ('71', '135829611', '10', '1', '1517227243', 'admin');
INSERT INTO `item_oper_record` VALUES ('72', '135829611', '10', '2', '1517227247', 'admin');
INSERT INTO `item_oper_record` VALUES ('73', '135829611', '30', '2', '1517227248', 'admin');
INSERT INTO `item_oper_record` VALUES ('74', '135829611', '10', '1', '1517227501', 'admin');
INSERT INTO `item_oper_record` VALUES ('75', '135829611', '10', '2', '1517227506', 'admin');
INSERT INTO `item_oper_record` VALUES ('76', '135829611', '40', '2', '1517227506', 'admin');
INSERT INTO `item_oper_record` VALUES ('77', '58312338', '100', '10', '1517227712', 'admin');

-- ----------------------------
-- Table structure for platform_water_record
-- ----------------------------
DROP TABLE IF EXISTS `platform_water_record`;
CREATE TABLE `platform_water_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) NOT NULL DEFAULT '0' COMMENT '玩家id',
  `parent_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '上级id',
  `game_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '游戏编码',
  `pump_water` bigint(20) NOT NULL,
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '记录产生时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of platform_water_record
-- ----------------------------
INSERT INTO `platform_water_record` VALUES ('2', '10', '9', 'sss', '20000', '1516329383');
INSERT INTO `platform_water_record` VALUES ('11', '10', '9', 'sss', '20001', '1516330565');
INSERT INTO `platform_water_record` VALUES ('12', '10', '9', 'sss', '20001', '1516330601');
INSERT INTO `platform_water_record` VALUES ('13', '135829611', '7', '20004', '10', '1516427628');
INSERT INTO `platform_water_record` VALUES ('14', '8', '6', '', '100000', '1516330601');
INSERT INTO `platform_water_record` VALUES ('15', '6', '5', '', '100000', '1516330601');
INSERT INTO `platform_water_record` VALUES ('16', '5', '4', '', '100000', '1516330601');
INSERT INTO `platform_water_record` VALUES ('17', '4', '3', '', '100000', '1516330601');
INSERT INTO `platform_water_record` VALUES ('18', '3', '0', '', '100000', '1516330601');
INSERT INTO `platform_water_record` VALUES ('19', '7', '0', '', '100000', '1516330601');
INSERT INTO `platform_water_record` VALUES ('20', '9', '7', '', '100000', '1516330601');
INSERT INTO `platform_water_record` VALUES ('21', '10', '9', '', '100000', '1516330601');
INSERT INTO `platform_water_record` VALUES ('22', '135829611', '0', '20004', '10', '1516431513');
INSERT INTO `platform_water_record` VALUES ('23', '148287374', '0', '20004', '10', '1516431513');
INSERT INTO `platform_water_record` VALUES ('24', '135829611', '0', '20004', '10', '1516431562');
INSERT INTO `platform_water_record` VALUES ('25', '148287374', '0', '20004', '10', '1516431562');
INSERT INTO `platform_water_record` VALUES ('26', '135829611', '0', '20004', '10', '1516431603');
INSERT INTO `platform_water_record` VALUES ('27', '148287374', '0', '20004', '10', '1516431603');
INSERT INTO `platform_water_record` VALUES ('28', '135829611', '0', '20004', '10', '1516431652');
INSERT INTO `platform_water_record` VALUES ('29', '148287374', '0', '20004', '10', '1516431652');
INSERT INTO `platform_water_record` VALUES ('30', '135829611', '0', '20004', '10', '1516431700');
INSERT INTO `platform_water_record` VALUES ('31', '148287374', '0', '20004', '10', '1516431700');
INSERT INTO `platform_water_record` VALUES ('32', '135829611', '0', '20004', '10', '1516431748');
INSERT INTO `platform_water_record` VALUES ('33', '148287374', '0', '20004', '10', '1516431748');
INSERT INTO `platform_water_record` VALUES ('34', '135829611', '0', '20004', '10', '1516431798');
INSERT INTO `platform_water_record` VALUES ('35', '148287374', '0', '20004', '10', '1516431798');
INSERT INTO `platform_water_record` VALUES ('36', '135829611', '0', '20004', '10', '1516431846');
INSERT INTO `platform_water_record` VALUES ('37', '148287374', '0', '20004', '10', '1516431846');
INSERT INTO `platform_water_record` VALUES ('38', '135829611', '5', '10003', '1500', '1516434300');
INSERT INTO `platform_water_record` VALUES ('39', '135829611', '5', '10002', '40000', '1516434421');
INSERT INTO `platform_water_record` VALUES ('40', '148287374', '0', '20004', '10', '1516436035');
INSERT INTO `platform_water_record` VALUES ('41', '207363146', '0', '20004', '10', '1516436035');
INSERT INTO `platform_water_record` VALUES ('42', '207363146', '0', '20004', '400', '1516437440');
INSERT INTO `platform_water_record` VALUES ('43', '207905024', '0', '20004', '400', '1516437440');
INSERT INTO `platform_water_record` VALUES ('44', '207363146', '0', '20004', '400', '1516437488');
INSERT INTO `platform_water_record` VALUES ('45', '207905024', '0', '20004', '400', '1516437488');
INSERT INTO `platform_water_record` VALUES ('46', '207363146', '0', '20004', '400', '1516437537');
INSERT INTO `platform_water_record` VALUES ('47', '207905024', '0', '20004', '400', '1516437537');
INSERT INTO `platform_water_record` VALUES ('48', '207905024', '0', '20004', '400', '1516437596');
INSERT INTO `platform_water_record` VALUES ('49', '207363146', '0', '20004', '400', '1516437596');
INSERT INTO `platform_water_record` VALUES ('50', '207363146', '0', '20004', '400', '1516437646');
INSERT INTO `platform_water_record` VALUES ('51', '207905024', '0', '20004', '400', '1516437646');
INSERT INTO `platform_water_record` VALUES ('52', '207363146', '0', '20004', '400', '1516437694');
INSERT INTO `platform_water_record` VALUES ('53', '207905024', '0', '20004', '400', '1516437694');
INSERT INTO `platform_water_record` VALUES ('54', '207363146', '0', '20004', '400', '1516437742');
INSERT INTO `platform_water_record` VALUES ('55', '207905024', '0', '20004', '400', '1516437742');
INSERT INTO `platform_water_record` VALUES ('56', '207363146', '0', '20004', '400', '1516437792');
INSERT INTO `platform_water_record` VALUES ('57', '207905024', '0', '20004', '400', '1516437792');
INSERT INTO `platform_water_record` VALUES ('58', '207363146', '0', '20004', '400', '1516437840');
INSERT INTO `platform_water_record` VALUES ('59', '207905024', '0', '20004', '400', '1516437840');
INSERT INTO `platform_water_record` VALUES ('60', '207363146', '0', '20004', '400', '1516437840');
INSERT INTO `platform_water_record` VALUES ('61', '207905024', '0', '20004', '400', '1516437840');
INSERT INTO `platform_water_record` VALUES ('62', '207363146', '0', '20004', '400', '1516437889');
INSERT INTO `platform_water_record` VALUES ('63', '207905024', '0', '20004', '400', '1516437889');
INSERT INTO `platform_water_record` VALUES ('64', '207363146', '0', '20004', '400', '1516437938');
INSERT INTO `platform_water_record` VALUES ('65', '207905024', '0', '20004', '400', '1516437938');
INSERT INTO `platform_water_record` VALUES ('66', '207363146', '0', '20004', '400', '1516437987');
INSERT INTO `platform_water_record` VALUES ('67', '207905024', '0', '20004', '400', '1516437987');
INSERT INTO `platform_water_record` VALUES ('68', '207363146', '0', '20004', '400', '1516437987');
INSERT INTO `platform_water_record` VALUES ('69', '207905024', '0', '20004', '400', '1516437987');
INSERT INTO `platform_water_record` VALUES ('70', '207363146', '0', '20004', '10', '1516441244');
INSERT INTO `platform_water_record` VALUES ('71', '135829611', '5', '20004', '10', '1516441244');
INSERT INTO `platform_water_record` VALUES ('72', '207363146', '0', '20004', '10', '1516441285');
INSERT INTO `platform_water_record` VALUES ('73', '135829611', '5', '20004', '10', '1516441285');
INSERT INTO `platform_water_record` VALUES ('74', '207363146', '0', '20004', '10', '1516441334');
INSERT INTO `platform_water_record` VALUES ('75', '135829611', '5', '20004', '10', '1516441335');
INSERT INTO `platform_water_record` VALUES ('76', '135829611', '5', '20004', '10', '1516441525');
INSERT INTO `platform_water_record` VALUES ('77', '207363146', '0', '20004', '10', '1516441525');
INSERT INTO `platform_water_record` VALUES ('78', '135829611', '5', '20004', '10', '1516441557');
INSERT INTO `platform_water_record` VALUES ('79', '207363146', '0', '20004', '10', '1516441557');
INSERT INTO `platform_water_record` VALUES ('80', '135829611', '5', '20004', '10', '1516441605');
INSERT INTO `platform_water_record` VALUES ('81', '207363146', '0', '20004', '10', '1516441605');
INSERT INTO `platform_water_record` VALUES ('82', '207905024', '0', '20004', '10', '1516441605');
INSERT INTO `platform_water_record` VALUES ('83', '135829611', '5', '20004', '10', '1516441659');
INSERT INTO `platform_water_record` VALUES ('84', '207363146', '0', '20004', '10', '1516441659');
INSERT INTO `platform_water_record` VALUES ('85', '207905024', '0', '20004', '10', '1516441659');
INSERT INTO `platform_water_record` VALUES ('86', '135829611', '5', '20004', '10', '1516441718');
INSERT INTO `platform_water_record` VALUES ('87', '207363146', '0', '20004', '10', '1516441718');
INSERT INTO `platform_water_record` VALUES ('88', '207905024', '0', '20004', '10', '1516441718');
INSERT INTO `platform_water_record` VALUES ('89', '135829611', '5', '20004', '10', '1516441774');
INSERT INTO `platform_water_record` VALUES ('90', '207363146', '0', '20004', '10', '1516441774');
INSERT INTO `platform_water_record` VALUES ('91', '207905024', '0', '20004', '10', '1516441774');
INSERT INTO `platform_water_record` VALUES ('92', '207363146', '0', '20004', '10', '1516441816');
INSERT INTO `platform_water_record` VALUES ('93', '135829611', '5', '20004', '10', '1516441816');
INSERT INTO `platform_water_record` VALUES ('94', '207905024', '0', '20004', '10', '1516441816');
INSERT INTO `platform_water_record` VALUES ('95', '135829611', '5', '20004', '10', '1516441869');
INSERT INTO `platform_water_record` VALUES ('96', '207363146', '0', '20004', '10', '1516441869');
INSERT INTO `platform_water_record` VALUES ('97', '207905024', '0', '20004', '10', '1516441869');
INSERT INTO `platform_water_record` VALUES ('98', '135829611', '5', '20004', '10', '1516441910');
INSERT INTO `platform_water_record` VALUES ('99', '207363146', '0', '20004', '10', '1516441910');
INSERT INTO `platform_water_record` VALUES ('100', '135829611', '5', '20004', '10', '1516441910');
INSERT INTO `platform_water_record` VALUES ('101', '207363146', '0', '20004', '10', '1516441910');

-- ----------------------------
-- Table structure for proxy_profit
-- ----------------------------
DROP TABLE IF EXISTS `proxy_profit`;
CREATE TABLE `proxy_profit` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `proxy_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '对应代理库的id',
  `money` float NOT NULL DEFAULT '0' COMMENT '今日盈利',
  `fish_money` float NOT NULL DEFAULT '0' COMMENT '捕鱼平台盈利',
  `start_time` int(11) NOT NULL DEFAULT '0' COMMENT '汇总记录开始时间',
  `end_time` int(11) NOT NULL DEFAULT '0' COMMENT '汇总记录结束时间',
  `create_time` float NOT NULL DEFAULT '0' COMMENT '记录产生时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of proxy_profit
-- ----------------------------
INSERT INTO `proxy_profit` VALUES ('3', '0', '0', '0', '1516636800', '1516723199', '1516780000');

-- ----------------------------
-- Table structure for proxy_profit_record
-- ----------------------------
DROP TABLE IF EXISTS `proxy_profit_record`;
CREATE TABLE `proxy_profit_record` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `proxy_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '代理id',
  `profit` double NOT NULL,
  `fish_profit` double NOT NULL,
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '收益汇总时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of proxy_profit_record
-- ----------------------------

-- ----------------------------
-- Table structure for record_tag
-- ----------------------------
DROP TABLE IF EXISTS `record_tag`;
CREATE TABLE `record_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `start` int(11) NOT NULL DEFAULT '0' COMMENT '记录开始时间截',
  `end` int(11) NOT NULL DEFAULT '0' COMMENT '记录结束时间截',
  `fish_tag` bit(1) NOT NULL DEFAULT b'0' COMMENT '数据收集标记 0：未生成，1：已经生成',
  `platform_tag` bit(1) NOT NULL DEFAULT b'0' COMMENT '平台抽水汇总标记(数据收集)',
  `fish_key_start` bigint(20) NOT NULL DEFAULT '0' COMMENT '汇总记录开始值',
  `fish_key_end` bigint(20) NOT NULL DEFAULT '0' COMMENT '汇总标记结束值',
  `platform_key_start` bigint(20) NOT NULL DEFAULT '0' COMMENT '汇总标记开始值',
  `platform_key_end` bigint(20) NOT NULL DEFAULT '0' COMMENT '汇总标记结束值',
  `fish_create_time` int(11) NOT NULL DEFAULT '0' COMMENT '汇总产生时间',
  `platform_create_time` int(11) NOT NULL DEFAULT '0' COMMENT '汇总产生时间',
  `fish_sum_tag` bit(1) NOT NULL DEFAULT b'0' COMMENT '代理收益生成标记',
  `fish_sum_start` bigint(20) NOT NULL DEFAULT '0' COMMENT '对应捕鱼收益起始值',
  `fish_sum_end` bigint(20) NOT NULL DEFAULT '0' COMMENT '对应捕鱼收益结束值',
  `fish_sum_time` int(11) NOT NULL DEFAULT '0' COMMENT '捕鱼收益汇总时间',
  `platform_sum_tag` bit(1) NOT NULL DEFAULT b'0' COMMENT '平台收益汇总',
  `platform_sum_start` bigint(20) NOT NULL DEFAULT '0' COMMENT '平台收益起始值',
  `platform_sum_end` bigint(20) NOT NULL DEFAULT '0' COMMENT '平台收益结束值',
  `platform_sum_time` int(11) NOT NULL DEFAULT '0' COMMENT '平台收益汇总时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of record_tag
-- ----------------------------
INSERT INTO `record_tag` VALUES ('9', '1516636800', '1516723199', '', '\0', '59', '84', '0', '0', '1516773190', '0', '\0', '0', '0', '0', '\0', '0', '0', '0');

-- ----------------------------
-- Table structure for system_profit
-- ----------------------------
DROP TABLE IF EXISTS `system_profit`;
CREATE TABLE `system_profit` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '收益时间',
  `money` double NOT NULL DEFAULT '0' COMMENT '系统收益',
  `fish_money` double NOT NULL DEFAULT '0' COMMENT '捕鱼场收益',
  `start_time` int(11) NOT NULL DEFAULT '0' COMMENT '汇总起始时间',
  `end_time` int(11) NOT NULL DEFAULT '0' COMMENT '汇总结束时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of system_profit
-- ----------------------------

-- ----------------------------
-- Table structure for third_game
-- ----------------------------
DROP TABLE IF EXISTS `third_game`;
CREATE TABLE `third_game` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `game_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '游戏编码',
  `game_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '游戏名字',
  `table_prefix` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '记录表前缀',
  `rate` int(11) DEFAULT '0' COMMENT '代理分成',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of third_game
-- ----------------------------
INSERT INTO `third_game` VALUES ('1', '101', '悦想捕鱼', 'fish_record_sum_', '40');

-- ----------------------------
-- Table structure for transfer_record
-- ----------------------------
DROP TABLE IF EXISTS `transfer_record`;
CREATE TABLE `transfer_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '订单ID',
  `proxy_id` varchar(255) NOT NULL DEFAULT '' COMMENT '代理标识',
  `money_amount` double NOT NULL DEFAULT '0' COMMENT '提现金额',
  `transfer_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '提现方式',
  `transfer_account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '提现账号',
  `transfer_time` int(11) NOT NULL DEFAULT '0' COMMENT '处理时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '转账备注',
  `oper_user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '操作人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of transfer_record
-- ----------------------------
INSERT INTO `transfer_record` VALUES ('1', '8', '10', '25', '微信转账', 'lisi', '1516351872', '代理要求使用微信', '');
INSERT INTO `transfer_record` VALUES ('2', '7', '20', '130', '支付宝转账', '15104269371', '1516351963', '代理要求使用支付宝', '');
INSERT INTO `transfer_record` VALUES ('3', '6', '15', '280', '支付宝转账', '15904262760', '1516352019', '急速转账', '');
INSERT INTO `transfer_record` VALUES ('4', '5', '14', '250', '无', '无', '1516352539', '代理无理取闹，取消订单', '');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL DEFAULT '0',
  `account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '登录使用的账号名称',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '密码',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `last_login_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '1', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '0', '1517221019');
INSERT INTO `user` VALUES ('2', '1', 'douyanzhao', 'e10adc3949ba59abbe56e057f20f883e', '1516685484', '1516685692');
INSERT INTO `user` VALUES ('3', '2', 'zhangsan', 'e10adc3949ba59abbe56e057f20f883e', '1517043271', '1517043499');

-- ----------------------------
-- Table structure for user_rule
-- ----------------------------
DROP TABLE IF EXISTS `user_rule`;
CREATE TABLE `user_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) NOT NULL DEFAULT '',
  `rule` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_rule
-- ----------------------------
INSERT INTO `user_rule` VALUES ('1', '管理员', '');
INSERT INTO `user_rule` VALUES ('2', '客服', '');
INSERT INTO `user_rule` VALUES ('3', '财务', '');

-- ----------------------------
-- Procedure structure for add_profit_for_proxy
-- ----------------------------
DROP PROCEDURE IF EXISTS `add_profit_for_proxy`;
DELIMITER ;;
CREATE DEFINER=`douyanzhao`@`%` PROCEDURE `add_profit_for_proxy`(in start_time int, in end_time int)
begin
declare i int default 0;
declare maxCnt int default 0;
DROP TABLE IF EXISTS `tmp_proxy_profit`;
create TEMPORARY table tmp_proxy_profit(
`id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `proxy_id` varchar(255) NOT NULL,
  `money` double NOT NULL,
  `fish_money` double not null,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
set @t_sql = concat('insert into tmp_proxy_profit (`proxy_id`, `money`, `fish_money`) select proxy_id, money, fish_money from proxy_profit where start_time=', start_time,
' and end_time=', end_time);
PREPARE stmp from @t_sql;
EXECUTE stmp;
select min(`id`) into i from tmp_proxy_profit;
select max(`id`) into maxCnt from tmp_proxy_profit;
update_loop : loop
if i > maxCnt THEN
     leave update_loop;
end if;
set @exist_tag = 0;
set @money = 0;
set @fish_money=0;
set @proxy_id = 0;
select proxy_id, pump_water into @proxy_id, @money, @fish_money from tmp_proxy_profit where id=i;
select 1, proxy_id into @exist_tag, @proxy_id from h5proxy.user_with_draw where proxy_id = @proxy_id and last_update_time = start_time;
set i = i + 1;
if @exist_tag != 0 THEN
	ITERATE update_loop;
end IF;
update h5proxy.user_with_draw set with_draw = with_draw + @money, fish_with_draw = fish_with_draw + @fish_money, last_update_time = start_time where proxy_id = @proxy_id;
end loop update_loop;
drop table tmp_proxy_profit;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for compute_proxy_frofit
-- ----------------------------
DROP PROCEDURE IF EXISTS `compute_proxy_frofit`;
DELIMITER ;;
CREATE DEFINER=`douyanzhao`@`%` PROCEDURE `compute_proxy_frofit`()
BEGIN

declare d_fish_key_start INT DEFAULT 0;
declare d_fish_key_end INT DEFAULT 0;
declare d_i INT DEFAULT 0;

declare s_member_id INT DEFAULT 0;
declare s_cost_sum FLOAT DEFAULT 0;
declare s_bonus_sum FLOAT DEFAULT 0;

declare s_profit FLOAT DEFAULT 0;

SELECT fish_key_start,fish_key_end into d_fish_key_start, d_fish_key_end from game_record.record_tag where id=4; 
select d_fish_key_start, d_fish_key_end;

set d_i = d_fish_key_start; 
while d_i <= d_fish_key_end do  
set s_member_id = "";
set s_cost_sum = 0;
set s_bonus_sum = 0;
SELECT member_id, cost_sum,bonus_sum into s_member_id, s_cost_sum, s_bonus_sum from game_record.fish_record_sum_201801 where id = d_i;
set d_i = d_i + 1;

set s_profit = s_bonus_sum - s_cost_sum;
select s_profit;




end while;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for save_fish_game_record
-- ----------------------------
DROP PROCEDURE IF EXISTS `save_fish_game_record`;
DELIMITER ;;
CREATE DEFINER=`douyanzhao`@`%` PROCEDURE `save_fish_game_record`(IN memeber_id varchar(255), IN scene_sn bigint, IN cost double, IN bonus double, IN start_time varchar(255), IN end_time varchar(255), IN version_key bigint, IN version_key_end bigint, IN game_type int)
BEGIN
	set @date_str = DATE_FORMAT(now(),'%Y%m');
  set @table_name = concat('fish_record_', @date_str);
  set @sql_create = concat('create table if not exists ', @table_name, '(id bigint(20) NOT NULL AUTO_INCREMENT, ', 
'member_id varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT \'\' COMMENT \'平台账号\',',
'scene_sn bigint(20) DEFAULT \'0\' COMMENT \'场景编号\',',
'cost double DEFAULT \'0\' COMMENT \'消耗金币\',',
'bonus double DEFAULT \'0\' COMMENT \'奖励金币\',',
'start varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT \'\' COMMENT \'开始时间\',',
'end varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT \'\' COMMENT \'结束时间\',',
'version_key bigint(20) DEFAULT \'0\' COMMENT \'版本密钥key\',',
'version_key_end bigint(20) DEFAULT \'0\' COMMENT \'版本密钥结束key\',',
'game_type int(11) DEFAULT \'0\' COMMENT \'1为0.1~1元场，2为1~10元场，3为10~100元场\',',
'  PRIMARY KEY (id)) ENGINE=InnoDB DEFAULT CHARSET=utf8');
prepare stmt from @sql_create;  
execute stmt;  
deallocate prepare stmt; 
set @cur_time=UNIX_TIMESTAMP();
set @add_data_sql = concat('insert into ', @table_name, '(member_id, scene_sn, cost, bonus, start, end, version_key, version_key_end, game_type) values (\'', 
memeber_id, '\',', scene_sn, + ',', cost, ',', bonus, ',\'', start_time, '\',\'', end_time, '\',', version_key, ',', version_key_end, ',', game_type, ')');
prepare stmt from @add_data_sql;  
execute stmt;  
deallocate prepare stmt; 

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for save_fish_game_sum_record
-- ----------------------------
DROP PROCEDURE IF EXISTS `save_fish_game_sum_record`;
DELIMITER ;;
CREATE DEFINER=`douyanzhao`@`%` PROCEDURE `save_fish_game_sum_record`(IN memeber_id varchar(255), IN account_id int, IN cost_sum float, IN bonus_sum float)
BEGIN
	set @date_str = DATE_FORMAT(now(),'%Y%m');
  set @table_name = concat('fish_record_sum_', @date_str);
  set @sql_create = concat('create table if not exists ', @table_name, '(id bigint(20) NOT NULL AUTO_INCREMENT, ', 
'member_id varchar(255) DEFAULT \'\' COMMENT \'对应unionid\',',
'account_id varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT \'\' COMMENT \'对方账号id\',',
'cost_sum float DEFAULT \'0\' COMMENT \'消耗总额\',',
'bonus_sum float DEFAULT \'0\' COMMENT \'收益总额\',',
'create_time int(11) NOT NULL DEFAULT \'0\' COMMENT \'记录产生时间\',',
'  PRIMARY KEY (id)) ENGINE=InnoDB DEFAULT CHARSET=utf8');
prepare stmt from @sql_create;  
execute stmt;  
deallocate prepare stmt; 
set @cur_time=UNIX_TIMESTAMP();
set @add_data_sql = concat('insert into ', @table_name, '(member_id, account_id, cost_sum, bonus_sum, create_time) values (\'', 
memeber_id, '\',', account_id, + ',', cost_sum, ',', bonus_sum, ',', @cur_time, ')');
prepare stmt from @add_data_sql;  
execute stmt;  
deallocate prepare stmt; 
select LAST_INSERT_ID() as id;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for save_game_record
-- ----------------------------
DROP PROCEDURE IF EXISTS `save_game_record`;
DELIMITER ;;
CREATE DEFINER=`douyanzhao`@`%` PROCEDURE `save_game_record`(IN pid bigint, IN unionid varchar(255), IN water bigint)
BEGIN
	set @date_str = DATE_FORMAT(now(),'%Y%m');
  set @table_name = concat('game_record_', @date_str);
  set @sql_create = concat('create table if not exists ', @table_name, '(id bigint(20) NOT NULL AUTO_INCREMENT,  pid bigint(20) NOT NULL DEFAULT \'0\' COMMENT ',
 '\'用户平台id\',',  'unionid varchar(255)CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT \'\' COMMENT \'用户唯一id\',',
'  water bigint(20) NOT NULL DEFAULT \'0\' COMMENT \'抽水值\',  create_time int(11) NOT NULL DEFAULT \'0\' COMMENT \'产生时间\',',
'  PRIMARY KEY (id)) ENGINE=InnoDB DEFAULT CHARSET=utf8');
prepare stmt from @sql_create;  
execute stmt;  
deallocate prepare stmt; 
set @cur_time=UNIX_TIMESTAMP();
set @add_data_sql = concat('insert into ', @table_name, '(pid, unionid, water, create_time) values (', pid, ',\'', unionid, + '\',', water, ',', @cur_time, ')');
prepare stmt from @add_data_sql;  
execute stmt;  
deallocate prepare stmt; 
select LAST_INSERT_ID() as id;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for save_water_record
-- ----------------------------
DROP PROCEDURE IF EXISTS `save_water_record`;
DELIMITER ;;
CREATE DEFINER=`douyanzhao`@`%` PROCEDURE `save_water_record`(IN pid bigint, IN spreader bigint, IN game_code varchar(255), IN pump_water bigint)
BEGIN
insert into platform_water_record (pid, parent_id, game_code, pump_water, create_time) values (pid, spreader, game_code, pump_water,UNIX_TIMESTAMP());
select LAST_INSERT_ID() as id;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for sum_fish_profit
-- ----------------------------
DROP PROCEDURE IF EXISTS `sum_fish_profit`;
DELIMITER ;;
CREATE DEFINER=`douyanzhao`@`%` PROCEDURE `sum_fish_profit`(IN start_record bigint, IN end_record bigint)
label:BEGIN
DECLARE maxCnt INT DEFAULT 0;  
DECLARE i INT DEFAULT 0;  
declare t_account varchar(255) default '';
declare t_pid int default 0;
declare t_water int default 0;
declare t_parent int default 0;
declare t_user_type int default 0;
declare t_parent_type int default 0;
declare t_parent_pid int default 0;
declare t_system_profit double default 0;
declare t_proxy_profit double default 0;
declare t_system_first_rate float default 0;
declare t_system_second_rate float default 0;
declare t_system_third_rate float default 0;
declare t_gold_rate int default 0;
declare t_fish_key_start bigint default 0;
declare t_fish_key_end bigint default 0;
declare t_error_tag int default 0;
declare t_banker_games varchar(255) default '';
set t_gold_rate = 1;

-- 读取分成配置
 select CONVERT(value,DECIMAL) / 100 into t_system_first_rate from config where name='fish_first';
 select CONVERT(value,DECIMAL) / 100 into t_system_second_rate from config where name='fish_second';
 select CONVERT(value,DECIMAL) / 100 into t_system_third_rate from config where name = 'fish_third';

set @exist_tag = 0;
set @fish_tag = 0;
select 1, fish_tag, fish_key_start, fish_key_end into @exist_tag, @fish_tag, t_fish_key_start, t_fish_key_end from record_tag where start = start_record and end = end_record;
if @exist_tag = 0 then
select 101 as code; -- 记录未生成
leave label;
end if;
-- 平台数据汇总
DROP TABLE IF EXISTS `general_game_record_tmp`;
CREATE TEMPORARY TABLE `general_game_record_tmp` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `account` varchar(255) NOT NULL,
  `pump_water` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `user_tmp`;
CREATE TEMPORARY TABLE `user_tmp`(
`pid` bigint(20) not null,
`parent_id` bigint(20) not null,
`user_type` int(10) not null
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
set @target_table = concat('fish_record_sum_', DATE_FORMAT(FROM_UNIXTIME(start_record),'%Y%m'));
set @t_sql = concat('insert into general_game_record_tmp (`account`, `pump_water`) select member_id, (cost_sum - bonus_sum) as pump_water from ', @target_table,
' where id >=', t_fish_key_start, ' and id <= ', t_fish_key_end);
PREPARE stmp from @t_sql;
EXECUTE stmp;
-- set @t_sql = 'insert into user_tmp(`pid`, `parent_id`,`user_type`) select pid, parent_id, user_type from h5proxy.user';
-- PREPARE stmp from @t_sql;
-- EXECUTE stmp;
select min(`id`) into i from general_game_record_tmp;
select max(`id`) into maxCnt from general_game_record_tmp;
visit_loop : loop
if i > maxCnt THEN
     leave visit_loop;
end if;
-- 一级代理收益
set @exist_tag = 0;
set @user_id = 0;
select account, pump_water into t_account, t_water from general_game_record_tmp where id=i;
select 1, pid, parent_id, user_type,id into @exist_tag, t_pid, t_parent, t_user_type, @user_id from h5proxy.user where account=t_account;
set i = i + 1;
if @exist_tag = 0 THEN
    -- select 102 as code, t_account as account;-- 账号未找到
    set t_error_tag = 101;
    iterate visit_loop;
end if;
set @delta = t_water * (1 - t_system_first_rate - t_system_second_rate - t_system_third_rate);
set t_system_profit = t_system_profit + @delta;
-- 玩家是代理
if t_user_type <> 4 then
    set @exist_tag = 0;
    select 1, banker_games into @exist_tag, t_banker_games from h5proxy.user_extra_info where user_id = @user_id;
    if @exist_tag = 0 or FIND_IN_SET('101',t_banker_games) = 0 THEN
			set t_system_profit = t_system_profit + t_water;
      ITERATE visit_loop;
    end if;
    -- 个人收益
		set @exist_tag = 0;
    set t_proxy_profit = 0;
    set @idx = 0;
    select id, 1, fish_money into @idx, @exist_tag, t_proxy_profit from proxy_profit where proxy_id = t_pid and start_time = start_record and end_time = end_record;
    if @exist_tag = 0 then
        insert into proxy_profit (proxy_id, start_time, end_time, create_time) value(t_pid, start_record, end_record, UNIX_TIMESTAMP());
        select LAST_INSERT_ID() into @idx;
    end if;
    set @delta = (t_water / t_gold_rate) * t_system_first_rate;
    set t_proxy_profit = t_proxy_profit + @delta;
    update proxy_profit set fish_money = t_proxy_profit where id=@idx;
    insert into h5proxy.spread_fee(user_id, proxy_id, type, money, create_time) values (t_pid, t_pid, 1, @delta, start_record);
		-- 上级代理收益
    -- 无上级
    if t_parent = 0 then
        set @delta = t_water * (t_system_second_rate + t_system_third_rate);
        set t_system_profit = t_system_profit + @delta;
	      iterate visit_loop;
    else
        select id, pid, user_type,parent_id into @user_id, t_parent_pid, t_parent_type, t_parent from h5proxy.user where pid = t_parent;
        set @exist_tag = 0;
				select 1, banker_games into @exist_tag, t_banker_games from h5proxy.user_extra_info where user_id = @user_id;
        -- 上级用户是玩家
        if t_parent_type = 4 or @exist_tag = 0 or FIND_IN_SET('101',t_banker_games) = 0 then
        -- 如果玩家本身是代理，上级用户不会是玩家， 给此玩家授权的人自动成为他的代理
						set @delta = t_water * (t_system_second_rate + t_system_third_rate);
            set t_system_profit = t_system_profit + @delta;
            iterate visit_loop;
        ELSE
            set @exist_tag = 0;
						set t_proxy_profit = 0;
						set @idx = 0;
						select id, 1, fish_money into @idx, @exist_tag, t_proxy_profit from proxy_profit where proxy_id = t_parent_pid and start_time = start_record and end_time = end_record;
						if @exist_tag = 0 then
								insert into proxy_profit (proxy_id, start_time, end_time, create_time) value(t_parent_pid, start_record, end_record, UNIX_TIMESTAMP());
								select LAST_INSERT_ID() into @idx;
						end if;
            set @delta = (t_water / t_gold_rate) * t_system_second_rate;
						set t_proxy_profit = t_proxy_profit + @delta;
						update proxy_profit set fish_money = t_proxy_profit where id=@idx;
            insert into h5proxy.spread_fee(user_id, proxy_id, type, money, create_time) values (t_pid, t_parent_pid, 1, @delta, start_record);
        end if;
        -- 上上级
				if t_parent = 0 then
            set @delta = t_water * t_system_third_rate;
            set t_system_profit = t_system_profit + @delta;
	          iterate visit_loop;
        end if;
        select id, pid, user_type, parent_id into @user_id, t_parent_pid, t_parent_type, t_parent from h5proxy.user where pid = t_parent;
				set @exist_tag = 0;
				select 1, banker_games into @exist_tag, t_banker_games from h5proxy.user_extra_info where user_id = @user_id;
        -- 上级用户是玩家
        if t_parent_type = 4 or @exist_tag = 0 or FIND_IN_SET('101',t_banker_games) = 0 then
        -- 如果玩家本身是代理，上级用户不会是玩家， 给此玩家授权的人自动成为他的代理
						set @delta = t_water * t_system_third_rate;
						set t_system_profit = t_system_profit + @delta;
	          iterate visit_loop;
        ELSE
            set @exist_tag = 0;
						set t_proxy_profit = 0;
						set @idx = 0;
						select id, 1, fish_money into @idx, @exist_tag, t_proxy_profit from proxy_profit where proxy_id = t_parent_pid and start_time = start_record and end_time = end_record;
						if @exist_tag = 0 then
								insert into proxy_profit (proxy_id, start_time, end_time, create_time) value(t_parent_pid, start_record, end_record, UNIX_TIMESTAMP());
								select LAST_INSERT_ID() into @idx;
						end if;
						set @delta = (t_water / t_gold_rate) * t_system_third_rate;
						set t_proxy_profit = t_proxy_profit + @delta;
						update proxy_profit set fish_money = t_proxy_profit where id=@idx;
						insert into h5proxy.spread_fee(user_id, proxy_id, type, money, create_time) values (t_pid, t_parent_pid, 1, @delta, start_record);
        end if;
    end if;
else
    if t_parent = 0 then
				set @delta = t_water * (t_system_first_rate + t_system_second_rate + t_system_third_rate);
        set t_system_profit = t_system_profit + @delta;
	      iterate visit_loop;
    end if;
    -- 一级代理收益
    select id, pid, user_type, parent_id into @user_id, t_parent_pid, t_parent_type, t_parent from h5proxy.user where pid = t_parent;
    set @exist_tag = 0;
		select 1, banker_games into @exist_tag, t_banker_games from h5proxy.user_extra_info where user_id = @user_id;
    if t_parent_type = 4 or @exist_tag = 0 or FIND_IN_SET('101',t_banker_games) = 0 then
				set @delta = t_water * (t_system_first_rate + t_system_second_rate + t_system_third_rate);
        set t_system_profit = t_system_profit + @delta;
        iterate visit_loop;
    else
        set @exist_tag = 0;
				set t_proxy_profit = 0;
				set @idx = 0;
				select id, 1, fish_money into @idx, @exist_tag, t_proxy_profit from proxy_profit where proxy_id = t_parent_pid and start_time = start_record and end_time = end_record;
				if @exist_tag = 0 then
						insert into proxy_profit (proxy_id, start_time, end_time, create_time) value(t_parent_pid, start_record, end_record, UNIX_TIMESTAMP());
						select LAST_INSERT_ID() into @idx;
				end if;
				set t_proxy_profit = t_proxy_profit + (t_water / t_gold_rate) * t_system_first_rate;
				update proxy_profit set fish_money = t_proxy_profit where id=@idx;
    end if;
    -- 二级代理收益
    if t_parent = 0 then
				set @delta = t_water * (t_system_second_rate + t_system_third_rate);
        set t_system_profit = t_system_profit + @delta;
	      iterate visit_loop;
    end if;
    select id, pid, user_type, parent_id into @user_id, t_parent_pid, t_parent_type, t_parent from h5proxy.user where pid = t_parent;
		set @exist_tag = 0;
		select 1, banker_games into @exist_tag, t_banker_games from h5proxy.user_extra_info where user_id = @user_id;
    if t_parent_type = 4 or @exist_tag = 0 or FIND_IN_SET('101',t_banker_games) = 0 then
				set @delta = t_water * (t_system_second_rate + t_system_third_rate);
        set t_system_profit = t_system_profit + @delta;
        iterate visit_loop;
    else
        set @exist_tag = 0;
				set t_proxy_profit = 0;
				set @idx = 0;
				select id, 1, fish_money into @idx, @exist_tag, t_proxy_profit from proxy_profit where proxy_id = t_parent_pid and start_time = start_record and end_time = end_record;
				if @exist_tag = 0 then
						insert into proxy_profit (proxy_id, start_time, end_time, create_time) value(t_parent_pid, start_record, end_record, UNIX_TIMESTAMP());
						select LAST_INSERT_ID() into @idx;
				end if;
				set t_proxy_profit = t_proxy_profit + (t_water / t_gold_rate) * t_system_second_rate;
				update proxy_profit set fish_money = t_proxy_profit where id=@idx;
    end if;
    if t_parent = 0 then
				set @delta = t_water * t_system_third_rate;
        set t_system_profit = t_system_profit + @delta;
	      iterate visit_loop;
    end if;
    -- 三级代理收益
    select id, pid, user_type, parent_id into @user_id, t_parent_pid, t_parent_type, t_parent from h5proxy.user where pid = t_parent;
		set @exist_tag = 0;
		select 1, banker_games into @exist_tag, t_banker_games from h5proxy.user_extra_info where user_id = @user_id;
    if t_parent_type = 4 or @exist_tag = 0 or FIND_IN_SET('101',t_banker_games) = 0 then
				set @delta = t_water * t_system_third_rate;
        set t_system_profit = t_system_profit + @delta;
        iterate visit_loop;
    else
        set @exist_tag = 0;
				set t_proxy_profit = 0;
				set @idx = 0;
				select id, 1, fish_money into @idx, @exist_tag, t_proxy_profit from proxy_profit where proxy_id = t_parent_pid and start_time = start_record and end_time = end_record;
				if @exist_tag = 0 then
						insert into proxy_profit (proxy_id, start_time, end_time, create_time) value(t_parent_pid, start_record, end_record, UNIX_TIMESTAMP());
						select LAST_INSERT_ID() into @idx;
				end if;
				set t_proxy_profit = t_proxy_profit + (t_water / t_gold_rate) * t_system_third_rate;
				update proxy_profit set fish_money = t_proxy_profit where id=@idx;
    end if;
end if;
END LOOP visit_loop;
set @exist_tag = 0;
set @old_money = 0;
set @idx = 0;
select id, 1, fish_money into @idx, @exist_tag, @old_money from system_profit where start_time = start_record and end_time = end_record;
if @exist_tag = 0 then
    set @money = t_system_profit;
    insert into system_profit (create_time, fish_money, start_time, end_time) value(UNIX_TIMESTAMP(), @money, start_record, end_record);
else
    set @money = @old_money + t_system_profit;
    update system_profit set fish_money = @money where id=@idx;
end if;
drop table general_game_record_tmp;
drop table user_tmp;
update record_tag set fish_sum_tag = TRUE, fish_sum_start = start_record, fish_sum_end = end_record, fish_sum_time = UNIX_TIMESTAMP() where start=start_record and end = end_record;

select 0 as code; 
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for sum_platform_profit
-- ----------------------------
DROP PROCEDURE IF EXISTS `sum_platform_profit`;
DELIMITER ;;
CREATE DEFINER=`douyanzhao`@`%` PROCEDURE `sum_platform_profit`(IN start_record bigint, IN end_record bigint)
label:BEGIN
DECLARE maxCnt INT DEFAULT 0;  
DECLARE i INT DEFAULT 0;  
declare t_pid int default 0;
declare t_water int default 0;
declare t_parent int default 0;
declare t_user_type int default 0;
declare t_parent_type int default 0;
declare t_parent_pid int default 0;
declare t_system_profit double default 0;
declare t_proxy_profit double default 0;
declare t_system_first_rate float default 0;
declare t_system_second_rate float default 0;
declare t_system_third_rate float default 0;
declare t_gold_rate int default 0;
declare t_platform_key_start bigint default 0;
declare t_platform_key_end bigint default 0;
set t_gold_rate = 10000;

-- 读取分成配置
 select CONVERT(value,DECIMAL) / 100 into t_system_first_rate from config where name='system_first';
 select CONVERT(value,DECIMAL) / 100 into t_system_second_rate from config where name='system_second';
 select CONVERT(value,DECIMAL) / 100 into t_system_third_rate from config where name = 'system_third';


-- 平台数据汇总
DROP TABLE IF EXISTS `general_game_record_tmp`;
CREATE TEMPORARY TABLE `general_game_record_tmp` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) NOT NULL,
  `pump_water` bigint(20) NOT NULL,
  `parent_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `user_tmp`;
CREATE TEMPORARY TABLE `user_tmp`(
`pid` bigint(20) not null,
`parent_id` bigint(20) not null,
`user_type` int(10) not null
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

set @t_sql = concat('insert into general_game_record_tmp (`pid`, `pump_water`, `parent_id`) select pid, sum(pump_water) as pump_water, parent_id from platform_water_record',
' where create_time >=', start_record, ' and create_time <= ', end_record, ' group by pid');
PREPARE stmp from @t_sql;
EXECUTE stmp;
-- set @t_sql = 'insert into user_tmp(`pid`, `parent_id`,`user_type`) select pid, parent_id, user_type from h5proxy.user';
-- PREPARE stmp from @t_sql;
-- EXECUTE stmp;
select min(`id`) into i from general_game_record_tmp;
select max(`id`) into maxCnt from general_game_record_tmp;
visit_loop : loop
if i > maxCnt THEN
     leave visit_loop;
end if;
-- 一级代理收益
set @exist_tag = 0;
select pid, pump_water into t_pid, t_water from general_game_record_tmp where id=i;
 select 1, parent_id, user_type into @exist_tag, t_parent, t_user_type from h5proxy.user where pid=t_pid;
set i = i + 1;
if @exist_tag = 0 THEN
-- select 102 as code, t_pid as pid;
ITERATE visit_loop;
end if;
set @delta = t_water * (1 - t_system_first_rate - t_system_second_rate - t_system_third_rate);
set t_system_profit = t_system_profit + @delta;
-- 玩家是代理
if t_user_type <> 4 then
    -- 个人收益
		set @exist_tag = 0;
    set t_proxy_profit = 0;
    set @idx = 0;
    select id, 1, money into @idx, @exist_tag, t_proxy_profit from proxy_profit where proxy_id = t_pid and start_time = start_record and end_time = end_record;
    if @exist_tag = 0 then
        insert into proxy_profit (proxy_id, start_time, end_time, create_time) value(t_pid, start_record, end_record, UNIX_TIMESTAMP());
        select LAST_INSERT_ID() into @idx;
    end if;
    set @delta = (t_water / t_gold_rate) * t_system_first_rate;
    set t_proxy_profit = t_proxy_profit + @delta;
    update proxy_profit set money = t_proxy_profit where id=@idx;
    insert into h5proxy.spread_fee(user_id, proxy_id, type, money, create_time) values (t_pid, t_pid, 0, @delta, start_record);
		-- 上级代理收益
    -- 无上级
    if t_parent = 0 then
        set @delta = t_water * (t_system_second_rate + t_system_third_rate);
        set t_system_profit = t_system_profit + @delta;
	      iterate visit_loop;
    else
        select pid, user_type,parent_id into t_parent_pid, t_parent_type, t_parent from h5proxy.user where pid = t_parent;
        -- 上级用户是玩家
        if t_parent_type = 4 then
        -- 如果玩家本身是代理，上级用户不会是玩家， 给此玩家授权的人自动成为他的代理
						set @delta = t_water * (t_system_second_rate + t_system_third_rate);
            set t_system_profit = t_system_profit + @delta;
            iterate visit_loop;
        ELSE
            set @exist_tag = 0;
						set t_proxy_profit = 0;
						set @idx = 0;
						select id, 1, money into @idx, @exist_tag, t_proxy_profit from proxy_profit where proxy_id = t_parent_pid and start_time = start_record and end_time = end_record;
						if @exist_tag = 0 then
								insert into proxy_profit (proxy_id, start_time, end_time, create_time) value(t_parent_pid, start_record, end_record, UNIX_TIMESTAMP());
								select LAST_INSERT_ID() into @idx;
						end if;
            set @delta = (t_water / t_gold_rate) * t_system_second_rate;
						set t_proxy_profit = t_proxy_profit + @delta;
						update proxy_profit set money = t_proxy_profit where id=@idx;
            insert into h5proxy.spread_fee(user_id, proxy_id, type, money, create_time) values (t_pid, t_parent_pid, 0, @delta, start_record);
        end if;
        -- 上上级
				if t_parent = 0 then
            set @delta = t_water * t_system_third_rate;
            set t_system_profit = t_system_profit + @delta;
	          iterate visit_loop;
        end if;
        select pid, user_type, parent_id into t_parent_pid, t_parent_type, t_parent from h5proxy.user where pid = t_parent;
        -- 上级用户是玩家
        if t_parent_type = 4 then
        -- 如果玩家本身是代理，上级用户不会是玩家， 给此玩家授权的人自动成为他的代理
						set @delta = t_water * t_system_third_rate;
						set t_system_profit = t_system_profit + @delta;
	          iterate visit_loop;
        ELSE
            set @exist_tag = 0;
						set t_proxy_profit = 0;
						set @idx = 0;
						select id, 1, money into @idx, @exist_tag, t_proxy_profit from proxy_profit where proxy_id = t_parent_pid and start_time = start_record and end_time = end_record;
						if @exist_tag = 0 then
								insert into proxy_profit (proxy_id, start_time, end_time, create_time) value(t_parent_pid, start_record, end_record, UNIX_TIMESTAMP());
								select LAST_INSERT_ID() into @idx;
						end if;
						set @delta = (t_water / t_gold_rate) * t_system_third_rate;
						set t_proxy_profit = t_proxy_profit + @delta;
						update proxy_profit set money = t_proxy_profit where id=@idx;
						insert into h5proxy.spread_fee(user_id, proxy_id, type, money, create_time) values (t_pid, t_parent_pid, 0, @delta, start_record);
        end if;
    end if;
else
    if t_parent = 0 then
				set @delta = t_water * (t_system_first_rate + t_system_second_rate + t_system_third_rate);
        set t_system_profit = t_system_profit + @delta;
	      iterate visit_loop;
    end if;
    -- 一级代理收益
    select pid, user_type, parent_id into t_parent_pid, t_parent_type, t_parent from h5proxy.user where pid = t_parent;
    if t_parent_type = 4 then
				set @delta = t_water * (t_system_first_rate + t_system_second_rate + t_system_third_rate);
        set t_system_profit = t_system_profit + @delta;
        iterate visit_loop;
    else
        set @exist_tag = 0;
				set t_proxy_profit = 0;
				set @idx = 0;
				select id, 1, money into @idx, @exist_tag, t_proxy_profit from proxy_profit where proxy_id = t_parent_pid and start_time = start_record and end_time = end_record;
				if @exist_tag = 0 then
						insert into proxy_profit (proxy_id, start_time, end_time, create_time) value(t_parent_pid, start_record, end_record, UNIX_TIMESTAMP());
						select LAST_INSERT_ID() into @idx;
				end if;
				set t_proxy_profit = t_proxy_profit + (t_water / t_gold_rate) * t_system_first_rate;
				update proxy_profit set money = t_proxy_profit where id=@idx;
    end if;
    -- 二级代理收益
    if t_parent = 0 then
				set @delta = t_water * (t_system_second_rate + t_system_third_rate);
        set t_system_profit = t_system_profit + @delta;
	      iterate visit_loop;
    end if;
    select pid, user_type, parent_id into t_parent_pid, t_parent_type, t_parent from h5proxy.user where pid = t_parent;
    if t_parent_type = 4 then
				set @delta = t_water * (t_system_second_rate + t_system_third_rate);
        set t_system_profit = t_system_profit + @delta;
        iterate visit_loop;
    else
        set @exist_tag = 0;
				set t_proxy_profit = 0;
				set @idx = 0;
				select id, 1, money into @idx, @exist_tag, t_proxy_profit from proxy_profit where proxy_id = t_parent_pid and start_time = start_record and end_time = end_record;
				if @exist_tag = 0 then
						insert into proxy_profit (proxy_id, start_time, end_time, create_time) value(t_parent_pid, start_record, end_record, UNIX_TIMESTAMP());
						select LAST_INSERT_ID() into @idx;
				end if;
				set t_proxy_profit = t_proxy_profit + (t_water / t_gold_rate) * t_system_second_rate;
				update proxy_profit set money = t_proxy_profit where id=@idx;
    end if;
    if t_parent = 0 then
				set @delta = t_water * t_system_third_rate;
        set t_system_profit = t_system_profit + @delta;
	      iterate visit_loop;
    end if;
    -- 三级代理收益
    select pid, user_type, parent_id into t_parent_pid, t_parent_type, t_parent from h5proxy.user where pid = t_parent;
    if t_parent_type = 4 then
				set @delta = t_water * t_system_third_rate;
        set t_system_profit = t_system_profit + @delta;
        iterate visit_loop;
    else
        set @exist_tag = 0;
				set t_proxy_profit = 0;
				set @idx = 0;
				select id, 1, money into @idx, @exist_tag, t_proxy_profit from proxy_profit where proxy_id = t_parent_pid and start_time = start_record and end_time = end_record;
				if @exist_tag = 0 then
						insert into proxy_profit (proxy_id, start_time, end_time, create_time) value(t_parent_pid, start_record, end_record, UNIX_TIMESTAMP());
						select LAST_INSERT_ID() into @idx;
				end if;
				set t_proxy_profit = t_proxy_profit + (t_water / t_gold_rate) * t_system_third_rate;
				update proxy_profit set money = t_proxy_profit where id=@idx;
    end if;
end if;
END LOOP visit_loop;
set @exist_tag = 0;
set @old_money = 0;
set @idx = 0;
select id, 1, money into @idx, @exist_tag, @old_money from system_profit where start_time = start_record and end_time = end_record;
if @exist_tag = 0 then
    set @money = t_system_profit / t_gold_rate;
    insert into system_profit (create_time, money, start_time, end_time) value(UNIX_TIMESTAMP(), @money, start_record, end_record);
else
    set @money = @old_money + (t_system_profit / t_gold_rate);
    update system_profit set money = @money where id=@idx;
end if;
drop table general_game_record_tmp;
drop table user_tmp;
update record_tag set platform_sum_tag = TRUE, platform_sum_start = start_record, platform_sum_end = end_record, platform_sum_time = UNIX_TIMESTAMP() where start=start_record and end = end_record;

select 0 as code;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for sum_platform_profit_internal
-- ----------------------------
DROP PROCEDURE IF EXISTS `sum_platform_profit_internal`;
DELIMITER ;;
CREATE DEFINER=`douyanzhao`@`%` PROCEDURE `sum_platform_profit_internal`(IN start_record bigint, IN end_record bigint)
BEGIN
DECLARE maxCnt INT DEFAULT 0;  
DECLARE i INT DEFAULT 0;  
declare t_pid int default 0;
declare t_water int default 0;
declare t_parent int default 0;
declare t_user_type int default 0;
declare t_parent_type int default 0;
declare t_parent_pid int default 0;
declare t_system_profit double default 0;
declare t_proxy_profit double default 0;
declare t_system_first_rate float default 0;
declare t_system_second_rate float default 0;
declare t_system_third_rate float default 0;
declare t_gold_rate int default 0;
set t_gold_rate = 10000;

-- 读取分成配置
 select CONVERT(value,DECIMAL) / 100 into t_system_first_rate from config where name='system_first';
 select CONVERT(value,DECIMAL) / 100 into t_system_second_rate from config where name='system_second';
 select CONVERT(value,DECIMAL) / 100 into t_system_third_rate from config where name = 'system_third';


-- 平台数据汇总
DROP TABLE IF EXISTS `general_game_record_tmp`;
CREATE TEMPORARY TABLE `general_game_record_tmp` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) NOT NULL,
  `pump_water` bigint(20) NOT NULL,
  `parent_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

set @t_sql = concat('insert into general_game_record_tmp (`pid`, `pump_water`, `parent_id`) select pid, sum(pump_water) as pump_water, parent_id from platform_water_record',
' where create_time >=', start_record, ' and create_time <= ', end_record, ' group by pid');
PREPARE stmp from @t_sql;
EXECUTE stmp;
select min(`id`) into i from general_game_record_tmp;
select max(`id`) into maxCnt from general_game_record_tmp;
visit_loop : loop
if i > maxCnt THEN
     leave visit_loop;
end if;
-- 一级代理收益
select pid, pump_water into t_pid, t_water from general_game_record_tmp where id=i;
 select parent_id, user_type into t_parent, t_user_type from user where pid=t_pid;
set @delta = t_water * (1 - t_system_first_rate - t_system_second_rate - t_system_third_rate);
	set t_system_profit = t_system_profit + @delta;
set i = i + 1;
-- 玩家是代理
if t_user_type <> 4 then
    -- 个人收益
		set @exist_tag = 0;
    set t_proxy_profit = 0;
    set @idx = 0;
    select id, 1, money into @idx, @exist_tag, t_proxy_profit from proxy_profit where proxy_id = t_pid and start_time = start_record and end_time = end_record;
    if @exist_tag = 0 then
        insert into proxy_profit (proxy_id, start_time, end_time, create_time) value(t_pid, start_record, end_record, UNIX_TIMESTAMP());
        select LAST_INSERT_ID() into @idx;
    end if;
    set t_proxy_profit = t_proxy_profit + (t_water / t_gold_rate) * t_system_first_rate;
    update proxy_profit set money = t_proxy_profit where id=@idx;
		-- 上级代理收益
    -- 无上级
    if t_parent = 0 then
        set @delta = t_water * (t_system_second_rate + t_system_third_rate);
        set t_system_profit = t_system_profit + @delta;
	      iterate visit_loop;
    else
        select pid, user_type,parent_id into t_parent_pid, t_parent_type, t_parent from user where pid = t_parent;
        -- 上级用户是玩家
        if t_parent_type = 4 then
        -- 如果玩家本身是代理，上级用户不会是玩家， 给此玩家授权的人自动成为他的代理
						set @delta = t_water * (t_system_second_rate + t_system_third_rate);
            set t_system_profit = t_system_profit + @delta;
            iterate visit_loop;
        ELSE
            set @exist_tag = 0;
						set t_proxy_profit = 0;
						set @idx = 0;
						select id, 1, money into @idx, @exist_tag, t_proxy_profit from proxy_profit where proxy_id = t_parent_pid and start_time = start_record and end_time = end_record;
						if @exist_tag = 0 then
								insert into proxy_profit (proxy_id, start_time, end_time, create_time) value(t_parent_pid, start_record, end_record, UNIX_TIMESTAMP());
								select LAST_INSERT_ID() into @idx;
						end if;
						set t_proxy_profit = t_proxy_profit + (t_water / t_gold_rate) * t_system_second_rate;
						update proxy_profit set money = t_proxy_profit where id=@idx;
        end if;
        -- 上上级
				if t_parent = 0 then
            set @delta = t_water * t_system_third_rate;
            set t_system_profit = t_system_profit + @delta;
	          iterate visit_loop;
        end if;
        select pid, user_type, parent_id into t_parent_pid, t_parent_type, t_parent from user where pid = t_parent;
        -- 上级用户是玩家
        if t_parent_type = 4 then
        -- 如果玩家本身是代理，上级用户不会是玩家， 给此玩家授权的人自动成为他的代理
						set @delta = t_water * t_system_third_rate;
						set t_system_profit = t_system_profit + @delta;
	          iterate visit_loop;
        ELSE
            set @exist_tag = 0;
						set t_proxy_profit = 0;
						set @idx = 0;
						select id, 1, money into @idx, @exist_tag, t_proxy_profit from proxy_profit where proxy_id = t_parent_pid and start_time = start_record and end_time = end_record;
						if @exist_tag = 0 then
								insert into proxy_profit (proxy_id, start_time, end_time, create_time) value(t_parent_pid, start_record, end_record, UNIX_TIMESTAMP());
								select LAST_INSERT_ID() into @idx;
						end if;
						set t_proxy_profit = t_proxy_profit + (t_water / t_gold_rate) * t_system_third_rate;
						update proxy_profit set money = t_proxy_profit where id=@idx;
        end if;
    end if;
else
    if t_parent = 0 then
				set @delta = t_water * (t_system_first_rate + t_system_second_rate + t_system_third_rate);
        set t_system_profit = t_system_profit + @delta;
	      iterate visit_loop;
    end if;
    -- 一级代理收益
    select pid, user_type, parent_id into t_parent_pid, t_parent_type, t_parent from user where pid = t_parent;
    if t_parent_type = 4 then
				set @delta = t_water * (t_system_first_rate + t_system_second_rate + t_system_third_rate);
        set t_system_profit = t_system_profit + @delta;
        iterate visit_loop;
    else
        set @exist_tag = 0;
				set t_proxy_profit = 0;
				set @idx = 0;
				select id, 1, money into @idx, @exist_tag, t_proxy_profit from proxy_profit where proxy_id = t_parent_pid and start_time = start_record and end_time = end_record;
				if @exist_tag = 0 then
						insert into proxy_profit (proxy_id, start_time, end_time, create_time) value(t_parent_pid, start_record, end_record, UNIX_TIMESTAMP());
						select LAST_INSERT_ID() into @idx;
				end if;
				set t_proxy_profit = t_proxy_profit + (t_water / t_gold_rate) * t_system_first_rate;
				update proxy_profit set money = t_proxy_profit where id=@idx;
    end if;
    -- 二级代理收益
    if t_parent = 0 then
				set @delta = t_water * (t_system_second_rate + t_system_third_rate);
        set t_system_profit = t_system_profit + @delta;
	      iterate visit_loop;
    end if;
    select pid, user_type, parent_id into t_parent_pid, t_parent_type, t_parent from user where pid = t_parent;
    if t_parent_type = 4 then
				set @delta = t_water * (t_system_second_rate + t_system_third_rate);
        set t_system_profit = t_system_profit + @delta;
        iterate visit_loop;
    else
        set @exist_tag = 0;
				set t_proxy_profit = 0;
				set @idx = 0;
				select id, 1, money into @idx, @exist_tag, t_proxy_profit from proxy_profit where proxy_id = t_parent_pid and start_time = start_record and end_time = end_record;
				if @exist_tag = 0 then
						insert into proxy_profit (proxy_id, start_time, end_time, create_time) value(t_parent_pid, start_record, end_record, UNIX_TIMESTAMP());
						select LAST_INSERT_ID() into @idx;
				end if;
				set t_proxy_profit = t_proxy_profit + (t_water / t_gold_rate) * t_system_second_rate;
				update proxy_profit set money = t_proxy_profit where id=@idx;
    end if;
    if t_parent = 0 then
				set @delta = t_water * t_system_third_rate;
        set t_system_profit = t_system_profit + @delta;
	      iterate visit_loop;
    end if;
    -- 三级代理收益
    select pid, user_type, parent_id into t_parent_pid, t_parent_type, t_parent from user where pid = t_parent;
    if t_parent_type = 4 then
				set @delta = t_water * t_system_third_rate;
        set t_system_profit = t_system_profit + @delta;
        iterate visit_loop;
    else
        set @exist_tag = 0;
				set t_proxy_profit = 0;
				set @idx = 0;
				select id, 1, money into @idx, @exist_tag, t_proxy_profit from proxy_profit where proxy_id = t_parent_pid and start_time = start_record and end_time = end_record;
				if @exist_tag = 0 then
						insert into proxy_profit (proxy_id, start_time, end_time, create_time) value(t_parent_pid, start_record, end_record, UNIX_TIMESTAMP());
						select LAST_INSERT_ID() into @idx;
				end if;
				set t_proxy_profit = t_proxy_profit + (t_water / t_gold_rate) * t_system_third_rate;
				update proxy_profit set money = t_proxy_profit where id=@idx;
    end if;
end if;
END LOOP visit_loop;
set @exist_tag = 0;
set @old_money = 0;
set @idx = 0;
select id, 1, money into @idx, @exist_tag, @old_money from system_profit where start_time = start_record and end_time = end_record;
if @exist_tag = 0 then
    set @money = t_system_profit / t_gold_rate;
    insert into system_profit (create_time, money, start_time, end_time) value(UNIX_TIMESTAMP(), @money, start_record, end_record);
else
    set @money = @old_money + (t_system_profit / t_gold_rate);
    update system_profit set money = @money where id=@idx;
end if;
drop table general_game_record_tmp;
-- update record_tag set platform_sum_tag = TRUE, platform_sum_start = record_start, platform_sum_end = record_end where 
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for test_proc
-- ----------------------------
DROP PROCEDURE IF EXISTS `test_proc`;
DELIMITER ;;
CREATE DEFINER=`douyanzhao`@`%` PROCEDURE `test_proc`()
begin
select sleep(10) as code;
-- select 10 as code;
END
;;
DELIMITER ;
