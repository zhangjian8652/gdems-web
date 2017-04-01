/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50625
Source Host           : localhost:3306
Source Database       : graduation_design_evaluation_ms

Target Server Type    : MYSQL
Target Server Version : 50625
File Encoding         : 65001

Date: 2017-04-01 17:58:26
*/

SET FOREIGN_KEY_CHECKS=0;

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
  `parent_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '父级编号',
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
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
  PRIMARY KEY (`id`),
  KEY `sys_menu_parent_id` (`parent_id`),
  KEY `sys_menu_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='菜单表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------

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
  `type` char(1) COLLATE utf8_unicode_ci NOT NULL COMMENT '机构类型',
  `grade` char(1) COLLATE utf8_unicode_ci NOT NULL COMMENT '机构等级',
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '联系地址',
  `zip_code` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '邮政编码',
  `master` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '负责人',
  `phone` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '电话',
  `fax` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '传真',
  `email` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `useable` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否启用',
  `primary_person` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '主负责人',
  `deputy_person` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '副负责人',
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
  `department_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '院系',
  `major_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '专业',
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
  `del_flag` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '删除标记',
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
INSERT INTO `sys_user` VALUES ('1', '1', '2', 'thinkgem', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0001', '系统管理员', 'thinkgem@163.com', '8675', '8675', null, null, '0:0:0:0:0:0:0:1', '2017-02-24 15:15:09', '1', '1', '2013-05-27 08:00:00', '1', '2016-03-17 18:14:22', '最高管理员', '0');
INSERT INTO `sys_user` VALUES ('10', '7', '11', 'jn_jsb', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0010', '济南技术部', null, null, null, null, null, null, null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_user` VALUES ('11', '12', '13', 'lc_admin', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0011', '济南历城领导', null, null, null, null, null, null, null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_user` VALUES ('12', '12', '18', 'lx_admin', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0012', '济南历下领导', null, null, null, null, null, null, null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_user` VALUES ('13', '22', '23', 'gx_admin', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0013', '济南高新领导', null, null, null, null, null, null, null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_user` VALUES ('2', '1', '2', 'sd_admin', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0002', '管理员', null, null, null, null, null, null, null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_user` VALUES ('3', '1', '3', 'sd_zhb', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0003', '综合部', null, null, null, null, null, null, null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_user` VALUES ('4', '1', '4', 'sd_scb', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0004', '市场部', null, null, null, null, null, null, null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_user` VALUES ('5', '1', '5', 'sd_jsb', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0005', '技术部', null, null, null, null, null, null, null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_user` VALUES ('6', '1', '6', 'sd_yfb', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0006', '研发部', null, null, null, null, null, null, null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_user` VALUES ('7', '7', '8', 'jn_admin', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0007', '济南领导', null, null, null, null, null, null, null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_user` VALUES ('8', '7', '9', 'jn_zhb', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0008', '济南综合部', null, null, null, null, null, null, null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_user` VALUES ('9', '7', '10', 'jn_scb', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0009', '济南市场部', null, null, null, null, null, null, null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_user` VALUES ('929f51a7fd694cd486928582f29bc153', '1', '2', 'zhangjian', '31ace546d14f7add7423867cbb6bc87a5e7bcc7e', 'zj000001', 'zhangjian', 'zz@zz.com', '18328358153', '18328358153', '3', null, '0:0:0:0:0:0:0:1', '2016-11-09 16:46:48', '1', '1', '2016-03-22 13:48:05', '929f51a7fd694cd486928582f29bc153', '2016-11-09 16:36:30', 'dfvgsdf', '0');

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
