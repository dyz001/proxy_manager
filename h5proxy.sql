/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1_56
Source Server Version : 50505
Source Host           : 192.168.1.36:3306
Source Database       : h5proxy

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-01-29 21:22:31
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
-- Records of apply_banker
-- ----------------------------
INSERT INTO `apply_banker` VALUES ('1', '13', '101', '1516353246', '0', '');
INSERT INTO `apply_banker` VALUES ('2', '3', '101', '1516355673', '0', '');

-- ----------------------------
-- Table structure for apply_proxy
-- ----------------------------
DROP TABLE IF EXISTS `apply_proxy`;
CREATE TABLE `apply_proxy` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT '0' COMMENT '用户Id',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '上级id',
  `apply_time` int(11) DEFAULT '0' COMMENT '申请时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '处理备注',
  `status` tinyint(4) DEFAULT '0' COMMENT '0:申请中，1:已通过，2:拒绝',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of apply_proxy
-- ----------------------------
INSERT INTO `apply_proxy` VALUES ('1', '4', '4', '1515403053', '', '0');
INSERT INTO `apply_proxy` VALUES ('2', '5', '4', '1515403053', '', '0');
INSERT INTO `apply_proxy` VALUES ('3', '6', '4', '1515403053', '', '0');
INSERT INTO `apply_proxy` VALUES ('4', '7', '4', '1515403053', '', '0');
INSERT INTO `apply_proxy` VALUES ('5', '8', '4', '1515403053', '', '0');
INSERT INTO `apply_proxy` VALUES ('6', '9', '4', '1515403053', '', '0');
INSERT INTO `apply_proxy` VALUES ('7', '10', '4', '1515403053', '', '0');
INSERT INTO `apply_proxy` VALUES ('8', '11', '4', '1515403053', '', '0');
INSERT INTO `apply_proxy` VALUES ('9', '12', '4', '1515403053', '', '0');
INSERT INTO `apply_proxy` VALUES ('10', '13', '4', '1515403053', '', '0');
INSERT INTO `apply_proxy` VALUES ('11', '14', '4', '1515403053', '', '0');
INSERT INTO `apply_proxy` VALUES ('12', '15', '4', '1515403053', '', '1');
INSERT INTO `apply_proxy` VALUES ('14', '3', '4', '1515463095', '小子，人数有点少啊', '0');
INSERT INTO `apply_proxy` VALUES ('15', '22', '4', '1515463095', 'Zxc to', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of get_money_record
-- ----------------------------
INSERT INTO `get_money_record` VALUES ('1', '10', '15', '1516345695', '0', '0', '');
INSERT INTO `get_money_record` VALUES ('2', '11', '20', '1516345695', '0', '0', '');
INSERT INTO `get_money_record` VALUES ('3', '12', '100', '1516345695', '0', '0', '');
INSERT INTO `get_money_record` VALUES ('4', '13', '200', '1516345695', '0', '0', '');
INSERT INTO `get_money_record` VALUES ('5', '14', '250', '1516345695', '0', '1', '');
INSERT INTO `get_money_record` VALUES ('6', '15', '280', '1516345695', '0', '1', '');
INSERT INTO `get_money_record` VALUES ('7', '20', '130', '1516345695', '0', '1', '');
INSERT INTO `get_money_record` VALUES ('8', '10', '25', '1516349081', '0', '1', '');
INSERT INTO `get_money_record` VALUES ('9', '3', '50', '1516616024', '0', '0', '');

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
-- Records of option
-- ----------------------------
INSERT INTO `option` VALUES ('1', '1', 'proxy_rule', '这是代理规则');

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
-- Records of return_record
-- ----------------------------
INSERT INTO `return_record` VALUES ('1', '1', '十三水', '20', '0', '');
INSERT INTO `return_record` VALUES ('2', '1', '百人牛牛', '30', '0', '');
INSERT INTO `return_record` VALUES ('3', '2', '百家乐', '15', '0', '');
INSERT INTO `return_record` VALUES ('4', '2', '777', '5', '0', '');
INSERT INTO `return_record` VALUES ('5', '1', '十三水', '1', '0', '');
INSERT INTO `return_record` VALUES ('6', '1', '百家乐', '15', '0', '');
INSERT INTO `return_record` VALUES ('7', '1', '百家乐', '8', '0', '');
INSERT INTO `return_record` VALUES ('8', '2', '百家乐', '5', '0', '');
INSERT INTO `return_record` VALUES ('9', '1', '百人牛牛', '1', '0', '');
INSERT INTO `return_record` VALUES ('10', '1', '百家乐', '10', '0', '');
INSERT INTO `return_record` VALUES ('11', '1', '777', '8', '0', '');
INSERT INTO `return_record` VALUES ('12', '1', '金鲨银鲨', '6', '0', '');

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
) ENGINE=InnoDB AUTO_INCREMENT=88203 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of spread_fee
-- ----------------------------

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
-- Records of transfer_record
-- ----------------------------

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
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('3', '11', '4', '1515228702', '1515228702', '123456', 'douyanzhao', '', '0', 'dyz', '');
INSERT INTO `user` VALUES ('4', '12', '4', '1515230007', '1515230007', 'e10adc3949ba59abbe56e057f20f883e', 'zhangsan', '', '3', 'xxx', '');
INSERT INTO `user` VALUES ('5', '13', '4', '1515230007', '1515230007', 'e10adc3949ba59abbe56e057f20f883e', 'zhangsan1', '', '3', 'zhangsan1', '');
INSERT INTO `user` VALUES ('6', '14', '4', '1515230007', '1515230007', 'e10adc3949ba59abbe56e057f20f883e', 'zhangsan2', '', '3', 'zhangsan2', '');
INSERT INTO `user` VALUES ('7', '15', '4', '151230007', '151230007', 'e10adc3949ba59abbe56e057f20f883e', 'zhangsan3', '', '3', 'zhangsan3', '');
INSERT INTO `user` VALUES ('8', '16', '4', '1515413570', '1515413570', 'e10adc3949ba59abbe56e057f20f883e', 'zhangsan4', '', '3', 'zhangsan4', '');
INSERT INTO `user` VALUES ('9', '17', '4', '1515413570', '1515413570', 'e10adc3949ba59abbe56e057f20f883e', 'zhangsan5', '', '3', 'zhangsan5', '');
INSERT INTO `user` VALUES ('10', '18', '4', '1515413570', '1515413570', 'e10adc3949ba59abbe56e057f20f883e', 'lisi', '', '3', 'lisi', '');
INSERT INTO `user` VALUES ('11', '19', '4', '1515413570', '1515413570', 'e10adc3949ba59abbe56e057f20f883e', 'lisi1', '', '3', 'lisi1', '');
INSERT INTO `user` VALUES ('12', '20', '4', '1515413570', '1515413570', 'e10adc3949ba59abbe56e057f20f883e', 'lisi2', '', '3', 'lisi2', '');
INSERT INTO `user` VALUES ('13', '21', '4', '1515413570', '1515413570', 'e10adc3949ba59abbe56e057f20f883e', 'lisi3', '', '3', 'lisi3', '');
INSERT INTO `user` VALUES ('14', '22', '4', '1515413570', '1515413570', '', 'lisi4', '', '3', 'lisi4', '');
INSERT INTO `user` VALUES ('15', '23', '3', '1515413570', '1515413570', '', 'lisi5', '', '3', 'lisi5', '');
INSERT INTO `user` VALUES ('20', '3', '4', '1516182513', '1516182513', '', '测试1', 'oJrSh1V6km5M61juwDq1EKytNLF0', '0', 'fish01', 'oyS9XwLx2-_vG96DOQqPnmRJ-kwM');
INSERT INTO `user` VALUES ('21', '4', '3', '1516182513', '1517195207', 'e10adc3949ba59abbe56e057f20f883e', 'test1', '', '0', 'user37', '');
INSERT INTO `user` VALUES ('22', '5', '4', '1516182513', '1517015270', 'e10adc3949ba59abbe56e057f20f883e', 'test2', '', '4', 'user51', '');
INSERT INTO `user` VALUES ('23', '6', '4', '1516182513', '1516182513', '', 'test3', '', '5', 'user52', '');
INSERT INTO `user` VALUES ('24', '7', '4', '1516182513', '1516182513', '', 'test4', '', '0', 'user53', '');
INSERT INTO `user` VALUES ('25', '8', '4', '1516182513', '1516182513', '', 'test5', '', '6', 'user54', '');
INSERT INTO `user` VALUES ('26', '9', '4', '1516182513', '1516182513', '', 'test6', '', '7', 'user55', '');
INSERT INTO `user` VALUES ('27', '10', '4', '1516182513', '1516182513', '', 'test7', '', '9', 'user58', '');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user_extra_info
-- ----------------------------
INSERT INTO `user_extra_info` VALUES ('1', '5', '123456789456123', '龙爱雨', '1515231785', 'douyanzhao', '15104267391', 'e10adc3949ba59abbe56e057f20f883e', '');
INSERT INTO `user_extra_info` VALUES ('2', '22', '', '', '0', '', '', '', '101,');
INSERT INTO `user_extra_info` VALUES ('3', '0', '2456875', 'Dfghu', '1516619152', 'Excel', '45676554', '123456', '');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user_with_draw
-- ----------------------------
INSERT INTO `user_with_draw` VALUES ('1', '3', '100', '50', '50', '0');

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

-- ----------------------------
-- Records of water_record
-- ----------------------------

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

declare s_member_id CHAR(255) DEFAULT 0;
declare s_cost_sum FLOAT DEFAULT 0;
declare s_bonus_sum FLOAT DEFAULT 0;

declare s_profit FLOAT DEFAULT 0;
declare s_pid INT DEFAULT 0;
declare s_user_type INT DEFAULT 0;

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
select s_member_id,s_profit;

select pid, user_type into s_pid, s_user_type from h5proxy.user where account = s_member_id;
select s_pid, s_user_type;

end while;
END
;;
DELIMITER ;
