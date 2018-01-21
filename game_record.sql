/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1_56
Source Server Version : 50505
Source Host           : 192.168.1.36:3306
Source Database       : game_record

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-01-20 22:13:23
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of config
-- ----------------------------
INSERT INTO `config` VALUES ('1', '1', 'system_first', '40', '平台代理一级分成');
INSERT INTO `config` VALUES ('2', '1', 'system_second', '15', '平台代理二级分成');
INSERT INTO `config` VALUES ('3', '1', 'system_third', '5', '平台代理三级分成');
INSERT INTO `config` VALUES ('4', '2', 'fish_first', '40', '捕鱼一级分成');
INSERT INTO `config` VALUES ('5', '2', 'fish_second', '15', '捕鱼二级分成');
INSERT INTO `config` VALUES ('6', '2', 'fish_third', '5', '捕鱼三级分成');

-- ----------------------------
-- Table structure for fish_record
-- ----------------------------
DROP TABLE IF EXISTS `fish_record`;
CREATE TABLE `fish_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '产生记录时间',
  `cost_coin` bigint(20) NOT NULL DEFAULT '0' COMMENT '消耗的金币',
  `get_coin` bigint(20) NOT NULL DEFAULT '0' COMMENT '收益',
  `user_id` varchar(255) NOT NULL DEFAULT '' COMMENT '用户id',
  `account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户账号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fish_record
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fish_record_sum_201801
-- ----------------------------
INSERT INTO `fish_record_sum_201801` VALUES ('2', '9e688c58a5487b8eaf69c9e1005ad0bf', '140071', '0.3', '0', '1516244044');
INSERT INTO `fish_record_sum_201801` VALUES ('3', 'ca3236c19f2f3d46b4f00b296061f058', '140066', '3679.5', '3537', '1516244044');
INSERT INTO `fish_record_sum_201801` VALUES ('4', 'f6a3de599c2053f9e2f252c51d1c40f6', '140070', '12401.3', '10263.8', '1516244044');
INSERT INTO `fish_record_sum_201801` VALUES ('5', 'nbs001', '140068', '426', '399.3', '1516244044');
INSERT INTO `fish_record_sum_201801` VALUES ('6', 'nbs002', '140069', '1185120', '1084200', '1516244045');
INSERT INTO `fish_record_sum_201801` VALUES ('7', 'test001', '140034', '219614', '194954', '1516244045');
INSERT INTO `fish_record_sum_201801` VALUES ('36', '0cb988d042a7f28dd5fe2b55b3f5ac7a', '140072', '71', '64.7', '1516327537');
INSERT INTO `fish_record_sum_201801` VALUES ('37', '9e688c58a5487b8eaf69c9e1005ad0bf', '140071', '9.1', '11.4', '1516327537');
INSERT INTO `fish_record_sum_201801` VALUES ('38', 'eccbc87e4b5ce2fe28308fd9f2a7baf3', '140087', '4441.4', '2928.1', '1516327537');
INSERT INTO `fish_record_sum_201801` VALUES ('39', 'user1', '140082', '106.3', '86.9', '1516327538');
INSERT INTO `fish_record_sum_201801` VALUES ('40', 'user34', '140075', '4335.5', '3300.5', '1516327538');
INSERT INTO `fish_record_sum_201801` VALUES ('41', 'user37', '140090', '61.6', '41.3', '1516327538');
INSERT INTO `fish_record_sum_201801` VALUES ('42', 'user51', '140079', '3504.4', '2851.2', '1516327538');
INSERT INTO `fish_record_sum_201801` VALUES ('43', 'user52', '140074', '459.4', '259.8', '1516327538');
INSERT INTO `fish_record_sum_201801` VALUES ('44', 'user53', '140073', '75432.2', '60419.2', '1516327538');
INSERT INTO `fish_record_sum_201801` VALUES ('45', 'user54', '140076', '15376.6', '13180.5', '1516327538');
INSERT INTO `fish_record_sum_201801` VALUES ('46', 'user58', '140078', '2720.8', '2526.8', '1516327538');
INSERT INTO `fish_record_sum_201801` VALUES ('47', 'user60', '140077', '1285.5', '1603.3', '1516327538');
INSERT INTO `fish_record_sum_201801` VALUES ('48', 'user62', '140080', '1100.3', '654.5', '1516327538');
INSERT INTO `fish_record_sum_201801` VALUES ('49', 'user74', '140085', '3238.3', '2237.1', '1516327538');
INSERT INTO `fish_record_sum_201801` VALUES ('53', 'user51', '140079', '91.9', '71.4', '1516426458');
INSERT INTO `fish_record_sum_201801` VALUES ('54', 'user52', '140074', '4756.1', '3961', '1516426458');
INSERT INTO `fish_record_sum_201801` VALUES ('55', 'user53', '140073', '46242', '29117', '1516426458');
INSERT INTO `fish_record_sum_201801` VALUES ('56', 'user54', '140076', '31563.2', '28307.8', '1516426458');
INSERT INTO `fish_record_sum_201801` VALUES ('57', 'user55', '140099', '7384.7', '4414.3', '1516426458');
INSERT INTO `fish_record_sum_201801` VALUES ('58', 'user58', '140078', '2649', '2146', '1516426459');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of proxy_profit
-- ----------------------------
INSERT INTO `proxy_profit` VALUES ('1', '5', '0', '8', '1516291200', '1516377599', '1516460000');

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of record_tag
-- ----------------------------
INSERT INTO `record_tag` VALUES ('4', '1516118400', '1516204799', '', '', '2', '7', '0', '0', '1516244045', '0', '\0', '0', '0', '0', '\0', '0', '0', '0');
INSERT INTO `record_tag` VALUES ('7', '1516204800', '1516291199', '', '\0', '36', '49', '0', '0', '1516327538', '0', '\0', '0', '0', '0', '\0', '0', '0', '0');
INSERT INTO `record_tag` VALUES ('8', '1516291200', '1516377599', '', '\0', '50', '66', '0', '0', '1516426459', '0', '', '1516291200', '1516377599', '1516455939', '', '1516291200', '1516377599', '1516455931');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of system_profit
-- ----------------------------
INSERT INTO `system_profit` VALUES ('1', '1516455939', '0', '33015.99973528832', '1516291200', '1516377599');

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
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) NOT NULL DEFAULT '0' COMMENT '对应于游戏账户的id',
  `user_type` tinyint(4) NOT NULL DEFAULT '4' COMMENT '代理类型：1:总代, 2:特别代理, 3:普通代理, 4:普通玩家',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '账号创建时间',
  `last_login_time` int(11) NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `password` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '用户密码',
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户昵称',
  `wx_open_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '微信平台内唯一id',
  `parent_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '绑定id',
  `account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '游戏账号',
  `wx_unionid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '微信应用间统一id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `pid` (`pid`) USING HASH
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('3', '11', '3', '1515228702', '1515228702', 'e10adc3949ba59abbe56e057f20f883e', 'douyanzhao', '', '0', 'dyz', '');
INSERT INTO `user` VALUES ('4', '12', '3', '1515230007', '1515230007', 'e10adc3949ba59abbe56e057f20f883e', 'zhangsan', '', '3', 'xxx', '');
INSERT INTO `user` VALUES ('5', '13', '3', '1515230007', '1515230007', 'e10adc3949ba59abbe56e057f20f883e', 'zhangsan1', '', '3', 'zhangsan1', '');
INSERT INTO `user` VALUES ('6', '14', '4', '1515230007', '1515230007', 'e10adc3949ba59abbe56e057f20f883e', 'zhangsan2', '', '3', 'zhangsan2', '');
INSERT INTO `user` VALUES ('7', '15', '4', '151230007', '151230007', 'e10adc3949ba59abbe56e057f20f883e', 'zhangsan3', '', '3', 'zhangsan3', '');
INSERT INTO `user` VALUES ('8', '16', '4', '1515413570', '1515413570', 'e10adc3949ba59abbe56e057f20f883e', 'zhangsan4', '', '3', 'zhangsan4', '');
INSERT INTO `user` VALUES ('9', '17', '4', '1515413570', '1515413570', 'e10adc3949ba59abbe56e057f20f883e', 'zhangsan5', '', '3', 'zhangsan5', '');
INSERT INTO `user` VALUES ('10', '18', '3', '1515413570', '1515413570', 'e10adc3949ba59abbe56e057f20f883e', 'lisi', '', '3', 'lisi', '');
INSERT INTO `user` VALUES ('11', '19', '4', '1515413570', '1515413570', 'e10adc3949ba59abbe56e057f20f883e', 'lisi1', '', '3', 'lisi1', '');
INSERT INTO `user` VALUES ('12', '20', '4', '1515413570', '1515413570', 'e10adc3949ba59abbe56e057f20f883e', 'lisi2', '', '3', 'lisi2', '');
INSERT INTO `user` VALUES ('13', '21', '3', '1515413570', '1515413570', 'e10adc3949ba59abbe56e057f20f883e', 'lisi3', '', '3', 'lisi3', '');
INSERT INTO `user` VALUES ('14', '22', '3', '1515413570', '1515413570', '', 'lisi4', '', '3', 'lisi4', '');
INSERT INTO `user` VALUES ('15', '23', '4', '1515413570', '1515413570', '', 'lisi5', '', '3', 'lisi5', '');
INSERT INTO `user` VALUES ('20', '3', '4', '1516182513', '1516182513', '', '测试1', 'oJrSh1V6km5M61juwDq1EKytNLF0', '0', 'fish01', 'oyS9XwLx2-_vG96DOQqPnmRJ-kwM');
INSERT INTO `user` VALUES ('21', '4', '3', '1516182513', '1516182513', '', 'test1', '', '0', 'test1', '');
INSERT INTO `user` VALUES ('22', '5', '3', '1516182513', '1516182513', '', 'test2', '', '4', 'test2', '');
INSERT INTO `user` VALUES ('23', '6', '3', '1516182513', '1516182513', '', 'test3', '', '5', 'test3', '');
INSERT INTO `user` VALUES ('24', '7', '3', '1516182513', '1516182513', '', 'test4', '', '0', 'test4', '');
INSERT INTO `user` VALUES ('25', '8', '4', '1516182513', '1516182513', '', 'test5', '', '6', 'test5', '');
INSERT INTO `user` VALUES ('26', '9', '3', '1516182513', '1516182513', '', 'test6', '', '7', 'test6', '');
INSERT INTO `user` VALUES ('27', '10', '4', '1516182513', '1516182513', '', 'test7', '', '9', 'test6', '');

