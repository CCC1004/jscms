/*
Navicat MySQL Data Transfer

Source Server         : mysql-ssm
Source Server Version : 50711
Source Host           : localhost:3306
Source Database       : ssm_qlight

Target Server Type    : MYSQL
Target Server Version : 50711
File Encoding         : 65001

Date: 2018-08-11 16:11:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for addv
-- ----------------------------
DROP TABLE IF EXISTS `addv`;
CREATE TABLE `addv` (
  `ADDVCD` char(9) NOT NULL,
  `ADDVNM` varchar(40) DEFAULT NULL,
  `ADDVEN` varchar(40) DEFAULT NULL,
  `ADDVAB` varchar(10) DEFAULT NULL,
  `ADDVA` decimal(65,30) DEFAULT NULL,
  `ADDVCA` decimal(65,30) DEFAULT NULL,
  `ADDVPA` decimal(65,30) DEFAULT NULL,
  `ADDVGCA` decimal(65,30) DEFAULT NULL,
  `ADDVGPA` decimal(65,30) DEFAULT NULL,
  `ADDVMAP` longblob,
  `NT` longtext,
  PRIMARY KEY (`ADDVCD`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of addv
-- ----------------------------
INSERT INTO `addv` VALUES ('110000000', '北京市', null, null, null, null, null, null, null, null, null);
INSERT INTO `addv` VALUES ('120000000', '天津市', null, null, null, null, null, null, null, null, null);
INSERT INTO `addv` VALUES ('130000000', '河北省', null, null, null, null, null, null, null, null, null);
INSERT INTO `addv` VALUES ('410000000', '河南省', null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for au_authorities
-- ----------------------------
DROP TABLE IF EXISTS `au_authorities`;
CREATE TABLE `au_authorities` (
  `AUTHID` char(32) NOT NULL,
  `AUTHORITY` varchar(30) DEFAULT NULL,
  `AUTHTYPE` varchar(20) DEFAULT NULL,
  `AUTHKEY` varchar(30) DEFAULT NULL,
  `PROTECTREF` varchar(100) DEFAULT NULL,
  `RESID` char(32) DEFAULT NULL,
  `NOTE` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`AUTHID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of au_authorities
-- ----------------------------
INSERT INTO `au_authorities` VALUES ('077ceeea4135463b9e8d6e6620c6cbd5', '业务', null, 'yw', null, '2d84d1bc65cf465086444f553c9292dc', null);
INSERT INTO `au_authorities` VALUES ('0ad0ac3ae6fc4941b0ba415bb44fa988', 'AUT组织机构', '', '0ad0ac3ae6fc4941b0ba415bb44fa9', null, '0ad0ac3ae6fc4941b0ba415bb44fa988', 'sysauto');
INSERT INTO `au_authorities` VALUES ('1000                           1', '外网门户主页', 'URL', null, '/niming.jsp', '646203b2aec549659e0dc33eed188e05', null);
INSERT INTO `au_authorities` VALUES ('10000', 'AUT报备申请', '', '10000', null, '10000', 'sysauto');
INSERT INTO `au_authorities` VALUES ('10001', 'AUT报备申请查询', '', '10001', null, '10001', 'sysauto');
INSERT INTO `au_authorities` VALUES ('10002', 'AUT报备审批上报', '', '10002', null, '10002', 'sysauto');
INSERT INTO `au_authorities` VALUES ('10003', 'AUT报备审批通过', '', '10003', null, '10003', 'sysauto');
INSERT INTO `au_authorities` VALUES ('1006                           1', 'AUT组织类型设置', '', '1006                          ', null, '1006                           1', 'sysauto');
INSERT INTO `au_authorities` VALUES ('101                            1', '组织添加用户界面', 'URL', 'orgUserListPage', '/QLListView_Au_UserInfo.userList.qact*', '7d6890ad223d43ac93861e6fcd21ee52', '为组织添加用户界面');
INSERT INTO `au_authorities` VALUES ('102                            1', '组织添加用户获取用户数据', 'URL', 'orgUserListData', '/QLListData_Au_UserInfo.userList.qact*', '7d6890ad223d43ac93861e6fcd21ee52', '组织添加用户获取用户数据');
INSERT INTO `au_authorities` VALUES ('1020                           1', '表字典管理_列表', 'URL', 'tabList_list', '/QLList*_TABLIST.List.qact*', '29ebedfbfc5a463cb96f5137d2392f5b', null);
INSERT INTO `au_authorities` VALUES ('1021                           1', '字段字典-列表', 'URL', 'fldlist_list', '/QLList*_FLDLIST.List.qact*', '29ebedfbfc5a463cb96f5137d2392f5b', null);
INSERT INTO `au_authorities` VALUES ('1023                           1', '表字典_新增', 'URL', 'tablist_insert', '/QLInsert*_tablist.Insert.qact*', '29ebedfbfc5a463cb96f5137d2392f5b', null);
INSERT INTO `au_authorities` VALUES ('1024                           1', '表字典_修改', 'URL', 'tablist_update', '/QLUpdate*_tablist.Update.qact', '29ebedfbfc5a463cb96f5137d2392f5b', null);
INSERT INTO `au_authorities` VALUES ('1025                           1', '字段字典_更新', 'URL', null, '/QLUpdate*_fldlist.Update.qact*', '29ebedfbfc5a463cb96f5137d2392f5b', null);
INSERT INTO `au_authorities` VALUES ('1026                           1', '字段字典_新增', 'URL', null, '/QLInsert*_fldlist.Insert.qact*', '29ebedfbfc5a463cb96f5137d2392f5b', null);
INSERT INTO `au_authorities` VALUES ('1027                           1', '字典编码_列表', 'URL', null, '/sys_codeList*-1.qact*', '29ebedfbfc5a463cb96f5137d2392f5b', null);
INSERT INTO `au_authorities` VALUES ('1028                           1', '字典编码_新增', 'URL', null, '/sys_codeInsert*-1.qact*', '29ebedfbfc5a463cb96f5137d2392f5b', null);
INSERT INTO `au_authorities` VALUES ('1029                           1', '字典编码_更新', 'URL', null, '/sys_codeUpdate*-1.qact*', '29ebedfbfc5a463cb96f5137d2392f5b', null);
INSERT INTO `au_authorities` VALUES ('103                            1', '为组织添加用户保存', 'URL', 'saveUserByOrg', '/saveUserByOrg.qact*', '7d6890ad223d43ac93861e6fcd21ee52', '为组织添加用户保存');
INSERT INTO `au_authorities` VALUES ('1030                           1', '字典管理_菜单', null, 'codeMng', null, '29ebedfbfc5a463cb96f5137d2392f5b', null);
INSERT INTO `au_authorities` VALUES ('1031                           1', '消息管理_列表', 'URL', null, '/QLList*_Sys_Message.LIST.qact*', null, null);
INSERT INTO `au_authorities` VALUES ('1032                           1', '消息管理_增加', 'URL', null, '/QLInsert*_sys_message.Insert.qact*', 'afb92f4a089c47179930d55f62880c3d', null);
INSERT INTO `au_authorities` VALUES ('1033                           1', '消息管理_更新', 'URL', null, '/QLUpdate*_sys_message.Update.qact*', 'afb92f4a089c47179930d55f62880c3d', null);
INSERT INTO `au_authorities` VALUES ('1034                           1', '消息管理_菜单', null, 'MessageMng_Menu', null, 'afb92f4a089c47179930d55f62880c3d', null);
INSERT INTO `au_authorities` VALUES ('1035                           1', '参数管理_列表', 'URL', null, '/QLList*_Sys_parameter.LIST.qact*', '966c82413e36433d8ee8f8dab1eb7cad', null);
INSERT INTO `au_authorities` VALUES ('1036                           1', '参数管理_新增', 'URL', null, '/QLInsert*_sys_parameter.Insert.qact*', '966c82413e36433d8ee8f8dab1eb7cad', null);
INSERT INTO `au_authorities` VALUES ('1037                           1', '参数管理_更新', 'URL', null, '/QLUpdate*_sys_parameter.Update.qact*', '966c82413e36433d8ee8f8dab1eb7cad', null);
INSERT INTO `au_authorities` VALUES ('1038                           1', '参数管理_菜单', null, 'paraMng_menu', null, '966c82413e36433d8ee8f8dab1eb7cad', null);
INSERT INTO `au_authorities` VALUES ('1039                           1', '参数管理_删除', 'URL', null, '/QLDelete_sys_parameter.qact*', '966c82413e36433d8ee8f8dab1eb7cad', null);
INSERT INTO `au_authorities` VALUES ('104                            1', '组织移除用户', 'URL', 'orgUserDelete', '/au_user_orgDelete.qact*', '7d6890ad223d43ac93861e6fcd21ee52', '组织用户映射（删除）');
INSERT INTO `au_authorities` VALUES ('1040                           1', '角色管理1', 'URL', 'RoleMng1', '/au_rolesListView-1.qact*', '7fb7a8f740904ef7af6bc1c65fde035c', null);
INSERT INTO `au_authorities` VALUES ('1041                           1', '修改角色-视图1', 'URL', 'au_rolesListView-1', '/au_rolesUpdateView-1.qact*', '7fb7a8f740904ef7af6bc1c65fde035c', null);
INSERT INTO `au_authorities` VALUES ('1042                           1', '修改角色1', 'URL', null, '/au_rolesUpdate-1.qact*', '7fb7a8f740904ef7af6bc1c65fde035c', null);
INSERT INTO `au_authorities` VALUES ('1043                           1', '权限管理-菜单', null, 'AuMng_mneu', null, '2cc3d56431cd49608db005d9217f09b1', null);
INSERT INTO `au_authorities` VALUES ('1047                           1', '消息管理_删除', 'URL', null, '/QLDelete_sys_message.qact*', 'afb92f4a089c47179930d55f62880c3d', null);
INSERT INTO `au_authorities` VALUES ('1048                           1', '表字典_删除', 'URL', null, '/QLDelete_tablist.qact*', '29ebedfbfc5a463cb96f5137d2392f5b', null);
INSERT INTO `au_authorities` VALUES ('1049                           1', '字段字典_删除', 'URL', null, '/QLDelete_fldlist.qact*', '29ebedfbfc5a463cb96f5137d2392f5b', null);
INSERT INTO `au_authorities` VALUES ('105                            1', '系统日志', 'URL', 'Sys_log', '/QLListView_Sys_log.List.qact*', '98f8d7eb464c41c1abd31bf69e9fa814', 'Sys_log');
INSERT INTO `au_authorities` VALUES ('1050                           1', '字典编码_删除', 'URL', null, '/sys_codeDelete.qact*', '29ebedfbfc5a463cb96f5137d2392f5b', null);
INSERT INTO `au_authorities` VALUES ('106                            1', '系统日志（查询）', 'URL', 'SysLogQuery', '/QLListData_Sys_log.List.qact*', '98f8d7eb464c41c1abd31bf69e9fa814', '系统日志（查询）');
INSERT INTO `au_authorities` VALUES ('1060                           1', '获取组织树', 'URL', null, '/orgXml.qact*', '7d6890ad223d43ac93861e6fcd21ee52', null);
INSERT INTO `au_authorities` VALUES ('1061                           1', '组织类型设置_列表', 'URL', 'Au_org_type_list', '/QLList*_Au_org_type.List.qact*', 'c07a646c09894e939afdeb5635d47939', null);
INSERT INTO `au_authorities` VALUES ('1062                           1', '组织类型新增', 'URL', null, '/QLInsert*_Au_org_type.Insert.qact*', 'c07a646c09894e939afdeb5635d47939', null);
INSERT INTO `au_authorities` VALUES ('1063                           1', '组织类型修改', 'URL', null, '/QLUpdate_au_org_type.Update.qact*', 'c07a646c09894e939afdeb5635d47939', null);
INSERT INTO `au_authorities` VALUES ('1064                           1', '组织类型删除', 'URL', null, '/QLDelete_au_org_type.qact*', 'c07a646c09894e939afdeb5635d47939', null);
INSERT INTO `au_authorities` VALUES ('1065                           1', '组织管理_菜单', null, 'OrgMng_Menu', null, '8176a5dfb67d4138becd29dd396e4abb', null);
INSERT INTO `au_authorities` VALUES ('1066                           1', '组织下用户列表1_查询', 'URL', 'au_user_orgListData-1', '/au_user_orgListData-1.qact*', '7d6890ad223d43ac93861e6fcd21ee52', null);
INSERT INTO `au_authorities` VALUES ('1067                           1', '组织下用户列表1', 'URL', 'au_user_orgListView-1', '/au_user_orgListView-1.qact*', '7d6890ad223d43ac93861e6fcd21ee52', null);
INSERT INTO `au_authorities` VALUES ('1080                           1', '登录组织选择', 'URL', null, '/userSelectOrg.qact*', '1b1b59a7513446c7a9c9c7170fc6141c', null);
INSERT INTO `au_authorities` VALUES ('1102                           1', '设置默认组织', 'URL', null, '/setUserDefOrg.qact*', '3ae42168175e4be6af5338a6aadae2f8', null);
INSERT INTO `au_authorities` VALUES ('1106                           1', 'AUT个人通知', '', '1106                          ', null, '1106                           1', 'sysauto');
INSERT INTO `au_authorities` VALUES ('1120                           1', '日志详情', 'URL', 'Log_Detial', '/GetSysLog.qact*', '98f8d7eb464c41c1abd31bf69e9fa814', null);
INSERT INTO `au_authorities` VALUES ('1121                           1', '刷新权限配置', 'URL', 'RefreshAuthorities', '/Au_RefreshAuthorities.qact*', '2b1b51a7513448c7a9c9c7670fc6161a', null);
INSERT INTO `au_authorities` VALUES ('1180                           1', '删除日志', 'URL', 'Sys_LogDelete', '/QLDelete_sys_log.qact*', '98f8d7eb464c41c1abd31bf69e9fa814', null);
INSERT INTO `au_authorities` VALUES ('1181                           1', '删除所有', 'URL', 'sys_log_delAll', '/QLDeleteAll_Sys_log.List.qact*', '98f8d7eb464c41c1abd31bf69e9fa814', null);
INSERT INTO `au_authorities` VALUES ('1182                           1', '导出日志', 'URL', 'sys_log_export', '/QLExpExcel_Sys_log.List.qact*', '98f8d7eb464c41c1abd31bf69e9fa814', null);
INSERT INTO `au_authorities` VALUES ('12                             1', '用户列表', 'URL', 'UserMrg', '/QLListView_Au_UserInfo.List.qact*', 'b2d917466c3145e18178277dcec81c03', '用户列表');
INSERT INTO `au_authorities` VALUES ('1200                           1', '临时超级权限', 'URL', 'ROOT_SUPER', '/**', '1b1b59a7513446c7a9c9c7170fc6141c', null);
INSERT INTO `au_authorities` VALUES ('13                             1', '角色管理', 'URL', 'RoleMng', '/QLListView_Au_Roles.List.qact*', '7fb7a8f740904ef7af6bc1c65fde035c', null);
INSERT INTO `au_authorities` VALUES ('14                             1', '资源管理-列表', 'URL', 'ResMrg', '/QLListView_Au_resource.List.qact*', '2b1b51a7513448c7a9c9c7670fc6161a', null);
INSERT INTO `au_authorities` VALUES ('15                             1', '权限管理', 'URL', 'AuthMrg', '/au_authoritieslistview.qact*', '4112b9e429f14649bf4535c4db73de00', null);
INSERT INTO `au_authorities` VALUES ('16                             1', '用户列表数据', 'URL', null, '/QLListData_Au_UserInfo.List.qact*', 'b2d917466c3145e18178277dcec81c03', null);
INSERT INTO `au_authorities` VALUES ('17                             1', '系统主页', 'URL', null, '/index.qact*', '1b1b59a7513446c7a9c9c7170fc6141c', null);
INSERT INTO `au_authorities` VALUES ('172b5b39f2884fb1b23955b529e4ce9c', 'AUT意见反馈', '', '172b5b39f2884fb1b23955b529e4ce', null, '172b5b39f2884fb1b23955b529e4ce9c', 'sysauto');
INSERT INTO `au_authorities` VALUES ('19                             1', '系统主页2', 'URL', null, '/pageframe/**', '1b1b59a7513446c7a9c9c7170fc6141c', null);
INSERT INTO `au_authorities` VALUES ('1b30d1fd58664966a32a27c13c6dfd91', '数据字典_新增', 'URL', null, '/sys_dictInsert*-1.qact*', '29ebedfbfc5a463cb96f5137d2392f5b', null);
INSERT INTO `au_authorities` VALUES ('1e3f744df21b4380a7ae7c3544899dcb', 'AUT法律法规文件', '', '1e3f744df21b4380a7ae7c3544899d', null, '1e3f744df21b4380a7ae7c3544899dcb', 'sysauto');
INSERT INTO `au_authorities` VALUES ('2                              1', 'AUT权限管理', '', '2                             ', null, '2                              1', 'sysauto');
INSERT INTO `au_authorities` VALUES ('20000', 'AUT报备申请', '', '20000', null, '20000', 'sysauto');
INSERT INTO `au_authorities` VALUES ('20001', 'AUT报备申请查询', '', '20001', null, '20001', 'sysauto');
INSERT INTO `au_authorities` VALUES ('20002', 'AUT报备审批上报', '', '20002', null, '20002', 'sysauto');
INSERT INTO `au_authorities` VALUES ('20003', 'AUT报备审批通过', '', '20003', null, '20003', 'sysauto');
INSERT INTO `au_authorities` VALUES ('20b69cf0fa05407eb42a9111951db113', 'AUT业务指导', '', '20b69cf0fa05407eb42a9111951db1', null, '20b69cf0fa05407eb42a9111951db113', 'sysauto');
INSERT INTO `au_authorities` VALUES ('21                             1', '增加角色-视图', 'URL', 'RoleAdd', '/QLInsertView_Au_Roles.Insert.qact*', '7fb7a8f740904ef7af6bc1c65fde035c', null);
INSERT INTO `au_authorities` VALUES ('22                             1', '读取系统菜单', 'URL', null, '/QLight_GetMenu.qact*', '1b1b59a7513446c7a9c9c7170fc6141c', '用于系统主页读取菜单数据');
INSERT INTO `au_authorities` VALUES ('25                             1', '菜单管理－视图', 'URL', 'MenuMrg', '/QLListView_Menu.menuList.qact*', '13acb3da84c949eeb600388659469cd1', null);
INSERT INTO `au_authorities` VALUES ('27                             1', '角色管理－数据读取', 'URL', null, '/QLListData_Au_Roles.List.qact*', '7fb7a8f740904ef7af6bc1c65fde035c', null);
INSERT INTO `au_authorities` VALUES ('27ff19273bed4de7a0de9572a5130431', 'AUT报备申请', '', '27ff19273bed4de7a0de9572a51304', null, '27ff19273bed4de7a0de9572a5130431', 'sysauto');
INSERT INTO `au_authorities` VALUES ('28                             1', '删除角色', 'URL', 'RoleDel', '/au_rolesDelete.qact*', '7fb7a8f740904ef7af6bc1c65fde035c', null);
INSERT INTO `au_authorities` VALUES ('2a7017460e0441e5ab3d0493a682481f', 'AUT文档信息管理', '', '2a7017460e0441e5ab3d0493a68248', null, '2a7017460e0441e5ab3d0493a682481f', 'sysauto');
INSERT INTO `au_authorities` VALUES ('2cd2c119d6d14c88ba2c25c081d30169', 'AUT系统访问权限管理', '', '2cd2c119d6d14c88ba2c25c081d301', null, '2cd2c119d6d14c88ba2c25c081d30169', 'sysauto');
INSERT INTO `au_authorities` VALUES ('3                              1', 'AUT用户管理', '', '3                             ', null, '3                              1', 'sysauto');
INSERT INTO `au_authorities` VALUES ('30000', 'AUT报备申请', '', '30000', null, '30000', 'sysauto');
INSERT INTO `au_authorities` VALUES ('30001', 'AUT报备申请查询', '', '30001', null, '30001', 'sysauto');
INSERT INTO `au_authorities` VALUES ('30002', 'AUT报备审批上报', '', '30002', null, '30002', 'sysauto');
INSERT INTO `au_authorities` VALUES ('30003', 'AUT报备审批通过', '', '30003', null, '30003', 'sysauto');
INSERT INTO `au_authorities` VALUES ('303f86231fd2470dbaaee04767b12dbd', 'AUT监督管理', '', '303f86231fd2470dbaaee04767b12d', null, '303f86231fd2470dbaaee04767b12dbd', 'sysauto');
INSERT INTO `au_authorities` VALUES ('35                             1', 'AUT个人设置', '', '35                            ', null, '35                             1', 'sysauto');
INSERT INTO `au_authorities` VALUES ('36                             1', 'AUT个人资料设置', '', '36                            ', null, '36                             1', 'sysauto');
INSERT INTO `au_authorities` VALUES ('37                             1', 'AUT系统日志', '', '37                            ', null, '37                             1', 'sysauto');
INSERT INTO `au_authorities` VALUES ('38                             1', '修改菜单视图', 'URL', null, '/QLUpdateView_Menu.menuUpdate.qact*', '13acb3da84c949eeb600388659469cd1', null);
INSERT INTO `au_authorities` VALUES ('39                             1', '修改菜单', 'URL', null, '/QLUpdate_Menu.menuUpdate.qact*', '13acb3da84c949eeb600388659469cd1', null);
INSERT INTO `au_authorities` VALUES ('4                              1', 'AUT角色管理', '', '4                             ', null, '4                              1', 'sysauto');
INSERT INTO `au_authorities` VALUES ('40                             1', '新增菜单视图', 'URL', null, '/QLInsertView_Menu.menuInsert.qact*', '13acb3da84c949eeb600388659469cd1', null);
INSERT INTO `au_authorities` VALUES ('41                             1', '新增菜单', 'URL', null, '/QLInsert_Menu.menuInsert.qact*', '13acb3da84c949eeb600388659469cd1', null);
INSERT INTO `au_authorities` VALUES ('414b1176c4e84a7eb9140c2864911751', 'AUT党纪党规文件', '', '414b1176c4e84a7eb9140c28649117', null, '414b1176c4e84a7eb9140c2864911751', 'sysauto');
INSERT INTO `au_authorities` VALUES ('42                             1', '菜单视图－数据读取', 'URL', null, '/QLListData_Menu.menuList.qact*', '13acb3da84c949eeb600388659469cd1', null);
INSERT INTO `au_authorities` VALUES ('43                             1', '删除菜单', 'URL', null, '/QLDelete_Menu.qact*', '13acb3da84c949eeb600388659469cd1', null);
INSERT INTO `au_authorities` VALUES ('44                             1', '资源管理-数据', 'URL', null, '/QLListData_Au_resource.List.qact*', '2b1b51a7513448c7a9c9c7670fc6161a', null);
INSERT INTO `au_authorities` VALUES ('45                             1', '添加资源-视图', 'URL', null, '/QLInsertView_Au_resource.Insert.qact*', '2b1b51a7513448c7a9c9c7670fc6161a', null);
INSERT INTO `au_authorities` VALUES ('46                             1', '添加资源', 'URL', null, '/QLInsert_Au_resource.Insert.qact*', '2b1b51a7513448c7a9c9c7670fc6161a', null);
INSERT INTO `au_authorities` VALUES ('47                             1', '修改资源-视图', 'URL', null, '/QLUpdateView_Au_resource.Update.qact*', '2b1b51a7513448c7a9c9c7670fc6161a', null);
INSERT INTO `au_authorities` VALUES ('48                             1', '修改资源', 'URL', null, '/QLUpdate_Au_resource.Update.qact*', '2b1b51a7513448c7a9c9c7670fc6161a', null);
INSERT INTO `au_authorities` VALUES ('49                             1', '删除资源', 'URL', null, '/QLDelete_Au_resource.qact*', '2b1b51a7513448c7a9c9c7670fc6161a', null);
INSERT INTO `au_authorities` VALUES ('4a1b270d5fff49c6ad5891d79106f7ef', 'AUT党风廉政', '', '4a1b270d5fff49c6ad5891d79106f7', null, '4a1b270d5fff49c6ad5891d79106f7ef', 'sysauto');
INSERT INTO `au_authorities` VALUES ('4c60c264a6764987a48a736159202d65', 'AUT联系单位', '', '4c60c264a6764987a48a736159202d', null, '4c60c264a6764987a48a736159202d65', 'sysauto');
INSERT INTO `au_authorities` VALUES ('5                              1', 'AUT菜单管理', '', '5                             ', null, '5                              1', 'sysauto');
INSERT INTO `au_authorities` VALUES ('50                             1', '权限列表', 'URL', 'authListTab', '/Au_authoritiesListView1.qact*', '6d1cfabec2944a16b587d04029552f26', null);
INSERT INTO `au_authorities` VALUES ('501faf84472345d08c4100ff6c11b1c4', 'AUT综合保障', '', '501faf84472345d08c4100ff6c11b1', null, '501faf84472345d08c4100ff6c11b1c4', 'sysauto');
INSERT INTO `au_authorities` VALUES ('51                             1', '权限列表-数据', 'URL', null, '/QLListData_Au_authorities.Au_authoritiesList1.qact*', '6d1cfabec2944a16b587d04029552f26', null);
INSERT INTO `au_authorities` VALUES ('52                             1', '新增权限-视图', 'URL', null, '/QLInsertView_Au_authorities.Insert2.qact*', '6d1cfabec2944a16b587d04029552f26', null);
INSERT INTO `au_authorities` VALUES ('53                             1', '新增权限', 'URL', null, '/Au_authoritiesInsert2.qact*', '6d1cfabec2944a16b587d04029552f26', null);
INSERT INTO `au_authorities` VALUES ('54                             1', '修改权限-视图', 'URL', null, '/Au_authoritiesUpdateView2.qact*', '6d1cfabec2944a16b587d04029552f26', null);
INSERT INTO `au_authorities` VALUES ('55                             1', '修改权限', 'URL', null, '/QLUpdate_Au_authorities.Update2.qact*', '6d1cfabec2944a16b587d04029552f26', null);
INSERT INTO `au_authorities` VALUES ('56                             1', '加入权限-视图', 'URL', null, '/Au_authoritiesListView2.qact*', '6d1cfabec2944a16b587d04029552f26', null);
INSERT INTO `au_authorities` VALUES ('57                             1', '加入权限', 'URL', null, '/addAuthToRes.qact*', '6d1cfabec2944a16b587d04029552f26', null);
INSERT INTO `au_authorities` VALUES ('58                             1', '移除权限', 'URL', null, '/delAuthFromRes.qact*', '6d1cfabec2944a16b587d04029552f26', null);
INSERT INTO `au_authorities` VALUES ('59                             1', '删除权限', 'URL', null, '/QLDelete_Au_authorities.qact*', '6d1cfabec2944a16b587d04029552f26', null);
INSERT INTO `au_authorities` VALUES ('5aa2c79cd455417c86fc5a2ef83434ac', 'AUT按类型', '', '5aa2c79cd455417c86fc5a2ef83434', null, '5aa2c79cd455417c86fc5a2ef83434ac', 'sysauto');
INSERT INTO `au_authorities` VALUES ('5df041dba9da4271ad13a96e559d620d', 'AUT重点跟进', '', '5df041dba9da4271ad13a96e559d62', null, '5df041dba9da4271ad13a96e559d620d', 'sysauto');
INSERT INTO `au_authorities` VALUES ('5e96cd9f1a9d4353b116c26cdac74283', 'AUT大额度资金使用', '', '5e96cd9f1a9d4353b116c26cdac742', null, '5e96cd9f1a9d4353b116c26cdac74283', 'sysauto');
INSERT INTO `au_authorities` VALUES ('6                              1', 'AUT菜单管理', '', '6                             ', null, '6                              1', 'sysauto');
INSERT INTO `au_authorities` VALUES ('66                             1', 'AUT组织机构设置', '', '66                            ', null, '66                             1', 'sysauto');
INSERT INTO `au_authorities` VALUES ('6ba86480cc2b49e9bcb86b44e1b2a16a', 'AUT系统管理', '', '6ba86480cc2b49e9bcb86b44e1b2a1', null, '6ba86480cc2b49e9bcb86b44e1b2a16a', 'sysauto');
INSERT INTO `au_authorities` VALUES ('6de354bab40745c099d9c16b10e2d114', 'AUT报备接收意见反馈', '', '6de354bab40745c099d9c16b10e2d1', null, '6de354bab40745c099d9c16b10e2d114', 'sysauto');
INSERT INTO `au_authorities` VALUES ('7                              1', 'AUT资源管理', '', '7                             ', null, '7                              1', 'sysauto');
INSERT INTO `au_authorities` VALUES ('720cad1135ab412785def4eced3f6603', 'AUT地级市', '', '720cad1135ab412785def4eced3f66', null, '720cad1135ab412785def4eced3f6603', 'sysauto');
INSERT INTO `au_authorities` VALUES ('7232a7e97ff047aa8c08f882f5b1725b', 'AUT河北省', '', '7232a7e97ff047aa8c08f882f5b172', null, '7232a7e97ff047aa8c08f882f5b1725b', 'sysauto');
INSERT INTO `au_authorities` VALUES ('7403520f253546e68befdf133f4f0c44', 'AUT首页', 'URL', '7403520f253546e68befdf133f4f0c', '/**', '7403520f253546e68befdf133f4f0c44', 'sysauto');
INSERT INTO `au_authorities` VALUES ('75                             1', '增加用户-视图', 'URL', null, '/QLInsertView_Au_UserInfo.Insert.qact*', 'b2d917466c3145e18178277dcec81c03', null);
INSERT INTO `au_authorities` VALUES ('7552148740334c928859395070dc38c0', 'AUT按单位', '', '7552148740334c928859395070dc38', null, '7552148740334c928859395070dc38c0', 'sysauto');
INSERT INTO `au_authorities` VALUES ('75c069a8d1874fd180f9cfd8aebefd50', 'AUT报备审批上报', '', '75c069a8d1874fd180f9cfd8aebefd', null, '75c069a8d1874fd180f9cfd8aebefd50', 'sysauto');
INSERT INTO `au_authorities` VALUES ('76                             1', '增加用户', 'URL', null, '/QLInsert_Au_UserInfo.Insert.qact*', 'b2d917466c3145e18178277dcec81c03', null);
INSERT INTO `au_authorities` VALUES ('77                             1', '修改用户-视图', 'URL', null, '/QLUpdateView_Au_UserInfo.Update.qact*', 'b2d917466c3145e18178277dcec81c03', null);
INSERT INTO `au_authorities` VALUES ('78                             1', '修改用户', 'URL', null, '/QLUpdate_Au_UserInfo.Update.qact*', 'b2d917466c3145e18178277dcec81c03', null);
INSERT INTO `au_authorities` VALUES ('79                             1', '删除用户', 'URL', null, '/au_userinfoDelete.qact*', 'b2d917466c3145e18178277dcec81c03', null);
INSERT INTO `au_authorities` VALUES ('7d7b2348f1cd49f3aab5d141555b4ba9', 'AUT工作动态', '', '7d7b2348f1cd49f3aab5d141555b4b', null, '7d7b2348f1cd49f3aab5d141555b4ba9', 'sysauto');
INSERT INTO `au_authorities` VALUES ('7f35a7782cf94ac1ad61ce8778c97046', 'AUT报备审批通过', '', '7f35a7782cf94ac1ad61ce8778c970', null, '7f35a7782cf94ac1ad61ce8778c97046', 'sysauto');
INSERT INTO `au_authorities` VALUES ('8                              1', 'AUT权限管理', '', '8                             ', null, '8                              1', 'sysauto');
INSERT INTO `au_authorities` VALUES ('80                             1', '用户角色分配-视图', 'URL', null, '/userAssignRole.qact*', 'b2d917466c3145e18178277dcec81c03', null);
INSERT INTO `au_authorities` VALUES ('81                             1', '用户角色分配', 'URL', null, '/insertUserRoles.qact*', 'b2d917466c3145e18178277dcec81c03', null);
INSERT INTO `au_authorities` VALUES ('82                             1', '个人设置', 'URL', 'UpdateCurrentUserInfoView', '/UpdateCurrentUserInfoView.qact*', '7866bb6c302d4ed58b1b38aff51a3532', '个人设置');
INSERT INTO `au_authorities` VALUES ('83                             1', '组织管理（列表）', 'URL', 'AuOrg', '/au_organizationListView-1.qact*', '71ad24ce267b4207aa1e6426c692bfbd', '组织管理');
INSERT INTO `au_authorities` VALUES ('84                             1', '组织管理（查询）', 'URL', 'orgQuery', '/au_organizationListData-1.qact*', '71ad24ce267b4207aa1e6426c692bfbd', '组织管理（查询）');
INSERT INTO `au_authorities` VALUES ('84a7f1a6cec343c38c1164d27cf58fef', 'AUT重要干部任免', '', '84a7f1a6cec343c38c1164d27cf58f', null, '84a7f1a6cec343c38c1164d27cf58fef', 'sysauto');
INSERT INTO `au_authorities` VALUES ('85                             1', '组织管理（删除）', 'URL', 'orgDelete', '/au_organizationDelete.qact*', '71ad24ce267b4207aa1e6426c692bfbd', '组织管理（删除）');
INSERT INTO `au_authorities` VALUES ('86                             1', '组织管理（新增）', 'URL', 'orgSave', '/au_organizationInsertView-1.qact*', '71ad24ce267b4207aa1e6426c692bfbd', '组织管理（新增）');
INSERT INTO `au_authorities` VALUES ('8645cd440b3247d8b838fb47cfebe021', '数据字典_修改', 'URL', null, '/sys_dictUpdate*-1.qact*', '29ebedfbfc5a463cb96f5137d2392f5b', null);
INSERT INTO `au_authorities` VALUES ('87                             1', '组织管理（修改）', 'URL', 'orgUpdate', '/au_organizationUpdateView-1.qact*', '71ad24ce267b4207aa1e6426c692bfbd', '组织管理（修改）');
INSERT INTO `au_authorities` VALUES ('897ec63cb985434f8fbaf39648f67acf', 'AUT意见反馈', '', '897ec63cb985434f8fbaf39648f67a', null, '897ec63cb985434f8fbaf39648f67acf', 'sysauto');
INSERT INTO `au_authorities` VALUES ('8b5e0e4a94f9467c846c645237bba021', 'AUT重大事项决策', '', '8b5e0e4a94f9467c846c645237bba0', null, '8b5e0e4a94f9467c846c645237bba021', 'sysauto');
INSERT INTO `au_authorities` VALUES ('8c0831ee7eb74486804369cc1e5033c6', 'AUT工作动态', '', '8c0831ee7eb74486804369cc1e5033', null, '8c0831ee7eb74486804369cc1e5033c6', 'sysauto');
INSERT INTO `au_authorities` VALUES ('8eab790f1810410fa2b2b91d49886fec', 'AUT业务规范文件', '', '8eab790f1810410fa2b2b91d49886f', null, '8eab790f1810410fa2b2b91d49886fec', 'sysauto');
INSERT INTO `au_authorities` VALUES ('9358d89162a94d60a7f11211cc885d73', 'AUT预警信息', '', '9358d89162a94d60a7f11211cc885d', null, '9358d89162a94d60a7f11211cc885d73', 'sysauto');
INSERT INTO `au_authorities` VALUES ('94684813ab2c4892ba8d48953581cd8d', 'AUT正常事项', '', '94684813ab2c4892ba8d48953581cd', null, '94684813ab2c4892ba8d48953581cd8d', 'sysauto');
INSERT INTO `au_authorities` VALUES ('96630a676cbb42c7b9178f24e2938447', 'AUT监督反馈', '', '96630a676cbb42c7b9178f24e29384', null, '96630a676cbb42c7b9178f24e2938447', 'sysauto');
INSERT INTO `au_authorities` VALUES ('97a04297ad8d42298a0b36d0b04e060b', 'AUT案件信访', '', '97a04297ad8d42298a0b36d0b04e06', null, '97a04297ad8d42298a0b36d0b04e060b', 'sysauto');
INSERT INTO `au_authorities` VALUES ('9df12c8efaa24b6b853197865426b71f', 'AUT统计分析', '', '9df12c8efaa24b6b853197865426b7', null, '9df12c8efaa24b6b853197865426b71f', 'sysauto');
INSERT INTO `au_authorities` VALUES ('a60f2be6c06e460e8dc6228a738d7065', 'AUT大额度资金使用', '', 'a60f2be6c06e460e8dc6228a738d70', null, 'a60f2be6c06e460e8dc6228a738d7065', 'sysauto');
INSERT INTO `au_authorities` VALUES ('ae0f584b76c34e4e9361c52793545d7b', 'AUT组织机构图', '', 'ae0f584b76c34e4e9361c52793545d', null, 'ae0f584b76c34e4e9361c52793545d7b', 'sysauto');
INSERT INTO `au_authorities` VALUES ('b0dbe5d2117b4dad92523f2ed4123c61', 'AUT重大事项决策', '', 'b0dbe5d2117b4dad92523f2ed4123c', null, 'b0dbe5d2117b4dad92523f2ed4123c61', 'sysauto');
INSERT INTO `au_authorities` VALUES ('b789aadbabad4cb49354ec8a0e858558', 'AUT重点跟进', '', 'b789aadbabad4cb49354ec8a0e8585', null, 'b789aadbabad4cb49354ec8a0e858558', 'sysauto');
INSERT INTO `au_authorities` VALUES ('bb188096556c43368f91eae055d2b329', 'AUT重要干部任免', '', 'bb188096556c43368f91eae055d2b3', null, 'bb188096556c43368f91eae055d2b329', 'sysauto');
INSERT INTO `au_authorities` VALUES ('be9d968087434cf9a0deaaaba311ecd6', 'AUT干部管理', '', 'be9d968087434cf9a0deaaaba311ec', null, 'be9d968087434cf9a0deaaaba311ecd6', 'sysauto');
INSERT INTO `au_authorities` VALUES ('bf7ff5fb2bca435aab846626db7f3c81', 'AUT报备接收意见反馈', '', 'bf7ff5fb2bca435aab846626db7f3c', null, 'bf7ff5fb2bca435aab846626db7f3c81', 'sysauto');
INSERT INTO `au_authorities` VALUES ('bfd80fdba8d545cb90bf67a3cbcfaa4b', 'AUT中央', '', 'bfd80fdba8d545cb90bf67a3cbcfaa', null, 'bfd80fdba8d545cb90bf67a3cbcfaa4b', 'sysauto');
INSERT INTO `au_authorities` VALUES ('c00c67e2f2a045918796e7f1fc654ebc', 'AUT意见反馈', '', 'c00c67e2f2a045918796e7f1fc654e', null, 'c00c67e2f2a045918796e7f1fc654ebc', 'sysauto');
INSERT INTO `au_authorities` VALUES ('c2a4c38fe05e4bb9be45959439db73b3', 'AUT意见反馈', '', 'c2a4c38fe05e4bb9be45959439db73', null, 'c2a4c38fe05e4bb9be45959439db73b3', 'sysauto');
INSERT INTO `au_authorities` VALUES ('c3682791f6e74aa2bd57339078793309', 'AUT紧急事项', '', 'c3682791f6e74aa2bd573390787933', null, 'c3682791f6e74aa2bd57339078793309', 'sysauto');
INSERT INTO `au_authorities` VALUES ('c3b07635b0424d7f9f7b1605a1459e43', 'AUT重要项目安排', '', 'c3b07635b0424d7f9f7b1605a1459e', null, 'c3b07635b0424d7f9f7b1605a1459e43', 'sysauto');
INSERT INTO `au_authorities` VALUES ('c557bdb73e804b9384069e539c244b46', 'AUT河北省', '', 'c557bdb73e804b9384069e539c244b', null, 'c557bdb73e804b9384069e539c244b46', 'sysauto');
INSERT INTO `au_authorities` VALUES ('c8f170f4fe4140a2baa718e18f68cf48', 'AUT信息报备', '', 'c8f170f4fe4140a2baa718e18f68cf', null, 'c8f170f4fe4140a2baa718e18f68cf48', 'sysauto');
INSERT INTO `au_authorities` VALUES ('c9179ec8fb2641dab1a1c0f01202ebe9', 'AUT文件汇编', '', 'c9179ec8fb2641dab1a1c0f01202eb', null, 'c9179ec8fb2641dab1a1c0f01202ebe9', 'sysauto');
INSERT INTO `au_authorities` VALUES ('d152c6be7df44c3dbac2b6db0ac5cd1c', 'AUT地级市', '', 'd152c6be7df44c3dbac2b6db0ac5cd', null, 'd152c6be7df44c3dbac2b6db0ac5cd1c', 'sysauto');
INSERT INTO `au_authorities` VALUES ('d2782dbdca2d4ccd8715831b7ceea581', 'AUT中央', '', 'd2782dbdca2d4ccd8715831b7ceea5', null, 'd2782dbdca2d4ccd8715831b7ceea581', 'sysauto');
INSERT INTO `au_authorities` VALUES ('d66e1a3070e44ed7acedef417d2bbdd3', 'AUT重大事项', '', 'd66e1a3070e44ed7acedef417d2bbd', null, 'd66e1a3070e44ed7acedef417d2bbdd3', 'sysauto');
INSERT INTO `au_authorities` VALUES ('d8ac8f6507a748c2941d8bd813863159', 'AUT重要项目安排', '', 'd8ac8f6507a748c2941d8bd8138631', null, 'd8ac8f6507a748c2941d8bd813863159', 'sysauto');
INSERT INTO `au_authorities` VALUES ('dde0f58433464815bf7abd4eb53fa0da', 'AUT重点跟进', '', 'dde0f58433464815bf7abd4eb53fa0', null, 'dde0f58433464815bf7abd4eb53fa0da', 'sysauto');
INSERT INTO `au_authorities` VALUES ('e1426637bfad46fcb85d61ef147dd07d', 'AUT月度报备统计', '', 'e1426637bfad46fcb85d61ef147dd0', null, 'e1426637bfad46fcb85d61ef147dd07d', 'sysauto');
INSERT INTO `au_authorities` VALUES ('e563c607d00b41d980cd72a769f04a60', 'AUT报备申请查询', '', 'e563c607d00b41d980cd72a769f04a', null, 'e563c607d00b41d980cd72a769f04a60', 'sysauto');
INSERT INTO `au_authorities` VALUES ('ed529941ecca4323b8e935ee273f9235', 'AUT宣传教育', '', 'ed529941ecca4323b8e935ee273f92', null, 'ed529941ecca4323b8e935ee273f9235', 'sysauto');
INSERT INTO `au_authorities` VALUES ('f7704d84784443dcbb1d96af16a3a7e6', 'AUT报备接收意见反馈', '', 'f7704d84784443dcbb1d96af16a3a7', null, 'f7704d84784443dcbb1d96af16a3a7e6', 'sysauto');
INSERT INTO `au_authorities` VALUES ('f7e97de154c1460b9d2edaac8e7bad48', 'AUT重点跟进', '', 'f7e97de154c1460b9d2edaac8e7bad', null, 'f7e97de154c1460b9d2edaac8e7bad48', 'sysauto');

-- ----------------------------
-- Table structure for au_organization
-- ----------------------------
DROP TABLE IF EXISTS `au_organization`;
CREATE TABLE `au_organization` (
  `ID` varchar(32) NOT NULL,
  `NAME` varchar(50) DEFAULT NULL,
  `NOTE` varchar(100) DEFAULT NULL,
  `TYPE` varchar(4) DEFAULT NULL,
  `PARENTID` varchar(32) DEFAULT NULL,
  `OTHER1` varchar(50) DEFAULT NULL,
  `OTHER2` varchar(50) DEFAULT NULL,
  `OTHER3` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of au_organization
-- ----------------------------
INSERT INTO `au_organization` VALUES ('010000', '河北省水利厅', '', '0000', '', '0', null, '000');
INSERT INTO `au_organization` VALUES ('010200', '河北省水务集团', '', '0010', '010000', '200', null, null);
INSERT INTO `au_organization` VALUES ('010201', '河北省南水北调工程建设管理局', '', '0010', '010200', '201', null, null);
INSERT INTO `au_organization` VALUES ('010202', '石津南水北调工程建设管理处', '', '0010', '010200', '202', null, null);
INSERT INTO `au_organization` VALUES ('010203', '廊涿南水北调工程建设管理处', '', '0010', '010200', '203', null, null);
INSERT INTO `au_organization` VALUES ('010204', '保沧南水北调工程建设管理处', '', '0010', '010200', '204', null, null);
INSERT INTO `au_organization` VALUES ('010300', '河北省滦河河务管理局', '', '0010', '010000', '300', null, '002');
INSERT INTO `au_organization` VALUES ('010301', '河北省水文水资源勘测局', '', '0010', '010000', '301', null, '010301');
INSERT INTO `au_organization` VALUES ('010302', '河北省水利科学研究院', '', '0010', '010000', '302', null, '010302');
INSERT INTO `au_organization` VALUES ('010303', '大清河河务管理处', '', '0010', '010000', '303', null, '010303');
INSERT INTO `au_organization` VALUES ('010304', '河北省子牙河河务管理处', '', '0010', '010000', '304', null, '010304');
INSERT INTO `au_organization` VALUES ('010305', '河北省南运河河务管理处', '', '0010', '010000', '305', null, '010305');
INSERT INTO `au_organization` VALUES ('010306', '河北省水利技术试验推广中心', '', '0010', '010000', '306', null, '010306');
INSERT INTO `au_organization` VALUES ('010307', '河北省水利物资供应站', '', '0010', '010000', '307', null, '010307');
INSERT INTO `au_organization` VALUES ('010308', '水利部河北水利水电勘测设计研究院', '', '0010', '010000', '308', null, '002001');
INSERT INTO `au_organization` VALUES ('010309', '河北省水利水电第二勘测设计研究院', '', '0010', '010000', '309', null, '002002');
INSERT INTO `au_organization` VALUES ('010310', '河北省水利工程局', '', '0010', '010000', '310', null, '002003');
INSERT INTO `au_organization` VALUES ('010311', '黄壁庄水库管理处', '', '0010', '010000', '311', null, '002004');
INSERT INTO `au_organization` VALUES ('010312', '河北省岗南水库管理局', '', '0010', '010000', '312', null, '002005');
INSERT INTO `au_organization` VALUES ('010313', '省桃林口水库管理局', '', '0010', '010000', '313', null, '002009');
INSERT INTO `au_organization` VALUES ('010314', '河北省石津灌区管理局', '', '0010', '010000', '314', null, '002008');
INSERT INTO `au_organization` VALUES ('010400', '河北省南水北调办', '', '0000', '', '400', null, '001');
INSERT INTO `au_organization` VALUES ('010401', '石家庄南水北调项目办', '', '0010', '010400', '401', null, '001001');
INSERT INTO `au_organization` VALUES ('010402', '邯郸南水北调项目办', '', '0010', '010400', '402', null, '001002');
INSERT INTO `au_organization` VALUES ('010403', '邢台南水北调项目办', '', '0010', '010400', '403', null, '001003');
INSERT INTO `au_organization` VALUES ('010404', '保定南水北调项目办', '', '0010', '010400', null, null, null);
INSERT INTO `au_organization` VALUES ('010405', '廊坊南水北调项目办', '', '0010', '010400', null, null, null);
INSERT INTO `au_organization` VALUES ('010406', '沧州南水北调项目办', '', '0010', '010400', null, null, null);
INSERT INTO `au_organization` VALUES ('010407', '衡水南水北调项目办', '', '0010', '010400', null, null, null);

-- ----------------------------
-- Table structure for au_org_type
-- ----------------------------
DROP TABLE IF EXISTS `au_org_type`;
CREATE TABLE `au_org_type` (
  `ID` char(4) NOT NULL,
  `TABLENM` varchar(50) DEFAULT NULL,
  `NOTE` varchar(100) DEFAULT NULL,
  `URL` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of au_org_type
-- ----------------------------
INSERT INTO `au_org_type` VALUES ('0000', 'ADDV', '行政区', 'temp+-==-+arcgis_webcontrols.src(1).zip');
INSERT INTO `au_org_type` VALUES ('0010', null, '管理机构', null);
INSERT INTO `au_org_type` VALUES ('1111', null, '地区组织', null);
INSERT INTO `au_org_type` VALUES ('1112', '123', '123', '123');
INSERT INTO `au_org_type` VALUES ('2222', null, '总公司部门', null);

-- ----------------------------
-- Table structure for au_outerapp
-- ----------------------------
DROP TABLE IF EXISTS `au_outerapp`;
CREATE TABLE `au_outerapp` (
  `APPID` varchar(20) NOT NULL,
  `NAME` varchar(50) DEFAULT NULL,
  `HOST` varchar(50) DEFAULT NULL,
  `PORT` varchar(10) DEFAULT NULL,
  `PATH` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`APPID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of au_outerapp
-- ----------------------------
INSERT INTO `au_outerapp` VALUES ('OASYS', '综合办公系统', 'http://localhost', '80', null);

-- ----------------------------
-- Table structure for au_resource
-- ----------------------------
DROP TABLE IF EXISTS `au_resource`;
CREATE TABLE `au_resource` (
  `RESID` char(32) NOT NULL DEFAULT '',
  `RESNAME` varchar(30) DEFAULT NULL,
  `PARENTID` char(32) DEFAULT NULL,
  `LISTORDER` decimal(11,0) DEFAULT NULL,
  `ENABLED` char(1) DEFAULT NULL,
  PRIMARY KEY (`RESID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of au_resource
-- ----------------------------
INSERT INTO `au_resource` VALUES ('0ad0ac3ae6fc4941b0ba415bb44fa988', 'RES组织机构', '', '2', '1');
INSERT INTO `au_resource` VALUES ('10000', 'RES报备申请', 'bb188096556c43368f91eae055d2b329', '1', '1');
INSERT INTO `au_resource` VALUES ('10001', 'RES报备申请查询', 'bb188096556c43368f91eae055d2b329', '2', '1');
INSERT INTO `au_resource` VALUES ('10002', 'RES报备审批上报', 'bb188096556c43368f91eae055d2b329', '3', '1');
INSERT INTO `au_resource` VALUES ('10003', 'RES报备审批通过', 'bb188096556c43368f91eae055d2b329', '4', '1');
INSERT INTO `au_resource` VALUES ('1006                           1', 'RES组织类型设置', '48                             1', '3', '1');
INSERT INTO `au_resource` VALUES ('1106                           1', 'RES个人通知', '35                             1', null, '1');
INSERT INTO `au_resource` VALUES ('172b5b39f2884fb1b23955b529e4ce9c', 'RES意见反馈', '84a7f1a6cec343c38c1164d27cf58fef', '1', '1');
INSERT INTO `au_resource` VALUES ('1e3f744df21b4380a7ae7c3544899dcb', 'RES法律法规文件', 'c9179ec8fb2641dab1a1c0f01202ebe9', '1', '1');
INSERT INTO `au_resource` VALUES ('2                              1', 'RES权限管理', '6ba86480cc2b49e9bcb86b44e1b2a16a', '1', '1');
INSERT INTO `au_resource` VALUES ('20000', 'RES报备申请', 'd8ac8f6507a748c2941d8bd813863159', '1', '1');
INSERT INTO `au_resource` VALUES ('20001', 'RES报备申请查询', 'd8ac8f6507a748c2941d8bd813863159', '2', '1');
INSERT INTO `au_resource` VALUES ('20002', 'RES报备审批上报', 'd8ac8f6507a748c2941d8bd813863159', '3', '1');
INSERT INTO `au_resource` VALUES ('20003', 'RES报备审批通过', 'd8ac8f6507a748c2941d8bd813863159', '4', '1');
INSERT INTO `au_resource` VALUES ('20b69cf0fa05407eb42a9111951db113', 'RES业务指导', '', '4', '1');
INSERT INTO `au_resource` VALUES ('27ff19273bed4de7a0de9572a5130431', 'RES报备申请', 'b0dbe5d2117b4dad92523f2ed4123c61', '1', '1');
INSERT INTO `au_resource` VALUES ('2a7017460e0441e5ab3d0493a682481f', 'RES文档信息管理', '6ba86480cc2b49e9bcb86b44e1b2a16a', '-1', '1');
INSERT INTO `au_resource` VALUES ('2cd2c119d6d14c88ba2c25c081d30169', 'RES系统访问权限管理', '2                              1', '5', '1');
INSERT INTO `au_resource` VALUES ('3                              1', 'RES用户管理', '2                              1', '1', '1');
INSERT INTO `au_resource` VALUES ('30000', 'RES报备申请', '5e96cd9f1a9d4353b116c26cdac74283', '1', '1');
INSERT INTO `au_resource` VALUES ('30001', 'RES报备申请查询', '5e96cd9f1a9d4353b116c26cdac74283', '2', '1');
INSERT INTO `au_resource` VALUES ('30002', 'RES报备审批上报', '5e96cd9f1a9d4353b116c26cdac74283', '3', '1');
INSERT INTO `au_resource` VALUES ('30003', 'RES报备审批通过', '5e96cd9f1a9d4353b116c26cdac74283', '4', '1');
INSERT INTO `au_resource` VALUES ('303f86231fd2470dbaaee04767b12dbd', 'RES监督管理', '', '7', '1');
INSERT INTO `au_resource` VALUES ('35                             1', 'RES个人设置', '6ba86480cc2b49e9bcb86b44e1b2a16a', '5', '1');
INSERT INTO `au_resource` VALUES ('36                             1', 'RES个人资料设置', '35                             1', '1', '1');
INSERT INTO `au_resource` VALUES ('37                             1', 'RES系统日志', '6ba86480cc2b49e9bcb86b44e1b2a16a', '6', '1');
INSERT INTO `au_resource` VALUES ('39                             1', 'RES字典管理', '6ba86480cc2b49e9bcb86b44e1b2a16a', '7', '1');
INSERT INTO `au_resource` VALUES ('4                              1', 'RES角色管理', '2                              1', '2', '1');
INSERT INTO `au_resource` VALUES ('40                             1', 'RES表字典', '39                             1', '1', '1');
INSERT INTO `au_resource` VALUES ('41                             1', 'RES字段字典', '39                             1', '2', '1');
INSERT INTO `au_resource` VALUES ('414b1176c4e84a7eb9140c2864911751', 'RES党纪党规文件', 'c9179ec8fb2641dab1a1c0f01202ebe9', '2', '1');
INSERT INTO `au_resource` VALUES ('42                             1', 'RES数据字典', '39                             1', '0', '1');
INSERT INTO `au_resource` VALUES ('48                             1', 'RES组织管理', '6ba86480cc2b49e9bcb86b44e1b2a16a', '0', '1');
INSERT INTO `au_resource` VALUES ('4a1b270d5fff49c6ad5891d79106f7ef', 'RES党风廉政', '20b69cf0fa05407eb42a9111951db113', '4', '1');
INSERT INTO `au_resource` VALUES ('4c60c264a6764987a48a736159202d65', 'RES联系单位', '0ad0ac3ae6fc4941b0ba415bb44fa988', '2', '1');
INSERT INTO `au_resource` VALUES ('5                              1', 'RES菜单管理', '6ba86480cc2b49e9bcb86b44e1b2a16a', '2', '1');
INSERT INTO `au_resource` VALUES ('501faf84472345d08c4100ff6c11b1c4', 'RES综合保障', '20b69cf0fa05407eb42a9111951db113', '1', '1');
INSERT INTO `au_resource` VALUES ('53                             1', 'RES组织用户分配', '48                             1', '2', '1');
INSERT INTO `au_resource` VALUES ('5aa2c79cd455417c86fc5a2ef83434ac', 'RES按类型', 'e1426637bfad46fcb85d61ef147dd07d', '2', '1');
INSERT INTO `au_resource` VALUES ('5df041dba9da4271ad13a96e559d620d', 'RES重点跟进', 'b0dbe5d2117b4dad92523f2ed4123c61', '4', '1');
INSERT INTO `au_resource` VALUES ('5e96cd9f1a9d4353b116c26cdac74283', 'RES大额度资金使用', 'c8f170f4fe4140a2baa718e18f68cf48', '4', '1');
INSERT INTO `au_resource` VALUES ('6                              1', 'RES菜单管理', '5                              1', '1', '1');
INSERT INTO `au_resource` VALUES ('66                             1', 'RES组织机构设置', '48                             1', '1', '1');
INSERT INTO `au_resource` VALUES ('6ba86480cc2b49e9bcb86b44e1b2a16a', 'RES系统管理', '', '100', '1');
INSERT INTO `au_resource` VALUES ('6de354bab40745c099d9c16b10e2d114', 'RES报备接收意见反馈', '94684813ab2c4892ba8d48953581cd8d', '1', '1');
INSERT INTO `au_resource` VALUES ('7                              1', 'RES资源管理', '2                              1', '3', '1');
INSERT INTO `au_resource` VALUES ('720cad1135ab412785def4eced3f6603', 'RES地级市', '8eab790f1810410fa2b2b91d49886fec', '3', '1');
INSERT INTO `au_resource` VALUES ('7232a7e97ff047aa8c08f882f5b1725b', 'RES河北省', '8eab790f1810410fa2b2b91d49886fec', '2', '1');
INSERT INTO `au_resource` VALUES ('7403520f253546e68befdf133f4f0c44', 'RES首页', '', '1', '1');
INSERT INTO `au_resource` VALUES ('7552148740334c928859395070dc38c0', 'RES按单位', 'e1426637bfad46fcb85d61ef147dd07d', '1', '1');
INSERT INTO `au_resource` VALUES ('75c069a8d1874fd180f9cfd8aebefd50', 'RES报备审批上报', 'b0dbe5d2117b4dad92523f2ed4123c61', '3', '1');
INSERT INTO `au_resource` VALUES ('7d7b2348f1cd49f3aab5d141555b4ba9', 'RES工作动态', '', '5', '1');
INSERT INTO `au_resource` VALUES ('7f35a7782cf94ac1ad61ce8778c97046', 'RES报备审批通过', 'b0dbe5d2117b4dad92523f2ed4123c61', '4', '1');
INSERT INTO `au_resource` VALUES ('8                              1', 'RES权限管理', '2                              1', '4', '1');
INSERT INTO `au_resource` VALUES ('84a7f1a6cec343c38c1164d27cf58fef', 'RES重要干部任免', '303f86231fd2470dbaaee04767b12dbd', '6', '1');
INSERT INTO `au_resource` VALUES ('897ec63cb985434f8fbaf39648f67acf', 'RES意见反馈', '8b5e0e4a94f9467c846c645237bba021', '1', '1');
INSERT INTO `au_resource` VALUES ('8b5e0e4a94f9467c846c645237bba021', 'RES重大事项决策', '303f86231fd2470dbaaee04767b12dbd', '5', '1');
INSERT INTO `au_resource` VALUES ('8c0831ee7eb74486804369cc1e5033c6', 'RES工作动态', '7d7b2348f1cd49f3aab5d141555b4ba9', '1', '1');
INSERT INTO `au_resource` VALUES ('8eab790f1810410fa2b2b91d49886fec', 'RES业务规范文件', 'c9179ec8fb2641dab1a1c0f01202ebe9', '3', '1');
INSERT INTO `au_resource` VALUES ('9358d89162a94d60a7f11211cc885d73', 'RES预警信息', '', '9', '1');
INSERT INTO `au_resource` VALUES ('94684813ab2c4892ba8d48953581cd8d', 'RES正常事项', '303f86231fd2470dbaaee04767b12dbd', '2', '1');
INSERT INTO `au_resource` VALUES ('96630a676cbb42c7b9178f24e2938447', 'RES监督反馈', 'b0dbe5d2117b4dad92523f2ed4123c61', '3', '1');
INSERT INTO `au_resource` VALUES ('97a04297ad8d42298a0b36d0b04e060b', 'RES案件信访', '20b69cf0fa05407eb42a9111951db113', '5', '1');
INSERT INTO `au_resource` VALUES ('9df12c8efaa24b6b853197865426b71f', 'RES统计分析', '', '8', '1');
INSERT INTO `au_resource` VALUES ('a60f2be6c06e460e8dc6228a738d7065', 'RES大额度资金使用', '303f86231fd2470dbaaee04767b12dbd', '8', '1');
INSERT INTO `au_resource` VALUES ('ae0f584b76c34e4e9361c52793545d7b', 'RES组织机构图', '0ad0ac3ae6fc4941b0ba415bb44fa988', '1', '1');
INSERT INTO `au_resource` VALUES ('b0dbe5d2117b4dad92523f2ed4123c61', 'RES重大事项决策', 'c8f170f4fe4140a2baa718e18f68cf48', '1', '1');
INSERT INTO `au_resource` VALUES ('b789aadbabad4cb49354ec8a0e858558', 'RES重点跟进', '94684813ab2c4892ba8d48953581cd8d', '2', '1');
INSERT INTO `au_resource` VALUES ('bb188096556c43368f91eae055d2b329', 'RES重要干部任免', 'c8f170f4fe4140a2baa718e18f68cf48', '2', '1');
INSERT INTO `au_resource` VALUES ('be9d968087434cf9a0deaaaba311ecd6', 'RES干部管理', '20b69cf0fa05407eb42a9111951db113', '2', '1');
INSERT INTO `au_resource` VALUES ('bf7ff5fb2bca435aab846626db7f3c81', 'RES报备接收意见反馈', 'd66e1a3070e44ed7acedef417d2bbdd3', '1', '1');
INSERT INTO `au_resource` VALUES ('bfd80fdba8d545cb90bf67a3cbcfaa4b', 'RES中央', '414b1176c4e84a7eb9140c2864911751', '1', '1');
INSERT INTO `au_resource` VALUES ('c00c67e2f2a045918796e7f1fc654ebc', 'RES意见反馈', 'a60f2be6c06e460e8dc6228a738d7065', '1', '1');
INSERT INTO `au_resource` VALUES ('c2a4c38fe05e4bb9be45959439db73b3', 'RES意见反馈', 'c3b07635b0424d7f9f7b1605a1459e43', '1', '1');
INSERT INTO `au_resource` VALUES ('c3682791f6e74aa2bd57339078793309', 'RES紧急事项', '303f86231fd2470dbaaee04767b12dbd', '3', '1');
INSERT INTO `au_resource` VALUES ('c3b07635b0424d7f9f7b1605a1459e43', 'RES重要项目安排', '303f86231fd2470dbaaee04767b12dbd', '7', '1');
INSERT INTO `au_resource` VALUES ('c557bdb73e804b9384069e539c244b46', 'RES河北省', '414b1176c4e84a7eb9140c2864911751', '2', '1');
INSERT INTO `au_resource` VALUES ('c8f170f4fe4140a2baa718e18f68cf48', 'RES信息报备', '', '6', '1');
INSERT INTO `au_resource` VALUES ('c9179ec8fb2641dab1a1c0f01202ebe9', 'RES文件汇编', '', '3', '1');
INSERT INTO `au_resource` VALUES ('d152c6be7df44c3dbac2b6db0ac5cd1c', 'RES地级市', '414b1176c4e84a7eb9140c2864911751', '3', '1');
INSERT INTO `au_resource` VALUES ('d2782dbdca2d4ccd8715831b7ceea581', 'RES中央', '8eab790f1810410fa2b2b91d49886fec', '1', '1');
INSERT INTO `au_resource` VALUES ('d66e1a3070e44ed7acedef417d2bbdd3', 'RES重大事项', '303f86231fd2470dbaaee04767b12dbd', '1', '1');
INSERT INTO `au_resource` VALUES ('d8ac8f6507a748c2941d8bd813863159', 'RES重要项目安排', 'c8f170f4fe4140a2baa718e18f68cf48', '3', '1');
INSERT INTO `au_resource` VALUES ('dde0f58433464815bf7abd4eb53fa0da', 'RES重点跟进', 'd66e1a3070e44ed7acedef417d2bbdd3', '2', '1');
INSERT INTO `au_resource` VALUES ('e1426637bfad46fcb85d61ef147dd07d', 'RES月度报备统计', '303f86231fd2470dbaaee04767b12dbd', '4', '1');
INSERT INTO `au_resource` VALUES ('e563c607d00b41d980cd72a769f04a60', 'RES报备申请查询', 'b0dbe5d2117b4dad92523f2ed4123c61', '2', '1');
INSERT INTO `au_resource` VALUES ('ed529941ecca4323b8e935ee273f9235', 'RES宣传教育', '20b69cf0fa05407eb42a9111951db113', '3', '1');
INSERT INTO `au_resource` VALUES ('f7704d84784443dcbb1d96af16a3a7e6', 'RES报备接收意见反馈', 'c3682791f6e74aa2bd57339078793309', '1', '1');
INSERT INTO `au_resource` VALUES ('f7e97de154c1460b9d2edaac8e7bad48', 'RES重点跟进', 'c3682791f6e74aa2bd57339078793309', '2', '1');

-- ----------------------------
-- Table structure for au_roles
-- ----------------------------
DROP TABLE IF EXISTS `au_roles`;
CREATE TABLE `au_roles` (
  `ROLEID` char(32) NOT NULL,
  `ROLENAME` varchar(50) DEFAULT NULL,
  `NOTE` varchar(100) DEFAULT NULL,
  `UPDATETIME` date DEFAULT NULL,
  `ENABLED` char(255) DEFAULT NULL,
  PRIMARY KEY (`ROLEID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of au_roles
-- ----------------------------
INSERT INTO `au_roles` VALUES ('022a2cf33d6b4f62ae65f2c3d7df18b7', '报备审批员', '进行本单位报备事项的审批工作', null, '1');
INSERT INTO `au_roles` VALUES ('107a6191a4c44266b5c9171a6d87eee0', '用户管理角色', null, null, '1');
INSERT INTO `au_roles` VALUES ('3602832774f3452fbca319f7d773b4b4', '普通人员', '具有查看组织机构、文件汇编、业务指导、工作动态等信息的角色', null, '1');
INSERT INTO `au_roles` VALUES ('38319e358b014d9780277342a6cabaa1', '总公司领导', null, null, '1');
INSERT INTO `au_roles` VALUES ('5706bc970988467a95f415045e2ba866', '报备员', '进行本单位事项报备填报工作', null, '1');
INSERT INTO `au_roles` VALUES ('a6ea5dc63fef49ba886c526637d449e7', '监督员', '对下级单位上报的报备事项进行监督', null, '1');
INSERT INTO `au_roles` VALUES ('e5c15331d1bd433a93986baef28cece9', '分公司业务人员', null, null, '1');
INSERT INTO `au_roles` VALUES ('ff055da914ee40faac623b32dd887ad8', '管理员', null, null, '1');
INSERT INTO `au_roles` VALUES ('ROLE_ANONYMOUS__________________', '匿名角色', null, null, '1');
INSERT INTO `au_roles` VALUES ('ROLE_ROOT_PROGRAM_______________', 'ROLE_ROOT_PROGRAM', null, null, '1');

-- ----------------------------
-- Table structure for au_role_resource
-- ----------------------------
DROP TABLE IF EXISTS `au_role_resource`;
CREATE TABLE `au_role_resource` (
  `ROLEID` char(32) NOT NULL,
  `RESID` char(32) NOT NULL,
  PRIMARY KEY (`ROLEID`,`RESID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of au_role_resource
-- ----------------------------
INSERT INTO `au_role_resource` VALUES ('107a6191a4c44266b5c9171a6d87eee0', '0ad0ac3ae6fc4941b0ba415bb44fa988');
INSERT INTO `au_role_resource` VALUES ('107a6191a4c44266b5c9171a6d87eee0', '10000');
INSERT INTO `au_role_resource` VALUES ('107a6191a4c44266b5c9171a6d87eee0', '10001');
INSERT INTO `au_role_resource` VALUES ('107a6191a4c44266b5c9171a6d87eee0', '10002');
INSERT INTO `au_role_resource` VALUES ('107a6191a4c44266b5c9171a6d87eee0', '10003');
INSERT INTO `au_role_resource` VALUES ('107a6191a4c44266b5c9171a6d87eee0', '1006                           1');
INSERT INTO `au_role_resource` VALUES ('107a6191a4c44266b5c9171a6d87eee0', '1106                           1');
INSERT INTO `au_role_resource` VALUES ('107a6191a4c44266b5c9171a6d87eee0', '172b5b39f2884fb1b23955b529e4ce9c');
INSERT INTO `au_role_resource` VALUES ('107a6191a4c44266b5c9171a6d87eee0', '1e3f744df21b4380a7ae7c3544899dcb');
INSERT INTO `au_role_resource` VALUES ('107a6191a4c44266b5c9171a6d87eee0', '2                              1');
INSERT INTO `au_role_resource` VALUES ('107a6191a4c44266b5c9171a6d87eee0', '20000');
INSERT INTO `au_role_resource` VALUES ('107a6191a4c44266b5c9171a6d87eee0', '20001');
INSERT INTO `au_role_resource` VALUES ('107a6191a4c44266b5c9171a6d87eee0', '20002');
INSERT INTO `au_role_resource` VALUES ('107a6191a4c44266b5c9171a6d87eee0', '20003');
INSERT INTO `au_role_resource` VALUES ('107a6191a4c44266b5c9171a6d87eee0', '20b69cf0fa05407eb42a9111951db113');
INSERT INTO `au_role_resource` VALUES ('107a6191a4c44266b5c9171a6d87eee0', '27ff19273bed4de7a0de9572a5130431');
INSERT INTO `au_role_resource` VALUES ('107a6191a4c44266b5c9171a6d87eee0', '2a7017460e0441e5ab3d0493a682481f');
INSERT INTO `au_role_resource` VALUES ('107a6191a4c44266b5c9171a6d87eee0', '2cd2c119d6d14c88ba2c25c081d30169');
INSERT INTO `au_role_resource` VALUES ('107a6191a4c44266b5c9171a6d87eee0', '3                              1');
INSERT INTO `au_role_resource` VALUES ('107a6191a4c44266b5c9171a6d87eee0', '30000');
INSERT INTO `au_role_resource` VALUES ('107a6191a4c44266b5c9171a6d87eee0', '30001');
INSERT INTO `au_role_resource` VALUES ('107a6191a4c44266b5c9171a6d87eee0', '30002');
INSERT INTO `au_role_resource` VALUES ('107a6191a4c44266b5c9171a6d87eee0', '30003');
INSERT INTO `au_role_resource` VALUES ('107a6191a4c44266b5c9171a6d87eee0', '303f86231fd2470dbaaee04767b12dbd');
INSERT INTO `au_role_resource` VALUES ('107a6191a4c44266b5c9171a6d87eee0', '35                             1');
INSERT INTO `au_role_resource` VALUES ('107a6191a4c44266b5c9171a6d87eee0', '36                             1');
INSERT INTO `au_role_resource` VALUES ('107a6191a4c44266b5c9171a6d87eee0', '37                             1');
INSERT INTO `au_role_resource` VALUES ('107a6191a4c44266b5c9171a6d87eee0', '39                             1');
INSERT INTO `au_role_resource` VALUES ('107a6191a4c44266b5c9171a6d87eee0', '4                              1');
INSERT INTO `au_role_resource` VALUES ('107a6191a4c44266b5c9171a6d87eee0', '40                             1');
INSERT INTO `au_role_resource` VALUES ('107a6191a4c44266b5c9171a6d87eee0', '41                             1');
INSERT INTO `au_role_resource` VALUES ('107a6191a4c44266b5c9171a6d87eee0', '414b1176c4e84a7eb9140c2864911751');
INSERT INTO `au_role_resource` VALUES ('107a6191a4c44266b5c9171a6d87eee0', '42                             1');
INSERT INTO `au_role_resource` VALUES ('107a6191a4c44266b5c9171a6d87eee0', '48                             1');
INSERT INTO `au_role_resource` VALUES ('107a6191a4c44266b5c9171a6d87eee0', '4a1b270d5fff49c6ad5891d79106f7ef');
INSERT INTO `au_role_resource` VALUES ('107a6191a4c44266b5c9171a6d87eee0', '4c60c264a6764987a48a736159202d65');
INSERT INTO `au_role_resource` VALUES ('107a6191a4c44266b5c9171a6d87eee0', '5                              1');
INSERT INTO `au_role_resource` VALUES ('107a6191a4c44266b5c9171a6d87eee0', '501faf84472345d08c4100ff6c11b1c4');
INSERT INTO `au_role_resource` VALUES ('107a6191a4c44266b5c9171a6d87eee0', '53                             1');
INSERT INTO `au_role_resource` VALUES ('107a6191a4c44266b5c9171a6d87eee0', '5aa2c79cd455417c86fc5a2ef83434ac');
INSERT INTO `au_role_resource` VALUES ('107a6191a4c44266b5c9171a6d87eee0', '5df041dba9da4271ad13a96e559d620d');
INSERT INTO `au_role_resource` VALUES ('107a6191a4c44266b5c9171a6d87eee0', '5e96cd9f1a9d4353b116c26cdac74283');
INSERT INTO `au_role_resource` VALUES ('107a6191a4c44266b5c9171a6d87eee0', '6                              1');
INSERT INTO `au_role_resource` VALUES ('107a6191a4c44266b5c9171a6d87eee0', '66                             1');
INSERT INTO `au_role_resource` VALUES ('107a6191a4c44266b5c9171a6d87eee0', '6ba86480cc2b49e9bcb86b44e1b2a16a');
INSERT INTO `au_role_resource` VALUES ('107a6191a4c44266b5c9171a6d87eee0', '6de354bab40745c099d9c16b10e2d114');
INSERT INTO `au_role_resource` VALUES ('107a6191a4c44266b5c9171a6d87eee0', '7                              1');
INSERT INTO `au_role_resource` VALUES ('107a6191a4c44266b5c9171a6d87eee0', '720cad1135ab412785def4eced3f6603');
INSERT INTO `au_role_resource` VALUES ('107a6191a4c44266b5c9171a6d87eee0', '7232a7e97ff047aa8c08f882f5b1725b');
INSERT INTO `au_role_resource` VALUES ('107a6191a4c44266b5c9171a6d87eee0', '7403520f253546e68befdf133f4f0c44');
INSERT INTO `au_role_resource` VALUES ('107a6191a4c44266b5c9171a6d87eee0', '7552148740334c928859395070dc38c0');
INSERT INTO `au_role_resource` VALUES ('107a6191a4c44266b5c9171a6d87eee0', '75c069a8d1874fd180f9cfd8aebefd50');
INSERT INTO `au_role_resource` VALUES ('107a6191a4c44266b5c9171a6d87eee0', '7d7b2348f1cd49f3aab5d141555b4ba9');
INSERT INTO `au_role_resource` VALUES ('107a6191a4c44266b5c9171a6d87eee0', '7f35a7782cf94ac1ad61ce8778c97046');
INSERT INTO `au_role_resource` VALUES ('107a6191a4c44266b5c9171a6d87eee0', '8                              1');
INSERT INTO `au_role_resource` VALUES ('107a6191a4c44266b5c9171a6d87eee0', '84a7f1a6cec343c38c1164d27cf58fef');
INSERT INTO `au_role_resource` VALUES ('107a6191a4c44266b5c9171a6d87eee0', '897ec63cb985434f8fbaf39648f67acf');
INSERT INTO `au_role_resource` VALUES ('107a6191a4c44266b5c9171a6d87eee0', '8b5e0e4a94f9467c846c645237bba021');
INSERT INTO `au_role_resource` VALUES ('107a6191a4c44266b5c9171a6d87eee0', '8c0831ee7eb74486804369cc1e5033c6');
INSERT INTO `au_role_resource` VALUES ('107a6191a4c44266b5c9171a6d87eee0', '8eab790f1810410fa2b2b91d49886fec');
INSERT INTO `au_role_resource` VALUES ('107a6191a4c44266b5c9171a6d87eee0', '9358d89162a94d60a7f11211cc885d73');
INSERT INTO `au_role_resource` VALUES ('107a6191a4c44266b5c9171a6d87eee0', '94684813ab2c4892ba8d48953581cd8d');
INSERT INTO `au_role_resource` VALUES ('107a6191a4c44266b5c9171a6d87eee0', '96630a676cbb42c7b9178f24e2938447');
INSERT INTO `au_role_resource` VALUES ('107a6191a4c44266b5c9171a6d87eee0', '97a04297ad8d42298a0b36d0b04e060b');
INSERT INTO `au_role_resource` VALUES ('107a6191a4c44266b5c9171a6d87eee0', '9df12c8efaa24b6b853197865426b71f');
INSERT INTO `au_role_resource` VALUES ('107a6191a4c44266b5c9171a6d87eee0', 'a60f2be6c06e460e8dc6228a738d7065');
INSERT INTO `au_role_resource` VALUES ('107a6191a4c44266b5c9171a6d87eee0', 'ae0f584b76c34e4e9361c52793545d7b');
INSERT INTO `au_role_resource` VALUES ('107a6191a4c44266b5c9171a6d87eee0', 'b0dbe5d2117b4dad92523f2ed4123c61');
INSERT INTO `au_role_resource` VALUES ('107a6191a4c44266b5c9171a6d87eee0', 'b789aadbabad4cb49354ec8a0e858558');
INSERT INTO `au_role_resource` VALUES ('107a6191a4c44266b5c9171a6d87eee0', 'bb188096556c43368f91eae055d2b329');
INSERT INTO `au_role_resource` VALUES ('107a6191a4c44266b5c9171a6d87eee0', 'be9d968087434cf9a0deaaaba311ecd6');
INSERT INTO `au_role_resource` VALUES ('107a6191a4c44266b5c9171a6d87eee0', 'bf7ff5fb2bca435aab846626db7f3c81');
INSERT INTO `au_role_resource` VALUES ('107a6191a4c44266b5c9171a6d87eee0', 'bfd80fdba8d545cb90bf67a3cbcfaa4b');
INSERT INTO `au_role_resource` VALUES ('107a6191a4c44266b5c9171a6d87eee0', 'c00c67e2f2a045918796e7f1fc654ebc');
INSERT INTO `au_role_resource` VALUES ('107a6191a4c44266b5c9171a6d87eee0', 'c2a4c38fe05e4bb9be45959439db73b3');
INSERT INTO `au_role_resource` VALUES ('107a6191a4c44266b5c9171a6d87eee0', 'c3682791f6e74aa2bd57339078793309');
INSERT INTO `au_role_resource` VALUES ('107a6191a4c44266b5c9171a6d87eee0', 'c3b07635b0424d7f9f7b1605a1459e43');
INSERT INTO `au_role_resource` VALUES ('107a6191a4c44266b5c9171a6d87eee0', 'c557bdb73e804b9384069e539c244b46');
INSERT INTO `au_role_resource` VALUES ('107a6191a4c44266b5c9171a6d87eee0', 'c8f170f4fe4140a2baa718e18f68cf48');
INSERT INTO `au_role_resource` VALUES ('107a6191a4c44266b5c9171a6d87eee0', 'c9179ec8fb2641dab1a1c0f01202ebe9');
INSERT INTO `au_role_resource` VALUES ('107a6191a4c44266b5c9171a6d87eee0', 'd152c6be7df44c3dbac2b6db0ac5cd1c');
INSERT INTO `au_role_resource` VALUES ('107a6191a4c44266b5c9171a6d87eee0', 'd2782dbdca2d4ccd8715831b7ceea581');
INSERT INTO `au_role_resource` VALUES ('107a6191a4c44266b5c9171a6d87eee0', 'd66e1a3070e44ed7acedef417d2bbdd3');
INSERT INTO `au_role_resource` VALUES ('107a6191a4c44266b5c9171a6d87eee0', 'd8ac8f6507a748c2941d8bd813863159');
INSERT INTO `au_role_resource` VALUES ('107a6191a4c44266b5c9171a6d87eee0', 'dde0f58433464815bf7abd4eb53fa0da');
INSERT INTO `au_role_resource` VALUES ('107a6191a4c44266b5c9171a6d87eee0', 'e1426637bfad46fcb85d61ef147dd07d');
INSERT INTO `au_role_resource` VALUES ('107a6191a4c44266b5c9171a6d87eee0', 'e563c607d00b41d980cd72a769f04a60');
INSERT INTO `au_role_resource` VALUES ('107a6191a4c44266b5c9171a6d87eee0', 'ed529941ecca4323b8e935ee273f9235');
INSERT INTO `au_role_resource` VALUES ('107a6191a4c44266b5c9171a6d87eee0', 'f7704d84784443dcbb1d96af16a3a7e6');
INSERT INTO `au_role_resource` VALUES ('107a6191a4c44266b5c9171a6d87eee0', 'f7e97de154c1460b9d2edaac8e7bad48');
INSERT INTO `au_role_resource` VALUES ('38319e358b014d9780277342a6cabaa1', '0ad0ac3ae6fc4941b0ba415bb44fa988');
INSERT INTO `au_role_resource` VALUES ('38319e358b014d9780277342a6cabaa1', '10000');
INSERT INTO `au_role_resource` VALUES ('38319e358b014d9780277342a6cabaa1', '10001');
INSERT INTO `au_role_resource` VALUES ('38319e358b014d9780277342a6cabaa1', '10002');
INSERT INTO `au_role_resource` VALUES ('38319e358b014d9780277342a6cabaa1', '10003');
INSERT INTO `au_role_resource` VALUES ('38319e358b014d9780277342a6cabaa1', '1006                           1');
INSERT INTO `au_role_resource` VALUES ('38319e358b014d9780277342a6cabaa1', '1106                           1');
INSERT INTO `au_role_resource` VALUES ('38319e358b014d9780277342a6cabaa1', '172b5b39f2884fb1b23955b529e4ce9c');
INSERT INTO `au_role_resource` VALUES ('38319e358b014d9780277342a6cabaa1', '1e3f744df21b4380a7ae7c3544899dcb');
INSERT INTO `au_role_resource` VALUES ('38319e358b014d9780277342a6cabaa1', '2                              1');
INSERT INTO `au_role_resource` VALUES ('38319e358b014d9780277342a6cabaa1', '20000');
INSERT INTO `au_role_resource` VALUES ('38319e358b014d9780277342a6cabaa1', '20001');
INSERT INTO `au_role_resource` VALUES ('38319e358b014d9780277342a6cabaa1', '20002');
INSERT INTO `au_role_resource` VALUES ('38319e358b014d9780277342a6cabaa1', '20003');
INSERT INTO `au_role_resource` VALUES ('38319e358b014d9780277342a6cabaa1', '20b69cf0fa05407eb42a9111951db113');
INSERT INTO `au_role_resource` VALUES ('38319e358b014d9780277342a6cabaa1', '27ff19273bed4de7a0de9572a5130431');
INSERT INTO `au_role_resource` VALUES ('38319e358b014d9780277342a6cabaa1', '2a7017460e0441e5ab3d0493a682481f');
INSERT INTO `au_role_resource` VALUES ('38319e358b014d9780277342a6cabaa1', '2cd2c119d6d14c88ba2c25c081d30169');
INSERT INTO `au_role_resource` VALUES ('38319e358b014d9780277342a6cabaa1', '3                              1');
INSERT INTO `au_role_resource` VALUES ('38319e358b014d9780277342a6cabaa1', '30000');
INSERT INTO `au_role_resource` VALUES ('38319e358b014d9780277342a6cabaa1', '30001');
INSERT INTO `au_role_resource` VALUES ('38319e358b014d9780277342a6cabaa1', '30002');
INSERT INTO `au_role_resource` VALUES ('38319e358b014d9780277342a6cabaa1', '30003');
INSERT INTO `au_role_resource` VALUES ('38319e358b014d9780277342a6cabaa1', '303f86231fd2470dbaaee04767b12dbd');
INSERT INTO `au_role_resource` VALUES ('38319e358b014d9780277342a6cabaa1', '35                             1');
INSERT INTO `au_role_resource` VALUES ('38319e358b014d9780277342a6cabaa1', '36                             1');
INSERT INTO `au_role_resource` VALUES ('38319e358b014d9780277342a6cabaa1', '37                             1');
INSERT INTO `au_role_resource` VALUES ('38319e358b014d9780277342a6cabaa1', '39                             1');
INSERT INTO `au_role_resource` VALUES ('38319e358b014d9780277342a6cabaa1', '4                              1');
INSERT INTO `au_role_resource` VALUES ('38319e358b014d9780277342a6cabaa1', '40                             1');
INSERT INTO `au_role_resource` VALUES ('38319e358b014d9780277342a6cabaa1', '41                             1');
INSERT INTO `au_role_resource` VALUES ('38319e358b014d9780277342a6cabaa1', '414b1176c4e84a7eb9140c2864911751');
INSERT INTO `au_role_resource` VALUES ('38319e358b014d9780277342a6cabaa1', '42                             1');
INSERT INTO `au_role_resource` VALUES ('38319e358b014d9780277342a6cabaa1', '48                             1');
INSERT INTO `au_role_resource` VALUES ('38319e358b014d9780277342a6cabaa1', '4a1b270d5fff49c6ad5891d79106f7ef');
INSERT INTO `au_role_resource` VALUES ('38319e358b014d9780277342a6cabaa1', '4c60c264a6764987a48a736159202d65');
INSERT INTO `au_role_resource` VALUES ('38319e358b014d9780277342a6cabaa1', '5                              1');
INSERT INTO `au_role_resource` VALUES ('38319e358b014d9780277342a6cabaa1', '501faf84472345d08c4100ff6c11b1c4');
INSERT INTO `au_role_resource` VALUES ('38319e358b014d9780277342a6cabaa1', '53                             1');
INSERT INTO `au_role_resource` VALUES ('38319e358b014d9780277342a6cabaa1', '5aa2c79cd455417c86fc5a2ef83434ac');
INSERT INTO `au_role_resource` VALUES ('38319e358b014d9780277342a6cabaa1', '5df041dba9da4271ad13a96e559d620d');
INSERT INTO `au_role_resource` VALUES ('38319e358b014d9780277342a6cabaa1', '5e96cd9f1a9d4353b116c26cdac74283');
INSERT INTO `au_role_resource` VALUES ('38319e358b014d9780277342a6cabaa1', '6                              1');
INSERT INTO `au_role_resource` VALUES ('38319e358b014d9780277342a6cabaa1', '66                             1');
INSERT INTO `au_role_resource` VALUES ('38319e358b014d9780277342a6cabaa1', '6ba86480cc2b49e9bcb86b44e1b2a16a');
INSERT INTO `au_role_resource` VALUES ('38319e358b014d9780277342a6cabaa1', '6de354bab40745c099d9c16b10e2d114');
INSERT INTO `au_role_resource` VALUES ('38319e358b014d9780277342a6cabaa1', '7                              1');
INSERT INTO `au_role_resource` VALUES ('38319e358b014d9780277342a6cabaa1', '720cad1135ab412785def4eced3f6603');
INSERT INTO `au_role_resource` VALUES ('38319e358b014d9780277342a6cabaa1', '7232a7e97ff047aa8c08f882f5b1725b');
INSERT INTO `au_role_resource` VALUES ('38319e358b014d9780277342a6cabaa1', '7403520f253546e68befdf133f4f0c44');
INSERT INTO `au_role_resource` VALUES ('38319e358b014d9780277342a6cabaa1', '7552148740334c928859395070dc38c0');
INSERT INTO `au_role_resource` VALUES ('38319e358b014d9780277342a6cabaa1', '75c069a8d1874fd180f9cfd8aebefd50');
INSERT INTO `au_role_resource` VALUES ('38319e358b014d9780277342a6cabaa1', '7d7b2348f1cd49f3aab5d141555b4ba9');
INSERT INTO `au_role_resource` VALUES ('38319e358b014d9780277342a6cabaa1', '7f35a7782cf94ac1ad61ce8778c97046');
INSERT INTO `au_role_resource` VALUES ('38319e358b014d9780277342a6cabaa1', '8                              1');
INSERT INTO `au_role_resource` VALUES ('38319e358b014d9780277342a6cabaa1', '84a7f1a6cec343c38c1164d27cf58fef');
INSERT INTO `au_role_resource` VALUES ('38319e358b014d9780277342a6cabaa1', '897ec63cb985434f8fbaf39648f67acf');
INSERT INTO `au_role_resource` VALUES ('38319e358b014d9780277342a6cabaa1', '8b5e0e4a94f9467c846c645237bba021');
INSERT INTO `au_role_resource` VALUES ('38319e358b014d9780277342a6cabaa1', '8c0831ee7eb74486804369cc1e5033c6');
INSERT INTO `au_role_resource` VALUES ('38319e358b014d9780277342a6cabaa1', '8eab790f1810410fa2b2b91d49886fec');
INSERT INTO `au_role_resource` VALUES ('38319e358b014d9780277342a6cabaa1', '9358d89162a94d60a7f11211cc885d73');
INSERT INTO `au_role_resource` VALUES ('38319e358b014d9780277342a6cabaa1', '94684813ab2c4892ba8d48953581cd8d');
INSERT INTO `au_role_resource` VALUES ('38319e358b014d9780277342a6cabaa1', '96630a676cbb42c7b9178f24e2938447');
INSERT INTO `au_role_resource` VALUES ('38319e358b014d9780277342a6cabaa1', '97a04297ad8d42298a0b36d0b04e060b');
INSERT INTO `au_role_resource` VALUES ('38319e358b014d9780277342a6cabaa1', '9df12c8efaa24b6b853197865426b71f');
INSERT INTO `au_role_resource` VALUES ('38319e358b014d9780277342a6cabaa1', 'a60f2be6c06e460e8dc6228a738d7065');
INSERT INTO `au_role_resource` VALUES ('38319e358b014d9780277342a6cabaa1', 'ae0f584b76c34e4e9361c52793545d7b');
INSERT INTO `au_role_resource` VALUES ('38319e358b014d9780277342a6cabaa1', 'b0dbe5d2117b4dad92523f2ed4123c61');
INSERT INTO `au_role_resource` VALUES ('38319e358b014d9780277342a6cabaa1', 'b789aadbabad4cb49354ec8a0e858558');
INSERT INTO `au_role_resource` VALUES ('38319e358b014d9780277342a6cabaa1', 'bb188096556c43368f91eae055d2b329');
INSERT INTO `au_role_resource` VALUES ('38319e358b014d9780277342a6cabaa1', 'be9d968087434cf9a0deaaaba311ecd6');
INSERT INTO `au_role_resource` VALUES ('38319e358b014d9780277342a6cabaa1', 'bf7ff5fb2bca435aab846626db7f3c81');
INSERT INTO `au_role_resource` VALUES ('38319e358b014d9780277342a6cabaa1', 'bfd80fdba8d545cb90bf67a3cbcfaa4b');
INSERT INTO `au_role_resource` VALUES ('38319e358b014d9780277342a6cabaa1', 'c00c67e2f2a045918796e7f1fc654ebc');
INSERT INTO `au_role_resource` VALUES ('38319e358b014d9780277342a6cabaa1', 'c2a4c38fe05e4bb9be45959439db73b3');
INSERT INTO `au_role_resource` VALUES ('38319e358b014d9780277342a6cabaa1', 'c3682791f6e74aa2bd57339078793309');
INSERT INTO `au_role_resource` VALUES ('38319e358b014d9780277342a6cabaa1', 'c3b07635b0424d7f9f7b1605a1459e43');
INSERT INTO `au_role_resource` VALUES ('38319e358b014d9780277342a6cabaa1', 'c557bdb73e804b9384069e539c244b46');
INSERT INTO `au_role_resource` VALUES ('38319e358b014d9780277342a6cabaa1', 'c8f170f4fe4140a2baa718e18f68cf48');
INSERT INTO `au_role_resource` VALUES ('38319e358b014d9780277342a6cabaa1', 'c9179ec8fb2641dab1a1c0f01202ebe9');
INSERT INTO `au_role_resource` VALUES ('38319e358b014d9780277342a6cabaa1', 'd152c6be7df44c3dbac2b6db0ac5cd1c');
INSERT INTO `au_role_resource` VALUES ('38319e358b014d9780277342a6cabaa1', 'd2782dbdca2d4ccd8715831b7ceea581');
INSERT INTO `au_role_resource` VALUES ('38319e358b014d9780277342a6cabaa1', 'd66e1a3070e44ed7acedef417d2bbdd3');
INSERT INTO `au_role_resource` VALUES ('38319e358b014d9780277342a6cabaa1', 'd8ac8f6507a748c2941d8bd813863159');
INSERT INTO `au_role_resource` VALUES ('38319e358b014d9780277342a6cabaa1', 'dde0f58433464815bf7abd4eb53fa0da');
INSERT INTO `au_role_resource` VALUES ('38319e358b014d9780277342a6cabaa1', 'e1426637bfad46fcb85d61ef147dd07d');
INSERT INTO `au_role_resource` VALUES ('38319e358b014d9780277342a6cabaa1', 'e563c607d00b41d980cd72a769f04a60');
INSERT INTO `au_role_resource` VALUES ('38319e358b014d9780277342a6cabaa1', 'ed529941ecca4323b8e935ee273f9235');
INSERT INTO `au_role_resource` VALUES ('38319e358b014d9780277342a6cabaa1', 'f7704d84784443dcbb1d96af16a3a7e6');
INSERT INTO `au_role_resource` VALUES ('38319e358b014d9780277342a6cabaa1', 'f7e97de154c1460b9d2edaac8e7bad48');
INSERT INTO `au_role_resource` VALUES ('e5c15331d1bd433a93986baef28cece9', '10000');
INSERT INTO `au_role_resource` VALUES ('e5c15331d1bd433a93986baef28cece9', '10001');
INSERT INTO `au_role_resource` VALUES ('e5c15331d1bd433a93986baef28cece9', '10002');
INSERT INTO `au_role_resource` VALUES ('e5c15331d1bd433a93986baef28cece9', '10003');
INSERT INTO `au_role_resource` VALUES ('e5c15331d1bd433a93986baef28cece9', '1006                           1');
INSERT INTO `au_role_resource` VALUES ('e5c15331d1bd433a93986baef28cece9', '1106                           1');
INSERT INTO `au_role_resource` VALUES ('e5c15331d1bd433a93986baef28cece9', '172b5b39f2884fb1b23955b529e4ce9c');
INSERT INTO `au_role_resource` VALUES ('e5c15331d1bd433a93986baef28cece9', '1e3f744df21b4380a7ae7c3544899dcb');
INSERT INTO `au_role_resource` VALUES ('e5c15331d1bd433a93986baef28cece9', '2                              1');
INSERT INTO `au_role_resource` VALUES ('e5c15331d1bd433a93986baef28cece9', '20000');
INSERT INTO `au_role_resource` VALUES ('e5c15331d1bd433a93986baef28cece9', '20001');
INSERT INTO `au_role_resource` VALUES ('e5c15331d1bd433a93986baef28cece9', '20002');
INSERT INTO `au_role_resource` VALUES ('e5c15331d1bd433a93986baef28cece9', '20003');
INSERT INTO `au_role_resource` VALUES ('e5c15331d1bd433a93986baef28cece9', '20b69cf0fa05407eb42a9111951db113');
INSERT INTO `au_role_resource` VALUES ('e5c15331d1bd433a93986baef28cece9', '27ff19273bed4de7a0de9572a5130431');
INSERT INTO `au_role_resource` VALUES ('e5c15331d1bd433a93986baef28cece9', '2a7017460e0441e5ab3d0493a682481f');
INSERT INTO `au_role_resource` VALUES ('e5c15331d1bd433a93986baef28cece9', '2cd2c119d6d14c88ba2c25c081d30169');
INSERT INTO `au_role_resource` VALUES ('e5c15331d1bd433a93986baef28cece9', '3                              1');
INSERT INTO `au_role_resource` VALUES ('e5c15331d1bd433a93986baef28cece9', '30000');
INSERT INTO `au_role_resource` VALUES ('e5c15331d1bd433a93986baef28cece9', '30001');
INSERT INTO `au_role_resource` VALUES ('e5c15331d1bd433a93986baef28cece9', '30002');
INSERT INTO `au_role_resource` VALUES ('e5c15331d1bd433a93986baef28cece9', '30003');
INSERT INTO `au_role_resource` VALUES ('e5c15331d1bd433a93986baef28cece9', '303f86231fd2470dbaaee04767b12dbd');
INSERT INTO `au_role_resource` VALUES ('e5c15331d1bd433a93986baef28cece9', '35                             1');
INSERT INTO `au_role_resource` VALUES ('e5c15331d1bd433a93986baef28cece9', '36                             1');
INSERT INTO `au_role_resource` VALUES ('e5c15331d1bd433a93986baef28cece9', '37                             1');
INSERT INTO `au_role_resource` VALUES ('e5c15331d1bd433a93986baef28cece9', '39                             1');
INSERT INTO `au_role_resource` VALUES ('e5c15331d1bd433a93986baef28cece9', '4                              1');
INSERT INTO `au_role_resource` VALUES ('e5c15331d1bd433a93986baef28cece9', '40                             1');
INSERT INTO `au_role_resource` VALUES ('e5c15331d1bd433a93986baef28cece9', '41                             1');
INSERT INTO `au_role_resource` VALUES ('e5c15331d1bd433a93986baef28cece9', '414b1176c4e84a7eb9140c2864911751');
INSERT INTO `au_role_resource` VALUES ('e5c15331d1bd433a93986baef28cece9', '42                             1');
INSERT INTO `au_role_resource` VALUES ('e5c15331d1bd433a93986baef28cece9', '48                             1');
INSERT INTO `au_role_resource` VALUES ('e5c15331d1bd433a93986baef28cece9', '4a1b270d5fff49c6ad5891d79106f7ef');
INSERT INTO `au_role_resource` VALUES ('e5c15331d1bd433a93986baef28cece9', '5                              1');
INSERT INTO `au_role_resource` VALUES ('e5c15331d1bd433a93986baef28cece9', '501faf84472345d08c4100ff6c11b1c4');
INSERT INTO `au_role_resource` VALUES ('e5c15331d1bd433a93986baef28cece9', '53                             1');
INSERT INTO `au_role_resource` VALUES ('e5c15331d1bd433a93986baef28cece9', '5aa2c79cd455417c86fc5a2ef83434ac');
INSERT INTO `au_role_resource` VALUES ('e5c15331d1bd433a93986baef28cece9', '5df041dba9da4271ad13a96e559d620d');
INSERT INTO `au_role_resource` VALUES ('e5c15331d1bd433a93986baef28cece9', '5e96cd9f1a9d4353b116c26cdac74283');
INSERT INTO `au_role_resource` VALUES ('e5c15331d1bd433a93986baef28cece9', '6                              1');
INSERT INTO `au_role_resource` VALUES ('e5c15331d1bd433a93986baef28cece9', '66                             1');
INSERT INTO `au_role_resource` VALUES ('e5c15331d1bd433a93986baef28cece9', '6ba86480cc2b49e9bcb86b44e1b2a16a');
INSERT INTO `au_role_resource` VALUES ('e5c15331d1bd433a93986baef28cece9', '6de354bab40745c099d9c16b10e2d114');
INSERT INTO `au_role_resource` VALUES ('e5c15331d1bd433a93986baef28cece9', '7                              1');
INSERT INTO `au_role_resource` VALUES ('e5c15331d1bd433a93986baef28cece9', '720cad1135ab412785def4eced3f6603');
INSERT INTO `au_role_resource` VALUES ('e5c15331d1bd433a93986baef28cece9', '7232a7e97ff047aa8c08f882f5b1725b');
INSERT INTO `au_role_resource` VALUES ('e5c15331d1bd433a93986baef28cece9', '7403520f253546e68befdf133f4f0c44');
INSERT INTO `au_role_resource` VALUES ('e5c15331d1bd433a93986baef28cece9', '7552148740334c928859395070dc38c0');
INSERT INTO `au_role_resource` VALUES ('e5c15331d1bd433a93986baef28cece9', '75c069a8d1874fd180f9cfd8aebefd50');
INSERT INTO `au_role_resource` VALUES ('e5c15331d1bd433a93986baef28cece9', '7d7b2348f1cd49f3aab5d141555b4ba9');
INSERT INTO `au_role_resource` VALUES ('e5c15331d1bd433a93986baef28cece9', '7f35a7782cf94ac1ad61ce8778c97046');
INSERT INTO `au_role_resource` VALUES ('e5c15331d1bd433a93986baef28cece9', '8                              1');
INSERT INTO `au_role_resource` VALUES ('e5c15331d1bd433a93986baef28cece9', '84a7f1a6cec343c38c1164d27cf58fef');
INSERT INTO `au_role_resource` VALUES ('e5c15331d1bd433a93986baef28cece9', '897ec63cb985434f8fbaf39648f67acf');
INSERT INTO `au_role_resource` VALUES ('e5c15331d1bd433a93986baef28cece9', '8b5e0e4a94f9467c846c645237bba021');
INSERT INTO `au_role_resource` VALUES ('e5c15331d1bd433a93986baef28cece9', '8c0831ee7eb74486804369cc1e5033c6');
INSERT INTO `au_role_resource` VALUES ('e5c15331d1bd433a93986baef28cece9', '8eab790f1810410fa2b2b91d49886fec');
INSERT INTO `au_role_resource` VALUES ('e5c15331d1bd433a93986baef28cece9', '9358d89162a94d60a7f11211cc885d73');
INSERT INTO `au_role_resource` VALUES ('e5c15331d1bd433a93986baef28cece9', '94684813ab2c4892ba8d48953581cd8d');
INSERT INTO `au_role_resource` VALUES ('e5c15331d1bd433a93986baef28cece9', '96630a676cbb42c7b9178f24e2938447');
INSERT INTO `au_role_resource` VALUES ('e5c15331d1bd433a93986baef28cece9', '97a04297ad8d42298a0b36d0b04e060b');
INSERT INTO `au_role_resource` VALUES ('e5c15331d1bd433a93986baef28cece9', '9df12c8efaa24b6b853197865426b71f');
INSERT INTO `au_role_resource` VALUES ('e5c15331d1bd433a93986baef28cece9', 'a60f2be6c06e460e8dc6228a738d7065');
INSERT INTO `au_role_resource` VALUES ('e5c15331d1bd433a93986baef28cece9', 'b0dbe5d2117b4dad92523f2ed4123c61');
INSERT INTO `au_role_resource` VALUES ('e5c15331d1bd433a93986baef28cece9', 'b789aadbabad4cb49354ec8a0e858558');
INSERT INTO `au_role_resource` VALUES ('e5c15331d1bd433a93986baef28cece9', 'bb188096556c43368f91eae055d2b329');
INSERT INTO `au_role_resource` VALUES ('e5c15331d1bd433a93986baef28cece9', 'be9d968087434cf9a0deaaaba311ecd6');
INSERT INTO `au_role_resource` VALUES ('e5c15331d1bd433a93986baef28cece9', 'bf7ff5fb2bca435aab846626db7f3c81');
INSERT INTO `au_role_resource` VALUES ('e5c15331d1bd433a93986baef28cece9', 'bfd80fdba8d545cb90bf67a3cbcfaa4b');
INSERT INTO `au_role_resource` VALUES ('e5c15331d1bd433a93986baef28cece9', 'c00c67e2f2a045918796e7f1fc654ebc');
INSERT INTO `au_role_resource` VALUES ('e5c15331d1bd433a93986baef28cece9', 'c2a4c38fe05e4bb9be45959439db73b3');
INSERT INTO `au_role_resource` VALUES ('e5c15331d1bd433a93986baef28cece9', 'c3682791f6e74aa2bd57339078793309');
INSERT INTO `au_role_resource` VALUES ('e5c15331d1bd433a93986baef28cece9', 'c3b07635b0424d7f9f7b1605a1459e43');
INSERT INTO `au_role_resource` VALUES ('e5c15331d1bd433a93986baef28cece9', 'c557bdb73e804b9384069e539c244b46');
INSERT INTO `au_role_resource` VALUES ('e5c15331d1bd433a93986baef28cece9', 'c8f170f4fe4140a2baa718e18f68cf48');
INSERT INTO `au_role_resource` VALUES ('e5c15331d1bd433a93986baef28cece9', 'c9179ec8fb2641dab1a1c0f01202ebe9');
INSERT INTO `au_role_resource` VALUES ('e5c15331d1bd433a93986baef28cece9', 'd152c6be7df44c3dbac2b6db0ac5cd1c');
INSERT INTO `au_role_resource` VALUES ('e5c15331d1bd433a93986baef28cece9', 'd2782dbdca2d4ccd8715831b7ceea581');
INSERT INTO `au_role_resource` VALUES ('e5c15331d1bd433a93986baef28cece9', 'd66e1a3070e44ed7acedef417d2bbdd3');
INSERT INTO `au_role_resource` VALUES ('e5c15331d1bd433a93986baef28cece9', 'd8ac8f6507a748c2941d8bd813863159');
INSERT INTO `au_role_resource` VALUES ('e5c15331d1bd433a93986baef28cece9', 'dde0f58433464815bf7abd4eb53fa0da');
INSERT INTO `au_role_resource` VALUES ('e5c15331d1bd433a93986baef28cece9', 'e1426637bfad46fcb85d61ef147dd07d');
INSERT INTO `au_role_resource` VALUES ('e5c15331d1bd433a93986baef28cece9', 'e563c607d00b41d980cd72a769f04a60');
INSERT INTO `au_role_resource` VALUES ('e5c15331d1bd433a93986baef28cece9', 'ed529941ecca4323b8e935ee273f9235');
INSERT INTO `au_role_resource` VALUES ('e5c15331d1bd433a93986baef28cece9', 'f7704d84784443dcbb1d96af16a3a7e6');
INSERT INTO `au_role_resource` VALUES ('e5c15331d1bd433a93986baef28cece9', 'f7e97de154c1460b9d2edaac8e7bad48');
INSERT INTO `au_role_resource` VALUES ('ff055da914ee40faac623b32dd887ad8', '0ad0ac3ae6fc4941b0ba415bb44fa988');
INSERT INTO `au_role_resource` VALUES ('ff055da914ee40faac623b32dd887ad8', '10000');
INSERT INTO `au_role_resource` VALUES ('ff055da914ee40faac623b32dd887ad8', '10001');
INSERT INTO `au_role_resource` VALUES ('ff055da914ee40faac623b32dd887ad8', '10002');
INSERT INTO `au_role_resource` VALUES ('ff055da914ee40faac623b32dd887ad8', '10003');
INSERT INTO `au_role_resource` VALUES ('ff055da914ee40faac623b32dd887ad8', '1006                           1');
INSERT INTO `au_role_resource` VALUES ('ff055da914ee40faac623b32dd887ad8', '1106                           1');
INSERT INTO `au_role_resource` VALUES ('ff055da914ee40faac623b32dd887ad8', '172b5b39f2884fb1b23955b529e4ce9c');
INSERT INTO `au_role_resource` VALUES ('ff055da914ee40faac623b32dd887ad8', '1e3f744df21b4380a7ae7c3544899dcb');
INSERT INTO `au_role_resource` VALUES ('ff055da914ee40faac623b32dd887ad8', '2                              1');
INSERT INTO `au_role_resource` VALUES ('ff055da914ee40faac623b32dd887ad8', '20000');
INSERT INTO `au_role_resource` VALUES ('ff055da914ee40faac623b32dd887ad8', '20001');
INSERT INTO `au_role_resource` VALUES ('ff055da914ee40faac623b32dd887ad8', '20002');
INSERT INTO `au_role_resource` VALUES ('ff055da914ee40faac623b32dd887ad8', '20003');
INSERT INTO `au_role_resource` VALUES ('ff055da914ee40faac623b32dd887ad8', '20b69cf0fa05407eb42a9111951db113');
INSERT INTO `au_role_resource` VALUES ('ff055da914ee40faac623b32dd887ad8', '27ff19273bed4de7a0de9572a5130431');
INSERT INTO `au_role_resource` VALUES ('ff055da914ee40faac623b32dd887ad8', '2a7017460e0441e5ab3d0493a682481f');
INSERT INTO `au_role_resource` VALUES ('ff055da914ee40faac623b32dd887ad8', '2cd2c119d6d14c88ba2c25c081d30169');
INSERT INTO `au_role_resource` VALUES ('ff055da914ee40faac623b32dd887ad8', '3                              1');
INSERT INTO `au_role_resource` VALUES ('ff055da914ee40faac623b32dd887ad8', '30000');
INSERT INTO `au_role_resource` VALUES ('ff055da914ee40faac623b32dd887ad8', '30001');
INSERT INTO `au_role_resource` VALUES ('ff055da914ee40faac623b32dd887ad8', '30002');
INSERT INTO `au_role_resource` VALUES ('ff055da914ee40faac623b32dd887ad8', '30003');
INSERT INTO `au_role_resource` VALUES ('ff055da914ee40faac623b32dd887ad8', '303f86231fd2470dbaaee04767b12dbd');
INSERT INTO `au_role_resource` VALUES ('ff055da914ee40faac623b32dd887ad8', '35                             1');
INSERT INTO `au_role_resource` VALUES ('ff055da914ee40faac623b32dd887ad8', '36                             1');
INSERT INTO `au_role_resource` VALUES ('ff055da914ee40faac623b32dd887ad8', '37                             1');
INSERT INTO `au_role_resource` VALUES ('ff055da914ee40faac623b32dd887ad8', '39                             1');
INSERT INTO `au_role_resource` VALUES ('ff055da914ee40faac623b32dd887ad8', '4                              1');
INSERT INTO `au_role_resource` VALUES ('ff055da914ee40faac623b32dd887ad8', '40                             1');
INSERT INTO `au_role_resource` VALUES ('ff055da914ee40faac623b32dd887ad8', '41                             1');
INSERT INTO `au_role_resource` VALUES ('ff055da914ee40faac623b32dd887ad8', '414b1176c4e84a7eb9140c2864911751');
INSERT INTO `au_role_resource` VALUES ('ff055da914ee40faac623b32dd887ad8', '42                             1');
INSERT INTO `au_role_resource` VALUES ('ff055da914ee40faac623b32dd887ad8', '48                             1');
INSERT INTO `au_role_resource` VALUES ('ff055da914ee40faac623b32dd887ad8', '4a1b270d5fff49c6ad5891d79106f7ef');
INSERT INTO `au_role_resource` VALUES ('ff055da914ee40faac623b32dd887ad8', '4c60c264a6764987a48a736159202d65');
INSERT INTO `au_role_resource` VALUES ('ff055da914ee40faac623b32dd887ad8', '5                              1');
INSERT INTO `au_role_resource` VALUES ('ff055da914ee40faac623b32dd887ad8', '501faf84472345d08c4100ff6c11b1c4');
INSERT INTO `au_role_resource` VALUES ('ff055da914ee40faac623b32dd887ad8', '53                             1');
INSERT INTO `au_role_resource` VALUES ('ff055da914ee40faac623b32dd887ad8', '5aa2c79cd455417c86fc5a2ef83434ac');
INSERT INTO `au_role_resource` VALUES ('ff055da914ee40faac623b32dd887ad8', '5df041dba9da4271ad13a96e559d620d');
INSERT INTO `au_role_resource` VALUES ('ff055da914ee40faac623b32dd887ad8', '5e96cd9f1a9d4353b116c26cdac74283');
INSERT INTO `au_role_resource` VALUES ('ff055da914ee40faac623b32dd887ad8', '6                              1');
INSERT INTO `au_role_resource` VALUES ('ff055da914ee40faac623b32dd887ad8', '66                             1');
INSERT INTO `au_role_resource` VALUES ('ff055da914ee40faac623b32dd887ad8', '6ba86480cc2b49e9bcb86b44e1b2a16a');
INSERT INTO `au_role_resource` VALUES ('ff055da914ee40faac623b32dd887ad8', '6de354bab40745c099d9c16b10e2d114');
INSERT INTO `au_role_resource` VALUES ('ff055da914ee40faac623b32dd887ad8', '7                              1');
INSERT INTO `au_role_resource` VALUES ('ff055da914ee40faac623b32dd887ad8', '720cad1135ab412785def4eced3f6603');
INSERT INTO `au_role_resource` VALUES ('ff055da914ee40faac623b32dd887ad8', '7232a7e97ff047aa8c08f882f5b1725b');
INSERT INTO `au_role_resource` VALUES ('ff055da914ee40faac623b32dd887ad8', '7403520f253546e68befdf133f4f0c44');
INSERT INTO `au_role_resource` VALUES ('ff055da914ee40faac623b32dd887ad8', '7552148740334c928859395070dc38c0');
INSERT INTO `au_role_resource` VALUES ('ff055da914ee40faac623b32dd887ad8', '75c069a8d1874fd180f9cfd8aebefd50');
INSERT INTO `au_role_resource` VALUES ('ff055da914ee40faac623b32dd887ad8', '7d7b2348f1cd49f3aab5d141555b4ba9');
INSERT INTO `au_role_resource` VALUES ('ff055da914ee40faac623b32dd887ad8', '7f35a7782cf94ac1ad61ce8778c97046');
INSERT INTO `au_role_resource` VALUES ('ff055da914ee40faac623b32dd887ad8', '8                              1');
INSERT INTO `au_role_resource` VALUES ('ff055da914ee40faac623b32dd887ad8', '84a7f1a6cec343c38c1164d27cf58fef');
INSERT INTO `au_role_resource` VALUES ('ff055da914ee40faac623b32dd887ad8', '897ec63cb985434f8fbaf39648f67acf');
INSERT INTO `au_role_resource` VALUES ('ff055da914ee40faac623b32dd887ad8', '8b5e0e4a94f9467c846c645237bba021');
INSERT INTO `au_role_resource` VALUES ('ff055da914ee40faac623b32dd887ad8', '8c0831ee7eb74486804369cc1e5033c6');
INSERT INTO `au_role_resource` VALUES ('ff055da914ee40faac623b32dd887ad8', '8eab790f1810410fa2b2b91d49886fec');
INSERT INTO `au_role_resource` VALUES ('ff055da914ee40faac623b32dd887ad8', '9358d89162a94d60a7f11211cc885d73');
INSERT INTO `au_role_resource` VALUES ('ff055da914ee40faac623b32dd887ad8', '94684813ab2c4892ba8d48953581cd8d');
INSERT INTO `au_role_resource` VALUES ('ff055da914ee40faac623b32dd887ad8', '96630a676cbb42c7b9178f24e2938447');
INSERT INTO `au_role_resource` VALUES ('ff055da914ee40faac623b32dd887ad8', '97a04297ad8d42298a0b36d0b04e060b');
INSERT INTO `au_role_resource` VALUES ('ff055da914ee40faac623b32dd887ad8', '9df12c8efaa24b6b853197865426b71f');
INSERT INTO `au_role_resource` VALUES ('ff055da914ee40faac623b32dd887ad8', 'a60f2be6c06e460e8dc6228a738d7065');
INSERT INTO `au_role_resource` VALUES ('ff055da914ee40faac623b32dd887ad8', 'ae0f584b76c34e4e9361c52793545d7b');
INSERT INTO `au_role_resource` VALUES ('ff055da914ee40faac623b32dd887ad8', 'b0dbe5d2117b4dad92523f2ed4123c61');
INSERT INTO `au_role_resource` VALUES ('ff055da914ee40faac623b32dd887ad8', 'b789aadbabad4cb49354ec8a0e858558');
INSERT INTO `au_role_resource` VALUES ('ff055da914ee40faac623b32dd887ad8', 'bb188096556c43368f91eae055d2b329');
INSERT INTO `au_role_resource` VALUES ('ff055da914ee40faac623b32dd887ad8', 'be9d968087434cf9a0deaaaba311ecd6');
INSERT INTO `au_role_resource` VALUES ('ff055da914ee40faac623b32dd887ad8', 'bf7ff5fb2bca435aab846626db7f3c81');
INSERT INTO `au_role_resource` VALUES ('ff055da914ee40faac623b32dd887ad8', 'bfd80fdba8d545cb90bf67a3cbcfaa4b');
INSERT INTO `au_role_resource` VALUES ('ff055da914ee40faac623b32dd887ad8', 'c00c67e2f2a045918796e7f1fc654ebc');
INSERT INTO `au_role_resource` VALUES ('ff055da914ee40faac623b32dd887ad8', 'c2a4c38fe05e4bb9be45959439db73b3');
INSERT INTO `au_role_resource` VALUES ('ff055da914ee40faac623b32dd887ad8', 'c3682791f6e74aa2bd57339078793309');
INSERT INTO `au_role_resource` VALUES ('ff055da914ee40faac623b32dd887ad8', 'c3b07635b0424d7f9f7b1605a1459e43');
INSERT INTO `au_role_resource` VALUES ('ff055da914ee40faac623b32dd887ad8', 'c557bdb73e804b9384069e539c244b46');
INSERT INTO `au_role_resource` VALUES ('ff055da914ee40faac623b32dd887ad8', 'c8f170f4fe4140a2baa718e18f68cf48');
INSERT INTO `au_role_resource` VALUES ('ff055da914ee40faac623b32dd887ad8', 'c9179ec8fb2641dab1a1c0f01202ebe9');
INSERT INTO `au_role_resource` VALUES ('ff055da914ee40faac623b32dd887ad8', 'd152c6be7df44c3dbac2b6db0ac5cd1c');
INSERT INTO `au_role_resource` VALUES ('ff055da914ee40faac623b32dd887ad8', 'd2782dbdca2d4ccd8715831b7ceea581');
INSERT INTO `au_role_resource` VALUES ('ff055da914ee40faac623b32dd887ad8', 'd66e1a3070e44ed7acedef417d2bbdd3');
INSERT INTO `au_role_resource` VALUES ('ff055da914ee40faac623b32dd887ad8', 'd8ac8f6507a748c2941d8bd813863159');
INSERT INTO `au_role_resource` VALUES ('ff055da914ee40faac623b32dd887ad8', 'dde0f58433464815bf7abd4eb53fa0da');
INSERT INTO `au_role_resource` VALUES ('ff055da914ee40faac623b32dd887ad8', 'e1426637bfad46fcb85d61ef147dd07d');
INSERT INTO `au_role_resource` VALUES ('ff055da914ee40faac623b32dd887ad8', 'e563c607d00b41d980cd72a769f04a60');
INSERT INTO `au_role_resource` VALUES ('ff055da914ee40faac623b32dd887ad8', 'ed529941ecca4323b8e935ee273f9235');
INSERT INTO `au_role_resource` VALUES ('ff055da914ee40faac623b32dd887ad8', 'f7704d84784443dcbb1d96af16a3a7e6');
INSERT INTO `au_role_resource` VALUES ('ff055da914ee40faac623b32dd887ad8', 'f7e97de154c1460b9d2edaac8e7bad48');

-- ----------------------------
-- Table structure for au_userinfo
-- ----------------------------
DROP TABLE IF EXISTS `au_userinfo`;
CREATE TABLE `au_userinfo` (
  `USERID` varchar(30) NOT NULL DEFAULT '',
  `USERNAME` varchar(30) DEFAULT NULL,
  `PASSWORD` char(32) DEFAULT NULL,
  `ENABLED` char(1) DEFAULT NULL,
  `MAIL` varchar(50) DEFAULT NULL,
  `PHONE` varchar(15) DEFAULT NULL,
  `ADDRESS` varchar(100) DEFAULT NULL,
  `ORGID` varchar(32) DEFAULT NULL,
  `GDDH` varchar(15) DEFAULT NULL COMMENT '固定电话',
  PRIMARY KEY (`USERID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of au_userinfo
-- ----------------------------
INSERT INTO `au_userinfo` VALUES ('admin', '管理员', '21232f297a57a5a743894a0e4a801fc3', '1', '1111@11.com', '15811185811', '2010-12-17 16:03:50', '010000', null);
INSERT INTO `au_userinfo` VALUES ('jgj1', '南水北调建管局1', 'c4ca4238a0b923820dcc509a6f75849b', '1', 'jgj1@126.com', '13712345678', '', '010201', null);
INSERT INTO `au_userinfo` VALUES ('jgj2', '南水北调建管局2', 'c4ca4238a0b923820dcc509a6f75849b', '1', 'jgj2@126.com', '13412345678', '', '010201', null);
INSERT INTO `au_userinfo` VALUES ('mxf', 'mxf', '3c8cc3fefdef5a6c65eff82a3caf1144', '1', 'mxf@126.com', '13612345678', null, null, null);
INSERT INTO `au_userinfo` VALUES ('nsbdb1', '南水北调办1', 'c4ca4238a0b923820dcc509a6f75849b', '1', 'nsbdb1@126.com', '13123456781', '', '010400', null);
INSERT INTO `au_userinfo` VALUES ('nsbdb2', '南水北调办2', 'c4ca4238a0b923820dcc509a6f75849b', '1', 'nsbdb2@126.com', '13212344321', '', '010400', null);
INSERT INTO `au_userinfo` VALUES ('oamadmin', 'oamadmin', 'c4ca4238a0b923820dcc509a6f75849b', '1', 'mxf@126.com', '13612345678', 'dddd', '011000', null);
INSERT INTO `au_userinfo` VALUES ('readonly', 'readonly', '336ebbb2179beaa7340a4f1620f3af40', '1', null, null, null, null, null);
INSERT INTO `au_userinfo` VALUES ('root', '系统管理员', '63a9f0ea7bb98050796b649e85481845', '1', 'xx@22.com', '15811111111', null, '010000', null);
INSERT INTO `au_userinfo` VALUES ('sjznsbdb1', '石家庄南水北调办1', 'c4ca4238a0b923820dcc509a6f75849b', '1', 'sjznsbdb1@126.com', '13412345643', '', '010401', null);
INSERT INTO `au_userinfo` VALUES ('sjznsbdb2', '石家庄南水北调办2', 'c4ca4238a0b923820dcc509a6f75849b', '1', 'sjznsbdb2@126.com', '13123456785', '', '010401', null);
INSERT INTO `au_userinfo` VALUES ('slt1', '水利厅1', 'c4ca4238a0b923820dcc509a6f75849b', '1', 'slt@126.com', '13812345678', '', '010000', null);
INSERT INTO `au_userinfo` VALUES ('slt2', '水利厅2', 'c4ca4238a0b923820dcc509a6f75849b', '1', 'slt2@126.com', '13712345678', '', '010000', null);
INSERT INTO `au_userinfo` VALUES ('super', 'super', '1b3231655cebb7a1f783eddf27d254ca', '1', null, null, null, '000000000', null);
INSERT INTO `au_userinfo` VALUES ('swjt1', '水务集团1', 'c4ca4238a0b923820dcc509a6f75849b', '1', 'swjt1@126.com', '13512345678', '', '010200', null);
INSERT INTO `au_userinfo` VALUES ('swjt2', '水务集团2', 'c4ca4238a0b923820dcc509a6f75849b', '1', 'swjt2@126.com', '13612345678', '', '010200', null);
INSERT INTO `au_userinfo` VALUES ('xxx', 'xxx', 'c4ca4238a0b923820dcc509a6f75849b', '1', 'xxx@q.com', '13825623562', '', '010000', null);

-- ----------------------------
-- Table structure for au_user_org
-- ----------------------------
DROP TABLE IF EXISTS `au_user_org`;
CREATE TABLE `au_user_org` (
  `USERID` varchar(32) NOT NULL,
  `ORGID` varchar(32) NOT NULL,
  PRIMARY KEY (`USERID`,`ORGID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of au_user_org
-- ----------------------------
INSERT INTO `au_user_org` VALUES ('admin', '010000');
INSERT INTO `au_user_org` VALUES ('jgj1', '010201');
INSERT INTO `au_user_org` VALUES ('jgj2', '010201');
INSERT INTO `au_user_org` VALUES ('nsbdb1', '010400');
INSERT INTO `au_user_org` VALUES ('nsbdb2', '010400');
INSERT INTO `au_user_org` VALUES ('sjznsbdb1', '010401');
INSERT INTO `au_user_org` VALUES ('sjznsbdb2', '010401');
INSERT INTO `au_user_org` VALUES ('slt1', '010000');
INSERT INTO `au_user_org` VALUES ('slt2', '010000');
INSERT INTO `au_user_org` VALUES ('swjt1', '010200');
INSERT INTO `au_user_org` VALUES ('swjt2', '010200');
INSERT INTO `au_user_org` VALUES ('xxx', '010000');

-- ----------------------------
-- Table structure for au_user_role
-- ----------------------------
DROP TABLE IF EXISTS `au_user_role`;
CREATE TABLE `au_user_role` (
  `ROLEID` char(32) NOT NULL,
  `USERID` varchar(30) NOT NULL,
  PRIMARY KEY (`ROLEID`,`USERID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of au_user_role
-- ----------------------------
INSERT INTO `au_user_role` VALUES ('107a6191a4c44266b5c9171a6d87eee0', 'dc');
INSERT INTO `au_user_role` VALUES ('107a6191a4c44266b5c9171a6d87eee0', 'hm');
INSERT INTO `au_user_role` VALUES ('107a6191a4c44266b5c9171a6d87eee0', 'hrq');
INSERT INTO `au_user_role` VALUES ('107a6191a4c44266b5c9171a6d87eee0', 'lb');
INSERT INTO `au_user_role` VALUES ('107a6191a4c44266b5c9171a6d87eee0', 'lq');
INSERT INTO `au_user_role` VALUES ('107a6191a4c44266b5c9171a6d87eee0', 'lyf');
INSERT INTO `au_user_role` VALUES ('107a6191a4c44266b5c9171a6d87eee0', 'mxf');
INSERT INTO `au_user_role` VALUES ('107a6191a4c44266b5c9171a6d87eee0', 'qingliu');
INSERT INTO `au_user_role` VALUES ('107a6191a4c44266b5c9171a6d87eee0', 'wxj');
INSERT INTO `au_user_role` VALUES ('107a6191a4c44266b5c9171a6d87eee0', 'zhh');
INSERT INTO `au_user_role` VALUES ('e5c15331d1bd433a93986baef28cece9', 'slt1');
INSERT INTO `au_user_role` VALUES ('e5c15331d1bd433a93986baef28cece9', 'slt2');
INSERT INTO `au_user_role` VALUES ('ff055da914ee40faac623b32dd887ad8', 'admin');
INSERT INTO `au_user_role` VALUES ('ff055da914ee40faac623b32dd887ad8', 'cyh');
INSERT INTO `au_user_role` VALUES ('ff055da914ee40faac623b32dd887ad8', 'dc');
INSERT INTO `au_user_role` VALUES ('ff055da914ee40faac623b32dd887ad8', 'hm');
INSERT INTO `au_user_role` VALUES ('ff055da914ee40faac623b32dd887ad8', 'hrq');
INSERT INTO `au_user_role` VALUES ('ff055da914ee40faac623b32dd887ad8', 'mxf');
INSERT INTO `au_user_role` VALUES ('ff055da914ee40faac623b32dd887ad8', 'qingliu');
INSERT INTO `au_user_role` VALUES ('ff055da914ee40faac623b32dd887ad8', 'swjt1');
INSERT INTO `au_user_role` VALUES ('ff055da914ee40faac623b32dd887ad8', 'swjt2');
INSERT INTO `au_user_role` VALUES ('ff055da914ee40faac623b32dd887ad8', 'wpsadmin');
INSERT INTO `au_user_role` VALUES ('ff055da914ee40faac623b32dd887ad8', 'wxj');
INSERT INTO `au_user_role` VALUES ('ff055da914ee40faac623b32dd887ad8', 'xxx');
INSERT INTO `au_user_role` VALUES ('ff055da914ee40faac623b32dd887ad8', 'zhh');
INSERT INTO `au_user_role` VALUES ('ROLE_ROOT_PROGRAM_______________', 'oamadmin');
INSERT INTO `au_user_role` VALUES ('ROLE_ROOT_PROGRAM_______________', 'root');

-- ----------------------------
-- Table structure for fldlist
-- ----------------------------
DROP TABLE IF EXISTS `fldlist`;
CREATE TABLE `fldlist` (
  `TABEN` varchar(50) NOT NULL,
  `FLDEN` varchar(60) NOT NULL,
  `FLDNM` varchar(40) DEFAULT NULL,
  `TPLN` varchar(8) DEFAULT NULL,
  `NULLID` char(1) DEFAULT NULL,
  `FLDUNT` varchar(20) DEFAULT NULL,
  `PKID` char(1) DEFAULT NULL,
  `FKTABEN` varchar(40) DEFAULT NULL,
  `IDXNM` varchar(20) DEFAULT NULL,
  `DEFVAL` varchar(255) DEFAULT NULL,
  `NUM` decimal(11,0) DEFAULT NULL,
  `NT` varchar(255) DEFAULT NULL,
  `ISAUTO` char(1) DEFAULT NULL,
  `FKFLDNM` varchar(60) DEFAULT NULL,
  `FDSTYLE` varchar(1) DEFAULT NULL,
  `FDTYPE` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`TABEN`,`FLDEN`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of fldlist
-- ----------------------------
INSERT INTO `fldlist` VALUES ('ADDV', 'ADDVCD', '行政分区编码', null, '1', null, '0', null, null, null, null, null, '0', null, '0', '0');

-- ----------------------------
-- Table structure for sys_code
-- ----------------------------
DROP TABLE IF EXISTS `sys_code`;
CREATE TABLE `sys_code` (
  `DICTID` varchar(30) NOT NULL,
  `CODE` varchar(32) NOT NULL,
  `NAME` varchar(50) DEFAULT NULL,
  `NOTE` varchar(100) DEFAULT NULL,
  `SEQUENCE` decimal(11,0) DEFAULT NULL,
  PRIMARY KEY (`DICTID`,`CODE`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_code
-- ----------------------------
INSERT INTO `sys_code` VALUES ('authType', 'FUNCTION', '函数', null, '2');
INSERT INTO `sys_code` VALUES ('authType', 'URL', 'URL', null, '1');
INSERT INTO `sys_code` VALUES ('cons_scal', '1', '大型', null, null);
INSERT INTO `sys_code` VALUES ('cons_scal', '2', '中型', null, null);
INSERT INTO `sys_code` VALUES ('cons_scal', '3', '小型', null, null);
INSERT INTO `sys_code` VALUES ('FDSTYLE', '0', '一般字段', null, '1');
INSERT INTO `sys_code` VALUES ('FDSTYLE', '1', '序列关键字', null, '2');
INSERT INTO `sys_code` VALUES ('FDSTYLE', '2', '时间关键字', null, '3');
INSERT INTO `sys_code` VALUES ('FDSTYLE', '3', '节点关键字', null, '4');
INSERT INTO `sys_code` VALUES ('FDSTYLE', '4', '元数据关键字', null, '5');
INSERT INTO `sys_code` VALUES ('FDSTYLE', '5', '序号关键字', null, '6');
INSERT INTO `sys_code` VALUES ('FDSTYLE', '6', '其他关键字', null, '7');
INSERT INTO `sys_code` VALUES ('FDSTYLE', '7', '非空', null, '8');
INSERT INTO `sys_code` VALUES ('FDTYPE', '0', '字符', null, '0');
INSERT INTO `sys_code` VALUES ('FDTYPE', '1', '整型', null, '1');
INSERT INTO `sys_code` VALUES ('FDTYPE', '2', '浮点', null, '2');
INSERT INTO `sys_code` VALUES ('FDTYPE', '3', '日期', null, '3');
INSERT INTO `sys_code` VALUES ('FDTYPE', '4', 'BLOB', null, '4');
INSERT INTO `sys_code` VALUES ('FDTYPE', '5', 'CLOB', null, '5');
INSERT INTO `sys_code` VALUES ('FDTYPE', '6', '时间戳', null, '6');
INSERT INTO `sys_code` VALUES ('language', 'en', '英文', null, '2');
INSERT INTO `sys_code` VALUES ('language', 'zh_CN', '中文', null, '1');
INSERT INTO `sys_code` VALUES ('LKTP', '1', '内嵌窗口中打开', null, '1');
INSERT INTO `sys_code` VALUES ('LKTP', '3', '在当前窗口中打开', null, '3');
INSERT INTO `sys_code` VALUES ('LogPrio', 'DEBUG', '调试', null, '1');
INSERT INTO `sys_code` VALUES ('LogPrio', 'ERROR', '错误', null, '4');
INSERT INTO `sys_code` VALUES ('LogPrio', 'FATAL', '严重错误', null, '5');
INSERT INTO `sys_code` VALUES ('LogPrio', 'INFO', '信息', null, '2');
INSERT INTO `sys_code` VALUES ('LogPrio', 'WARN', '警告', null, '3');
INSERT INTO `sys_code` VALUES ('showAuthIsAssign', '1', '只显示未分配资源', null, '1');
INSERT INTO `sys_code` VALUES ('showAuthIsAssign', '2', '显示所有资源', null, '2');
INSERT INTO `sys_code` VALUES ('TREATTYPE', '1', '自行处理', null, null);
INSERT INTO `sys_code` VALUES ('TREATTYPE', '2', '委托处理', null, null);
INSERT INTO `sys_code` VALUES ('TREATTYPE', '3', '直排', null, null);
INSERT INTO `sys_code` VALUES ('TREATTYPE', '4', '其它', null, null);
INSERT INTO `sys_code` VALUES ('wio_type', '0', '其它', null, null);
INSERT INTO `sys_code` VALUES ('wio_type', '1', '生活污水', null, null);
INSERT INTO `sys_code` VALUES ('wio_type', '2', '餐饮业污水', null, null);
INSERT INTO `sys_code` VALUES ('wio_type', '3', '洗浴', null, null);
INSERT INTO `sys_code` VALUES ('wio_type', '4', '洗车', null, null);
INSERT INTO `sys_code` VALUES ('wio_type', '5', '宾馆饭店', null, null);
INSERT INTO `sys_code` VALUES ('wio_type', '6', '生产废水', null, null);
INSERT INTO `sys_code` VALUES ('YesOrNo', '0', '否', null, '1');
INSERT INTO `sys_code` VALUES ('YesOrNo', '1', '是', null, '2');

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `DICTID` varchar(30) NOT NULL,
  `DICTNM` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`DICTID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('authType', '权限类型级别');
INSERT INTO `sys_dict` VALUES ('cons_scal', '污水处理厂建设规模');
INSERT INTO `sys_dict` VALUES ('FDSTYLE', '关键字类型');
INSERT INTO `sys_dict` VALUES ('FDTYPE', '字段数据类型');
INSERT INTO `sys_dict` VALUES ('language', '语言');
INSERT INTO `sys_dict` VALUES ('LKTP', '链接类型');
INSERT INTO `sys_dict` VALUES ('LogPrio', '日志级别');
INSERT INTO `sys_dict` VALUES ('showAuthIsAssign', '权限是否已分配给某资源');
INSERT INTO `sys_dict` VALUES ('TREATTYPE', '污水处理方式');
INSERT INTO `sys_dict` VALUES ('wio_type', '排水性质');
INSERT INTO `sys_dict` VALUES ('YesOrNo', '是否');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `ID` decimal(10,0) NOT NULL,
  `PRIO` varchar(15) DEFAULT NULL,
  `CAT` varchar(255) DEFAULT NULL,
  `THREAD` varchar(200) DEFAULT NULL,
  `MSG` varchar(255) DEFAULT NULL,
  `USERID` varchar(32) DEFAULT NULL,
  `THE_DATETIME` date DEFAULT NULL,
  `THROWABLE` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `ID` char(32) NOT NULL,
  `NAME` varchar(50) DEFAULT NULL,
  `TLINK` varchar(200) DEFAULT NULL,
  `IMAGE` varchar(200) DEFAULT NULL,
  `SEQUENCE` decimal(11,0) DEFAULT NULL,
  `AUTHKEY` varchar(30) DEFAULT NULL,
  `PID` char(32) DEFAULT NULL,
  `OUTERAPPID` varchar(20) DEFAULT NULL,
  `LKTP` decimal(6,0) DEFAULT NULL,
  `VISB` char(1) DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('0ad0ac3ae6fc4941b0ba415bb44fa988', '身份证管理', '', 'pageframe/images/home/icon/6.png', '2', '', '', '', '1', '1');
INSERT INTO `sys_menu` VALUES ('1006                           1', '组织类型设置', 'QLListView_ql.Au_org_type.List.qact', null, '3', '1006                          ', '48                             1', null, null, '1');
INSERT INTO `sys_menu` VALUES ('1106                           1', '个人通知', 'sys_noticeListView-1.qact', null, null, '1106                          ', '35                             1', null, null, '0');
INSERT INTO `sys_menu` VALUES ('184e7c40def443ffaf3b0ce4fe6d3e58', '排放标准管理', '', '', '3', '', '7d7b2348f1cd49f3aab5d141555b4ba9', '', '1', '1');
INSERT INTO `sys_menu` VALUES ('2                              1', '权限管理', null, '/pageframe/images/moduleIcon/qx.png', '1', '2                             ', '6ba86480cc2b49e9bcb86b44e1b2a16a', null, '1', '1');
INSERT INTO `sys_menu` VALUES ('20b69cf0fa05407eb42a9111951db113', '统计分析', '', 'pageframe/images/home/icon/5.png', '3', '', '', '', '1', '1');
INSERT INTO `sys_menu` VALUES ('2cd2c119d6d14c88ba2c25c081d30169', '系统访问权限管理', 'sysAccessCtrl.qact', null, '5', '2cd2c119d6d14c88ba2c25c081d301', '2                              1', null, '1', '1');
INSERT INTO `sys_menu` VALUES ('3                              1', '用户管理', 'QLListView_ql.Au_UserInfo.List.qact', null, '1', '3                             ', '2                              1', null, null, '1');
INSERT INTO `sys_menu` VALUES ('35                             1', '个人设置', null, null, '5', '35                            ', '6ba86480cc2b49e9bcb86b44e1b2a16a', null, null, '1');
INSERT INTO `sys_menu` VALUES ('36                             1', '个人资料设置', 'UpdateCurrentUserInfoView.qact', null, '1', '36                            ', '35                             1', null, null, '1');
INSERT INTO `sys_menu` VALUES ('37                             1', '系统日志', 'QLListView_Sys_log.List.qact', null, '6', '37                            ', '6ba86480cc2b49e9bcb86b44e1b2a16a', null, null, '1');
INSERT INTO `sys_menu` VALUES ('39                             1', '字典管理', null, null, '7', null, '6ba86480cc2b49e9bcb86b44e1b2a16a', null, null, '1');
INSERT INTO `sys_menu` VALUES ('4                              1', '角色管理', 'QLListView_ql.Au_Roles.List.qact', null, '2', '4                             ', '2                              1', null, null, '1');
INSERT INTO `sys_menu` VALUES ('40                             1', '表字典', 'QLListView_TABLIST.List.qact', null, '1', null, '39                             1', null, null, '1');
INSERT INTO `sys_menu` VALUES ('4024bb545c204eb58d486c6288103693', '污水处理场管理', '/QLListView_Wr_stp_b.List.qact', '', '2', '', '9df12c8efaa24b6b853197865426b71f', '', '1', '1');
INSERT INTO `sys_menu` VALUES ('41                             1', '字段字典', 'QLListView_FLDLIST.List.qact', null, '2', null, '39                             1', null, null, '1');
INSERT INTO `sys_menu` VALUES ('42                             1', '数据字典', 'sys_dictListView-1.qact', null, '0', null, '39                             1', null, null, '1');
INSERT INTO `sys_menu` VALUES ('42a6fcfdc5e14b94a3f5d6ea77cf40f6', '预警数据管理', '', '', '4', '', '7d7b2348f1cd49f3aab5d141555b4ba9', '', '1', '1');
INSERT INTO `sys_menu` VALUES ('45ce2ad9d6cd4706a41790f7e8f60c70', '治理项目查询', '', '', '3', '', '0ad0ac3ae6fc4941b0ba415bb44fa988', '', '1', '1');
INSERT INTO `sys_menu` VALUES ('46f7e9edd24c4f26935e47dbe5282975', '排水户管理', '/QLListView_Pf_rosd_wio_b.List.qact', '', '1', '', '9df12c8efaa24b6b853197865426b71f', '', '1', '1');
INSERT INTO `sys_menu` VALUES ('48                             1', '组织管理', 'au_organizationListView-1.qact', '/pageframe/images/moduleIcon/zzgl.png', '0', null, '6ba86480cc2b49e9bcb86b44e1b2a16a', null, '1', '1');
INSERT INTO `sys_menu` VALUES ('48a9e97223fe43df8f545657454d5286', '数据管理', 'mnAwqmdWqmdAction!toMnAwqmdList.qact', '', '2', '', '7d7b2348f1cd49f3aab5d141555b4ba9', '', '1', '1');
INSERT INTO `sys_menu` VALUES ('4c60c264a6764987a48a736159202d65', '排口管理', '/pk_openpkManager.qact', '', '2', '', '0ad0ac3ae6fc4941b0ba415bb44fa988', '', '1', '1');
INSERT INTO `sys_menu` VALUES ('5                              1', '菜单管理', null, null, '2', '5                             ', '6ba86480cc2b49e9bcb86b44e1b2a16a', null, null, '1');
INSERT INTO `sys_menu` VALUES ('501faf84472345d08c4100ff6c11b1c4', '政区排口统计', '/QLListView_Doc.List_2_4.qact', '', '1', '', '20b69cf0fa05407eb42a9111951db113', '', '1', '1');
INSERT INTO `sys_menu` VALUES ('53                             1', '组织用户分配', 'orgAssignUser.qact', null, '2', null, '48                             1', null, null, '1');
INSERT INTO `sys_menu` VALUES ('6                              1', '菜单管理', '/QLListView_Sys_Menu.menuList.qact', null, '1', '6                             ', '5                              1', null, null, '1');
INSERT INTO `sys_menu` VALUES ('66                             1', '组织机构设置', 'au_organizationListView-1.qact', null, '1', '66                            ', '48                             1', null, null, '1');
INSERT INTO `sys_menu` VALUES ('6ba86480cc2b49e9bcb86b44e1b2a16a', '系统管理', '', 'pageframe/images/home/icon/8.png', '100', '', '', '', null, '1');
INSERT INTO `sys_menu` VALUES ('7                              1', '资源管理', 'QLListView_ql.Au_resource.List.qact', null, '3', '7                             ', '2                              1', null, null, '1');
INSERT INTO `sys_menu` VALUES ('7403520f253546e68befdf133f4f0c44', '一张图', 'yztMapMarker!toView.qact', 'pageframe/images/home/icon/2.png', '1', '', '', '', '1', '1');
INSERT INTO `sys_menu` VALUES ('7d7b2348f1cd49f3aab5d141555b4ba9', '监测数据', '', 'pageframe/images/home/icon/7.png', '4', '', '', '', '1', '1');
INSERT INTO `sys_menu` VALUES ('8                              1', '权限管理', 'Au_authoritiesListView.qact', null, '4', '8                             ', '2                              1', null, null, '1');
INSERT INTO `sys_menu` VALUES ('8c0831ee7eb74486804369cc1e5033c6', '数据录入', 'mnAwqmdWqmdAction!toMnAwqmdAdd.qact', '', '1', '', '7d7b2348f1cd49f3aab5d141555b4ba9', '', '1', '1');
INSERT INTO `sys_menu` VALUES ('9df12c8efaa24b6b853197865426b71f', '基础数据', '', 'pageframe/images/home/icon/4.png', '5', '', '', '', '1', '1');
INSERT INTO `sys_menu` VALUES ('ae0f584b76c34e4e9361c52793545d7b', '排口登记', '/pk_open.qact', '', '1', '', '0ad0ac3ae6fc4941b0ba415bb44fa988', '', '1', '1');
INSERT INTO `sys_menu` VALUES ('be9d968087434cf9a0deaaaba311ecd6', '河湖排口统计', '/QLListView_Doc.List_2_5.qact', '', '2', '', '20b69cf0fa05407eb42a9111951db113', '', '1', '1');
INSERT INTO `sys_menu` VALUES ('c73acf8713c14f239cafa35b42f40f4b', '测试', '/jsp/bootstrap-table.jsp', '', '10', '', '6ba86480cc2b49e9bcb86b44e1b2a16a', '', '1', '1');
INSERT INTO `sys_menu` VALUES ('ed529941ecca4323b8e935ee273f9235', '同期对比分析', '/QLListView_Doc.List_2_6.qact', '', '3', '', '20b69cf0fa05407eb42a9111951db113', '', '1', '1');

-- ----------------------------
-- Table structure for sys_message
-- ----------------------------
DROP TABLE IF EXISTS `sys_message`;
CREATE TABLE `sys_message` (
  `ID` varchar(50) NOT NULL,
  `NAME` text,
  `LANGUAGE` varchar(10) DEFAULT NULL,
  `IMAGE` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_message
-- ----------------------------
INSERT INTO `sys_message` VALUES ('1000', '1', 'zh_CN', null);

-- ----------------------------
-- Table structure for sys_parameter
-- ----------------------------
DROP TABLE IF EXISTS `sys_parameter`;
CREATE TABLE `sys_parameter` (
  `ID` varchar(32) NOT NULL,
  `NAME` varchar(200) DEFAULT NULL,
  `NOTE` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_parameter
-- ----------------------------

-- ----------------------------
-- Table structure for sys_sequence
-- ----------------------------
DROP TABLE IF EXISTS `sys_sequence`;
CREATE TABLE `sys_sequence` (
  `ID` char(32) NOT NULL,
  `ITEM` decimal(65,30) DEFAULT NULL,
  `BUSINESS` varchar(100) DEFAULT NULL,
  `TAB` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_sequence
-- ----------------------------
INSERT INTO `sys_sequence` VALUES ('1', null, null, null);

-- ----------------------------
-- Table structure for sys_upload
-- ----------------------------
DROP TABLE IF EXISTS `sys_upload`;
CREATE TABLE `sys_upload` (
  `FILEGROUP` varchar(50) NOT NULL,
  `DOCID` decimal(65,30) NOT NULL,
  `FILETYPE` varchar(30) DEFAULT NULL,
  `FILEPATH` varchar(255) DEFAULT NULL,
  `FILENAME` varchar(100) DEFAULT NULL,
  `FILESIZE` decimal(65,30) DEFAULT NULL,
  `STATE` decimal(11,0) DEFAULT NULL,
  PRIMARY KEY (`FILEGROUP`,`DOCID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_upload
-- ----------------------------
INSERT INTO `sys_upload` VALUES ('1', '1.000000000000000000000000000000', null, null, null, null, null);

-- ----------------------------
-- Table structure for tablist
-- ----------------------------
DROP TABLE IF EXISTS `tablist`;
CREATE TABLE `tablist` (
  `TABEN` varchar(50) NOT NULL,
  `TABCD` char(6) DEFAULT NULL,
  `TABNM` varchar(60) DEFAULT NULL,
  `TABUNT` varchar(30) DEFAULT NULL,
  `USECN` char(1) DEFAULT NULL,
  `TABOWNER` varchar(20) DEFAULT NULL,
  `NT` varchar(255) DEFAULT NULL,
  `DBSOURCEID` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`TABEN`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of tablist
-- ----------------------------
INSERT INTO `tablist` VALUES ('WRR', '1002', '水资源分区', null, '1', null, null, null);
