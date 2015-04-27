/*
Navicat MySQL Data Transfer

Source Server         : bms
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : bms

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2015-04-28 00:20:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cm_contract
-- ----------------------------
DROP TABLE IF EXISTS `cm_contract`;
CREATE TABLE `cm_contract` (
  `id` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `trusteeId` int(11) DEFAULT NULL,
  `entrusteId` int(11) DEFAULT NULL,
  `signTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `projectId` int(11) DEFAULT NULL,
  `money` varchar(50) DEFAULT NULL,
  `signPlace` varchar(80) DEFAULT NULL,
  `startTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `endTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `summary` varchar(255) DEFAULT NULL,
  `attachmentIds` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cm_contract
-- ----------------------------
INSERT INTO `cm_contract` VALUES ('12', '安徽皖通科技,蜀山监狱综合业务平台维护合同', '001239299', '8', '8', '2014-06-27 00:00:00', '15', '20000元', '22222', '2014-06-27 00:00:00', '2014-06-27 00:00:00', '2年内,参与系统的维护,故障处理,技术支持等工作', '');
INSERT INTO `cm_contract` VALUES ('13', '皖通科技,省局有关指挥调度平台维护合同', '003429812', '8', '8', '2014-06-27 00:00:00', '15', '30000元', 'aaaa', '2014-06-27 00:00:00', '2014-06-27 00:00:00', '期限内,系统维护,技术支持等', '9db62fc5619246f6bca37ea7010b077d');

-- ----------------------------
-- Table structure for cm_merchant
-- ----------------------------
DROP TABLE IF EXISTS `cm_merchant`;
CREATE TABLE `cm_merchant` (
  `id` int(11) DEFAULT NULL,
  `dictionary_id` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `bank` varchar(50) DEFAULT NULL,
  `account` varchar(50) DEFAULT NULL,
  `tax` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `website` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `postCode` varchar(30) DEFAULT NULL,
  `contact` varchar(30) DEFAULT NULL,
  `officeNumber` varchar(30) DEFAULT NULL,
  `faxNumber` varchar(30) DEFAULT NULL,
  `mobilePhone` varchar(30) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `extCol1` varchar(200) DEFAULT NULL,
  `extCol2` varchar(200) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cm_merchant
-- ----------------------------
INSERT INTO `cm_merchant` VALUES ('8', '10', '北京思科', '3401002', '中国银行', '62220218234587', '32424', 'fdfa@sina.com', 'www.sisoco.com', '北京市朝阳区', '100002', '吴英实', '0551-65347877', '0551-34567788', '1832123313', '', null, null);
INSERT INTO `cm_merchant` VALUES ('9', '10', '皖通科技', '3401001', '中国工商银行', '6223242424329801', '32432', 'wada@hotmai.com', 'www.wada.com', '合肥市高新区皖水路389号', '340088', '李家红', '0551-65392039', '', '13875434532', '', null, null);
INSERT INTO `cm_merchant` VALUES ('10', '48', '神舟数码', '3401003', '中国建设银行', '3498747564849573221', '34002200', 'dvn@126.com', ' http://www.dcn.com', '中国北京', '100001', '李闻凯', '0551-65347878', '', '13578794933', '', null, null);

-- ----------------------------
-- Table structure for cm_project
-- ----------------------------
DROP TABLE IF EXISTS `cm_project`;
CREATE TABLE `cm_project` (
  `id` int(11) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `dictionary_id` int(11) DEFAULT NULL,
  `projectMangerId` int(11) DEFAULT NULL,
  `projectAmount` varchar(30) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `startDT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `endDT` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `checkDT` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `merchantId` int(11) DEFAULT NULL,
  `contactPerson` varchar(50) DEFAULT NULL,
  `contactPhone` varchar(30) DEFAULT NULL,
  `summry` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `attachmentIds` varchar(200) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cm_project
-- ----------------------------
INSERT INTO `cm_project` VALUES ('15', '340120001', '27', '3', '90000.00元', '心理矫治管理服务平台建设项目', '2014-06-27 00:00:00', '2014-06-27 00:00:00', '2014-06-27 00:00:00', '9', 'aaaaa', '32323', '建设系统平台。', null, '53deff571eac4461a5e6765ada3f6d27,263306b973814ad4882e48a483147314');
INSERT INTO `cm_project` VALUES ('16', '340120002', '27', '3', '1440000.00', '指挥调度开发项目', '2012-06-30 00:00:00', '2014-06-30 00:00:00', '2014-06-30 00:00:00', '8', '孙思', '13478766735', 'bbbbbbbbbbbbb', null, '761545edc60946a695ab4a7c4f0a575e,f75b9630b37b48b280de87020d0073e4');

-- ----------------------------
-- Table structure for cm_software
-- ----------------------------
DROP TABLE IF EXISTS `cm_software`;
CREATE TABLE `cm_software` (
  `id` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `projectId` int(11) DEFAULT NULL,
  `softwareVendorId` int(11) DEFAULT NULL,
  `contactDeveloperId` int(11) DEFAULT NULL,
  `maintenanceServiceId` int(11) DEFAULT NULL,
  `maintenancePMId` int(11) DEFAULT NULL,
  `enableTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `state` int(11) DEFAULT NULL,
  `maintenancePeriod` varchar(50) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `attachmentIds` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cm_software
-- ----------------------------
INSERT INTO `cm_software` VALUES ('4', '安徽省监狱指挥调度管理平台', '15', '9', '3', '9', '7', '2014-06-30 00:00:00', '1', '4', '222222222222', '91d6c1b5d5c64b508cf5304d774bf439');
INSERT INTO `cm_software` VALUES ('5', '4343', '15', '8', '3', '8', '3', '2014-10-01 00:00:00', '1', '434', '', '');

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `companyName` varchar(50) DEFAULT NULL,
  `servicePhone` varchar(20) DEFAULT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `contactPerson` varchar(20) DEFAULT NULL,
  `contactPhone` varchar(20) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  `id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('保税区地税局', '400-800-9485', '83938485', '张思德', '13212564534', '', '2');
INSERT INTO `customer` VALUES ('易思博', '400-800-9486', '83938486', '张兵', '15219285647', '', '3');

-- ----------------------------
-- Table structure for dm_pointinspect
-- ----------------------------
DROP TABLE IF EXISTS `dm_pointinspect`;
CREATE TABLE `dm_pointinspect` (
  `id` int(11) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `attachmentIds` varchar(255) DEFAULT NULL,
  `createDT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `userId` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dm_pointinspect
-- ----------------------------
INSERT INTO `dm_pointinspect` VALUES ('2', '省局日常维护', '', '2014-07-08 00:00:00', '1');
INSERT INTO `dm_pointinspect` VALUES ('3', '蜀山监狱日常维护', 'aaeb2ad16f0844cf89f754220e4fa2ed,b6d496a54bdb471fade7c0a6943bb8d8,39cd4f58e05247249c831389550cb95f,0d8e640a674e41a892984f2994072403,7b9a713305cb4394bc2bfcab80428427,75ea801f4e5b49d0b1ad689eee6aaeef,86961d0dffce43e3be9aa5be682c89ef,32c752c45f4b401baebf3288', '2014-07-08 00:00:00', '1');
INSERT INTO `dm_pointinspect` VALUES ('4', '省局安防平台维护', '5bfb339a763f4d21936a1fedebc3cddf', '2014-07-08 00:00:00', '1');

-- ----------------------------
-- Table structure for dm_task
-- ----------------------------
DROP TABLE IF EXISTS `dm_task`;
CREATE TABLE `dm_task` (
  `id` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `sendUserId` int(11) DEFAULT NULL,
  `acceptUserId` int(11) DEFAULT NULL,
  `place` varchar(100) DEFAULT NULL,
  `excuteDT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `sendDT` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `acceptDT` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `startTime` varchar(30) DEFAULT NULL,
  `endTime` varchar(30) DEFAULT NULL,
  `taskTypeId` int(11) DEFAULT NULL,
  `taskModule` varchar(100) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `charge` int(11) DEFAULT NULL,
  `money` varchar(50) DEFAULT NULL,
  `contractId` int(11) DEFAULT NULL,
  `taskState` int(11) DEFAULT NULL,
  `describle` longtext,
  `taskdetail` longtext,
  `handlerProcess` longtext,
  `handlerResult` varchar(255) DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL,
  `attachmentIds` varchar(200) DEFAULT NULL,
  `contactPhone` varchar(50) DEFAULT NULL,
  `contactUser` varchar(100) DEFAULT NULL,
  `documented` int(11) DEFAULT NULL,
  `chargeState` int(11) DEFAULT NULL,
  `InvoiceState` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dm_task
-- ----------------------------
INSERT INTO `dm_task` VALUES ('7', '省局安防平台维护', '1', '9', '1111111111', '2014-07-07 00:00:00', '2014-07-12 10:15:00', '2014-07-12 13:36:00', '08:30', '17:30', '39', '1111', '1', '0', null, '13', '4', '服务器起不了', '检查原因,并启动服务', null, null, null, '', '1111111111111', '11111', '1', '0', '0');
INSERT INTO `dm_task` VALUES ('12', '蜀山监狱指挥调试平台维护', '1', '9', '蜀山监狱', '2014-07-07 00:00:00', '2014-07-12 11:15:00', '2014-07-12 13:36:00', '08:30', '17:30', '39', '433', '1', '1', '3', '12', '4', '33', '3', '完成服务的重启,调试等', '已经完成', '', '', '3', '3', '1', '0', '1');
INSERT INTO `dm_task` VALUES ('13', '省局安防平台维护', '1', '11', '安徽省监狱管理局', '2014-07-14 00:00:00', '2014-07-12 11:15:00', '2014-07-12 13:36:00', '08:30', '17:30', '38', '平台登录不了', '2', '0', null, '13', '2', '', '', '', null, null, '', '', '', '0', '0', '0');
INSERT INTO `dm_task` VALUES ('14', '蜀山监狱指挥调度平台,服务器挂了', '1', '13', '蜀山监狱', '2014-07-16 00:00:00', '2014-07-12 11:15:00', '2014-07-12 13:36:00', '08:30', '17:30', '38', '服务器', '1', '0', null, '12', '2', '蜀山监狱指挥调度平台,服务器挂了', '开启服务器,保证服务器持续运行一天没有问题,任务完成', '', null, null, '', '', '', '0', '0', '0');
INSERT INTO `dm_task` VALUES ('15', '蜀山监狱指挥调度平台,服务器反应慢,卡机', '1', '14', '蜀山监狱', '2014-07-16 00:00:00', '2014-07-12 11:15:00', '2014-07-12 13:36:00', '08:30', '17:30', '38', '服务器', '1', '0', null, '12', '2', '蜀山监狱指挥调度平台,服务器慢', '查找原因,解决问题', '', null, null, '', '', '', '0', '0', '0');
INSERT INTO `dm_task` VALUES ('16', '蜀山监狱指挥调度平台,视频看不了,上墙有问题', '1', '11', '蜀山监狱', '2014-07-16 00:00:00', '2014-07-12 11:15:00', '2014-07-12 13:36:00', '08:30', '17:30', '38', '视频', '1', '0', null, '12', '2', '蜀山监狱指挥调度平台,视频看不了,上墙有问题', '查找原因,使视频可以看', '', null, null, '', '', '', '0', '0', '0');
INSERT INTO `dm_task` VALUES ('17', '省局安防平台周期性维护', '1', '9', '安徽省监狱管理局', '2014-07-18 00:00:00', '2014-07-18 13:04:14', '2014-07-18 13:04:47', '08:30', '17:30', '38', '服务器', '1', '0', null, '12', '3', '服务器起不来', '启动服务器', '111', '11', '1111', '', '', '', '1', '0', '0');
INSERT INTO `dm_task` VALUES ('18', '蜀山监狱指挥调度平台,视频不清', '1', '9', '蜀山监狱', '2014-07-19 00:00:00', '2014-07-18 13:21:14', '2015-04-27 00:42:26', '08:30', '17:30', '38', '视频', '1', '0', null, '12', '1', '', '', null, null, null, '', '', '', '0', '0', '0');

-- ----------------------------
-- Table structure for dm_taskschedule
-- ----------------------------
DROP TABLE IF EXISTS `dm_taskschedule`;
CREATE TABLE `dm_taskschedule` (
  `id` int(11) DEFAULT NULL,
  `taskId` int(11) DEFAULT NULL,
  `addTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `userId` int(11) DEFAULT NULL,
  `endDT` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `excuteDT` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sheduleType` int(11) DEFAULT NULL,
  `sheduleAdvice` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `autoArrange` int(11) DEFAULT NULL,
  `startDT` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dm_taskschedule
-- ----------------------------
INSERT INTO `dm_taskschedule` VALUES ('4', '7', '2014-07-07 10:39:40', '1', '2014-07-18 00:00:00', '2014-07-08 00:00:00', '1', '2', '0', '0', '2014-07-17 00:00:00');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `unit` varchar(20) DEFAULT NULL,
  `standard` varchar(20) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `orderPrice1` double DEFAULT NULL,
  `orderPrice2` double DEFAULT NULL,
  `orderPrice3` double DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  `dictionary_id` varchar(32) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('2', '禾珠大米', 'kg', '', '55', null, null, null, '', '51');
INSERT INTO `goods` VALUES ('3', '北田大米', 'kg', '', '22', null, null, null, '', '51');
INSERT INTO `goods` VALUES ('4', '益福中国香米', 'kg', '', '10.5', null, null, null, '', '51');
INSERT INTO `goods` VALUES ('5', '苹果', 'kg', '', '32', null, null, null, '', '50');
INSERT INTO `goods` VALUES ('7', '西瓜', 'kg', '', '2.5', null, null, null, '', '50');
INSERT INTO `goods` VALUES ('8', '鸭蛋', 'kg', '', '15', null, null, null, '', '53');

-- ----------------------------
-- Table structure for kc_article
-- ----------------------------
DROP TABLE IF EXISTS `kc_article`;
CREATE TABLE `kc_article` (
  `id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `html` longtext,
  `createDT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createUserID` int(11) DEFAULT NULL,
  `publish` int(11) DEFAULT NULL,
  `zd` int(11) DEFAULT NULL,
  `numberOfScan` int(11) DEFAULT NULL,
  `dictionary_id` int(11) DEFAULT NULL,
  `attachmentIds` varchar(255) DEFAULT NULL,
  `publishDT` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updateDT` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kc_article
-- ----------------------------
INSERT INTO `kc_article` VALUES ('46', '端午节放假通知', '1', '<p style=\"text-align:center;\">\r\n	<span style=\"font-size:24px;\">通知</span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:16px;\">? ? ? ?端午节放假时间为周一到周三，请大家做好工作安排，假期请大家保障通讯设备畅通。假期愉快！！！</span> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	胡艺峰 ? ? ? ? ? ? ? ? ? ?? ? ? ?\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	2014.7.1 ? ? ? ? ? ? ? ? ? ? ? ??\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>', '2014-07-02 00:00:00', '3', '0', '1', '2', '31', '', '2015-04-27 00:42:26', '2014-07-10 21:44:25');
INSERT INTO `kc_article` VALUES ('47', '运维平台开始试用', '1', '开始', '2014-07-08 00:00:00', '1', '1', '0', '5', '31', '', '2014-10-28 21:15:47', '2015-04-27 00:42:26');
INSERT INTO `kc_article` VALUES ('48', '如何研究酒文化', '1', '2222222', '2014-07-09 00:00:00', '1', '1', '1', '11', '30', '', '2015-03-22 16:16:24', '2015-03-22 16:16:24');
INSERT INTO `kc_article` VALUES ('50', '1', '1', '1', '2014-07-10 00:00:00', '1', '0', '1', '1', '30', '', '2015-04-27 00:42:26', '2014-07-10 21:35:44');
INSERT INTO `kc_article` VALUES ('51', '1', '1', '1', '2014-07-10 00:00:00', '1', '1', '1', '4', '29', '', '2014-07-18 14:05:43', '2014-07-18 14:05:43');
INSERT INTO `kc_article` VALUES ('52', '关于的减肥啦水井坊 分开来的减肥啦手机的减肥拉萨dfadsfasfdsafadsfasfasfasfasfasfsfasfsafdsa', '1', '广东省股份', '2014-07-10 00:00:00', '1', '1', '1', '7', '31', '', '2015-03-22 16:04:07', '2015-03-22 16:04:07');

-- ----------------------------
-- Table structure for kc_attachment
-- ----------------------------
DROP TABLE IF EXISTS `kc_attachment`;
CREATE TABLE `kc_attachment` (
  `id` varchar(200) DEFAULT NULL,
  `attachmentTypeId` int(11) DEFAULT NULL,
  `uiName` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `fileSize` int(11) DEFAULT NULL,
  `fileType` varchar(255) DEFAULT NULL,
  `createDT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createUserID` int(11) DEFAULT NULL,
  `fileName` varchar(200) DEFAULT NULL,
  `articleId` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kc_attachment
-- ----------------------------
INSERT INTO `kc_attachment` VALUES ('07552c034be64d2e86ad83cd5215f24c', '34', 'weektask.txt', 'D:\\project\\j2ee\\workspace_rms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\RMS\\WEB-INF\\upload/07552c034be64d2e86ad83cd5215f24c.txt', '32', 'text/plain', '2014-06-24 11:18:56', '1', '07552c034be64d2e86ad83cd5215f24c.txt', null);
INSERT INTO `kc_attachment` VALUES ('096f8a46dcdd4515966e2dbdeb32ef58', '34', '司法系统.txt', 'D:\\project\\j2ee\\workspace_rms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\RMS\\WEB-INF\\upload/096f8a46dcdd4515966e2dbdeb32ef58.txt', '2686', 'text/plain', '2014-06-27 14:18:33', '1', '096f8a46dcdd4515966e2dbdeb32ef58.txt', null);
INSERT INTO `kc_attachment` VALUES ('0d8e640a674e41a892984f2994072403', '49', '新建文本文档 (2).txt', 'D:\\project\\j2ee\\workspace_rms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\RMS\\WEB-INF\\upload/0d8e640a674e41a892984f2994072403.txt', '123', 'text/plain', '2014-07-08 13:58:03', '1', '0d8e640a674e41a892984f2994072403.txt', null);
INSERT INTO `kc_attachment` VALUES ('14d14b5d4cf14409a7cd5bc5ef304338', '33', 'week_task.txt', 'D:\\project\\j2ee\\workspace_rms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\RMS\\WEB-INF\\upload/14d14b5d4cf14409a7cd5bc5ef304338.txt', '430', 'text/plain', '2014-06-30 10:52:59', '1', '14d14b5d4cf14409a7cd5bc5ef304338.txt', null);
INSERT INTO `kc_attachment` VALUES ('17a99d14eb4240a6b92104313bfadee5', '34', '司法系统.txt', 'D:\\project\\j2ee\\workspace_rms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\RMS\\WEB-INF\\upload/17a99d14eb4240a6b92104313bfadee5.txt', '2558', 'text/plain', '2014-06-24 19:48:15', '1', '17a99d14eb4240a6b92104313bfadee5.txt', null);
INSERT INTO `kc_attachment` VALUES ('18961d08f1a241559ba6e9015d10eb76', '34', 'week_task.txt', 'D:\\project\\j2ee\\workspace_rms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\RMS\\WEB-INF\\upload/18961d08f1a241559ba6e9015d10eb76.txt', '430', 'text/plain', '2014-06-24 19:46:02', '1', '18961d08f1a241559ba6e9015d10eb76.txt', null);
INSERT INTO `kc_attachment` VALUES ('1cb2039788bc4088ba07dba140b927a3', '32', 'WEB_TEC.txt', 'D:\\project\\j2ee\\workspace_rms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\RMS\\WEB-INF\\upload/1cb2039788bc4088ba07dba140b927a3.txt', '538', 'text/plain', '2014-06-23 09:50:39', '1', '1cb2039788bc4088ba07dba140b927a3.txt', null);
INSERT INTO `kc_attachment` VALUES ('1f71a1de5610479b9dbce386fb5d0bae', '34', 'jquery.txt', 'D:\\project\\j2ee\\workspace_rms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\RMS\\WEB-INF\\upload/1f71a1de5610479b9dbce386fb5d0bae.txt', '235', 'text/plain', '2014-06-24 14:38:20', '1', '1f71a1de5610479b9dbce386fb5d0bae.txt', null);
INSERT INTO `kc_attachment` VALUES ('22e44db9b35a44ff95f2c795c38e0242', '33', 'Noname1.txt', 'D:\\project\\j2ee\\workspace_rms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\RMS\\WEB-INF\\upload/22e44db9b35a44ff95f2c795c38e0242.txt', '4710', 'text/plain', '2014-06-30 10:51:20', '1', '22e44db9b35a44ff95f2c795c38e0242.txt', null);
INSERT INTO `kc_attachment` VALUES ('258a3bc8bbc04922932a3657f678a13d', '34', '司法系统.txt', 'D:\\project\\j2ee\\workspace_rms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\RMS\\WEB-INF\\upload/258a3bc8bbc04922932a3657f678a13d.txt', '2558', 'text/plain', '2014-06-24 19:54:04', '1', '258a3bc8bbc04922932a3657f678a13d.txt', null);
INSERT INTO `kc_attachment` VALUES ('263306b973814ad4882e48a483147314', '34', 'Noname1.txt', 'D:\\project\\j2ee\\workspace_rms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\RMS\\WEB-INF\\upload/263306b973814ad4882e48a483147314.txt', '4710', 'text/plain', '2014-06-27 14:20:33', '1', '263306b973814ad4882e48a483147314.txt', null);
INSERT INTO `kc_attachment` VALUES ('2dcb79e98f1646db98dd9c32bbb6cf09', '33', '新建文本文档 (2).txt', 'D:\\project\\j2ee\\workspace_rms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\RMS\\WEB-INF\\upload/2dcb79e98f1646db98dd9c32bbb6cf09.txt', '123', 'text/plain', '2014-06-30 10:46:06', '1', '2dcb79e98f1646db98dd9c32bbb6cf09.txt', null);
INSERT INTO `kc_attachment` VALUES ('2f1727d40b4d4cfb8975af83d2aae05c', '33', 'week_task.txt', 'D:\\project\\j2ee\\workspace_rms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\RMS\\WEB-INF\\upload/2f1727d40b4d4cfb8975af83d2aae05c.txt', '430', 'text/plain', '2014-06-30 10:45:56', '1', '2f1727d40b4d4cfb8975af83d2aae05c.txt', null);
INSERT INTO `kc_attachment` VALUES ('2fc0c991561d4a0aae847fa77da403fb', '32', '1.png', 'E:\\Test\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\RMS\\WEB-INF\\upload/2fc0c991561d4a0aae847fa77da403fb.png', '25677', 'image/png', '2014-06-27 11:47:55', '3', '2fc0c991561d4a0aae847fa77da403fb.png', '34');
INSERT INTO `kc_attachment` VALUES ('31d27fb8358d44e8a434fbe999fec6d4', '34', '司法系统.txt', 'D:\\project\\j2ee\\workspace_rms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\RMS\\WEB-INF\\upload/31d27fb8358d44e8a434fbe999fec6d4.txt', '2638', 'text/plain', '2014-06-27 11:33:02', '1', '31d27fb8358d44e8a434fbe999fec6d4.txt', null);
INSERT INTO `kc_attachment` VALUES ('324fccf3604f49ada1d09d215012955a', '47', '司法系统.txt', 'D:\\project\\j2ee\\workspace_rms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\RMS\\WEB-INF\\upload/324fccf3604f49ada1d09d215012955a.txt', '2686', 'text/plain', '2014-07-02 08:53:12', '1', '324fccf3604f49ada1d09d215012955a.txt', null);
INSERT INTO `kc_attachment` VALUES ('32c752c45f4b401baebf328832af8d56', '49', '新建文本文档 (2).txt', 'D:\\project\\j2ee\\workspace_rms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\RMS\\WEB-INF\\upload/32c752c45f4b401baebf328832af8d56.txt', '123', 'text/plain', '2014-07-08 13:58:08', '1', '32c752c45f4b401baebf328832af8d56.txt', null);
INSERT INTO `kc_attachment` VALUES ('39cd4f58e05247249c831389550cb95f', '49', '新建文本文档 (2).txt', 'D:\\project\\j2ee\\workspace_rms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\RMS\\WEB-INF\\upload/39cd4f58e05247249c831389550cb95f.txt', '123', 'text/plain', '2014-07-08 13:58:01', '1', '39cd4f58e05247249c831389550cb95f.txt', null);
INSERT INTO `kc_attachment` VALUES ('3b5f2ef15591402fb960c46ba20f4a0d', '34', '司法系统.txt', 'D:\\project\\j2ee\\workspace_rms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\RMS\\WEB-INF\\upload/3b5f2ef15591402fb960c46ba20f4a0d.txt', '2686', 'text/plain', '2014-06-27 14:16:57', '1', '3b5f2ef15591402fb960c46ba20f4a0d.txt', null);
INSERT INTO `kc_attachment` VALUES ('3dd381ecbade4e068e7b8b11976769b2', '47', 'WEB_TEC.txt', 'D:\\project\\j2ee\\workspace_rms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\RMS\\WEB-INF\\upload/3dd381ecbade4e068e7b8b11976769b2.txt', '538', 'text/plain', '2014-07-02 09:59:37', '1', '3dd381ecbade4e068e7b8b11976769b2.txt', null);
INSERT INTO `kc_attachment` VALUES ('4182ae5f0aee47848d7b91c3ee80c5c5', '47', '司法系统.txt', 'D:\\project\\j2ee\\workspace_rms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\RMS\\WEB-INF\\upload/4182ae5f0aee47848d7b91c3ee80c5c5.txt', '2686', 'text/plain', '2014-07-02 09:23:28', '1', '4182ae5f0aee47848d7b91c3ee80c5c5.txt', null);
INSERT INTO `kc_attachment` VALUES ('42575dcd6109466f9aff2b8dbbc614a2', '32', 'week_task.txt', 'D:\\project\\j2ee\\workspace_rms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\RMS\\WEB-INF\\upload/42575dcd6109466f9aff2b8dbbc614a2.txt', '430', 'text/plain', '2014-06-30 10:50:50', '1', '42575dcd6109466f9aff2b8dbbc614a2.txt', null);
INSERT INTO `kc_attachment` VALUES ('450acdee311d4be9982290c7d5fd1371', '37', '统计图.xlsx', 'E:\\Test\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\RMS\\WEB-INF\\upload/450acdee311d4be9982290c7d5fd1371.xlsx', '36436', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', '2014-07-01 10:56:46', '3', '450acdee311d4be9982290c7d5fd1371.xlsx', null);
INSERT INTO `kc_attachment` VALUES ('456c80e253954e52bd5ca9ec61090bab', '34', 'WEB_TEC.txt', 'D:\\project\\j2ee\\workspace_rms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\RMS\\WEB-INF\\upload/456c80e253954e52bd5ca9ec61090bab.txt', '538', 'text/plain', '2014-06-27 11:40:04', '1', '456c80e253954e52bd5ca9ec61090bab.txt', null);
INSERT INTO `kc_attachment` VALUES ('4709d37146ea4cc98d0ccc4551c91e2e', '34', '司法系统.txt', 'D:\\project\\j2ee\\workspace_rms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\RMS\\WEB-INF\\upload/4709d37146ea4cc98d0ccc4551c91e2e.txt', '2686', 'text/plain', '2014-06-27 15:39:34', '1', '4709d37146ea4cc98d0ccc4551c91e2e.txt', null);
INSERT INTO `kc_attachment` VALUES ('4c5605f0e518474e984b3c462cddfddd', '34', 'WEB_TEC.txt', 'D:\\project\\j2ee\\workspace_rms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\RMS\\WEB-INF\\upload/4c5605f0e518474e984b3c462cddfddd.txt', '538', 'text/plain', '2014-06-24 11:27:59', '1', '4c5605f0e518474e984b3c462cddfddd.txt', null);
INSERT INTO `kc_attachment` VALUES ('4c6dc5a42cc34b9891fbfbdc3c44d3c8', '35', 'Noname1.txt', 'D:\\project\\j2ee\\workspace_rms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\RMS\\WEB-INF\\upload/4c6dc5a42cc34b9891fbfbdc3c44d3c8.txt', '4710', 'text/plain', '2014-06-27 11:58:01', '1', '4c6dc5a42cc34b9891fbfbdc3c44d3c8.txt', null);
INSERT INTO `kc_attachment` VALUES ('51fb403c45364da5aac1515495f51abd', '49', '新建文本文档 (2).txt', 'D:\\project\\j2ee\\workspace_rms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\RMS\\WEB-INF\\upload/51fb403c45364da5aac1515495f51abd.txt', '123', 'text/plain', '2014-07-08 11:13:38', '1', '51fb403c45364da5aac1515495f51abd.txt', null);
INSERT INTO `kc_attachment` VALUES ('53c0100cdc614fc88d0dc466a500bdc1', '32', 'week_task.txt', 'D:\\project\\j2ee\\workspace_rms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\RMS\\WEB-INF\\upload/53c0100cdc614fc88d0dc466a500bdc1.txt', '430', 'text/plain', '2014-06-30 10:26:23', '1', '53c0100cdc614fc88d0dc466a500bdc1.txt', null);
INSERT INTO `kc_attachment` VALUES ('53deff571eac4461a5e6765ada3f6d27', '34', 'Noname1.txt', 'D:\\project\\j2ee\\workspace_rms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\RMS\\WEB-INF\\upload/53deff571eac4461a5e6765ada3f6d27.txt', '4710', 'text/plain', '2014-06-27 14:20:31', '1', '53deff571eac4461a5e6765ada3f6d27.txt', null);
INSERT INTO `kc_attachment` VALUES ('5bfb339a763f4d21936a1fedebc3cddf', '49', 'Noname1.txt', 'D:\\project\\j2ee\\workspace_rms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\RMS\\WEB-INF\\upload/5bfb339a763f4d21936a1fedebc3cddf.txt', '870', 'text/plain', '2014-07-08 14:04:48', '1', '5bfb339a763f4d21936a1fedebc3cddf.txt', null);
INSERT INTO `kc_attachment` VALUES ('5fa3d51c42214f188bd8ce32500a7794', '33', '司法系统.txt', 'D:\\project\\j2ee\\workspace_rms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\RMS\\WEB-INF\\upload/5fa3d51c42214f188bd8ce32500a7794.txt', '2686', 'text/plain', '2014-06-30 11:20:40', '1', '5fa3d51c42214f188bd8ce32500a7794.txt', null);
INSERT INTO `kc_attachment` VALUES ('626c9c5b2bea42efb207e4a8e582c1ea', '34', 'project.txt', 'D:\\project\\j2ee\\workspace_rms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\RMS\\WEB-INF\\upload/626c9c5b2bea42efb207e4a8e582c1ea.txt', '1705', 'text/plain', '2014-06-24 20:41:55', '1', '626c9c5b2bea42efb207e4a8e582c1ea.txt', null);
INSERT INTO `kc_attachment` VALUES ('6785d46c18ad48aa8132e38264bb7ddb', '32', 'jquery.txt', 'D:\\project\\j2ee\\workspace_rms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\RMS\\WEB-INF\\upload/6785d46c18ad48aa8132e38264bb7ddb.txt', '235', 'text/plain', '2014-06-30 10:24:59', '1', '6785d46c18ad48aa8132e38264bb7ddb.txt', null);
INSERT INTO `kc_attachment` VALUES ('686a145edd6d4735950a4f050253c51c', '35', 'project.txt', 'D:\\project\\j2ee\\workspace_rms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\RMS\\WEB-INF\\upload/686a145edd6d4735950a4f050253c51c.txt', '1705', 'text/plain', '2014-06-24 20:39:11', '1', '686a145edd6d4735950a4f050253c51c.txt', null);
INSERT INTO `kc_attachment` VALUES ('6da32ab038d84d88b86789614e66c6eb', '32', 'week_task.txt', 'D:\\project\\j2ee\\workspace_rms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\RMS\\WEB-INF\\upload/6da32ab038d84d88b86789614e66c6eb.txt', '430', 'text/plain', '2014-06-24 18:05:08', '1', '6da32ab038d84d88b86789614e66c6eb.txt', '31');
INSERT INTO `kc_attachment` VALUES ('7064aa19aaed4365b0d8d72e5cae8688', '34', 'jquery.txt', 'D:\\project\\j2ee\\workspace_rms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\RMS\\WEB-INF\\upload/7064aa19aaed4365b0d8d72e5cae8688.txt', '235', 'text/plain', '2014-06-24 14:39:51', '1', '7064aa19aaed4365b0d8d72e5cae8688.txt', null);
INSERT INTO `kc_attachment` VALUES ('73e20e9d754249e0a524e9b9e7d1579a', '35', 'jquery.txt', 'D:\\project\\j2ee\\workspace_rms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\RMS\\WEB-INF\\upload/73e20e9d754249e0a524e9b9e7d1579a.txt', '235', 'text/plain', '2014-06-24 20:39:19', '1', '73e20e9d754249e0a524e9b9e7d1579a.txt', null);
INSERT INTO `kc_attachment` VALUES ('75ea801f4e5b49d0b1ad689eee6aaeef', '49', '新建文本文档 (2).txt', 'D:\\project\\j2ee\\workspace_rms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\RMS\\WEB-INF\\upload/75ea801f4e5b49d0b1ad689eee6aaeef.txt', '123', 'text/plain', '2014-07-08 13:58:05', '1', '75ea801f4e5b49d0b1ad689eee6aaeef.txt', null);
INSERT INTO `kc_attachment` VALUES ('761545edc60946a695ab4a7c4f0a575e', '34', '司法系统.txt', 'D:\\project\\j2ee\\workspace_rms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\RMS\\WEB-INF\\upload/761545edc60946a695ab4a7c4f0a575e.txt', '2686', 'text/plain', '2014-06-27 14:47:45', '1', '761545edc60946a695ab4a7c4f0a575e.txt', null);
INSERT INTO `kc_attachment` VALUES ('77187c9a3d9f4eaf8d2c0ff089253eac', '47', 'WEB_TEC.txt', 'D:\\project\\j2ee\\workspace_rms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\RMS\\WEB-INF\\upload/77187c9a3d9f4eaf8d2c0ff089253eac.txt', '538', 'text/plain', '2014-07-02 09:19:57', '1', '77187c9a3d9f4eaf8d2c0ff089253eac.txt', null);
INSERT INTO `kc_attachment` VALUES ('7ab23f685d164f64b782a99f722410ea', '34', 'weektask.txt', 'D:\\project\\j2ee\\workspace_rms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\RMS\\WEB-INF\\upload/7ab23f685d164f64b782a99f722410ea.txt', '32', 'text/plain', '2014-06-24 11:18:54', '1', '7ab23f685d164f64b782a99f722410ea.txt', null);
INSERT INTO `kc_attachment` VALUES ('7b1c9c4278944cbd9048c41cd9865d5e', '34', 'week_task.txt', 'D:\\project\\j2ee\\workspace_rms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\RMS\\WEB-INF\\upload/7b1c9c4278944cbd9048c41cd9865d5e.txt', '430', 'text/plain', '2014-06-24 17:48:05', '1', '7b1c9c4278944cbd9048c41cd9865d5e.txt', null);
INSERT INTO `kc_attachment` VALUES ('7b9a713305cb4394bc2bfcab80428427', '49', '新建文本文档 (2).txt', 'D:\\project\\j2ee\\workspace_rms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\RMS\\WEB-INF\\upload/7b9a713305cb4394bc2bfcab80428427.txt', '123', 'text/plain', '2014-07-08 13:58:04', '1', '7b9a713305cb4394bc2bfcab80428427.txt', null);
INSERT INTO `kc_attachment` VALUES ('7d3a7670049d49ffbf911d39681be1cd', '33', 'week_task.txt', 'D:\\project\\j2ee\\workspace_rms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\RMS\\WEB-INF\\upload/7d3a7670049d49ffbf911d39681be1cd.txt', '430', 'text/plain', '2014-06-30 10:47:38', '1', '7d3a7670049d49ffbf911d39681be1cd.txt', null);
INSERT INTO `kc_attachment` VALUES ('7e87b97c4e0e48909d404914866029d5', '32', 'week_task.txt', 'D:\\project\\j2ee\\workspace_rms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\RMS\\WEB-INF\\upload/7e87b97c4e0e48909d404914866029d5.txt', '430', 'text/plain', '2014-06-24 18:02:39', '1', '7e87b97c4e0e48909d404914866029d5.txt', null);
INSERT INTO `kc_attachment` VALUES ('82d7c914b3984774ac77ac1a6bc58772', '35', '司法系统.txt', 'D:\\project\\j2ee\\workspace_rms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\RMS\\WEB-INF\\upload/82d7c914b3984774ac77ac1a6bc58772.txt', '2558', 'text/plain', '2014-06-24 20:37:26', '1', '82d7c914b3984774ac77ac1a6bc58772.txt', null);
INSERT INTO `kc_attachment` VALUES ('83f47341632b43aeb4344c3c62f3217d', '35', 'project.txt', 'D:\\project\\j2ee\\workspace_rms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\RMS\\WEB-INF\\upload/83f47341632b43aeb4344c3c62f3217d.txt', '1705', 'text/plain', '2014-06-24 20:41:05', '1', '83f47341632b43aeb4344c3c62f3217d.txt', null);
INSERT INTO `kc_attachment` VALUES ('86961d0dffce43e3be9aa5be682c89ef', '49', '新建文本文档 (2).txt', 'D:\\project\\j2ee\\workspace_rms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\RMS\\WEB-INF\\upload/86961d0dffce43e3be9aa5be682c89ef.txt', '123', 'text/plain', '2014-07-08 13:58:07', '1', '86961d0dffce43e3be9aa5be682c89ef.txt', null);
INSERT INTO `kc_attachment` VALUES ('88009de3eeb54d9c88132e37a9d34260', '33', 'week_task.txt', 'D:\\project\\j2ee\\workspace_rms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\RMS\\WEB-INF\\upload/88009de3eeb54d9c88132e37a9d34260.txt', '430', 'text/plain', '2014-06-30 10:55:08', '1', '88009de3eeb54d9c88132e37a9d34260.txt', null);
INSERT INTO `kc_attachment` VALUES ('8955a1cb4ff347cf88b08f87384f491b', '34', 'weektask.txt', 'D:\\project\\j2ee\\workspace_rms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\RMS\\WEB-INF\\upload/8955a1cb4ff347cf88b08f87384f491b.txt', '32', 'text/plain', '2014-06-24 11:08:21', '1', '8955a1cb4ff347cf88b08f87384f491b.txt', null);
INSERT INTO `kc_attachment` VALUES ('8b25f01036d344d7bcee6286b84eb14d', '32', 'week_task.txt', 'D:\\project\\j2ee\\workspace_rms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\RMS\\WEB-INF\\upload/8b25f01036d344d7bcee6286b84eb14d.txt', '430', 'text/plain', '2014-06-30 10:50:52', '1', '8b25f01036d344d7bcee6286b84eb14d.txt', null);
INSERT INTO `kc_attachment` VALUES ('9240c3af5c444a95ab85c80bfce2690e', '33', 'Noname1.txt', 'D:\\project\\j2ee\\workspace_rms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\RMS\\WEB-INF\\upload/9240c3af5c444a95ab85c80bfce2690e.txt', '4710', 'text/plain', '2014-06-30 10:51:18', '1', '9240c3af5c444a95ab85c80bfce2690e.txt', null);
INSERT INTO `kc_attachment` VALUES ('9711ee19e59745678e2d76deb652e868', '32', '新建文本文档 (3).txt', 'D:\\project\\j2ee\\workspace_rms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\RMS\\WEB-INF\\upload/9711ee19e59745678e2d76deb652e868.txt', '616', 'text/plain', '2014-06-23 09:56:16', '1', '9711ee19e59745678e2d76deb652e868.txt', null);
INSERT INTO `kc_attachment` VALUES ('9aef44e96148469bb2131e076dac14ee', '32', '统计图.xlsx', 'E:\\Test\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\RMS\\WEB-INF\\upload/9aef44e96148469bb2131e076dac14ee.xlsx', '36436', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', '2014-06-30 17:27:31', '3', '9aef44e96148469bb2131e076dac14ee.xlsx', '45');
INSERT INTO `kc_attachment` VALUES ('9be1ce97cad249d1979189437a9d5e79', '34', 'weektask.txt', 'D:\\project\\j2ee\\workspace_rms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\RMS\\WEB-INF\\upload/9be1ce97cad249d1979189437a9d5e79.txt', '32', 'text/plain', '2014-06-24 13:56:17', '1', '9be1ce97cad249d1979189437a9d5e79.txt', null);
INSERT INTO `kc_attachment` VALUES ('a11345413ee5429e8b33757f946d43af', '32', 'weektask.txt', 'D:\\project\\j2ee\\workspace_rms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\RMS\\WEB-INF\\upload/a11345413ee5429e8b33757f946d43af.txt', '32', 'text/plain', '2014-06-24 10:29:32', '1', 'a11345413ee5429e8b33757f946d43af.txt', null);
INSERT INTO `kc_attachment` VALUES ('a643d982e4404cee80a831ca11841706', '34', 'week_task.txt', 'D:\\project\\j2ee\\workspace_rms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\RMS\\WEB-INF\\upload/a643d982e4404cee80a831ca11841706.txt', '430', 'text/plain', '2014-06-24 17:43:53', '1', 'a643d982e4404cee80a831ca11841706.txt', null);
INSERT INTO `kc_attachment` VALUES ('a9f121b516c74b898cb4d05f27453ecc', '34', '司法系统.txt', 'D:\\project\\j2ee\\workspace_rms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\RMS\\WEB-INF\\upload/a9f121b516c74b898cb4d05f27453ecc.txt', '2686', 'text/plain', '2014-06-27 15:26:44', '1', 'a9f121b516c74b898cb4d05f27453ecc.txt', null);
INSERT INTO `kc_attachment` VALUES ('aabd178f21e4493f972ebb68eae5081c', '34', 'week_task.txt', 'D:\\project\\j2ee\\workspace_rms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\RMS\\WEB-INF\\upload/aabd178f21e4493f972ebb68eae5081c.txt', '430', 'text/plain', '2014-06-24 14:04:39', '1', 'aabd178f21e4493f972ebb68eae5081c.txt', null);
INSERT INTO `kc_attachment` VALUES ('afe9239568b447bcac64a29d9352359d', '35', 'weektask.txt', 'D:\\project\\j2ee\\workspace_rms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\RMS\\WEB-INF\\upload/afe9239568b447bcac64a29d9352359d.txt', '32', 'text/plain', '2014-06-27 16:51:52', '1', 'afe9239568b447bcac64a29d9352359d.txt', null);
INSERT INTO `kc_attachment` VALUES ('b1f383ea478c403a8f660f99a275cece', '35', 'weektask.txt', 'D:\\project\\j2ee\\workspace_rms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\RMS\\WEB-INF\\upload/b1f383ea478c403a8f660f99a275cece.txt', '32', 'text/plain', '2014-06-27 12:27:07', '1', 'b1f383ea478c403a8f660f99a275cece.txt', null);
INSERT INTO `kc_attachment` VALUES ('b2ac07ba8fd04be681597c9dab991756', '34', 'weektask.txt', 'D:\\project\\j2ee\\workspace_rms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\RMS\\WEB-INF\\upload/b2ac07ba8fd04be681597c9dab991756.txt', '32', 'text/plain', '2014-06-24 11:25:05', '1', 'b2ac07ba8fd04be681597c9dab991756.txt', null);
INSERT INTO `kc_attachment` VALUES ('b33a2e291baa48d696d792a4d0edbcf8', '37', 'WEB_TEC.txt', 'D:\\project\\j2ee\\workspace_rms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\RMS\\WEB-INF\\upload/b33a2e291baa48d696d792a4d0edbcf8.txt', '538', 'text/plain', '2014-06-27 16:53:53', '1', 'b33a2e291baa48d696d792a4d0edbcf8.txt', null);
INSERT INTO `kc_attachment` VALUES ('b3df0621c3d14d2c8e90c7d0f260a112', '47', '司法系统.txt', 'D:\\project\\j2ee\\workspace_rms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\RMS\\WEB-INF\\upload/b3df0621c3d14d2c8e90c7d0f260a112.txt', '2686', 'text/plain', '2014-07-02 08:53:08', '1', 'b3df0621c3d14d2c8e90c7d0f260a112.txt', null);
INSERT INTO `kc_attachment` VALUES ('b6d496a54bdb471fade7c0a6943bb8d8', '49', '新建文本文档 (2).txt', 'D:\\project\\j2ee\\workspace_rms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\RMS\\WEB-INF\\upload/b6d496a54bdb471fade7c0a6943bb8d8.txt', '123', 'text/plain', '2014-07-08 13:58:00', '1', 'b6d496a54bdb471fade7c0a6943bb8d8.txt', null);
INSERT INTO `kc_attachment` VALUES ('b6f9c97789fe49ceb76985a60da22f8c', '32', '新建文本文档 (3).txt', 'D:\\project\\j2ee\\workspace_rms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\RMS\\WEB-INF\\upload/b6f9c97789fe49ceb76985a60da22f8c.txt', '616', 'text/plain', '2014-06-23 09:54:07', '1', 'b6f9c97789fe49ceb76985a60da22f8c.txt', null);
INSERT INTO `kc_attachment` VALUES ('bca018c4dbbb42cc8385cdfe34b65a00', '33', 'week_task.txt', 'D:\\project\\j2ee\\workspace_rms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\RMS\\WEB-INF\\upload/bca018c4dbbb42cc8385cdfe34b65a00.txt', '430', 'text/plain', '2014-06-30 10:47:40', '1', 'bca018c4dbbb42cc8385cdfe34b65a00.txt', null);
INSERT INTO `kc_attachment` VALUES ('c0b572ac999c4f5ab449682dc67c9266', '34', 'WEB_TEC.txt', 'D:\\project\\j2ee\\workspace_rms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\RMS\\WEB-INF\\upload/c0b572ac999c4f5ab449682dc67c9266.txt', '538', 'text/plain', '2014-06-24 11:27:58', '1', 'c0b572ac999c4f5ab449682dc67c9266.txt', null);
INSERT INTO `kc_attachment` VALUES ('c1f7c0397cf64227896858af9c90e830', '33', 'week_task.txt', 'D:\\project\\j2ee\\workspace_rms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\RMS\\WEB-INF\\upload/c1f7c0397cf64227896858af9c90e830.txt', '430', 'text/plain', '2014-06-30 10:55:09', '1', 'c1f7c0397cf64227896858af9c90e830.txt', null);
INSERT INTO `kc_attachment` VALUES ('c4635557b6fa480eabfc8398dd55d767', '34', 'weektask.txt', 'D:\\project\\j2ee\\workspace_rms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\RMS\\WEB-INF\\upload/c4635557b6fa480eabfc8398dd55d767.txt', '32', 'text/plain', '2014-06-24 11:25:04', '1', 'c4635557b6fa480eabfc8398dd55d767.txt', null);
INSERT INTO `kc_attachment` VALUES ('c66fce94ad594c3488f45b5ba9b8b662', '34', '新建文本文档 (3).txt', 'D:\\project\\j2ee\\workspace_rms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\RMS\\WEB-INF\\upload/c66fce94ad594c3488f45b5ba9b8b662.txt', '616', 'text/plain', '2014-06-27 14:18:38', '1', 'c66fce94ad594c3488f45b5ba9b8b662.txt', null);
INSERT INTO `kc_attachment` VALUES ('cd4bf181b5344dd9978cb072b1124e4c', '34', 'weektask.txt', 'D:\\project\\j2ee\\workspace_rms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\RMS\\WEB-INF\\upload/cd4bf181b5344dd9978cb072b1124e4c.txt', '32', 'text/plain', '2014-06-24 11:25:02', '1', 'cd4bf181b5344dd9978cb072b1124e4c.txt', null);
INSERT INTO `kc_attachment` VALUES ('d15ad96f0c844dcf953e33c2b7469e40', '33', 'week_task.txt', 'D:\\project\\j2ee\\workspace_rms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\RMS\\WEB-INF\\upload/d15ad96f0c844dcf953e33c2b7469e40.txt', '430', 'text/plain', '2014-06-30 10:53:01', '1', 'd15ad96f0c844dcf953e33c2b7469e40.txt', null);
INSERT INTO `kc_attachment` VALUES ('d49d83ac22e2478bbcb8b74e057bc081', '33', 'weektask.txt', 'D:\\project\\j2ee\\workspace_rms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\RMS\\WEB-INF\\upload/d49d83ac22e2478bbcb8b74e057bc081.txt', '32', 'text/plain', '2014-06-30 11:35:20', '1', 'd49d83ac22e2478bbcb8b74e057bc081.txt', null);
INSERT INTO `kc_attachment` VALUES ('d4b934c59b974f80b384eed9a9351ccf', '35', 'project.txt', 'D:\\project\\j2ee\\workspace_rms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\RMS\\WEB-INF\\upload/d4b934c59b974f80b384eed9a9351ccf.txt', '1705', 'text/plain', '2014-06-24 20:41:08', '1', 'd4b934c59b974f80b384eed9a9351ccf.txt', null);
INSERT INTO `kc_attachment` VALUES ('db078c58a3c54fc183341a6700594625', '35', '司法系统.txt', 'D:\\project\\j2ee\\workspace_rms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\RMS\\WEB-INF\\upload/db078c58a3c54fc183341a6700594625.txt', '2558', 'text/plain', '2014-06-24 20:37:24', '1', 'db078c58a3c54fc183341a6700594625.txt', null);
INSERT INTO `kc_attachment` VALUES ('e4a3e94287c94102a3515fcd050c9ca0', '32', '1.png', 'E:\\Test\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\RMS\\WEB-INF\\upload/e4a3e94287c94102a3515fcd050c9ca0.png', '25677', 'image/png', '2014-06-27 11:30:02', '3', 'e4a3e94287c94102a3515fcd050c9ca0.png', '33');
INSERT INTO `kc_attachment` VALUES ('eaaacdbf4db74c4a931cc2ffc55a4c5c', '47', 'WEB_TEC.txt', 'D:\\project\\j2ee\\workspace_rms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\RMS\\WEB-INF\\upload/eaaacdbf4db74c4a931cc2ffc55a4c5c.txt', '538', 'text/plain', '2014-07-02 09:19:54', '1', 'eaaacdbf4db74c4a931cc2ffc55a4c5c.txt', null);
INSERT INTO `kc_attachment` VALUES ('ef1292cc99174ad59ea208a53750161e', '34', 'weektask.txt', 'D:\\project\\j2ee\\workspace_rms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\RMS\\WEB-INF\\upload/ef1292cc99174ad59ea208a53750161e.txt', '32', 'text/plain', '2014-06-24 13:56:18', '1', 'ef1292cc99174ad59ea208a53750161e.txt', null);
INSERT INTO `kc_attachment` VALUES ('f1d06508c1d44e1bbe9e63977da8a142', '32', '司法系统.txt', 'D:\\project\\j2ee\\workspace_rms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\RMS\\WEB-INF\\upload/f1d06508c1d44e1bbe9e63977da8a142.txt', '3034', 'text/plain', '2014-07-10 21:14:42', '1', 'f1d06508c1d44e1bbe9e63977da8a142.txt', null);
INSERT INTO `kc_attachment` VALUES ('f75b9630b37b48b280de87020d0073e4', '36', 'weektask.txt', 'D:\\project\\j2ee\\workspace_rms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\RMS\\WEB-INF\\upload/f75b9630b37b48b280de87020d0073e4.txt', '32', 'text/plain', '2014-06-27 15:32:57', '1', 'f75b9630b37b48b280de87020d0073e4.txt', null);
INSERT INTO `kc_attachment` VALUES ('fa4ffabbb49f4b69b73803971ef4d38b', '34', 'WEB_TEC.txt', 'D:\\project\\j2ee\\workspace_rms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\RMS\\WEB-INF\\upload/fa4ffabbb49f4b69b73803971ef4d38b.txt', '538', 'text/plain', '2014-06-24 11:27:57', '1', 'fa4ffabbb49f4b69b73803971ef4d38b.txt', null);
INSERT INTO `kc_attachment` VALUES ('fc385386efc8478a9fdbe95a1cfb0dd2', '36', 'Noname1.txt', 'D:\\project\\j2ee\\workspace_rms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\RMS\\WEB-INF\\upload/fc385386efc8478a9fdbe95a1cfb0dd2.txt', '4710', 'text/plain', '2014-06-27 15:29:44', '1', 'fc385386efc8478a9fdbe95a1cfb0dd2.txt', null);

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail` (
  `id` int(11) DEFAULT NULL,
  `orderId` int(11) DEFAULT NULL,
  `scheduleNum` int(11) DEFAULT NULL,
  `acceptNum` int(11) DEFAULT NULL,
  `total` double DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  `goodsId` int(11) DEFAULT NULL,
  `salePrice` double DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_detail
-- ----------------------------
INSERT INTO `order_detail` VALUES ('8', '14', '44', '67', '0', '', '2', '77');
INSERT INTO `order_detail` VALUES ('9', '15', '0', '0', '0', null, '3', '0');
INSERT INTO `order_detail` VALUES ('10', '14', '33', '44', '0', '', '3', '4');
INSERT INTO `order_detail` VALUES ('11', '15', '0', '0', '0', null, '2', '0');
INSERT INTO `order_detail` VALUES ('12', '16', '0', '0', '0', null, '2', '0');
INSERT INTO `order_detail` VALUES ('14', '14', '44', '44', '0', '', '5', '5');
INSERT INTO `order_detail` VALUES ('15', '14', '55', '56', '0', '', '4', '7');
INSERT INTO `order_detail` VALUES ('16', '17', '5', '5', '0', '5', '2', '5');
INSERT INTO `order_detail` VALUES ('17', '17', '44', '55', '0', '', '3', '66');
INSERT INTO `order_detail` VALUES ('18', '17', '55', '55', '0', '', '4', '55');
INSERT INTO `order_detail` VALUES ('19', '17', '444', '445', '0', '', '5', '665');

-- ----------------------------
-- Table structure for purchase_balance
-- ----------------------------
DROP TABLE IF EXISTS `purchase_balance`;
CREATE TABLE `purchase_balance` (
  `id` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `balanceDt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `userId` int(11) DEFAULT NULL,
  `customerId` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of purchase_balance
-- ----------------------------
INSERT INTO `purchase_balance` VALUES ('1', '0', '2014-10-26 21:22:38', '1', '3');
INSERT INTO `purchase_balance` VALUES ('2', '0', '2014-10-26 21:25:05', '1', '2');

-- ----------------------------
-- Table structure for purchase_balance_detail
-- ----------------------------
DROP TABLE IF EXISTS `purchase_balance_detail`;
CREATE TABLE `purchase_balance_detail` (
  `id` int(11) DEFAULT NULL,
  `purchaseBalanceId` int(11) DEFAULT NULL,
  `scheduleNum` int(11) DEFAULT NULL,
  `acceptNum` int(11) DEFAULT NULL,
  `total` double DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  `goodsId` int(11) DEFAULT NULL,
  `decidePrice` double DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of purchase_balance_detail
-- ----------------------------
INSERT INTO `purchase_balance_detail` VALUES ('1', '2', '0', '7', '0', '0000', '2', '0');

-- ----------------------------
-- Table structure for purchase_plan
-- ----------------------------
DROP TABLE IF EXISTS `purchase_plan`;
CREATE TABLE `purchase_plan` (
  `id` int(11) DEFAULT NULL,
  `addDt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updateDt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `userId` int(11) DEFAULT NULL,
  `customerId` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of purchase_plan
-- ----------------------------
INSERT INTO `purchase_plan` VALUES ('1', '2014-10-26 17:02:18', '2015-04-27 00:42:26', '1', '3');
INSERT INTO `purchase_plan` VALUES ('2', '2014-10-26 17:04:31', '2015-04-27 00:42:26', '1', '3');
INSERT INTO `purchase_plan` VALUES ('3', '2015-03-22 16:38:03', '2015-04-27 00:42:26', '1', '2');

-- ----------------------------
-- Table structure for purchase_plan_detail
-- ----------------------------
DROP TABLE IF EXISTS `purchase_plan_detail`;
CREATE TABLE `purchase_plan_detail` (
  `id` int(11) DEFAULT NULL,
  `purchasePlanId` int(11) DEFAULT NULL,
  `scheduleNum` int(11) DEFAULT NULL,
  `total` double DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  `goodsId` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of purchase_plan_detail
-- ----------------------------
INSERT INTO `purchase_plan_detail` VALUES ('1', '2', '44', '0', 'oopop', '2');
INSERT INTO `purchase_plan_detail` VALUES ('2', '2', '0', '0', null, '3');
INSERT INTO `purchase_plan_detail` VALUES ('5', '1', '0', '0', null, '3');
INSERT INTO `purchase_plan_detail` VALUES ('6', '3', '8', '0', '888', '2');

-- ----------------------------
-- Table structure for quotation
-- ----------------------------
DROP TABLE IF EXISTS `quotation`;
CREATE TABLE `quotation` (
  `id` int(11) DEFAULT NULL,
  `customerId` int(11) DEFAULT NULL,
  `startDt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `endDt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updateDt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `addDt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `userId` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of quotation
-- ----------------------------
INSERT INTO `quotation` VALUES ('46', '3', '2014-10-17 00:00:00', '2014-11-14 00:00:00', '2014-10-23 00:26:08', '2014-10-21 20:21:15', '1');

-- ----------------------------
-- Table structure for quotation_detail
-- ----------------------------
DROP TABLE IF EXISTS `quotation_detail`;
CREATE TABLE `quotation_detail` (
  `id` int(11) DEFAULT NULL,
  `quotationId` int(11) DEFAULT NULL,
  `goodsId` int(11) DEFAULT NULL,
  `salePrice` double DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of quotation_detail
-- ----------------------------
INSERT INTO `quotation_detail` VALUES ('17', '46', '2', '33');
INSERT INTO `quotation_detail` VALUES ('18', '46', '5', '44');

-- ----------------------------
-- Table structure for supplier
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier` (
  `id` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `place` varchar(150) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `contactPerson` varchar(50) DEFAULT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `zip` varchar(20) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of supplier
-- ----------------------------
INSERT INTO `supplier` VALUES ('1', '深圳市农业管理公司', '4335435432', '深圳市', '1345564433', '张兵', '6681684', '23232', 'szmang@hotmai.com', '');

-- ----------------------------
-- Table structure for sys_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `sys_dictionary`;
CREATE TABLE `sys_dictionary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(64) DEFAULT NULL,
  `text` varchar(64) DEFAULT NULL,
  `dictionarytype_id` int(11) DEFAULT NULL,
  `seq` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `isdefault` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_dictionary
-- ----------------------------
INSERT INTO `sys_dictionary` VALUES ('1', 'super', '管理员', '2', '0', '0', '0');
INSERT INTO `sys_dictionary` VALUES ('8', 'xmjl', '项目经理', '2', '0', '0', '1');
INSERT INTO `sys_dictionary` VALUES ('9', 'zz', '组长', '2', '6', '0', '1');
INSERT INTO `sys_dictionary` VALUES ('10', '001', '系统集成商', '4', '1', '0', '1');
INSERT INTO `sys_dictionary` VALUES ('13', '002', '运维服务商', '4', '0', '0', '1');
INSERT INTO `sys_dictionary` VALUES ('14', '003', '软件开发厂商', '4', '3', '0', '1');
INSERT INTO `sys_dictionary` VALUES ('15', '1', '软件故障', '5', '1', '0', '1');
INSERT INTO `sys_dictionary` VALUES ('16', '2', '硬件故障', '5', '2', '0', '1');
INSERT INTO `sys_dictionary` VALUES ('17', '1101', '系统崩溃', '6', '1', '0', '1');
INSERT INTO `sys_dictionary` VALUES ('18', '1102', '软件崩溃', '6', '2', '0', '1');
INSERT INTO `sys_dictionary` VALUES ('19', '1103', '功能故障', '6', '3', '0', '1');
INSERT INTO `sys_dictionary` VALUES ('20', '1104', '数据维护', '6', '4', '0', '1');
INSERT INTO `sys_dictionary` VALUES ('21', '1105', '功能变更', '6', '5', '0', '1');
INSERT INTO `sys_dictionary` VALUES ('22', '1106', '设备接入', '6', '6', '0', '1');
INSERT INTO `sys_dictionary` VALUES ('23', '100001', '未开始', '7', '1', '0', '1');
INSERT INTO `sys_dictionary` VALUES ('24', '100002', '正在进行', '7', '2', '0', '1');
INSERT INTO `sys_dictionary` VALUES ('25', '100003', '已完成', '7', '3', '0', '1');
INSERT INTO `sys_dictionary` VALUES ('26', '100004', '未完成', '7', '4', '0', '1');
INSERT INTO `sys_dictionary` VALUES ('27', '0001', 'java项目', '8', '0', '0', '1');
INSERT INTO `sys_dictionary` VALUES ('28', '0002', 'C#项目', '8', '1', '0', '1');
INSERT INTO `sys_dictionary` VALUES ('29', 'glzd', '管理制度', '12', '0', '0', '1');
INSERT INTO `sys_dictionary` VALUES ('30', 'zsglk', '知识管理库', '12', '1', '0', '1');
INSERT INTO `sys_dictionary` VALUES ('31', 'tzgg', '通知公告', '12', '2', '0', '1');
INSERT INTO `sys_dictionary` VALUES ('32', 'tzgg', '通知公告', '11', '0', '0', '1');
INSERT INTO `sys_dictionary` VALUES ('33', 'glzd', '管理制度', '11', '1', '0', '1');
INSERT INTO `sys_dictionary` VALUES ('34', 'htgl', '合同管理', '11', '3', '0', '1');
INSERT INTO `sys_dictionary` VALUES ('35', 'rjgl', '软件管理', '11', '4', '0', '1');
INSERT INTO `sys_dictionary` VALUES ('36', 'xmgl', '项目管理', '11', '5', '0', '1');
INSERT INTO `sys_dictionary` VALUES ('37', 'zskgl', '知识库管理', '11', '6', '0', '1');
INSERT INTO `sys_dictionary` VALUES ('38', 'daytype', '日维护', '10', '0', '0', '1');
INSERT INTO `sys_dictionary` VALUES ('39', 'weektype', '周维护', '10', '1', '0', '1');
INSERT INTO `sys_dictionary` VALUES ('40', 'monthtype', '月维护', '10', '2', '0', '1');
INSERT INTO `sys_dictionary` VALUES ('41', 'quartertype', '季维护', '10', '3', '0', '1');
INSERT INTO `sys_dictionary` VALUES ('42', 'yeartype', '年维护', '10', '4', '0', '1');
INSERT INTO `sys_dictionary` VALUES ('43', 'sbjr', '设备接入', '10', '5', '0', '1');
INSERT INTO `sys_dictionary` VALUES ('44', 'jsbz', '技术保障', '10', '5', '0', '1');
INSERT INTO `sys_dictionary` VALUES ('45', 'ld', '领导', '2', '0', '0', '1');
INSERT INTO `sys_dictionary` VALUES ('46', 'zy', '组员', '2', '0', '0', '1');
INSERT INTO `sys_dictionary` VALUES ('47', 'rcwh', '日常维护', '11', '7', '0', '1');
INSERT INTO `sys_dictionary` VALUES ('48', '004', '设备厂商', '4', '2', '0', '1');
INSERT INTO `sys_dictionary` VALUES ('49', 'xdfw', '巡点服务', '11', '8', '0', '1');
INSERT INTO `sys_dictionary` VALUES ('50', 'sgl', '水果类', '13', '0', '0', '1');
INSERT INTO `sys_dictionary` VALUES ('51', 'ml', '米类', '13', '1', '0', '1');
INSERT INTO `sys_dictionary` VALUES ('52', 'tlmfl', '调料面粉类', '13', '2', '0', '1');
INSERT INTO `sys_dictionary` VALUES ('53', 'qdl', '禽蛋类', '13', '3', '0', '1');
INSERT INTO `sys_dictionary` VALUES ('54', 'ghl', '干货类', '13', '4', '0', '1');

-- ----------------------------
-- Table structure for sys_dictionarytype
-- ----------------------------
DROP TABLE IF EXISTS `sys_dictionarytype`;
CREATE TABLE `sys_dictionarytype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(64) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `seq` int(11) DEFAULT NULL,
  `description` varchar(150) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_dictionarytype
-- ----------------------------
INSERT INTO `sys_dictionarytype` VALUES ('1', 'base', '基础设置', '0', '基础设置', null);
INSERT INTO `sys_dictionarytype` VALUES ('2', 'usertype', '用户类型', '0', '用户类型', '1');
INSERT INTO `sys_dictionarytype` VALUES ('4', 'fwstype', '服务商类型', '0', '服务商类型', '1');
INSERT INTO `sys_dictionarytype` VALUES ('5', 'gztype', '故障类型', '0', '故障类型', '9');
INSERT INTO `sys_dictionarytype` VALUES ('6', 'sjtype', '事件类型', '0', '事件类型', '9');
INSERT INTO `sys_dictionarytype` VALUES ('7', 'rwzttype', '任务状态类型', '0', '任务状态类型', '9');
INSERT INTO `sys_dictionarytype` VALUES ('8', 'xmlxtype', '项目类型', '0', '项目类型', '1');
INSERT INTO `sys_dictionarytype` VALUES ('9', 'ywsztype', '运维设置', '0', '运维设置', null);
INSERT INTO `sys_dictionarytype` VALUES ('10', 'whtype', '维护类型', '0', '维护类型', '9');
INSERT INTO `sys_dictionarytype` VALUES ('11', 'fjtype', '附件类型', '0', '附件类型', '1');
INSERT INTO `sys_dictionarytype` VALUES ('12', 'wztype', '文章类型', '0', '文章类型', '1');
INSERT INTO `sys_dictionarytype` VALUES ('13', 'goodstype', '商品类型', '0', '商品类型', '1');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loginUserId` int(11) DEFAULT NULL,
  `loginDT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `clientIP` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=318 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('272', '1', '2014-10-27 22:58:23', '192.168.0.103');
INSERT INTO `sys_log` VALUES ('273', '15', '2014-10-27 23:00:04', '192.168.0.103');
INSERT INTO `sys_log` VALUES ('274', '15', '2014-10-27 23:16:46', '192.168.0.103');
INSERT INTO `sys_log` VALUES ('275', '15', '2014-10-27 23:17:03', '192.168.0.103');
INSERT INTO `sys_log` VALUES ('276', '1', '2014-10-28 21:11:02', '192.168.0.103');
INSERT INTO `sys_log` VALUES ('277', '1', '2014-10-28 22:04:10', '192.168.0.103');
INSERT INTO `sys_log` VALUES ('278', '1', '2014-12-13 15:32:54', '192.168.1.109');
INSERT INTO `sys_log` VALUES ('279', '1', '2015-03-18 08:51:22', '192.162.123.23');
INSERT INTO `sys_log` VALUES ('280', '1', '2015-03-18 08:51:52', '192.162.123.23');
INSERT INTO `sys_log` VALUES ('281', '1', '2015-03-18 09:47:40', '192.162.123.23');
INSERT INTO `sys_log` VALUES ('282', '1', '2015-03-19 23:43:54', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('283', '1', '2015-03-19 23:44:44', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('284', '1', '2015-03-19 23:45:09', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('285', '1', '2015-03-22 16:03:16', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('286', '1', '2015-03-22 16:34:12', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('287', '1', '2015-03-22 17:35:34', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('288', '1', '2015-03-23 11:05:27', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('289', '1', '2015-03-23 14:41:19', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('290', '1', '2015-03-23 14:46:59', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('291', '1', '2015-03-23 15:23:08', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('292', '1', '2015-03-23 15:29:25', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('293', '1', '2015-03-23 15:32:40', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('294', '1', '2015-03-23 18:20:13', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('295', '1', '2015-03-23 18:25:50', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('296', '1', '2015-03-24 11:09:15', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('297', '1', '2015-03-24 15:00:48', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('298', '1', '2015-03-24 17:00:05', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('299', '1', '2015-03-25 16:37:16', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('300', '1', '2015-03-25 17:35:44', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('301', '1', '2015-03-25 21:10:18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('302', '1', '2015-03-25 22:24:41', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('303', '1', '2015-04-03 00:02:26', '192.168.227.1');
INSERT INTO `sys_log` VALUES ('304', '1', '2015-04-26 23:58:58', '192.168.0.108');
INSERT INTO `sys_log` VALUES ('305', '1', '2015-04-27 00:44:33', '192.168.227.1');
INSERT INTO `sys_log` VALUES ('306', '1', '2015-04-27 00:50:30', '192.168.227.1');
INSERT INTO `sys_log` VALUES ('307', '1', '2015-04-27 00:50:48', '192.168.227.1');
INSERT INTO `sys_log` VALUES ('308', '1', '2015-04-27 00:57:22', '192.168.227.1');
INSERT INTO `sys_log` VALUES ('309', '1', '2015-04-27 01:02:03', '192.168.227.1');
INSERT INTO `sys_log` VALUES ('310', '1', '2015-04-27 01:04:22', '192.168.227.1');
INSERT INTO `sys_log` VALUES ('311', '1', '2015-04-27 01:04:34', '192.168.227.1');
INSERT INTO `sys_log` VALUES ('312', '1', '2015-04-27 11:44:40', '192.168.227.1');
INSERT INTO `sys_log` VALUES ('313', '1', '2015-04-27 11:54:27', '192.168.227.1');
INSERT INTO `sys_log` VALUES ('314', '1', '2015-04-27 11:56:59', '192.168.227.1');
INSERT INTO `sys_log` VALUES ('315', '1', '2015-04-27 23:35:28', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('316', '1', '2015-04-28 00:05:48', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('317', '15', '2015-04-28 00:19:43', '127.0.0.1');

-- ----------------------------
-- Table structure for sys_organization
-- ----------------------------
DROP TABLE IF EXISTS `sys_organization`;
CREATE TABLE `sys_organization` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `address` varchar(64) DEFAULT NULL,
  `code` varchar(64) DEFAULT NULL,
  `icon` varchar(64) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `seq` int(11) DEFAULT NULL,
  `createdatetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_organization
-- ----------------------------
INSERT INTO `sys_organization` VALUES ('1', '系统集成部', '合肥', '01', 'icon_company', null, '1', '2014-02-19 01:00:00');
INSERT INTO `sys_organization` VALUES ('4', '软件部', '合肥', '0101', 'icon_folder', '1', '1', '2014-04-21 11:50:12');
INSERT INTO `sys_organization` VALUES ('5', '客服部', '合肥', '0102', 'icon_folder', '1', '3', '2014-06-05 16:45:05');
INSERT INTO `sys_organization` VALUES ('6', '财务部', '合肥', '02', 'icon_company', null, '2', '2002-01-01 09:23:19');
INSERT INTO `sys_organization` VALUES ('7', '运维组', '', 'ywgroup', 'icon_folder', '4', '0', '2002-01-27 05:12:03');

-- ----------------------------
-- Table structure for sys_resource
-- ----------------------------
DROP TABLE IF EXISTS `sys_resource`;
CREATE TABLE `sys_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `url` varchar(64) DEFAULT NULL,
  `description` varchar(64) DEFAULT NULL,
  `icon` varchar(64) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `seq` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `resourcetype` int(11) DEFAULT NULL,
  `createdatetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=238 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_resource
-- ----------------------------
INSERT INTO `sys_resource` VALUES ('1', '系统管理', '', '系统管理', 'icon_sys', null, '11', '0', '0', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('2', '资源管理', '/resource/manager', '资源管理', 'icon_resource', '1', '1', '0', '0', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('3', '角色管理', '/role/manager', '角色管理', 'icon_role', '1', '2', '0', '0', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('4', '用户管理', '/user/manager', '用户管理', 'icon_user', '1', '3', '0', '0', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('5', '资源列表', '/resource/treeGrid', '资源列表', 'icon_resource', '2', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('6', '添加', '/resource/add', '资源添加', 'icon_resource', '2', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('7', '编辑', '/resource/edit', '资源编辑', 'icon_resource', '2', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('8', '删除', '/resource/delete', '资源删除', 'icon_resource', '2', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('10', '角色列表', '/role/dataGrid', '角色列表', 'icon_role', '3', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('11', '添加', '/role/add', '角色添加', 'icon_role', '3', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('12', '编辑', '/role/edit', '角色编辑', 'icon_role', '3', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('13', '删除', '/role/delete', '角色删除', 'icon_role', '3', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('14', '授权', '/role/grant', '角色授权', 'icon_role', '3', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('15', '用户列表', '/user/dataGrid', '用户列表', 'icon_user', '4', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('16', '添加', '/user/add', '用户添加', 'icon_user', '4', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('17', '编辑', '/user/edit', '用户编辑', 'icon_user', '4', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('18', '删除', '/user/delete', '用户删除', 'icon_user', '4', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('19', '查看', '/user/view', '用户查看', 'icon_user', '4', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('26', '数据字典', '/dictionary/manager', '数据字典', 'icon_dic', '1', '5', '0', '0', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('27', '字典列表', '/dictionary/dataGrid', '字典列表', 'icon_dic', '26', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('28', '字典类别列表', '/dictionarytype/dataGrid', '字典类别列表', 'icon_dic', '26', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('29', '添加', '/dictionary/add', '字典添加', 'icon_dic', '26', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('30', '编辑', '/dictionary/edit', '字典编辑', 'icon_dic', '26', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('31', '删除', '/dictionary/delete', '字典删除', 'icon_dic', '26', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('32', '基础信息', '', '基础信息管理', 'icon_rms_infomation', null, '10', '0', '0', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('39', '部门管理', '/organization/manager', '部门管理', 'icon_org', '1', '1', '0', '0', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('56', '编辑', '/organization/edit', '', 'icon_org', '39', '0', '0', '1', '2014-04-19 18:53:41');
INSERT INTO `sys_resource` VALUES ('57', '添加', '/organization/add', '部门管理添加按钮', 'icon_org', '39', '2', '0', '1', '2014-04-19 18:54:51');
INSERT INTO `sys_resource` VALUES ('58', '查看', '/organization/view', '', 'icon_org', '39', '4', '0', '1', '2014-04-19 18:56:11');
INSERT INTO `sys_resource` VALUES ('59', '部门列表', '/organization/treeGrid', '', 'icon_org', '39', '5', '0', '1', '2014-04-19 18:57:06');
INSERT INTO `sys_resource` VALUES ('62', '服务商管理', '/merchant/manager', '', 'icon_rms_merchant', '32', '1', '0', '0', '2002-01-01 09:56:55');
INSERT INTO `sys_resource` VALUES ('63', '项目管理', '/project/manager', '', 'icon_rms_project', '32', '2', '0', '0', '2002-01-01 10:01:12');
INSERT INTO `sys_resource` VALUES ('64', '事件处置', '', '', 'icon_rms_handler_event', null, '3', '0', '0', '2002-01-01 10:14:13');
INSERT INTO `sys_resource` VALUES ('65', '事件管理', '', '', 'icon_rms_manger_event', '64', '1', '0', '0', '2002-01-01 10:37:44');
INSERT INTO `sys_resource` VALUES ('66', '设备故障', '', '', 'icon_rms_trouble_equipment', '64', '5', '0', '0', '2002-01-02 00:18:03');
INSERT INTO `sys_resource` VALUES ('67', '事件处置', '', '', 'icon_rms_handler_event', '64', '3', '0', '0', '2002-01-02 00:18:23');
INSERT INTO `sys_resource` VALUES ('68', '日常维护', '', '', 'icon_rms_maintanance_daily', null, '2', '0', '0', '2002-01-02 09:01:43');
INSERT INTO `sys_resource` VALUES ('69', '巡点服务', '/pointInspect/manager', '', 'icon_rms_service_inspection', '68', '2', '0', '0', '2002-01-02 09:05:01');
INSERT INTO `sys_resource` VALUES ('70', '合同管理', '/contract/manager', '', 'icon_rms_manger_contract', '32', '3', '0', '0', '2002-01-05 01:06:11');
INSERT INTO `sys_resource` VALUES ('71', '任务派单', '', '', 'icon_rms_tasklist', '64', '2', '0', '0', '2002-01-05 01:07:37');
INSERT INTO `sys_resource` VALUES ('76', '信息中心', '', '', 'icon_rms_msg_center', null, '1', '0', '0', '2002-01-05 08:17:45');
INSERT INTO `sys_resource` VALUES ('77', '问题管理', '', '', 'icon_rms_manger_problem', null, '4', '0', '0', '2002-01-05 08:19:05');
INSERT INTO `sys_resource` VALUES ('78', '任务派单', '/task/manager', '', 'icon_rms_tasklist', '68', '1', '0', '0', '2002-01-05 08:20:05');
INSERT INTO `sys_resource` VALUES ('79', '维护档案', '/task/historyManager', '', 'icon_rms_record_maintenance', '68', '3', '0', '0', '2002-01-05 08:39:49');
INSERT INTO `sys_resource` VALUES ('80', '任务计划', '/taskSchedule/manager', '', 'icon_rms_taskplan', '68', '4', '0', '0', '2002-01-05 08:44:27');
INSERT INTO `sys_resource` VALUES ('81', '结算管理', '/task/banlanceManager', '', 'icon_rms_manger_balance', '68', '5', '0', '0', '2002-01-05 08:45:04');
INSERT INTO `sys_resource` VALUES ('82', '问题列表', '', '', 'icon_rms_list_problem', '77', '0', '0', '0', '2002-01-05 08:46:49');
INSERT INTO `sys_resource` VALUES ('84', '通知公告', '/notice/manager', '', 'icon_rms_notification', '76', '2', '0', '0', '2002-01-06 01:01:37');
INSERT INTO `sys_resource` VALUES ('85', '管理制度', '/managersys/manager', '', 'icon_rms_manger_system', '76', '0', '0', '0', '2002-01-06 01:02:14');
INSERT INTO `sys_resource` VALUES ('86', '解决方案', '', '', 'icon_rms_solution', '77', '0', '0', '0', '2002-01-06 01:02:59');
INSERT INTO `sys_resource` VALUES ('87', '知识库管理', '/knowledge/manager', '', 'icon_rms_manger_knowledge', '76', '0', '0', '0', '2002-01-06 01:04:31');
INSERT INTO `sys_resource` VALUES ('88', '报表管理', '', '', 'icon_rms_report_manger', null, '9', '0', '0', '2002-01-06 01:05:48');
INSERT INTO `sys_resource` VALUES ('89', '事件报表', '', '', 'icon_rms_report_event', '88', '1', '0', '0', '2002-01-06 01:06:19');
INSERT INTO `sys_resource` VALUES ('90', '问题报表', '', '', 'icon_rms_report_problem', '88', '2', '0', '0', '2002-01-06 01:06:37');
INSERT INTO `sys_resource` VALUES ('91', '维护记录报表', '/report/taskRecordManager', '', 'icon_rms_report_repair', '88', '3', '0', '0', '2002-01-06 01:07:07');
INSERT INTO `sys_resource` VALUES ('92', '工作单报表', '', '', 'icon_rms_report_worksheet', '88', '5', '0', '0', '2002-01-06 01:07:32');
INSERT INTO `sys_resource` VALUES ('93', '完整处理历史', '', '', 'icon_rms_history_process', '77', '6', '0', '0', '2002-01-06 01:32:08');
INSERT INTO `sys_resource` VALUES ('94', '项目列表', '/project/dataGrid', '', '', '63', '0', '0', '1', '2014-06-11 14:07:06');
INSERT INTO `sys_resource` VALUES ('95', '添加', '/project/add', '', '', '63', '1', '0', '1', '2014-06-11 14:07:56');
INSERT INTO `sys_resource` VALUES ('96', '删除', '/project/delete', '', '', '63', '2', '0', '1', '2014-06-11 14:08:37');
INSERT INTO `sys_resource` VALUES ('97', '编辑', '/project/edit', '', '', '63', '3', '0', '1', '2014-06-11 14:09:18');
INSERT INTO `sys_resource` VALUES ('98', '查看', '/project/detail', '', '', '63', '4', '0', '1', '2014-06-13 08:54:40');
INSERT INTO `sys_resource` VALUES ('99', '服务商列表', '/merchant/dataGrid', '', '', '62', '0', '0', '1', '2014-06-13 15:42:32');
INSERT INTO `sys_resource` VALUES ('100', '添加', '/merchant/add', '', '', '62', '1', '0', '1', '2014-06-13 15:43:12');
INSERT INTO `sys_resource` VALUES ('101', '编辑', '/merchant/edit', '', '', '62', '2', '0', '1', '2014-06-13 15:43:49');
INSERT INTO `sys_resource` VALUES ('102', '删除', '/merchant/delete', '', '', '62', '3', '0', '1', '2014-06-13 15:44:18');
INSERT INTO `sys_resource` VALUES ('103', '查看', '/merchant/detail', '', '', '62', '4', '0', '1', '2014-06-13 15:45:44');
INSERT INTO `sys_resource` VALUES ('104', '搜索', '/merchant/search', '', '', '62', '0', '0', '1', '2014-06-13 17:05:02');
INSERT INTO `sys_resource` VALUES ('105', '添加', '/notice/add', '', '', '84', '0', '0', '1', '2014-06-17 09:51:05');
INSERT INTO `sys_resource` VALUES ('106', '删除', '/notice/delete', '', '', '84', '1', '0', '1', '2014-06-17 09:51:37');
INSERT INTO `sys_resource` VALUES ('107', '编辑', '/notice/edit', '', '', '84', '2', '0', '1', '2014-06-17 09:52:13');
INSERT INTO `sys_resource` VALUES ('108', '查看', '/notice/detail', '', '', '84', '3', '0', '1', '2014-06-17 09:52:56');
INSERT INTO `sys_resource` VALUES ('109', '通知列表', '/notice/dataGrid', '', '', '84', '4', '0', '1', '2014-06-17 09:54:42');
INSERT INTO `sys_resource` VALUES ('110', '搜索', '/notice/search', '', '', '84', '5', '0', '1', '2014-06-17 09:57:12');
INSERT INTO `sys_resource` VALUES ('111', '知识库列表', '/knowledge/dataGrid', '', '', '87', '0', '0', '1', '2014-06-23 09:15:55');
INSERT INTO `sys_resource` VALUES ('112', '添加', '/knowledge/add', '', '', '87', '1', '0', '1', '2014-06-23 09:16:20');
INSERT INTO `sys_resource` VALUES ('113', '删除', '/knowledge/delete', '', '', '87', '0', '0', '1', '2014-06-23 09:16:51');
INSERT INTO `sys_resource` VALUES ('114', '编辑', '/knowledge/edit', '', '', '87', '2', '0', '1', '2014-06-23 09:17:15');
INSERT INTO `sys_resource` VALUES ('115', '查看', '/knowledge/detail', '', '', '87', '4', '0', '1', '2014-06-23 09:18:21');
INSERT INTO `sys_resource` VALUES ('116', '搜索', '/knowledge/search', '', '', '87', '5', '0', '1', '2014-06-23 09:18:51');
INSERT INTO `sys_resource` VALUES ('117', '添加', '/contract/add', '', '', '70', '1', '0', '1', '2014-06-24 08:56:48');
INSERT INTO `sys_resource` VALUES ('118', '删除', '/contract/delete', '', '', '70', '2', '0', '1', '2014-06-24 08:57:12');
INSERT INTO `sys_resource` VALUES ('119', '合同列表', '/contract/dataGrid', '', '', '70', '0', '0', '1', '2014-06-24 08:57:50');
INSERT INTO `sys_resource` VALUES ('120', '编辑', '/contract/edit', '', '', '70', '3', '0', '1', '2014-06-24 08:58:19');
INSERT INTO `sys_resource` VALUES ('121', '查看', '/contract/detail', '', '', '70', '4', '0', '1', '2014-06-24 08:58:52');
INSERT INTO `sys_resource` VALUES ('122', '搜索', '/contract/search', '', '', '70', '5', '0', '1', '2014-06-24 08:59:19');
INSERT INTO `sys_resource` VALUES ('123', '制度列表', '/managersys/dataGrid', '', '', '85', '0', '0', '1', '2014-06-24 17:59:55');
INSERT INTO `sys_resource` VALUES ('124', '添加', '/managersys/add', '', '', '85', '1', '0', '1', '2014-06-24 18:00:08');
INSERT INTO `sys_resource` VALUES ('125', '删除', '/managersys/delete', '', '', '85', '2', '0', '1', '2014-06-24 18:00:34');
INSERT INTO `sys_resource` VALUES ('126', '编辑', '/managersys/edit', '', '', '85', '3', '0', '1', '2014-06-24 18:00:48');
INSERT INTO `sys_resource` VALUES ('127', '查看', '/managersys/detail', '', '', '85', '4', '0', '1', '2014-06-24 18:01:09');
INSERT INTO `sys_resource` VALUES ('128', '搜索', '/managersys/search', '', '', '85', '5', '0', '1', '2014-06-24 18:01:36');
INSERT INTO `sys_resource` VALUES ('129', '软件管理', '/software/manager', '', 'icon_resource', '32', '0', '0', '0', '2014-06-24 19:21:51');
INSERT INTO `sys_resource` VALUES ('130', '软件列表', '/software/dataGrid', '', '', '129', '0', '0', '1', '2014-06-24 19:23:36');
INSERT INTO `sys_resource` VALUES ('131', '添加', '/software/add', '', '', '129', '1', '0', '1', '2014-06-24 19:24:16');
INSERT INTO `sys_resource` VALUES ('132', '删除', '/software/delete', '', '', '129', '2', '0', '1', '2014-06-24 19:24:37');
INSERT INTO `sys_resource` VALUES ('133', '编辑', '/software/edit', '', '', '129', '3', '0', '1', '2014-06-24 19:24:53');
INSERT INTO `sys_resource` VALUES ('134', '查看', '/software/detail', '', '', '129', '4', '0', '1', '2014-06-24 19:25:14');
INSERT INTO `sys_resource` VALUES ('135', '搜索', '/software/search', '', '', '129', '5', '0', '1', '2014-06-24 19:26:19');
INSERT INTO `sys_resource` VALUES ('136', '搜索', '/project/search', '', '', '63', '5', '0', '1', '2014-06-27 11:17:53');
INSERT INTO `sys_resource` VALUES ('137', '添加', '/task/add', '', '', '78', '1', '0', '1', '2014-07-01 11:18:16');
INSERT INTO `sys_resource` VALUES ('138', '任务列表', '/task/dataGrid', '', '', '78', '0', '0', '1', '2014-07-01 11:18:41');
INSERT INTO `sys_resource` VALUES ('139', '删除', '/task/delete', '', '', '78', '2', '0', '1', '2014-07-01 11:19:08');
INSERT INTO `sys_resource` VALUES ('140', '编辑', '/task/edit', '', '', '78', '3', '0', '1', '2014-07-01 11:19:42');
INSERT INTO `sys_resource` VALUES ('141', '查看', '/task/detail', '', '', '78', '4', '0', '1', '2014-07-01 11:20:12');
INSERT INTO `sys_resource` VALUES ('143', '搜索', '/task/search', '', '', '78', '5', '0', '1', '2014-07-01 11:22:19');
INSERT INTO `sys_resource` VALUES ('144', '分配', '/task/assign', '', '', '78', '6', '0', '1', '2014-07-02 16:34:00');
INSERT INTO `sys_resource` VALUES ('145', '接受', '/task/accept', '', '', '78', '7', '0', '1', '2014-07-02 17:02:57');
INSERT INTO `sys_resource` VALUES ('146', '任务处理', '/task/handler', '', '', '78', '8', '0', '1', '2014-07-02 20:49:43');
INSERT INTO `sys_resource` VALUES ('147', '撤销', '/task/cancel', '', '', '78', '8', '0', '1', '2014-07-02 23:11:52');
INSERT INTO `sys_resource` VALUES ('148', '维护档案列表', '/task/historyGrid', '', '', '79', '0', '0', '1', '2014-07-03 14:50:12');
INSERT INTO `sys_resource` VALUES ('149', '详情', '/task/historyDetail', '', '', '79', '1', '0', '1', '2014-07-03 14:52:13');
INSERT INTO `sys_resource` VALUES ('150', '搜索', '/task/historySearch', '', '', '79', '2', '0', '1', '2014-07-03 14:53:45');
INSERT INTO `sys_resource` VALUES ('151', '结算列表', '/task/banlanceGrid', '', '', '81', '0', '0', '1', '2014-07-03 16:59:47');
INSERT INTO `sys_resource` VALUES ('152', '编辑', '/task/banlanceEdit', '', '', '81', '1', '0', '1', '2014-07-03 17:00:27');
INSERT INTO `sys_resource` VALUES ('153', '搜索', '/task/banlanceSearch', '', '', '81', '2', '0', '1', '2014-07-03 17:01:30');
INSERT INTO `sys_resource` VALUES ('154', '计划列表', '/taskSchedule/dataGrid', '', '', '80', '0', '0', '1', '2014-07-06 21:08:18');
INSERT INTO `sys_resource` VALUES ('155', '删除', '/taskSchedule/delete', '', '', '80', '2', '0', '1', '2014-07-06 21:08:51');
INSERT INTO `sys_resource` VALUES ('156', '编辑', '/taskSchedule/edit', '', '', '80', '3', '0', '1', '2014-07-06 21:09:45');
INSERT INTO `sys_resource` VALUES ('157', '搜索', '/taskSchedule/search', '', '', '79', '4', '0', '1', '2014-07-06 21:10:12');
INSERT INTO `sys_resource` VALUES ('158', '执行', '/taskSchedule/startTask', '', '', '80', '0', '0', '1', '2014-07-07 00:07:41');
INSERT INTO `sys_resource` VALUES ('159', '添加', '/taskSchedule/add', '', '', '80', '1', '0', '1', '2014-07-06 21:07:38');
INSERT INTO `sys_resource` VALUES ('160', '巡点列表', '/pointInspect/dataGrid', '', '', '69', '0', '0', '1', '2014-07-08 11:09:02');
INSERT INTO `sys_resource` VALUES ('161', '添加', '/pointInspect/add', '', '', '69', '1', '0', '1', '2014-07-08 11:09:32');
INSERT INTO `sys_resource` VALUES ('162', '删除', '/pointInspect/delete', '', '', '69', '2', '0', '1', '2014-07-08 11:10:19');
INSERT INTO `sys_resource` VALUES ('163', '编辑', '/pointInspect/edit', '', '', '69', '3', '0', '1', '2014-07-08 11:10:42');
INSERT INTO `sys_resource` VALUES ('164', '搜索', '/pointInspect/search', '', '', '69', '4', '0', '1', '2014-07-08 11:11:16');
INSERT INTO `sys_resource` VALUES ('165', '发布', '/notice/publish', '', '', '84', '5', '0', '1', '2014-07-10 21:01:02');
INSERT INTO `sys_resource` VALUES ('166', '登录日志', '/syslog/manager', '', 'icon_rms_sys_log', '1', '5', '0', '0', '2014-07-13 18:02:46');
INSERT INTO `sys_resource` VALUES ('167', '日志列表', '/syslog/dataGrid', '', '', '166', '0', '0', '1', '2014-07-13 18:12:17');
INSERT INTO `sys_resource` VALUES ('168', '删除', '/syslog/delete', '', '', '166', '1', '0', '1', '2014-07-13 18:12:43');
INSERT INTO `sys_resource` VALUES ('169', '清空日志', '/syslog/clear', '', '', '166', '2', '0', '1', '2014-07-13 18:13:11');
INSERT INTO `sys_resource` VALUES ('170', '搜索', '/syslog/search', '', '', '166', '2', '0', '1', '2014-07-13 18:29:26');
INSERT INTO `sys_resource` VALUES ('171', '快键管理', '/shotcut/manager', '', 'icon_rms_sys_shotcut', '1', '6', '0', '0', '2014-07-14 11:16:10');
INSERT INTO `sys_resource` VALUES ('172', '统计分析', '', '', 'icon_rms_statistics', null, '7', '0', '0', '2014-07-15 09:03:43');
INSERT INTO `sys_resource` VALUES ('173', '运维人员定位 ', '/taskStatistics/maintainPosManager', '', 'icon_rms_maintain_positiond', '172', '0', '0', '0', '2014-07-15 09:04:31');
INSERT INTO `sys_resource` VALUES ('174', '任务响应分析 ', '/taskStatistics/taskResponseManager', '', 'icon_rms_time_analyse', '172', '1', '0', '0', '2014-07-15 09:06:04');
INSERT INTO `sys_resource` VALUES ('175', '打印预览', '/report/print', '', '', '91', '0', '0', '1', '2014-07-15 21:51:07');
INSERT INTO `sys_resource` VALUES ('176', '采购管理', '', '', 'icon_rms_purchase', null, '0', '0', '0', '2014-10-14 20:40:27');
INSERT INTO `sys_resource` VALUES ('177', '财务管理', '', '', 'icon_rms_finance', null, '0', '0', '0', '2014-10-14 20:41:41');
INSERT INTO `sys_resource` VALUES ('178', '客户管理', '', '', 'icon_rms_customer', null, '0', '0', '0', '2014-10-14 20:41:52');
INSERT INTO `sys_resource` VALUES ('180', '客户信息', '/customer/manager', '', 'icon_rms_history_process', '178', '0', '0', '0', '2014-10-14 21:50:25');
INSERT INTO `sys_resource` VALUES ('181', '客户信息列表', '/customer/dataGrid', '', '', '180', '1', '0', '1', '2014-10-14 21:51:43');
INSERT INTO `sys_resource` VALUES ('182', '添加', '/customer/add', '', '', '180', '2', '0', '1', '2014-10-14 21:52:33');
INSERT INTO `sys_resource` VALUES ('183', '删除', '/customer/delete', '', '', '180', '3', '0', '1', '2014-10-14 21:53:16');
INSERT INTO `sys_resource` VALUES ('184', '编辑', '/customer/edit', '', '', '180', '4', '0', '1', '2014-10-14 21:54:00');
INSERT INTO `sys_resource` VALUES ('185', '查看', '/customer/detail', '', '', '180', '5', '0', '1', '2014-10-14 21:54:53');
INSERT INTO `sys_resource` VALUES ('186', '搜索', '/customer/search', '', '', '180', '6', '0', '1', '2014-10-14 22:03:10');
INSERT INTO `sys_resource` VALUES ('187', '商品管理', '/goods/manager', '', 'icon_rms_goods', '176', '0', '0', '0', '2014-10-15 20:43:28');
INSERT INTO `sys_resource` VALUES ('188', '商品列表', '/goods/dataGrid', '', '', '187', '0', '0', '1', '2014-10-15 20:44:23');
INSERT INTO `sys_resource` VALUES ('189', '添加', '/goods/add', '', '', '187', '1', '0', '1', '2014-10-15 20:45:01');
INSERT INTO `sys_resource` VALUES ('190', '删除', '/goods/delete', '', '', '187', '2', '0', '1', '2014-10-15 20:45:42');
INSERT INTO `sys_resource` VALUES ('191', '编辑', '/goods/edit', '', '', '187', '3', '0', '1', '2014-10-15 20:46:10');
INSERT INTO `sys_resource` VALUES ('192', '查看', '/goods/detail', '', '', '187', '4', '0', '1', '2014-10-15 20:47:36');
INSERT INTO `sys_resource` VALUES ('193', '搜索', '/goods/search', '', '', '187', '5', '0', '1', '2014-10-15 20:48:14');
INSERT INTO `sys_resource` VALUES ('194', '供应商管理', '/supplier/manager', '', 'icon_rms_customer', '176', '1', '0', '0', '2014-10-15 22:19:59');
INSERT INTO `sys_resource` VALUES ('195', '供应商列表', '/supplier/dataGrid', '', '', '194', '0', '0', '1', '2014-10-15 22:20:31');
INSERT INTO `sys_resource` VALUES ('196', '添加', '/supplier/add', '', '', '194', '1', '0', '1', '2014-10-15 22:20:58');
INSERT INTO `sys_resource` VALUES ('197', '删除', '/supplier/delete', '', '', '194', '2', '0', '1', '2014-10-15 22:21:23');
INSERT INTO `sys_resource` VALUES ('198', '编辑', '/supplier/edit', '', '', '194', '3', '0', '1', '2014-10-15 22:22:13');
INSERT INTO `sys_resource` VALUES ('199', '查看', '/supplier/detail', '', '', '194', '4', '0', '1', '2014-10-15 22:22:48');
INSERT INTO `sys_resource` VALUES ('200', '搜索', '/supplier/search', '', '', '194', '5', '0', '1', '2014-10-15 22:23:14');
INSERT INTO `sys_resource` VALUES ('202', '报价单', '/quotation/manager', '', 'icon_rms_finance', '178', '1', '0', '0', '2014-10-15 22:51:30');
INSERT INTO `sys_resource` VALUES ('203', '配送订单', '/order/manager', '', 'icon_resource', '178', '2', '0', '0', '2014-10-15 22:51:55');
INSERT INTO `sys_resource` VALUES ('204', '配送结算单', '', '', 'icon_rms_manger_balance', '178', '3', '0', '0', '2014-10-15 22:52:26');
INSERT INTO `sys_resource` VALUES ('205', '报价单列表', '/quotation/dataGrid', '', '', '202', '0', '0', '1', '2014-10-18 22:01:25');
INSERT INTO `sys_resource` VALUES ('206', '添加', '/quotation/add', '', '', '202', '1', '0', '1', '2014-10-18 22:02:12');
INSERT INTO `sys_resource` VALUES ('207', '删除', '/quotation/delete', '', '', '202', '2', '0', '1', '2014-10-18 22:02:43');
INSERT INTO `sys_resource` VALUES ('208', '编辑', '/quotation/edit', '', '', '202', '3', '0', '1', '2014-10-18 22:03:08');
INSERT INTO `sys_resource` VALUES ('209', '查看', '/quotation/detail', '', '', '202', '4', '0', '1', '2014-10-18 22:03:41');
INSERT INTO `sys_resource` VALUES ('210', '搜索', '/quotation/search', '', '', '202', '5', '0', '1', '2014-10-18 22:04:06');
INSERT INTO `sys_resource` VALUES ('211', '订单列表', '/order/dataGrid', '', '', '203', '0', '0', '1', '2014-10-22 21:47:31');
INSERT INTO `sys_resource` VALUES ('212', '添加', '/order/add', '', '', '203', '1', '0', '1', '2014-10-22 21:48:12');
INSERT INTO `sys_resource` VALUES ('213', '删除', '/order/delete', '', '', '203', '2', '0', '1', '2014-10-22 21:48:53');
INSERT INTO `sys_resource` VALUES ('214', '编辑', '/order/edit', '', '', '203', '3', '0', '1', '2014-10-22 21:49:29');
INSERT INTO `sys_resource` VALUES ('215', '查看', '/order/detail', '', '', '203', '4', '0', '1', '2014-10-22 21:50:08');
INSERT INTO `sys_resource` VALUES ('216', '搜索', '/order/search', '', '', '203', '5', '0', '1', '2014-10-22 21:50:43');
INSERT INTO `sys_resource` VALUES ('217', '采购计划单', '/purchasePlan/manager', '', 'icon_rms_tasklist', '176', '2', '0', '0', '2014-10-26 16:42:36');
INSERT INTO `sys_resource` VALUES ('218', '采购单列表', '/purchasePlan/dataGrid', '', '', '217', '0', '0', '1', '2014-10-26 16:43:39');
INSERT INTO `sys_resource` VALUES ('219', '编辑', '/purchasePlan/edit', '', '', '217', '1', '0', '1', '2014-10-26 16:44:24');
INSERT INTO `sys_resource` VALUES ('220', '删除', '/purchasePlan/delete', '', '', '217', '2', '0', '1', '2014-10-26 16:45:06');
INSERT INTO `sys_resource` VALUES ('221', '查看', '/purchasePlan/detail', '', '', '217', '3', '0', '1', '2014-10-26 16:45:36');
INSERT INTO `sys_resource` VALUES ('222', '搜索', '/purchasePlan/search', '', '', '217', '4', '0', '1', '2014-10-26 16:46:04');
INSERT INTO `sys_resource` VALUES ('223', '添加', '/purchasePlan/add', '', '', '217', '0', '0', '1', '2014-10-26 17:01:53');
INSERT INTO `sys_resource` VALUES ('224', '采购结算单', '/purchaseBalance/manager', '', 'icon_rms_manger_balance', '176', '3', '0', '0', '2014-10-26 21:16:55');
INSERT INTO `sys_resource` VALUES ('225', '清单列表', '/purchaseBalance/dataGrid', '', '', '224', '0', '0', '1', '2014-10-26 21:19:03');
INSERT INTO `sys_resource` VALUES ('226', '添加', '/purchaseBalance/add', '', '', '224', '1', '0', '1', '2014-10-26 21:19:41');
INSERT INTO `sys_resource` VALUES ('227', '编辑', '/purchaseBalance/edit', '', '', '224', '2', '0', '1', '2014-10-26 21:20:07');
INSERT INTO `sys_resource` VALUES ('228', '删除', '/purchaseBalance/delete', '', '', '224', '3', '0', '1', '2014-10-26 21:20:52');
INSERT INTO `sys_resource` VALUES ('229', '查看', '/purchaseBalance/detail', '', '', '224', '4', '0', '1', '2014-10-26 21:21:30');
INSERT INTO `sys_resource` VALUES ('230', '搜索', '/purchaseBalance/search', '', '', '224', '5', '0', '1', '2014-10-26 21:21:57');
INSERT INTO `sys_resource` VALUES ('231', '销售报表', '', '', 'icon_rms_statistics', '177', '0', '0', '0', '2014-10-27 22:46:23');
INSERT INTO `sys_resource` VALUES ('232', '利润报表', '', '', 'icon_rms_report_manger', '177', '0', '0', '0', '2014-10-27 22:47:13');
INSERT INTO `sys_resource` VALUES ('236', '工程款拨付管理', '', '', 'icon_resource', null, '2', '0', '0', '2015-04-28 00:18:27');
INSERT INTO `sys_resource` VALUES ('234', '项目管理', '', '', 'icon_rms_project', null, '0', '0', '0', '2015-04-28 00:12:22');
INSERT INTO `sys_resource` VALUES ('235', '投标保证金管理', '', '', 'icon_resource', null, '1', '0', '0', '2015-04-28 00:16:58');
INSERT INTO `sys_resource` VALUES ('237', '报销管理', '', '', 'icon_resource', null, '4', '0', '0', '2015-04-28 00:18:49');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `seq` int(11) DEFAULT NULL,
  `description` varchar(150) DEFAULT NULL,
  `isdefault` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '超级管理员', '0', '超级管理员，拥有全部权限', '0');
INSERT INTO `sys_role` VALUES ('4', '普通用户', '1', '普通用户', '1');
INSERT INTO `sys_role` VALUES ('6', '运维分管领导', '2', '运维组', '1');
INSERT INTO `sys_role` VALUES ('7', '运维项目经理', '3', '运维组', '1');
INSERT INTO `sys_role` VALUES ('8', '运维工程师', '4', '运维组', '1');
INSERT INTO `sys_role` VALUES ('10', '司法厅领导', '6', '使用单位', '1');
INSERT INTO `sys_role` VALUES ('11', '监所领导', '7', '使用单位', '1');
INSERT INTO `sys_role` VALUES ('12', '操作员', '8', '使用单位', '1');
INSERT INTO `sys_role` VALUES ('13', '软件分管领导', '9', '开发小组', '1');
INSERT INTO `sys_role` VALUES ('14', '软件项目经理', '10', '开发小组', '1');
INSERT INTO `sys_role` VALUES ('15', '软件开发工程师', '11', '开发小组', '1');
INSERT INTO `sys_role` VALUES ('16', '客服分管领导', '12', '客服部，负责硬件维护', '1');
INSERT INTO `sys_role` VALUES ('17', '客服项目经理', '13', '客服部，负责硬件维护', '1');
INSERT INTO `sys_role` VALUES ('18', '技术工程师', '14', '客服部，负责硬件维护', '1');
INSERT INTO `sys_role` VALUES ('19', '销售经理', '15', '设备供应厂商', '1');
INSERT INTO `sys_role` VALUES ('20', 'test', '0', '', '1');

-- ----------------------------
-- Table structure for sys_role_resource
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_resource`;
CREATE TABLE `sys_role_resource` (
  `role_id` smallint(6) NOT NULL,
  `resource_id` smallint(6) NOT NULL,
  PRIMARY KEY (`role_id`,`resource_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_resource
-- ----------------------------
INSERT INTO `sys_role_resource` VALUES ('1', '1');
INSERT INTO `sys_role_resource` VALUES ('1', '2');
INSERT INTO `sys_role_resource` VALUES ('1', '3');
INSERT INTO `sys_role_resource` VALUES ('1', '4');
INSERT INTO `sys_role_resource` VALUES ('1', '5');
INSERT INTO `sys_role_resource` VALUES ('1', '6');
INSERT INTO `sys_role_resource` VALUES ('1', '7');
INSERT INTO `sys_role_resource` VALUES ('1', '8');
INSERT INTO `sys_role_resource` VALUES ('1', '10');
INSERT INTO `sys_role_resource` VALUES ('1', '11');
INSERT INTO `sys_role_resource` VALUES ('1', '12');
INSERT INTO `sys_role_resource` VALUES ('1', '13');
INSERT INTO `sys_role_resource` VALUES ('1', '14');
INSERT INTO `sys_role_resource` VALUES ('1', '15');
INSERT INTO `sys_role_resource` VALUES ('1', '16');
INSERT INTO `sys_role_resource` VALUES ('1', '17');
INSERT INTO `sys_role_resource` VALUES ('1', '18');
INSERT INTO `sys_role_resource` VALUES ('1', '19');
INSERT INTO `sys_role_resource` VALUES ('1', '26');
INSERT INTO `sys_role_resource` VALUES ('1', '27');
INSERT INTO `sys_role_resource` VALUES ('1', '28');
INSERT INTO `sys_role_resource` VALUES ('1', '29');
INSERT INTO `sys_role_resource` VALUES ('1', '30');
INSERT INTO `sys_role_resource` VALUES ('1', '31');
INSERT INTO `sys_role_resource` VALUES ('1', '32');
INSERT INTO `sys_role_resource` VALUES ('1', '39');
INSERT INTO `sys_role_resource` VALUES ('1', '56');
INSERT INTO `sys_role_resource` VALUES ('1', '57');
INSERT INTO `sys_role_resource` VALUES ('1', '58');
INSERT INTO `sys_role_resource` VALUES ('1', '59');
INSERT INTO `sys_role_resource` VALUES ('1', '62');
INSERT INTO `sys_role_resource` VALUES ('1', '63');
INSERT INTO `sys_role_resource` VALUES ('1', '64');
INSERT INTO `sys_role_resource` VALUES ('1', '65');
INSERT INTO `sys_role_resource` VALUES ('1', '66');
INSERT INTO `sys_role_resource` VALUES ('1', '67');
INSERT INTO `sys_role_resource` VALUES ('1', '68');
INSERT INTO `sys_role_resource` VALUES ('1', '69');
INSERT INTO `sys_role_resource` VALUES ('1', '70');
INSERT INTO `sys_role_resource` VALUES ('1', '71');
INSERT INTO `sys_role_resource` VALUES ('1', '76');
INSERT INTO `sys_role_resource` VALUES ('1', '77');
INSERT INTO `sys_role_resource` VALUES ('1', '78');
INSERT INTO `sys_role_resource` VALUES ('1', '79');
INSERT INTO `sys_role_resource` VALUES ('1', '80');
INSERT INTO `sys_role_resource` VALUES ('1', '81');
INSERT INTO `sys_role_resource` VALUES ('1', '82');
INSERT INTO `sys_role_resource` VALUES ('1', '84');
INSERT INTO `sys_role_resource` VALUES ('1', '85');
INSERT INTO `sys_role_resource` VALUES ('1', '86');
INSERT INTO `sys_role_resource` VALUES ('1', '87');
INSERT INTO `sys_role_resource` VALUES ('1', '88');
INSERT INTO `sys_role_resource` VALUES ('1', '89');
INSERT INTO `sys_role_resource` VALUES ('1', '90');
INSERT INTO `sys_role_resource` VALUES ('1', '91');
INSERT INTO `sys_role_resource` VALUES ('1', '92');
INSERT INTO `sys_role_resource` VALUES ('1', '93');
INSERT INTO `sys_role_resource` VALUES ('1', '94');
INSERT INTO `sys_role_resource` VALUES ('1', '95');
INSERT INTO `sys_role_resource` VALUES ('1', '96');
INSERT INTO `sys_role_resource` VALUES ('1', '97');
INSERT INTO `sys_role_resource` VALUES ('1', '98');
INSERT INTO `sys_role_resource` VALUES ('1', '99');
INSERT INTO `sys_role_resource` VALUES ('1', '100');
INSERT INTO `sys_role_resource` VALUES ('1', '101');
INSERT INTO `sys_role_resource` VALUES ('1', '102');
INSERT INTO `sys_role_resource` VALUES ('1', '103');
INSERT INTO `sys_role_resource` VALUES ('1', '104');
INSERT INTO `sys_role_resource` VALUES ('1', '105');
INSERT INTO `sys_role_resource` VALUES ('1', '106');
INSERT INTO `sys_role_resource` VALUES ('1', '107');
INSERT INTO `sys_role_resource` VALUES ('1', '108');
INSERT INTO `sys_role_resource` VALUES ('1', '109');
INSERT INTO `sys_role_resource` VALUES ('1', '110');
INSERT INTO `sys_role_resource` VALUES ('1', '111');
INSERT INTO `sys_role_resource` VALUES ('1', '112');
INSERT INTO `sys_role_resource` VALUES ('1', '113');
INSERT INTO `sys_role_resource` VALUES ('1', '114');
INSERT INTO `sys_role_resource` VALUES ('1', '115');
INSERT INTO `sys_role_resource` VALUES ('1', '116');
INSERT INTO `sys_role_resource` VALUES ('1', '117');
INSERT INTO `sys_role_resource` VALUES ('1', '118');
INSERT INTO `sys_role_resource` VALUES ('1', '119');
INSERT INTO `sys_role_resource` VALUES ('1', '120');
INSERT INTO `sys_role_resource` VALUES ('1', '121');
INSERT INTO `sys_role_resource` VALUES ('1', '122');
INSERT INTO `sys_role_resource` VALUES ('1', '123');
INSERT INTO `sys_role_resource` VALUES ('1', '124');
INSERT INTO `sys_role_resource` VALUES ('1', '125');
INSERT INTO `sys_role_resource` VALUES ('1', '126');
INSERT INTO `sys_role_resource` VALUES ('1', '127');
INSERT INTO `sys_role_resource` VALUES ('1', '128');
INSERT INTO `sys_role_resource` VALUES ('1', '129');
INSERT INTO `sys_role_resource` VALUES ('1', '130');
INSERT INTO `sys_role_resource` VALUES ('1', '131');
INSERT INTO `sys_role_resource` VALUES ('1', '132');
INSERT INTO `sys_role_resource` VALUES ('1', '133');
INSERT INTO `sys_role_resource` VALUES ('1', '134');
INSERT INTO `sys_role_resource` VALUES ('1', '135');
INSERT INTO `sys_role_resource` VALUES ('1', '136');
INSERT INTO `sys_role_resource` VALUES ('1', '137');
INSERT INTO `sys_role_resource` VALUES ('1', '138');
INSERT INTO `sys_role_resource` VALUES ('1', '139');
INSERT INTO `sys_role_resource` VALUES ('1', '140');
INSERT INTO `sys_role_resource` VALUES ('1', '141');
INSERT INTO `sys_role_resource` VALUES ('1', '143');
INSERT INTO `sys_role_resource` VALUES ('1', '144');
INSERT INTO `sys_role_resource` VALUES ('1', '145');
INSERT INTO `sys_role_resource` VALUES ('1', '146');
INSERT INTO `sys_role_resource` VALUES ('1', '147');
INSERT INTO `sys_role_resource` VALUES ('1', '148');
INSERT INTO `sys_role_resource` VALUES ('1', '149');
INSERT INTO `sys_role_resource` VALUES ('1', '150');
INSERT INTO `sys_role_resource` VALUES ('1', '151');
INSERT INTO `sys_role_resource` VALUES ('1', '152');
INSERT INTO `sys_role_resource` VALUES ('1', '153');
INSERT INTO `sys_role_resource` VALUES ('1', '154');
INSERT INTO `sys_role_resource` VALUES ('1', '155');
INSERT INTO `sys_role_resource` VALUES ('1', '156');
INSERT INTO `sys_role_resource` VALUES ('1', '157');
INSERT INTO `sys_role_resource` VALUES ('1', '158');
INSERT INTO `sys_role_resource` VALUES ('1', '159');
INSERT INTO `sys_role_resource` VALUES ('1', '160');
INSERT INTO `sys_role_resource` VALUES ('1', '161');
INSERT INTO `sys_role_resource` VALUES ('1', '162');
INSERT INTO `sys_role_resource` VALUES ('1', '163');
INSERT INTO `sys_role_resource` VALUES ('1', '164');
INSERT INTO `sys_role_resource` VALUES ('1', '165');
INSERT INTO `sys_role_resource` VALUES ('1', '166');
INSERT INTO `sys_role_resource` VALUES ('1', '167');
INSERT INTO `sys_role_resource` VALUES ('1', '168');
INSERT INTO `sys_role_resource` VALUES ('1', '169');
INSERT INTO `sys_role_resource` VALUES ('1', '170');
INSERT INTO `sys_role_resource` VALUES ('1', '171');
INSERT INTO `sys_role_resource` VALUES ('1', '172');
INSERT INTO `sys_role_resource` VALUES ('1', '173');
INSERT INTO `sys_role_resource` VALUES ('1', '174');
INSERT INTO `sys_role_resource` VALUES ('1', '175');
INSERT INTO `sys_role_resource` VALUES ('1', '176');
INSERT INTO `sys_role_resource` VALUES ('1', '177');
INSERT INTO `sys_role_resource` VALUES ('1', '178');
INSERT INTO `sys_role_resource` VALUES ('1', '180');
INSERT INTO `sys_role_resource` VALUES ('1', '181');
INSERT INTO `sys_role_resource` VALUES ('1', '182');
INSERT INTO `sys_role_resource` VALUES ('1', '183');
INSERT INTO `sys_role_resource` VALUES ('1', '184');
INSERT INTO `sys_role_resource` VALUES ('1', '185');
INSERT INTO `sys_role_resource` VALUES ('1', '186');
INSERT INTO `sys_role_resource` VALUES ('1', '187');
INSERT INTO `sys_role_resource` VALUES ('1', '188');
INSERT INTO `sys_role_resource` VALUES ('1', '189');
INSERT INTO `sys_role_resource` VALUES ('1', '190');
INSERT INTO `sys_role_resource` VALUES ('1', '191');
INSERT INTO `sys_role_resource` VALUES ('1', '192');
INSERT INTO `sys_role_resource` VALUES ('1', '193');
INSERT INTO `sys_role_resource` VALUES ('1', '194');
INSERT INTO `sys_role_resource` VALUES ('1', '195');
INSERT INTO `sys_role_resource` VALUES ('1', '196');
INSERT INTO `sys_role_resource` VALUES ('1', '197');
INSERT INTO `sys_role_resource` VALUES ('1', '198');
INSERT INTO `sys_role_resource` VALUES ('1', '199');
INSERT INTO `sys_role_resource` VALUES ('1', '200');
INSERT INTO `sys_role_resource` VALUES ('1', '202');
INSERT INTO `sys_role_resource` VALUES ('1', '203');
INSERT INTO `sys_role_resource` VALUES ('1', '204');
INSERT INTO `sys_role_resource` VALUES ('1', '205');
INSERT INTO `sys_role_resource` VALUES ('1', '206');
INSERT INTO `sys_role_resource` VALUES ('1', '207');
INSERT INTO `sys_role_resource` VALUES ('1', '208');
INSERT INTO `sys_role_resource` VALUES ('1', '209');
INSERT INTO `sys_role_resource` VALUES ('1', '210');
INSERT INTO `sys_role_resource` VALUES ('1', '211');
INSERT INTO `sys_role_resource` VALUES ('1', '212');
INSERT INTO `sys_role_resource` VALUES ('1', '213');
INSERT INTO `sys_role_resource` VALUES ('1', '214');
INSERT INTO `sys_role_resource` VALUES ('1', '215');
INSERT INTO `sys_role_resource` VALUES ('1', '216');
INSERT INTO `sys_role_resource` VALUES ('1', '217');
INSERT INTO `sys_role_resource` VALUES ('1', '218');
INSERT INTO `sys_role_resource` VALUES ('1', '219');
INSERT INTO `sys_role_resource` VALUES ('1', '220');
INSERT INTO `sys_role_resource` VALUES ('1', '221');
INSERT INTO `sys_role_resource` VALUES ('1', '222');
INSERT INTO `sys_role_resource` VALUES ('1', '223');
INSERT INTO `sys_role_resource` VALUES ('1', '224');
INSERT INTO `sys_role_resource` VALUES ('1', '225');
INSERT INTO `sys_role_resource` VALUES ('1', '226');
INSERT INTO `sys_role_resource` VALUES ('1', '227');
INSERT INTO `sys_role_resource` VALUES ('1', '228');
INSERT INTO `sys_role_resource` VALUES ('1', '229');
INSERT INTO `sys_role_resource` VALUES ('1', '230');
INSERT INTO `sys_role_resource` VALUES ('1', '231');
INSERT INTO `sys_role_resource` VALUES ('1', '232');
INSERT INTO `sys_role_resource` VALUES ('4', '3');
INSERT INTO `sys_role_resource` VALUES ('4', '5');
INSERT INTO `sys_role_resource` VALUES ('4', '6');
INSERT INTO `sys_role_resource` VALUES ('4', '7');
INSERT INTO `sys_role_resource` VALUES ('4', '10');
INSERT INTO `sys_role_resource` VALUES ('4', '12');
INSERT INTO `sys_role_resource` VALUES ('4', '13');
INSERT INTO `sys_role_resource` VALUES ('4', '14');
INSERT INTO `sys_role_resource` VALUES ('4', '32');
INSERT INTO `sys_role_resource` VALUES ('4', '56');
INSERT INTO `sys_role_resource` VALUES ('4', '62');
INSERT INTO `sys_role_resource` VALUES ('4', '63');
INSERT INTO `sys_role_resource` VALUES ('4', '64');
INSERT INTO `sys_role_resource` VALUES ('4', '65');
INSERT INTO `sys_role_resource` VALUES ('4', '69');
INSERT INTO `sys_role_resource` VALUES ('4', '70');
INSERT INTO `sys_role_resource` VALUES ('4', '84');
INSERT INTO `sys_role_resource` VALUES ('4', '85');
INSERT INTO `sys_role_resource` VALUES ('4', '87');
INSERT INTO `sys_role_resource` VALUES ('4', '94');
INSERT INTO `sys_role_resource` VALUES ('4', '99');
INSERT INTO `sys_role_resource` VALUES ('4', '105');
INSERT INTO `sys_role_resource` VALUES ('4', '106');
INSERT INTO `sys_role_resource` VALUES ('4', '107');
INSERT INTO `sys_role_resource` VALUES ('4', '108');
INSERT INTO `sys_role_resource` VALUES ('4', '109');
INSERT INTO `sys_role_resource` VALUES ('4', '111');
INSERT INTO `sys_role_resource` VALUES ('4', '112');
INSERT INTO `sys_role_resource` VALUES ('4', '113');
INSERT INTO `sys_role_resource` VALUES ('4', '119');
INSERT INTO `sys_role_resource` VALUES ('4', '123');
INSERT INTO `sys_role_resource` VALUES ('4', '124');
INSERT INTO `sys_role_resource` VALUES ('4', '125');
INSERT INTO `sys_role_resource` VALUES ('4', '126');
INSERT INTO `sys_role_resource` VALUES ('4', '127');
INSERT INTO `sys_role_resource` VALUES ('4', '128');
INSERT INTO `sys_role_resource` VALUES ('4', '129');
INSERT INTO `sys_role_resource` VALUES ('4', '130');
INSERT INTO `sys_role_resource` VALUES ('4', '131');
INSERT INTO `sys_role_resource` VALUES ('4', '134');
INSERT INTO `sys_role_resource` VALUES ('4', '135');
INSERT INTO `sys_role_resource` VALUES ('6', '64');
INSERT INTO `sys_role_resource` VALUES ('6', '65');
INSERT INTO `sys_role_resource` VALUES ('6', '66');
INSERT INTO `sys_role_resource` VALUES ('6', '67');
INSERT INTO `sys_role_resource` VALUES ('6', '68');
INSERT INTO `sys_role_resource` VALUES ('6', '69');
INSERT INTO `sys_role_resource` VALUES ('6', '71');
INSERT INTO `sys_role_resource` VALUES ('6', '76');
INSERT INTO `sys_role_resource` VALUES ('6', '77');
INSERT INTO `sys_role_resource` VALUES ('6', '78');
INSERT INTO `sys_role_resource` VALUES ('6', '79');
INSERT INTO `sys_role_resource` VALUES ('6', '80');
INSERT INTO `sys_role_resource` VALUES ('6', '81');
INSERT INTO `sys_role_resource` VALUES ('6', '82');
INSERT INTO `sys_role_resource` VALUES ('6', '84');
INSERT INTO `sys_role_resource` VALUES ('6', '85');
INSERT INTO `sys_role_resource` VALUES ('6', '86');
INSERT INTO `sys_role_resource` VALUES ('6', '87');
INSERT INTO `sys_role_resource` VALUES ('6', '88');
INSERT INTO `sys_role_resource` VALUES ('6', '89');
INSERT INTO `sys_role_resource` VALUES ('6', '90');
INSERT INTO `sys_role_resource` VALUES ('6', '91');
INSERT INTO `sys_role_resource` VALUES ('6', '92');
INSERT INTO `sys_role_resource` VALUES ('6', '93');
INSERT INTO `sys_role_resource` VALUES ('6', '105');
INSERT INTO `sys_role_resource` VALUES ('6', '106');
INSERT INTO `sys_role_resource` VALUES ('6', '107');
INSERT INTO `sys_role_resource` VALUES ('6', '108');
INSERT INTO `sys_role_resource` VALUES ('6', '109');
INSERT INTO `sys_role_resource` VALUES ('6', '110');
INSERT INTO `sys_role_resource` VALUES ('6', '111');
INSERT INTO `sys_role_resource` VALUES ('6', '112');
INSERT INTO `sys_role_resource` VALUES ('6', '113');
INSERT INTO `sys_role_resource` VALUES ('6', '114');
INSERT INTO `sys_role_resource` VALUES ('6', '115');
INSERT INTO `sys_role_resource` VALUES ('6', '116');
INSERT INTO `sys_role_resource` VALUES ('6', '123');
INSERT INTO `sys_role_resource` VALUES ('6', '124');
INSERT INTO `sys_role_resource` VALUES ('6', '125');
INSERT INTO `sys_role_resource` VALUES ('6', '126');
INSERT INTO `sys_role_resource` VALUES ('6', '127');
INSERT INTO `sys_role_resource` VALUES ('6', '128');
INSERT INTO `sys_role_resource` VALUES ('6', '137');
INSERT INTO `sys_role_resource` VALUES ('6', '138');
INSERT INTO `sys_role_resource` VALUES ('6', '139');
INSERT INTO `sys_role_resource` VALUES ('6', '140');
INSERT INTO `sys_role_resource` VALUES ('6', '141');
INSERT INTO `sys_role_resource` VALUES ('6', '143');
INSERT INTO `sys_role_resource` VALUES ('6', '144');
INSERT INTO `sys_role_resource` VALUES ('6', '147');
INSERT INTO `sys_role_resource` VALUES ('7', '32');
INSERT INTO `sys_role_resource` VALUES ('7', '62');
INSERT INTO `sys_role_resource` VALUES ('7', '63');
INSERT INTO `sys_role_resource` VALUES ('7', '64');
INSERT INTO `sys_role_resource` VALUES ('7', '65');
INSERT INTO `sys_role_resource` VALUES ('7', '66');
INSERT INTO `sys_role_resource` VALUES ('7', '67');
INSERT INTO `sys_role_resource` VALUES ('7', '68');
INSERT INTO `sys_role_resource` VALUES ('7', '69');
INSERT INTO `sys_role_resource` VALUES ('7', '70');
INSERT INTO `sys_role_resource` VALUES ('7', '71');
INSERT INTO `sys_role_resource` VALUES ('7', '76');
INSERT INTO `sys_role_resource` VALUES ('7', '77');
INSERT INTO `sys_role_resource` VALUES ('7', '78');
INSERT INTO `sys_role_resource` VALUES ('7', '79');
INSERT INTO `sys_role_resource` VALUES ('7', '80');
INSERT INTO `sys_role_resource` VALUES ('7', '81');
INSERT INTO `sys_role_resource` VALUES ('7', '82');
INSERT INTO `sys_role_resource` VALUES ('7', '84');
INSERT INTO `sys_role_resource` VALUES ('7', '85');
INSERT INTO `sys_role_resource` VALUES ('7', '86');
INSERT INTO `sys_role_resource` VALUES ('7', '87');
INSERT INTO `sys_role_resource` VALUES ('7', '88');
INSERT INTO `sys_role_resource` VALUES ('7', '89');
INSERT INTO `sys_role_resource` VALUES ('7', '90');
INSERT INTO `sys_role_resource` VALUES ('7', '91');
INSERT INTO `sys_role_resource` VALUES ('7', '92');
INSERT INTO `sys_role_resource` VALUES ('7', '93');
INSERT INTO `sys_role_resource` VALUES ('7', '94');
INSERT INTO `sys_role_resource` VALUES ('7', '95');
INSERT INTO `sys_role_resource` VALUES ('7', '96');
INSERT INTO `sys_role_resource` VALUES ('7', '97');
INSERT INTO `sys_role_resource` VALUES ('7', '98');
INSERT INTO `sys_role_resource` VALUES ('7', '99');
INSERT INTO `sys_role_resource` VALUES ('7', '100');
INSERT INTO `sys_role_resource` VALUES ('7', '101');
INSERT INTO `sys_role_resource` VALUES ('7', '102');
INSERT INTO `sys_role_resource` VALUES ('7', '103');
INSERT INTO `sys_role_resource` VALUES ('7', '104');
INSERT INTO `sys_role_resource` VALUES ('7', '105');
INSERT INTO `sys_role_resource` VALUES ('7', '106');
INSERT INTO `sys_role_resource` VALUES ('7', '107');
INSERT INTO `sys_role_resource` VALUES ('7', '108');
INSERT INTO `sys_role_resource` VALUES ('7', '109');
INSERT INTO `sys_role_resource` VALUES ('7', '110');
INSERT INTO `sys_role_resource` VALUES ('7', '111');
INSERT INTO `sys_role_resource` VALUES ('7', '112');
INSERT INTO `sys_role_resource` VALUES ('7', '113');
INSERT INTO `sys_role_resource` VALUES ('7', '114');
INSERT INTO `sys_role_resource` VALUES ('7', '115');
INSERT INTO `sys_role_resource` VALUES ('7', '116');
INSERT INTO `sys_role_resource` VALUES ('7', '117');
INSERT INTO `sys_role_resource` VALUES ('7', '118');
INSERT INTO `sys_role_resource` VALUES ('7', '119');
INSERT INTO `sys_role_resource` VALUES ('7', '120');
INSERT INTO `sys_role_resource` VALUES ('7', '121');
INSERT INTO `sys_role_resource` VALUES ('7', '122');
INSERT INTO `sys_role_resource` VALUES ('7', '123');
INSERT INTO `sys_role_resource` VALUES ('7', '124');
INSERT INTO `sys_role_resource` VALUES ('7', '125');
INSERT INTO `sys_role_resource` VALUES ('7', '126');
INSERT INTO `sys_role_resource` VALUES ('7', '127');
INSERT INTO `sys_role_resource` VALUES ('7', '128');
INSERT INTO `sys_role_resource` VALUES ('7', '129');
INSERT INTO `sys_role_resource` VALUES ('7', '130');
INSERT INTO `sys_role_resource` VALUES ('7', '131');
INSERT INTO `sys_role_resource` VALUES ('7', '132');
INSERT INTO `sys_role_resource` VALUES ('7', '133');
INSERT INTO `sys_role_resource` VALUES ('7', '134');
INSERT INTO `sys_role_resource` VALUES ('7', '135');
INSERT INTO `sys_role_resource` VALUES ('7', '136');
INSERT INTO `sys_role_resource` VALUES ('7', '137');
INSERT INTO `sys_role_resource` VALUES ('7', '138');
INSERT INTO `sys_role_resource` VALUES ('7', '139');
INSERT INTO `sys_role_resource` VALUES ('7', '140');
INSERT INTO `sys_role_resource` VALUES ('7', '141');
INSERT INTO `sys_role_resource` VALUES ('7', '143');
INSERT INTO `sys_role_resource` VALUES ('7', '144');
INSERT INTO `sys_role_resource` VALUES ('7', '145');
INSERT INTO `sys_role_resource` VALUES ('7', '146');
INSERT INTO `sys_role_resource` VALUES ('7', '147');
INSERT INTO `sys_role_resource` VALUES ('7', '148');
INSERT INTO `sys_role_resource` VALUES ('7', '149');
INSERT INTO `sys_role_resource` VALUES ('7', '150');
INSERT INTO `sys_role_resource` VALUES ('7', '151');
INSERT INTO `sys_role_resource` VALUES ('7', '152');
INSERT INTO `sys_role_resource` VALUES ('7', '153');
INSERT INTO `sys_role_resource` VALUES ('7', '154');
INSERT INTO `sys_role_resource` VALUES ('7', '155');
INSERT INTO `sys_role_resource` VALUES ('7', '156');
INSERT INTO `sys_role_resource` VALUES ('7', '157');
INSERT INTO `sys_role_resource` VALUES ('7', '158');
INSERT INTO `sys_role_resource` VALUES ('7', '159');
INSERT INTO `sys_role_resource` VALUES ('7', '160');
INSERT INTO `sys_role_resource` VALUES ('7', '161');
INSERT INTO `sys_role_resource` VALUES ('7', '162');
INSERT INTO `sys_role_resource` VALUES ('7', '163');
INSERT INTO `sys_role_resource` VALUES ('7', '164');
INSERT INTO `sys_role_resource` VALUES ('7', '165');
INSERT INTO `sys_role_resource` VALUES ('7', '166');
INSERT INTO `sys_role_resource` VALUES ('7', '167');
INSERT INTO `sys_role_resource` VALUES ('7', '168');
INSERT INTO `sys_role_resource` VALUES ('7', '169');
INSERT INTO `sys_role_resource` VALUES ('7', '170');
INSERT INTO `sys_role_resource` VALUES ('7', '171');
INSERT INTO `sys_role_resource` VALUES ('7', '172');
INSERT INTO `sys_role_resource` VALUES ('7', '173');
INSERT INTO `sys_role_resource` VALUES ('7', '174');
INSERT INTO `sys_role_resource` VALUES ('7', '175');
INSERT INTO `sys_role_resource` VALUES ('8', '1');
INSERT INTO `sys_role_resource` VALUES ('8', '64');
INSERT INTO `sys_role_resource` VALUES ('8', '65');
INSERT INTO `sys_role_resource` VALUES ('8', '66');
INSERT INTO `sys_role_resource` VALUES ('8', '67');
INSERT INTO `sys_role_resource` VALUES ('8', '68');
INSERT INTO `sys_role_resource` VALUES ('8', '69');
INSERT INTO `sys_role_resource` VALUES ('8', '71');
INSERT INTO `sys_role_resource` VALUES ('8', '76');
INSERT INTO `sys_role_resource` VALUES ('8', '77');
INSERT INTO `sys_role_resource` VALUES ('8', '78');
INSERT INTO `sys_role_resource` VALUES ('8', '79');
INSERT INTO `sys_role_resource` VALUES ('8', '81');
INSERT INTO `sys_role_resource` VALUES ('8', '82');
INSERT INTO `sys_role_resource` VALUES ('8', '84');
INSERT INTO `sys_role_resource` VALUES ('8', '85');
INSERT INTO `sys_role_resource` VALUES ('8', '86');
INSERT INTO `sys_role_resource` VALUES ('8', '87');
INSERT INTO `sys_role_resource` VALUES ('8', '93');
INSERT INTO `sys_role_resource` VALUES ('8', '108');
INSERT INTO `sys_role_resource` VALUES ('8', '109');
INSERT INTO `sys_role_resource` VALUES ('8', '110');
INSERT INTO `sys_role_resource` VALUES ('8', '111');
INSERT INTO `sys_role_resource` VALUES ('8', '112');
INSERT INTO `sys_role_resource` VALUES ('8', '113');
INSERT INTO `sys_role_resource` VALUES ('8', '114');
INSERT INTO `sys_role_resource` VALUES ('8', '115');
INSERT INTO `sys_role_resource` VALUES ('8', '116');
INSERT INTO `sys_role_resource` VALUES ('8', '123');
INSERT INTO `sys_role_resource` VALUES ('8', '124');
INSERT INTO `sys_role_resource` VALUES ('8', '125');
INSERT INTO `sys_role_resource` VALUES ('8', '126');
INSERT INTO `sys_role_resource` VALUES ('8', '127');
INSERT INTO `sys_role_resource` VALUES ('8', '128');
INSERT INTO `sys_role_resource` VALUES ('8', '138');
INSERT INTO `sys_role_resource` VALUES ('8', '141');
INSERT INTO `sys_role_resource` VALUES ('8', '143');
INSERT INTO `sys_role_resource` VALUES ('8', '145');
INSERT INTO `sys_role_resource` VALUES ('8', '146');
INSERT INTO `sys_role_resource` VALUES ('8', '148');
INSERT INTO `sys_role_resource` VALUES ('8', '149');
INSERT INTO `sys_role_resource` VALUES ('8', '150');
INSERT INTO `sys_role_resource` VALUES ('8', '151');
INSERT INTO `sys_role_resource` VALUES ('8', '152');
INSERT INTO `sys_role_resource` VALUES ('8', '153');
INSERT INTO `sys_role_resource` VALUES ('8', '160');
INSERT INTO `sys_role_resource` VALUES ('8', '161');
INSERT INTO `sys_role_resource` VALUES ('8', '162');
INSERT INTO `sys_role_resource` VALUES ('8', '163');
INSERT INTO `sys_role_resource` VALUES ('8', '164');
INSERT INTO `sys_role_resource` VALUES ('8', '166');
INSERT INTO `sys_role_resource` VALUES ('8', '167');
INSERT INTO `sys_role_resource` VALUES ('8', '170');
INSERT INTO `sys_role_resource` VALUES ('8', '171');
INSERT INTO `sys_role_resource` VALUES ('20', '1');
INSERT INTO `sys_role_resource` VALUES ('20', '3');
INSERT INTO `sys_role_resource` VALUES ('20', '4');
INSERT INTO `sys_role_resource` VALUES ('20', '10');
INSERT INTO `sys_role_resource` VALUES ('20', '11');
INSERT INTO `sys_role_resource` VALUES ('20', '12');
INSERT INTO `sys_role_resource` VALUES ('20', '13');
INSERT INTO `sys_role_resource` VALUES ('20', '14');
INSERT INTO `sys_role_resource` VALUES ('20', '15');
INSERT INTO `sys_role_resource` VALUES ('20', '16');
INSERT INTO `sys_role_resource` VALUES ('20', '17');
INSERT INTO `sys_role_resource` VALUES ('20', '18');
INSERT INTO `sys_role_resource` VALUES ('20', '19');
INSERT INTO `sys_role_resource` VALUES ('20', '26');
INSERT INTO `sys_role_resource` VALUES ('20', '27');
INSERT INTO `sys_role_resource` VALUES ('20', '28');
INSERT INTO `sys_role_resource` VALUES ('20', '29');
INSERT INTO `sys_role_resource` VALUES ('20', '30');
INSERT INTO `sys_role_resource` VALUES ('20', '31');
INSERT INTO `sys_role_resource` VALUES ('20', '39');
INSERT INTO `sys_role_resource` VALUES ('20', '56');
INSERT INTO `sys_role_resource` VALUES ('20', '57');
INSERT INTO `sys_role_resource` VALUES ('20', '58');
INSERT INTO `sys_role_resource` VALUES ('20', '59');
INSERT INTO `sys_role_resource` VALUES ('20', '166');
INSERT INTO `sys_role_resource` VALUES ('20', '167');
INSERT INTO `sys_role_resource` VALUES ('20', '168');
INSERT INTO `sys_role_resource` VALUES ('20', '169');
INSERT INTO `sys_role_resource` VALUES ('20', '170');
INSERT INTO `sys_role_resource` VALUES ('20', '171');
INSERT INTO `sys_role_resource` VALUES ('20', '234');
INSERT INTO `sys_role_resource` VALUES ('20', '235');
INSERT INTO `sys_role_resource` VALUES ('20', '236');
INSERT INTO `sys_role_resource` VALUES ('20', '237');

-- ----------------------------
-- Table structure for sys_shotcut
-- ----------------------------
DROP TABLE IF EXISTS `sys_shotcut`;
CREATE TABLE `sys_shotcut` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `updateDT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `resourceId` int(11) DEFAULT NULL,
  `iconUrl` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_shotcut
-- ----------------------------
INSERT INTO `sys_shotcut` VALUES ('47', '1', '2014-07-17 11:24:54', '84', 'notification.png');
INSERT INTO `sys_shotcut` VALUES ('48', '1', '2014-07-17 16:09:57', '87', 'manger_knowledge.png');
INSERT INTO `sys_shotcut` VALUES ('49', '1', '2014-07-17 16:09:57', '78', 'tasklist.png');
INSERT INTO `sys_shotcut` VALUES ('50', '1', '2014-07-17 16:09:57', '174', 'time_analyse.png');
INSERT INTO `sys_shotcut` VALUES ('51', '9', '2014-07-17 23:33:27', '84', 'notification.png');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loginname` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `sex` int(11) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `usertype` int(11) DEFAULT NULL,
  `isdefault` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `organization_id` int(11) DEFAULT NULL,
  `createdatetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `officePhone` varchar(50) DEFAULT NULL,
  `mobilePhone` varchar(50) DEFAULT NULL,
  `fax` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', 'admin', '21232f297a57a5a743894a0e4a801fc3', '0', '18', '1', '0', '0', '1', '2012-06-04 01:00:00', null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('3', 'hyf', '胡艺峰', 'c4ca4238a0b923820dcc509a6f75849b', '0', '30', '1', '1', '0', '4', '2014-04-21 11:55:12', null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('5', 'ss', '孙思', 'c4ca4238a0b923820dcc509a6f75849b', '0', '0', '1', '1', '0', '4', '2014-06-03 11:11:21', null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('7', 'test', '测试', 'c4ca4238a0b923820dcc509a6f75849b', '0', '0', '9', '1', '0', '1', '2002-01-05 02:07:25', null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('8', 'yzw', '叶志文', 'c4ca4238a0b923820dcc509a6f75849b', '0', '0', '9', '1', '0', '7', '2014-07-01 11:49:18', null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('9', 'j', '焦钧炎', 'c4ca4238a0b923820dcc509a6f75849b', '0', '0', '46', '1', '0', '7', '2014-07-01 11:50:46', '', '232432', '', '', '');
INSERT INTO `sys_user` VALUES ('10', 'jl', '运维项目经理', 'c4ca4238a0b923820dcc509a6f75849b', '0', '0', '8', '1', '0', '7', '2002-01-27 05:31:22', null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('11', 'zfl', '张方林', 'c4ca4238a0b923820dcc509a6f75849b', '0', '0', '46', '1', '0', '7', '2002-01-27 05:32:09', null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('12', 's', 's', 'c4ca4238a0b923820dcc509a6f75849b', '0', '2', '1', '1', '0', '1', '2014-07-07 16:56:05', '1212121', '21312', '3123', '313123', '3123123');
INSERT INTO `sys_user` VALUES ('13', 'zf', '郑飞', 'c4ca4238a0b923820dcc509a6f75849b', '0', '0', '46', '1', '0', '7', '2014-07-16 22:00:45', '', '', '', '', '');
INSERT INTO `sys_user` VALUES ('14', 'lk', '刘魁', 'c4ca4238a0b923820dcc509a6f75849b', '0', '0', '46', '1', '0', '7', '2014-07-16 22:02:53', '', '', '', '', '');
INSERT INTO `sys_user` VALUES ('15', 'sa', '测试', 'c4ca4238a0b923820dcc509a6f75849b', '0', '0', '1', '1', '0', '1', '2014-10-20 23:25:23', '', '', '', '', '');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` smallint(6) NOT NULL,
  `role_id` smallint(6) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1');
INSERT INTO `sys_user_role` VALUES ('3', '1');
INSERT INTO `sys_user_role` VALUES ('5', '1');
INSERT INTO `sys_user_role` VALUES ('7', '4');
INSERT INTO `sys_user_role` VALUES ('8', '6');
INSERT INTO `sys_user_role` VALUES ('9', '8');
INSERT INTO `sys_user_role` VALUES ('10', '7');
INSERT INTO `sys_user_role` VALUES ('11', '8');
INSERT INTO `sys_user_role` VALUES ('12', '1');
INSERT INTO `sys_user_role` VALUES ('13', '8');
INSERT INTO `sys_user_role` VALUES ('14', '8');
INSERT INTO `sys_user_role` VALUES ('15', '20');

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `id` int(11) DEFAULT NULL,
  `complaintTel` varchar(25) DEFAULT NULL,
  `orderDt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `arrivedDt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updateDt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sign` smallint(6) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `customerId` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES ('14', '', '2014-10-23 22:18:29', '2015-04-27 00:42:29', '2015-04-27 00:42:29', '0', '1', '2');
INSERT INTO `t_order` VALUES ('15', '', '2014-10-23 22:18:51', '2015-04-27 00:42:29', '2015-04-27 00:42:29', '0', '1', '2');
INSERT INTO `t_order` VALUES ('16', '', '2014-10-23 22:23:02', '2015-04-27 00:42:29', '2015-04-27 00:42:29', '0', '1', '3');
INSERT INTO `t_order` VALUES ('17', '12343212', '2014-10-23 22:47:08', '2015-04-27 00:42:29', '2015-04-27 00:42:29', '0', '1', '3');
