/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50716
Source Host           : localhost:3306
Source Database       : order

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2018-03-30 14:16:37
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `id` int(11) NOT NULL,
  `departmentName` varchar(255) DEFAULT NULL COMMENT '部门',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('1', '管理层');
INSERT INTO `department` VALUES ('2', '行政部');
INSERT INTO `department` VALUES ('3', '品牌部');
INSERT INTO `department` VALUES ('4', '技术部');
INSERT INTO `department` VALUES ('5', '商务部');
INSERT INTO `department` VALUES ('6', '财务部');

-- ----------------------------
-- Table structure for records
-- ----------------------------
DROP TABLE IF EXISTS `records`;
CREATE TABLE `records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createDate` datetime DEFAULT NULL,
  `dId` int(11) DEFAULT NULL,
  `uId` int(11) DEFAULT NULL,
  `foodCount` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of records
-- ----------------------------
INSERT INTO `records` VALUES ('1', '2018-03-15 17:05:33', '1', '1', '2');
INSERT INTO `records` VALUES ('2', '2018-03-28 17:07:48', '1', '1', '1');
INSERT INTO `records` VALUES ('3', '2018-03-28 17:09:05', '1', '1', '1');
INSERT INTO `records` VALUES ('4', '2018-03-28 17:09:09', '1', '1', '1');
INSERT INTO `records` VALUES ('5', '2018-03-28 17:11:59', '4', '14', '1');
INSERT INTO `records` VALUES ('6', '2018-03-28 19:15:51', '1', '1', '1');
INSERT INTO `records` VALUES ('7', '2018-03-29 08:12:52', '1', '1', '3');
INSERT INTO `records` VALUES ('8', '2018-03-29 08:13:19', '1', '1', '3');
INSERT INTO `records` VALUES ('9', '2018-03-29 08:15:17', '1', '1', '1');
INSERT INTO `records` VALUES ('10', '2018-03-29 08:16:06', '1', '1', '4');
INSERT INTO `records` VALUES ('11', '2018-03-29 08:16:19', '1', '2', '4');
INSERT INTO `records` VALUES ('12', '2018-03-29 08:22:22', '1', '2', '1');
INSERT INTO `records` VALUES ('13', '2018-03-29 08:46:37', '2', '3', '1');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL COMMENT '用户名称',
  `d_id` int(11) DEFAULT NULL COMMENT '部门ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', '陈功', '1');
INSERT INTO `users` VALUES ('2', '陈法明', '1');
INSERT INTO `users` VALUES ('3', '张珊珊', '2');
INSERT INTO `users` VALUES ('4', '姚颖', '2');
INSERT INTO `users` VALUES ('5', '袁艺璇', '2');
INSERT INTO `users` VALUES ('6', '文思弋', '3');
INSERT INTO `users` VALUES ('7', '李卓', '3');
INSERT INTO `users` VALUES ('8', '江梦舲', '3');
INSERT INTO `users` VALUES ('9', '鲁嘉舟', '4');
INSERT INTO `users` VALUES ('10', '曾杰', '4');
INSERT INTO `users` VALUES ('11', '胡宽', '4');
INSERT INTO `users` VALUES ('12', '盛旺', '4');
INSERT INTO `users` VALUES ('13', '彭百强', '4');
INSERT INTO `users` VALUES ('14', '王涛涛', '4');
INSERT INTO `users` VALUES ('15', '邢凡波', '4');
INSERT INTO `users` VALUES ('16', '文森琦', '4');
INSERT INTO `users` VALUES ('17', '唐昌登', '4');
INSERT INTO `users` VALUES ('18', '王超', '4');
INSERT INTO `users` VALUES ('19', '汤豪杰', '5');
INSERT INTO `users` VALUES ('20', '张璋', '5');
INSERT INTO `users` VALUES ('21', '黄彦菲', '5');
INSERT INTO `users` VALUES ('22', '梁小龙', '5');
INSERT INTO `users` VALUES ('23', '朱唯澳', '5');
INSERT INTO `users` VALUES ('24', '卢玮环', '5');
INSERT INTO `users` VALUES ('25', '周桂芳', '5');
INSERT INTO `users` VALUES ('26', '杨胜前', '5');
INSERT INTO `users` VALUES ('27', '潘菊霞', '5');
INSERT INTO `users` VALUES ('28', '肖雨婷', '6');
INSERT INTO `users` VALUES ('29', '黎也', '6');
