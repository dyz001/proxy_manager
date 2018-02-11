/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : game_record

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-02-11 18:21:28
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=33801 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for record_id_binding
-- ----------------------------
DROP TABLE IF EXISTS `record_id_binding`;
CREATE TABLE `record_id_binding` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `old_pid` bigint(20) NOT NULL DEFAULT '0' COMMENT '老用户id',
  `new_pid` bigint(20) NOT NULL DEFAULT '0' COMMENT '新用户id',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'id绑定备注',
  `operator` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '操作员',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user_rule
-- ----------------------------
DROP TABLE IF EXISTS `user_rule`;
CREATE TABLE `user_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) NOT NULL DEFAULT '',
  `rule` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

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
select proxy_id, money, fish_money into @proxy_id, @money, @fish_money from tmp_proxy_profit where id=i;
select 1, proxy_id into @exist_tag, @proxy_id from h5proxy.user_with_draw where proxy_id = @proxy_id and last_update_time = end_time;
set i = i + 1;
if @exist_tag = 0 THEN
  insert into h5proxy.user_with_draw (proxy_id, with_draw, fish_with_draw, last_update_time) values (@proxy_id,@money, @fish_money, end_time);
	ITERATE update_loop;
end IF;
update h5proxy.user_with_draw set with_draw = with_draw + @money, fish_with_draw = fish_with_draw + @fish_money, last_update_time = end_time where proxy_id = @proxy_id;
end loop update_loop;
drop table tmp_proxy_profit;
end
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `sum_fish_profit`(IN start_record bigint, IN end_record bigint)
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
        set @delta = (t_water / t_gold_rate) * t_system_first_rate;
				set t_proxy_profit = t_proxy_profit + @delta;
				update proxy_profit set fish_money = t_proxy_profit where id=@idx;
        insert into h5proxy.spread_fee(user_id, proxy_id, type, money, create_time) values (t_pid, t_parent_pid, 1, @delta, start_record);
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
				set @delta = (t_water / t_gold_rate) * t_system_second_rate;
        set t_proxy_profit = t_proxy_profit + @delta;
				update proxy_profit set fish_money = t_proxy_profit where id=@idx;
        insert into h5proxy.spread_fee(user_id, proxy_id, type, money, create_time) values (t_pid, t_parent_pid, 1, @delta, start_record);
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
        set @delta = (t_water / t_gold_rate) * t_system_third_rate;
				set t_proxy_profit = t_proxy_profit + @delta;
				update proxy_profit set fish_money = t_proxy_profit where id=@idx;
        insert into h5proxy.spread_fee(user_id, proxy_id, type, money, create_time) values (t_pid, t_parent_pid, 1, @delta, start_record);
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `sum_platform_profit`(IN start_record bigint, IN end_record bigint)
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
        set @delta = (t_water / t_gold_rate) * t_system_first_rate;
				set t_proxy_profit = t_proxy_profit + @delta;
				update proxy_profit set money = t_proxy_profit where id=@idx;
        insert into h5proxy.spread_fee(user_id, proxy_id, type, money, create_time) values (t_pid, t_parent_pid, 0, @delta, start_record);
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
        set @delta = (t_water / t_gold_rate) * t_system_second_rate;
				set t_proxy_profit = t_proxy_profit + @delta;
				update proxy_profit set money = t_proxy_profit where id=@idx;
        insert into h5proxy.spread_fee(user_id, proxy_id, type, money, create_time) values (t_pid, t_parent_pid, 0, @delta, start_record);
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
        set @delta = (t_water / t_gold_rate) * t_system_third_rate;
				set t_proxy_profit = t_proxy_profit + @delta;
				update proxy_profit set money = t_proxy_profit where id=@idx;
        insert into h5proxy.spread_fee(user_id, proxy_id, type, money, create_time) values (t_pid, t_parent_pid, 0, @delta, start_record);
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
