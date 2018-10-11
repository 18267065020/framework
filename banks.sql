/*
Navicat MySQL Data Transfer

Source Server         : 本地连接
Source Server Version : 50045
Source Host           : localhost:3306
Source Database       : banks

Target Server Type    : MYSQL
Target Server Version : 50045
File Encoding         : 65001

Date: 2018-10-12 00:04:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bp_banks
-- ----------------------------
DROP TABLE IF EXISTS `bp_banks`;
CREATE TABLE `bp_banks` (
  `id` bigint(20) NOT NULL auto_increment,
  `banks_type` bigint(20) default NULL COMMENT '网站类型',
  `name` varchar(200) default NULL COMMENT '网站名',
  `create_date` datetime default NULL COMMENT '创建时间',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='网站信息';

-- ----------------------------
-- Records of bp_banks
-- ----------------------------

-- ----------------------------
-- Table structure for bp_member
-- ----------------------------
DROP TABLE IF EXISTS `bp_member`;
CREATE TABLE `bp_member` (
  `id` bigint(20) NOT NULL auto_increment,
  `banks_id` bigint(20) NOT NULL COMMENT '网站id',
  `name` varchar(200) NOT NULL COMMENT '会员名',
  `username` varchar(200) NOT NULL COMMENT '会员账号',
  `password` varchar(200) NOT NULL COMMENT '会员密码',
  `create_date` datetime default NULL COMMENT '创建时间',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员表';

-- ----------------------------
-- Records of bp_member
-- ----------------------------

-- ----------------------------
-- Table structure for bp_param
-- ----------------------------
DROP TABLE IF EXISTS `bp_param`;
CREATE TABLE `bp_param` (
  `id` bigint(20) NOT NULL auto_increment,
  `url_id` bigint(20) NOT NULL COMMENT '链接表id',
  `keys` varchar(200) NOT NULL COMMENT '参数名',
  `values` varchar(200) NOT NULL COMMENT '参数值',
  `fixed` bigint(20) NOT NULL COMMENT '固定值',
  `create_date` datetime default NULL COMMENT '创建时间',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='参数表';

-- ----------------------------
-- Records of bp_param
-- ----------------------------

-- ----------------------------
-- Table structure for bp_return
-- ----------------------------
DROP TABLE IF EXISTS `bp_return`;
CREATE TABLE `bp_return` (
  `id` bigint(20) NOT NULL auto_increment,
  `url_id` bigint(20) NOT NULL COMMENT 'urlid',
  `member_id` bigint(20) NOT NULL COMMENT '会员id',
  `return_value` varchar(1000) NOT NULL COMMENT '返回值',
  `create_date` datetime default NULL COMMENT '创建时间',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员表';

-- ----------------------------
-- Records of bp_return
-- ----------------------------

-- ----------------------------
-- Table structure for bp_types
-- ----------------------------
DROP TABLE IF EXISTS `bp_types`;
CREATE TABLE `bp_types` (
  `id` bigint(20) NOT NULL auto_increment,
  `parent_id` bigint(20) default NULL COMMENT '父ID',
  `name` varchar(200) default NULL COMMENT '类型名',
  `create_date` datetime default NULL COMMENT '创建时间',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='类型表';

-- ----------------------------
-- Records of bp_types
-- ----------------------------

-- ----------------------------
-- Table structure for bp_url
-- ----------------------------
DROP TABLE IF EXISTS `bp_url`;
CREATE TABLE `bp_url` (
  `id` bigint(20) NOT NULL auto_increment,
  `link_type` varchar(200) NOT NULL COMMENT '链接方式',
  `request_type` varchar(200) NOT NULL COMMENT '链接方式',
  `url` varchar(200) default NULL COMMENT 'URL地址',
  `name` varchar(200) default NULL COMMENT '链接名',
  `create_date` datetime default NULL COMMENT '创建时间',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='链接信息';

-- ----------------------------
-- Records of bp_url
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY  (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY  (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) default NULL,
  PRIMARY KEY  (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('FrameworkScheduler', 'TASK_1', 'DEFAULT', '0 0/30 * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('FrameworkScheduler', 'TASK_2', 'DEFAULT', '0 0/30 * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) default NULL,
  `JOB_GROUP` varchar(200) default NULL,
  `IS_NONCONCURRENT` varchar(1) default NULL,
  `REQUESTS_RECOVERY` varchar(1) default NULL,
  PRIMARY KEY  (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) default NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY  (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('FrameworkScheduler', 'TASK_1', 'DEFAULT', null, 'com.framework.modules.job.utils.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B455973720032636F6D2E6672616D65776F726B2E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200084C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000158BAF593307874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000000000000017400047465737474000672656E72656E74000FE69C89E58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000007800);
INSERT INTO `qrtz_job_details` VALUES ('FrameworkScheduler', 'TASK_2', 'DEFAULT', null, 'com.framework.modules.job.utils.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B455973720032636F6D2E6672616D65776F726B2E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200084C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000158C377C4607874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000274000574657374327074000FE697A0E58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000017800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY  (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('FrameworkScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('FrameworkScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY  (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY  (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('FrameworkScheduler', 'DESKTOP-J1K0EOF1536934311050', '1536934883662', '15000');

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY  (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) default NULL,
  `STR_PROP_2` varchar(512) default NULL,
  `STR_PROP_3` varchar(512) default NULL,
  `INT_PROP_1` int(11) default NULL,
  `INT_PROP_2` int(11) default NULL,
  `LONG_PROP_1` bigint(20) default NULL,
  `LONG_PROP_2` bigint(20) default NULL,
  `DEC_PROP_1` decimal(13,4) default NULL,
  `DEC_PROP_2` decimal(13,4) default NULL,
  `BOOL_PROP_1` varchar(1) default NULL,
  `BOOL_PROP_2` varchar(1) default NULL,
  PRIMARY KEY  (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) default NULL,
  `NEXT_FIRE_TIME` bigint(13) default NULL,
  `PREV_FIRE_TIME` bigint(13) default NULL,
  `PRIORITY` int(11) default NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) default NULL,
  `CALENDAR_NAME` varchar(200) default NULL,
  `MISFIRE_INSTR` smallint(2) default NULL,
  `JOB_DATA` blob,
  PRIMARY KEY  (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`),
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('FrameworkScheduler', 'TASK_1', 'DEFAULT', 'TASK_1', 'DEFAULT', null, '1536935400000', '-1', '5', 'WAITING', 'CRON', '1527491658000', '0', null, '2', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B455973720032636F6D2E6672616D65776F726B2E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200084C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000158BAF593307874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000001740004746573747400096672616D65776F726B74000FE69C89E58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000007800);
INSERT INTO `qrtz_triggers` VALUES ('FrameworkScheduler', 'TASK_2', 'DEFAULT', 'TASK_2', 'DEFAULT', null, '1527492600000', '-1', '5', 'PAUSED', 'CRON', '1527491658000', '0', null, '2', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B455973720032636F6D2E6672616D65776F726B2E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200084C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000158C377C4607874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000274000574657374327074000FE697A0E58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000017800);

-- ----------------------------
-- Table structure for schedule_job
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job`;
CREATE TABLE `schedule_job` (
  `job_id` bigint(20) NOT NULL auto_increment COMMENT '任务id',
  `bean_name` varchar(200) default NULL COMMENT 'spring bean名称',
  `method_name` varchar(100) default NULL COMMENT '方法名',
  `params` varchar(2000) default NULL COMMENT '参数',
  `cron_expression` varchar(100) default NULL COMMENT 'cron表达式',
  `status` tinyint(4) default NULL COMMENT '任务状态  0：正常  1：暂停',
  `remark` varchar(255) default NULL COMMENT '备注',
  `create_time` datetime default NULL COMMENT '创建时间',
  PRIMARY KEY  (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='定时任务';

-- ----------------------------
-- Records of schedule_job
-- ----------------------------
INSERT INTO `schedule_job` VALUES ('1', 'testTask', 'test', 'framework', '0 0/30 * * * ?', '0', '有参数测试', '2016-12-01 23:16:46');
INSERT INTO `schedule_job` VALUES ('2', 'testTask', 'test2', null, '0 0/30 * * * ?', '1', '无参数测试', '2016-12-03 14:55:56');

-- ----------------------------
-- Table structure for schedule_job_log
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job_log`;
CREATE TABLE `schedule_job_log` (
  `log_id` bigint(20) NOT NULL auto_increment COMMENT '任务日志id',
  `job_id` bigint(20) NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) default NULL COMMENT 'spring bean名称',
  `method_name` varchar(100) default NULL COMMENT '方法名',
  `params` varchar(2000) default NULL COMMENT '参数',
  `status` tinyint(4) NOT NULL COMMENT '任务状态    0：成功    1：失败',
  `error` varchar(2000) default NULL COMMENT '失败信息',
  `times` int(11) NOT NULL COMMENT '耗时(单位：毫秒)',
  `create_time` datetime default NULL COMMENT '创建时间',
  PRIMARY KEY  (`log_id`),
  KEY `job_id` (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='定时任务日志';

-- ----------------------------
-- Records of schedule_job_log
-- ----------------------------
INSERT INTO `schedule_job_log` VALUES ('1', '1', 'testTask', 'test', 'framework', '0', null, '1035', '2018-05-28 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('2', '1', 'testTask', 'test', 'framework', '0', null, '1022', '2018-06-02 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('3', '1', 'testTask', 'test', 'framework', '0', null, '1067', '2018-06-02 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('4', '2', 'testTask', 'test2', null, '0', null, '1', '2018-06-02 21:32:11');
INSERT INTO `schedule_job_log` VALUES ('5', '1', 'testTask', 'test', 'framework', '0', null, '1012', '2018-06-02 22:00:00');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `id` bigint(20) NOT NULL auto_increment,
  `param_key` varchar(50) default NULL COMMENT 'key',
  `param_value` varchar(2000) default NULL COMMENT 'value',
  `status` tinyint(4) default '1' COMMENT '状态   0：隐藏   1：显示',
  `remark` varchar(500) default NULL COMMENT '备注',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `param_key` (`param_key`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统配置信息表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', 'CLOUD_STORAGE_CONFIG_KEY', '{\"type\":1,\"qiniuDomain\":\"http://7xqbwh.dl1.z0.glb.clouddn.com\",\"qiniuPrefix\":\"upload\",\"qiniuAccessKey\":\"NrgMfABZxWLo5B-YYSjoE8-AZ1EISdi1Z3ubLOeZ\",\"qiniuSecretKey\":\"uIwJHevMRWU0VLxFvgy0tAcOdGqasdtVlJkdy6vV\",\"qiniuBucketName\":\"ios-app\",\"aliyunDomain\":\"\",\"aliyunPrefix\":\"\",\"aliyunEndPoint\":\"\",\"aliyunAccessKeyId\":\"\",\"aliyunAccessKeySecret\":\"\",\"aliyunBucketName\":\"\",\"qcloudDomain\":\"\",\"qcloudPrefix\":\"\",\"qcloudSecretId\":\"\",\"qcloudSecretKey\":\"\",\"qcloudBucketName\":\"\"}', '0', '云存储配置信息');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL auto_increment,
  `parent_id` bigint(20) default NULL COMMENT '上级部门ID，一级部门为0',
  `name` varchar(50) default NULL COMMENT '部门名称',
  `order_num` int(11) default NULL COMMENT '排序',
  `del_flag` tinyint(4) default '0' COMMENT '是否删除  -1：已删除  0：正常',
  PRIMARY KEY  (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='部门管理';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('1', '0', '软件研发总部', '0', '0');
INSERT INTO `sys_dept` VALUES ('2', '1', '广州分公司', '1', '0');
INSERT INTO `sys_dept` VALUES ('3', '1', '深圳分公司', '2', '0');
INSERT INTO `sys_dept` VALUES ('4', '3', '技术部', '0', '0');
INSERT INTO `sys_dept` VALUES ('5', '3', '销售部', '1', '0');
INSERT INTO `sys_dept` VALUES ('6', '0', 'sdfdasfa', '0', '-1');

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` bigint(20) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL COMMENT '字典名称',
  `type` varchar(100) NOT NULL COMMENT '字典类型',
  `code` varchar(100) NOT NULL COMMENT '字典码',
  `value` varchar(1000) NOT NULL COMMENT '字典值',
  `order_num` int(11) default '0' COMMENT '排序',
  `remark` varchar(255) default NULL COMMENT '备注',
  `del_flag` tinyint(4) default '0' COMMENT '删除标记  -1：已删除  0：正常',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `type` (`type`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='数据字典表';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('1', '性别', 'sex', '0', '女', '0', null, '-1');
INSERT INTO `sys_dict` VALUES ('2', '性别', 'sex', '1', '男', '1', null, '-1');
INSERT INTO `sys_dict` VALUES ('3', '性别', 'sex', '2', '未知', '2', null, '-1');
INSERT INTO `sys_dict` VALUES ('4', 'fdsfas', 'fasdf', 'fsaf', 'fsadfas', '3', null, '-1');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL auto_increment,
  `username` varchar(50) default NULL COMMENT '用户名',
  `operation` varchar(50) default NULL COMMENT '用户操作',
  `method` varchar(200) default NULL COMMENT '请求方法',
  `params` varchar(5000) default NULL COMMENT '请求参数',
  `time` bigint(20) NOT NULL COMMENT '执行时长(毫秒)',
  `ip` varchar(64) default NULL COMMENT 'IP地址',
  `create_date` datetime default NULL COMMENT '创建时间',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='系统日志';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('1', 'admin', '保存配置', 'com.framework.modules.sys.controller.SysConfigController.save()', '{\"id\":2,\"paramKey\":\"fdsafa\",\"paramValue\":\"fadsfsa\"}', '11', '0:0:0:0:0:0:0:1', '2018-06-02 21:29:35');
INSERT INTO `sys_log` VALUES ('2', 'admin', '修改配置', 'com.framework.modules.sys.controller.SysConfigController.update()', '{\"id\":2,\"paramKey\":\"fdsafa\",\"paramValue\":\"fadsfsa888\"}', '11', '0:0:0:0:0:0:0:1', '2018-06-02 21:29:49');
INSERT INTO `sys_log` VALUES ('3', 'admin', '删除配置', 'com.framework.modules.sys.controller.SysConfigController.delete()', '[2]', '10', '0:0:0:0:0:0:0:1', '2018-06-02 21:30:04');
INSERT INTO `sys_log` VALUES ('4', 'admin', '立即执行任务', 'com.framework.modules.job.controller.ScheduleJobController.run()', '[2]', '36', '0:0:0:0:0:0:0:1', '2018-06-02 21:32:11');
INSERT INTO `sys_log` VALUES ('5', 'admin', '恢复定时任务', 'com.framework.modules.job.controller.ScheduleJobController.resume()', '[2]', '23', '0:0:0:0:0:0:0:1', '2018-06-02 21:32:22');
INSERT INTO `sys_log` VALUES ('6', 'admin', '暂停定时任务', 'com.framework.modules.job.controller.ScheduleJobController.pause()', '[2]', '14', '0:0:0:0:0:0:0:1', '2018-06-02 21:32:31');
INSERT INTO `sys_log` VALUES ('7', 'admin', '修改菜单', 'com.framework.modules.sys.controller.SysMenuController.update()', '{\"menuId\":15,\"parentId\":2,\"parentName\":\"管理员管理\",\"name\":\"查看1\",\"perms\":\"sys:user:list,sys:user:info\",\"type\":2,\"orderNum\":0}', '12', '0:0:0:0:0:0:0:1', '2018-06-02 21:34:25');
INSERT INTO `sys_log` VALUES ('8', 'admin', '修改菜单', 'com.framework.modules.sys.controller.SysMenuController.update()', '{\"menuId\":15,\"parentId\":2,\"parentName\":\"管理员管理\",\"name\":\"查看\",\"perms\":\"sys:user:list,sys:user:info\",\"type\":2,\"orderNum\":0}', '11', '0:0:0:0:0:0:0:1', '2018-06-02 21:34:43');
INSERT INTO `sys_log` VALUES ('9', 'admin', '保存角色', 'com.framework.modules.sys.controller.SysRoleController.save()', '{\"roleId\":1,\"roleName\":\"研发\",\"deptId\":1,\"deptName\":\"软件研发公司\",\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,29,30,31,32,33,34,35,36,37,38,39,40],\"deptIdList\":[2],\"createTime\":\"Jun 2, 2018 9:35:27 PM\"}', '76', '0:0:0:0:0:0:0:1', '2018-06-02 21:35:28');
INSERT INTO `sys_log` VALUES ('10', 'admin', '修改角色', 'com.framework.modules.sys.controller.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"研发人员\",\"deptId\":2,\"deptName\":\"长沙分公司\",\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,29,30,31,32,33,34,35,36,37,38,39,40],\"deptIdList\":[2],\"createTime\":\"Jun 2, 2018 9:35:28 PM\"}', '31', '0:0:0:0:0:0:0:1', '2018-06-02 21:36:25');
INSERT INTO `sys_log` VALUES ('11', 'admin', '修改用户', 'com.framework.modules.sys.controller.SysUserController.update()', '{\"userId\":1,\"username\":\"admin\",\"salt\":\"YzcmCZNvbXocrsz9dm8e\",\"email\":\"10000@qq.com\",\"mobile\":\"13612345678\",\"status\":1,\"roleIdList\":[],\"createTime\":\"Nov 11, 2016 11:11:11 AM\",\"deptId\":1,\"deptName\":\"软件研发公司\"}', '26', '0:0:0:0:0:0:0:1', '2018-06-02 21:37:33');
INSERT INTO `sys_log` VALUES ('12', 'admin', '修改密码', 'com.framework.modules.sys.controller.SysUserController.password()', '\"admin\"', '10', '0:0:0:0:0:0:0:1', '2018-06-02 21:37:51');
INSERT INTO `sys_log` VALUES ('13', 'admin', '修改密码', 'com.framework.modules.sys.controller.SysUserController.password()', '\"123456\"', '6', '0:0:0:0:0:0:0:1', '2018-06-02 21:38:40');
INSERT INTO `sys_log` VALUES ('14', 'admin', '修改角色', 'com.framework.modules.sys.controller.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"广州研发\",\"remark\":\"广州分公司的研发人员\",\"deptId\":2,\"deptName\":\"广州分公司\",\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,29,30,31,32,33,34,35,36,37,38,39,40],\"deptIdList\":[2],\"createTime\":\"Jun 2, 2018 9:35:28 PM\"}', '27', '0:0:0:0:0:0:0:1', '2018-06-02 21:47:56');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL auto_increment,
  `parent_id` bigint(20) default NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) default NULL COMMENT '菜单名称',
  `url` varchar(200) default NULL COMMENT '菜单URL',
  `perms` varchar(500) default NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) default NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) default NULL COMMENT '菜单图标',
  `order_num` int(11) default NULL COMMENT '排序',
  PRIMARY KEY  (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 COMMENT='菜单管理';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '0', '系统管理', null, null, '0', 'fa fa-cog', '0');
INSERT INTO `sys_menu` VALUES ('2', '1', '管理员管理', 'modules/sys/user.html', null, '1', 'fa fa-user', '1');
INSERT INTO `sys_menu` VALUES ('3', '1', '角色管理', 'modules/sys/role.html', null, '1', 'fa fa-user-secret', '2');
INSERT INTO `sys_menu` VALUES ('4', '1', '菜单管理', 'modules/sys/menu.html', null, '1', 'fa fa-th-list', '3');
INSERT INTO `sys_menu` VALUES ('5', '1', 'SQL监控', 'druid/sql.html', null, '1', 'fa fa-bug', '4');
INSERT INTO `sys_menu` VALUES ('6', '1', '定时任务', 'modules/job/schedule.html', null, '1', 'fa fa-tasks', '5');
INSERT INTO `sys_menu` VALUES ('7', '6', '查看', null, 'sys:schedule:list,sys:schedule:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('8', '6', '新增', null, 'sys:schedule:save', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('9', '6', '修改', null, 'sys:schedule:update', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('10', '6', '删除', null, 'sys:schedule:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('11', '6', '暂停', null, 'sys:schedule:pause', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('12', '6', '恢复', null, 'sys:schedule:resume', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('13', '6', '立即执行', null, 'sys:schedule:run', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('14', '6', '日志列表', null, 'sys:schedule:log', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('15', '2', '查看', null, 'sys:user:list,sys:user:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('16', '2', '新增', null, 'sys:user:save,sys:role:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('17', '2', '修改', null, 'sys:user:update,sys:role:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('18', '2', '删除', null, 'sys:user:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('19', '3', '查看', null, 'sys:role:list,sys:role:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('20', '3', '新增', null, 'sys:role:save,sys:menu:perms', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('21', '3', '修改', null, 'sys:role:update,sys:menu:perms', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('22', '3', '删除', null, 'sys:role:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('23', '4', '查看', null, 'sys:menu:list,sys:menu:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('24', '4', '新增', null, 'sys:menu:save,sys:menu:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('25', '4', '修改', null, 'sys:menu:update,sys:menu:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('26', '4', '删除', null, 'sys:menu:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('27', '1', '参数管理', 'modules/sys/config.html', 'sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete', '1', 'fa fa-sun-o', '6');
INSERT INTO `sys_menu` VALUES ('29', '1', '系统日志', 'modules/sys/log.html', 'sys:log:list', '1', 'fa fa-file-text-o', '7');
INSERT INTO `sys_menu` VALUES ('30', '1', '文件上传', 'modules/oss/oss.html', 'sys:oss:all', '1', 'fa fa-file-image-o', '6');
INSERT INTO `sys_menu` VALUES ('31', '1', '部门管理', 'modules/sys/dept.html', null, '1', 'fa fa-file-code-o', '1');
INSERT INTO `sys_menu` VALUES ('32', '31', '查看', null, 'sys:dept:list,sys:dept:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('33', '31', '新增', null, 'sys:dept:save,sys:dept:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('34', '31', '修改', null, 'sys:dept:update,sys:dept:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('35', '31', '删除', null, 'sys:dept:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('36', '1', '字典管理', 'modules/sys/dict.html', null, '1', 'fa fa-bookmark-o', '6');
INSERT INTO `sys_menu` VALUES ('37', '36', '查看', null, 'sys:dict:list,sys:dict:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('38', '36', '新增', null, 'sys:dict:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('39', '36', '修改', null, 'sys:dict:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('40', '36', '删除', null, 'sys:dict:delete', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('41', '1', '网站信息; InnoDB free: 3072 kB', 'modules/bp/bpbanks.html', null, '1', 'fa fa-file-code-o', '6');
INSERT INTO `sys_menu` VALUES ('42', '41', '查看', null, 'bp:bpbanks:list,bp:bpbanks:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('43', '41', '新增', null, 'bp:bpbanks:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('44', '41', '修改', null, 'bp:bpbanks:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('45', '41', '删除', null, 'bp:bpbanks:delete', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('46', '1', '会员表; InnoDB free: 3072 kB', 'modules/bp/bpmember.html', null, '1', 'fa fa-file-code-o', '6');
INSERT INTO `sys_menu` VALUES ('47', '46', '查看', null, 'bp:bpmember:list,bp:bpmember:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('48', '46', '新增', null, 'bp:bpmember:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('49', '46', '修改', null, 'bp:bpmember:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('50', '46', '删除', null, 'bp:bpmember:delete', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('51', '1', '参数表; InnoDB free: 3072 kB', 'modules/bp/bpparam.html', null, '1', 'fa fa-file-code-o', '6');
INSERT INTO `sys_menu` VALUES ('52', '51', '查看', null, 'bp:bpparam:list,bp:bpparam:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('53', '51', '新增', null, 'bp:bpparam:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('54', '51', '修改', null, 'bp:bpparam:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('55', '51', '删除', null, 'bp:bpparam:delete', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('56', '1', '会员表; InnoDB free: 3072 kB', 'modules/bp/bpreturn.html', null, '1', 'fa fa-file-code-o', '6');
INSERT INTO `sys_menu` VALUES ('57', '56', '查看', null, 'bp:bpreturn:list,bp:bpreturn:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('58', '56', '新增', null, 'bp:bpreturn:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('59', '56', '修改', null, 'bp:bpreturn:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('60', '56', '删除', null, 'bp:bpreturn:delete', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('61', '1', '类型表; InnoDB free: 3072 kB', 'modules/bp/bptypes.html', null, '1', 'fa fa-file-code-o', '6');
INSERT INTO `sys_menu` VALUES ('62', '61', '查看', null, 'bp:bptypes:list,bp:bptypes:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('63', '61', '新增', null, 'bp:bptypes:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('64', '61', '修改', null, 'bp:bptypes:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('65', '61', '删除', null, 'bp:bptypes:delete', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('66', '1', '链接信息; InnoDB free: 3072 kB', 'modules/bp/bpurl.html', null, '1', 'fa fa-file-code-o', '6');
INSERT INTO `sys_menu` VALUES ('67', '66', '查看', null, 'bp:bpurl:list,bp:bpurl:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('68', '66', '新增', null, 'bp:bpurl:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('69', '66', '修改', null, 'bp:bpurl:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('70', '66', '删除', null, 'bp:bpurl:delete', '2', null, '6');

-- ----------------------------
-- Table structure for sys_oss
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss`;
CREATE TABLE `sys_oss` (
  `id` bigint(20) NOT NULL auto_increment,
  `url` varchar(200) default NULL COMMENT 'URL地址',
  `create_date` datetime default NULL COMMENT '创建时间',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文件上传';

-- ----------------------------
-- Records of sys_oss
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL auto_increment,
  `role_name` varchar(100) default NULL COMMENT '角色名称',
  `remark` varchar(100) default NULL COMMENT '备注',
  `dept_id` bigint(20) default NULL COMMENT '部门ID',
  `create_time` datetime default NULL COMMENT '创建时间',
  PRIMARY KEY  (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '广州研发', '广州分公司的研发人员', '2', '2018-06-02 21:35:28');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `id` bigint(20) NOT NULL auto_increment,
  `role_id` bigint(20) default NULL COMMENT '角色ID',
  `dept_id` bigint(20) default NULL COMMENT '部门ID',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='角色与部门对应关系';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES ('3', '1', '2');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL auto_increment,
  `role_id` bigint(20) default NULL COMMENT '角色ID',
  `menu_id` bigint(20) default NULL COMMENT '菜单ID',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8 COMMENT='角色与菜单对应关系';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('79', '1', '1');
INSERT INTO `sys_role_menu` VALUES ('80', '1', '2');
INSERT INTO `sys_role_menu` VALUES ('81', '1', '15');
INSERT INTO `sys_role_menu` VALUES ('82', '1', '16');
INSERT INTO `sys_role_menu` VALUES ('83', '1', '17');
INSERT INTO `sys_role_menu` VALUES ('84', '1', '18');
INSERT INTO `sys_role_menu` VALUES ('85', '1', '3');
INSERT INTO `sys_role_menu` VALUES ('86', '1', '19');
INSERT INTO `sys_role_menu` VALUES ('87', '1', '20');
INSERT INTO `sys_role_menu` VALUES ('88', '1', '21');
INSERT INTO `sys_role_menu` VALUES ('89', '1', '22');
INSERT INTO `sys_role_menu` VALUES ('90', '1', '4');
INSERT INTO `sys_role_menu` VALUES ('91', '1', '23');
INSERT INTO `sys_role_menu` VALUES ('92', '1', '24');
INSERT INTO `sys_role_menu` VALUES ('93', '1', '25');
INSERT INTO `sys_role_menu` VALUES ('94', '1', '26');
INSERT INTO `sys_role_menu` VALUES ('95', '1', '5');
INSERT INTO `sys_role_menu` VALUES ('96', '1', '6');
INSERT INTO `sys_role_menu` VALUES ('97', '1', '7');
INSERT INTO `sys_role_menu` VALUES ('98', '1', '8');
INSERT INTO `sys_role_menu` VALUES ('99', '1', '9');
INSERT INTO `sys_role_menu` VALUES ('100', '1', '10');
INSERT INTO `sys_role_menu` VALUES ('101', '1', '11');
INSERT INTO `sys_role_menu` VALUES ('102', '1', '12');
INSERT INTO `sys_role_menu` VALUES ('103', '1', '13');
INSERT INTO `sys_role_menu` VALUES ('104', '1', '14');
INSERT INTO `sys_role_menu` VALUES ('105', '1', '27');
INSERT INTO `sys_role_menu` VALUES ('106', '1', '29');
INSERT INTO `sys_role_menu` VALUES ('107', '1', '30');
INSERT INTO `sys_role_menu` VALUES ('108', '1', '31');
INSERT INTO `sys_role_menu` VALUES ('109', '1', '32');
INSERT INTO `sys_role_menu` VALUES ('110', '1', '33');
INSERT INTO `sys_role_menu` VALUES ('111', '1', '34');
INSERT INTO `sys_role_menu` VALUES ('112', '1', '35');
INSERT INTO `sys_role_menu` VALUES ('113', '1', '36');
INSERT INTO `sys_role_menu` VALUES ('114', '1', '37');
INSERT INTO `sys_role_menu` VALUES ('115', '1', '38');
INSERT INTO `sys_role_menu` VALUES ('116', '1', '39');
INSERT INTO `sys_role_menu` VALUES ('117', '1', '40');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL auto_increment,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(100) default NULL COMMENT '密码',
  `salt` varchar(20) default NULL COMMENT '盐',
  `email` varchar(100) default NULL COMMENT '邮箱',
  `mobile` varchar(100) default NULL COMMENT '手机号',
  `status` tinyint(4) default NULL COMMENT '状态  0：禁用   1：正常',
  `dept_id` bigint(20) default NULL COMMENT '部门ID',
  `create_time` datetime default NULL COMMENT '创建时间',
  PRIMARY KEY  (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', 'e1153123d7d180ceeb820d577ff119876678732a68eef4e6ffc0b1f06a01f91b', 'YzcmCZNvbXocrsz9dm8e', '10000@qq.com', '13612345678', '1', '1', '2018-05-11 11:11:11');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL auto_increment,
  `user_id` bigint(20) default NULL COMMENT '用户ID',
  `role_id` bigint(20) default NULL COMMENT '角色ID',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------

-- ----------------------------
-- Table structure for tb_token
-- ----------------------------
DROP TABLE IF EXISTS `tb_token`;
CREATE TABLE `tb_token` (
  `user_id` bigint(20) NOT NULL,
  `token` varchar(100) NOT NULL COMMENT 'token',
  `expire_time` datetime default NULL COMMENT '过期时间',
  `update_time` datetime default NULL COMMENT '更新时间',
  PRIMARY KEY  (`user_id`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户Token';

-- ----------------------------
-- Records of tb_token
-- ----------------------------

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `user_id` bigint(20) NOT NULL auto_increment,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `mobile` varchar(20) NOT NULL COMMENT '手机号',
  `password` varchar(64) default NULL COMMENT '密码',
  `create_time` datetime default NULL COMMENT '创建时间',
  PRIMARY KEY  (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户';

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('1', 'framework', '13612345678', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '2017-03-23 22:37:41');
