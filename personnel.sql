/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50623
Source Host           : localhost:3306
Source Database       : personnel

Target Server Type    : MYSQL
Target Server Version : 50623
File Encoding         : 65001

Date: 2018-03-20 17:47:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `auth`
-- ----------------------------
DROP TABLE IF EXISTS `auth`;
CREATE TABLE `auth` (
  `auth_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '权限id',
  `auth_code` varchar(255) DEFAULT NULL,
  `auth_name` varchar(255) DEFAULT NULL,
  `auth_http_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`auth_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth
-- ----------------------------
INSERT INTO `auth` VALUES ('1', 'personnel_list', '全部简历', '../personnel/personnel_list');
INSERT INTO `auth` VALUES ('2', 'personnel_seach', '搜索简历', '../personnel/personnel_search');
INSERT INTO `auth` VALUES ('3', 'personnel_update', '录入简历', '../personnel/update_jsp');
INSERT INTO `auth` VALUES ('4', 'user_manage', '用户管理', '../user/list');
INSERT INTO `auth` VALUES ('5', 'action_delete_personnel', '删除简历', null);

-- ----------------------------
-- Table structure for `personnel`
-- ----------------------------
DROP TABLE IF EXISTS `personnel`;
CREATE TABLE `personnel` (
  `personnel_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `nick_name` varchar(255) DEFAULT NULL,
  `sex` int(11) DEFAULT NULL COMMENT '0表示男  1表示女',
  `dob` datetime DEFAULT NULL COMMENT '出身日期',
  `email` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `mobile2` varchar(255) DEFAULT NULL,
  `home` varchar(255) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `current_salary` varchar(255) DEFAULT NULL,
  `expected_salary` varchar(255) DEFAULT NULL,
  `persent_city` varchar(11) DEFAULT NULL,
  `expected_city` varchar(255) DEFAULT NULL,
  `expected_position` varchar(255) DEFAULT NULL,
  `education` longtext,
  `working_experience` longtext,
  `working_ys` varchar(255) DEFAULT NULL,
  `english` varchar(255) DEFAULT NULL,
  `japanese` varchar(255) DEFAULT NULL,
  `korean` varchar(255) DEFAULT NULL,
  `academic` varchar(255) DEFAULT NULL,
  `english_level` varchar(255) DEFAULT NULL,
  `reminder` longtext,
  `skillset` varchar(255) DEFAULT NULL COMMENT '复选框，存数组[1,2]',
  `industry` varchar(255) DEFAULT NULL COMMENT '复选框，存数组[1,2]',
  `it_service` varchar(255) DEFAULT NULL COMMENT '复选框，存数组[1,2]',
  `develop` varchar(255) DEFAULT NULL COMMENT '复选框，存数组[1,2]',
  `personnel_sql` varchar(255) DEFAULT NULL COMMENT '复选框，存数组[1,2]',
  `oracle_skill` varchar(255) DEFAULT NULL COMMENT '复选框，存数组[1,2]',
  `create_user` int(11) DEFAULT NULL COMMENT '那个用户建立的该简历',
  `resource_id` bigint(20) DEFAULT NULL COMMENT '对应的简历文件id',
  PRIMARY KEY (`personnel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=266 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of personnel
-- ----------------------------
INSERT INTO `personnel` VALUES ('166', 'name0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('167', 'name1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('168', 'name2', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('169', 'name3', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('170', 'name4', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('171', 'name5', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('172', 'name6', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('173', 'name7', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('174', 'name8', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('175', 'name9', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('176', 'name10', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('177', 'name11', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('178', 'name12', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('179', 'name13', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('180', 'name14', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('181', 'name15', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('182', 'name16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('183', 'name17', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('184', 'name18', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('185', 'name19', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('186', 'name20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('187', 'name21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('188', 'name22', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('189', 'name23', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('190', 'name24', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('191', 'name25', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('192', 'name26', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('193', 'name27', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('194', 'name28', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('195', 'name29', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('196', 'name30', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('197', 'name31', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('198', 'name32', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('199', 'name33', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('200', 'name34', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('201', 'name35', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('202', 'name36', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('203', 'name37', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('204', 'name38', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('205', 'name39', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('206', 'name40', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('207', 'name41', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('208', 'name42', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('209', 'name43', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('210', 'name44', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('211', 'name45', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('212', 'name46', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('213', 'name47', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('214', 'name48', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('215', 'name49', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('216', 'name50', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('217', 'name51', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('218', 'name52', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('219', 'name53', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('220', 'name54', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('221', 'name55', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('222', 'name56', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('223', 'name57', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('224', 'name58', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('225', 'name59', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('226', 'name60', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('227', 'name61', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('228', 'name62', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('229', 'name63', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('230', 'name64', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('231', 'name65', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('232', 'name66', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('233', 'name67', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('234', 'name68', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('235', 'name69', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('236', 'name70', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('237', 'name71', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('238', 'name72', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('239', 'name73', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('240', 'name74', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('241', 'name75', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('242', 'name76', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('243', 'name77', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('244', 'name78', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('245', 'name79', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('246', 'name80', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('247', 'name81', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('248', 'name82', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('249', 'name83', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('250', 'name84', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('251', 'name85', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('252', 'name86', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('253', 'name87', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('254', 'name88', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('255', 'name89', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('256', 'name90', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('257', 'name91', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('258', 'name92', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('259', 'name93', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('260', 'name94', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('261', 'name95', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('262', 'name96', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('263', 'name97', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('264', 'name98', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `personnel` VALUES ('265', 'name99', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `personnel_chat`
-- ----------------------------
DROP TABLE IF EXISTS `personnel_chat`;
CREATE TABLE `personnel_chat` (
  `chat_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'hr对每份简历作出的记录说明  一份简历对应很多记录说明',
  `user_id` int(11) DEFAULT NULL COMMENT '谁评价的',
  `content` text COMMENT '评价内容',
  `create_time` datetime DEFAULT NULL,
  `personnel_id` bigint(20) DEFAULT NULL COMMENT '对应的简历id',
  PRIMARY KEY (`chat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of personnel_chat
-- ----------------------------
INSERT INTO `personnel_chat` VALUES ('1', '1', '哈哈哈哈', '2017-12-06 18:45:13', '1');
INSERT INTO `personnel_chat` VALUES ('2', '1', '的点点滴滴多多多多多多多多多多多多多多多多多多多多我我我我我我我我我我我我我我我我我我我我我我我我我我我我我我我哈哈哈哈  ', '2017-12-06 20:53:01', '1');
INSERT INTO `personnel_chat` VALUES ('3', '1', '哈哈哈哈哈', '2017-12-06 21:03:18', '1');
INSERT INTO `personnel_chat` VALUES ('4', '1', '恩恩额', '2017-12-06 21:04:03', '1');
INSERT INTO `personnel_chat` VALUES ('5', '1', '我我我', '2017-12-06 21:05:12', '1');
INSERT INTO `personnel_chat` VALUES ('6', '1', 'zhangyu2017-11-28:', '2017-12-06 22:47:46', '1');
INSERT INTO `personnel_chat` VALUES ('7', null, 'zhangyu2017-11-28:', null, null);
INSERT INTO `personnel_chat` VALUES ('8', null, 'zhangyu2017-11-28:也一样', null, null);
INSERT INTO `personnel_chat` VALUES ('9', null, 'zhangyu2017-11-28:好的', null, null);
INSERT INTO `personnel_chat` VALUES ('10', null, 'zhangyu2017-11-28:好的', null, null);
INSERT INTO `personnel_chat` VALUES ('11', null, 'zhangyu2017-11-28:', null, null);
INSERT INTO `personnel_chat` VALUES ('12', null, 'zhangyu2017-11-28:哈哈哈', null, null);
INSERT INTO `personnel_chat` VALUES ('13', null, 'zhangyu2017-11-28:', null, null);
INSERT INTO `personnel_chat` VALUES ('14', null, 'zhangyu2017-11-28:好点的多多', null, null);
INSERT INTO `personnel_chat` VALUES ('15', null, 'zhangyu2017-11-28:', null, null);
INSERT INTO `personnel_chat` VALUES ('16', null, 'zhangyu2017-11-28:', null, null);
INSERT INTO `personnel_chat` VALUES ('17', null, 'zhangyu2017-11-28:', null, null);
INSERT INTO `personnel_chat` VALUES ('18', null, 'zhangyu2017-11-28:', null, null);
INSERT INTO `personnel_chat` VALUES ('19', null, 'zhangyu2017-11-28:', null, null);
INSERT INTO `personnel_chat` VALUES ('20', null, 'zhangyu2017-11-28:', null, null);
INSERT INTO `personnel_chat` VALUES ('21', null, 'zhangyu2017-11-28:', null, null);
INSERT INTO `personnel_chat` VALUES ('22', null, 'zhangyu2017-11-28:', null, null);
INSERT INTO `personnel_chat` VALUES ('23', null, 'zhangyu2017-11-28:', null, null);
INSERT INTO `personnel_chat` VALUES ('24', null, 'zhangyu2017-11-28:', null, null);
INSERT INTO `personnel_chat` VALUES ('25', '3', 'zhangyu2017-11-28:', null, '1');
INSERT INTO `personnel_chat` VALUES ('26', '3', 'zhangyu2017-11-28:', null, '1');
INSERT INTO `personnel_chat` VALUES ('27', '3', 'zhangyu2017-11-28:', null, '1');
INSERT INTO `personnel_chat` VALUES ('28', '3', 'zhangyu2017-11-28:', null, '1');
INSERT INTO `personnel_chat` VALUES ('29', '3', 'zhangyu2017-11-285555555555555:', null, '1');
INSERT INTO `personnel_chat` VALUES ('30', '3', 'zhangyu2017-11-285555555555555:', null, '1');
INSERT INTO `personnel_chat` VALUES ('31', '3', 'zhangyu2017-11-285555555555555:', null, '1');
INSERT INTO `personnel_chat` VALUES ('32', '3', 'zhangyu2017-11-285555555555555:', null, '1');
INSERT INTO `personnel_chat` VALUES ('33', '3', 'zhangyu2017-11-285555555555555:也一样', null, '1');
INSERT INTO `personnel_chat` VALUES ('34', '3', 'zhangyu2017-11-285555555555555:可以的', null, '1');
INSERT INTO `personnel_chat` VALUES ('35', '3', 'zhangyu2017-11-285555555555555:44444', '2017-12-10 00:03:04', '1');
INSERT INTO `personnel_chat` VALUES ('36', '3', '人人人人人若日日日日日日人   日日日人 人', '2017-12-10 00:04:41', '1');
INSERT INTO `personnel_chat` VALUES ('37', '3', '好的', '2017-12-10 00:13:50', '1');
INSERT INTO `personnel_chat` VALUES ('38', '3', '发发发', '2017-12-10 00:19:56', '1');
INSERT INTO `personnel_chat` VALUES ('39', '3', '888888888888888888888888', '2017-12-10 00:25:08', '1');
INSERT INTO `personnel_chat` VALUES ('40', '3', '好的  过两天联系', '2017-12-10 00:26:59', '1');
INSERT INTO `personnel_chat` VALUES ('41', '3', '下周约面试', '2017-12-10 00:56:46', '1');
INSERT INTO `personnel_chat` VALUES ('42', '3', '可以邀约', '2017-12-10 21:40:04', '30');
INSERT INTO `personnel_chat` VALUES ('43', '3', '问下什么时间可以约谈', '2017-12-10 21:40:25', '30');
INSERT INTO `personnel_chat` VALUES ('44', '3', '可以也', '2017-12-11 10:15:46', '38');
INSERT INTO `personnel_chat` VALUES ('45', '3', '111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111', '2017-12-11 10:16:15', '38');
INSERT INTO `personnel_chat` VALUES ('46', '3', '好啊哈哈哈啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊 啊啊啊啊啊', '2017-12-11 10:31:34', '38');
INSERT INTO `personnel_chat` VALUES ('47', '3', '好的  打电话已经联系过了  明天下午三点有时间', '2017-12-11 10:35:35', '42');
INSERT INTO `personnel_chat` VALUES ('48', '3', '天天', '2017-12-29 09:56:22', '46');
INSERT INTO `personnel_chat` VALUES ('49', '3', '灌灌灌灌', '2017-12-31 20:07:03', '47');
INSERT INTO `personnel_chat` VALUES ('50', '3', 'ddddd', '2017-12-31 21:42:41', '47');
INSERT INTO `personnel_chat` VALUES ('51', '3', 'jj ', '2017-12-31 21:45:43', '46');
INSERT INTO `personnel_chat` VALUES ('52', '3', 'jj ', '2017-12-31 21:50:19', '46');
INSERT INTO `personnel_chat` VALUES ('53', '3', 'hahahhah\n', '2018-02-27 10:54:44', '60');

-- ----------------------------
-- Table structure for `resource`
-- ----------------------------
DROP TABLE IF EXISTS `resource`;
CREATE TABLE `resource` (
  `resource_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `resource_name` varchar(255) DEFAULT NULL COMMENT '简历名称',
  `resource_type` varchar(255) DEFAULT NULL COMMENT '简历类型',
  `resource_http_path` varchar(255) DEFAULT NULL,
  `resource_disk_path` varchar(255) DEFAULT NULL,
  `pdf_http_path` varchar(255) DEFAULT NULL COMMENT '将docx转换成pdf',
  `pdf_disk_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`resource_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of resource
-- ----------------------------
INSERT INTO `resource` VALUES ('1', 'uploadfile', null, null, 'f://testhahahah/1512902410264.jpg', null, null);
INSERT INTO `resource` VALUES ('2', 'uploadfile', null, 'http://127.0.0.1:8080/uploadFiles/1512903128915.jpg', 'f://testhahahah/1512903128915.jpg', null, null);
INSERT INTO `resource` VALUES ('3', 'uploadfile', null, 'http://127.0.0.1:8080/uploadFiles/1512903440317.jpg', 'f://testhahahah/1512903440317.jpg', null, null);
INSERT INTO `resource` VALUES ('4', 'uploadfile', null, 'http://127.0.0.1:8080/uploadFiles/1512903818560.jpg', 'f://testhahahah/1512903818560.jpg', null, null);
INSERT INTO `resource` VALUES ('5', 'uploadfile', null, 'http://127.0.0.1:8080/uploadFiles/1512903992958.jpg', 'f://testhahahah/1512903992958.jpg', null, null);
INSERT INTO `resource` VALUES ('6', 'uploadfile', null, 'http://127.0.0.1:8080/uploadFiles/1512904517568.jpg', 'f://testhahahah/1512904517568.jpg', null, null);
INSERT INTO `resource` VALUES ('7', 'top.jpg', null, 'http://127.0.0.1:8080/uploadFiles/1512905919697.jpg', 'f://testhahahah/1512905919697.jpg', null, null);
INSERT INTO `resource` VALUES ('8', '22.jpg', null, 'http://127.0.0.1:8080/uploadFiles/1512906164346.jpg', 'f://testhahahah/1512906164346.jpg', null, null);
INSERT INTO `resource` VALUES ('9', 'top.jpg', null, 'http://127.0.0.1:8080/uploadFiles/1512906210032.jpg', 'f://testhahahah/1512906210032.jpg', null, null);
INSERT INTO `resource` VALUES ('10', '22.jpg', null, 'http://127.0.0.1:8080/uploadFiles/1512910988100.jpg', 'f://testhahahah/1512910988100.jpg', null, null);
INSERT INTO `resource` VALUES ('11', 'top.jpg', null, 'http://127.0.0.1:8080/uploadFiles/1512911011234.jpg', 'f://testhahahah/1512911011234.jpg', null, null);
INSERT INTO `resource` VALUES ('12', '22.jpg', null, 'http://127.0.0.1:8080/uploadFiles/1512921473795.jpg', 'f://testhahahah/1512921473795.jpg', null, null);
INSERT INTO `resource` VALUES ('13', 'æä»¶.docx', null, 'http://127.0.0.1:8080/uploadFiles/1512957396825.docx', 'f://testhahahah/1512957396825.docx', null, null);
INSERT INTO `resource` VALUES ('14', '文件.docx', null, 'http://127.0.0.1:8080/uploadFiles/1512957863920.docx', 'f://testhahahah/1512957863920.docx', null, null);
INSERT INTO `resource` VALUES ('15', '文件.docx', null, 'http://127.0.0.1:8080/uploadFiles/1512959676286.docx', 'f://testhahahah/1512959676286.docx', null, null);
INSERT INTO `resource` VALUES ('16', 'top.jpg', null, 'http://127.0.0.1:8080/uploadFiles/1512976021618.jpg', 'f://testhahahah/1512976021618.jpg', null, null);

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_account` varchar(255) DEFAULT NULL,
  `pwd` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('3', 'root', '123456', null);
INSERT INTO `user` VALUES ('10', '123', '123', null);
INSERT INTO `user` VALUES ('11', 'hahah', 'aaa', null);

-- ----------------------------
-- Table structure for `user_auth`
-- ----------------------------
DROP TABLE IF EXISTS `user_auth`;
CREATE TABLE `user_auth` (
  `user_auth_id` int(11) NOT NULL AUTO_INCREMENT,
  `auth_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_auth_id`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_auth
-- ----------------------------
INSERT INTO `user_auth` VALUES ('111', '1', '3');
INSERT INTO `user_auth` VALUES ('112', '2', '3');
INSERT INTO `user_auth` VALUES ('113', '3', '3');
INSERT INTO `user_auth` VALUES ('114', '4', '3');
INSERT INTO `user_auth` VALUES ('115', '5', '3');
INSERT INTO `user_auth` VALUES ('125', '1', '10');
INSERT INTO `user_auth` VALUES ('126', '2', '10');
INSERT INTO `user_auth` VALUES ('127', '3', '10');
INSERT INTO `user_auth` VALUES ('128', '4', '10');
