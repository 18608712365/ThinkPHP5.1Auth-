/*
Navicat MySQL Data Transfer

Source Server         : 本地连接
Source Server Version : 80012
Source Host           : localhost:3306
Source Database       : think_auth

Target Server Type    : MYSQL
Target Server Version : 80012
File Encoding         : 65001

Date: 2019-12-26 00:23:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for think_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `think_auth_group`;
CREATE TABLE `think_auth_group` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `pid` smallint(6) NOT NULL DEFAULT '0' COMMENT '权限URL',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `rules` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '1,2,24,25,26' COMMENT '角色权限规则',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of think_auth_group
-- ----------------------------
INSERT INTO `think_auth_group` VALUES ('1', '超级管理员', '0', '1', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47', '拥有所有操作权限');
INSERT INTO `think_auth_group` VALUES ('2', '管理员', '0', '1', '1,2,21,22,23,24,25,26,27,28,29,30,31,40,41,42,43,44,45,46,47', '拥有普通管理员权限');
INSERT INTO `think_auth_group` VALUES ('3', '会员', '0', '1', '1,2,21,24,25,26,40,41,42,45,46,47', '普通会员权限');
INSERT INTO `think_auth_group` VALUES ('4', '文章管理员', '0', '1', '1,2,21,24,25,26', '文章管理权限');

-- ----------------------------
-- Table structure for think_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `think_auth_group_access`;
CREATE TABLE `think_auth_group_access` (
  `user_id` tinyint(8) NOT NULL COMMENT '用户ID',
  `role_id` tinyint(8) unsigned NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`role_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色表';

-- ----------------------------
-- Records of think_auth_group_access
-- ----------------------------
INSERT INTO `think_auth_group_access` VALUES ('1', '1');
INSERT INTO `think_auth_group_access` VALUES ('2', '2');
INSERT INTO `think_auth_group_access` VALUES ('3', '3');

-- ----------------------------
-- Table structure for think_auth_menu
-- ----------------------------
DROP TABLE IF EXISTS `think_auth_menu`;
CREATE TABLE `think_auth_menu` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '菜单id',
  `name` varchar(255) NOT NULL COMMENT '菜单名称',
  `module` varchar(100) NOT NULL COMMENT '模块名称',
  `controller` varchar(100) DEFAULT NULL COMMENT '控制器名称',
  `action` varchar(100) DEFAULT NULL COMMENT '方法名称',
  `pid` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `sort` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '菜单排序',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '菜单类型0顶级菜单1子菜单',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态1启用0禁用',
  `iconfont` varchar(30) DEFAULT NULL COMMENT '图标字体',
  `icon` varchar(30) DEFAULT NULL COMMENT '图标',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='菜单表';

-- ----------------------------
-- Records of think_auth_menu
-- ----------------------------
INSERT INTO `think_auth_menu` VALUES ('1', '权限管理', 'admin', '', '', '0', '1', '0', '1', 'iconfont', '&#xe7f0;');
INSERT INTO `think_auth_menu` VALUES ('2', '角色管理', 'admin', 'AuthGroup', 'index', '1', '2', '1', '1', 'iconfont', '&#xe955;');
INSERT INTO `think_auth_menu` VALUES ('3', '权限管理', 'admin', 'AuthRule', 'index', '1', '3', '1', '1', 'iconfont', '&#xe7f1;');
INSERT INTO `think_auth_menu` VALUES ('4', '菜单管理', 'admin', 'Menu', 'index', '1', '4', '1', '1', 'iconfont', '&#xe7c3;');
INSERT INTO `think_auth_menu` VALUES ('5', '用户管理', 'admin', 'User', 'index', '1', '5', '1', '1', 'iconfont', '&#xe6b5;');
INSERT INTO `think_auth_menu` VALUES ('6', '文章管理', 'admin', 'Article', '', '0', '6', '0', '1', 'iconfont', '&#xe87e;');
INSERT INTO `think_auth_menu` VALUES ('7', '文章分类管理', 'admin', 'ArticleCate', 'index', '6', '7', '1', '1', 'iconfont', '&#xe65d;');
INSERT INTO `think_auth_menu` VALUES ('8', '文章管理', 'admin', 'Article', 'index', '6', '8', '1', '1', 'iconfont', '&#xe870;');

-- ----------------------------
-- Table structure for think_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `think_auth_rule`;
CREATE TABLE `think_auth_rule` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '权限节点英文名称',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '权限节点中文名称',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `sort` smallint(6) NOT NULL COMMENT '排序',
  `pid` smallint(6) unsigned NOT NULL COMMENT '父级ID',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `level` tinyint(1) NOT NULL COMMENT '权限节点级别',
  `condition` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '条件',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COMMENT='权限节点表';

-- ----------------------------
-- Records of think_auth_rule
-- ----------------------------
INSERT INTO `think_auth_rule` VALUES ('1', 'admin/Index/index', '后台管理', '1', '0', '0', '1', '1', null);
INSERT INTO `think_auth_rule` VALUES ('2', 'admin/Index/console', '控制台', '1', '1001', '1', '1', '2', null);
INSERT INTO `think_auth_rule` VALUES ('3', 'admin/AuthGroup', '角色管理', '1', '1002', '1', '1', '2', null);
INSERT INTO `think_auth_rule` VALUES ('4', 'admin/AuthGroup/index', '角色管理首页', '1', '1', '3', '1', '3', null);
INSERT INTO `think_auth_rule` VALUES ('5', 'admin/AuthGroup/roleList', '获取角色列表', '1', '2', '3', '1', '3', null);
INSERT INTO `think_auth_rule` VALUES ('6', 'admin/AuthGroup/add', '添加角色', '1', '3', '3', '1', '3', null);
INSERT INTO `think_auth_rule` VALUES ('7', 'admin/AuthGroup/doAdd', '添加角色操作', '1', '4', '3', '1', '3', null);
INSERT INTO `think_auth_rule` VALUES ('8', 'admin/AuthGroup/edit', '编辑角色', '1', '5', '3', '1', '3', null);
INSERT INTO `think_auth_rule` VALUES ('9', 'admin/AuthGroup/doEdit', '编辑角色操作', '1', '6', '3', '1', '3', null);
INSERT INTO `think_auth_rule` VALUES ('10', 'admin/AuthGroup/del', '删除角色', '1', '7', '3', '1', '3', null);
INSERT INTO `think_auth_rule` VALUES ('11', 'admin/AuthGroup/access', '角色授权', '1', '8', '3', '1', '3', null);
INSERT INTO `think_auth_rule` VALUES ('12', 'admin/AuthGroup/doAccess', '角色授权操作', '1', '9', '3', '1', '3', null);
INSERT INTO `think_auth_rule` VALUES ('13', 'admin/AuthRule', '权限管理', '1', '1003', '1', '1', '2', null);
INSERT INTO `think_auth_rule` VALUES ('14', 'admin/AuthRule/index', '权限管理首页', '1', '1', '13', '1', '3', null);
INSERT INTO `think_auth_rule` VALUES ('15', 'admin/AuthRule/nodeList', '获取权限列表', '1', '2', '13', '1', '3', null);
INSERT INTO `think_auth_rule` VALUES ('16', 'admin/AuthRule/add', '添加权限', '1', '3', '13', '1', '3', null);
INSERT INTO `think_auth_rule` VALUES ('17', 'admin/AuthRule/doAdd', '添加权限操作', '1', '4', '13', '1', '3', null);
INSERT INTO `think_auth_rule` VALUES ('18', 'admin/AuthRule/edit', '编辑权限', '1', '5', '13', '1', '3', null);
INSERT INTO `think_auth_rule` VALUES ('19', 'admin/AuthRule/doEdit', '编辑权限操作', '1', '6', '13', '1', '3', null);
INSERT INTO `think_auth_rule` VALUES ('20', 'admin/AuthRule/del', '删除权限', '1', '7', '13', '1', '3', null);
INSERT INTO `think_auth_rule` VALUES ('21', 'admin/User', '用户管理', '1', '1004', '1', '1', '2', null);
INSERT INTO `think_auth_rule` VALUES ('22', 'admin/User/index', '用户管理首页', '1', '1', '21', '1', '3', null);
INSERT INTO `think_auth_rule` VALUES ('23', 'admin/User/userList', '获取用户列表', '1', '2', '21', '1', '3', null);
INSERT INTO `think_auth_rule` VALUES ('24', 'admin/User/login', '用户登录', '1', '3', '21', '1', '3', null);
INSERT INTO `think_auth_rule` VALUES ('25', 'admin/User/checklogin', '登录认证', '1', '4', '21', '1', '3', null);
INSERT INTO `think_auth_rule` VALUES ('26', 'admin/User/logout', '用户退出登录', '1', '5', '21', '1', '3', null);
INSERT INTO `think_auth_rule` VALUES ('27', 'admin/User/add', '添加用户', '1', '6', '21', '1', '3', null);
INSERT INTO `think_auth_rule` VALUES ('28', 'admin/User/doAdd', '添加用户操作', '1', '7', '21', '1', '3', null);
INSERT INTO `think_auth_rule` VALUES ('29', 'admin/User/edit', '编辑用户', '1', '8', '21', '1', '3', null);
INSERT INTO `think_auth_rule` VALUES ('30', 'admin/User/doEdit', '编辑用户操作', '1', '9', '21', '1', '3', null);
INSERT INTO `think_auth_rule` VALUES ('31', 'admin/User/del', '删除用户', '1', '10', '21', '1', '3', null);
INSERT INTO `think_auth_rule` VALUES ('32', 'admin/Menu', '菜单管理', '1', '1005', '1', '1', '2', null);
INSERT INTO `think_auth_rule` VALUES ('33', 'admin/Menu/index', '菜单管理首页', '1', '1', '32', '1', '3', null);
INSERT INTO `think_auth_rule` VALUES ('34', 'admin/Menu/menuList', '获取菜单列表', '1', '2', '32', '1', '3', null);
INSERT INTO `think_auth_rule` VALUES ('35', 'admin/Menu/add', '添加菜单', '1', '3', '32', '1', '3', null);
INSERT INTO `think_auth_rule` VALUES ('36', 'admin/Menu/doAdd', '添加菜单操作', '1', '4', '32', '1', '3', null);
INSERT INTO `think_auth_rule` VALUES ('37', 'admin/Menu/edit', '编辑菜单', '1', '5', '32', '1', '3', null);
INSERT INTO `think_auth_rule` VALUES ('38', 'admin/Menu/doEdit', '编辑菜单操作', '1', '6', '32', '1', '3', null);
INSERT INTO `think_auth_rule` VALUES ('39', 'admin/Menu/del', '删除菜单', '1', '7', '32', '1', '3', null);
INSERT INTO `think_auth_rule` VALUES ('40', 'admin/Article', '文章管理', '1', '1006', '1', '1', '2', null);
INSERT INTO `think_auth_rule` VALUES ('41', 'admin/Article/index', '文章管理首页', '1', '1', '40', '1', '3', null);
INSERT INTO `think_auth_rule` VALUES ('42', 'admin/Article/articleList', '获取文章列表', '1', '2', '40', '1', '3', null);
INSERT INTO `think_auth_rule` VALUES ('43', 'admin/Article/add', '添加文章', '1', '3', '40', '1', '3', null);
INSERT INTO `think_auth_rule` VALUES ('44', 'admin/Article/doAdd', '添加文章操作', '1', '4', '40', '1', '3', null);
INSERT INTO `think_auth_rule` VALUES ('45', 'admin/Article/edit', '编辑文章', '1', '5', '40', '1', '3', null);
INSERT INTO `think_auth_rule` VALUES ('46', 'admin/Article/doEdit', '编辑文章操作', '1', '6', '40', '1', '3', null);
INSERT INTO `think_auth_rule` VALUES ('47', 'admin/Article/del', '删除文章', '1', '7', '40', '1', '3', null);

-- ----------------------------
-- Table structure for think_user
-- ----------------------------
DROP TABLE IF EXISTS `think_user`;
CREATE TABLE `think_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `password` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  `logintime` int(10) NOT NULL DEFAULT '0' COMMENT '最后登录时间戳',
  `loginip` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '最后登陆IP',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of think_user
-- ----------------------------
INSERT INTO `think_user` VALUES ('1', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '1572538277', '0', '1');
INSERT INTO `think_user` VALUES ('2', 'zhangshaoping', 'e10adc3949ba59abbe56e057f20f883e', '1572538277', '0', '1');
INSERT INTO `think_user` VALUES ('3', 'jackie', 'e10adc3949ba59abbe56e057f20f883e', '1572538277', '0', '1');
