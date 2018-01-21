/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1_56
Source Server Version : 50505
Source Host           : 192.168.1.36:3306
Source Database       : game_record

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-01-20 18:08:41
*/

SET FOREIGN_KEY_CHECKS=0;

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
