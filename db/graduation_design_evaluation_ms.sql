/*
Navicat MySQL Data Transfer

Source Server         : gds
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : graduation_design_evaluation_ms

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-04-13 23:10:53
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
INSERT INTO `sys_menu` VALUES ('097cb6eb-1c40-11e7-a63f-c85b7636065d', 'd243ec63-1c3e-11e7-a63f-c85b7636065d', '机构添加', null, '/organization/add', null, 'fa-plus', '0', 'sys:organization:add', 'admin', '2017-04-08 17:45:00', 'admin', '2017-04-08 17:45:00', null, '0', null);
INSERT INTO `sys_menu` VALUES ('1', 'NO', '用户管理', '7', '', null, 'fa-users', '1', 'sys:user', 'admin', '2017-04-02 17:04:17', 'admin', '2017-04-12 22:28:06', null, '0', 'YES');
INSERT INTO `sys_menu` VALUES ('2', '1', '用户列表', '1', '/user/list', '', 'fa-list-ul', '1', 'sys:user:list', 'admin', '2017-04-02 17:04:17', 'admin', '2017-04-02 17:04:25', null, '0', 'YES');
INSERT INTO `sys_menu` VALUES ('29599165-1df4-11e7-a63f-c85b7636065d', 'NO', '菜单管理', '4', '', null, 'fa-align-justify', '0', 'sys:menu', 'admin', '2017-04-10 21:47:00', 'admin', '2017-04-13 22:24:41', null, '0', 'YES');
INSERT INTO `sys_menu` VALUES ('2e996641-1c40-11e7-a63f-c85b7636065d', 'e0454d76-1c3f-11e7-a63f-c85b7636065d', '机构编辑', null, '/organization/edit', null, '', '0', 'sys:organization:edit', 'admin', '2017-04-08 17:46:03', 'admin', '2017-04-08 17:46:03', null, '0', null);
INSERT INTO `sys_menu` VALUES ('3', '2', '用户编辑', '1', '/user/edit', '', null, '1', 'sys:user:edit', 'admin', '2017-04-02 17:04:17', 'admin', '2017-04-02 17:04:25', null, '0', null);
INSERT INTO `sys_menu` VALUES ('36f8952c-1df4-11e7-a63f-c85b7636065d', '29599165-1df4-11e7-a63f-c85b7636065d', '菜单列表', '1', '/menu/list', null, 'fa-list-ul', '0', 'sys:menu:list', 'admin', '2017-04-10 21:47:23', 'admin', '2017-04-10 21:47:23', null, '0', 'YES');
INSERT INTO `sys_menu` VALUES ('39cd541f-1917-11e7-b5b9-c85b7636065d', '858c7e6f8a624018a63ac8b4d2246d8a', '角色删除', '1', '/role/delete', null, 'fa-trash-o', '0', 'sys:role:delete', 'zhangjian', '2017-04-04 17:17:55', 'zhangjian', '2017-04-04 17:17:55', null, '0', null);
INSERT INTO `sys_menu` VALUES ('495bec26-1df4-11e7-a63f-c85b7636065d', '29599165-1df4-11e7-a63f-c85b7636065d', '添加菜单', '1', '/menu/add', null, 'fa-plus', '0', 'sys:menu:add', 'admin', '2017-04-10 21:47:53', 'admin', '2017-04-10 21:47:53', null, '0', null);
INSERT INTO `sys_menu` VALUES ('4abb6a8e-1c40-11e7-a63f-c85b7636065d', 'e0454d76-1c3f-11e7-a63f-c85b7636065d', '机构删除', null, '/organization/delete', null, '', '0', 'sys:organization:delete', 'admin', '2017-04-08 17:46:50', 'admin', '2017-04-08 17:46:50', null, '0', null);
INSERT INTO `sys_menu` VALUES ('5', '2', '用户删除', '1', '/user/delete', null, null, '1', 'sys:user:delete', 'admin', '2017-04-02 17:38:16', 'admin', '2017-04-02 17:38:16', null, '0', null);
INSERT INTO `sys_menu` VALUES ('6', '1', '用户增加', '1', '/user/add', null, 'fa-plus', '1', 'sys:user:add', 'admin', '2017-04-02 18:02:51', 'admin', '2017-04-02 18:02:51', null, '0', null);
INSERT INTO `sys_menu` VALUES ('7410789b-1919-11e7-b5b9-c85b7636065d', '858c7e6f8a624018a63ac8b4d2246d8a', '角色更新', '1', '/role/edit', null, 'fa-toggle-on', '0', 'sys:role:edit', 'zhangjian', '2017-04-04 17:33:52', 'zhangjian', '2017-04-04 17:33:52', null, '0', null);
INSERT INTO `sys_menu` VALUES ('858c7e6f8a624018a63ac8b4d2246d8a', '9256f07e5bc8463ca4175a673d505b29', '角色列表', '1', '/role/list', null, 'fa-list-ul', '0', 'sys:role:list', 'zhangjian', '2017-04-03 23:30:34', 'zhangjian', '2017-04-03 23:30:34', null, '0', 'YES');
INSERT INTO `sys_menu` VALUES ('8f638ac5-1915-11e7-b5b9-c85b7636065d', '9256f07e5bc8463ca4175a673d505b29', '角色添加', '1', '/role/add', null, 'fa-plus', '0', 'sys:role:add', 'zhangjian', '2017-04-04 17:06:00', 'zhangjian', '2017-04-04 17:06:00', null, '0', null);
INSERT INTO `sys_menu` VALUES ('9256f07e5bc8463ca4175a673d505b29', 'NO', '角色管理', '6', '', null, 'fa-user', '0', 'sys:role', 'zhangjian', '2017-04-03 23:07:39', 'admin', '2017-04-12 22:19:29', null, '0', 'YES');
INSERT INTO `sys_menu` VALUES ('b591e6c6-1f8a-11e7-a63f-c85b7636065d', '36f8952c-1df4-11e7-a63f-c85b7636065d', '菜单删除', '1', '/menu/delete', null, '', '0', 'sys:menu:delete', 'admin', '2017-04-12 22:17:09', 'admin', '2017-04-12 22:17:09', null, '0', null);
INSERT INTO `sys_menu` VALUES ('c4fbb540-1f8a-11e7-a63f-c85b7636065d', '36f8952c-1df4-11e7-a63f-c85b7636065d', '菜单更新', '1', '/menu/edit', null, '', '0', 'sys:menu:edit', 'admin', '2017-04-12 22:17:35', 'admin', '2017-04-12 22:17:35', null, '0', null);
INSERT INTO `sys_menu` VALUES ('d243ec63-1c3e-11e7-a63f-c85b7636065d', 'NO', '机构管理', '2', '', null, 'fa-th', '0', 'sys:organization', 'admin', '2017-04-08 17:36:18', 'admin', '2017-04-12 22:28:23', null, '0', 'YES');
INSERT INTO `sys_menu` VALUES ('da4c1b62-1cf0-11e7-a63f-c85b7636065d', 'NO', '毕业设计管理', '1', '', null, 'fa-cubes', '0', 'sys:gdem', 'admin', '2017-04-09 14:50:51', 'admin', '2017-04-13 22:00:04', null, '0', null);
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
INSERT INTO `sys_organization` VALUES ('b569aa56-1cdf-11e7-a63f-c85b7636065d', 'NO', '软件学院', '1', 'temp', null, 'department', null, null, null, '085924be-1c5e-11e7-a63f-c85b7636065d', null, null, null, null, null, null, 'admin', '2017-04-09 12:48:07', 'admin', '2017-04-09 12:48:07', null, '0');

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
INSERT INTO `sys_role` VALUES ('1', '学生', 'student', 'NORMAL', null, 'ACTIVE', 'admin', '2017-04-02 17:00:24', 'admin', '2017-04-02 17:00:42', null, '0');
INSERT INTO `sys_role` VALUES ('6ffcdadf-1c43-11e7-a63f-c85b7636065d', '导师', '', 'NORMAL', null, 'ACTIVE', 'admin', '2017-04-08 18:09:21', 'admin', '2017-04-08 18:09:21', null, '0');
INSERT INTO `sys_role` VALUES ('7c94a9f3-1c54-11e7-a63f-c85b7636065d', '答辩老师', null, 'NORMAL', null, 'ACTIVE', 'admin', '2017-04-08 20:11:35', 'admin', '2017-04-08 20:11:35', null, '0');
INSERT INTO `sys_role` VALUES ('84c5258c-1c45-11e7-a63f-c85b7636065d', '管理员', '', 'NORMAL', null, 'ACTIVE', 'admin', '2017-04-08 18:24:15', 'admin', '2017-04-13 22:45:59', null, '0');

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
INSERT INTO `sys_role_menu` VALUES ('1', '1');
INSERT INTO `sys_role_menu` VALUES ('1', '2');
INSERT INTO `sys_role_menu` VALUES ('1', '3');
INSERT INTO `sys_role_menu` VALUES ('1', '4');
INSERT INTO `sys_role_menu` VALUES ('1', '5');
INSERT INTO `sys_role_menu` VALUES ('1', '6');
INSERT INTO `sys_role_menu` VALUES ('2feb7f1e-1914-11e7-b5b9-c85b7636065d', '1');
INSERT INTO `sys_role_menu` VALUES ('2feb7f1e-1914-11e7-b5b9-c85b7636065d', '2');
INSERT INTO `sys_role_menu` VALUES ('2feb7f1e-1914-11e7-b5b9-c85b7636065d', '3');
INSERT INTO `sys_role_menu` VALUES ('2feb7f1e-1914-11e7-b5b9-c85b7636065d', '4');
INSERT INTO `sys_role_menu` VALUES ('2feb7f1e-1914-11e7-b5b9-c85b7636065d', '5');
INSERT INTO `sys_role_menu` VALUES ('2feb7f1e-1914-11e7-b5b9-c85b7636065d', '6');
INSERT INTO `sys_role_menu` VALUES ('2feb7f1e-1914-11e7-b5b9-c85b7636065d', '858c7e6f8a624018a63ac8b4d2246d8a');
INSERT INTO `sys_role_menu` VALUES ('2feb7f1e-1914-11e7-b5b9-c85b7636065d', '9256f07e5bc8463ca4175a673d505b29');
INSERT INTO `sys_role_menu` VALUES ('6adb1fde-1913-11e7-b5b9-c85b7636065d', '1');
INSERT INTO `sys_role_menu` VALUES ('6ffcdadf-1c43-11e7-a63f-c85b7636065d', '097cb6eb-1c40-11e7-a63f-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('6ffcdadf-1c43-11e7-a63f-c85b7636065d', '1');
INSERT INTO `sys_role_menu` VALUES ('6ffcdadf-1c43-11e7-a63f-c85b7636065d', '2');
INSERT INTO `sys_role_menu` VALUES ('6ffcdadf-1c43-11e7-a63f-c85b7636065d', '2e996641-1c40-11e7-a63f-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('6ffcdadf-1c43-11e7-a63f-c85b7636065d', '3');
INSERT INTO `sys_role_menu` VALUES ('6ffcdadf-1c43-11e7-a63f-c85b7636065d', '39cd541f-1917-11e7-b5b9-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('6ffcdadf-1c43-11e7-a63f-c85b7636065d', '4');
INSERT INTO `sys_role_menu` VALUES ('6ffcdadf-1c43-11e7-a63f-c85b7636065d', '4abb6a8e-1c40-11e7-a63f-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('6ffcdadf-1c43-11e7-a63f-c85b7636065d', '5');
INSERT INTO `sys_role_menu` VALUES ('6ffcdadf-1c43-11e7-a63f-c85b7636065d', '6');
INSERT INTO `sys_role_menu` VALUES ('6ffcdadf-1c43-11e7-a63f-c85b7636065d', '7410789b-1919-11e7-b5b9-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('6ffcdadf-1c43-11e7-a63f-c85b7636065d', '858c7e6f8a624018a63ac8b4d2246d8a');
INSERT INTO `sys_role_menu` VALUES ('6ffcdadf-1c43-11e7-a63f-c85b7636065d', '8f638ac5-1915-11e7-b5b9-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('6ffcdadf-1c43-11e7-a63f-c85b7636065d', '9256f07e5bc8463ca4175a673d505b29');
INSERT INTO `sys_role_menu` VALUES ('6ffcdadf-1c43-11e7-a63f-c85b7636065d', 'd243ec63-1c3e-11e7-a63f-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('6ffcdadf-1c43-11e7-a63f-c85b7636065d', 'e0454d76-1c3f-11e7-a63f-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('7c94a9f3-1c54-11e7-a63f-c85b7636065d', '097cb6eb-1c40-11e7-a63f-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('7c94a9f3-1c54-11e7-a63f-c85b7636065d', '1');
INSERT INTO `sys_role_menu` VALUES ('7c94a9f3-1c54-11e7-a63f-c85b7636065d', '2');
INSERT INTO `sys_role_menu` VALUES ('7c94a9f3-1c54-11e7-a63f-c85b7636065d', '2e996641-1c40-11e7-a63f-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('7c94a9f3-1c54-11e7-a63f-c85b7636065d', '3');
INSERT INTO `sys_role_menu` VALUES ('7c94a9f3-1c54-11e7-a63f-c85b7636065d', '39cd541f-1917-11e7-b5b9-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('7c94a9f3-1c54-11e7-a63f-c85b7636065d', '4');
INSERT INTO `sys_role_menu` VALUES ('7c94a9f3-1c54-11e7-a63f-c85b7636065d', '4abb6a8e-1c40-11e7-a63f-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('7c94a9f3-1c54-11e7-a63f-c85b7636065d', '5');
INSERT INTO `sys_role_menu` VALUES ('7c94a9f3-1c54-11e7-a63f-c85b7636065d', '6');
INSERT INTO `sys_role_menu` VALUES ('7c94a9f3-1c54-11e7-a63f-c85b7636065d', '7410789b-1919-11e7-b5b9-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('7c94a9f3-1c54-11e7-a63f-c85b7636065d', '858c7e6f8a624018a63ac8b4d2246d8a');
INSERT INTO `sys_role_menu` VALUES ('7c94a9f3-1c54-11e7-a63f-c85b7636065d', '8f638ac5-1915-11e7-b5b9-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('7c94a9f3-1c54-11e7-a63f-c85b7636065d', '9256f07e5bc8463ca4175a673d505b29');
INSERT INTO `sys_role_menu` VALUES ('7c94a9f3-1c54-11e7-a63f-c85b7636065d', 'd243ec63-1c3e-11e7-a63f-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('7c94a9f3-1c54-11e7-a63f-c85b7636065d', 'e0454d76-1c3f-11e7-a63f-c85b7636065d');
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
INSERT INTO `sys_role_menu` VALUES ('84c5258c-1c45-11e7-a63f-c85b7636065d', '097cb6eb-1c40-11e7-a63f-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('84c5258c-1c45-11e7-a63f-c85b7636065d', '1');
INSERT INTO `sys_role_menu` VALUES ('84c5258c-1c45-11e7-a63f-c85b7636065d', '2');
INSERT INTO `sys_role_menu` VALUES ('84c5258c-1c45-11e7-a63f-c85b7636065d', '29599165-1df4-11e7-a63f-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('84c5258c-1c45-11e7-a63f-c85b7636065d', '2e996641-1c40-11e7-a63f-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('84c5258c-1c45-11e7-a63f-c85b7636065d', '3');
INSERT INTO `sys_role_menu` VALUES ('84c5258c-1c45-11e7-a63f-c85b7636065d', '36f8952c-1df4-11e7-a63f-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('84c5258c-1c45-11e7-a63f-c85b7636065d', '39cd541f-1917-11e7-b5b9-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('84c5258c-1c45-11e7-a63f-c85b7636065d', '495bec26-1df4-11e7-a63f-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('84c5258c-1c45-11e7-a63f-c85b7636065d', '4abb6a8e-1c40-11e7-a63f-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('84c5258c-1c45-11e7-a63f-c85b7636065d', '5');
INSERT INTO `sys_role_menu` VALUES ('84c5258c-1c45-11e7-a63f-c85b7636065d', '6');
INSERT INTO `sys_role_menu` VALUES ('84c5258c-1c45-11e7-a63f-c85b7636065d', '7410789b-1919-11e7-b5b9-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('84c5258c-1c45-11e7-a63f-c85b7636065d', '858c7e6f8a624018a63ac8b4d2246d8a');
INSERT INTO `sys_role_menu` VALUES ('84c5258c-1c45-11e7-a63f-c85b7636065d', '8f638ac5-1915-11e7-b5b9-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('84c5258c-1c45-11e7-a63f-c85b7636065d', '9256f07e5bc8463ca4175a673d505b29');
INSERT INTO `sys_role_menu` VALUES ('84c5258c-1c45-11e7-a63f-c85b7636065d', 'b591e6c6-1f8a-11e7-a63f-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('84c5258c-1c45-11e7-a63f-c85b7636065d', 'c4fbb540-1f8a-11e7-a63f-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('84c5258c-1c45-11e7-a63f-c85b7636065d', 'd243ec63-1c3e-11e7-a63f-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('84c5258c-1c45-11e7-a63f-c85b7636065d', 'da4c1b62-1cf0-11e7-a63f-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('84c5258c-1c45-11e7-a63f-c85b7636065d', 'e0454d76-1c3f-11e7-a63f-c85b7636065d');
INSERT INTO `sys_role_menu` VALUES ('84c5258c-1c45-11e7-a63f-c85b7636065d', 'e97bdb1e-1f8f-11e7-a63f-c85b7636065d');
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
INSERT INTO `sys_user` VALUES ('085924be-1c5e-11e7-a63f-c85b7636065d', '68411167-1add-11e7-b5b9-c85b7636065d', null, 'director', '31ace546d14f7add7423867cbb6bc87a5e7bcc7e', null, 'director', 'director@qq.com', null, '18328358153', null, null, null, null, null, 'admin', '2017-04-08 21:19:55', 'admin', '2017-04-08 21:19:55', null, '0');
INSERT INTO `sys_user` VALUES ('5884804e-1c5d-11e7-a63f-c85b7636065d', '68411167-1add-11e7-b5b9-c85b7636065d', null, 'admin', '31ace546d14f7add7423867cbb6bc87a5e7bcc7e', null, 'admin', 'admin@qq.com', null, '18328358152', null, null, null, null, null, 'admin', '2017-04-08 21:15:00', 'admin', '2017-04-08 21:15:00', null, '0');
INSERT INTO `sys_user` VALUES ('71a9a7a4-1c5e-11e7-a63f-c85b7636065d', '68411167-1add-11e7-b5b9-c85b7636065d', null, 'jimy', '31ace546d14f7add7423867cbb6bc87a5e7bcc7e', null, 'jimy', 'jimy@qq.com', null, '18328358155', null, null, null, null, null, 'admin', '2017-04-08 21:22:52', 'admin', '2017-04-08 21:22:52', null, '0');
INSERT INTO `sys_user` VALUES ('d8607faa-1c5d-11e7-a63f-c85b7636065d', '68411167-1add-11e7-b5b9-c85b7636065d', null, 'zhengzhe', '31ace546d14f7add7423867cbb6bc87a5e7bcc7e', null, 'zhengzhe', 'zhengzhe@qq.com', null, '18328358153', null, null, null, null, null, 'admin', '2017-04-08 21:18:35', 'admin', '2017-04-08 21:18:35', null, '0');

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
INSERT INTO `sys_user_role` VALUES ('929f51a7fd694cd486928582f29bc153', '1');
INSERT INTO `sys_user_role` VALUES ('929f51a7fd694cd486928582f29bc15q', '1');
INSERT INTO `sys_user_role` VALUES ('a943873f-1c55-11e7-a63f-c85b7636065d', '6ffcdadf-1c43-11e7-a63f-c85b7636065d');
INSERT INTO `sys_user_role` VALUES ('d8607faa-1c5d-11e7-a63f-c85b7636065d', '1');
INSERT INTO `sys_user_role` VALUES ('f468482c-1c5d-11e7-a63f-c85b7636065d', '6ffcdadf-1c43-11e7-a63f-c85b7636065d');
INSERT INTO `sys_user_role` VALUES ('fbd3f277-1c2a-11e7-a63f-c85b7636065d', '1');
