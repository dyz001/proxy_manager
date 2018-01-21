/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1_56
Source Server Version : 50505
Source Host           : 192.168.1.36:3306
Source Database       : h5proxy

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-01-20 22:13:57
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for apply_banker
-- ----------------------------
DROP TABLE IF EXISTS `apply_banker`;
CREATE TABLE `apply_banker` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `proxy_id` bigint(20) NOT NULL DEFAULT '0',
  `apply_game` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'game_code，三方游戏编码',
  `apply_time` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0:审批中，1: 通过，2: 拒绝',
  `oper_user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '申请处理人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for apply_proxy
-- ----------------------------
DROP TABLE IF EXISTS `apply_proxy`;
CREATE TABLE `apply_proxy` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT '0' COMMENT '用户Id',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '上级id',
  `apply_time` int(11) DEFAULT '0' COMMENT '申请时间',
  `status` tinyint(4) DEFAULT '0' COMMENT '0:申请中，1:已通过，2:拒绝',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for get_money_record
-- ----------------------------
DROP TABLE IF EXISTS `get_money_record`;
CREATE TABLE `get_money_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增列',
  `proxy_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户ID,对应user表',
  `money` double NOT NULL DEFAULT '0' COMMENT '申请金额',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '提现时间',
  `process_time` int(11) NOT NULL DEFAULT '0' COMMENT '处理时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '记录状态：1:已到账。0申请中',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for option
-- ----------------------------
DROP TABLE IF EXISTS `option`;
CREATE TABLE `option` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `autoload` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否自动加载;1:自动加载;0:不自动加载',
  `option_name` varchar(64) NOT NULL DEFAULT '' COMMENT '配置名',
  `option_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '配置值',
  PRIMARY KEY (`id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='全站配置表';

-- ----------------------------
-- Table structure for return_record
-- ----------------------------
DROP TABLE IF EXISTS `return_record`;
CREATE TABLE `return_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户id',
  `game` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '游戏名字',
  `return_money` double NOT NULL DEFAULT '0' COMMENT '返利结果',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '返利产生的时间',
  `account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '返利账号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for spread_fee
-- ----------------------------
DROP TABLE IF EXISTS `spread_fee`;
CREATE TABLE `spread_fee` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT '0',
  `proxy_id` bigint(20) NOT NULL DEFAULT '0',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0:主平台，1:捕鱼平台',
  `money` double NOT NULL DEFAULT '0',
  `create_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for transfer_record
-- ----------------------------
DROP TABLE IF EXISTS `transfer_record`;
CREATE TABLE `transfer_record` (
  `id` bigint(20) NOT NULL,
  `order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '订单ID',
  `proxy_id` varchar(255) NOT NULL DEFAULT '' COMMENT '代理标识',
  `money_amount` double NOT NULL DEFAULT '0' COMMENT '提现金额',
  `transfer_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '提现方式',
  `transfer_account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '提现账号',
  `transfer_time` int(11) NOT NULL DEFAULT '0' COMMENT '处理时间',
  `oper_user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '操作人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  UNIQUE KEY `pid` (`pid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for user_extra_info
-- ----------------------------
DROP TABLE IF EXISTS `user_extra_info`;
CREATE TABLE `user_extra_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '代理id',
  `bank_card_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '代理银行卡号',
  `real_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '代理真实姓名',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '信息提交时间',
  `wx_identity` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '玩家绑定的微信号',
  `mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '代理手机号',
  `withdraw_pass` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '提现密码',
  `banker_games` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '以,分隔的游戏编码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for user_with_draw
-- ----------------------------
DROP TABLE IF EXISTS `user_with_draw`;
CREATE TABLE `user_with_draw` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '玩家id',
  `with_draw` double NOT NULL DEFAULT '0' COMMENT '可提现金额（平台内）',
  `third_with_draw` double NOT NULL DEFAULT '0' COMMENT '可提现金额（平台外）',
  `freeze_money` double NOT NULL DEFAULT '0' COMMENT '冻结余额',
  `last_update_time` int(11) NOT NULL DEFAULT '0' COMMENT '上次更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for water_record
-- ----------------------------
DROP TABLE IF EXISTS `water_record`;
CREATE TABLE `water_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '玩家账号',
  `wx_openid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '用户平台内唯一id',
  `pump_water` int(10) unsigned DEFAULT '0' COMMENT '抽水值(平台金币)',
  `game_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '游戏编码',
  `create_time` int(10) unsigned DEFAULT '0' COMMENT '产生时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

