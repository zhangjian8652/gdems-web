/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50625
Source Host           : localhost:3306
Source Database       : graduation_design_evaluation_ms

Target Server Type    : MYSQL
Target Server Version : 50625
File Encoding         : 65001

Date: 2017-05-03 17:30:07
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for gd_config
-- ----------------------------
DROP TABLE IF EXISTS `gd_config`;
CREATE TABLE `gd_config` (
  `config_key` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '配置项名称',
  `config_value` varchar(40) NOT NULL,
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '配置类型',
  PRIMARY KEY (`config_key`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gd_config
-- ----------------------------
INSERT INTO `gd_config` VALUES ('STUDENT_NUM', '5', 'SUBJECT');

-- ----------------------------
-- Table structure for gd_director_comment_book
-- ----------------------------
DROP TABLE IF EXISTS `gd_director_comment_book`;
CREATE TABLE `gd_director_comment_book` (
  `id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `student_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `plan_proof_score` int(2) DEFAULT NULL,
  `thesis_design_score` int(2) DEFAULT NULL,
  `workload_difficulty_score` int(2) DEFAULT NULL,
  `thesis_quality_score` int(2) DEFAULT NULL,
  `innovating_worth_score` int(2) DEFAULT NULL,
  `total_score` int(3) DEFAULT NULL,
  `director_comment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `update_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `update_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `create_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `del_flag` tinyint(2) DEFAULT NULL,
  `remarks` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of gd_director_comment_book
-- ----------------------------
INSERT INTO `gd_director_comment_book` VALUES ('02aed841-27e6-11e7-bf92-c85b7636065d', 'd8607faa-1c5d-11e7-a63f-c85b7636065d', '10', '30', '20', '20', '15', '95', '这都能\r\n洱海无人\r\n让他很温柔', '5884804e-1c5d-11e7-a63f-c85b7636065d', '2017-04-23 13:43:49', '5884804e-1c5d-11e7-a63f-c85b7636065d', '2017-04-23 13:30:48', '0', null);

-- ----------------------------
-- Table structure for gd_examination_comment_book
-- ----------------------------
DROP TABLE IF EXISTS `gd_examination_comment_book`;
CREATE TABLE `gd_examination_comment_book` (
  `id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `student_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `design_level_score` tinyint(2) DEFAULT NULL,
  `design_report_score` tinyint(2) DEFAULT NULL,
  `design_examination_score` tinyint(2) DEFAULT NULL,
  `total_score` tinyint(3) DEFAULT NULL,
  `examination_comment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `director_total_score` tinyint(3) DEFAULT NULL,
  `examination_total_score` tinyint(3) DEFAULT NULL,
  `comprehensive_performance_score` tinyint(3) DEFAULT NULL,
  `five_level_score` tinyint(3) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `create_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remarks` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `del_flag` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of gd_examination_comment_book
-- ----------------------------
INSERT INTO `gd_examination_comment_book` VALUES ('ae6d9e35-2902-11e7-bf92-c85b7636065d', 'd8607faa-1c5d-11e7-a63f-c85b7636065d', '13', '9', '19', '41', '梵蒂冈地方:是粉红蛇:都不是:让他jet结合:额呵呵然后:额太热人挺好:让他和任何:他和肉体和人', '9', '7', '10', '10', '2017-05-03 14:02:56', '5884804e-1c5d-11e7-a63f-c85b7636065d', '2017-04-24 23:28:30', '5884804e-1c5d-11e7-a63f-c85b7636065d', null, '0');

-- ----------------------------
-- Table structure for gd_mid_check
-- ----------------------------
DROP TABLE IF EXISTS `gd_mid_check`;
CREATE TABLE `gd_mid_check` (
  `id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `student_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `thesis_tittle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `finish` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `conformance` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `require_finish` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `finish_in_time` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `problems_solutions` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_by` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_by` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `update_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `remarks` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `del_flag` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of gd_mid_check
-- ----------------------------
INSERT INTO `gd_mid_check` VALUES ('a6906274-27d3-11e7-bf92-c85b7636065d', 'd8607faa-1c5d-11e7-a63f-c85b7636065d', '是的发表的说法是', '收费的不舒服的比赛得分', '符合', '阿斯顿v阿飞\r\n的防不胜防e\r\n而改为如果微软\r\n是的分布式发电', '能', '啊是v个\r\n热个人\r\n色温\r\n速度vs地方', '5884804e-1c5d-11e7-a63f-c85b7636065d', '2017-04-23 11:19:23', '5884804e-1c5d-11e7-a63f-c85b7636065d', '2017-04-23 11:34:48', null, '0');

-- ----------------------------
-- Table structure for gd_reviewer_comment_book
-- ----------------------------
DROP TABLE IF EXISTS `gd_reviewer_comment_book`;
CREATE TABLE `gd_reviewer_comment_book` (
  `id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `thesis_tittle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `student_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `standardize_degree_score` int(2) DEFAULT NULL,
  `content_quality_score` int(2) DEFAULT NULL,
  `innovating_worth_score` int(2) DEFAULT NULL,
  `total_score` int(3) DEFAULT NULL,
  `reviewer_comment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `update_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `create_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remarks` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `del_flag` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of gd_reviewer_comment_book
-- ----------------------------
INSERT INTO `gd_reviewer_comment_book` VALUES ('08939a82-28f7-11e7-bf92-c85b7636065d', null, 'd8607faa-1c5d-11e7-a63f-c85b7636065d', '14', '12', '15', '41', '软通货rtthere\r\n儿童和肉体和\r\n瑞特儿童和\r\n让他和肉体\r\n而瘫痪让她和', '2017-04-24 22:19:35', '5884804e-1c5d-11e7-a63f-c85b7636065d', '2017-04-24 22:05:07', '5884804e-1c5d-11e7-a63f-c85b7636065d', null, '0');

-- ----------------------------
-- Table structure for gd_subject
-- ----------------------------
DROP TABLE IF EXISTS `gd_subject`;
CREATE TABLE `gd_subject` (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '表主键',
  `tittle` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '选题标题',
  `source_from` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '选题来源',
  `requirement` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '要求',
  `from_date` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '开始时间',
  `end_date` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '结束时间',
  `graduation_date` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '毕业时间',
  `graduation_department` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '毕业学院',
  `main_task` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '主要任务',
  `create_date` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_date` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '创建人',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '更新人',
  `status` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '选题状态',
  `verify_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '审核人',
  `verify_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '审核时间',
  `choose_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '选择选题的人',
  `choose_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '选择选题时间',
  `choose_status` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '选择选题状态',
  `type` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '选题类型',
  `del_flag` tinyint(1) DEFAULT NULL,
  `remarks` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `director` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '导师id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gd_subject
-- ----------------------------
INSERT INTO `gd_subject` VALUES ('0d767549-227c-11e7-a6d2-c85b7636065d', '自己得选题一', '学生自选', '身边的人df ', '2017-04-05 00:00:00', '2017-05-12 00:00:00', '2017-06-16 00:00:00', null, '大范甘迪打分\n大坏蛋', '2017-04-16 16:09:40', '2017-04-22 17:26:54', '734d3f15-2264-11e7-a6d2-c85b7636065d', '734d3f15-2264-11e7-a6d2-c85b7636065d', 'CREATED', null, null, null, null, 'NONE_CHOOSE', '应用研究', '0', null, null);
INSERT INTO `gd_subject` VALUES ('12b75338-21aa-11e7-a6d2-c85b7636065d', '测试选题一', '教师自拟', '1.要求一\r\n2.要求二\r\n3.要求三\r\n4.要求四', '2017-04-22 17:40:22', '2017-04-22 17:40:22', '2017-04-22 17:40:22', null, '1.任务一\r\n2.任务二\r\n3.任务三\r\n4.任务四', '2017-04-22 17:40:22', '2017-04-22 17:40:22', '5884804e-1c5d-11e7-a63f-c85b7636065d', '5884804e-1c5d-11e7-a63f-c85b7636065d', 'APPROVED', '5884804e-1c5d-11e7-a63f-c85b7636065d', '2017-04-22 17:40:22', 'd8607faa-1c5d-11e7-a63f-c85b7636065d', '2017-04-22 17:40:22', 'APPROVED', '计算机软件', '0', null, '5884804e-1c5d-11e7-a63f-c85b7636065d');
INSERT INTO `gd_subject` VALUES ('4666c547-2249-11e7-a6d2-c85b7636065d', '我基于web的毕业设计考核系统', '教师科研', '东方早报\n的复合散热\n东方红是', '2017-04-01 00:00:00', '2017-05-31 00:00:00', '2017-06-16 00:00:00', null, '二哥色弱\n虽然热管色弱\n生日会生日会是\n十日谈\n是是都市和尚', '2017-04-16 10:06:12', '2017-04-16 10:06:12', '085924be-1c5e-11e7-a63f-c85b7636065d', '085924be-1c5e-11e7-a63f-c85b7636065d', 'CREATED', null, null, null, null, 'NONE_CHOOSE', '应用研究', '0', null, null);
INSERT INTO `gd_subject` VALUES ('4b3238a6-273f-11e7-9600-00ac8fea48d7', '我基于web的毕业设计考核系统3', '生产实践', 'dsfgwer g\n惹我给我\n 认为会发给我让他\n温哥华我\n', '2017-04-01 00:00:00', '2017-04-30 00:00:00', '2017-05-19 00:00:00', null, 'ewrgw撒旦我w\n如果为而\n个人我二哥', '2017-04-22 17:37:25', '2017-04-22 17:37:25', '085924be-1c5e-11e7-a63f-c85b7636065d', '085924be-1c5e-11e7-a63f-c85b7636065d', 'CREATED', null, null, null, null, 'NONE_CHOOSE', '社会调查', '0', null, null);
INSERT INTO `gd_subject` VALUES ('5d61eb84-21ab-11e7-a6d2-c85b7636065d', '测试标题二', '教师科研', null, '2017-04-16 12:58:41', '2017-04-16 12:58:41', '2017-04-16 12:58:41', null, null, '2017-04-16 12:58:41', '2017-05-03 13:52:38', '5884804e-1c5d-11e7-a63f-c85b7636065d', '734d3f15-2264-11e7-a6d2-c85b7636065d', 'APPROVED', '5884804e-1c5d-11e7-a63f-c85b7636065d', '2017-04-16 12:58:41', null, null, 'NONE_CHOOSE', '应用研究', '0', null, null);
INSERT INTO `gd_subject` VALUES ('67728a32-21ab-11e7-a6d2-c85b7636065d', '测试标题三', '教师科研', null, '2017-05-03 14:04:02', '2017-05-03 14:04:02', '2017-05-03 14:04:02', null, null, '2017-05-03 14:04:02', '2017-05-03 14:04:02', '5884804e-1c5d-11e7-a63f-c85b7636065d', '5884804e-1c5d-11e7-a63f-c85b7636065d', 'APPROVED', '5884804e-1c5d-11e7-a63f-c85b7636065d', '2017-05-03 14:04:02', '734d3f15-2264-11e7-a6d2-c85b7636065d', '2017-05-03 14:04:02', 'APPROVED', '应用研究', '0', null, 'c85b7636065d');
INSERT INTO `gd_subject` VALUES ('6baf686d-2249-11e7-a6d2-c85b7636065d', '我基于web的毕业设计考核系统2', '教师科研', '倒萨啊额个热\n生日歌色色 撒地方还是\n是人还是挺好发', '2017-04-01 00:00:00', '2017-05-31 00:00:00', '2017-05-17 00:00:00', null, '嘎热轧热是如何输入\n是如何如何是否会很舒服的\n少数人会私人海滩杀人\n说说让他和伤身体', '2017-04-16 10:07:14', '2017-04-16 11:44:32', '085924be-1c5e-11e7-a63f-c85b7636065d', '5884804e-1c5d-11e7-a63f-c85b7636065d', 'DENIED', '5884804e-1c5d-11e7-a63f-c85b7636065d', '2017-04-16 11:44:32', null, null, 'NONE_CHOOSE', '应用研究', '0', null, null);
INSERT INTO `gd_subject` VALUES ('a2a85524-2690-11e7-a6d2-c85b7636065d', '是否士大夫但是', '教师科研', '士大夫似的', '2017-04-01 00:00:00', '2017-04-14 00:00:00', '2017-05-03 00:00:00', null, '士大夫但是', '2017-04-21 20:47:19', '2017-04-21 20:47:19', '5884804e-1c5d-11e7-a63f-c85b7636065d', '5884804e-1c5d-11e7-a63f-c85b7636065d', 'CREATED', null, null, null, null, 'NONE_CHOOSE', '计算机软件', '0', null, null);
INSERT INTO `gd_subject` VALUES ('a54e847e-2244-11e7-a6d2-c85b7636065d', '选题测试机5', '教师科研', '的发表在法国\n\n二号染色体\n\n嗯虽然还是让他和收入', '2017-03-31 00:00:00', '2017-05-12 00:00:00', '2017-05-27 00:00:00', null, '豆瓣\n表示认同你托人试图让\n你突然身体瘦弱\n你说让你突然', '2017-04-16 09:33:03', '2017-04-16 09:33:03', '5884804e-1c5d-11e7-a63f-c85b7636065d', '5884804e-1c5d-11e7-a63f-c85b7636065d', 'CREATED', null, null, null, null, 'NONE_CHOOSE', '应用研究', '0', null, null);
INSERT INTO `gd_subject` VALUES ('d9d4be0c-21bb-11e7-a6d2-c85b7636065d', '测试标题二', '教师科研', null, '2017-04-16 12:58:41', '2017-04-16 12:58:41', '2017-04-16 12:58:41', null, null, '2017-04-16 12:58:41', '2017-05-03 14:01:57', '5884804e-1c5d-11e7-a63f-c85b7636065d', '5884804e-1c5d-11e7-a63f-c85b7636065d', 'APPROVED', '5884804e-1c5d-11e7-a63f-c85b7636065d', '2017-04-16 12:58:41', 'ea785038-2fc5-11e7-bf30-00ac8fea48d7', '2017-05-03 14:01:35', 'APPROVED', '应用研究', '0', null, '5884804e-1c5d-11e7-a63f-c85b7636065d');

-- ----------------------------
-- Table structure for gd_taskbook
-- ----------------------------
DROP TABLE IF EXISTS `gd_taskbook`;
CREATE TABLE `gd_taskbook` (
  `id` varchar(64) NOT NULL,
  `student_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '学生关联字段，sys_user.user_id',
  `thesis_tittle` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '论文（设计）题目',
  `requirement_content` varchar(255) DEFAULT NULL,
  `send_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `finish_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `practice_units` varchar(120) DEFAULT NULL,
  `practice_address` varchar(120) DEFAULT NULL,
  `thesis_page_count` int(3) DEFAULT NULL,
  `drawing_page_count` int(3) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_by` varchar(64) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `create_by` varchar(64) DEFAULT NULL,
  `professional_subject` varchar(120) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `del_flag` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gd_taskbook
-- ----------------------------
INSERT INTO `gd_taskbook` VALUES ('1c23fc41-27bb-11e7-bf92-c85b7636065d', 'd8607faa-1c5d-11e7-a63f-c85b7636065d', '的日本士大夫士大夫', '问他问题威尔刚\r\n问过我让他和我\r\n我让他和微软', '2017-04-01 00:00:00', '2017-04-28 00:00:00', '问如果微软和我', '微软给我仍然会', '11', '11', '2017-04-23 11:16:00', '5884804e-1c5d-11e7-a63f-c85b7636065d', null, null, '额我热温热微软', null, null);

-- ----------------------------
-- Table structure for sys_area
-- ----------------------------
DROP TABLE IF EXISTS `sys_area`;
CREATE TABLE `sys_area` (
  `id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '编号',
  `parent_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) COLLATE utf8_unicode_ci NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `code` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '区域编码',
  `type` char(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '区域类型',
  `create_by` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_area_parent_id` (`parent_id`),
  KEY `sys_area_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='区域表';

-- ----------------------------
-- Records of sys_area
-- ----------------------------

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '编号',
  `value` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '数据值',
  `label` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '标签名',
  `type` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '类型',
  `description` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '描述',
  `sort` decimal(10,0) NOT NULL COMMENT '排序（升序）',
  `parent_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '父级编号',
  `create_by` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_dict_value` (`value`),
  KEY `sys_dict_label` (`label`),
  KEY `sys_dict_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='字典表';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '编号',
  `type` char(1) COLLATE utf8_unicode_ci DEFAULT '1' COMMENT '日志类型',
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '日志标题',
  `create_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `remote_addr` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '操作IP地址',
  `user_agent` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户代理',
  `request_uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '请求URI',
  `method` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '操作方式',
  `params` text COLLATE utf8_unicode_ci COMMENT '操作提交的数据',
  `exception` text COLLATE utf8_unicode_ci COMMENT '异常信息',
  PRIMARY KEY (`id`),
  KEY `sys_log_create_by` (`create_by`),
  KEY `sys_log_request_uri` (`request_uri`),
  KEY `sys_log_type` (`type`),
  KEY `sys_log_create_date` (`create_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='日志表';

-- ----------------------------
-- Records of sys_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_mdict
-- ----------------------------
DROP TABLE IF EXISTS `sys_mdict`;
CREATE TABLE `sys_mdict` (
  `id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '编号',
  `parent_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) COLLATE utf8_unicode_ci NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `description` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '描述',
  `create_by` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_mdict_parent_id` (`parent_id`),
  KEY `sys_mdict_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='多级字典表';

-- ----------------------------
-- Records of sys_mdict
-- ----------------------------

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '编号',
  `parent_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '名称',
  `sort` decimal(10,0) DEFAULT NULL,
  `href` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '链接',
  `target` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '目标',
  `icon` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '图标',
  `is_show` char(1) COLLATE utf8_unicode_ci NOT NULL COMMENT '是否在菜单中显示',
  `permission` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '权限标识',
  `create_by` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '删除标记',
  `is_parent` char(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sys_menu_parent_id` (`parent_id`),
  KEY `sys_menu_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='菜单表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('033fff15-2181-11e7-a6d2-c85b7636065d', 'da4c1b62-1cf0-11e7-a63f-c85b7636065d', '我提交的选题', '1', '/gd/subject/list', null, 'fa-file-word-o', '0', 'gd:subject:list', 'admin', '2017-04-15 10:12:41', '5884804e-1c5d-11e7-a63f-c85b7636065d', '2017-04-22 16:47:14', null, '0', 'YES');
INSERT INTO `sys_menu` VALUES ('097cb6eb-1c40-11e7-a63f-c85b7636065d', 'd243ec63-1c3e-11e7-a63f-c85b7636065d', '机构添加', null, '/organization/add', null, 'fa-plus', '0', 'sys:organization:add', 'admin', '2017-04-08 17:45:00', 'admin', '2017-04-08 17:45:00', null, '0', null);
INSERT INTO `sys_menu` VALUES ('1', 'NO', '用户管理', '7', '', null, 'fa-users', '1', 'sys:user', 'admin', '2017-04-02 17:04:17', 'admin', '2017-04-12 22:28:06', null, '0', 'YES');
INSERT INTO `sys_menu` VALUES ('119a9278-2184-11e7-a6d2-c85b7636065d', 'da4c1b62-1cf0-11e7-a63f-c85b7636065d', '添加选题', '1', '/gd/subject/add', null, 'fa-plus-square', '0', 'gd:subject:add', 'admin', '2017-04-15 10:34:34', 'admin', '2017-04-15 10:34:34', null, '0', null);
INSERT INTO `sys_menu` VALUES ('1d01b01a-27c1-11e7-bf92-c85b7636065d', '2ff83d2a-2500-11e7-a6d2-c85b7636065d', '打印任务书', '1', '/gd/taskbook/print', null, 'fa-print', '0', 'gd:taskbook:print', '5884804e-1c5d-11e7-a63f-c85b7636065d', '2017-04-23 09:06:41', '5884804e-1c5d-11e7-a63f-c85b7636065d', '2017-04-23 09:06:41', null, '0', null);
INSERT INTO `sys_menu` VALUES ('2', '1', '用户列表', '1', '/user/list', '', 'fa-list-ul', '1', 'sys:user:list', 'admin', '2017-04-02 17:04:17', 'admin', '2017-04-02 17:04:25', null, '0', 'YES');
INSERT INTO `sys_menu` VALUES ('29599165-1df4-11e7-a63f-c85b7636065d', 'NO', '菜单管理', '4', '', null, 'fa-align-justify', '0', 'sys:menu', 'admin', '2017-04-10 21:47:00', 'admin', '2017-04-13 22:24:41', null, '0', 'YES');
INSERT INTO `sys_menu` VALUES ('2bf4af8c-224a-11e7-a6d2-c85b7636065d', 'da4c1b62-1cf0-11e7-a63f-c85b7636065d', '毕设管理配置', '1', '/gd/subject/config/edit', null, 'fa-edit', '0', 'gd:subject:config:edit', '5884804e-1c5d-11e7-a63f-c85b7636065d', '2017-04-16 10:12:37', '5884804e-1c5d-11e7-a63f-c85b7636065d', '2017-04-16 15:13:38', null, '0', null);
INSERT INTO `sys_menu` VALUES ('2e996641-1c40-11e7-a63f-c85b7636065d', 'e0454d76-1c3f-11e7-a63f-c85b7636065d', '机构编辑', null, '/organization/edit', null, '', '0', 'sys:organization:edit', 'admin', '2017-04-08 17:46:03', 'admin', '2017-04-08 17:46:03', null, '0', null);
INSERT INTO `sys_menu` VALUES ('2ff83d2a-2500-11e7-a6d2-c85b7636065d', 'da4c1b62-1cf0-11e7-a63f-c85b7636065d', '我指导的学生', '1', '/gd/mystudents/list', null, 'fa-file-word-o', '0', 'gd:mystudents:list', '5884804e-1c5d-11e7-a63f-c85b7636065d', '2017-04-19 21:00:33', '5884804e-1c5d-11e7-a63f-c85b7636065d', '2017-04-22 22:59:19', null, '0', 'YES');
INSERT INTO `sys_menu` VALUES ('3', '2', '用户编辑', '1', '/user/edit', '', null, '1', 'sys:user:edit', 'admin', '2017-04-02 17:04:17', 'admin', '2017-04-02 17:04:25', null, '0', null);
INSERT INTO `sys_menu` VALUES ('35e995fe-2264-11e7-a6d2-c85b7636065d', '033fff15-2181-11e7-a6d2-c85b7636065d', '选题选择审核', '1', '/gd/subject/choose/verify', null, 'fa-check-square', '0', 'gd:subject:choose:verify', '5884804e-1c5d-11e7-a63f-c85b7636065d', '2017-04-16 13:19:00', '5884804e-1c5d-11e7-a63f-c85b7636065d', '2017-04-16 13:19:00', null, '0', null);
INSERT INTO `sys_menu` VALUES ('36f8952c-1df4-11e7-a63f-c85b7636065d', '29599165-1df4-11e7-a63f-c85b7636065d', '菜单列表', '1', '/menu/list', null, 'fa-list-ul', '0', 'sys:menu:list', 'admin', '2017-04-10 21:47:23', 'admin', '2017-04-10 21:47:23', null, '0', 'YES');
INSERT INTO `sys_menu` VALUES ('381e695c-276d-11e7-bf92-c85b7636065d', '2ff83d2a-2500-11e7-a6d2-c85b7636065d', '编辑评议书', '1', '/gd/directorcommentbook/edit', null, '', '0', 'gd:directorcommentbook:edit', '5884804e-1c5d-11e7-a63f-c85b7636065d', '2017-04-22 23:06:10', '5884804e-1c5d-11e7-a63f-c85b7636065d', '2017-04-23 09:26:54', null, '0', null);
INSERT INTO `sys_menu` VALUES ('39cd541f-1917-11e7-b5b9-c85b7636065d', '858c7e6f8a624018a63ac8b4d2246d8a', '角色删除', '1', '/role/delete', null, 'fa-trash-o', '0', 'sys:role:delete', 'zhangjian', '2017-04-04 17:17:55', 'zhangjian', '2017-04-04 17:17:55', null, '0', null);
INSERT INTO `sys_menu` VALUES ('3d12dac4-2501-11e7-a6d2-c85b7636065d', '7ab7be99-28b2-11e7-9600-00ac8fea48d7', '评阅老师评议书', '1', '/gd/reviewercommentbook/edit', null, 'fa-file-word-o', '0', 'gd:reviewercommentbook:edit', '5884804e-1c5d-11e7-a63f-c85b7636065d', '2017-04-19 21:08:04', '5884804e-1c5d-11e7-a63f-c85b7636065d', '2017-04-24 21:27:14', null, '0', null);
INSERT INTO `sys_menu` VALUES ('495bec26-1df4-11e7-a63f-c85b7636065d', '29599165-1df4-11e7-a63f-c85b7636065d', '添加菜单', '1', '/menu/add', null, 'fa-plus', '0', 'sys:menu:add', 'admin', '2017-04-10 21:47:53', 'admin', '2017-04-10 21:47:53', null, '0', null);
INSERT INTO `sys_menu` VALUES ('4abb6a8e-1c40-11e7-a63f-c85b7636065d', 'e0454d76-1c3f-11e7-a63f-c85b7636065d', '机构删除', null, '/organization/delete', null, '', '0', 'sys:organization:delete', 'admin', '2017-04-08 17:46:50', 'admin', '2017-04-08 17:46:50', null, '0', null);
INSERT INTO `sys_menu` VALUES ('4e409c68-2904-11e7-bf92-c85b7636065d', '7ab7be99-28b2-11e7-9600-00ac8fea48d7', '打印答辩评议书', '1', '/gd/examinationcommentbook/print', null, 'fa-print', '0', 'gd:examinationcommentbook:print', '5884804e-1c5d-11e7-a63f-c85b7636065d', '2017-04-24 23:40:07', '5884804e-1c5d-11e7-a63f-c85b7636065d', '2017-04-26 13:50:56', null, '0', null);
INSERT INTO `sys_menu` VALUES ('5', '2', '用户删除', '1', '/user/delete', null, null, '1', 'sys:user:delete', 'admin', '2017-04-02 17:38:16', 'admin', '2017-04-02 17:38:16', null, '0', null);
INSERT INTO `sys_menu` VALUES ('50ccfecd-21b7-11e7-a6d2-c85b7636065d', '033fff15-2181-11e7-a6d2-c85b7636065d', '编辑选题', '1', '/gd/subject/edit', null, 'fa-wrench', '0', 'gd:subject:edit', 'admin', '2017-04-15 16:41:24', 'admin', '2017-04-15 16:41:24', null, '0', null);
INSERT INTO `sys_menu` VALUES ('51b64ddf-27c3-11e7-bf92-c85b7636065d', '2ff83d2a-2500-11e7-a6d2-c85b7636065d', '打印中期检查表', '1', '/gd/interimcheckbook/print', null, 'fa-print', '0', 'gd:interimcheckbook:print', '5884804e-1c5d-11e7-a63f-c85b7636065d', '2017-04-23 09:22:28', '5884804e-1c5d-11e7-a63f-c85b7636065d', '2017-04-23 09:22:28', null, '0', null);
INSERT INTO `sys_menu` VALUES ('5bc18d67-2500-11e7-a6d2-c85b7636065d', '2ff83d2a-2500-11e7-a6d2-c85b7636065d', '编辑任务书', '1', 'gd/taskbook/edit', null, 'fa-file-word-o', '0', 'gd:taskbook:edit', '5884804e-1c5d-11e7-a63f-c85b7636065d', '2017-04-19 21:01:46', '5884804e-1c5d-11e7-a63f-c85b7636065d', '2017-04-23 09:04:54', null, '0', null);
INSERT INTO `sys_menu` VALUES ('5e0efea5-21c2-11e7-a6d2-c85b7636065d', 'da4c1b62-1cf0-11e7-a63f-c85b7636065d', '可选选题', '1', '/gd/subject/available', null, 'fa-check', '0', 'gd:subject:available', 'admin', '2017-04-15 18:00:31', '5884804e-1c5d-11e7-a63f-c85b7636065d', '2017-04-16 12:09:47', null, '0', 'YES');
INSERT INTO `sys_menu` VALUES ('6', '1', '用户增加', '1', '/user/add', null, 'fa-plus', '1', 'sys:user:add', 'admin', '2017-04-02 18:02:51', 'admin', '2017-04-02 18:02:51', null, '0', null);
INSERT INTO `sys_menu` VALUES ('6be12160-225b-11e7-a6d2-c85b7636065d', '5e0efea5-21c2-11e7-a6d2-c85b7636065d', '选择选题', '1', '/gd/subject/choose', null, 'fa-thumbs-up', '0', 'gd:subject:choose', '5884804e-1c5d-11e7-a63f-c85b7636065d', '2017-04-16 12:16:05', '5884804e-1c5d-11e7-a63f-c85b7636065d', '2017-04-16 12:32:51', null, '0', null);
INSERT INTO `sys_menu` VALUES ('6f0b350b-2738-11e7-9600-00ac8fea48d7', 'da4c1b62-1cf0-11e7-a63f-c85b7636065d', '我的选题', '1', '/gd/subject/choose/detail', null, 'fa-bicycle', '0', 'gd:subject:choose:detail', '5884804e-1c5d-11e7-a63f-c85b7636065d', '2017-04-22 16:48:19', '5884804e-1c5d-11e7-a63f-c85b7636065d', '2017-04-22 16:48:19', null, '0', null);
INSERT INTO `sys_menu` VALUES ('7410789b-1919-11e7-b5b9-c85b7636065d', '858c7e6f8a624018a63ac8b4d2246d8a', '角色更新', '1', '/role/edit', null, 'fa-toggle-on', '0', 'sys:role:edit', 'zhangjian', '2017-04-04 17:33:52', 'zhangjian', '2017-04-04 17:33:52', null, '0', null);
INSERT INTO `sys_menu` VALUES ('7ab7be99-28b2-11e7-9600-00ac8fea48d7', 'da4c1b62-1cf0-11e7-a63f-c85b7636065d', '学生列表', '1', '/gd/subjectstudents/list', null, 'fa-graduation-cap', '0', 'gd:tsubjectstudents:list', '5884804e-1c5d-11e7-a63f-c85b7636065d', '2017-04-24 13:54:29', '5884804e-1c5d-11e7-a63f-c85b7636065d', '2017-04-24 20:39:34', null, '0', 'YES');
INSERT INTO `sys_menu` VALUES ('8037f2d9-28f7-11e7-bf92-c85b7636065d', '7ab7be99-28b2-11e7-9600-00ac8fea48d7', '打印评阅评议书', '1', '/gd/reviewercommentbook/print', null, 'fa-print', '0', 'gd:reviewercommentbook:print', '5884804e-1c5d-11e7-a63f-c85b7636065d', '2017-04-24 22:08:28', '5884804e-1c5d-11e7-a63f-c85b7636065d', '2017-04-26 14:07:57', null, '0', null);
INSERT INTO `sys_menu` VALUES ('858c7e6f8a624018a63ac8b4d2246d8a', '9256f07e5bc8463ca4175a673d505b29', '角色列表', '1', '/role/list', null, 'fa-list-ul', '0', 'sys:role:list', 'zhangjian', '2017-04-03 23:30:34', 'zhangjian', '2017-04-03 23:30:34', null, '0', 'YES');
INSERT INTO `sys_menu` VALUES ('8c9d083e-2fc3-11e7-bf30-00ac8fea48d7', 'da4c1b62-1cf0-11e7-a63f-c85b7636065d', '我的成绩', '1', '/gd/subject/choose/performance', null, 'fa-building-o', '0', 'gd:subject:choose:performance', '5884804e-1c5d-11e7-a63f-c85b7636065d', '2017-05-03 13:44:18', '5884804e-1c5d-11e7-a63f-c85b7636065d', '2017-05-03 13:48:52', null, '0', null);
INSERT INTO `sys_menu` VALUES ('8f638ac5-1915-11e7-b5b9-c85b7636065d', '9256f07e5bc8463ca4175a673d505b29', '角色添加', '1', '/role/add', null, 'fa-plus', '0', 'sys:role:add', 'zhangjian', '2017-04-04 17:06:00', 'zhangjian', '2017-04-04 17:06:00', null, '0', null);
INSERT INTO `sys_menu` VALUES ('9256f07e5bc8463ca4175a673d505b29', 'NO', '角色管理', '6', '', null, 'fa-user', '0', 'sys:role', 'zhangjian', '2017-04-03 23:07:39', 'admin', '2017-04-12 22:19:29', null, '0', 'YES');
INSERT INTO `sys_menu` VALUES ('928082c3-21b7-11e7-a6d2-c85b7636065d', '033fff15-2181-11e7-a6d2-c85b7636065d', '选题删除', '1', '/gd/subject/delete', null, 'fa-trash', '0', 'gd:subject:delete', 'admin', '2017-04-15 16:43:14', 'admin', '2017-04-15 16:43:14', null, '0', null);
INSERT INTO `sys_menu` VALUES ('9f746d33-21d3-11e7-a6d2-c85b7636065d', 'd1db8d5e-21d1-11e7-a6d2-c85b7636065d', '审核选题', '1', '/gd/subject/verify', null, 'fa-check-circle-o', '0', 'gd:subject:verify', '5884804e-1c5d-11e7-a63f-c85b7636065d', '2017-04-15 20:04:02', '5884804e-1c5d-11e7-a63f-c85b7636065d', '2017-04-16 12:35:32', null, '0', null);
INSERT INTO `sys_menu` VALUES ('a678d2e6-2500-11e7-a6d2-c85b7636065d', '2ff83d2a-2500-11e7-a6d2-c85b7636065d', '编辑中期检查表', '1', '/gd/interimcheckbook/edit', null, 'fa-file-word-o', '0', 'gd:interimcheckbook:edit', '5884804e-1c5d-11e7-a63f-c85b7636065d', '2017-04-19 21:03:51', '5884804e-1c5d-11e7-a63f-c85b7636065d', '2017-04-23 09:05:18', null, '0', null);
INSERT INTO `sys_menu` VALUES ('b591e6c6-1f8a-11e7-a63f-c85b7636065d', '36f8952c-1df4-11e7-a63f-c85b7636065d', '菜单删除', '1', '/menu/delete', null, '', '0', 'sys:menu:delete', 'admin', '2017-04-12 22:17:09', 'admin', '2017-04-12 22:17:09', null, '0', null);
INSERT INTO `sys_menu` VALUES ('b999ee26-27c3-11e7-bf92-c85b7636065d', '2ff83d2a-2500-11e7-a6d2-c85b7636065d', '打印评议书', '1', '/gd/directorcommentbook/print', null, 'fa-file-video-o', '0', 'gd:directorcommentbook:print', '5884804e-1c5d-11e7-a63f-c85b7636065d', '2017-04-23 09:25:23', '5884804e-1c5d-11e7-a63f-c85b7636065d', '2017-04-23 09:25:23', null, '0', null);
INSERT INTO `sys_menu` VALUES ('c4fbb540-1f8a-11e7-a63f-c85b7636065d', '36f8952c-1df4-11e7-a63f-c85b7636065d', '菜单更新', '1', '/menu/edit', null, '', '0', 'sys:menu:edit', 'admin', '2017-04-12 22:17:35', 'admin', '2017-04-12 22:17:35', null, '0', null);
INSERT INTO `sys_menu` VALUES ('c87ea01c-21cb-11e7-a6d2-c85b7636065d', '033fff15-2181-11e7-a6d2-c85b7636065d', '选题详情', '1', '/gd/subject/detail', null, 'fa-diamond', '0', 'gd:subject:detail', '5884804e-1c5d-11e7-a63f-c85b7636065d', '2017-04-15 19:07:55', '5884804e-1c5d-11e7-a63f-c85b7636065d', '2017-04-15 19:07:55', null, '0', null);
INSERT INTO `sys_menu` VALUES ('d1db8d5e-21d1-11e7-a6d2-c85b7636065d', 'da4c1b62-1cf0-11e7-a63f-c85b7636065d', '审核选题列表', '1', '/gd/subject/verify/list', null, 'fa-paw', '0', 'gd:subject:verify:list', '5884804e-1c5d-11e7-a63f-c85b7636065d', '2017-04-15 19:51:08', '5884804e-1c5d-11e7-a63f-c85b7636065d', '2017-04-15 20:02:40', null, '0', 'YES');
INSERT INTO `sys_menu` VALUES ('d243ec63-1c3e-11e7-a63f-c85b7636065d', 'NO', '机构管理', '2', '', null, 'fa-th', '0', 'sys:organization', 'admin', '2017-04-08 17:36:18', 'admin', '2017-04-12 22:28:23', null, '0', 'YES');
INSERT INTO `sys_menu` VALUES ('d92eaf58-2500-11e7-a6d2-c85b7636065d', '7ab7be99-28b2-11e7-9600-00ac8fea48d7', '答辩评议书', '1', '/gd/examinationcommentbook/edit', null, 'fa-file-word-o', '1', 'gd:examinationcommentbook:edit', '5884804e-1c5d-11e7-a63f-c85b7636065d', '2017-04-19 21:05:16', '5884804e-1c5d-11e7-a63f-c85b7636065d', '2017-04-24 20:43:26', null, '0', null);
INSERT INTO `sys_menu` VALUES ('da4c1b62-1cf0-11e7-a63f-c85b7636065d', 'NO', '毕业设计管理', '1', '', null, 'fa-cubes', '0', 'sys:gdem', 'admin', '2017-04-09 14:50:51', 'admin', '2017-04-13 22:00:04', null, '0', 'YES');
INSERT INTO `sys_menu` VALUES ('e0454d76-1c3f-11e7-a63f-c85b7636065d', 'd243ec63-1c3e-11e7-a63f-c85b7636065d', '机构列表', '1', '/organization/list', null, 'fa-list-ul', '0', 'sys:organization:list', 'admin', '2017-04-08 17:43:51', 'admin', '2017-04-08 17:43:51', null, '0', 'YES');

-- ----------------------------
-- Table structure for sys_organization
-- ----------------------------
DROP TABLE IF EXISTS `sys_organization`;
CREATE TABLE `sys_organization` (
  `id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '编号',
  `parent_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '父级编号',
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `area_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '归属区域',
  `code` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '区域编码',
  `type` char(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `grade` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '联系地址',
  `zip_code` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '邮政编码',
  `master` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '负责人',
  `phone` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '电话',
  `fax` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '传真',
  `email` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `useable` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否启用',
  `primary_person_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deputy_person_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_by` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_office_parent_id` (`parent_id`),
  KEY `sys_office_del_flag` (`del_flag`),
  KEY `sys_office_type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='机构表';

-- ----------------------------
-- Records of sys_organization
-- ----------------------------
INSERT INTO `sys_organization` VALUES ('152d1426-2768-11e7-bf92-c85b7636065d', 'c31d873d-2741-11e7-9600-00ac8fea48d7', 'XJDX201706', '1', 'temp', null, 'class', null, null, null, '5884804e-1c5d-11e7-a63f-c85b7636065d', null, null, null, null, null, null, '5884804e-1c5d-11e7-a63f-c85b7636065d', '2017-04-22 22:29:24', '5884804e-1c5d-11e7-a63f-c85b7636065d', '2017-04-22 22:29:24', null, '0');
INSERT INTO `sys_organization` VALUES ('b569aa56-1cdf-11e7-a63f-c85b7636065d', 'NO', '软件学院', '1', 'temp', null, 'department', null, null, null, '085924be-1c5e-11e7-a63f-c85b7636065d', null, null, null, null, null, null, 'admin', '2017-04-09 12:48:07', 'admin', '2017-04-09 12:48:07', null, '0');
INSERT INTO `sys_organization` VALUES ('c1bd4726-21d2-11e7-a6d2-c85b7636065d', 'NO', '信息学院', '1', 'temp', null, 'department', null, null, null, 'd8607faa-1c5d-11e7-a63f-c85b7636065d', null, null, null, null, null, null, '5884804e-1c5d-11e7-a63f-c85b7636065d', '2017-04-15 19:57:50', '5884804e-1c5d-11e7-a63f-c85b7636065d', '2017-04-15 19:57:50', null, '0');
INSERT INTO `sys_organization` VALUES ('c31d873d-2741-11e7-9600-00ac8fea48d7', 'b569aa56-1cdf-11e7-a63f-c85b7636065d', '软件专业', '1', 'temp', null, 'major', null, null, null, '5884804e-1c5d-11e7-a63f-c85b7636065d', null, null, null, null, null, null, '5884804e-1c5d-11e7-a63f-c85b7636065d', '2017-04-22 17:55:06', '5884804e-1c5d-11e7-a63f-c85b7636065d', '2017-04-22 17:55:06', null, '0');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '编号',
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '角色名称',
  `english_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '英文名称',
  `role_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '角色类型',
  `data_scope` char(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '数据范围',
  `useable` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否可用',
  `create_by` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_role_del_flag` (`del_flag`),
  KEY `sys_role_enname` (`english_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '学生', 'student', 'NORMAL', null, 'ACTIVE', 'admin', '2017-04-02 17:00:24', '5884804e-1c5d-11e7-a63f-c85b7636065d', '2017-05-03 13:45:16', null, '0');
INSERT INTO `sys_role` VALUES ('579cd02e-2501-11e7-a6d2-c85b7636065d', '评阅老师', '', 'NORMAL', null, 'ACTIVE', '5884804e-1c5d-11e7-a63f-c85b7636065d', '2017-04-19 21:09:08', '5884804e-1c5d-11e7-a63f-c85b7636065d', '2017-04-26 14:08:40', null, '0');
INSERT INTO `sys_role` VALUES ('6ffcdadf-1c43-11e7-a63f-c85b7636065d', '导师', '', 'NORMAL', null, 'ACTIVE', 'admin', '2017-04-08 18:09:21', '5884804e-1c5d-11e7-a63f-c85b7636065d', '2017-04-26 14:09:49', null, '0');
INSERT INTO `sys_role` VALUES ('7c94a9f3-1c54-11e7-a63f-c85b7636065d', '答辩老师', '', 'NORMAL', null, 'ACTIVE', 'admin', '2017-04-08 20:11:35', '5884804e-1c5d-11e7-a63f-c85b7636065d', '2017-04-26 14:06:47', null, '0');
INSERT INTO `sys_role` VALUES ('84c5258c-1c45-11e7-a63f-c85b7636065d', '管理员', 'administrator', 'NORMAL', null, 'ACTIVE', 'admin', '2017-04-08 18:24:15', '5884804e-1c5d-11e7-a63f-c85b7636065d', '2017-04-24 23:40:19', null, '0');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '角色编号',
  `menu_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '菜单编号',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='角色-菜单';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('1', '033fff15-2181-11e7-a6d2-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('1', '119a9278-2184-11e7-a6d2-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('1', '50ccfecd-21b7-11e7-a6d2-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('1', '5e0efea5-21c2-11e7-a6d2-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('1', '6be12160-225b-11e7-a6d2-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('1', '6f0b350b-2738-11e7-9600-00ac8fea48d7');
INSERT INTO `sys_role_menu` VALUES ('1', '8c9d083e-2fc3-11e7-bf30-00ac8fea48d7');
INSERT INTO `sys_role_menu` VALUES ('1', '928082c3-21b7-11e7-a6d2-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('1', 'c87ea01c-21cb-11e7-a6d2-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('1', 'da4c1b62-1cf0-11e7-a63f-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('2feb7f1e-1914-11e7-b5b9-c85b7636065d', '1');
INSERT INTO `sys_role_menu` VALUES ('2feb7f1e-1914-11e7-b5b9-c85b7636065d', '2');
INSERT INTO `sys_role_menu` VALUES ('2feb7f1e-1914-11e7-b5b9-c85b7636065d', '3');
INSERT INTO `sys_role_menu` VALUES ('2feb7f1e-1914-11e7-b5b9-c85b7636065d', '4');
INSERT INTO `sys_role_menu` VALUES ('2feb7f1e-1914-11e7-b5b9-c85b7636065d', '5');
INSERT INTO `sys_role_menu` VALUES ('2feb7f1e-1914-11e7-b5b9-c85b7636065d', '6');
INSERT INTO `sys_role_menu` VALUES ('2feb7f1e-1914-11e7-b5b9-c85b7636065d', '858c7e6f8a624018a63ac8b4d2246d8a');
INSERT INTO `sys_role_menu` VALUES ('2feb7f1e-1914-11e7-b5b9-c85b7636065d', '9256f07e5bc8463ca4175a673d505b29');
INSERT INTO `sys_role_menu` VALUES ('579cd02e-2501-11e7-a6d2-c85b7636065d', '3d12dac4-2501-11e7-a6d2-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('579cd02e-2501-11e7-a6d2-c85b7636065d', '7ab7be99-28b2-11e7-9600-00ac8fea48d7');
INSERT INTO `sys_role_menu` VALUES ('579cd02e-2501-11e7-a6d2-c85b7636065d', '8037f2d9-28f7-11e7-bf92-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('579cd02e-2501-11e7-a6d2-c85b7636065d', 'da4c1b62-1cf0-11e7-a63f-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('6adb1fde-1913-11e7-b5b9-c85b7636065d', '1');
INSERT INTO `sys_role_menu` VALUES ('6ffcdadf-1c43-11e7-a63f-c85b7636065d', '033fff15-2181-11e7-a6d2-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('6ffcdadf-1c43-11e7-a63f-c85b7636065d', '119a9278-2184-11e7-a6d2-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('6ffcdadf-1c43-11e7-a63f-c85b7636065d', '1d01b01a-27c1-11e7-bf92-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('6ffcdadf-1c43-11e7-a63f-c85b7636065d', '2ff83d2a-2500-11e7-a6d2-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('6ffcdadf-1c43-11e7-a63f-c85b7636065d', '35e995fe-2264-11e7-a6d2-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('6ffcdadf-1c43-11e7-a63f-c85b7636065d', '381e695c-276d-11e7-bf92-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('6ffcdadf-1c43-11e7-a63f-c85b7636065d', '50ccfecd-21b7-11e7-a6d2-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('6ffcdadf-1c43-11e7-a63f-c85b7636065d', '51b64ddf-27c3-11e7-bf92-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('6ffcdadf-1c43-11e7-a63f-c85b7636065d', '5bc18d67-2500-11e7-a6d2-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('6ffcdadf-1c43-11e7-a63f-c85b7636065d', '928082c3-21b7-11e7-a6d2-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('6ffcdadf-1c43-11e7-a63f-c85b7636065d', 'a678d2e6-2500-11e7-a6d2-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('6ffcdadf-1c43-11e7-a63f-c85b7636065d', 'b999ee26-27c3-11e7-bf92-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('6ffcdadf-1c43-11e7-a63f-c85b7636065d', 'c87ea01c-21cb-11e7-a6d2-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('6ffcdadf-1c43-11e7-a63f-c85b7636065d', 'da4c1b62-1cf0-11e7-a63f-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('7c94a9f3-1c54-11e7-a63f-c85b7636065d', '4e409c68-2904-11e7-bf92-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('7c94a9f3-1c54-11e7-a63f-c85b7636065d', '7ab7be99-28b2-11e7-9600-00ac8fea48d7');
INSERT INTO `sys_role_menu` VALUES ('7c94a9f3-1c54-11e7-a63f-c85b7636065d', 'd92eaf58-2500-11e7-a6d2-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('7c94a9f3-1c54-11e7-a63f-c85b7636065d', 'da4c1b62-1cf0-11e7-a63f-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('7f168309-1c4a-11e7-a63f-c85b7636065d', '097cb6eb-1c40-11e7-a63f-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('7f168309-1c4a-11e7-a63f-c85b7636065d', '1');
INSERT INTO `sys_role_menu` VALUES ('7f168309-1c4a-11e7-a63f-c85b7636065d', '2');
INSERT INTO `sys_role_menu` VALUES ('7f168309-1c4a-11e7-a63f-c85b7636065d', '2e996641-1c40-11e7-a63f-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('7f168309-1c4a-11e7-a63f-c85b7636065d', '3');
INSERT INTO `sys_role_menu` VALUES ('7f168309-1c4a-11e7-a63f-c85b7636065d', '39cd541f-1917-11e7-b5b9-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('7f168309-1c4a-11e7-a63f-c85b7636065d', '4');
INSERT INTO `sys_role_menu` VALUES ('7f168309-1c4a-11e7-a63f-c85b7636065d', '4abb6a8e-1c40-11e7-a63f-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('7f168309-1c4a-11e7-a63f-c85b7636065d', '5');
INSERT INTO `sys_role_menu` VALUES ('7f168309-1c4a-11e7-a63f-c85b7636065d', '6');
INSERT INTO `sys_role_menu` VALUES ('7f168309-1c4a-11e7-a63f-c85b7636065d', '7410789b-1919-11e7-b5b9-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('7f168309-1c4a-11e7-a63f-c85b7636065d', '858c7e6f8a624018a63ac8b4d2246d8a');
INSERT INTO `sys_role_menu` VALUES ('7f168309-1c4a-11e7-a63f-c85b7636065d', '8f638ac5-1915-11e7-b5b9-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('7f168309-1c4a-11e7-a63f-c85b7636065d', '9256f07e5bc8463ca4175a673d505b29');
INSERT INTO `sys_role_menu` VALUES ('7f168309-1c4a-11e7-a63f-c85b7636065d', 'd243ec63-1c3e-11e7-a63f-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('7f168309-1c4a-11e7-a63f-c85b7636065d', 'e0454d76-1c3f-11e7-a63f-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('84c5258c-1c45-11e7-a63f-c85b7636065d', '033fff15-2181-11e7-a6d2-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('84c5258c-1c45-11e7-a63f-c85b7636065d', '097cb6eb-1c40-11e7-a63f-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('84c5258c-1c45-11e7-a63f-c85b7636065d', '1');
INSERT INTO `sys_role_menu` VALUES ('84c5258c-1c45-11e7-a63f-c85b7636065d', '119a9278-2184-11e7-a6d2-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('84c5258c-1c45-11e7-a63f-c85b7636065d', '1d01b01a-27c1-11e7-bf92-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('84c5258c-1c45-11e7-a63f-c85b7636065d', '2');
INSERT INTO `sys_role_menu` VALUES ('84c5258c-1c45-11e7-a63f-c85b7636065d', '29599165-1df4-11e7-a63f-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('84c5258c-1c45-11e7-a63f-c85b7636065d', '2bf4af8c-224a-11e7-a6d2-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('84c5258c-1c45-11e7-a63f-c85b7636065d', '2e996641-1c40-11e7-a63f-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('84c5258c-1c45-11e7-a63f-c85b7636065d', '2ff83d2a-2500-11e7-a6d2-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('84c5258c-1c45-11e7-a63f-c85b7636065d', '3');
INSERT INTO `sys_role_menu` VALUES ('84c5258c-1c45-11e7-a63f-c85b7636065d', '35e995fe-2264-11e7-a6d2-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('84c5258c-1c45-11e7-a63f-c85b7636065d', '36f8952c-1df4-11e7-a63f-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('84c5258c-1c45-11e7-a63f-c85b7636065d', '381e695c-276d-11e7-bf92-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('84c5258c-1c45-11e7-a63f-c85b7636065d', '39cd541f-1917-11e7-b5b9-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('84c5258c-1c45-11e7-a63f-c85b7636065d', '3d12dac4-2501-11e7-a6d2-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('84c5258c-1c45-11e7-a63f-c85b7636065d', '495bec26-1df4-11e7-a63f-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('84c5258c-1c45-11e7-a63f-c85b7636065d', '4abb6a8e-1c40-11e7-a63f-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('84c5258c-1c45-11e7-a63f-c85b7636065d', '4e409c68-2904-11e7-bf92-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('84c5258c-1c45-11e7-a63f-c85b7636065d', '5');
INSERT INTO `sys_role_menu` VALUES ('84c5258c-1c45-11e7-a63f-c85b7636065d', '50ccfecd-21b7-11e7-a6d2-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('84c5258c-1c45-11e7-a63f-c85b7636065d', '51b64ddf-27c3-11e7-bf92-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('84c5258c-1c45-11e7-a63f-c85b7636065d', '5bc18d67-2500-11e7-a6d2-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('84c5258c-1c45-11e7-a63f-c85b7636065d', '5e0efea5-21c2-11e7-a6d2-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('84c5258c-1c45-11e7-a63f-c85b7636065d', '6');
INSERT INTO `sys_role_menu` VALUES ('84c5258c-1c45-11e7-a63f-c85b7636065d', '6be12160-225b-11e7-a6d2-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('84c5258c-1c45-11e7-a63f-c85b7636065d', '6f0b350b-2738-11e7-9600-00ac8fea48d7');
INSERT INTO `sys_role_menu` VALUES ('84c5258c-1c45-11e7-a63f-c85b7636065d', '7410789b-1919-11e7-b5b9-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('84c5258c-1c45-11e7-a63f-c85b7636065d', '7ab7be99-28b2-11e7-9600-00ac8fea48d7');
INSERT INTO `sys_role_menu` VALUES ('84c5258c-1c45-11e7-a63f-c85b7636065d', '8037f2d9-28f7-11e7-bf92-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('84c5258c-1c45-11e7-a63f-c85b7636065d', '858c7e6f8a624018a63ac8b4d2246d8a');
INSERT INTO `sys_role_menu` VALUES ('84c5258c-1c45-11e7-a63f-c85b7636065d', '8f638ac5-1915-11e7-b5b9-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('84c5258c-1c45-11e7-a63f-c85b7636065d', '9256f07e5bc8463ca4175a673d505b29');
INSERT INTO `sys_role_menu` VALUES ('84c5258c-1c45-11e7-a63f-c85b7636065d', '928082c3-21b7-11e7-a6d2-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('84c5258c-1c45-11e7-a63f-c85b7636065d', '9f746d33-21d3-11e7-a6d2-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('84c5258c-1c45-11e7-a63f-c85b7636065d', 'a678d2e6-2500-11e7-a6d2-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('84c5258c-1c45-11e7-a63f-c85b7636065d', 'b591e6c6-1f8a-11e7-a63f-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('84c5258c-1c45-11e7-a63f-c85b7636065d', 'b999ee26-27c3-11e7-bf92-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('84c5258c-1c45-11e7-a63f-c85b7636065d', 'c4fbb540-1f8a-11e7-a63f-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('84c5258c-1c45-11e7-a63f-c85b7636065d', 'c87ea01c-21cb-11e7-a6d2-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('84c5258c-1c45-11e7-a63f-c85b7636065d', 'd1db8d5e-21d1-11e7-a6d2-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('84c5258c-1c45-11e7-a63f-c85b7636065d', 'd243ec63-1c3e-11e7-a63f-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('84c5258c-1c45-11e7-a63f-c85b7636065d', 'd92eaf58-2500-11e7-a6d2-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('84c5258c-1c45-11e7-a63f-c85b7636065d', 'da4c1b62-1cf0-11e7-a63f-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('84c5258c-1c45-11e7-a63f-c85b7636065d', 'e0454d76-1c3f-11e7-a63f-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('86488466-1c54-11e7-a63f-c85b7636065d', '097cb6eb-1c40-11e7-a63f-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('86488466-1c54-11e7-a63f-c85b7636065d', '1');
INSERT INTO `sys_role_menu` VALUES ('86488466-1c54-11e7-a63f-c85b7636065d', '2');
INSERT INTO `sys_role_menu` VALUES ('86488466-1c54-11e7-a63f-c85b7636065d', '2e996641-1c40-11e7-a63f-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('86488466-1c54-11e7-a63f-c85b7636065d', '3');
INSERT INTO `sys_role_menu` VALUES ('86488466-1c54-11e7-a63f-c85b7636065d', '39cd541f-1917-11e7-b5b9-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('86488466-1c54-11e7-a63f-c85b7636065d', '4');
INSERT INTO `sys_role_menu` VALUES ('86488466-1c54-11e7-a63f-c85b7636065d', '4abb6a8e-1c40-11e7-a63f-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('86488466-1c54-11e7-a63f-c85b7636065d', '5');
INSERT INTO `sys_role_menu` VALUES ('86488466-1c54-11e7-a63f-c85b7636065d', '6');
INSERT INTO `sys_role_menu` VALUES ('86488466-1c54-11e7-a63f-c85b7636065d', '7410789b-1919-11e7-b5b9-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('86488466-1c54-11e7-a63f-c85b7636065d', '858c7e6f8a624018a63ac8b4d2246d8a');
INSERT INTO `sys_role_menu` VALUES ('86488466-1c54-11e7-a63f-c85b7636065d', '8f638ac5-1915-11e7-b5b9-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('86488466-1c54-11e7-a63f-c85b7636065d', '9256f07e5bc8463ca4175a673d505b29');
INSERT INTO `sys_role_menu` VALUES ('86488466-1c54-11e7-a63f-c85b7636065d', 'd243ec63-1c3e-11e7-a63f-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('86488466-1c54-11e7-a63f-c85b7636065d', 'e0454d76-1c3f-11e7-a63f-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('8db4b5dc-1c54-11e7-a63f-c85b7636065d', '097cb6eb-1c40-11e7-a63f-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('8db4b5dc-1c54-11e7-a63f-c85b7636065d', '1');
INSERT INTO `sys_role_menu` VALUES ('8db4b5dc-1c54-11e7-a63f-c85b7636065d', '2');
INSERT INTO `sys_role_menu` VALUES ('8db4b5dc-1c54-11e7-a63f-c85b7636065d', '2e996641-1c40-11e7-a63f-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('8db4b5dc-1c54-11e7-a63f-c85b7636065d', '3');
INSERT INTO `sys_role_menu` VALUES ('8db4b5dc-1c54-11e7-a63f-c85b7636065d', '39cd541f-1917-11e7-b5b9-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('8db4b5dc-1c54-11e7-a63f-c85b7636065d', '4');
INSERT INTO `sys_role_menu` VALUES ('8db4b5dc-1c54-11e7-a63f-c85b7636065d', '4abb6a8e-1c40-11e7-a63f-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('8db4b5dc-1c54-11e7-a63f-c85b7636065d', '5');
INSERT INTO `sys_role_menu` VALUES ('8db4b5dc-1c54-11e7-a63f-c85b7636065d', '6');
INSERT INTO `sys_role_menu` VALUES ('8db4b5dc-1c54-11e7-a63f-c85b7636065d', '7410789b-1919-11e7-b5b9-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('8db4b5dc-1c54-11e7-a63f-c85b7636065d', '858c7e6f8a624018a63ac8b4d2246d8a');
INSERT INTO `sys_role_menu` VALUES ('8db4b5dc-1c54-11e7-a63f-c85b7636065d', '8f638ac5-1915-11e7-b5b9-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('8db4b5dc-1c54-11e7-a63f-c85b7636065d', '9256f07e5bc8463ca4175a673d505b29');
INSERT INTO `sys_role_menu` VALUES ('8db4b5dc-1c54-11e7-a63f-c85b7636065d', 'd243ec63-1c3e-11e7-a63f-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('8db4b5dc-1c54-11e7-a63f-c85b7636065d', 'e0454d76-1c3f-11e7-a63f-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('a89a2804-1913-11e7-b5b9-c85b7636065d', '1');

-- ----------------------------
-- Table structure for sys_role_office
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_office`;
CREATE TABLE `sys_role_office` (
  `role_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '角色编号',
  `office_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '机构编号',
  PRIMARY KEY (`role_id`,`office_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='角色-机构';

-- ----------------------------
-- Records of sys_role_office
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '编号',
  `department_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `major_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `login_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '登录名',
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '密码',
  `no` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '工号',
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '姓名',
  `email` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '电话',
  `mobile` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '手机',
  `user_type` char(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户类型',
  `photo` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户头像',
  `login_ip` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '最后登陆IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `login_flag` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否可登录',
  `create_by` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '删除标记',
  `professional_rank` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `class_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sys_user_office_id` (`major_id`),
  KEY `sys_user_login_name` (`login_name`),
  KEY `sys_user_company_id` (`department_id`),
  KEY `sys_user_update_date` (`update_date`),
  KEY `sys_user_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('085924be-1c5e-11e7-a63f-c85b7636065d', '68411167-1add-11e7-b5b9-c85b7636065d', null, 'director', '31ace546d14f7add7423867cbb6bc87a5e7bcc7e', null, 'director', 'director@qq.com', null, '18328358153', null, null, null, null, null, 'admin', '2017-04-08 21:19:55', 'admin', '2017-04-08 21:19:55', null, '0', '', null);
INSERT INTO `sys_user` VALUES ('5884804e-1c5d-11e7-a63f-c85b7636065d', 'b569aa56-1cdf-11e7-a63f-c85b7636065d', 'c31d873d-2741-11e7-9600-00ac8fea48d7', 'admin', '31ace546d14f7add7423867cbb6bc87a5e7bcc7e', 'XJT33012', '超级无敌管理员', 'admin@qq.com', null, '18328358152', null, null, null, null, null, 'admin', '2017-04-08 21:15:00', 'admin', '2017-04-08 21:15:00', null, '0', '', '152d1426-2768-11e7-bf92-c85b7636065d');
INSERT INTO `sys_user` VALUES ('71a9a7a4-1c5e-11e7-a63f-c85b7636065d', 'b569aa56-1cdf-11e7-a63f-c85b7636065d', null, 'jimy', '31ace546d14f7add7423867cbb6bc87a5e7bcc7e', null, 'jimy', 'jiamy@qq.com', null, '18328358155', null, null, null, null, null, 'admin', '2017-04-08 21:22:52', 'admin', '2017-04-08 21:22:52', null, '0', '', null);
INSERT INTO `sys_user` VALUES ('734d3f15-2264-11e7-a6d2-c85b7636065d', 'b569aa56-1cdf-11e7-a63f-c85b7636065d', 'c31d873d-2741-11e7-9600-00ac8fea48d7', 'student', '31ace546d14f7add7423867cbb6bc87a5e7bcc7e', '', 'student', 'student@qq.com', null, '18328358152', null, null, null, null, null, '5884804e-1c5d-11e7-a63f-c85b7636065d', '2017-04-16 13:20:43', '5884804e-1c5d-11e7-a63f-c85b7636065d', '2017-04-16 13:20:43', null, '0', '', null);
INSERT INTO `sys_user` VALUES ('8cd7220d-2a49-11e7-9600-00ac8fea48d7', null, null, 'reviewer', '31ace546d14f7add7423867cbb6bc87a5e7bcc7e', 'xsas231543', '评阅老师A', 'reviewer@qq.cvsd', null, '18328358153', null, null, null, null, null, '5884804e-1c5d-11e7-a63f-c85b7636065d', '2017-04-26 14:28:24', '5884804e-1c5d-11e7-a63f-c85b7636065d', '2017-04-26 14:28:24', null, '0', null, null);
INSERT INTO `sys_user` VALUES ('d8607faa-1c5d-11e7-a63f-c85b7636065d', 'b569aa56-1cdf-11e7-a63f-c85b7636065d', 'c31d873d-2741-11e7-9600-00ac8fea48d7', 'zhengzhe', '31ace546d14f7add7423867cbb6bc87a5e7bcc7e', 'XXX123456789', 'zhengzhe', 'zhengzhe@qq.com', null, '18328358153', null, null, null, null, null, 'admin', '2017-04-08 21:18:35', 'admin', '2017-04-08 21:18:35', null, '0', '', '152d1426-2768-11e7-bf92-c85b7636065d');
INSERT INTO `sys_user` VALUES ('ea785038-2fc5-11e7-bf30-00ac8fea48d7', 'b569aa56-1cdf-11e7-a63f-c85b7636065d', 'c31d873d-2741-11e7-9600-00ac8fea48d7', 'student2', '31ace546d14f7add7423867cbb6bc87a5e7bcc7e', 'sdefare2345', '无', 'student2@qq.com', null, '18328358153', null, null, null, null, null, '5884804e-1c5d-11e7-a63f-c85b7636065d', '2017-05-03 14:01:15', '5884804e-1c5d-11e7-a63f-c85b7636065d', '2017-05-03 14:01:15', null, '0', null, '152d1426-2768-11e7-bf92-c85b7636065d');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '用户编号',
  `role_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '角色编号',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='用户-角色';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('00cd26bd-1c55-11e7-a63f-c85b7636065d', '6ffcdadf-1c43-11e7-a63f-c85b7636065d');
INSERT INTO `sys_user_role` VALUES ('049abb8e-1c57-11e7-a63f-c85b7636065d', '6ffcdadf-1c43-11e7-a63f-c85b7636065d');
INSERT INTO `sys_user_role` VALUES ('085924be-1c5e-11e7-a63f-c85b7636065d', '6ffcdadf-1c43-11e7-a63f-c85b7636065d');
INSERT INTO `sys_user_role` VALUES ('29277868-1c2b-11e7-a63f-c85b7636065d', '1');
INSERT INTO `sys_user_role` VALUES ('46bd9ef0-1c5c-11e7-a63f-c85b7636065d', '1');
INSERT INTO `sys_user_role` VALUES ('5884804e-1c5d-11e7-a63f-c85b7636065d', '84c5258c-1c45-11e7-a63f-c85b7636065d');
INSERT INTO `sys_user_role` VALUES ('71a9a7a4-1c5e-11e7-a63f-c85b7636065d', '7c94a9f3-1c54-11e7-a63f-c85b7636065d');
INSERT INTO `sys_user_role` VALUES ('734d3f15-2264-11e7-a6d2-c85b7636065d', '1');
INSERT INTO `sys_user_role` VALUES ('8cd7220d-2a49-11e7-9600-00ac8fea48d7', '579cd02e-2501-11e7-a6d2-c85b7636065d');
INSERT INTO `sys_user_role` VALUES ('929f51a7fd694cd486928582f29bc153', '1');
INSERT INTO `sys_user_role` VALUES ('929f51a7fd694cd486928582f29bc15q', '1');
INSERT INTO `sys_user_role` VALUES ('a943873f-1c55-11e7-a63f-c85b7636065d', '6ffcdadf-1c43-11e7-a63f-c85b7636065d');
INSERT INTO `sys_user_role` VALUES ('d8607faa-1c5d-11e7-a63f-c85b7636065d', '1');
INSERT INTO `sys_user_role` VALUES ('ea785038-2fc5-11e7-bf30-00ac8fea48d7', '1');
INSERT INTO `sys_user_role` VALUES ('f468482c-1c5d-11e7-a63f-c85b7636065d', '6ffcdadf-1c43-11e7-a63f-c85b7636065d');
INSERT INTO `sys_user_role` VALUES ('fbd3f277-1c2a-11e7-a63f-c85b7636065d', '1');
