/*
 Navicat Premium Data Transfer

 Source Server         : cool
 Source Server Type    : MySQL
 Source Server Version : 50727
 Source Host           : 47.112.101.42:3306
 Source Schema         : cool

 Target Server Type    : MySQL
 Target Server Version : 50727
 File Encoding         : 65001

 Date: 18/01/2020 16:39:52
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_conf
-- ----------------------------
DROP TABLE IF EXISTS `sys_conf`;
CREATE TABLE `sys_conf` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updateTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `cKey` varchar(255) NOT NULL,
  `cValue` varchar(255) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `IDX_cd5b2672d971f8619e63009d12` (`cKey`) USING BTREE,
  KEY `IDX_3fe26fdbdf2049a6ccafeacca2` (`createTime`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_conf
-- ----------------------------
BEGIN;
INSERT INTO `sys_conf` VALUES (1, '2019-11-17 19:35:50.905349', '2019-11-17 19:35:50.905349', 'logKeep', '30');
COMMIT;

-- ----------------------------
-- Table structure for sys_department
-- ----------------------------
DROP TABLE IF EXISTS `sys_department`;
CREATE TABLE `sys_department` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updateTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `name` varchar(255) NOT NULL,
  `parentId` bigint(20) DEFAULT NULL,
  `orderNum` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `IDX_a52c93a4c1e40e5d616b9c4a53` (`createTime`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_department
-- ----------------------------
BEGIN;
INSERT INTO `sys_department` VALUES (1, '2019-11-18 14:56:19.747535', '2019-11-19 00:00:54.000000', 'COOL-ADMIN', NULL, 0);
INSERT INTO `sys_department` VALUES (10, '2019-11-18 17:07:06.666624', '2019-11-18 17:56:16.000000', '123123', 10, 1);
INSERT INTO `sys_department` VALUES (11, '2019-11-18 17:07:10.400246', '2019-11-18 17:56:17.000000', '3333', 11, 3);
INSERT INTO `sys_department` VALUES (12, '2019-11-18 17:20:28.008716', '2019-11-18 17:56:16.000000', '123123123', 12, 2);
INSERT INTO `sys_department` VALUES (13, '2019-11-18 17:58:57.509676', '2019-11-19 00:40:44.000000', '部门1', 1, 1);
INSERT INTO `sys_department` VALUES (14, '2019-11-18 17:59:04.259483', '2019-11-19 00:40:55.000000', '小组1', 13, 2);
INSERT INTO `sys_department` VALUES (15, '2019-11-18 17:59:07.348778', '2019-11-19 00:40:49.000000', '部门2', 1, 3);
INSERT INTO `sys_department` VALUES (16, '2019-11-18 17:59:12.552068', '2019-11-19 00:41:01.000000', '小组2', 15, 4);
INSERT INTO `sys_department` VALUES (17, '2019-11-19 00:41:19.008306', '2019-11-19 00:41:19.008306', '小组1', 15, 0);
COMMIT;

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updateTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `userId` bigint(20) DEFAULT NULL,
  `params` text,
  `action` varchar(100) NOT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `ipAddr` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `IDX_7217d5c9de1b05ce4ad42ecbee` (`createTime`) USING BTREE,
  KEY `IDX_ff05f06b91d250e91bb4232163` (`userId`) USING BTREE,
  KEY `IDX_7348bae9165c893fc91281b826` (`action`) USING BTREE,
  KEY `IDX_b90847f09ea57036ce3ff8608a` (`ip`) USING BTREE,
  KEY `IDX_5a45ffff94248c8d1b4fa6a482` (`ipAddr`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=221 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
BEGIN;
INSERT INTO `sys_log` VALUES (1, '2019-12-10 13:35:41.620637', '2019-12-10 13:35:41.620637', 1, NULL, '/admin/sys/log/clear', '117.30.38.239', '中国福建厦门');
INSERT INTO `sys_log` VALUES (2, '2019-12-10 13:35:41.686455', '2019-12-10 13:35:41.686455', 1, '{\"page\":\"1\",\"size\":\"20\",\"sort\":\"desc\",\"order\":\"createTime\"}', '/admin/sys/log/page', '117.30.38.239', '中国福建厦门');
INSERT INTO `sys_log` VALUES (3, '2019-12-10 13:35:42.072608', '2019-12-10 13:35:42.072608', 1, NULL, '/admin/sys/info/record', '117.30.38.239', '中国福建厦门');
INSERT INTO `sys_log` VALUES (4, '2019-12-10 13:35:43.185333', '2019-12-10 13:35:43.185333', 1, NULL, '/admin/sys/info/record', '127.0.0.1, 117.30.38.239', '本机地址,中国福建厦门');
INSERT INTO `sys_log` VALUES (5, '2019-12-10 13:35:43.569458', '2019-12-10 13:35:43.569458', 1, '{\"type\":\"1\",\"status\":\"1\",\"size\":\"10\",\"page\":\"1\",\"total\":\"0\"}', '/admin/sys/task/page', '117.28.206.0', '中国福建福州');
INSERT INTO `sys_log` VALUES (6, '2019-12-10 13:35:44.472608', '2019-12-10 13:35:44.472608', 1, '{\"type\":\"1\",\"status\":\"1\",\"size\":\"10\",\"page\":\"1\",\"total\":\"0\"}', '/admin/sys/task/page', '117.28.206.0', '中国福建福州');
INSERT INTO `sys_log` VALUES (7, '2019-12-10 13:35:45.072805', '2019-12-10 13:35:45.072805', 1, NULL, '/admin/sys/info/record', '117.30.38.239', '中国福建厦门');
INSERT INTO `sys_log` VALUES (8, '2019-12-10 13:35:46.492977', '2019-12-10 13:35:46.492977', 1, NULL, '/admin/sys/info/record', '127.0.0.1, 117.30.38.239', '本机地址,中国福建厦门');
INSERT INTO `sys_log` VALUES (9, '2019-12-10 13:35:48.092637', '2019-12-10 13:35:48.092637', 1, NULL, '/admin/sys/info/record', '117.30.38.239', '中国福建厦门');
INSERT INTO `sys_log` VALUES (10, '2019-12-10 13:35:49.185645', '2019-12-10 13:35:49.185645', 1, NULL, '/admin/sys/info/record', '127.0.0.1, 117.30.38.239', '本机地址,中国福建厦门');
INSERT INTO `sys_log` VALUES (11, '2019-12-10 13:35:50.235567', '2019-12-10 13:35:50.235567', 1, '{\"status\":\"0\",\"size\":\"10\",\"page\":\"1\",\"total\":\"0\"}', '/admin/sys/task/page', '117.28.206.0', '中国福建福州');
INSERT INTO `sys_log` VALUES (12, '2019-12-10 13:35:51.108191', '2019-12-10 13:35:51.108191', 1, NULL, '/admin/sys/info/record', '117.30.38.239', '中国福建厦门');
INSERT INTO `sys_log` VALUES (13, '2019-12-10 13:35:52.461980', '2019-12-10 13:35:52.461980', 1, NULL, '/admin/sys/info/record', '127.0.0.1, 117.30.38.239', '本机地址,中国福建厦门');
INSERT INTO `sys_log` VALUES (14, '2019-12-10 13:35:54.082037', '2019-12-10 13:35:54.082037', 1, NULL, '/admin/sys/info/record', '117.30.38.239', '中国福建厦门');
INSERT INTO `sys_log` VALUES (15, '2019-12-10 13:35:54.945012', '2019-12-10 13:35:54.945012', 1, NULL, '/admin/sys/log/get-keep', '117.28.206.0', '中国福建福州');
INSERT INTO `sys_log` VALUES (16, '2019-12-10 13:35:54.947198', '2019-12-10 13:35:54.947198', 1, '{\"page\":\"1\",\"size\":\"20\",\"sort\":\"desc\",\"order\":\"createTime\"}', '/admin/sys/log/page', '117.28.206.0', '中国福建福州');
INSERT INTO `sys_log` VALUES (17, '2019-12-10 13:35:55.196322', '2019-12-10 13:35:55.196322', 1, NULL, '/admin/sys/info/record', '127.0.0.1, 117.30.38.239', '本机地址,中国福建厦门');
INSERT INTO `sys_log` VALUES (18, '2019-12-10 13:35:57.074422', '2019-12-10 13:35:57.074422', 1, NULL, '/admin/sys/info/record', '117.30.38.239', '中国福建厦门');
INSERT INTO `sys_log` VALUES (19, '2020-01-18 12:51:59.930088', '2020-01-18 12:51:59.930088', NULL, NULL, '/console/login/LoginForm.jsp', '111.59.171.8', '中国广西桂林');
INSERT INTO `sys_log` VALUES (20, '2020-01-18 14:57:19.514956', '2020-01-18 14:57:19.514956', 1, NULL, '/admin/comm/permmenu', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (21, '2020-01-18 14:57:19.525102', '2020-01-18 14:57:19.525102', 1, NULL, '/admin/comm/person', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (22, '2020-01-18 14:57:23.085406', '2020-01-18 14:57:23.085406', NULL, NULL, '/admin/comm/logout', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (23, '2020-01-18 14:57:23.147152', '2020-01-18 14:57:23.147152', NULL, '{\"height\":\"36\",\"width\":\"110\"}', '/admin/comm/captcha', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (24, '2020-01-18 14:57:27.686274', '2020-01-18 14:57:27.686274', NULL, '{\"username\":\"admin\",\"password\":\"123456\",\"captchaId\":\"c726d890-39bf-11ea-bbb8-110736248ef0\",\"verifyCode\":\"iq6w\"}', '/admin/comm/login', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (25, '2020-01-18 14:57:27.709477', '2020-01-18 14:57:27.709477', NULL, '{\"height\":\"36\",\"width\":\"110\"}', '/admin/comm/captcha', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (26, '2020-01-18 14:57:32.128330', '2020-01-18 14:57:32.128330', NULL, '{\"username\":\"admin\",\"password\":\"123456\",\"captchaId\":\"c9dea590-39bf-11ea-bbb8-110736248ef0\",\"verifyCode\":\"6xvi\"}', '/admin/comm/login', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (27, '2020-01-18 14:57:32.149842', '2020-01-18 14:57:32.149842', NULL, '{\"height\":\"36\",\"width\":\"110\"}', '/admin/comm/captcha', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (28, '2020-01-18 14:57:34.783068', '2020-01-18 14:57:34.783068', NULL, '{\"height\":\"36\",\"width\":\"110\"}', '/admin/comm/captcha', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (29, '2020-01-18 14:57:37.834404', '2020-01-18 14:57:37.834404', NULL, '{\"username\":\"admin\",\"password\":\"123456\",\"captchaId\":\"ce154a60-39bf-11ea-bbb8-110736248ef0\",\"verifyCode\":\"jduv\"}', '/admin/comm/login', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (30, '2020-01-18 14:57:38.004570', '2020-01-18 14:57:38.004570', 1, NULL, '/admin/comm/person', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (31, '2020-01-18 14:57:38.120611', '2020-01-18 14:57:38.120611', 1, NULL, '/admin/comm/permmenu', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (32, '2020-01-18 14:57:39.719139', '2020-01-18 14:57:39.719139', 1, NULL, '/admin/sys/department/list', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (33, '2020-01-18 14:57:39.722801', '2020-01-18 14:57:39.722801', 1, '{\"page\":\"1\",\"size\":\"20\",\"sort\":\"desc\",\"order\":\"createTime\"}', '/admin/sys/user/page', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (34, '2020-01-18 14:57:42.354626', '2020-01-18 14:57:42.354626', 1, '{\"page\":\"1\",\"size\":\"20\",\"sort\":\"desc\",\"order\":\"createTime\"}', '/admin/sys/role/page', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (35, '2020-01-18 14:57:44.280641', '2020-01-18 14:57:44.280641', 1, NULL, '/admin/sys/menu/list', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (36, '2020-01-18 14:57:44.301990', '2020-01-18 14:57:44.301990', 1, NULL, '/admin/sys/department/list', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (37, '2020-01-18 14:57:53.113921', '2020-01-18 14:57:53.113921', 1, NULL, '/admin/sys/menu/list', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (38, '2020-01-18 14:57:53.124192', '2020-01-18 14:57:53.124192', 1, NULL, '/admin/sys/department/list', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (39, '2020-01-18 14:57:53.161999', '2020-01-18 14:57:53.161999', 1, '{\"id\":\"27\"}', '/admin/sys/role/info', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (40, '2020-01-18 14:57:57.165533', '2020-01-18 14:57:57.165533', 1, '{\"name\":\"testRole\",\"label\":\"testRole\",\"remark\":null,\"menuIdList\":[\"27\",\"17\",\"59\",\"60\",\"61\",\"62\",\"63\",\"65\",\"18\",\"19\",\"20\",\"21\",\"8\",\"10\",\"11\",\"12\",\"13\",\"22\",\"23\",\"24\",\"25\",\"26\",\"29\",\"30\",\"2\",\"28\"],\"departmentIdList\":[\"15\",\"17\",\"16\",\"1\"],\"id\":\"27\",\"createTime\":\"2019-11-07 02:35:13\",\"updateTime\":\"2019-11-10 08:57:09\",\"userId\":\"\"}', '/admin/sys/role/update', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (41, '2020-01-18 14:58:01.112343', '2020-01-18 14:58:01.112343', 1, '{\"page\":\"1\",\"size\":\"20\",\"sort\":\"desc\",\"order\":\"createTime\"}', '/admin/sys/role/page', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (42, '2020-01-18 15:21:25.719284', '2020-01-18 15:21:25.719284', 1, '{\"page\":\"1\",\"size\":\"20\",\"departmentIds\":\"1,13,14,15,17,16\",\"sort\":\"desc\",\"order\":\"createTime\"}', '/admin/sys/user/page', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (43, '2020-01-18 15:21:26.409334', '2020-01-18 15:21:26.409334', 1, NULL, '/admin/sys/role/list', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (44, '2020-01-18 15:21:34.942420', '2020-01-18 15:21:34.942420', 1, NULL, '/admin/sys/role/list', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (45, '2020-01-18 15:21:34.960719', '2020-01-18 15:21:34.960719', 1, '{\"id\":\"16\"}', '/admin/sys/user/info', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (46, '2020-01-18 15:21:54.784172', '2020-01-18 15:21:54.784172', 1, '{\"headImg\":null,\"name\":\"测试\",\"nickName\":\"测试\",\"username\":\"test\",\"password\":\"4297f44b13955235245b2497399d7a93\",\"roleIdList\":[\"1\",\"27\",\"28\"],\"phone\":null,\"email\":null,\"remark\":null,\"status\":1,\"id\":\"16\",\"createTime\":\"2019-11-11 10:37:43\",\"updateTime\":\"2019-11-11 11:17:25\",\"departmentId\":\"1\",\"passwordV\":1,\"departmentName\":\"小组1\"}', '/admin/sys/user/update', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (47, '2020-01-18 15:21:55.484251', '2020-01-18 15:21:55.484251', 1, '{\"page\":\"1\",\"size\":\"20\",\"departmentIds\":\"1,13,14,15,17,16\",\"sort\":\"desc\",\"order\":\"createTime\"}', '/admin/sys/user/page', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (48, '2020-01-18 15:21:58.987255', '2020-01-18 15:21:58.987255', 1, '{\"id\":\"16\"}', '/admin/sys/user/info', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (49, '2020-01-18 15:21:58.992037', '2020-01-18 15:21:58.992037', 1, NULL, '/admin/sys/role/list', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (50, '2020-01-18 15:22:05.010966', '2020-01-18 15:22:05.010966', 1, '{\"headImg\":null,\"name\":\"测试\",\"nickName\":\"测试\",\"username\":\"test\",\"roleIdList\":[\"28\"],\"phone\":null,\"email\":null,\"remark\":null,\"status\":1,\"id\":\"16\",\"createTime\":\"2019-11-11 10:37:43\",\"updateTime\":\"2020-01-18 15:21:54\",\"departmentId\":\"1\",\"passwordV\":1,\"departmentName\":\"COOL-ADMIN\"}', '/admin/sys/user/update', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (51, '2020-01-18 15:22:05.340520', '2020-01-18 15:22:05.340520', 1, '{\"page\":\"1\",\"size\":\"20\",\"departmentIds\":\"1,13,14,15,17,16\",\"sort\":\"desc\",\"order\":\"createTime\"}', '/admin/sys/user/page', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (52, '2020-01-18 15:22:08.433986', '2020-01-18 15:22:08.433986', NULL, NULL, '/admin/comm/logout', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (53, '2020-01-18 15:22:08.947327', '2020-01-18 15:22:08.947327', NULL, '{\"height\":\"36\",\"width\":\"110\"}', '/admin/comm/captcha', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (54, '2020-01-18 15:22:21.011369', '2020-01-18 15:22:21.011369', NULL, '{\"username\":\"test\",\"password\":\"123123\",\"captchaId\":\"3cbfcc30-39c3-11ea-bbb8-110736248ef0\",\"verifyCode\":\"crtw\"}', '/admin/comm/login', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (55, '2020-01-18 15:22:21.213872', '2020-01-18 15:22:21.213872', 16, NULL, '/admin/comm/person', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (56, '2020-01-18 15:22:21.322713', '2020-01-18 15:22:21.322713', 16, NULL, '/admin/comm/permmenu', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (57, '2020-01-18 15:37:02.009061', '2020-01-18 15:37:02.009061', 16, NULL, '/admin/sys/department/list', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (58, '2020-01-18 15:37:02.016267', '2020-01-18 15:37:02.016267', 16, '{\"page\":\"1\",\"size\":\"20\",\"sort\":\"desc\",\"order\":\"createTime\"}', '/admin/sys/user/page', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (59, '2020-01-18 15:37:03.820378', '2020-01-18 15:37:03.820378', 16, '{\"page\":\"1\",\"size\":\"20\",\"sort\":\"desc\",\"order\":\"createTime\"}', '/admin/sys/role/page', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (60, '2020-01-18 15:37:05.012112', '2020-01-18 15:37:05.012112', 16, NULL, '/admin/sys/menu/list', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (61, '2020-01-18 15:37:07.873213', '2020-01-18 15:37:07.873213', 16, '{\"id\":\"18\"}', '/admin/sys/user/info', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (62, '2020-01-18 15:37:07.897519', '2020-01-18 15:37:07.897519', 16, NULL, '/admin/sys/role/list', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (63, '2020-01-18 15:37:21.822840', '2020-01-18 15:37:21.822840', 16, NULL, '/admin/sys/menu/list', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (64, '2020-01-18 15:37:21.829953', '2020-01-18 15:37:21.829953', 16, NULL, '/admin/sys/department/list', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (65, '2020-01-18 15:48:26.673838', '2020-01-18 15:48:26.673838', 16, NULL, '/admin/comm/permmenu', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (66, '2020-01-18 15:48:26.692192', '2020-01-18 15:48:26.692192', 16, NULL, '/admin/comm/person', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (67, '2020-01-18 15:48:29.264707', '2020-01-18 15:48:29.264707', 16, NULL, '/admin/sys/department/list', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (68, '2020-01-18 15:48:29.279407', '2020-01-18 15:48:29.279407', 16, '{\"page\":\"1\",\"size\":\"20\",\"sort\":\"desc\",\"order\":\"createTime\"}', '/admin/sys/user/page', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (69, '2020-01-18 15:48:31.572951', '2020-01-18 15:48:31.572951', 16, '{\"page\":\"1\",\"size\":\"20\",\"sort\":\"desc\",\"order\":\"createTime\"}', '/admin/sys/role/page', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (70, '2020-01-18 15:48:40.013967', '2020-01-18 15:48:40.013967', 16, NULL, '/admin/sys/menu/list', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (71, '2020-01-18 15:48:40.033534', '2020-01-18 15:48:40.033534', 16, NULL, '/admin/sys/department/list', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (72, '2020-01-18 15:49:40.329712', '2020-01-18 15:49:40.329712', 16, '{\"page\":\"1\",\"size\":\"20\",\"sort\":\"desc\",\"order\":\"createTime\"}', '/admin/sys/role/page', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (73, '2020-01-18 15:50:21.243879', '2020-01-18 15:50:21.243879', 16, '{\"page\":\"1\",\"size\":\"20\",\"sort\":\"desc\",\"order\":\"createTime\"}', '/admin/sys/user/page', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (74, '2020-01-18 15:51:21.221256', '2020-01-18 15:51:21.221256', 16, '{\"page\":\"1\",\"size\":\"20\",\"sort\":\"desc\",\"order\":\"createTime\"}', '/admin/sys/role/page', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (75, '2020-01-18 15:52:05.816895', '2020-01-18 15:52:05.816895', 16, '{\"page\":\"1\",\"size\":\"20\",\"sort\":\"desc\",\"order\":\"createTime\"}', '/admin/sys/role/page', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (76, '2020-01-18 15:52:05.874713', '2020-01-18 15:52:05.874713', 16, '{\"page\":\"1\",\"size\":\"20\",\"sort\":\"desc\",\"order\":\"createTime\"}', '/admin/sys/role/page', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (77, '2020-01-18 15:52:06.241915', '2020-01-18 15:52:06.241915', 16, '{\"page\":\"1\",\"size\":\"20\",\"sort\":\"desc\",\"order\":\"createTime\"}', '/admin/sys/role/page', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (78, '2020-01-18 15:52:06.414298', '2020-01-18 15:52:06.414298', 16, '{\"page\":\"1\",\"size\":\"20\",\"sort\":\"desc\",\"order\":\"createTime\"}', '/admin/sys/role/page', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (79, '2020-01-18 15:52:06.586859', '2020-01-18 15:52:06.586859', 16, '{\"page\":\"1\",\"size\":\"20\",\"sort\":\"desc\",\"order\":\"createTime\"}', '/admin/sys/role/page', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (80, '2020-01-18 15:52:06.775354', '2020-01-18 15:52:06.775354', 16, '{\"page\":\"1\",\"size\":\"20\",\"sort\":\"desc\",\"order\":\"createTime\"}', '/admin/sys/role/page', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (81, '2020-01-18 15:52:06.956856', '2020-01-18 15:52:06.956856', 16, '{\"page\":\"1\",\"size\":\"20\",\"sort\":\"desc\",\"order\":\"createTime\"}', '/admin/sys/role/page', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (82, '2020-01-18 15:52:07.105806', '2020-01-18 15:52:07.105806', 16, '{\"page\":\"1\",\"size\":\"20\",\"sort\":\"desc\",\"order\":\"createTime\"}', '/admin/sys/role/page', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (83, '2020-01-18 15:52:07.278277', '2020-01-18 15:52:07.278277', 16, '{\"page\":\"1\",\"size\":\"20\",\"sort\":\"desc\",\"order\":\"createTime\"}', '/admin/sys/role/page', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (84, '2020-01-18 16:00:53.602270', '2020-01-18 16:00:53.602270', 16, '{\"page\":\"1\",\"size\":\"20\",\"sort\":\"desc\",\"order\":\"createTime\"}', '/admin/sys/role/page', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (85, '2020-01-18 16:00:55.843712', '2020-01-18 16:00:55.843712', 16, '{\"page\":\"1\",\"size\":\"20\",\"sort\":\"desc\",\"order\":\"createTime\"}', '/admin/sys/role/page', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (86, '2020-01-18 16:00:56.014510', '2020-01-18 16:00:56.014510', 16, '{\"page\":\"1\",\"size\":\"20\",\"sort\":\"desc\",\"order\":\"createTime\"}', '/admin/sys/role/page', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (87, '2020-01-18 16:00:56.175109', '2020-01-18 16:00:56.175109', 16, '{\"page\":\"1\",\"size\":\"20\",\"sort\":\"desc\",\"order\":\"createTime\"}', '/admin/sys/role/page', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (88, '2020-01-18 16:00:56.339754', '2020-01-18 16:00:56.339754', 16, '{\"page\":\"1\",\"size\":\"20\",\"sort\":\"desc\",\"order\":\"createTime\"}', '/admin/sys/role/page', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (89, '2020-01-18 16:07:53.099554', '2020-01-18 16:07:53.099554', 16, '{\"page\":\"1\",\"size\":\"20\",\"sort\":\"desc\",\"order\":\"createTime\"}', '/admin/sys/role/page', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (90, '2020-01-18 16:07:53.268127', '2020-01-18 16:07:53.268127', 16, '{\"page\":\"1\",\"size\":\"20\",\"sort\":\"desc\",\"order\":\"createTime\"}', '/admin/sys/role/page', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (91, '2020-01-18 16:07:53.441935', '2020-01-18 16:07:53.441935', 16, '{\"page\":\"1\",\"size\":\"20\",\"sort\":\"desc\",\"order\":\"createTime\"}', '/admin/sys/role/page', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (92, '2020-01-18 16:08:11.320766', '2020-01-18 16:08:11.320766', 16, '{\"page\":\"1\",\"size\":\"20\",\"sort\":\"desc\",\"order\":\"createTime\"}', '/admin/sys/role/page', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (93, '2020-01-18 16:08:11.483358', '2020-01-18 16:08:11.483358', 16, '{\"page\":\"1\",\"size\":\"20\",\"sort\":\"desc\",\"order\":\"createTime\"}', '/admin/sys/role/page', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (94, '2020-01-18 16:08:11.705368', '2020-01-18 16:08:11.705368', 16, '{\"page\":\"1\",\"size\":\"20\",\"sort\":\"desc\",\"order\":\"createTime\"}', '/admin/sys/role/page', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (95, '2020-01-18 16:08:30.437172', '2020-01-18 16:08:30.437172', 16, '{\"page\":\"1\",\"size\":\"20\",\"sort\":\"desc\",\"order\":\"createTime\"}', '/admin/sys/role/page', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (96, '2020-01-18 16:08:30.591794', '2020-01-18 16:08:30.591794', 16, '{\"page\":\"1\",\"size\":\"20\",\"sort\":\"desc\",\"order\":\"createTime\"}', '/admin/sys/role/page', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (97, '2020-01-18 16:08:30.807307', '2020-01-18 16:08:30.807307', 16, '{\"page\":\"1\",\"size\":\"20\",\"sort\":\"desc\",\"order\":\"createTime\"}', '/admin/sys/role/page', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (98, '2020-01-18 16:08:30.962343', '2020-01-18 16:08:30.962343', 16, '{\"page\":\"1\",\"size\":\"20\",\"sort\":\"desc\",\"order\":\"createTime\"}', '/admin/sys/role/page', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (99, '2020-01-18 16:08:31.140734', '2020-01-18 16:08:31.140734', 16, '{\"page\":\"1\",\"size\":\"20\",\"sort\":\"desc\",\"order\":\"createTime\"}', '/admin/sys/role/page', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (100, '2020-01-18 16:08:31.278770', '2020-01-18 16:08:31.278770', 16, '{\"page\":\"1\",\"size\":\"20\",\"sort\":\"desc\",\"order\":\"createTime\"}', '/admin/sys/role/page', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (101, '2020-01-18 16:09:19.829362', '2020-01-18 16:09:19.829362', 16, '{\"page\":\"1\",\"size\":\"20\",\"sort\":\"desc\",\"order\":\"createTime\"}', '/admin/sys/role/page', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (102, '2020-01-18 16:09:20.004551', '2020-01-18 16:09:20.004551', 16, '{\"page\":\"1\",\"size\":\"20\",\"sort\":\"desc\",\"order\":\"createTime\"}', '/admin/sys/role/page', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (103, '2020-01-18 16:09:20.223377', '2020-01-18 16:09:20.223377', 16, '{\"page\":\"1\",\"size\":\"20\",\"sort\":\"desc\",\"order\":\"createTime\"}', '/admin/sys/role/page', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (104, '2020-01-18 16:09:46.386780', '2020-01-18 16:09:46.386780', 16, '{\"page\":\"1\",\"size\":\"20\",\"sort\":\"desc\",\"order\":\"createTime\"}', '/admin/sys/role/page', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (105, '2020-01-18 16:09:47.910565', '2020-01-18 16:09:47.910565', 16, '{\"page\":\"1\",\"size\":\"20\",\"sort\":\"desc\",\"order\":\"createTime\"}', '/admin/sys/role/page', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (106, '2020-01-18 16:09:49.039643', '2020-01-18 16:09:49.039643', 16, '{\"page\":\"1\",\"size\":\"20\",\"sort\":\"desc\",\"order\":\"createTime\"}', '/admin/sys/role/page', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (107, '2020-01-18 16:09:49.847332', '2020-01-18 16:09:49.847332', 16, '{\"page\":\"1\",\"size\":\"20\",\"sort\":\"desc\",\"order\":\"createTime\"}', '/admin/sys/role/page', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (108, '2020-01-18 16:09:50.381479', '2020-01-18 16:09:50.381479', 16, '{\"page\":\"1\",\"size\":\"20\",\"sort\":\"desc\",\"order\":\"createTime\"}', '/admin/sys/role/page', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (109, '2020-01-18 16:09:50.610444', '2020-01-18 16:09:50.610444', 16, '{\"page\":\"1\",\"size\":\"20\",\"sort\":\"desc\",\"order\":\"createTime\"}', '/admin/sys/role/page', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (110, '2020-01-18 16:09:50.836371', '2020-01-18 16:09:50.836371', 16, '{\"page\":\"1\",\"size\":\"20\",\"sort\":\"desc\",\"order\":\"createTime\"}', '/admin/sys/role/page', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (111, '2020-01-18 16:09:51.048734', '2020-01-18 16:09:51.048734', 16, '{\"page\":\"1\",\"size\":\"20\",\"sort\":\"desc\",\"order\":\"createTime\"}', '/admin/sys/role/page', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (112, '2020-01-18 16:09:51.237086', '2020-01-18 16:09:51.237086', 16, '{\"page\":\"1\",\"size\":\"20\",\"sort\":\"desc\",\"order\":\"createTime\"}', '/admin/sys/role/page', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (113, '2020-01-18 16:09:51.407896', '2020-01-18 16:09:51.407896', 16, '{\"page\":\"1\",\"size\":\"20\",\"sort\":\"desc\",\"order\":\"createTime\"}', '/admin/sys/role/page', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (114, '2020-01-18 16:09:51.796334', '2020-01-18 16:09:51.796334', 16, '{\"page\":\"1\",\"size\":\"20\",\"sort\":\"desc\",\"order\":\"createTime\"}', '/admin/sys/role/page', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (115, '2020-01-18 16:09:51.985220', '2020-01-18 16:09:51.985220', 16, '{\"page\":\"1\",\"size\":\"20\",\"sort\":\"desc\",\"order\":\"createTime\"}', '/admin/sys/role/page', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (116, '2020-01-18 16:09:52.162293', '2020-01-18 16:09:52.162293', 16, '{\"page\":\"1\",\"size\":\"20\",\"sort\":\"desc\",\"order\":\"createTime\"}', '/admin/sys/role/page', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (117, '2020-01-18 16:09:52.383337', '2020-01-18 16:09:52.383337', 16, '{\"page\":\"1\",\"size\":\"20\",\"sort\":\"desc\",\"order\":\"createTime\"}', '/admin/sys/role/page', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (118, '2020-01-18 16:09:52.563974', '2020-01-18 16:09:52.563974', 16, '{\"page\":\"1\",\"size\":\"20\",\"sort\":\"desc\",\"order\":\"createTime\"}', '/admin/sys/role/page', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (119, '2020-01-18 16:09:53.723079', '2020-01-18 16:09:53.723079', 16, NULL, '/admin/sys/menu/list', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (120, '2020-01-18 16:09:53.743536', '2020-01-18 16:09:53.743536', 16, NULL, '/admin/sys/department/list', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (121, '2020-01-18 16:10:33.910313', '2020-01-18 16:10:33.910313', 16, '{\"page\":\"1\",\"size\":\"20\",\"sort\":\"desc\",\"order\":\"createTime\"}', '/admin/sys/role/page', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (122, '2020-01-18 16:10:34.544488', '2020-01-18 16:10:34.544488', 16, '{\"page\":\"1\",\"size\":\"20\",\"sort\":\"desc\",\"order\":\"createTime\"}', '/admin/sys/role/page', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (123, '2020-01-18 16:10:34.690354', '2020-01-18 16:10:34.690354', 16, '{\"page\":\"1\",\"size\":\"20\",\"sort\":\"desc\",\"order\":\"createTime\"}', '/admin/sys/role/page', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (124, '2020-01-18 16:10:34.882689', '2020-01-18 16:10:34.882689', 16, '{\"page\":\"1\",\"size\":\"20\",\"sort\":\"desc\",\"order\":\"createTime\"}', '/admin/sys/role/page', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (125, '2020-01-18 16:10:35.064987', '2020-01-18 16:10:35.064987', 16, '{\"page\":\"1\",\"size\":\"20\",\"sort\":\"desc\",\"order\":\"createTime\"}', '/admin/sys/role/page', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (126, '2020-01-18 16:10:35.231869', '2020-01-18 16:10:35.231869', 16, '{\"page\":\"1\",\"size\":\"20\",\"sort\":\"desc\",\"order\":\"createTime\"}', '/admin/sys/role/page', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (127, '2020-01-18 16:10:46.997810', '2020-01-18 16:10:46.997810', 16, '{\"id\":\"21\"}', '/admin/sys/user/info', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (128, '2020-01-18 16:10:47.011416', '2020-01-18 16:10:47.011416', 16, NULL, '/admin/sys/role/list', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (129, '2020-01-18 16:12:06.498432', '2020-01-18 16:12:06.498432', 16, '{\"id\":\"19\"}', '/admin/sys/user/info', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (130, '2020-01-18 16:12:06.499565', '2020-01-18 16:12:06.499565', 16, NULL, '/admin/sys/role/list', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (131, '2020-01-18 16:14:33.502404', '2020-01-18 16:14:33.502404', 16, NULL, '/admin/sys/role/list', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (132, '2020-01-18 16:14:33.510984', '2020-01-18 16:14:33.510984', 16, '{\"id\":\"19\"}', '/admin/sys/user/info', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (133, '2020-01-18 16:18:05.751101', '2020-01-18 16:18:05.751101', 16, NULL, '/admin/sys/role/list', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (134, '2020-01-18 16:18:05.757109', '2020-01-18 16:18:05.757109', 16, '{\"id\":\"16\"}', '/admin/sys/user/info', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (135, '2020-01-18 16:19:06.563469', '2020-01-18 16:19:06.563469', 16, NULL, '/admin/sys/department/list', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (136, '2020-01-18 16:19:06.579336', '2020-01-18 16:19:06.579336', 16, '{\"page\":\"1\",\"size\":\"20\",\"sort\":\"desc\",\"order\":\"createTime\"}', '/admin/sys/user/page', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (137, '2020-01-18 16:19:08.311852', '2020-01-18 16:19:08.311852', 16, NULL, '/admin/sys/role/list', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (138, '2020-01-18 16:19:08.318930', '2020-01-18 16:19:08.318930', 16, '{\"id\":\"16\"}', '/admin/sys/user/info', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (139, '2020-01-18 16:20:05.909030', '2020-01-18 16:20:05.909030', 16, NULL, '/admin/sys/department/list', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (140, '2020-01-18 16:20:05.966745', '2020-01-18 16:20:05.966745', 16, '{\"page\":\"1\",\"size\":\"20\",\"sort\":\"desc\",\"order\":\"createTime\"}', '/admin/sys/user/page', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (141, '2020-01-18 16:20:07.364967', '2020-01-18 16:20:07.364967', 16, NULL, '/admin/sys/role/list', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (142, '2020-01-18 16:20:07.377664', '2020-01-18 16:20:07.377664', 16, '{\"id\":\"16\"}', '/admin/sys/user/info', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (143, '2020-01-18 16:20:13.260086', '2020-01-18 16:20:13.260086', 16, '{\"id\":\"17\"}', '/admin/sys/user/info', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (144, '2020-01-18 16:20:13.263750', '2020-01-18 16:20:13.263750', 16, NULL, '/admin/sys/role/list', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (145, '2020-01-18 16:20:18.201195', '2020-01-18 16:20:18.201195', 16, NULL, '/admin/sys/role/list', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (146, '2020-01-18 16:20:18.223552', '2020-01-18 16:20:18.223552', 16, '{\"id\":\"17\"}', '/admin/sys/user/info', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (147, '2020-01-18 16:20:23.722418', '2020-01-18 16:20:23.722418', 16, NULL, '/admin/sys/role/list', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (148, '2020-01-18 16:20:23.734628', '2020-01-18 16:20:23.734628', 16, '{\"id\":\"16\"}', '/admin/sys/user/info', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (149, '2020-01-18 16:20:46.795317', '2020-01-18 16:20:46.795317', 16, NULL, '/admin/sys/role/list', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (150, '2020-01-18 16:20:46.796010', '2020-01-18 16:20:46.796010', 16, '{\"id\":\"16\"}', '/admin/sys/user/info', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (151, '2020-01-18 16:20:53.969167', '2020-01-18 16:20:53.969167', 16, '{\"page\":\"1\",\"size\":\"20\",\"sort\":\"desc\",\"order\":\"createTime\"}', '/admin/sys/role/page', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (152, '2020-01-18 16:20:55.653667', '2020-01-18 16:20:55.653667', 16, NULL, '/admin/sys/menu/list', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (153, '2020-01-18 16:20:55.665201', '2020-01-18 16:20:55.665201', 16, NULL, '/admin/sys/department/list', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (154, '2020-01-18 16:21:20.717591', '2020-01-18 16:21:20.717591', 16, '{\"name\":\"测试角色新建的\",\"label\":\"test2\",\"menuIdList\":[\"1\",\"53\",\"45\",\"43\",\"49\",\"27\",\"17\",\"59\",\"60\",\"61\",\"62\",\"63\",\"65\",\"18\",\"19\",\"20\",\"21\",\"8\",\"10\",\"11\",\"12\",\"13\",\"22\",\"23\",\"24\",\"25\",\"26\",\"2\"],\"departmentIdList\":[],\"userId\":\"16\"}', '/admin/sys/role/add', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (155, '2020-01-18 16:21:23.693158', '2020-01-18 16:21:23.693158', 16, '{\"page\":\"1\",\"size\":\"20\",\"sort\":\"desc\",\"order\":\"createTime\"}', '/admin/sys/role/page', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (156, '2020-01-18 16:21:28.491750', '2020-01-18 16:21:28.491750', 16, NULL, '/admin/sys/menu/list', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (157, '2020-01-18 16:21:32.285889', '2020-01-18 16:21:32.285889', 16, NULL, '/admin/sys/role/list', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (158, '2020-01-18 16:21:32.308044', '2020-01-18 16:21:32.308044', 16, '{\"id\":\"16\"}', '/admin/sys/user/info', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (159, '2020-01-18 16:22:37.021999', '2020-01-18 16:22:37.021999', 16, NULL, '/admin/sys/menu/list', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (160, '2020-01-18 16:22:37.023195', '2020-01-18 16:22:37.023195', 16, NULL, '/admin/sys/department/list', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (161, '2020-01-18 16:22:37.112065', '2020-01-18 16:22:37.112065', 16, '{\"id\":\"31\"}', '/admin/sys/role/info', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (162, '2020-01-18 16:24:36.231520', '2020-01-18 16:24:36.231520', 16, NULL, '/admin/sys/menu/list', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (163, '2020-01-18 16:24:36.245067', '2020-01-18 16:24:36.245067', 16, '{\"id\":\"28\"}', '/admin/sys/role/info', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (164, '2020-01-18 16:24:36.261470', '2020-01-18 16:24:36.261470', 16, NULL, '/admin/sys/department/list', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (165, '2020-01-18 16:24:49.947254', '2020-01-18 16:24:49.947254', 16, NULL, '/admin/comm/person', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (166, '2020-01-18 16:24:49.951171', '2020-01-18 16:24:49.951171', 16, NULL, '/admin/comm/permmenu', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (167, '2020-01-18 16:24:50.250428', '2020-01-18 16:24:50.250428', 16, '{\"page\":\"1\",\"size\":\"20\",\"sort\":\"desc\",\"order\":\"createTime\"}', '/admin/sys/role/page', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (168, '2020-01-18 16:24:51.544110', '2020-01-18 16:24:51.544110', 16, NULL, '/admin/sys/menu/list', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (169, '2020-01-18 16:24:55.719280', '2020-01-18 16:24:55.719280', 16, '{\"id\":\"28\"}', '/admin/sys/role/info', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (170, '2020-01-18 16:24:55.723542', '2020-01-18 16:24:55.723542', 16, NULL, '/admin/sys/menu/list', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (171, '2020-01-18 16:24:55.736838', '2020-01-18 16:24:55.736838', 16, NULL, '/admin/sys/department/list', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (172, '2020-01-18 16:25:01.083988', '2020-01-18 16:25:01.083988', NULL, NULL, '/admin/comm/logout', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (173, '2020-01-18 16:25:02.193062', '2020-01-18 16:25:02.193062', NULL, '{\"height\":\"36\",\"width\":\"110\"}', '/admin/comm/captcha', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (174, '2020-01-18 16:25:07.797495', '2020-01-18 16:25:07.797495', NULL, '{\"username\":\"admin\",\"password\":\"123456\",\"captchaId\":\"05c63990-39cc-11ea-9253-511b67d7a114\",\"verifyCode\":\"u8dl\"}', '/admin/comm/login', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (175, '2020-01-18 16:25:08.035842', '2020-01-18 16:25:08.035842', 1, NULL, '/admin/comm/person', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (176, '2020-01-18 16:25:08.139884', '2020-01-18 16:25:08.139884', 1, NULL, '/admin/comm/permmenu', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (177, '2020-01-18 16:25:10.533770', '2020-01-18 16:25:10.533770', 1, NULL, '/admin/sys/department/list', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (178, '2020-01-18 16:25:10.549092', '2020-01-18 16:25:10.549092', 1, '{\"page\":\"1\",\"size\":\"20\",\"sort\":\"desc\",\"order\":\"createTime\"}', '/admin/sys/user/page', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (179, '2020-01-18 16:25:11.804422', '2020-01-18 16:25:11.804422', 1, '{\"page\":\"1\",\"size\":\"20\",\"sort\":\"desc\",\"order\":\"createTime\"}', '/admin/sys/role/page', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (180, '2020-01-18 16:25:14.228389', '2020-01-18 16:25:14.228389', 1, '{\"page\":\"1\",\"size\":\"20\",\"sort\":\"desc\",\"order\":\"createTime\"}', '/admin/sys/role/page', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (181, '2020-01-18 16:25:16.774234', '2020-01-18 16:25:16.774234', 1, '{\"page\":\"1\",\"size\":\"20\",\"sort\":\"desc\",\"order\":\"createTime\"}', '/admin/sys/role/page', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (182, '2020-01-18 16:25:45.834091', '2020-01-18 16:25:45.834091', 1, '{\"page\":\"1\",\"size\":\"20\",\"sort\":\"desc\",\"order\":\"createTime\"}', '/admin/sys/role/page', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (183, '2020-01-18 16:25:46.601055', '2020-01-18 16:25:46.601055', 1, '{\"page\":\"1\",\"size\":\"20\",\"sort\":\"desc\",\"order\":\"createTime\"}', '/admin/sys/role/page', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (184, '2020-01-18 16:26:35.515958', '2020-01-18 16:26:35.515958', 1, '{\"page\":\"1\",\"size\":\"20\",\"departmentIds\":\"1,13,14,15,17,16\",\"sort\":\"desc\",\"order\":\"createTime\"}', '/admin/sys/user/page', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (185, '2020-01-18 16:26:43.115013', '2020-01-18 16:26:43.115013', 1, '{\"page\":\"1\",\"size\":\"20\",\"sort\":\"desc\",\"order\":\"createTime\"}', '/admin/sys/role/page', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (186, '2020-01-18 16:26:43.491379', '2020-01-18 16:26:43.491379', 1, '{\"page\":\"1\",\"size\":\"20\",\"sort\":\"desc\",\"order\":\"createTime\"}', '/admin/sys/role/page', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (187, '2020-01-18 16:26:43.699253', '2020-01-18 16:26:43.699253', 1, '{\"page\":\"1\",\"size\":\"20\",\"sort\":\"desc\",\"order\":\"createTime\"}', '/admin/sys/role/page', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (188, '2020-01-18 16:26:43.865237', '2020-01-18 16:26:43.865237', 1, '{\"page\":\"1\",\"size\":\"20\",\"sort\":\"desc\",\"order\":\"createTime\"}', '/admin/sys/role/page', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (189, '2020-01-18 16:26:44.092556', '2020-01-18 16:26:44.092556', 1, '{\"page\":\"1\",\"size\":\"20\",\"sort\":\"desc\",\"order\":\"createTime\"}', '/admin/sys/role/page', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (190, '2020-01-18 16:26:44.456264', '2020-01-18 16:26:44.456264', 1, '{\"page\":\"1\",\"size\":\"20\",\"sort\":\"desc\",\"order\":\"createTime\"}', '/admin/sys/role/page', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (191, '2020-01-18 16:26:44.659226', '2020-01-18 16:26:44.659226', 1, '{\"page\":\"1\",\"size\":\"20\",\"sort\":\"desc\",\"order\":\"createTime\"}', '/admin/sys/role/page', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (192, '2020-01-18 16:26:45.070192', '2020-01-18 16:26:45.070192', 1, '{\"page\":\"1\",\"size\":\"20\",\"sort\":\"desc\",\"order\":\"createTime\"}', '/admin/sys/role/page', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (193, '2020-01-18 16:26:54.978030', '2020-01-18 16:26:54.978030', 1, '{\"id\":\"27\"}', '/admin/sys/role/info', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (194, '2020-01-18 16:26:55.009427', '2020-01-18 16:26:55.009427', 1, NULL, '/admin/sys/menu/list', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (195, '2020-01-18 16:26:55.039296', '2020-01-18 16:26:55.039296', 1, NULL, '/admin/sys/department/list', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (196, '2020-01-18 16:26:58.281251', '2020-01-18 16:26:58.281251', 1, NULL, '/admin/sys/menu/list', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (197, '2020-01-18 16:26:58.290336', '2020-01-18 16:26:58.290336', 1, NULL, '/admin/sys/department/list', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (198, '2020-01-18 16:26:58.302812', '2020-01-18 16:26:58.302812', 1, '{\"id\":\"28\"}', '/admin/sys/role/info', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (199, '2020-01-18 16:27:14.549834', '2020-01-18 16:27:14.549834', NULL, NULL, '/admin/comm/logout', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (200, '2020-01-18 16:27:15.639775', '2020-01-18 16:27:15.639775', NULL, '{\"height\":\"36\",\"width\":\"110\"}', '/admin/comm/captcha', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (201, '2020-01-18 16:27:20.518904', '2020-01-18 16:27:20.518904', NULL, '{\"height\":\"36\",\"width\":\"110\"}', '/admin/comm/captcha', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (202, '2020-01-18 16:27:25.213686', '2020-01-18 16:27:25.213686', NULL, '{\"username\":\"test\",\"password\":\"123123\",\"captchaId\":\"58382e90-39cc-11ea-8221-cf751b05b87d\",\"verifyCode\":\"4foo\"}', '/admin/comm/login', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (203, '2020-01-18 16:27:25.229890', '2020-01-18 16:27:25.229890', NULL, '{\"height\":\"36\",\"width\":\"110\"}', '/admin/comm/captcha', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (204, '2020-01-18 16:27:30.223254', '2020-01-18 16:27:30.223254', NULL, '{\"username\":\"test\",\"password\":\"123123\",\"captchaId\":\"5b0a8870-39cc-11ea-8221-cf751b05b87d\",\"verifyCode\":\"udq6\"}', '/admin/comm/login', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (205, '2020-01-18 16:27:30.460143', '2020-01-18 16:27:30.460143', 16, NULL, '/admin/comm/person', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (206, '2020-01-18 16:27:30.596633', '2020-01-18 16:27:30.596633', 16, NULL, '/admin/comm/permmenu', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (207, '2020-01-18 16:27:32.708314', '2020-01-18 16:27:32.708314', 16, NULL, '/admin/sys/department/list', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (208, '2020-01-18 16:27:32.737087', '2020-01-18 16:27:32.737087', 16, '{\"page\":\"1\",\"size\":\"20\",\"sort\":\"desc\",\"order\":\"createTime\"}', '/admin/sys/user/page', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (209, '2020-01-18 16:27:35.370095', '2020-01-18 16:27:35.370095', 16, '{\"page\":\"1\",\"size\":\"20\",\"sort\":\"desc\",\"order\":\"createTime\"}', '/admin/sys/role/page', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (210, '2020-01-18 16:27:37.048279', '2020-01-18 16:27:37.048279', 16, '{\"id\":\"28\"}', '/admin/sys/role/info', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (211, '2020-01-18 16:27:37.078899', '2020-01-18 16:27:37.078899', 16, NULL, '/admin/sys/menu/list', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (212, '2020-01-18 16:27:37.083083', '2020-01-18 16:27:37.083083', 16, NULL, '/admin/sys/department/list', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (213, '2020-01-18 16:27:47.284951', '2020-01-18 16:27:47.284951', 16, '{\"id\":\"16\"}', '/admin/sys/user/info', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (214, '2020-01-18 16:27:47.346476', '2020-01-18 16:27:47.346476', 16, NULL, '/admin/sys/role/list', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (215, '2020-01-18 16:27:50.528570', '2020-01-18 16:27:50.528570', 16, NULL, '/admin/sys/role/list', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (216, '2020-01-18 16:27:50.554013', '2020-01-18 16:27:50.554013', 16, '{\"id\":\"18\"}', '/admin/sys/user/info', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (217, '2020-01-18 16:27:53.459690', '2020-01-18 16:27:53.459690', 16, NULL, '/admin/sys/role/list', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (218, '2020-01-18 16:27:53.472680', '2020-01-18 16:27:53.472680', 16, '{\"id\":\"20\"}', '/admin/sys/user/info', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (219, '2020-01-18 16:29:18.539446', '2020-01-18 16:29:18.539446', 16, NULL, '/admin/sys/role/list', '127.0.0.1', '本机地址');
INSERT INTO `sys_log` VALUES (220, '2020-01-18 16:29:18.551915', '2020-01-18 16:29:18.551915', 16, '{\"id\":\"16\"}', '/admin/sys/user/info', '127.0.0.1', '本机地址');
COMMIT;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updateTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `parentId` bigint(20) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `router` varchar(255) DEFAULT NULL,
  `perms` varchar(255) DEFAULT NULL,
  `type` tinyint(4) NOT NULL DEFAULT '0',
  `icon` varchar(255) DEFAULT NULL,
  `orderNum` int(11) NOT NULL DEFAULT '0',
  `viewPath` varchar(255) DEFAULT NULL,
  `keepAlive` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `IDX_1616b35781fbecc494f496498f` (`createTime`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` VALUES (1, '2019-09-11 11:14:44.000000', '2019-11-18 15:56:36.000000', NULL, '工作台', '/', NULL, 0, 'icon-gongzuotai', 1, NULL, 1);
INSERT INTO `sys_menu` VALUES (2, '2019-09-11 11:14:47.000000', '2019-09-18 15:37:18.000000', NULL, '系统', '/sys', NULL, 0, 'icon-systemfill', 2, NULL, 1);
INSERT INTO `sys_menu` VALUES (8, '2019-09-11 23:19:57.053631', '2019-09-12 15:53:39.000000', 27, '菜单列表', '/sys/menu', NULL, 1, 'icon-menu', 2, 'views/system/menu/index.vue', 1);
INSERT INTO `sys_menu` VALUES (10, '2019-09-12 00:19:27.325922', '2019-09-12 00:19:27.325922', 8, '新增', NULL, 'sys:menu:add', 2, NULL, 1, NULL, 0);
INSERT INTO `sys_menu` VALUES (11, '2019-09-12 00:19:51.101514', '2019-09-12 00:19:51.101514', 8, '删除', NULL, 'sys:menu:delete', 2, NULL, 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (12, '2019-09-12 00:20:05.150021', '2019-09-12 00:20:05.150021', 8, '修改', NULL, 'sys:menu:update', 2, NULL, 3, NULL, 0);
INSERT INTO `sys_menu` VALUES (13, '2019-09-12 00:20:19.341206', '2019-09-12 00:20:19.341206', 8, '查询', NULL, 'sys:menu:page,sys:menu:list,sys:menu:info', 2, NULL, 4, NULL, 0);
INSERT INTO `sys_menu` VALUES (17, '2019-09-12 00:31:25.334489', '2019-09-15 23:45:57.000000', 27, '用户列表', '/sys/user', NULL, 1, 'icon-user', 1, 'views/system/user/index.vue', 1);
INSERT INTO `sys_menu` VALUES (18, '2019-09-12 00:32:21.000000', '2019-11-09 22:22:19.000000', 17, '新增', NULL, 'sys:user:add', 2, NULL, 1, NULL, 0);
INSERT INTO `sys_menu` VALUES (19, '2019-09-12 00:32:34.578645', '2019-09-12 00:32:34.578645', 17, '删除', NULL, 'sys:user:delete', 2, NULL, 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (20, '2019-09-12 00:32:47.291027', '2019-09-12 00:32:47.291027', 17, '修改', NULL, 'sys:user:update', 2, NULL, 3, NULL, 0);
INSERT INTO `sys_menu` VALUES (21, '2019-09-12 00:33:00.053653', '2019-09-12 00:33:00.053653', 17, '查询', NULL, 'sys:user:page,sys:user:list,sys:user:info', 2, NULL, 4, NULL, 0);
INSERT INTO `sys_menu` VALUES (22, '2019-09-12 00:34:01.141743', '2019-09-15 23:47:27.000000', 27, '角色列表', '/sys/role', NULL, 1, 'icon-role', 3, 'views/system/role/index.vue', 1);
INSERT INTO `sys_menu` VALUES (23, '2019-09-12 00:34:23.459460', '2019-09-12 00:34:23.459460', 22, '新增', NULL, 'sys:role:add', 2, NULL, 1, NULL, 0);
INSERT INTO `sys_menu` VALUES (24, '2019-09-12 00:34:40.523471', '2019-09-12 00:34:40.523471', 22, '删除', NULL, 'sys:role:delete', 2, NULL, 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (25, '2019-09-12 00:34:53.306692', '2019-09-12 00:34:53.306692', 22, '修改', NULL, 'sys:role:update', 2, NULL, 3, NULL, 0);
INSERT INTO `sys_menu` VALUES (26, '2019-09-12 00:35:05.024307', '2019-09-12 00:35:05.024307', 22, '查询', NULL, 'sys:role:page,sys:role:list,sys:role:info', 2, NULL, 4, NULL, 0);
INSERT INTO `sys_menu` VALUES (27, '2019-09-12 15:52:44.342387', '2019-09-15 22:11:56.000000', 2, '权限管理', NULL, NULL, 0, 'icon-permission', 1, NULL, 0);
INSERT INTO `sys_menu` VALUES (28, '2019-09-12 17:19:16.827254', '2019-09-15 22:12:08.000000', 2, '系统监控', NULL, NULL, 0, 'icon-monitor', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (29, '2019-09-12 17:35:51.000000', '2019-11-26 23:46:53.000000', 28, '请求日志', '/sys/log', '', 1, 'icon-log', 1, 'views/system/log/index.vue', 0);
INSERT INTO `sys_menu` VALUES (30, '2019-09-12 17:37:03.000000', '2019-11-18 14:20:27.000000', 29, '权限', NULL, 'sys:log:page,sys:log:clear,sys:log:get-keep,sys:log:set-keep', 2, NULL, 1, NULL, 0);
INSERT INTO `sys_menu` VALUES (43, '2019-11-07 14:22:34.000000', '2019-11-09 22:11:18.000000', 45, 'crud 示例', '/crud', NULL, 1, 'icon-radioboxfill', 1, 'views/test/crud.vue', 1);
INSERT INTO `sys_menu` VALUES (45, '2019-11-07 22:36:57.000000', '2019-11-11 15:21:10.000000', 1, '组件库', '/ui-lib', NULL, 0, 'icon-activityfill', 2, NULL, 1);
INSERT INTO `sys_menu` VALUES (47, '2019-11-08 09:35:08.000000', '2019-11-08 19:44:44.000000', NULL, '教程', '/tutorial', NULL, 0, 'icon-weibiaoti4', 3, NULL, 1);
INSERT INTO `sys_menu` VALUES (48, '2019-11-08 09:35:53.000000', '2019-11-08 09:37:02.000000', 47, '文档', '/tutorial/doc', NULL, 1, 'icon-favorfill', 0, 'https://docs.cool-admin.com/#/', 1);
INSERT INTO `sys_menu` VALUES (49, '2019-11-09 22:11:13.000000', '2019-11-09 22:11:34.000000', 45, 'Quill富文本', '/editor-quill', NULL, 1, 'icon-radioboxfill', 3, 'views/test/editor-quill.vue', 1);
INSERT INTO `sys_menu` VALUES (53, '2019-11-11 15:21:00.457911', '2019-11-11 15:21:00.457911', 1, '组件预览', '/ui-components', NULL, 1, 'icon-activityfill', 1, 'views/workbench/ui-components', 1);
INSERT INTO `sys_menu` VALUES (59, '2019-11-18 16:50:27.676184', '2019-11-18 16:50:27.676184', 17, '部门列表', NULL, 'sys:department:list', 2, NULL, 0, NULL, 1);
INSERT INTO `sys_menu` VALUES (60, '2019-11-18 16:50:45.783945', '2019-11-18 16:50:45.783945', 17, '新增部门', NULL, 'sys:department:add', 2, NULL, 0, NULL, 1);
INSERT INTO `sys_menu` VALUES (61, '2019-11-18 16:50:59.241883', '2019-11-18 16:50:59.241883', 17, '更新部门', NULL, 'sys:department:update', 2, NULL, 0, NULL, 1);
INSERT INTO `sys_menu` VALUES (62, '2019-11-18 16:51:13.304712', '2019-11-18 16:51:13.304712', 17, '删除部门', NULL, 'sys:department:delete', 2, NULL, 0, NULL, 1);
INSERT INTO `sys_menu` VALUES (63, '2019-11-18 17:49:35.009792', '2019-11-18 17:49:35.009792', 17, '部门排序', NULL, 'sys:department:order', 2, NULL, 0, NULL, 1);
INSERT INTO `sys_menu` VALUES (65, '2019-11-18 23:59:21.775467', '2019-11-18 23:59:21.775467', 17, '用户转移', NULL, 'sys:user:move', 2, NULL, 0, NULL, 1);
INSERT INTO `sys_menu` VALUES (66, '2019-11-26 23:48:16.000000', '2019-11-26 23:48:29.000000', 28, '服务状态', '/sys/perf', NULL, 1, 'icon-monitor', 2, 'views/system/perf/index.vue', 0);
INSERT INTO `sys_menu` VALUES (67, '2019-11-26 23:50:13.059599', '2019-11-26 23:50:13.059599', 66, '记录', NULL, 'sys:info:record', 2, NULL, 0, NULL, 1);
INSERT INTO `sys_menu` VALUES (69, '2019-12-10 13:24:18.492207', '2019-12-10 13:24:18.492207', 2, '任务管理', NULL, NULL, 0, 'icon-weibiaoti4', 3, NULL, 1);
INSERT INTO `sys_menu` VALUES (70, '2019-12-10 13:25:06.000000', '2019-12-10 13:28:53.000000', 69, '任务列表', '/sys/task', NULL, 1, 'icon-radioboxfill', 1, 'views/system/task/index.vue', 1);
INSERT INTO `sys_menu` VALUES (71, '2019-12-10 13:25:33.801310', '2019-12-10 13:25:33.801310', 70, '新增', NULL, 'sys:task:add', 2, NULL, 0, NULL, 1);
INSERT INTO `sys_menu` VALUES (72, '2019-12-10 13:25:45.160298', '2019-12-10 13:25:45.160298', 70, '删除', NULL, 'sys:task:delete', 2, NULL, 0, NULL, 1);
INSERT INTO `sys_menu` VALUES (73, '2019-12-10 13:26:03.000000', '2019-12-10 13:26:18.000000', 70, '修改', NULL, 'sys:task:info,sys:task:update', 2, NULL, 0, NULL, 1);
INSERT INTO `sys_menu` VALUES (74, '2019-12-10 13:26:49.432939', '2019-12-10 13:26:49.432939', 70, '查看', NULL, 'sys:task:page,sys:task:info,sys:task:log', 2, NULL, 0, NULL, 1);
INSERT INTO `sys_menu` VALUES (75, '2019-12-10 13:27:10.024980', '2019-12-10 13:27:10.024980', 70, '立即执行', NULL, 'sys:task:once', 2, NULL, 0, NULL, 1);
INSERT INTO `sys_menu` VALUES (76, '2019-12-10 13:27:24.472364', '2019-12-10 13:27:24.472364', 70, '开始', NULL, 'sys:task:start', 2, NULL, 0, NULL, 1);
INSERT INTO `sys_menu` VALUES (77, '2019-12-10 13:27:36.460352', '2019-12-10 13:27:36.460352', 70, '暂停', NULL, 'sys:task:stop', 2, NULL, 0, NULL, 1);
INSERT INTO `sys_menu` VALUES (78, '2019-12-10 13:27:56.000000', '2019-12-10 13:28:37.000000', 2, '参数配置', NULL, NULL, 0, 'icon-repairfill', 4, NULL, 1);
INSERT INTO `sys_menu` VALUES (79, '2019-12-10 13:29:33.170527', '2019-12-10 13:29:33.170527', 78, '参数列表', '/sys/param', NULL, 1, 'icon-menu', 0, 'views/system/param/index.vue', 1);
INSERT INTO `sys_menu` VALUES (80, '2019-12-10 13:29:50.146781', '2019-12-10 13:29:50.146781', 79, '新增', NULL, 'sys:param:add', 2, NULL, 0, NULL, 1);
INSERT INTO `sys_menu` VALUES (81, '2019-12-10 13:30:10.030761', '2019-12-10 13:30:10.030761', 79, '修改', NULL, 'sys:param:info,sys:param:update', 2, NULL, 0, NULL, 1);
INSERT INTO `sys_menu` VALUES (82, '2019-12-10 13:30:25.791907', '2019-12-10 13:30:25.791907', 79, '删除', NULL, 'sys:param:delete', 2, NULL, 0, NULL, 1);
INSERT INTO `sys_menu` VALUES (83, '2019-12-10 13:30:40.469454', '2019-12-10 13:30:40.469454', 79, '查看', NULL, 'sys:param:page,sys:param:list,sys:param:info', 2, NULL, 0, NULL, 1);
COMMIT;

-- ----------------------------
-- Table structure for sys_param
-- ----------------------------
DROP TABLE IF EXISTS `sys_param`;
CREATE TABLE `sys_param` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updateTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `key` varchar(255) NOT NULL,
  `dataType` tinyint(4) NOT NULL DEFAULT '0',
  `remark` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `IDX_efeedadce2f49b12e9317909d5` (`createTime`) USING BTREE,
  KEY `IDX_417813ad97413e91fbf45f245d` (`key`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_param
-- ----------------------------
BEGIN;
INSERT INTO `sys_param` VALUES (4, '2019-12-09 13:03:37.000000', '2019-12-10 13:05:08.000000', 'rich', 0, '测试富文本参数 访问地址： https://show.cool-admin.com/api/app/comm/html?key=rich', '富文本参数', '<h1>哈哈哈</h1><p>呵呵呵</p><p><span style=\"color: rgb(230, 0, 0);\">发</span></p><p><span style=\"color: rgb(230, 0, 0);\"><span class=\"ql-cursor\">﻿﻿﻿</span></span><img src=\"https://cool-admin-test.oss-cn-shenzhen.aliyuncs.com/20191210/80aa0370-1b0a-11ea-a3c9-ddb7c9c36164.jpeg\"></p>');
INSERT INTO `sys_param` VALUES (5, '2019-12-10 13:06:11.178999', '2019-12-10 13:06:11.178999', 'comm', 1, '测试普通参数', '普通参数', '[1,2,3]');
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updateTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `name` varchar(255) NOT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `label` varchar(50) DEFAULT NULL,
  `userId` varchar(255) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `IDX_223de54d6badbe43a5490450c3` (`name`) USING BTREE,
  UNIQUE KEY `IDX_f2d07943355da93c3a8a1c411a` (`label`) USING BTREE,
  KEY `IDX_77917ed69a116ebf458c681829` (`createTime`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` VALUES (1, '2019-09-11 23:04:35.193681', '2019-09-11 23:04:35.193681', '超管', NULL, NULL, '');
INSERT INTO `sys_role` VALUES (27, '2019-11-07 02:35:13.129487', '2019-11-10 08:57:09.000000', 'testRole', NULL, 'testRole', '');
INSERT INTO `sys_role` VALUES (28, '2019-11-11 10:21:11.192497', '2019-11-11 10:21:11.192497', '测试', NULL, '2', '');
INSERT INTO `sys_role` VALUES (29, '2019-11-11 15:15:37.181624', '2019-11-20 15:38:32.000000', '只有部门1', NULL, 'hititle', '');
INSERT INTO `sys_role` VALUES (30, '2019-11-20 15:47:23.961531', '2019-11-20 15:47:23.961531', '只有部门2小组2', NULL, 'bd2', '');
INSERT INTO `sys_role` VALUES (31, '2020-01-18 16:21:20.704899', '2020-01-18 16:21:20.704899', '测试角色新建的', NULL, 'test2', '16');
COMMIT;

-- ----------------------------
-- Table structure for sys_role_department
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_department`;
CREATE TABLE `sys_role_department` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updateTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `roleId` bigint(20) NOT NULL,
  `departmentId` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `IDX_e083017094bc786b1c10c5de8f` (`createTime`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_role_department
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_department` VALUES (7, '2019-11-20 15:38:36.526522', '2019-11-20 15:38:36.526522', 29, 13);
INSERT INTO `sys_role_department` VALUES (8, '2019-11-20 15:38:36.530798', '2019-11-20 15:38:36.530798', 29, 14);
INSERT INTO `sys_role_department` VALUES (9, '2019-11-20 15:38:36.535719', '2019-11-20 15:38:36.535719', 29, 1);
INSERT INTO `sys_role_department` VALUES (13, '2019-11-20 15:49:01.451822', '2019-11-20 15:49:01.451822', 30, 17);
INSERT INTO `sys_role_department` VALUES (14, '2019-11-20 15:49:01.550535', '2019-11-20 15:49:01.550535', 30, 1);
INSERT INTO `sys_role_department` VALUES (15, '2019-11-20 15:49:01.672427', '2019-11-20 15:49:01.672427', 30, 15);
INSERT INTO `sys_role_department` VALUES (16, '2019-11-20 15:50:34.742493', '2019-11-20 15:50:34.742493', 28, 1);
INSERT INTO `sys_role_department` VALUES (17, '2019-11-20 15:50:34.851417', '2019-11-20 15:50:34.851417', 28, 13);
INSERT INTO `sys_role_department` VALUES (18, '2019-11-20 15:50:34.971234', '2019-11-20 15:50:34.971234', 28, 14);
INSERT INTO `sys_role_department` VALUES (19, '2019-11-20 15:50:35.101318', '2019-11-20 15:50:35.101318', 28, 15);
INSERT INTO `sys_role_department` VALUES (20, '2019-11-20 15:50:35.205765', '2019-11-20 15:50:35.205765', 28, 17);
INSERT INTO `sys_role_department` VALUES (21, '2019-11-20 15:50:35.304480', '2019-11-20 15:50:35.304480', 28, 16);
INSERT INTO `sys_role_department` VALUES (26, '2020-01-18 14:57:59.988784', '2020-01-18 14:57:59.988784', 27, 15);
INSERT INTO `sys_role_department` VALUES (27, '2020-01-18 14:58:00.123781', '2020-01-18 14:58:00.123781', 27, 17);
INSERT INTO `sys_role_department` VALUES (28, '2020-01-18 14:58:00.228715', '2020-01-18 14:58:00.228715', 27, 16);
INSERT INTO `sys_role_department` VALUES (29, '2020-01-18 14:58:00.319111', '2020-01-18 14:58:00.319111', 27, 1);
COMMIT;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updateTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `roleId` bigint(20) NOT NULL,
  `menuId` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `IDX_84d8a9d8befebc08fb3be08f1a` (`createTime`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1200 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_menu` VALUES (89, '2019-09-24 10:48:52.467519', '2019-09-24 10:48:52.467519', 3, 0);
INSERT INTO `sys_role_menu` VALUES (90, '2019-09-24 10:48:52.557034', '2019-09-24 10:48:52.557034', 3, 0);
INSERT INTO `sys_role_menu` VALUES (91, '2019-09-24 10:48:52.660929', '2019-09-24 10:48:52.660929', 3, 0);
INSERT INTO `sys_role_menu` VALUES (92, '2019-09-24 10:48:52.777932', '2019-09-24 10:48:52.777932', 3, 0);
INSERT INTO `sys_role_menu` VALUES (93, '2019-09-24 10:48:52.879811', '2019-09-24 10:48:52.879811', 3, 0);
INSERT INTO `sys_role_menu` VALUES (94, '2019-09-24 10:48:52.970470', '2019-09-24 10:48:52.970470', 3, 0);
INSERT INTO `sys_role_menu` VALUES (95, '2019-09-24 10:48:53.076595', '2019-09-24 10:48:53.076595', 3, 0);
INSERT INTO `sys_role_menu` VALUES (96, '2019-09-24 10:48:53.197894', '2019-09-24 10:48:53.197894', 3, 0);
INSERT INTO `sys_role_menu` VALUES (97, '2019-09-24 10:48:53.315433', '2019-09-24 10:48:53.315433', 3, 0);
INSERT INTO `sys_role_menu` VALUES (98, '2019-09-24 10:48:53.443267', '2019-09-24 10:48:53.443267', 3, 0);
INSERT INTO `sys_role_menu` VALUES (99, '2019-09-24 10:48:53.545574', '2019-09-24 10:48:53.545574', 3, 0);
INSERT INTO `sys_role_menu` VALUES (100, '2019-09-24 10:48:53.635436', '2019-09-24 10:48:53.635436', 3, 0);
INSERT INTO `sys_role_menu` VALUES (101, '2019-09-24 10:48:53.739326', '2019-09-24 10:48:53.739326', 3, 0);
INSERT INTO `sys_role_menu` VALUES (102, '2019-09-24 10:48:53.851149', '2019-09-24 10:48:53.851149', 3, 0);
INSERT INTO `sys_role_menu` VALUES (103, '2019-09-24 10:48:53.967937', '2019-09-24 10:48:53.967937', 3, 0);
INSERT INTO `sys_role_menu` VALUES (104, '2019-09-24 10:48:54.095735', '2019-09-24 10:48:54.095735', 3, 0);
INSERT INTO `sys_role_menu` VALUES (105, '2019-09-24 10:48:54.222146', '2019-09-24 10:48:54.222146', 3, 0);
INSERT INTO `sys_role_menu` VALUES (106, '2019-09-24 10:48:54.348489', '2019-09-24 10:48:54.348489', 3, 0);
INSERT INTO `sys_role_menu` VALUES (107, '2019-09-24 10:48:54.460685', '2019-09-24 10:48:54.460685', 3, 0);
INSERT INTO `sys_role_menu` VALUES (108, '2019-09-24 10:48:54.556885', '2019-09-24 10:48:54.556885', 3, 0);
INSERT INTO `sys_role_menu` VALUES (109, '2019-09-24 10:48:54.647511', '2019-09-24 10:48:54.647511', 3, 0);
INSERT INTO `sys_role_menu` VALUES (110, '2019-09-24 10:48:54.756336', '2019-09-24 10:48:54.756336', 3, 0);
INSERT INTO `sys_role_menu` VALUES (111, '2019-09-24 10:48:54.873173', '2019-09-24 10:48:54.873173', 3, 0);
INSERT INTO `sys_role_menu` VALUES (112, '2019-09-24 10:48:54.998758', '2019-09-24 10:48:54.998758', 3, 0);
INSERT INTO `sys_role_menu` VALUES (113, '2019-09-24 10:49:03.229459', '2019-09-24 10:49:03.229459', 2, 0);
INSERT INTO `sys_role_menu` VALUES (114, '2019-09-24 10:49:03.340162', '2019-09-24 10:49:03.340162', 2, 0);
INSERT INTO `sys_role_menu` VALUES (115, '2019-09-24 10:49:03.458236', '2019-09-24 10:49:03.458236', 2, 0);
INSERT INTO `sys_role_menu` VALUES (116, '2019-09-24 10:49:03.577590', '2019-09-24 10:49:03.577590', 2, 0);
INSERT INTO `sys_role_menu` VALUES (117, '2019-09-24 10:49:03.691109', '2019-09-24 10:49:03.691109', 2, 0);
INSERT INTO `sys_role_menu` VALUES (118, '2019-09-24 10:49:03.802532', '2019-09-24 10:49:03.802532', 2, 0);
INSERT INTO `sys_role_menu` VALUES (119, '2019-09-24 10:49:03.907959', '2019-09-24 10:49:03.907959', 2, 0);
INSERT INTO `sys_role_menu` VALUES (120, '2019-09-24 10:49:04.003739', '2019-09-24 10:49:04.003739', 2, 0);
INSERT INTO `sys_role_menu` VALUES (121, '2019-09-24 10:49:04.107757', '2019-09-24 10:49:04.107757', 2, 0);
INSERT INTO `sys_role_menu` VALUES (122, '2019-09-24 10:49:04.227512', '2019-09-24 10:49:04.227512', 2, 0);
INSERT INTO `sys_role_menu` VALUES (123, '2019-09-24 10:49:04.341716', '2019-09-24 10:49:04.341716', 2, 0);
INSERT INTO `sys_role_menu` VALUES (124, '2019-09-24 10:49:04.452449', '2019-09-24 10:49:04.452449', 2, 0);
INSERT INTO `sys_role_menu` VALUES (125, '2019-09-24 10:49:04.557443', '2019-09-24 10:49:04.557443', 2, 0);
INSERT INTO `sys_role_menu` VALUES (126, '2019-09-24 10:49:04.653254', '2019-09-24 10:49:04.653254', 2, 0);
INSERT INTO `sys_role_menu` VALUES (127, '2019-09-24 10:49:04.756598', '2019-09-24 10:49:04.756598', 2, 0);
INSERT INTO `sys_role_menu` VALUES (128, '2019-09-24 10:49:04.876996', '2019-09-24 10:49:04.876996', 2, 0);
INSERT INTO `sys_role_menu` VALUES (129, '2019-09-24 10:49:04.990503', '2019-09-24 10:49:04.990503', 2, 0);
INSERT INTO `sys_role_menu` VALUES (130, '2019-09-24 10:49:05.101961', '2019-09-24 10:49:05.101961', 2, 0);
INSERT INTO `sys_role_menu` VALUES (131, '2019-09-24 10:49:05.206586', '2019-09-24 10:49:05.206586', 2, 0);
INSERT INTO `sys_role_menu` VALUES (132, '2019-09-24 10:49:05.302415', '2019-09-24 10:49:05.302415', 2, 0);
INSERT INTO `sys_role_menu` VALUES (133, '2019-09-24 10:49:05.407244', '2019-09-24 10:49:05.407244', 2, 0);
INSERT INTO `sys_role_menu` VALUES (134, '2019-09-24 10:49:05.526579', '2019-09-24 10:49:05.526579', 2, 0);
INSERT INTO `sys_role_menu` VALUES (135, '2019-09-24 10:49:05.628459', '2019-09-24 10:49:05.628459', 2, 0);
INSERT INTO `sys_role_menu` VALUES (136, '2019-09-24 10:49:05.744732', '2019-09-24 10:49:05.744732', 2, 0);
INSERT INTO `sys_role_menu` VALUES (137, '2019-09-25 00:41:21.138065', '2019-09-25 00:41:21.138065', 18, 0);
INSERT INTO `sys_role_menu` VALUES (138, '2019-09-25 00:41:21.144458', '2019-09-25 00:41:21.144458', 18, 0);
INSERT INTO `sys_role_menu` VALUES (867, '2019-10-12 16:15:06.167767', '2019-10-12 16:15:06.167767', 24, 0);
INSERT INTO `sys_role_menu` VALUES (868, '2019-10-12 16:15:06.172573', '2019-10-12 16:15:06.172573', 24, 0);
INSERT INTO `sys_role_menu` VALUES (869, '2019-10-12 16:15:06.176941', '2019-10-12 16:15:06.176941', 24, 0);
INSERT INTO `sys_role_menu` VALUES (870, '2019-10-12 16:15:06.182146', '2019-10-12 16:15:06.182146', 24, 0);
INSERT INTO `sys_role_menu` VALUES (871, '2019-10-12 16:15:06.186409', '2019-10-12 16:15:06.186409', 24, 0);
INSERT INTO `sys_role_menu` VALUES (872, '2019-10-12 16:15:06.190788', '2019-10-12 16:15:06.190788', 24, 0);
INSERT INTO `sys_role_menu` VALUES (873, '2019-10-12 16:15:06.194922', '2019-10-12 16:15:06.194922', 24, 0);
INSERT INTO `sys_role_menu` VALUES (874, '2019-10-12 16:15:06.199735', '2019-10-12 16:15:06.199735', 24, 0);
INSERT INTO `sys_role_menu` VALUES (875, '2019-10-12 16:15:06.205756', '2019-10-12 16:15:06.205756', 24, 0);
INSERT INTO `sys_role_menu` VALUES (876, '2019-10-12 16:15:06.211841', '2019-10-12 16:15:06.211841', 24, 0);
INSERT INTO `sys_role_menu` VALUES (877, '2019-10-12 16:15:06.216456', '2019-10-12 16:15:06.216456', 24, 0);
INSERT INTO `sys_role_menu` VALUES (878, '2019-10-12 16:15:06.220695', '2019-10-12 16:15:06.220695', 24, 0);
INSERT INTO `sys_role_menu` VALUES (879, '2019-10-12 16:15:06.224822', '2019-10-12 16:15:06.224822', 24, 0);
INSERT INTO `sys_role_menu` VALUES (880, '2019-10-12 16:15:06.233621', '2019-10-12 16:15:06.233621', 24, 0);
INSERT INTO `sys_role_menu` VALUES (881, '2019-10-12 16:15:06.239309', '2019-10-12 16:15:06.239309', 24, 0);
INSERT INTO `sys_role_menu` VALUES (882, '2019-10-12 16:15:06.243481', '2019-10-12 16:15:06.243481', 24, 0);
INSERT INTO `sys_role_menu` VALUES (883, '2019-10-12 16:15:06.247731', '2019-10-12 16:15:06.247731', 24, 0);
INSERT INTO `sys_role_menu` VALUES (884, '2019-10-12 16:15:06.252832', '2019-10-12 16:15:06.252832', 24, 0);
INSERT INTO `sys_role_menu` VALUES (885, '2019-10-12 16:15:06.257061', '2019-10-12 16:15:06.257061', 24, 0);
INSERT INTO `sys_role_menu` VALUES (886, '2019-10-12 16:15:06.261862', '2019-10-12 16:15:06.261862', 24, 0);
INSERT INTO `sys_role_menu` VALUES (887, '2019-10-12 16:15:06.267708', '2019-10-12 16:15:06.267708', 24, 0);
INSERT INTO `sys_role_menu` VALUES (888, '2019-10-12 16:15:06.274844', '2019-10-12 16:15:06.274844', 24, 0);
INSERT INTO `sys_role_menu` VALUES (889, '2019-10-12 16:15:06.279153', '2019-10-12 16:15:06.279153', 24, 0);
INSERT INTO `sys_role_menu` VALUES (890, '2019-10-12 16:15:06.283420', '2019-10-12 16:15:06.283420', 24, 0);
INSERT INTO `sys_role_menu` VALUES (891, '2019-11-05 22:14:16.056755', '2019-11-05 22:14:16.056755', 23, 0);
INSERT INTO `sys_role_menu` VALUES (892, '2019-11-05 22:14:16.063030', '2019-11-05 22:14:16.063030', 23, 0);
INSERT INTO `sys_role_menu` VALUES (893, '2019-11-05 22:14:16.069977', '2019-11-05 22:14:16.069977', 23, 0);
INSERT INTO `sys_role_menu` VALUES (894, '2019-11-05 22:14:16.078227', '2019-11-05 22:14:16.078227', 23, 0);
INSERT INTO `sys_role_menu` VALUES (895, '2019-11-05 22:14:16.091438', '2019-11-05 22:14:16.091438', 23, 0);
INSERT INTO `sys_role_menu` VALUES (896, '2019-11-05 22:14:16.096875', '2019-11-05 22:14:16.096875', 23, 0);
INSERT INTO `sys_role_menu` VALUES (897, '2019-11-05 22:14:16.103069', '2019-11-05 22:14:16.103069', 23, 0);
INSERT INTO `sys_role_menu` VALUES (898, '2019-11-05 22:14:16.109508', '2019-11-05 22:14:16.109508', 23, 0);
INSERT INTO `sys_role_menu` VALUES (899, '2019-11-05 22:14:16.114690', '2019-11-05 22:14:16.114690', 23, 0);
INSERT INTO `sys_role_menu` VALUES (900, '2019-11-05 22:14:16.124765', '2019-11-05 22:14:16.124765', 23, 0);
INSERT INTO `sys_role_menu` VALUES (901, '2019-11-05 22:14:16.136467', '2019-11-05 22:14:16.136467', 23, 0);
INSERT INTO `sys_role_menu` VALUES (902, '2019-11-05 22:14:16.145850', '2019-11-05 22:14:16.145850', 23, 0);
INSERT INTO `sys_role_menu` VALUES (903, '2019-11-05 22:14:16.151799', '2019-11-05 22:14:16.151799', 23, 0);
INSERT INTO `sys_role_menu` VALUES (904, '2019-11-05 22:14:16.156997', '2019-11-05 22:14:16.156997', 23, 0);
INSERT INTO `sys_role_menu` VALUES (905, '2019-11-05 22:14:16.162013', '2019-11-05 22:14:16.162013', 23, 0);
INSERT INTO `sys_role_menu` VALUES (906, '2019-11-05 22:14:16.166897', '2019-11-05 22:14:16.166897', 23, 0);
INSERT INTO `sys_role_menu` VALUES (907, '2019-11-05 22:14:16.172890', '2019-11-05 22:14:16.172890', 23, 0);
INSERT INTO `sys_role_menu` VALUES (908, '2019-11-05 22:14:16.179600', '2019-11-05 22:14:16.179600', 23, 0);
INSERT INTO `sys_role_menu` VALUES (909, '2019-11-05 22:14:16.184456', '2019-11-05 22:14:16.184456', 23, 0);
INSERT INTO `sys_role_menu` VALUES (910, '2019-11-05 22:14:16.189343', '2019-11-05 22:14:16.189343', 23, 0);
INSERT INTO `sys_role_menu` VALUES (911, '2019-11-05 22:14:16.195251', '2019-11-05 22:14:16.195251', 23, 0);
INSERT INTO `sys_role_menu` VALUES (912, '2019-11-05 22:14:16.200053', '2019-11-05 22:14:16.200053', 23, 0);
INSERT INTO `sys_role_menu` VALUES (913, '2019-11-05 22:14:18.192401', '2019-11-05 22:14:18.192401', 22, 0);
INSERT INTO `sys_role_menu` VALUES (914, '2019-11-05 22:14:18.197334', '2019-11-05 22:14:18.197334', 22, 0);
INSERT INTO `sys_role_menu` VALUES (915, '2019-11-05 22:14:18.202609', '2019-11-05 22:14:18.202609', 22, 0);
INSERT INTO `sys_role_menu` VALUES (916, '2019-11-05 22:14:18.211358', '2019-11-05 22:14:18.211358', 22, 0);
INSERT INTO `sys_role_menu` VALUES (917, '2019-11-05 22:14:18.222491', '2019-11-05 22:14:18.222491', 22, 0);
INSERT INTO `sys_role_menu` VALUES (918, '2019-11-05 22:14:18.227339', '2019-11-05 22:14:18.227339', 22, 0);
INSERT INTO `sys_role_menu` VALUES (919, '2019-11-05 22:14:18.232034', '2019-11-05 22:14:18.232034', 22, 0);
INSERT INTO `sys_role_menu` VALUES (920, '2019-11-05 22:14:18.242783', '2019-11-05 22:14:18.242783', 22, 0);
INSERT INTO `sys_role_menu` VALUES (927, '2019-11-06 16:28:47.239598', '2019-11-06 16:28:47.239598', 26, 0);
INSERT INTO `sys_role_menu` VALUES (928, '2019-11-06 16:28:47.250806', '2019-11-06 16:28:47.250806', 26, 0);
INSERT INTO `sys_role_menu` VALUES (929, '2019-11-06 16:28:47.256429', '2019-11-06 16:28:47.256429', 26, 0);
INSERT INTO `sys_role_menu` VALUES (930, '2019-11-06 16:28:47.261071', '2019-11-06 16:28:47.261071', 26, 0);
INSERT INTO `sys_role_menu` VALUES (931, '2019-11-06 16:28:47.276814', '2019-11-06 16:28:47.276814', 26, 0);
INSERT INTO `sys_role_menu` VALUES (953, '2019-11-20 15:38:36.301783', '2019-11-20 15:38:36.301783', 29, 1);
INSERT INTO `sys_role_menu` VALUES (954, '2019-11-20 15:38:36.311870', '2019-11-20 15:38:36.311870', 29, 53);
INSERT INTO `sys_role_menu` VALUES (955, '2019-11-20 15:38:36.324812', '2019-11-20 15:38:36.324812', 29, 45);
INSERT INTO `sys_role_menu` VALUES (956, '2019-11-20 15:38:36.331792', '2019-11-20 15:38:36.331792', 29, 43);
INSERT INTO `sys_role_menu` VALUES (957, '2019-11-20 15:38:36.340468', '2019-11-20 15:38:36.340468', 29, 49);
INSERT INTO `sys_role_menu` VALUES (958, '2019-11-20 15:38:36.348038', '2019-11-20 15:38:36.348038', 29, 2);
INSERT INTO `sys_role_menu` VALUES (959, '2019-11-20 15:38:36.355328', '2019-11-20 15:38:36.355328', 29, 27);
INSERT INTO `sys_role_menu` VALUES (960, '2019-11-20 15:38:36.359654', '2019-11-20 15:38:36.359654', 29, 17);
INSERT INTO `sys_role_menu` VALUES (961, '2019-11-20 15:38:36.364408', '2019-11-20 15:38:36.364408', 29, 59);
INSERT INTO `sys_role_menu` VALUES (962, '2019-11-20 15:38:36.368796', '2019-11-20 15:38:36.368796', 29, 60);
INSERT INTO `sys_role_menu` VALUES (963, '2019-11-20 15:38:36.373162', '2019-11-20 15:38:36.373162', 29, 61);
INSERT INTO `sys_role_menu` VALUES (964, '2019-11-20 15:38:36.377858', '2019-11-20 15:38:36.377858', 29, 62);
INSERT INTO `sys_role_menu` VALUES (965, '2019-11-20 15:38:36.384752', '2019-11-20 15:38:36.384752', 29, 63);
INSERT INTO `sys_role_menu` VALUES (966, '2019-11-20 15:38:36.393795', '2019-11-20 15:38:36.393795', 29, 65);
INSERT INTO `sys_role_menu` VALUES (967, '2019-11-20 15:38:36.399660', '2019-11-20 15:38:36.399660', 29, 18);
INSERT INTO `sys_role_menu` VALUES (968, '2019-11-20 15:38:36.405684', '2019-11-20 15:38:36.405684', 29, 19);
INSERT INTO `sys_role_menu` VALUES (969, '2019-11-20 15:38:36.417278', '2019-11-20 15:38:36.417278', 29, 20);
INSERT INTO `sys_role_menu` VALUES (970, '2019-11-20 15:38:36.425006', '2019-11-20 15:38:36.425006', 29, 21);
INSERT INTO `sys_role_menu` VALUES (971, '2019-11-20 15:38:36.432167', '2019-11-20 15:38:36.432167', 29, 8);
INSERT INTO `sys_role_menu` VALUES (972, '2019-11-20 15:38:36.441416', '2019-11-20 15:38:36.441416', 29, 10);
INSERT INTO `sys_role_menu` VALUES (973, '2019-11-20 15:38:36.448209', '2019-11-20 15:38:36.448209', 29, 11);
INSERT INTO `sys_role_menu` VALUES (974, '2019-11-20 15:38:36.452642', '2019-11-20 15:38:36.452642', 29, 12);
INSERT INTO `sys_role_menu` VALUES (975, '2019-11-20 15:38:36.458106', '2019-11-20 15:38:36.458106', 29, 13);
INSERT INTO `sys_role_menu` VALUES (976, '2019-11-20 15:38:36.462988', '2019-11-20 15:38:36.462988', 29, 22);
INSERT INTO `sys_role_menu` VALUES (977, '2019-11-20 15:38:36.467914', '2019-11-20 15:38:36.467914', 29, 23);
INSERT INTO `sys_role_menu` VALUES (978, '2019-11-20 15:38:36.474978', '2019-11-20 15:38:36.474978', 29, 24);
INSERT INTO `sys_role_menu` VALUES (979, '2019-11-20 15:38:36.479461', '2019-11-20 15:38:36.479461', 29, 25);
INSERT INTO `sys_role_menu` VALUES (980, '2019-11-20 15:38:36.484749', '2019-11-20 15:38:36.484749', 29, 26);
INSERT INTO `sys_role_menu` VALUES (981, '2019-11-20 15:38:36.489338', '2019-11-20 15:38:36.489338', 29, 28);
INSERT INTO `sys_role_menu` VALUES (982, '2019-11-20 15:38:36.493807', '2019-11-20 15:38:36.493807', 29, 29);
INSERT INTO `sys_role_menu` VALUES (983, '2019-11-20 15:38:36.499537', '2019-11-20 15:38:36.499537', 29, 30);
INSERT INTO `sys_role_menu` VALUES (984, '2019-11-20 15:38:36.510351', '2019-11-20 15:38:36.510351', 29, 51);
INSERT INTO `sys_role_menu` VALUES (985, '2019-11-20 15:38:36.514727', '2019-11-20 15:38:36.514727', 29, 47);
INSERT INTO `sys_role_menu` VALUES (986, '2019-11-20 15:38:36.518915', '2019-11-20 15:38:36.518915', 29, 48);
INSERT INTO `sys_role_menu` VALUES (1021, '2019-11-20 15:48:57.986005', '2019-11-20 15:48:57.986005', 30, 1);
INSERT INTO `sys_role_menu` VALUES (1022, '2019-11-20 15:48:58.106434', '2019-11-20 15:48:58.106434', 30, 53);
INSERT INTO `sys_role_menu` VALUES (1023, '2019-11-20 15:48:58.212226', '2019-11-20 15:48:58.212226', 30, 45);
INSERT INTO `sys_role_menu` VALUES (1024, '2019-11-20 15:48:58.304996', '2019-11-20 15:48:58.304996', 30, 43);
INSERT INTO `sys_role_menu` VALUES (1025, '2019-11-20 15:48:58.396317', '2019-11-20 15:48:58.396317', 30, 49);
INSERT INTO `sys_role_menu` VALUES (1026, '2019-11-20 15:48:58.485613', '2019-11-20 15:48:58.485613', 30, 2);
INSERT INTO `sys_role_menu` VALUES (1027, '2019-11-20 15:48:58.583594', '2019-11-20 15:48:58.583594', 30, 27);
INSERT INTO `sys_role_menu` VALUES (1028, '2019-11-20 15:48:58.703265', '2019-11-20 15:48:58.703265', 30, 17);
INSERT INTO `sys_role_menu` VALUES (1029, '2019-11-20 15:48:58.809437', '2019-11-20 15:48:58.809437', 30, 59);
INSERT INTO `sys_role_menu` VALUES (1030, '2019-11-20 15:48:58.903667', '2019-11-20 15:48:58.903667', 30, 60);
INSERT INTO `sys_role_menu` VALUES (1031, '2019-11-20 15:48:58.991331', '2019-11-20 15:48:58.991331', 30, 61);
INSERT INTO `sys_role_menu` VALUES (1032, '2019-11-20 15:48:59.082845', '2019-11-20 15:48:59.082845', 30, 62);
INSERT INTO `sys_role_menu` VALUES (1033, '2019-11-20 15:48:59.185234', '2019-11-20 15:48:59.185234', 30, 63);
INSERT INTO `sys_role_menu` VALUES (1034, '2019-11-20 15:48:59.307216', '2019-11-20 15:48:59.307216', 30, 65);
INSERT INTO `sys_role_menu` VALUES (1035, '2019-11-20 15:48:59.424020', '2019-11-20 15:48:59.424020', 30, 18);
INSERT INTO `sys_role_menu` VALUES (1036, '2019-11-20 15:48:59.518959', '2019-11-20 15:48:59.518959', 30, 19);
INSERT INTO `sys_role_menu` VALUES (1037, '2019-11-20 15:48:59.608891', '2019-11-20 15:48:59.608891', 30, 20);
INSERT INTO `sys_role_menu` VALUES (1038, '2019-11-20 15:48:59.698854', '2019-11-20 15:48:59.698854', 30, 21);
INSERT INTO `sys_role_menu` VALUES (1039, '2019-11-20 15:48:59.796802', '2019-11-20 15:48:59.796802', 30, 8);
INSERT INTO `sys_role_menu` VALUES (1040, '2019-11-20 15:48:59.916117', '2019-11-20 15:48:59.916117', 30, 10);
INSERT INTO `sys_role_menu` VALUES (1041, '2019-11-20 15:49:00.020465', '2019-11-20 15:49:00.020465', 30, 11);
INSERT INTO `sys_role_menu` VALUES (1042, '2019-11-20 15:49:00.113954', '2019-11-20 15:49:00.113954', 30, 12);
INSERT INTO `sys_role_menu` VALUES (1043, '2019-11-20 15:49:00.203839', '2019-11-20 15:49:00.203839', 30, 13);
INSERT INTO `sys_role_menu` VALUES (1044, '2019-11-20 15:49:00.294606', '2019-11-20 15:49:00.294606', 30, 22);
INSERT INTO `sys_role_menu` VALUES (1045, '2019-11-20 15:49:00.393320', '2019-11-20 15:49:00.393320', 30, 23);
INSERT INTO `sys_role_menu` VALUES (1046, '2019-11-20 15:49:00.512970', '2019-11-20 15:49:00.512970', 30, 24);
INSERT INTO `sys_role_menu` VALUES (1047, '2019-11-20 15:49:00.616566', '2019-11-20 15:49:00.616566', 30, 25);
INSERT INTO `sys_role_menu` VALUES (1048, '2019-11-20 15:49:00.710823', '2019-11-20 15:49:00.710823', 30, 26);
INSERT INTO `sys_role_menu` VALUES (1049, '2019-11-20 15:49:00.798504', '2019-11-20 15:49:00.798504', 30, 28);
INSERT INTO `sys_role_menu` VALUES (1050, '2019-11-20 15:49:00.887412', '2019-11-20 15:49:00.887412', 30, 29);
INSERT INTO `sys_role_menu` VALUES (1051, '2019-11-20 15:49:00.986103', '2019-11-20 15:49:00.986103', 30, 30);
INSERT INTO `sys_role_menu` VALUES (1052, '2019-11-20 15:49:01.105769', '2019-11-20 15:49:01.105769', 30, 51);
INSERT INTO `sys_role_menu` VALUES (1053, '2019-11-20 15:49:01.218223', '2019-11-20 15:49:01.218223', 30, 47);
INSERT INTO `sys_role_menu` VALUES (1054, '2019-11-20 15:49:01.311715', '2019-11-20 15:49:01.311715', 30, 48);
INSERT INTO `sys_role_menu` VALUES (1087, '2019-11-20 15:50:31.086823', '2019-11-20 15:50:31.086823', 28, 1);
INSERT INTO `sys_role_menu` VALUES (1088, '2019-11-20 15:50:31.202090', '2019-11-20 15:50:31.202090', 28, 53);
INSERT INTO `sys_role_menu` VALUES (1089, '2019-11-20 15:50:31.332046', '2019-11-20 15:50:31.332046', 28, 45);
INSERT INTO `sys_role_menu` VALUES (1090, '2019-11-20 15:50:31.453922', '2019-11-20 15:50:31.453922', 28, 43);
INSERT INTO `sys_role_menu` VALUES (1091, '2019-11-20 15:50:31.547850', '2019-11-20 15:50:31.547850', 28, 49);
INSERT INTO `sys_role_menu` VALUES (1092, '2019-11-20 15:50:31.644821', '2019-11-20 15:50:31.644821', 28, 2);
INSERT INTO `sys_role_menu` VALUES (1093, '2019-11-20 15:50:31.753734', '2019-11-20 15:50:31.753734', 28, 27);
INSERT INTO `sys_role_menu` VALUES (1094, '2019-11-20 15:50:31.868616', '2019-11-20 15:50:31.868616', 28, 17);
INSERT INTO `sys_role_menu` VALUES (1095, '2019-11-20 15:50:32.004953', '2019-11-20 15:50:32.004953', 28, 59);
INSERT INTO `sys_role_menu` VALUES (1096, '2019-11-20 15:50:32.125528', '2019-11-20 15:50:32.125528', 28, 60);
INSERT INTO `sys_role_menu` VALUES (1097, '2019-11-20 15:50:32.218069', '2019-11-20 15:50:32.218069', 28, 61);
INSERT INTO `sys_role_menu` VALUES (1098, '2019-11-20 15:50:32.315766', '2019-11-20 15:50:32.315766', 28, 62);
INSERT INTO `sys_role_menu` VALUES (1099, '2019-11-20 15:50:32.423330', '2019-11-20 15:50:32.423330', 28, 63);
INSERT INTO `sys_role_menu` VALUES (1100, '2019-11-20 15:50:32.537843', '2019-11-20 15:50:32.537843', 28, 65);
INSERT INTO `sys_role_menu` VALUES (1101, '2019-11-20 15:50:32.667348', '2019-11-20 15:50:32.667348', 28, 18);
INSERT INTO `sys_role_menu` VALUES (1102, '2019-11-20 15:50:32.801051', '2019-11-20 15:50:32.801051', 28, 19);
INSERT INTO `sys_role_menu` VALUES (1103, '2019-11-20 15:50:32.907455', '2019-11-20 15:50:32.907455', 28, 20);
INSERT INTO `sys_role_menu` VALUES (1104, '2019-11-20 15:50:33.021963', '2019-11-20 15:50:33.021963', 28, 21);
INSERT INTO `sys_role_menu` VALUES (1105, '2019-11-20 15:50:33.152371', '2019-11-20 15:50:33.152371', 28, 8);
INSERT INTO `sys_role_menu` VALUES (1106, '2019-11-20 15:50:33.258070', '2019-11-20 15:50:33.258070', 28, 10);
INSERT INTO `sys_role_menu` VALUES (1107, '2019-11-20 15:50:33.354995', '2019-11-20 15:50:33.354995', 28, 11);
INSERT INTO `sys_role_menu` VALUES (1108, '2019-11-20 15:50:33.466397', '2019-11-20 15:50:33.466397', 28, 12);
INSERT INTO `sys_role_menu` VALUES (1109, '2019-11-20 15:50:33.582469', '2019-11-20 15:50:33.582469', 28, 13);
INSERT INTO `sys_role_menu` VALUES (1110, '2019-11-20 15:50:33.696298', '2019-11-20 15:50:33.696298', 28, 22);
INSERT INTO `sys_role_menu` VALUES (1111, '2019-11-20 15:50:33.825341', '2019-11-20 15:50:33.825341', 28, 23);
INSERT INTO `sys_role_menu` VALUES (1112, '2019-11-20 15:50:33.930322', '2019-11-20 15:50:33.930322', 28, 24);
INSERT INTO `sys_role_menu` VALUES (1113, '2019-11-20 15:50:34.026717', '2019-11-20 15:50:34.026717', 28, 25);
INSERT INTO `sys_role_menu` VALUES (1114, '2019-11-20 15:50:34.137896', '2019-11-20 15:50:34.137896', 28, 26);
INSERT INTO `sys_role_menu` VALUES (1115, '2019-11-20 15:50:34.246722', '2019-11-20 15:50:34.246722', 28, 28);
INSERT INTO `sys_role_menu` VALUES (1116, '2019-11-20 15:50:34.361437', '2019-11-20 15:50:34.361437', 28, 29);
INSERT INTO `sys_role_menu` VALUES (1117, '2019-11-20 15:50:34.489654', '2019-11-20 15:50:34.489654', 28, 30);
INSERT INTO `sys_role_menu` VALUES (1118, '2019-11-20 15:50:34.595799', '2019-11-20 15:50:34.595799', 28, 51);
INSERT INTO `sys_role_menu` VALUES (1146, '2020-01-18 14:57:57.259603', '2020-01-18 14:57:57.259603', 27, 27);
INSERT INTO `sys_role_menu` VALUES (1147, '2020-01-18 14:57:57.362234', '2020-01-18 14:57:57.362234', 27, 17);
INSERT INTO `sys_role_menu` VALUES (1148, '2020-01-18 14:57:57.460499', '2020-01-18 14:57:57.460499', 27, 59);
INSERT INTO `sys_role_menu` VALUES (1149, '2020-01-18 14:57:57.570514', '2020-01-18 14:57:57.570514', 27, 60);
INSERT INTO `sys_role_menu` VALUES (1150, '2020-01-18 14:57:57.674255', '2020-01-18 14:57:57.674255', 27, 61);
INSERT INTO `sys_role_menu` VALUES (1151, '2020-01-18 14:57:57.768070', '2020-01-18 14:57:57.768070', 27, 62);
INSERT INTO `sys_role_menu` VALUES (1152, '2020-01-18 14:57:57.876489', '2020-01-18 14:57:57.876489', 27, 63);
INSERT INTO `sys_role_menu` VALUES (1153, '2020-01-18 14:57:57.976171', '2020-01-18 14:57:57.976171', 27, 65);
INSERT INTO `sys_role_menu` VALUES (1154, '2020-01-18 14:57:58.073744', '2020-01-18 14:57:58.073744', 27, 18);
INSERT INTO `sys_role_menu` VALUES (1155, '2020-01-18 14:57:58.184675', '2020-01-18 14:57:58.184675', 27, 19);
INSERT INTO `sys_role_menu` VALUES (1156, '2020-01-18 14:57:58.287746', '2020-01-18 14:57:58.287746', 27, 20);
INSERT INTO `sys_role_menu` VALUES (1157, '2020-01-18 14:57:58.380441', '2020-01-18 14:57:58.380441', 27, 21);
INSERT INTO `sys_role_menu` VALUES (1158, '2020-01-18 14:57:58.494809', '2020-01-18 14:57:58.494809', 27, 8);
INSERT INTO `sys_role_menu` VALUES (1159, '2020-01-18 14:57:58.593781', '2020-01-18 14:57:58.593781', 27, 10);
INSERT INTO `sys_role_menu` VALUES (1160, '2020-01-18 14:57:58.691644', '2020-01-18 14:57:58.691644', 27, 11);
INSERT INTO `sys_role_menu` VALUES (1161, '2020-01-18 14:57:58.807852', '2020-01-18 14:57:58.807852', 27, 12);
INSERT INTO `sys_role_menu` VALUES (1162, '2020-01-18 14:57:58.909562', '2020-01-18 14:57:58.909562', 27, 13);
INSERT INTO `sys_role_menu` VALUES (1163, '2020-01-18 14:57:59.009430', '2020-01-18 14:57:59.009430', 27, 22);
INSERT INTO `sys_role_menu` VALUES (1164, '2020-01-18 14:57:59.126996', '2020-01-18 14:57:59.126996', 27, 23);
INSERT INTO `sys_role_menu` VALUES (1165, '2020-01-18 14:57:59.226387', '2020-01-18 14:57:59.226387', 27, 24);
INSERT INTO `sys_role_menu` VALUES (1166, '2020-01-18 14:57:59.324691', '2020-01-18 14:57:59.324691', 27, 25);
INSERT INTO `sys_role_menu` VALUES (1167, '2020-01-18 14:57:59.434213', '2020-01-18 14:57:59.434213', 27, 26);
INSERT INTO `sys_role_menu` VALUES (1168, '2020-01-18 14:57:59.538841', '2020-01-18 14:57:59.538841', 27, 29);
INSERT INTO `sys_role_menu` VALUES (1169, '2020-01-18 14:57:59.638282', '2020-01-18 14:57:59.638282', 27, 30);
INSERT INTO `sys_role_menu` VALUES (1170, '2020-01-18 14:57:59.745029', '2020-01-18 14:57:59.745029', 27, 2);
INSERT INTO `sys_role_menu` VALUES (1171, '2020-01-18 14:57:59.845509', '2020-01-18 14:57:59.845509', 27, 28);
INSERT INTO `sys_role_menu` VALUES (1172, '2020-01-18 16:21:20.840827', '2020-01-18 16:21:20.840827', 31, 1);
INSERT INTO `sys_role_menu` VALUES (1173, '2020-01-18 16:21:20.927452', '2020-01-18 16:21:20.927452', 31, 53);
INSERT INTO `sys_role_menu` VALUES (1174, '2020-01-18 16:21:21.031470', '2020-01-18 16:21:21.031470', 31, 45);
INSERT INTO `sys_role_menu` VALUES (1175, '2020-01-18 16:21:21.150072', '2020-01-18 16:21:21.150072', 31, 43);
INSERT INTO `sys_role_menu` VALUES (1176, '2020-01-18 16:21:21.249210', '2020-01-18 16:21:21.249210', 31, 49);
INSERT INTO `sys_role_menu` VALUES (1177, '2020-01-18 16:21:21.335289', '2020-01-18 16:21:21.335289', 31, 27);
INSERT INTO `sys_role_menu` VALUES (1178, '2020-01-18 16:21:21.432042', '2020-01-18 16:21:21.432042', 31, 17);
INSERT INTO `sys_role_menu` VALUES (1179, '2020-01-18 16:21:21.538085', '2020-01-18 16:21:21.538085', 31, 59);
INSERT INTO `sys_role_menu` VALUES (1180, '2020-01-18 16:21:21.641298', '2020-01-18 16:21:21.641298', 31, 60);
INSERT INTO `sys_role_menu` VALUES (1181, '2020-01-18 16:21:21.727213', '2020-01-18 16:21:21.727213', 31, 61);
INSERT INTO `sys_role_menu` VALUES (1182, '2020-01-18 16:21:21.817164', '2020-01-18 16:21:21.817164', 31, 62);
INSERT INTO `sys_role_menu` VALUES (1183, '2020-01-18 16:21:21.916078', '2020-01-18 16:21:21.916078', 31, 63);
INSERT INTO `sys_role_menu` VALUES (1184, '2020-01-18 16:21:22.016313', '2020-01-18 16:21:22.016313', 31, 65);
INSERT INTO `sys_role_menu` VALUES (1185, '2020-01-18 16:21:22.100233', '2020-01-18 16:21:22.100233', 31, 18);
INSERT INTO `sys_role_menu` VALUES (1186, '2020-01-18 16:21:22.193411', '2020-01-18 16:21:22.193411', 31, 19);
INSERT INTO `sys_role_menu` VALUES (1187, '2020-01-18 16:21:22.290044', '2020-01-18 16:21:22.290044', 31, 20);
INSERT INTO `sys_role_menu` VALUES (1188, '2020-01-18 16:21:22.390495', '2020-01-18 16:21:22.390495', 31, 21);
INSERT INTO `sys_role_menu` VALUES (1189, '2020-01-18 16:21:22.476395', '2020-01-18 16:21:22.476395', 31, 8);
INSERT INTO `sys_role_menu` VALUES (1190, '2020-01-18 16:21:22.573599', '2020-01-18 16:21:22.573599', 31, 10);
INSERT INTO `sys_role_menu` VALUES (1191, '2020-01-18 16:21:22.671788', '2020-01-18 16:21:22.671788', 31, 11);
INSERT INTO `sys_role_menu` VALUES (1192, '2020-01-18 16:21:22.776534', '2020-01-18 16:21:22.776534', 31, 12);
INSERT INTO `sys_role_menu` VALUES (1193, '2020-01-18 16:21:22.860915', '2020-01-18 16:21:22.860915', 31, 13);
INSERT INTO `sys_role_menu` VALUES (1194, '2020-01-18 16:21:22.952658', '2020-01-18 16:21:22.952658', 31, 22);
INSERT INTO `sys_role_menu` VALUES (1195, '2020-01-18 16:21:23.054920', '2020-01-18 16:21:23.054920', 31, 23);
INSERT INTO `sys_role_menu` VALUES (1196, '2020-01-18 16:21:23.172532', '2020-01-18 16:21:23.172532', 31, 24);
INSERT INTO `sys_role_menu` VALUES (1197, '2020-01-18 16:21:23.276214', '2020-01-18 16:21:23.276214', 31, 25);
INSERT INTO `sys_role_menu` VALUES (1198, '2020-01-18 16:21:23.372288', '2020-01-18 16:21:23.372288', 31, 26);
INSERT INTO `sys_role_menu` VALUES (1199, '2020-01-18 16:21:23.479075', '2020-01-18 16:21:23.479075', 31, 2);
COMMIT;

-- ----------------------------
-- Table structure for sys_task
-- ----------------------------
DROP TABLE IF EXISTS `sys_task`;
CREATE TABLE `sys_task` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updateTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `name` varchar(255) NOT NULL,
  `cron` varchar(255) DEFAULT NULL,
  `limit` int(11) DEFAULT NULL,
  `every` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `startDate` datetime DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  `data` varchar(255) DEFAULT NULL,
  `service` varchar(255) DEFAULT NULL,
  `type` tinyint(4) NOT NULL DEFAULT '0',
  `repeatConf` varchar(1000) DEFAULT NULL,
  `nextRunTime` datetime DEFAULT NULL,
  `taskType` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `IDX_57ae639c0d4a32aa99fda3df77` (`createTime`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_task
-- ----------------------------
BEGIN;
INSERT INTO `sys_task` VALUES (91, '2019-12-10 10:13:16.837000', '2020-01-18 14:47:30.000000', '清理系统请求日志', '0 0 0 * * *', NULL, NULL, '每天0点执行', 1, NULL, NULL, NULL, 'sys.log.clear()', 0, '{\"count\":1,\"id\":\"91\",\"createTime\":\"2019-12-10 10:13:16\",\"updateTime\":\"2019-12-10 10:13:16\",\"name\":\"清理系统请求日志\",\"cron\":\"0 0 0 * * *\",\"remark\":\"每天0点执行\",\"status\":1,\"service\":\"sys.log.clear()\",\"type\":0,\"nextRunTime\":\"2019-12-11 00:00:00\",\"taskType\":0,\"jobId\":\"91\"}', '2020-01-19 00:00:00', 0);
INSERT INTO `sys_task` VALUES (92, '2019-12-10 10:27:42.657000', '2020-01-18 14:47:31.000000', '服务状态监控', '*/3 * * * * *', NULL, NULL, '每3秒获取一次服务状态信息', 1, NULL, NULL, NULL, 'sys.info.saveRecord()', 0, '{\"count\":1,\"id\":\"92\",\"createTime\":\"2019-12-10 10:27:42\",\"updateTime\":\"2019-12-10 12:53:58\",\"name\":\"服务状态监控\",\"cron\":\"*/3 * * * * *\",\"remark\":\"每3秒获取一次服务状态信息\",\"status\":1,\"service\":\"sys.info.saveRecord()\",\"type\":0,\"nextRunTime\":\"2019-12-10 13:36:00\",\"taskType\":0,\"jobId\":\"92\"}', '2020-01-18 16:39:57', 0);
COMMIT;

-- ----------------------------
-- Table structure for sys_task_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_task_log`;
CREATE TABLE `sys_task_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updateTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `taskId` bigint(20) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `detail` text,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `IDX_18c5af7cb8a1ccc671d077f6a0` (`createTime`) USING BTREE,
  KEY `IDX_46ad23dbfa00ffe8b33f0c3eae` (`taskId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=58092 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_task_log
-- ----------------------------
BEGIN;
INSERT INTO `sys_task_log` VALUES (58072, '2020-01-18 16:38:57.089704', '2020-01-18 16:38:57.089704', 92, 1, '');
INSERT INTO `sys_task_log` VALUES (58073, '2020-01-18 16:39:00.089967', '2020-01-18 16:39:00.089967', 92, 1, '');
INSERT INTO `sys_task_log` VALUES (58074, '2020-01-18 16:39:03.081259', '2020-01-18 16:39:03.081259', 92, 1, '');
INSERT INTO `sys_task_log` VALUES (58075, '2020-01-18 16:39:06.087128', '2020-01-18 16:39:06.087128', 92, 1, '');
INSERT INTO `sys_task_log` VALUES (58076, '2020-01-18 16:39:09.090727', '2020-01-18 16:39:09.090727', 92, 1, '');
INSERT INTO `sys_task_log` VALUES (58077, '2020-01-18 16:39:12.088810', '2020-01-18 16:39:12.088810', 92, 1, '');
INSERT INTO `sys_task_log` VALUES (58078, '2020-01-18 16:39:15.088220', '2020-01-18 16:39:15.088220', 92, 1, '');
INSERT INTO `sys_task_log` VALUES (58079, '2020-01-18 16:39:18.077830', '2020-01-18 16:39:18.077830', 92, 1, '');
INSERT INTO `sys_task_log` VALUES (58080, '2020-01-18 16:39:21.077776', '2020-01-18 16:39:21.077776', 92, 1, '');
INSERT INTO `sys_task_log` VALUES (58081, '2020-01-18 16:39:24.085413', '2020-01-18 16:39:24.085413', 92, 1, '');
INSERT INTO `sys_task_log` VALUES (58082, '2020-01-18 16:39:27.076293', '2020-01-18 16:39:27.076293', 92, 1, '');
INSERT INTO `sys_task_log` VALUES (58083, '2020-01-18 16:39:30.085676', '2020-01-18 16:39:30.085676', 92, 1, '');
INSERT INTO `sys_task_log` VALUES (58084, '2020-01-18 16:39:33.082182', '2020-01-18 16:39:33.082182', 92, 1, '');
INSERT INTO `sys_task_log` VALUES (58085, '2020-01-18 16:39:36.069606', '2020-01-18 16:39:36.069606', 92, 1, '');
INSERT INTO `sys_task_log` VALUES (58086, '2020-01-18 16:39:39.079416', '2020-01-18 16:39:39.079416', 92, 1, '');
INSERT INTO `sys_task_log` VALUES (58087, '2020-01-18 16:39:42.085137', '2020-01-18 16:39:42.085137', 92, 1, '');
INSERT INTO `sys_task_log` VALUES (58088, '2020-01-18 16:39:45.081444', '2020-01-18 16:39:45.081444', 92, 1, '');
INSERT INTO `sys_task_log` VALUES (58089, '2020-01-18 16:39:48.085446', '2020-01-18 16:39:48.085446', 92, 1, '');
INSERT INTO `sys_task_log` VALUES (58090, '2020-01-18 16:39:51.079373', '2020-01-18 16:39:51.079373', 92, 1, '');
INSERT INTO `sys_task_log` VALUES (58091, '2020-01-18 16:39:54.082980', '2020-01-18 16:39:54.082980', 92, 1, '');
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `passwordV` int(11) NOT NULL DEFAULT '1',
  `nickName` varchar(255) DEFAULT NULL,
  `headImg` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `createTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updateTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `username` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `departmentId` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `IDX_9e7164b2f1ea1348bc0eb0a7da` (`username`) USING BTREE,
  KEY `IDX_167ca903c7c3418b8a4376e1a4` (`createTime`) USING BTREE,
  KEY `IDX_7bef5cdb09432b1dfc46a063ce` (`phone`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` VALUES (1, '超级管理员', 'e10adc3949ba59abbe56e057f20f883e', 1, '超管', 'https://cool-admin-test.oss-cn-shenzhen.aliyuncs.com/20191112/66f601a0-04ed-11ea-a6c3-85aa43fd65db.gif', '123456@qq.com', '备注', 1, '2019-06-25 10:20:20.600461', '2019-11-12 09:40:27.000000', 'admin', '18000000000', 1);
INSERT INTO `sys_user` VALUES (16, '测试', '4297f44b13955235245b2497399d7a93', 1, '测试', NULL, NULL, NULL, 1, '2019-11-11 10:37:43.851039', '2020-01-18 15:21:54.000000', 'test', NULL, 1);
INSERT INTO `sys_user` VALUES (17, '阿', 'e10adc3949ba59abbe56e057f20f883e', 1, '123', NULL, NULL, NULL, 1, '2019-11-18 18:07:57.648144', '2019-11-18 18:07:57.648144', '123', NULL, 16);
INSERT INTO `sys_user` VALUES (18, '阿打算', 'e10adc3949ba59abbe56e057f20f883e', 1, '12312', NULL, NULL, NULL, 1, '2019-11-18 18:20:04.326660', '2019-11-18 18:20:04.326660', '3123', NULL, 13);
INSERT INTO `sys_user` VALUES (19, '33', 'e10adc3949ba59abbe56e057f20f883e', 1, '333', NULL, NULL, NULL, 1, '2019-11-19 00:02:27.390425', '2019-11-19 00:02:27.390425', '333', NULL, 17);
INSERT INTO `sys_user` VALUES (20, '测试部门权限', 'e10adc3949ba59abbe56e057f20f883e', 1, '测试部门权限昵称', NULL, NULL, NULL, 1, '2019-11-20 15:39:28.637665', '2019-11-20 15:39:28.637665', 'testdep', NULL, 1);
INSERT INTO `sys_user` VALUES (21, '测试部门权限2', 'e10adc3949ba59abbe56e057f20f883e', 1, '权限2昵称', NULL, NULL, NULL, 1, '2019-11-20 15:48:31.407260', '2019-11-20 15:48:31.407260', 'testdp2', NULL, 1);
COMMIT;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updateTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `userId` bigint(20) NOT NULL,
  `roleId` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `IDX_56d79fdd5342d2e35d7d9fec02` (`createTime`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_role` VALUES (1, '2019-09-11 23:05:18.890144', '2019-09-11 23:05:18.890144', 1, 1);
INSERT INTO `sys_user_role` VALUES (2, '2019-09-25 10:11:32.665042', '2019-09-25 10:11:32.665042', 2, 1);
INSERT INTO `sys_user_role` VALUES (5, '2019-10-12 17:21:20.139560', '2019-10-12 17:21:20.139560', 3, 22);
INSERT INTO `sys_user_role` VALUES (30, '2019-11-01 14:20:10.865935', '2019-11-01 14:20:10.865935', 5, 22);
INSERT INTO `sys_user_role` VALUES (31, '2019-11-01 14:20:10.872003', '2019-11-01 14:20:10.872003', 5, 1);
INSERT INTO `sys_user_role` VALUES (32, '2019-11-01 14:20:10.877348', '2019-11-01 14:20:10.877348', 5, 24);
INSERT INTO `sys_user_role` VALUES (37, '2019-11-02 17:11:07.717747', '2019-11-02 17:11:07.717747', 4, 1);
INSERT INTO `sys_user_role` VALUES (38, '2019-11-02 17:11:07.722790', '2019-11-02 17:11:07.722790', 4, 22);
INSERT INTO `sys_user_role` VALUES (39, '2019-11-02 17:11:07.727410', '2019-11-02 17:11:07.727410', 4, 23);
INSERT INTO `sys_user_role` VALUES (40, '2019-11-02 17:11:07.735471', '2019-11-02 17:11:07.735471', 4, 24);
INSERT INTO `sys_user_role` VALUES (44, '2019-11-04 17:50:35.158438', '2019-11-04 17:50:35.158438', 6, 22);
INSERT INTO `sys_user_role` VALUES (45, '2019-11-04 17:50:35.163856', '2019-11-04 17:50:35.163856', 6, 23);
INSERT INTO `sys_user_role` VALUES (51, '2019-11-05 22:35:14.306468', '2019-11-05 22:35:14.306468', 7, 22);
INSERT INTO `sys_user_role` VALUES (55, '2019-11-06 00:41:10.225544', '2019-11-06 00:41:10.225544', 9, 23);
INSERT INTO `sys_user_role` VALUES (56, '2019-11-06 00:41:10.230733', '2019-11-06 00:41:10.230733', 9, 22);
INSERT INTO `sys_user_role` VALUES (57, '2019-11-06 00:41:10.235927', '2019-11-06 00:41:10.235927', 9, 25);
INSERT INTO `sys_user_role` VALUES (58, '2019-11-06 00:41:10.240702', '2019-11-06 00:41:10.240702', 9, 1);
INSERT INTO `sys_user_role` VALUES (59, '2019-11-06 00:47:44.162575', '2019-11-06 00:47:44.162575', 10, 22);
INSERT INTO `sys_user_role` VALUES (60, '2019-11-06 00:47:44.167694', '2019-11-06 00:47:44.167694', 10, 23);
INSERT INTO `sys_user_role` VALUES (64, '2019-11-07 14:12:53.451430', '2019-11-07 14:12:53.451430', 12, 1);
INSERT INTO `sys_user_role` VALUES (71, '2019-11-10 08:58:15.413834', '2019-11-10 08:58:15.413834', 14, 27);
INSERT INTO `sys_user_role` VALUES (76, '2019-11-11 09:35:55.469018', '2019-11-11 09:35:55.469018', 13, 1);
INSERT INTO `sys_user_role` VALUES (77, '2019-11-11 09:35:55.474682', '2019-11-11 09:35:55.474682', 13, 27);
INSERT INTO `sys_user_role` VALUES (78, '2019-11-11 10:22:34.919093', '2019-11-11 10:22:34.919093', 15, 27);
INSERT INTO `sys_user_role` VALUES (79, '2019-11-11 10:22:34.926909', '2019-11-11 10:22:34.926909', 15, 28);
INSERT INTO `sys_user_role` VALUES (87, '2019-11-18 18:07:57.801548', '2019-11-18 18:07:57.801548', 17, 1);
INSERT INTO `sys_user_role` VALUES (88, '2019-11-18 18:20:04.464118', '2019-11-18 18:20:04.464118', 18, 27);
INSERT INTO `sys_user_role` VALUES (89, '2019-11-19 00:02:27.513399', '2019-11-19 00:02:27.513399', 19, 29);
INSERT INTO `sys_user_role` VALUES (90, '2019-11-20 15:39:28.649071', '2019-11-20 15:39:28.649071', 20, 29);
INSERT INTO `sys_user_role` VALUES (91, '2019-11-20 15:48:31.556205', '2019-11-20 15:48:31.556205', 21, 30);
INSERT INTO `sys_user_role` VALUES (95, '2020-01-18 15:22:05.080785', '2020-01-18 15:22:05.080785', 16, 28);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