-- ----------------------------
-- Table structure for user_rule
-- ----------------------------
DROP TABLE IF EXISTS `user_rule`;
CREATE TABLE `user_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) DEFAULT NULL,
  `rule` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_rule
-- ----------------------------

-- ----------------------------
-- Procedure structure for compute_proxy_frofit
-- ----------------------------
DROP PROCEDURE IF EXISTS `compute_proxy_frofit`;
DELIMITER ;;
CREATE DEFINER=`xkqp`@`%` PROCEDURE `compute_proxy_frofit`()
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
CREATE DEFINER=`xkqp`@`%` PROCEDURE `save_fish_game_record`(IN memeber_id varchar(255), IN scene_sn bigint, IN cost double, IN bonus double, IN start_time varchar(255), IN end_time varchar(255), IN version_key bigint, IN version_key_end bigint, IN game_type int)
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
CREATE DEFINER=`xkqp`@`%` PROCEDURE `save_fish_game_sum_record`(IN memeber_id varchar(255), IN account_id int, IN cost_sum float, IN bonus_sum float)
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
CREATE DEFINER=`xkqp`@`%` PROCEDURE `save_game_record`(IN pid bigint, IN unionid varchar(255), IN water bigint)
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
CREATE DEFINER=`xkqp`@`%` PROCEDURE `save_water_record`(IN pid bigint, IN spreader bigint, IN game_code varchar(255), IN pump_water bigint)
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
CREATE DEFINER=`xkqp`@`%` PROCEDURE `sum_fish_profit`(IN start_record bigint, IN end_record bigint)
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
if @exist_tag = 0 THEN
    select 102 as code, t_account as account;-- 账号未找到
    set t_error_tag = 101;
    leave label;
end if;
set @delta = t_water * (1 - t_system_first_rate - t_system_second_rate - t_system_third_rate);
set t_system_profit = t_system_profit + @delta;
set i = i + 1;
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
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for sum_platform_profit
-- ----------------------------
DROP PROCEDURE IF EXISTS `sum_platform_profit`;
DELIMITER ;;
CREATE DEFINER=`xkqp`@`%` PROCEDURE `sum_platform_profit`(IN start_record bigint, IN end_record bigint)
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
if @exist_tag = 0 THEN
select 102 as code, t_pid as pid;
leave label;
end if;
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
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for sum_platform_profit_internal
-- ----------------------------
DROP PROCEDURE IF EXISTS `sum_platform_profit_internal`;
DELIMITER ;;
CREATE DEFINER=`xkqp`@`%` PROCEDURE `sum_platform_profit_internal`(IN start_record bigint, IN end_record bigint)
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
