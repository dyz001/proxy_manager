/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1_56
Source Server Version : 50505
Source Host           : 192.168.1.36:3306
Source Database       : game_record

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-01-19 18:04:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for config
-- ----------------------------
DROP TABLE IF EXISTS `config`;
CREATE TABLE `config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT '0' COMMENT '0:系统配置，1: 平台抽水分成配置, 2:捕鱼抽水分成配置',
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '配置的键值',
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
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of platform_water_record
-- ----------------------------
INSERT INTO `platform_water_record` VALUES ('1', '123', '0', 'game_code', '150', '1516328607');
INSERT INTO `platform_water_record` VALUES ('2', '10', '0', 'sss', '20000', '1516329383');
INSERT INTO `platform_water_record` VALUES ('3', '123', '0', 'game_code', '150', '1516329486');
INSERT INTO `platform_water_record` VALUES ('4', '10', '0', 'sss', '20001', '1516329493');
INSERT INTO `platform_water_record` VALUES ('5', '10', '0', 'sss', '20001', '1516330070');
INSERT INTO `platform_water_record` VALUES ('6', '10', '0', 'sss', '20001', '1516330153');
INSERT INTO `platform_water_record` VALUES ('7', '10', '0', 'sss', '20001', '1516330172');
INSERT INTO `platform_water_record` VALUES ('8', '10', '0', 'sss', '20001', '1516330232');
INSERT INTO `platform_water_record` VALUES ('9', '10', '0', 'sss', '20001', '1516330265');
INSERT INTO `platform_water_record` VALUES ('10', '123', '50', 'game_code', '150', '1516330473');
INSERT INTO `platform_water_record` VALUES ('11', '10', '15', 'sss', '20001', '1516330565');
INSERT INTO `platform_water_record` VALUES ('12', '10', '25', 'sss', '20001', '1516330601');

-- ----------------------------
-- Table structure for proxy_profit
-- ----------------------------
DROP TABLE IF EXISTS `proxy_profit`;
CREATE TABLE `proxy_profit` (
  `id` bigint(20) NOT NULL,
  `proxy_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '对应代理库的id',
  `money` float NOT NULL DEFAULT '0' COMMENT '今日盈利',
  `fish_money` float NOT NULL DEFAULT '0' COMMENT '捕鱼平台盈利',
  `create_time` float NOT NULL DEFAULT '0' COMMENT '记录产生时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of proxy_profit
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of record_tag
-- ----------------------------
INSERT INTO `record_tag` VALUES ('4', '1516118400', '1516204799', '', '', '2', '7', '0', '0', '1516244045', '0', '\0', '0', '0', '0', '\0', '0', '0', '0');
INSERT INTO `record_tag` VALUES ('7', '1516204800', '1516291199', '', '\0', '36', '49', '0', '0', '1516327538', '0', '\0', '0', '0', '0', '\0', '0', '0', '0');

-- ----------------------------
-- Table structure for system_profit
-- ----------------------------
DROP TABLE IF EXISTS `system_profit`;
CREATE TABLE `system_profit` (
  `id` bigint(20) NOT NULL,
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '收益时间',
  `money` double NOT NULL DEFAULT '0' COMMENT '系统收益',
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
select s_member_id, s_cost_sum, s_bonus_sum;

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
