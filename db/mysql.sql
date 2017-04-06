CREATE TABLE sys_area
(
  id VARCHAR(64) PRIMARY KEY NOT NULL,
  parent_id VARCHAR(64) NOT NULL,
  parent_ids VARCHAR(2000) NOT NULL,
  name VARCHAR(100) NOT NULL,
  sort DECIMAL(10,0) NOT NULL,
  code VARCHAR(100),
  type CHAR(1),
  create_by VARCHAR(64) NOT NULL,
  create_date DATETIME NOT NULL,
  update_by VARCHAR(64) NOT NULL,
  update_date DATETIME NOT NULL,
  remarks VARCHAR(255),
  del_flag CHAR(1) DEFAULT '0' NOT NULL
);
CREATE TABLE sys_dict
(
  id VARCHAR(64) PRIMARY KEY NOT NULL,
  value VARCHAR(100) NOT NULL,
  label VARCHAR(100) NOT NULL,
  type VARCHAR(100) NOT NULL,
  description VARCHAR(100) NOT NULL,
  sort DECIMAL(10,0) NOT NULL,
  parent_id VARCHAR(64) DEFAULT '0',
  create_by VARCHAR(64) NOT NULL,
  create_date DATETIME NOT NULL,
  update_by VARCHAR(64) NOT NULL,
  update_date DATETIME NOT NULL,
  remarks VARCHAR(255),
  del_flag CHAR(1) DEFAULT '0' NOT NULL
);
CREATE TABLE sys_log
(
  id VARCHAR(64) PRIMARY KEY NOT NULL,
  type CHAR(1) DEFAULT '1',
  title VARCHAR(255) DEFAULT '',
  create_by VARCHAR(64),
  create_date DATETIME,
  remote_addr VARCHAR(255),
  user_agent VARCHAR(255),
  request_uri VARCHAR(255),
  method VARCHAR(5),
  params LONGTEXT,
  exception LONGTEXT
);
CREATE TABLE sys_mdict
(
  id VARCHAR(64) PRIMARY KEY NOT NULL,
  parent_id VARCHAR(64) NOT NULL,
  parent_ids VARCHAR(2000) NOT NULL,
  name VARCHAR(100) NOT NULL,
  sort DECIMAL(10,0) NOT NULL,
  description VARCHAR(100),
  create_by VARCHAR(64) NOT NULL,
  create_date DATETIME NOT NULL,
  update_by VARCHAR(64) NOT NULL,
  update_date DATETIME NOT NULL,
  remarks VARCHAR(255),
  del_flag CHAR(1) DEFAULT '0' NOT NULL
);
CREATE TABLE sys_menu
(
  id VARCHAR(64) PRIMARY KEY NOT NULL,
  parent_id VARCHAR(64),
  name VARCHAR(100) NOT NULL,
  sort DECIMAL(10,0) NOT NULL,
  href VARCHAR(2000),
  target VARCHAR(20),
  icon VARCHAR(100),
  is_show CHAR(1) NOT NULL,
  permission VARCHAR(200),
  create_by VARCHAR(64) NOT NULL,
  create_date DATETIME NOT NULL,
  update_by VARCHAR(64) NOT NULL,
  update_date DATETIME NOT NULL,
  remarks VARCHAR(255),
  del_flag CHAR(1) DEFAULT '0' NOT NULL,
  is_parent CHAR(3)
);
CREATE TABLE sys_organization
(
  id VARCHAR(64) PRIMARY KEY NOT NULL,
  parent_id VARCHAR(64) NOT NULL,
  name VARCHAR(100) NOT NULL,
  sort DECIMAL(10,0) NOT NULL,
  area_id VARCHAR(64) NOT NULL,
  code VARCHAR(100),
  type CHAR(10),
  grade CHAR(1),
  address VARCHAR(255),
  zip_code VARCHAR(100),
  master VARCHAR(100),
  phone VARCHAR(200),
  fax VARCHAR(200),
  email VARCHAR(200),
  useable VARCHAR(64),
  primary_person_id VARCHAR(64),
  deputy_person_id VARCHAR(64),
  create_by VARCHAR(64) NOT NULL,
  create_date DATETIME NOT NULL,
  update_by VARCHAR(64) NOT NULL,
  update_date DATETIME NOT NULL,
  remarks VARCHAR(255),
  del_flag CHAR(1) DEFAULT '0' NOT NULL
);
CREATE TABLE sys_role
(
  id VARCHAR(64) PRIMARY KEY NOT NULL,
  name VARCHAR(100) NOT NULL,
  english_name VARCHAR(255),
  role_type VARCHAR(255),
  data_scope CHAR(1),
  useable VARCHAR(64),
  create_by VARCHAR(64) NOT NULL,
  create_date DATETIME NOT NULL,
  update_by VARCHAR(64) NOT NULL,
  update_date DATETIME NOT NULL,
  remarks VARCHAR(255),
  del_flag CHAR(1) DEFAULT '0' NOT NULL
);
CREATE TABLE sys_role_menu
(
  role_id VARCHAR(64) NOT NULL,
  menu_id VARCHAR(64) NOT NULL,
  PRIMARY KEY (role_id, menu_id)
);
CREATE TABLE sys_role_office
(
  role_id VARCHAR(64) NOT NULL,
  office_id VARCHAR(64) NOT NULL,
  PRIMARY KEY (role_id, office_id)
);
CREATE TABLE sys_user
(
  id VARCHAR(64) PRIMARY KEY NOT NULL,
  department_id VARCHAR(64) NOT NULL,
  major_id VARCHAR(64) NOT NULL,
  login_name VARCHAR(100) NOT NULL,
  password VARCHAR(100) NOT NULL,
  no VARCHAR(100),
  name VARCHAR(100) NOT NULL,
  email VARCHAR(200),
  phone VARCHAR(200),
  mobile VARCHAR(200),
  user_type CHAR(1),
  photo VARCHAR(1000),
  login_ip VARCHAR(100),
  login_date DATETIME,
  login_flag VARCHAR(64),
  create_by VARCHAR(64) NOT NULL,
  create_date DATETIME NOT NULL,
  update_by VARCHAR(64) NOT NULL,
  update_date DATETIME NOT NULL,
  remarks VARCHAR(255),
  del_flag CHAR(1) DEFAULT '0' NOT NULL
);
CREATE TABLE sys_user_role
(
  user_id VARCHAR(64) NOT NULL,
  role_id VARCHAR(64) NOT NULL,
  PRIMARY KEY (user_id, role_id)
);
CREATE INDEX sys_area_del_flag ON sys_area (del_flag);
CREATE INDEX sys_area_parent_id ON sys_area (parent_id);
CREATE INDEX sys_dict_del_flag ON sys_dict (del_flag);
CREATE INDEX sys_dict_label ON sys_dict (label);
CREATE INDEX sys_dict_value ON sys_dict (value);
CREATE INDEX sys_log_create_by ON sys_log (create_by);
CREATE INDEX sys_log_create_date ON sys_log (create_date);
CREATE INDEX sys_log_request_uri ON sys_log (request_uri);
CREATE INDEX sys_log_type ON sys_log (type);
CREATE INDEX sys_mdict_del_flag ON sys_mdict (del_flag);
CREATE INDEX sys_mdict_parent_id ON sys_mdict (parent_id);
CREATE INDEX sys_menu_del_flag ON sys_menu (del_flag);
CREATE INDEX sys_menu_parent_id ON sys_menu (parent_id);
CREATE INDEX sys_office_del_flag ON sys_organization (del_flag);
CREATE INDEX sys_office_parent_id ON sys_organization (parent_id);
CREATE INDEX sys_office_type ON sys_organization (type);
CREATE INDEX sys_role_del_flag ON sys_role (del_flag);
CREATE INDEX sys_role_enname ON sys_role (english_name);
CREATE INDEX sys_user_company_id ON sys_user (department_id);
CREATE INDEX sys_user_del_flag ON sys_user (del_flag);
CREATE INDEX sys_user_login_name ON sys_user (login_name);
CREATE INDEX sys_user_office_id ON sys_user (major_id);
CREATE INDEX sys_user_update_date ON sys_user (update_date);


INSERT INTO `sys_user` VALUES ('929f51a7fd694cd486928582f29bc153', '1', '2', 'admin', '31ace546d14f7add7423867cbb6bc87a5e7bcc7e', 'zj000001', 'zhangjian', 'zz@zz.com', '18328358153', '18328358153', '3', null, '0:0:0:0:0:0:0:1', '2016-11-09 16:46:48', '1', '1', '2016-03-22 13:48:05', '929f51a7fd694cd486928582f29bc153', '2016-11-09 16:36:30', 'dfvgsdf', '0');

