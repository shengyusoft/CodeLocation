/*
Navicat MySQL Data Transfer

Source Server         : bms
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : bms

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2015-05-08 00:42:45
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
-- Table structure for pa_bmzd
-- ----------------------------
DROP TABLE IF EXISTS `pa_bmzd`;
CREATE TABLE `pa_bmzd` (
  `uuid` varchar(32) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `description` varchar(200) DEFAULT NULL,
  `enabled` int(11) DEFAULT NULL,
  `gbcode` varchar(30) DEFAULT NULL,
  `leaf` int(11) DEFAULT NULL,
  `lvs` int(11) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `serial_index` double DEFAULT NULL,
  `simply_code` varchar(100) DEFAULT NULL,
  `vc2` varchar(30) DEFAULT NULL,
  `view_code` varchar(30) DEFAULT NULL,
  `weighing_coeffient` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pa_bmzd
-- ----------------------------
INSERT INTO `pa_bmzd` VALUES ('554FACECA1734A30875AFE4832C72FC6', '2015-05-03 11:15:43', '青海省海南藏族自治州同德县', '1', '4.2.2.632522', '1', '4', '同德县', '22', 'TDX', null, '003063025022', null);
INSERT INTO `pa_bmzd` VALUES ('589762A9ED4E450286365A63954B4942', '2015-05-03 11:15:43', '广西壮族自治区梧州市苍梧县', '1', '4.2.2.450421', '1', '4', '苍梧县', '21', 'CWX', null, '003045004021', null);
INSERT INTO `pa_bmzd` VALUES ('5C5DF79C3A48479DB89AB53A4B5163EF', '2015-05-03 11:15:43', '福建省福州市', '1', '4.2.2.350100', '0', '3', '福州市', '1', 'FZS', null, '003035001', null);
INSERT INTO `pa_bmzd` VALUES ('5F598E5AFABB460B81C81C38459E54D2', '2015-05-03 11:15:43', '山西省临汾市市辖区', '1', '4.2.2.141001', '1', '4', '市辖区', '1', 'SXQ', null, '003014010001', null);
INSERT INTO `pa_bmzd` VALUES ('622DB3EED8974802BEBCA54111395BCE', '2015-05-03 11:15:43', '江西省上饶市铅山县', '1', '4.2.2.361124', '1', '4', '铅山县', '24', 'QSX', null, '003036011024', null);
INSERT INTO `pa_bmzd` VALUES ('656FA1582B2E4D2B9726519CEB25A507', '2015-05-03 11:15:43', '四川省自贡市自流井区', '1', '4.2.2.510302', '1', '4', '自流井区', '2', 'ZLJQ', null, '003051003002', null);
INSERT INTO `pa_bmzd` VALUES ('6821461B519B48459F563A5011871347', '2015-05-03 11:15:43', '安徽省蚌埠市五河县', '1', '4.2.2.340322', '1', '4', '五河县', '22', 'WHX', null, '003034003022', null);
INSERT INTO `pa_bmzd` VALUES ('6B01F7B0432141EB858F49577CE39220', '2015-05-03 11:15:43', '浙江省台州市', '1', '4.2.2.331000', '0', '3', '台州市', '10', 'TZS', null, '003033010', null);
INSERT INTO `pa_bmzd` VALUES ('6EFDCC5A29C84853BC6BAF3D375D3964', '2015-05-03 11:15:43', '浙江省宁波市鄞州区', '1', '4.2.2.330212', '1', '4', '鄞州区', '12', 'YZQ', null, '003033002012', null);
INSERT INTO `pa_bmzd` VALUES ('72842845A06C4E29B7E966DE600867AD', '2015-05-03 11:15:43', '重庆市市辖区合川区', '1', '4.2.2.500317', '1', '4', '合川区', '17', 'HCQ', null, '003050001017', null);
INSERT INTO `pa_bmzd` VALUES ('75967A1CE3C34B3BBB613CA53FC65ADD', '2015-05-03 11:15:43', '湖南省郴州市北湖区', '1', '4.2.2.431002', '1', '4', '北湖区', '2', 'BHQ', null, '003043010002', null);
INSERT INTO `pa_bmzd` VALUES ('77E10E9A9B8549C8BE40AC4F752D383C', '2015-05-03 11:15:43', '辽宁省辽阳市', '1', '4.2.2.211000', '0', '3', '辽阳市', '10', 'LYS', null, '003021010', null);
INSERT INTO `pa_bmzd` VALUES ('7BD18B511E5C4B2E9026BE2F659D4597', '2015-05-03 11:15:43', '青海省海南藏族自治州共和县', '1', '4.2.2.632521', '1', '4', '共和县', '21', 'GHX', null, '003063025021', null);
INSERT INTO `pa_bmzd` VALUES ('471C0081BE5C48ED885E966D674A590D', '2015-05-03 11:15:43', '云南省怒江傈僳族自治州兰坪白族普米族自治县', '1', '4.2.2.533325', '1', '4', '兰坪白族普米族自治县', '25', 'LPBZPMZZZX', null, '003053033025', null);
INSERT INTO `pa_bmzd` VALUES ('4A8E2750B9FA439FB7BAB410F85643F4', '2015-05-03 11:15:43', '西藏自治区林芝地区波密县', '1', '4.2.2.542625', '1', '4', '波密县', '25', 'BMX', null, '003054026025', null);
INSERT INTO `pa_bmzd` VALUES ('4DD26FC371E84787928EA4887F9B6CAA', '2015-05-03 11:15:43', '北京市市辖区石景山区', '1', '4.2.2.110107', '1', '4', '石景山区', '7', 'SJSQ', null, '003011001007', null);
INSERT INTO `pa_bmzd` VALUES ('51BB25070C6A471994B93E12E558C842', '2015-05-03 11:15:43', '内蒙古自治区呼伦贝尔市根河市', '1', '4.2.2.150785', '1', '4', '根河市', '85', 'GHS', null, '003015007085', null);
INSERT INTO `pa_bmzd` VALUES ('97FD406779704C01B782740756B60E1A', '2015-05-03 11:15:43', '广西壮族自治区防城港市', '1', '4.2.2.450600', '0', '3', '防城港市', '6', 'FCGS', null, '003045006', null);
INSERT INTO `pa_bmzd` VALUES ('A11D5DD6398447FBBECDA3EA7A1D5CE3', '2015-05-03 11:15:43', '广西壮族自治区来宾市武宣县', '1', '4.2.2.451323', '1', '4', '武宣县', '23', 'WXX', null, '003045013023', null);
INSERT INTO `pa_bmzd` VALUES ('A4C7EF478F0143FB940E6FA226CBC692', '2015-05-03 11:15:43', '江苏省南京市江宁区', '1', '4.2.2.320115', '1', '4', '江宁区', '15', 'JNQ', null, '003032001015', null);
INSERT INTO `pa_bmzd` VALUES ('A89E49A1EFF14E59B91EAD4C4EB1B625', '2015-05-03 11:15:43', '广西壮族自治区贵港市桂平市', '1', '4.2.2.450881', '1', '4', '桂平市', '81', 'GPS', null, '003045008081', null);
INSERT INTO `pa_bmzd` VALUES ('AB536FD9B2EC4B4C9CF602491649ACC8', '2015-05-03 11:15:43', '贵州省毕节市黔西县', '1', '4.2.2.522423', '1', '4', '黔西县', '22', 'QXX', null, '003052005022', null);
INSERT INTO `pa_bmzd` VALUES ('AF2ACC2350E64B74850109D6D4C4540A', '2015-05-03 11:15:43', '湖北省黄冈市罗田县', '1', '4.2.2.421123', '1', '4', '罗田县', '23', 'LTX', null, '003042011023', null);
INSERT INTO `pa_bmzd` VALUES ('B2BC21F19CC44407B32279F1B485A609', '2015-05-03 11:15:43', '河北省石家庄市赞皇县', '1', '4.2.2.130129', '1', '4', '赞皇县', '29', 'ZHX', null, '003013001029', null);
INSERT INTO `pa_bmzd` VALUES ('B5AFF884B6974D74B111BD73A89F4A38', '2015-05-03 11:15:43', '甘肃省定西市安定区', '1', '4.2.2.621102', '1', '4', '安定区', '2', 'ADQ', null, '003062011002', null);
INSERT INTO `pa_bmzd` VALUES ('B917B6C45D864F3CA3163164E741128A', '2015-05-03 11:15:43', '吉林省长春市农安县', '1', '4.2.2.220122', '1', '4', '农安县', '22', 'NAX', null, '003022001022', null);
INSERT INTO `pa_bmzd` VALUES ('BC3B2047B2784DE391349D3620F09244', '2015-05-03 11:15:43', '浙江省杭州市下城区', '1', '4.2.2.330103', '1', '4', '下城区', '3', 'XCQ', null, '003033001003', null);
INSERT INTO `pa_bmzd` VALUES ('C0EB07321F7B4185950C54E68C5E8ED7', '2015-05-03 11:15:43', '四川省广元市青川县', '1', '4.2.2.510822', '1', '4', '青川县', '22', 'QCX', null, '003051008022', null);
INSERT INTO `pa_bmzd` VALUES ('C8626D6E1D034D4CAF587B7341AA7A4D', '2015-05-03 11:15:43', '河南省驻马店市遂平县', '1', '4.2.2.411728', '1', '4', '遂平县', '28', 'SPX', null, '003041017028', null);
INSERT INTO `pa_bmzd` VALUES ('CB40F48B6F0842FE8D05AEC9FFF443E3', '2015-05-03 11:15:43', '陕西省榆林市定边县', '1', '4.2.2.610825', '1', '4', '定边县', '25', 'DBX', null, '003061008025', null);
INSERT INTO `pa_bmzd` VALUES ('CF2D9253AE6347B898785B1E903019E3', '2015-05-03 11:15:43', '河南省平顶山市宝丰县', '1', '4.2.2.410421', '1', '4', '宝丰县', '21', 'BFX', null, '003041004021', null);
INSERT INTO `pa_bmzd` VALUES ('D746B077E2C14BDB9BD9EACBB29C6FFA', '2015-05-03 11:15:43', '福建省福州市永泰县', '1', '4.2.2.350125', '1', '4', '永泰县', '25', 'YTX', null, '003035001025', null);
INSERT INTO `pa_bmzd` VALUES ('DB5661EB9C6942169D26C7E9D857707D', '2015-05-03 11:15:43', '江西省南昌市新建县', '1', '4.2.2.360122', '1', '4', '新建县', '22', 'XJX', null, '003036001022', null);
INSERT INTO `pa_bmzd` VALUES ('DED1D6E306CB41EE838ECF3A8BDBE56C', '2015-05-03 11:15:43', '江西省萍乡市安源区', '1', '4.2.2.360302', '1', '4', '安源区', '2', 'AYQ', null, '003036003002', null);
INSERT INTO `pa_bmzd` VALUES ('E1FCEEE73C6B45359EDF00D868961C7B', '2015-05-03 11:15:43', '河北省张家口市桥东区', '1', '4.2.2.130702', '1', '4', '桥东区', '2', 'QDQ', null, '003013007002', null);
INSERT INTO `pa_bmzd` VALUES ('828C918B581C4108AC138B6B11F6CCD7', '2015-05-03 11:15:43', '湖南省衡阳市石鼓区', '1', '4.2.2.430407', '1', '4', '石鼓区', '7', 'SGQ', null, '003043004007', null);
INSERT INTO `pa_bmzd` VALUES ('85EA92A57B5E48DF9CAE425B9011BF97', '2015-05-03 11:15:43', '陕西省咸阳市武功县', '1', '4.2.2.610431', '1', '4', '武功县', '31', 'WGX', null, '003061004031', null);
INSERT INTO `pa_bmzd` VALUES ('8A413369A9344DA7BDBFD3D0C27AE8D0', '2015-05-03 11:15:43', '广东省广州市南沙区', '1', '4.2.2.440115', '1', '4', '南沙区', '15', 'NSQ', null, '003044001015', null);
INSERT INTO `pa_bmzd` VALUES ('8E9182238CBB49A386DEB86EEA12B5AF', '2015-05-03 11:15:43', '重庆市市辖区万州区', '1', '4.2.2.500101', '1', '4', '万州区', '1', 'WZQ', null, '003050001001', null);
INSERT INTO `pa_bmzd` VALUES ('9268781DCED5406397E67F7B22CC1ECC', '2015-05-03 11:15:43', '浙江省嘉兴市海盐县', '1', '4.2.2.330424', '1', '4', '海盐县', '24', 'HYX', null, '003033004024', null);
INSERT INTO `pa_bmzd` VALUES ('E36C55E7DBB646A283F76151E67A2A9D', '2015-05-03 11:15:43', '湖南省永州市', '1', '4.2.2.431100', '0', '3', '永州市', '11', 'YZS', null, '003043011', null);
INSERT INTO `pa_bmzd` VALUES ('E9D20816AA784111B62CA1105DC9BEEF', '2015-05-03 11:15:43', '广东省茂名市市辖区', '1', '4.2.2.440901', '1', '4', '市辖区', '1', 'SXQ', null, '003044009001', null);
INSERT INTO `pa_bmzd` VALUES ('ECA89B8899D44715ADDC27216C73304B', '2015-05-03 11:15:43', '安徽省六安市寿县', '1', '4.2.2.341521', '1', '4', '寿县', '21', 'SX', null, '003034015021', null);
INSERT INTO `pa_bmzd` VALUES ('ECB492BEE116458D822F45F07304E930', '2015-05-03 11:15:43', '黑龙江省绥化市青冈县', '1', '4.2.2.231223', '1', '4', '青冈县', '23', 'QGX', null, '003023012023', null);
INSERT INTO `pa_bmzd` VALUES ('ECB4AED6BBA64845AA58A218D0B9BB35', '2015-05-03 11:15:43', '云南省昭通市绥江县', '1', '4.2.2.530626', '1', '4', '绥江县', '26', 'SJX', null, '003053006026', null);
INSERT INTO `pa_bmzd` VALUES ('ECC47342E3924D61A33D1725E5224045', '2015-05-03 11:15:43', '甘肃省陇南市康县', '1', '4.2.2.621224', '1', '4', '康县', '24', 'KX', null, '003062012024', null);
INSERT INTO `pa_bmzd` VALUES ('ECC7DEE2D32E4420801DB15AC9D5D09D', '2015-05-03 11:15:43', '山东省烟台市', '1', '4.2.2.370600', '0', '3', '烟台市', '6', 'YTS', null, '003037006', null);
INSERT INTO `pa_bmzd` VALUES ('ECC8E0DFE114403BABF2CA6A761DD9CD', '2015-05-03 11:15:43', '湖北省咸宁市赤壁市', '1', '4.2.2.421281', '1', '4', '赤壁市', '81', 'CBS', null, '003042012081', null);
INSERT INTO `pa_bmzd` VALUES ('ECCC768EC53A4F4AAD70FD3990E38EC4', '2015-05-03 11:15:43', '重庆市县彭水苗族土家族自治县', '1', '4.2.2.500243', '1', '4', '彭水苗族土家族自治县', '43', 'PSMZTJZZZX', null, '003050002043', null);
INSERT INTO `pa_bmzd` VALUES ('ECCEE80632C54AB18BE5A3503EC3EEAA', '2015-05-03 11:15:43', '陕西省安康市市辖区', '1', '4.2.2.610901', '1', '4', '市辖区', '1', 'SXQ', null, '003061009001', null);
INSERT INTO `pa_bmzd` VALUES ('ECD430B60A11431699901EC20AA272B6', '2015-05-03 11:15:43', '山东省淄博市桓台县', '1', '4.2.2.370321', '1', '4', '桓台县', '21', 'HTX', null, '003037003021', null);
INSERT INTO `pa_bmzd` VALUES ('ECF1EAF6BBD14D12A821EABEC993BCA9', '2015-05-03 11:15:43', '山东省淄博市', '1', '4.2.2.370300', '0', '3', '淄博市', '3', 'ZBS', null, '003037003', null);
INSERT INTO `pa_bmzd` VALUES ('ECF9AF41B6B943499FEB53725EE9965D', '2015-05-03 11:15:43', '内蒙古自治区乌兰察布市察哈尔右翼前旗', '1', '4.2.2.150926', '1', '4', '察哈尔右翼前旗', '26', 'CHEYYQQ', null, '003015009026', null);
INSERT INTO `pa_bmzd` VALUES ('ED02D8C8090F4DCD8B0142CE50A738CA', '2015-05-03 11:15:43', '天津市县宁河县', '1', '4.2.2.120221', '1', '4', '宁河县', '21', 'NHX', null, '003012002021', null);
INSERT INTO `pa_bmzd` VALUES ('ED2FE2A8CAB646A59DFC51F586BA88E5', '2015-05-03 11:15:43', '贵州省黔东南苗族侗族自治州锦屏县', '1', '4.2.2.522628', '1', '4', '锦屏县', '28', 'JPX', null, '003052026028', null);
INSERT INTO `pa_bmzd` VALUES ('ED376F919FB049DC81CE8C21960A235F', '2015-05-03 11:15:43', '河北省承德市平泉县', '1', '4.2.2.130823', '1', '4', '平泉县', '23', 'PQX', null, '003013008023', null);
INSERT INTO `pa_bmzd` VALUES ('ED3D69A397F44904963C21AE3090F6B5', '2015-05-03 11:15:43', '山西省大同市', '1', '4.2.2.140200', '0', '3', '大同市', '2', 'DTS', null, '003014002', null);
INSERT INTO `pa_bmzd` VALUES ('ED41A85B04834D8CB17229145F7E96DA', '2015-05-03 11:15:43', '甘肃省临夏回族自治州临夏市', '1', '4.2.2.622901', '1', '4', '临夏市', '1', 'LXS', null, '003062029001', null);
INSERT INTO `pa_bmzd` VALUES ('ED4EA8F3FE0048EB966C6549A2E190AC', '2015-05-03 11:15:43', '浙江省衢州市市辖区', '1', '4.2.2.330801', '1', '4', '市辖区', '1', 'SXQ', null, '003033008001', null);
INSERT INTO `pa_bmzd` VALUES ('ED543E3D1A3E41119FB7084A672169AD', '2015-05-03 11:15:43', '四川省阿坝藏族羌族自治州松潘县', '1', '4.2.2.513224', '1', '4', '松潘县', '24', 'SPX', null, '003051032024', null);
INSERT INTO `pa_bmzd` VALUES ('ED7970A33793457BB046EABF13B931C9', '2015-05-03 11:15:43', '云南省丽江市永胜县', '1', '4.2.2.530722', '1', '4', '永胜县', '22', 'YSX', null, '003053007022', null);
INSERT INTO `pa_bmzd` VALUES ('ED83B31711C341BF8893CA730C0A6D93', '2015-05-03 11:15:43', '河北省廊坊市三河市', '1', '4.2.2.131082', '1', '4', '三河市', '82', 'SHS', null, '003013010082', null);
INSERT INTO `pa_bmzd` VALUES ('EDB21FB3D6D545CD9B7230E6F1BF24C9', '2015-05-03 11:15:43', '浙江省金华市', '1', '4.2.2.330700', '0', '3', '金华市', '7', 'JHS', null, '003033007', null);
INSERT INTO `pa_bmzd` VALUES ('EDEA75559323405196EC80B9B1C15584', '2015-05-03 11:15:43', '陕西省榆林市市辖区', '1', '4.2.2.610801', '1', '4', '市辖区', '1', 'SXQ', null, '003061008001', null);
INSERT INTO `pa_bmzd` VALUES ('EDF36EA6E9FF420E8795709EA91B1BFC', '2015-05-03 11:15:43', '河北省张家口市崇礼县', '1', '4.2.2.130733', '1', '4', '崇礼县', '33', 'CLX', null, '003013007033', null);
INSERT INTO `pa_bmzd` VALUES ('EE1B8AEDF08248108284DCF69CAA1595', '2015-05-03 11:15:43', '广西壮族自治区南宁市横县', '1', '4.2.2.450127', '1', '4', '横县', '27', 'HX', null, '003045001027', null);
INSERT INTO `pa_bmzd` VALUES ('EE23801EE22C43BE86DF94EBA7F1EAE8', '2015-05-03 11:15:43', '四川省甘孜藏族自治州白玉县', '1', '4.2.2.513331', '1', '4', '白玉县', '31', 'BYX', null, '003051033031', null);
INSERT INTO `pa_bmzd` VALUES ('EE39D43237C34DD5ABFC56A366FC5CAA', '2015-05-03 11:15:43', '广东省广州市白云区', '1', '4.2.2.440111', '1', '4', '白云区', '11', 'BYQ', null, '003044001011', null);
INSERT INTO `pa_bmzd` VALUES ('EE3E1A99B9A845B8AF3AB810D8727DC9', '2015-05-03 11:15:43', '河北省邯郸市邱县', '1', '4.2.2.130430', '1', '4', '邱县', '30', 'QX', null, '003013004030', null);
INSERT INTO `pa_bmzd` VALUES ('EE496022D8FA4CEEAFEDFBEA3F58C439', '2015-05-03 11:15:43', '福建省泉州市石狮市', '1', '4.2.2.350581', '1', '4', '石狮市', '81', 'SSS', null, '003035005081', null);
INSERT INTO `pa_bmzd` VALUES ('EE58F88D4C2647448CB69886E183BEAD', '2015-05-03 11:15:43', '新疆维吾尔自治区伊犁哈萨克自治州伊宁市', '1', '4.2.2.654002', '1', '4', '伊宁市', '2', 'YNS', null, '003065040002', null);
INSERT INTO `pa_bmzd` VALUES ('E9E57DFA33004A1287E59AA12F95C805', '2015-05-03 11:15:43', '山西省晋中市介休市', '1', '4.2.2.140781', '1', '4', '介休市', '81', 'JXS', null, '003014007081', null);
INSERT INTO `pa_bmzd` VALUES ('E9EE8A3EEFF5467796E6B8ED5D5DF51C', '2015-05-03 11:15:43', '辽宁省大连市长海县', '1', '4.2.2.210224', '1', '4', '长海县', '24', 'ZHX', null, '003021002024', null);
INSERT INTO `pa_bmzd` VALUES ('E9F2BD9CFE62480C8397DDF499A8C8EE', '2015-05-03 11:15:43', '四川省成都市郫县', '1', '4.2.2.510124', '1', '4', '郫县', '24', 'PX', null, '003051001024', null);
INSERT INTO `pa_bmzd` VALUES ('E9F3511EEAED4D18BF28E075527B96F5', '2015-05-03 11:15:43', '新疆维吾尔自治区和田地区于田县', '1', '4.2.2.653226', '1', '4', '于田县', '26', 'YTX', null, '003065032026', null);
INSERT INTO `pa_bmzd` VALUES ('EA040E2FF6F643FFBF8E7B77BFFA3417', '2015-05-03 11:15:43', '江苏省南通市崇川区', '1', '4.2.2.320602', '1', '4', '崇川区', '2', 'CCQ', null, '003032006002', null);
INSERT INTO `pa_bmzd` VALUES ('EA0DC0B22DD84C36912CB8FDBCEE0236', '2015-05-03 11:15:43', '福建省三明市梅列区', '1', '4.2.2.350402', '1', '4', '梅列区', '2', 'MLQ', null, '003035004002', null);
INSERT INTO `pa_bmzd` VALUES ('EA13053B283C4A0FAA49EA7AEC6C6416', '2015-05-03 11:15:43', '河南省濮阳市濮阳县', '1', '4.2.2.410928', '1', '4', '濮阳县', '28', 'PYX', null, '003041009028', null);
INSERT INTO `pa_bmzd` VALUES ('EA24A655C91E453EA3950BC9E7EF4789', '2015-05-03 11:15:43', '河北省廊坊市广阳区', '1', '4.2.2.131003', '1', '4', '广阳区', '3', 'GYQ', null, '003013010003', null);
INSERT INTO `pa_bmzd` VALUES ('EA2DFFD1327442AD8ECBD5C1105C6837', '2015-05-03 11:15:43', '江苏省淮安市涟水县', '1', '4.2.2.320826', '1', '4', '涟水县', '26', 'LSX', null, '003032008026', null);
INSERT INTO `pa_bmzd` VALUES ('EA2F3D4ABCD042BF92462DE5592F01FB', '2015-05-03 11:15:43', '湖南省邵阳市大祥区', '1', '4.2.2.430503', '1', '4', '大祥区', '3', 'DXQ', null, '003043005003', null);
INSERT INTO `pa_bmzd` VALUES ('EA569A4F1D2E460BBF5F41F6E8620FFC', '2015-05-03 11:15:43', '江西省景德镇市市辖区', '1', '4.2.2.360201', '1', '4', '市辖区', '1', 'SXQ', null, '003036002001', null);
INSERT INTO `pa_bmzd` VALUES ('EA9E3A2478DA49DF8B037A7DCE0915D9', '2015-05-03 11:15:43', '四川省宜宾市高县', '1', '4.2.2.511525', '1', '4', '高县', '25', 'GX', null, '003051015025', null);
INSERT INTO `pa_bmzd` VALUES ('EA9F249CF82D4F1E9E444AC6AF8E1524', '2015-05-03 11:15:43', '甘肃省酒泉市玉门市', '1', '4.2.2.620981', '1', '4', '玉门市', '81', 'YMS', null, '003062009081', null);
INSERT INTO `pa_bmzd` VALUES ('EAAB7380CB5745C2A7B648B785D6AA5E', '2015-05-03 11:15:43', '山东省济南市章丘市', '1', '4.2.2.370181', '1', '4', '章丘市', '81', 'ZQS', null, '003037001081', null);
INSERT INTO `pa_bmzd` VALUES ('EAB3149F1B9C4F8F888B08E3FADDE81B', '2015-05-03 11:15:43', '黑龙江省齐齐哈尔市依安县', '1', '4.2.2.230223', '1', '4', '依安县', '23', 'YAX', null, '003023002023', null);
INSERT INTO `pa_bmzd` VALUES ('EAB39E9F5B7248029282EA62537D6775', '2015-05-03 11:15:43', '四川省德阳市市辖区', '1', '4.2.2.510601', '1', '4', '市辖区', '1', 'SXQ', null, '003051006001', null);
INSERT INTO `pa_bmzd` VALUES ('EAB635F137694516BF713E22B5FCBDA9', '2015-05-03 11:15:43', '浙江省衢州市龙游县', '1', '4.2.2.330825', '1', '4', '龙游县', '25', 'LYX', null, '003033008025', null);
INSERT INTO `pa_bmzd` VALUES ('EACA0B5BD2484DB89CC8BAA4A4E7274E', '2015-05-03 11:15:43', '内蒙古自治区包头市东河区', '1', '4.2.2.150202', '1', '4', '东河区', '2', 'DHQ', null, '003015002002', null);
INSERT INTO `pa_bmzd` VALUES ('EAD729F1E78743D599D3B6B754E5330C', '2015-05-03 11:15:43', '青海省果洛藏族自治州达日县', '1', '4.2.2.632624', '1', '4', '达日县', '24', 'DRX', null, '003063026024', null);
INSERT INTO `pa_bmzd` VALUES ('EADFD2713C6A45E89FC230FF46C19A7F', '2015-05-03 11:15:43', '湖南省常德市安乡县', '1', '4.2.2.430721', '1', '4', '安乡县', '21', 'AXX', null, '003043007021', null);
INSERT INTO `pa_bmzd` VALUES ('EB15F20B3222466AB6F00D4ED26CF53B', '2015-05-03 11:15:43', '广东省潮州市湘桥区', '1', '4.2.2.445102', '1', '4', '湘桥区', '2', 'XQQ', null, '003044051002', null);
INSERT INTO `pa_bmzd` VALUES ('EB2718A19A1A4367AAAE742FC8510C6F', '2015-05-03 11:15:43', '湖北省黄冈市蕲春县', '1', '4.2.2.421126', '1', '4', '蕲春县', '26', 'QCX', null, '003042011026', null);
INSERT INTO `pa_bmzd` VALUES ('EB46A24F759E45BC95ABC60D273926AC', '2015-05-03 11:15:43', '内蒙古自治区赤峰市巴林左旗', '1', '4.2.2.150422', '1', '4', '巴林左旗', '22', 'BLZQ', null, '003015004022', null);
INSERT INTO `pa_bmzd` VALUES ('EB47E064876045A3988DEDE19170D052', '2015-05-03 11:15:43', '山西省运城市闻喜县', '1', '4.2.2.140823', '1', '4', '闻喜县', '23', 'WXX', null, '003014008023', null);
INSERT INTO `pa_bmzd` VALUES ('EB4B900ADC6840718F1C451FAC79176C', '2015-05-03 11:15:43', '河南省三门峡市灵宝市', '1', '4.2.2.411282', '1', '4', '灵宝市', '82', 'LBS', null, '003041012082', null);
INSERT INTO `pa_bmzd` VALUES ('EB6698305CAC46E29B68EDCACC0E49B2', '2015-05-03 11:15:43', '四川省甘孜藏族自治州理塘县', '1', '4.2.2.513334', '1', '4', '理塘县', '34', 'LTX', null, '003051033034', null);
INSERT INTO `pa_bmzd` VALUES ('EB69195AFCE14D948975B115D7F5C54E', '2015-05-03 11:15:43', '山西省忻州市偏关县', '1', '4.2.2.140932', '1', '4', '偏关县', '32', 'PGX', null, '003014009032', null);
INSERT INTO `pa_bmzd` VALUES ('EBE05F3FB6704890A94EF87BD757F4C1', '2015-05-03 11:15:43', '黑龙江省双鸭山市友谊县', '1', '4.2.2.230522', '1', '4', '友谊县', '22', 'YYX', null, '003023005022', null);
INSERT INTO `pa_bmzd` VALUES ('EC04345509AC4E449A102EBA6E62A3F7', '2015-05-03 11:15:43', '新疆维吾尔自治区塔城地区塔城市', '1', '4.2.2.654201', '1', '4', '塔城市', '1', 'TCS', null, '003065042001', null);
INSERT INTO `pa_bmzd` VALUES ('EC04EC1EB2E546D395C05FAAA0AF5815', '2015-05-03 11:15:43', '浙江省台州市路桥区', '1', '4.2.2.331004', '1', '4', '路桥区', '4', 'LQQ', null, '003033010004', null);
INSERT INTO `pa_bmzd` VALUES ('EC257DC708324F4494A5544B578CC6B2', '2015-05-03 11:15:43', '四川省凉山彝族自治州喜德县', '1', '4.2.2.513432', '1', '4', '喜德县', '32', 'XDX', null, '003051034032', null);
INSERT INTO `pa_bmzd` VALUES ('EC27573E0C3947518F99512FA2E0A5F2', '2015-05-03 11:15:43', '重庆市县铜梁县', '1', '4.2.2.500224', '1', '4', '铜梁县', '24', 'TLX', null, '003050002024', null);
INSERT INTO `pa_bmzd` VALUES ('EC2EB92B27484C738236727DD596A69A', '2015-05-03 11:15:43', '吉林省四平市双辽市', '1', '4.2.2.220382', '1', '4', '双辽市', '82', 'SLS', null, '003022003082', null);
INSERT INTO `pa_bmzd` VALUES ('EC3A34A873EE4A94B4D9D6F957721F06', '2015-05-03 11:15:43', '广西壮族自治区河池市环江毛南族自治县', '1', '4.2.2.451226', '1', '4', '环江毛南族自治县', '26', 'HJMNZZZX', null, '003045012026', null);
INSERT INTO `pa_bmzd` VALUES ('EC41A0CBBFA84B608481B0783A7D8742', '2015-05-03 11:15:43', '陕西省西安市周至县', '1', '4.2.2.610124', '1', '4', '周至县', '24', 'ZZX', null, '003061001024', null);
INSERT INTO `pa_bmzd` VALUES ('EC53334EF0C4431C8C7BC6F5D3713817', '2015-05-03 11:15:43', '四川省甘孜藏族自治州雅江县', '1', '4.2.2.513325', '1', '4', '雅江县', '25', 'YJX', null, '003051033025', null);
INSERT INTO `pa_bmzd` VALUES ('EC536F3E9C004AD68AD05E34CE59C977', '2015-05-03 11:15:43', '山西省太原市市辖区', '1', '4.2.2.140101', '1', '4', '市辖区', '1', 'SXQ', null, '003014001001', null);
INSERT INTO `pa_bmzd` VALUES ('EC6263285D814799B14F7F47C9E5E3B0', '2015-05-03 11:15:43', '山东省淄博市周村区', '1', '4.2.2.370306', '1', '4', '周村区', '6', 'ZCQ', null, '003037003006', null);
INSERT INTO `pa_bmzd` VALUES ('EC6C5A2F37024FBDA1F7C49F9DA2C25C', '2015-05-03 11:15:43', '河南省焦作市', '1', '4.2.2.410800', '0', '3', '焦作市', '8', 'JZS', null, '003041008', null);
INSERT INTO `pa_bmzd` VALUES ('EC86525DA7C3447189C4B5714B5D41F8', '2015-05-03 11:15:43', '海南省省直辖县级行政区划保亭黎族苗族自治县', '1', '4.2.2.469035', '1', '4', '保亭黎族苗族自治县', '29', 'BTLZMZZZX', null, '003046090029', null);
INSERT INTO `pa_bmzd` VALUES ('EC87083C81884995B4F61F1E9E29CABE', '2015-05-03 11:15:43', '陕西省宝鸡市', '1', '4.2.2.610300', '0', '3', '宝鸡市', '3', 'BJS', null, '003061003', null);
INSERT INTO `pa_bmzd` VALUES ('EC91614588C84F0FBE313075FF9A1D1E', '2015-05-03 11:15:43', '吉林省延边朝鲜族自治州和龙市', '1', '4.2.2.222406', '1', '4', '和龙市', '6', 'HLS', null, '003022024006', null);
INSERT INTO `pa_bmzd` VALUES ('EC91A39B2D144644A1B2C798E8D3F68C', '2015-05-03 11:15:43', '福建省福州市福清市', '1', '4.2.2.350181', '1', '4', '福清市', '81', 'FQS', null, '003035001081', null);
INSERT INTO `pa_bmzd` VALUES ('ECA4210622FC4A7F86CEBFCE32BFE891', '2015-05-03 11:15:43', '江西省吉安市安福县', '1', '4.2.2.360829', '1', '4', '安福县', '29', 'AFX', null, '003036008029', null);
INSERT INTO `pa_bmzd` VALUES ('EE5BB692D17A4530BD1EA7CE32B00165', '2015-05-03 11:15:43', '黑龙江省绥化市绥棱县', '1', '4.2.2.231226', '1', '4', '绥棱县', '26', 'SLX', null, '003023012026', null);
INSERT INTO `pa_bmzd` VALUES ('F6AC0BC3CB7F43C69F443BFAEC822D05', '2015-05-03 11:15:43', '湖北省省直辖县级行政区划潜江市', '1', '4.2.2.429005', '1', '4', '潜江市', '5', 'QJS', null, '003042090005', null);
INSERT INTO `pa_bmzd` VALUES ('F6AD42E90B0A46FB9EE64CA2D17F832E', '2015-05-03 11:15:43', '四川省宜宾市市辖区', '1', '4.2.2.511501', '1', '4', '市辖区', '1', 'SXQ', null, '003051015001', null);
INSERT INTO `pa_bmzd` VALUES ('F6BD198F3B52456F8F668A6377849710', '2015-05-03 11:15:43', '四川省宜宾市珙县', '1', '4.2.2.511526', '1', '4', '珙县', '26', 'GX', null, '003051015026', null);
INSERT INTO `pa_bmzd` VALUES ('F6E8996063C64554B33448CF92B779CE', '2015-05-03 11:15:43', '江苏省苏州市张家港市', '1', '4.2.2.320582', '1', '4', '张家港市', '82', 'ZJGS', null, '003032005082', null);
INSERT INTO `pa_bmzd` VALUES ('F6EE62D2003F4890AAD5BBBF08FC3DE5', '2015-05-03 11:15:43', '河南省郑州市中原区', '1', '4.2.2.410102', '1', '4', '中原区', '2', 'ZYQ', null, '003041001002', null);
INSERT INTO `pa_bmzd` VALUES ('F6F4E1EC9C364F6CB017ED0BB1B76195', '2015-05-03 11:15:43', '内蒙古自治区鄂尔多斯市鄂托克旗', '1', '4.2.2.150624', '1', '4', '鄂托克旗', '24', 'ETKQ', null, '003015006024', null);
INSERT INTO `pa_bmzd` VALUES ('F6F9FEE9136343CFA776BBDBB798A996', '2015-05-03 11:15:43', '湖南省常德市澧县', '1', '4.2.2.430723', '1', '4', '澧县', '23', 'LX', null, '003043007023', null);
INSERT INTO `pa_bmzd` VALUES ('F6FDE47B4D5A442FA23FAD70D0E9931C', '2015-05-03 11:15:43', '湖北省荆州市江陵县', '1', '4.2.2.421024', '1', '4', '江陵县', '24', 'JLX', null, '003042010024', null);
INSERT INTO `pa_bmzd` VALUES ('F7019849834144619564B1EEC013EB8C', '2015-05-03 11:15:43', '安徽省阜阳市颍州区', '1', '4.2.2.341202', '1', '4', '颍州区', '2', 'YZQ', null, '003034012002', null);
INSERT INTO `pa_bmzd` VALUES ('F7066B6136374FE6BA575B634AD32D6A', '2015-05-03 11:15:43', '江苏省连云港市', '1', '4.2.2.320700', '0', '3', '连云港市', '7', 'LYGS', null, '003032007', null);
INSERT INTO `pa_bmzd` VALUES ('F711CE5F49784D9DA495749AFF8942C3', '2015-05-03 11:15:43', '湖南省', '1', '4.2.2.430000', '0', '2', '湖南省', '43', 'HNS', null, '003043', null);
INSERT INTO `pa_bmzd` VALUES ('F713E5B2B95C486093685DCF5F92299C', '2015-05-03 11:15:43', '辽宁省沈阳市苏家屯区', '1', '4.2.2.210111', '1', '4', '苏家屯区', '11', 'SJZQ', null, '003021001011', null);
INSERT INTO `pa_bmzd` VALUES ('F72B0FC702D74BA8AC1FA9955BE1995E', '2015-05-03 11:15:43', '广东省梅州市平远县', '1', '4.2.2.441426', '1', '4', '平远县', '26', 'PYX', null, '003044014026', null);
INSERT INTO `pa_bmzd` VALUES ('F75A8EFD4BC545D2A43573DF120DE74A', '2015-05-03 11:15:43', '天津市市辖区河西区', '1', '4.2.2.120103', '1', '4', '河西区', '3', 'HXQ', null, '003012001003', null);
INSERT INTO `pa_bmzd` VALUES ('F75C5B0811CF422EBC72F6B3E5D663E8', '2015-05-03 11:15:43', '河南省周口市淮阳县', '1', '4.2.2.411626', '1', '4', '淮阳县', '26', 'HYX', null, '003041016026', null);
INSERT INTO `pa_bmzd` VALUES ('F76EB7C556424434BF459F17F26BBC97', '2015-05-03 11:15:43', '广东省湛江市市辖区', '1', '4.2.2.440801', '1', '4', '市辖区', '1', 'SXQ', null, '003044008001', null);
INSERT INTO `pa_bmzd` VALUES ('F787F65DD947489283C6C5AF58FD2DA5', '2015-05-03 11:15:43', '山东省菏泽市东明县', '1', '4.2.2.371728', '1', '4', '东明县', '28', 'DMX', null, '003037017028', null);
INSERT INTO `pa_bmzd` VALUES ('F79A9FD63E7E4E098E9A82F2E9280E7B', '2015-05-03 11:15:43', '河南省南阳市镇平县', '1', '4.2.2.411324', '1', '4', '镇平县', '24', 'ZPX', null, '003041013024', null);
INSERT INTO `pa_bmzd` VALUES ('F7A5281A1CD8437BB1018B85151F993B', '2015-05-03 11:15:43', '吉林省通化市辉南县', '1', '4.2.2.220523', '1', '4', '辉南县', '23', 'HNX', null, '003022005023', null);
INSERT INTO `pa_bmzd` VALUES ('F7AD5B78E94346AB80E30E041BA4DEAE', '2015-05-03 11:15:43', '福建省三明市', '1', '4.2.2.350400', '0', '3', '三明市', '4', 'SMS', null, '003035004', null);
INSERT INTO `pa_bmzd` VALUES ('F7AF50970EAF45A9AE62CD6D0BC8D3CB', '2015-05-03 11:15:43', '四川省凉山彝族自治州普格县', '1', '4.2.2.513428', '1', '4', '普格县', '28', 'PGX', null, '003051034028', null);
INSERT INTO `pa_bmzd` VALUES ('F7C1959C363B49B5BBC00A2B55893B24', '2015-05-03 11:15:43', '山西省临汾市侯马市', '1', '4.2.2.141081', '1', '4', '侯马市', '81', 'HMS', null, '003014010081', null);
INSERT INTO `pa_bmzd` VALUES ('F7D560E156934F5A8F95A86228F16922', '2015-05-03 11:15:43', '青海省玉树藏族自治州曲麻莱县', '1', '4.2.2.632726', '1', '4', '曲麻莱县', '26', 'QMLX', null, '003063027026', null);
INSERT INTO `pa_bmzd` VALUES ('F7F3E0112F5748129EC1F920C1CF1C0D', '2015-05-03 11:15:43', '新疆维吾尔自治区克拉玛依市乌尔禾区', '1', '4.2.2.650205', '1', '4', '乌尔禾区', '5', 'WEHQ', null, '003065002005', null);
INSERT INTO `pa_bmzd` VALUES ('F7FF716EBFDF4F8E9AAC824DB32E3F08', '2015-05-03 11:15:43', '黑龙江省佳木斯市', '1', '4.2.2.230800', '0', '3', '佳木斯市', '8', 'JMSS', null, '003023008', null);
INSERT INTO `pa_bmzd` VALUES ('F8142833263842E3BF0F001F455FC39F', '2015-05-03 11:15:43', '甘肃省金昌市永昌县', '1', '4.2.2.620321', '1', '4', '永昌县', '21', 'YCX', null, '003062003021', null);
INSERT INTO `pa_bmzd` VALUES ('F83CFD31BAE94DB9B286BE2E58B838A0', '2015-05-03 11:15:43', '辽宁省鞍山市立山区', '1', '4.2.2.210304', '1', '4', '立山区', '4', 'LSQ', null, '003021003004', null);
INSERT INTO `pa_bmzd` VALUES ('F8419A51E4EC445697F464A67E2A4C6D', '2015-05-03 11:15:43', '江西省鹰潭市贵溪市', '1', '4.2.2.360681', '1', '4', '贵溪市', '81', 'GXS', null, '003036006081', null);
INSERT INTO `pa_bmzd` VALUES ('F84DADF00C154C6E83508A6C32AE3FDF', '2015-05-03 11:15:43', '陕西省榆林市绥德县', '1', '4.2.2.610826', '1', '4', '绥德县', '26', 'SDX', null, '003061008026', null);
INSERT INTO `pa_bmzd` VALUES ('F85EB4234E0140A79DCD70D4D4994DAE', '2015-05-03 11:15:43', '新疆维吾尔自治区阿克苏地区新和县', '1', '4.2.2.652925', '1', '4', '新和县', '25', 'XHX', null, '003065029025', null);
INSERT INTO `pa_bmzd` VALUES ('F8686D4CE36E485680691B39949EF5AC', '2015-05-03 11:15:43', '广东省清远市清新县', '1', '4.2.2.441827', '1', '4', '清新县', '27', 'QXX', null, '003044018027', null);
INSERT INTO `pa_bmzd` VALUES ('F86E8A9DB96A4B42919491DDE21F0AEB', '2015-05-03 11:15:43', '河北省张家口市桥西区', '1', '4.2.2.130703', '1', '4', '桥西区', '3', 'QXQ', null, '003013007003', null);
INSERT INTO `pa_bmzd` VALUES ('F870C423F63F4D7C909F3415E0C563A2', '2015-05-03 11:15:43', '黑龙江省鸡西市城子河区', '1', '4.2.2.230306', '1', '4', '城子河区', '6', 'CZHQ', null, '003023003006', null);
INSERT INTO `pa_bmzd` VALUES ('F87ACCC1418B43F7827E4A6EC98E1490', '2015-05-03 11:15:43', '河北省承德市隆化县', '1', '4.2.2.130825', '1', '4', '隆化县', '25', 'LHX', null, '003013008025', null);
INSERT INTO `pa_bmzd` VALUES ('F897828625244D5D85DC585FF5D7463A', '2015-05-03 11:15:43', '江西省宜春市袁州区', '1', '4.2.2.360902', '1', '4', '袁州区', '2', 'YZQ', null, '003036009002', null);
INSERT INTO `pa_bmzd` VALUES ('F8B311BC1BF444BF9B9709242C138BFE', '2015-05-03 11:15:43', '广东省广州市荔湾区', '1', '4.2.2.440103', '1', '4', '荔湾区', '3', 'LWQ', null, '003044001003', null);
INSERT INTO `pa_bmzd` VALUES ('F8B79E6F87A5480E9BF041D503695EBF', '2015-05-03 11:15:43', '湖北省鄂州市鄂城区', '1', '4.2.2.420704', '1', '4', '鄂城区', '4', 'ECQ', null, '003042007004', null);
INSERT INTO `pa_bmzd` VALUES ('F8C077E0FCAA46D08D2951DA1CB6F9C5', '2015-05-03 11:15:43', '山东省枣庄市峄城区', '1', '4.2.2.370404', '1', '4', '峄城区', '4', 'YCQ', null, '003037004004', null);
INSERT INTO `pa_bmzd` VALUES ('F8D1533E3D5E44FB88A455113F3DD204', '2015-05-03 11:15:43', '四川省凉山彝族自治州宁南县', '1', '4.2.2.513427', '1', '4', '宁南县', '27', 'NNX', null, '003051034027', null);
INSERT INTO `pa_bmzd` VALUES ('F8EA527271674E41AEEBCF09C88C854F', '2015-05-03 11:15:43', '新疆维吾尔自治区伊犁哈萨克自治州伊宁县', '1', '4.2.2.654021', '1', '4', '伊宁县', '21', 'YNX', null, '003065040021', null);
INSERT INTO `pa_bmzd` VALUES ('F904C822E990461EAA059C95E97C2871', '2015-05-03 11:15:43', '河北省石家庄市栾城县', '1', '4.2.2.130124', '1', '4', '栾城县', '24', 'LCX', null, '003013001024', null);
INSERT INTO `pa_bmzd` VALUES ('F90B3563C1A54B4B9360ABBB0A1AD1EA', '2015-05-03 11:15:43', '内蒙古自治区乌兰察布市卓资县', '1', '4.2.2.150921', '1', '4', '卓资县', '21', 'ZZX', null, '003015009021', null);
INSERT INTO `pa_bmzd` VALUES ('F92BC436112E4FCC9CED70AC891F8F92', '2015-05-03 11:15:43', '山西省太原市娄烦县', '1', '4.2.2.140123', '1', '4', '娄烦县', '23', 'LFX', null, '003014001023', null);
INSERT INTO `pa_bmzd` VALUES ('F931ABCFEEE847259FEB8DE6C8692AB6', '2015-05-03 11:15:43', '广东省揭阳市惠来县', '1', '4.2.2.445224', '1', '4', '惠来县', '24', 'HLX', null, '003044052024', null);
INSERT INTO `pa_bmzd` VALUES ('F967CCA014A540C8A7D54928791A866D', '2015-05-03 11:15:43', '吉林省延边朝鲜族自治州珲春市', '1', '4.2.2.222404', '1', '4', '珲春市', '4', 'HCS', null, '003022024004', null);
INSERT INTO `pa_bmzd` VALUES ('F9795AB600434D699A3BFA86D3C2AAB5', '2015-05-03 11:15:43', '河南省新乡市凤泉区', '1', '4.2.2.410704', '1', '4', '凤泉区', '4', 'FQQ', null, '003041007004', null);
INSERT INTO `pa_bmzd` VALUES ('F988F18F8E7C42A8AA8F5501C43D900C', '2015-05-03 11:15:43', '青海省果洛藏族自治州班玛县', '1', '4.2.2.632622', '1', '4', '班玛县', '22', 'BMX', null, '003063026022', null);
INSERT INTO `pa_bmzd` VALUES ('F98EB4A78ADE45AB88865095573DE10F', '2015-05-03 11:15:43', '江西省抚州市南城县', '1', '4.2.2.361021', '1', '4', '南城县', '21', 'NCX', null, '003036010021', null);
INSERT INTO `pa_bmzd` VALUES ('F99190D1BA6945928B2B71036243DFDF', '2015-05-03 11:15:43', '四川省广安市广安区', '1', '4.2.2.511602', '1', '4', '广安区', '2', 'GAQ', null, '003051016002', null);
INSERT INTO `pa_bmzd` VALUES ('F998CA81A30E4894BD8C9E347E2D321B', '2015-05-03 11:15:43', '陕西省榆林市清涧县', '1', '4.2.2.610830', '1', '4', '清涧县', '30', 'QJX', null, '003061008030', null);
INSERT INTO `pa_bmzd` VALUES ('F99B24E2B2824EEF8A0336599079E8D6', '2015-05-03 11:15:43', '江苏省无锡市北塘区', '1', '4.2.2.320204', '1', '4', '北塘区', '4', 'BTQ', null, '003032002004', null);
INSERT INTO `pa_bmzd` VALUES ('F9AB299141E14A0D8278AB9217721236', '2015-05-03 11:15:43', '四川省广元市苍溪县', '1', '4.2.2.510824', '1', '4', '苍溪县', '24', 'CXX', null, '003051008024', null);
INSERT INTO `pa_bmzd` VALUES ('F9AE5BC6B5E644C4A0A68319D23061D7', '2015-05-03 11:15:43', '浙江省杭州市市辖区', '1', '4.2.2.330101', '1', '4', '市辖区', '1', 'SXQ', null, '003033001001', null);
INSERT INTO `pa_bmzd` VALUES ('F9B7F23A5A3542BDA9C9DB6A413928D0', '2015-05-03 11:15:43', '河南省平顶山市舞钢市', '1', '4.2.2.410481', '1', '4', '舞钢市', '81', 'WGS', null, '003041004081', null);
INSERT INTO `pa_bmzd` VALUES ('F9EAFBDEDD6D423BAACD7AF23EF7E6BD', '2015-05-03 11:15:43', '河南省开封市金明区', '1', '4.2.2.410211', '1', '4', '金明区', '11', 'JMQ', null, '003041002011', null);
INSERT INTO `pa_bmzd` VALUES ('F9FEBE00B43A4C3A9C148FE605B8C554', '2015-05-03 11:15:43', '四川省德阳市旌阳区', '1', '4.2.2.510603', '1', '4', '旌阳区', '3', 'JYQ', null, '003051006003', null);
INSERT INTO `pa_bmzd` VALUES ('FA03B7EC3057441180DEAD78CE6F2306', '2015-05-03 11:15:43', '辽宁省朝阳市凌源市', '1', '4.2.2.211382', '1', '4', '凌源市', '82', 'LYS', null, '003021013082', null);
INSERT INTO `pa_bmzd` VALUES ('FA1341F9CB4845718DA0DD427C54CFE8', '2015-05-03 11:15:43', '山东省滨州市邹平县', '1', '4.2.2.371626', '1', '4', '邹平县', '26', 'ZPX', null, '003037016026', null);
INSERT INTO `pa_bmzd` VALUES ('FA1C9FBB32D04423B5AF8335974DBAA6', '2015-05-03 11:15:43', '广东省梅州市梅县', '1', '4.2.2.441421', '1', '4', '梅县', '21', 'MX', null, '003044014021', null);
INSERT INTO `pa_bmzd` VALUES ('FA26B33370954587BD5288AC481C4706', '2015-05-03 11:15:43', '山西省大同市新荣区', '1', '4.2.2.140212', '1', '4', '新荣区', '12', 'XRQ', null, '003014002012', null);
INSERT INTO `pa_bmzd` VALUES ('FA26CBBCF73E4EA9AF9957EECD2F793F', '2015-05-03 11:15:43', '广东省佛山市高明区', '1', '4.2.2.440608', '1', '4', '高明区', '8', 'GMQ', null, '003044006008', null);
INSERT INTO `pa_bmzd` VALUES ('FA291C9765E94010A7CEC1B2A46ACFA0', '2015-05-03 11:15:43', '福建省泉州市南安市', '1', '4.2.2.350583', '1', '4', '南安市', '83', 'NAS', null, '003035005083', null);
INSERT INTO `pa_bmzd` VALUES ('FA41249EB4724D57B0EBFB9332C72D50', '2015-05-03 11:15:43', '江西省景德镇市浮梁县', '1', '4.2.2.360222', '1', '4', '浮梁县', '22', 'FLX', null, '003036002022', null);
INSERT INTO `pa_bmzd` VALUES ('FA464EDA68AB4241A8879355AE1C4520', '2015-05-03 11:15:43', '湖北省黄石市大冶市', '1', '4.2.2.420281', '1', '4', '大冶市', '81', 'DYS', null, '003042002081', null);
INSERT INTO `pa_bmzd` VALUES ('FA592A031598474CB9DC4D59DD4DF021', '2015-05-03 11:15:43', '山西省晋城市市辖区', '1', '4.2.2.140501', '1', '4', '市辖区', '1', 'SXQ', null, '003014005001', null);
INSERT INTO `pa_bmzd` VALUES ('FA700FA1A1524A59A8D7063A665BEF55', '2015-05-03 11:15:43', '新疆维吾尔自治区哈密地区伊吾县', '1', '4.2.2.652223', '1', '4', '伊吾县', '23', 'YWX', null, '003065022023', null);
INSERT INTO `pa_bmzd` VALUES ('FA70B68374F34068932AA21D977E476B', '2015-05-03 11:15:43', '湖南省岳阳市湘阴县', '1', '4.2.2.430624', '1', '4', '湘阴县', '24', 'XYX', null, '003043006024', null);
INSERT INTO `pa_bmzd` VALUES ('FA8536132CE441C284AB01F713BE2AFB', '2015-05-03 11:15:43', '黑龙江省鸡西市滴道区', '1', '4.2.2.230304', '1', '4', '滴道区', '4', 'DDQ', null, '003023003004', null);
INSERT INTO `pa_bmzd` VALUES ('FA877457282B4CD98A8887A1E1BED483', '2015-05-03 11:15:43', '广东省茂名市茂港区', '1', '4.2.2.440903', '1', '4', '茂港区', '3', 'MGQ', null, '003044009003', null);
INSERT INTO `pa_bmzd` VALUES ('FA9D1D843081459881444E46C9F48762', '2015-05-03 11:15:43', '河北省邯郸市曲周县', '1', '4.2.2.130435', '1', '4', '曲周县', '35', 'QZX', null, '003013004035', null);
INSERT INTO `pa_bmzd` VALUES ('FA9EA1856DA1454A8FA500648E280BE8', '2015-05-03 11:15:43', '安徽省淮南市', '1', '4.2.2.340400', '0', '3', '淮南市', '4', 'HNS', null, '003034004', null);
INSERT INTO `pa_bmzd` VALUES ('FAA691BA08BD47A49E0F182B1EA6D6B1', '2015-05-03 11:15:43', '吉林省白城市大安市', '1', '4.2.2.220882', '1', '4', '大安市', '82', 'DAS', null, '003022008082', null);
INSERT INTO `pa_bmzd` VALUES ('FAE7C8F49AD8495D9D8333A5DF95CC05', '2015-05-03 11:15:43', '江西省抚州市崇仁县', '1', '4.2.2.361024', '1', '4', '崇仁县', '24', 'CRX', null, '003036010024', null);
INSERT INTO `pa_bmzd` VALUES ('FAFBE8676D994BA78B72868D6F3CDC08', '2015-05-03 11:15:43', '内蒙古自治区锡林郭勒盟西乌珠穆沁旗', '1', '4.2.2.152526', '1', '4', '西乌珠穆沁旗', '26', 'XWZMQQ', null, '003015025026', null);
INSERT INTO `pa_bmzd` VALUES ('FB0234B9ACB943F9A8FA0553164D4A20', '2015-05-03 11:15:43', '河南省焦作市马村区', '1', '4.2.2.410804', '1', '4', '马村区', '4', 'MCQ', null, '003041008004', null);
INSERT INTO `pa_bmzd` VALUES ('FB0B1216142B40F5B1F1CAE254962A5A', '2015-05-03 11:15:43', '安徽省安庆市宿松县', '1', '4.2.2.340826', '1', '4', '宿松县', '26', 'SSX', null, '003034008026', null);
INSERT INTO `pa_bmzd` VALUES ('FB136EEE8B5E4039B2C156CEBC757AD3', '2015-05-03 11:15:43', '河北省承德市', '1', '4.2.2.130800', '0', '3', '承德市', '8', 'CDS', null, '003013008', null);
INSERT INTO `pa_bmzd` VALUES ('FB28E9AB3893434E8B37F199247231ED', '2015-05-03 11:15:43', '甘肃省金昌市市辖区', '1', '4.2.2.620301', '1', '4', '市辖区', '1', 'SXQ', null, '003062003001', null);
INSERT INTO `pa_bmzd` VALUES ('FB2C5E56863E4EC2A77A70CF2334FEC6', '2015-05-03 11:15:43', '山东省济宁市微山县', '1', '4.2.2.370826', '1', '4', '微山县', '26', 'WSX', null, '003037008026', null);
INSERT INTO `pa_bmzd` VALUES ('FB31E76D10214376BE72D0684EA04506', '2015-05-03 11:15:43', '贵州省贵阳市', '1', '4.2.2.520100', '0', '3', '贵阳市', '1', 'GYS', null, '003052001', null);
INSERT INTO `pa_bmzd` VALUES ('FB6D552FBCDB4F66A37C885085FFB47B', '2015-05-03 11:15:43', '四川省达州市达县', '1', '4.2.2.511721', '1', '4', '达县', '21', 'DX', null, '003051017021', null);
INSERT INTO `pa_bmzd` VALUES ('FBAB46ADB8EB4D87917822D5346B6839', '2015-05-03 11:15:43', '云南省普洱市', '1', '4.2.2.530800', '0', '3', '普洱市', '8', 'PES', null, '003053008', null);
INSERT INTO `pa_bmzd` VALUES ('FBAB78E98A0440A88075B925DD527817', '2015-05-03 11:15:43', '陕西省延安市', '1', '4.2.2.610600', '0', '3', '延安市', '6', 'YAS', null, '003061006', null);
INSERT INTO `pa_bmzd` VALUES ('FBADBE2031694636AC3AC06F6E106039', '2015-05-03 11:15:43', '陕西省西安市长安区', '1', '4.2.2.610116', '1', '4', '长安区', '16', 'ZAQ', null, '003061001016', null);
INSERT INTO `pa_bmzd` VALUES ('FBB3C3461ABA45D1BD578D66C3445663', '2015-05-03 11:15:43', '山西省运城市临猗县', '1', '4.2.2.140821', '1', '4', '临猗县', '21', 'LYX', null, '003014008021', null);
INSERT INTO `pa_bmzd` VALUES ('FBBF8798B3F4405A9CEE0B5A7D189465', '2015-05-03 11:15:43', '浙江省舟山市普陀区', '1', '4.2.2.330903', '1', '4', '普陀区', '3', 'PTQ', null, '003033009003', null);
INSERT INTO `pa_bmzd` VALUES ('FBD504E057584446B7A0CE6468273DF4', '2015-05-03 11:15:43', '内蒙古自治区呼和浩特市赛罕区', '1', '4.2.2.150105', '1', '4', '赛罕区', '5', 'SHQ', null, '003015001005', null);
INSERT INTO `pa_bmzd` VALUES ('FBD53C9EAEAD4AFAA5F19B57864AE6F6', '2015-05-03 11:15:43', '黑龙江省鸡西市密山市', '1', '4.2.2.230382', '1', '4', '密山市', '82', 'MSS', null, '003023003082', null);
INSERT INTO `pa_bmzd` VALUES ('FC08825066BA42E7A797F5306DD7A34F', '2015-05-03 11:15:43', '山东省枣庄市市辖区', '1', '4.2.2.370401', '1', '4', '市辖区', '1', 'SXQ', null, '003037004001', null);
INSERT INTO `pa_bmzd` VALUES ('FC13F07D04604512AB7C5E59095EC811', '2015-05-03 11:15:43', '广东省江门市鹤山市', '1', '4.2.2.440784', '1', '4', '鹤山市', '84', 'HSS', null, '003044007084', null);
INSERT INTO `pa_bmzd` VALUES ('FC2975D08EFD429696301544872D0C7C', '2015-05-03 11:15:43', '福建省漳州市长泰县', '1', '4.2.2.350625', '1', '4', '长泰县', '25', 'ZTX', null, '003035006025', null);
INSERT INTO `pa_bmzd` VALUES ('FC59EA2C7CDA472D94DF34B925F4386A', '2015-05-03 11:15:43', '陕西省咸阳市旬邑县', '1', '4.2.2.610429', '1', '4', '旬邑县', '29', 'XYX', null, '003061004029', null);
INSERT INTO `pa_bmzd` VALUES ('FC7002C60F8A416BABDF6654EAA1F109', '2015-05-03 11:15:43', '内蒙古自治区鄂尔多斯市鄂托克前旗', '1', '4.2.2.150623', '1', '4', '鄂托克前旗', '23', 'ETKQQ', null, '003015006023', null);
INSERT INTO `pa_bmzd` VALUES ('FC95848CD2DD4C5F91641CBF321CD496', '2015-05-03 11:15:43', '吉林省长春市朝阳区', '1', '4.2.2.220104', '1', '4', '朝阳区', '4', 'ZYQ', null, '003022001004', null);
INSERT INTO `pa_bmzd` VALUES ('FCA4948FA885464695F2925F90A3BF3E', '2015-05-03 11:15:43', '辽宁省鞍山市铁东区', '1', '4.2.2.210302', '1', '4', '铁东区', '2', 'TDQ', null, '003021003002', null);
INSERT INTO `pa_bmzd` VALUES ('FCA899A709E8410E922C9265F3F33BCC', '2015-05-03 11:15:43', '云南省普洱市澜沧拉祜族自治县', '1', '4.2.2.530828', '1', '4', '澜沧拉祜族自治县', '28', 'LCLHZZZX', null, '003053008028', null);
INSERT INTO `pa_bmzd` VALUES ('FCB44465C4054714864FF929B362C811', '2015-05-03 11:15:43', '黑龙江省哈尔滨市双城市', '1', '4.2.2.230182', '1', '4', '双城市', '82', 'SCS', null, '003023001082', null);
INSERT INTO `pa_bmzd` VALUES ('FCC3766A04DA4A24B521DB5A33609921', '2015-05-03 11:15:43', '河南省商丘市睢阳区', '1', '4.2.2.411403', '1', '4', '睢阳区', '3', 'SYQ', null, '003041014003', null);
INSERT INTO `pa_bmzd` VALUES ('FCD712C9AB414DAB986977956F2ED27F', '2015-05-03 11:15:43', '贵州省贵阳市白云区', '1', '4.2.2.520113', '1', '4', '白云区', '13', 'BYQ', null, '003052001013', null);
INSERT INTO `pa_bmzd` VALUES ('FD297F7363C14BD981BD46CFC88BA5E1', '2015-05-03 11:15:43', '山西省忻州市原平市', '1', '4.2.2.140981', '1', '4', '原平市', '81', 'YPS', null, '003014009081', null);
INSERT INTO `pa_bmzd` VALUES ('FD5AA0351CD64C8DB5D4D8C96C82AFB8', '2015-05-03 11:15:43', '内蒙古自治区包头市', '1', '4.2.2.150200', '0', '3', '包头市', '2', 'BTS', null, '003015002', null);
INSERT INTO `pa_bmzd` VALUES ('FDB312AA2C4745568C1E2EE315820F30', '2015-05-03 11:15:43', '安徽省安庆市潜山县', '1', '4.2.2.340824', '1', '4', '潜山县', '24', 'QSX', null, '003034008024', null);
INSERT INTO `pa_bmzd` VALUES ('FDB6789962704318BC7F39EF14B849A3', '2015-05-03 11:15:43', '内蒙古自治区赤峰市敖汉旗', '1', '4.2.2.150430', '1', '4', '敖汉旗', '30', 'AHQ', null, '003015004030', null);
INSERT INTO `pa_bmzd` VALUES ('FDB7F0A105A2497692A0878D6F529EF7', '2015-05-03 11:15:43', '湖南省长沙市开福区', '1', '4.2.2.430105', '1', '4', '开福区', '5', 'KFQ', null, '003043001005', null);
INSERT INTO `pa_bmzd` VALUES ('FDCE1F87F50243F2BAA590D525D5FBCA', '2015-05-03 11:15:43', '贵州省黔西南布依族苗族自治州晴隆县', '1', '4.2.2.522324', '1', '4', '晴隆县', '24', 'QLX', null, '003052023024', null);
INSERT INTO `pa_bmzd` VALUES ('FDF401D01EB743AFB732C8FD7184709A', '2015-05-03 11:15:43', '云南省文山壮族苗族自治州丘北县', '1', '4.2.2.532626', '1', '4', '丘北县', '26', 'QBX', null, '003053026026', null);
INSERT INTO `pa_bmzd` VALUES ('FDFE45DBF9B8420091E56C94B5489679', '2015-05-03 11:15:43', '云南省玉溪市', '1', '4.2.2.530400', '0', '3', '玉溪市', '4', 'YXS', null, '003053004', null);
INSERT INTO `pa_bmzd` VALUES ('FE3BB7DE0CC24A5F8F68D4D47081897C', '2015-05-03 11:15:43', '湖南省张家界市慈利县', '1', '4.2.2.430821', '1', '4', '慈利县', '21', 'CLX', null, '003043008021', null);
INSERT INTO `pa_bmzd` VALUES ('FE3F26EED1474FB690AA357743ED03A3', '2015-05-03 11:15:43', '湖南省株洲市茶陵县', '1', '4.2.2.430224', '1', '4', '茶陵县', '24', 'CLX', null, '003043002024', null);
INSERT INTO `pa_bmzd` VALUES ('FE47219C1D194BADA1F7B68D28885A7A', '2015-05-03 11:15:43', '湖北省恩施土家族苗族自治州鹤峰县', '1', '4.2.2.422828', '1', '4', '鹤峰县', '28', 'HFX', null, '003042028028', null);
INSERT INTO `pa_bmzd` VALUES ('FE6A2343327C4A1D97CCBDC12F53B8F8', '2015-05-03 11:15:43', '天津市市辖区西青区', '1', '4.2.2.120111', '1', '4', '西青区', '11', 'XQQ', null, '003012001011', null);
INSERT INTO `pa_bmzd` VALUES ('FE800DFC097245CDBB53FD55748B39ED', '2015-05-03 11:15:43', '辽宁省大连市旅顺口区', '1', '4.2.2.210212', '1', '4', '旅顺口区', '12', 'LSKQ', null, '003021002012', null);
INSERT INTO `pa_bmzd` VALUES ('FE9FDEDF5CC24C4CA76A26062E03129E', '2015-05-03 11:15:43', '辽宁省朝阳市北票市', '1', '4.2.2.211381', '1', '4', '北票市', '81', 'BPS', null, '003021013081', null);
INSERT INTO `pa_bmzd` VALUES ('FEB55851E723414BA3AE1CC75A334C56', '2015-05-03 11:15:43', '浙江省衢州市开化县', '1', '4.2.2.330824', '1', '4', '开化县', '24', 'KHX', null, '003033008024', null);
INSERT INTO `pa_bmzd` VALUES ('FEBAAE10F4C948548EDA932C7F276AD8', '2015-05-03 11:15:43', '贵州省黔西南布依族苗族自治州普安县', '1', '4.2.2.522323', '1', '4', '普安县', '23', 'PAX', null, '003052023023', null);
INSERT INTO `pa_bmzd` VALUES ('FF14D9A7A2EF41FC96F6369949380321', '2015-05-03 11:15:43', '安徽省芜湖市南陵县', '1', '4.2.2.340223', '1', '4', '南陵县', '23', 'NLX', null, '003034002023', null);
INSERT INTO `pa_bmzd` VALUES ('FF1692AD90C84E4B9A507412B99AAC13', '2015-05-03 11:15:43', '西藏自治区那曲地区申扎县', '1', '4.2.2.542426', '1', '4', '申扎县', '26', 'SZX', null, '003054024026', null);
INSERT INTO `pa_bmzd` VALUES ('FF2B909DE9EE4BAC945F7A22719D5C4C', '2015-05-03 11:15:43', '辽宁省盘锦市盘山县', '1', '4.2.2.211122', '1', '4', '盘山县', '22', 'PSX', null, '003021011022', null);
INSERT INTO `pa_bmzd` VALUES ('FF428F04D4CF40A6A2E60B7D60F0629D', '2015-05-03 11:15:43', '湖南省郴州市苏仙区', '1', '4.2.2.431003', '1', '4', '苏仙区', '3', 'SXQ', null, '003043010003', null);
INSERT INTO `pa_bmzd` VALUES ('FF4A9E5CF2644EDAB29D2824E4E76060', '2015-05-03 11:15:43', '江西省萍乡市莲花县', '1', '4.2.2.360321', '1', '4', '莲花县', '21', 'LHX', null, '003036003021', null);
INSERT INTO `pa_bmzd` VALUES ('FF57FE840CFF47CA808B5B2042E5000B', '2015-05-03 11:15:43', '新疆维吾尔自治区吐鲁番地区鄯善县', '1', '4.2.2.652122', '1', '4', '鄯善县', '22', 'SSX', null, '003065021022', null);
INSERT INTO `pa_bmzd` VALUES ('FF5BD8086AD64465B3E25ACBC70C3C05', '2015-05-03 11:15:43', '河北省沧州市运河区', '1', '4.2.2.130903', '1', '4', '运河区', '3', 'YHQ', null, '003013009003', null);
INSERT INTO `pa_bmzd` VALUES ('FF63F188C57941D1BD15D967FC4E957E', '2015-05-03 11:15:43', '吉林省四平市梨树县', '1', '4.2.2.220322', '1', '4', '梨树县', '22', 'LSX', null, '003022003022', null);
INSERT INTO `pa_bmzd` VALUES ('FF69F31B5AD2490CA1F140A278961640', '2015-05-03 11:15:43', '甘肃省平凉市华亭县', '1', '4.2.2.620824', '1', '4', '华亭县', '24', 'HTX', null, '003062008024', null);
INSERT INTO `pa_bmzd` VALUES ('FF98E770C07545B1A60727A3557C04B5', '2015-05-03 11:15:43', '广东省云浮市新兴县', '1', '4.2.2.445321', '1', '4', '新兴县', '21', 'XXX', null, '003044053021', null);
INSERT INTO `pa_bmzd` VALUES ('FFA81795A260492686BFEFCB4A7EC8C2', '2015-05-03 11:15:43', '广西壮族自治区百色市那坡县', '1', '4.2.2.451026', '1', '4', '那坡县', '26', 'NPX', null, '003045010026', null);
INSERT INTO `pa_bmzd` VALUES ('FFB18E6AA9134690ABE75F86230D18CE', '2015-05-03 11:15:43', '重庆市市辖区黔江区', '1', '4.2.2.500114', '1', '4', '黔江区', '14', 'QJQ', null, '003050001014', null);
INSERT INTO `pa_bmzd` VALUES ('FFF5BC2341F94A969AC2DA1B2C8B5DE2', '2015-05-03 11:15:43', '吉林省四平市铁东区', '1', '4.2.2.220303', '1', '4', '铁东区', '3', 'TDQ', null, '003022003003', null);
INSERT INTO `pa_bmzd` VALUES ('0017CF400BB7428396DB710E6E08EBD5', '2015-05-03 11:15:43', '西藏自治区山南地区洛扎县', '1', '4.2.2.542228', '1', '4', '洛扎县', '28', 'LZX', null, '003054022028', null);
INSERT INTO `pa_bmzd` VALUES ('001FAAE75C9C4F3998611141B0E5D7EC', '2015-05-03 11:15:43', '广东省清远市连南瑶族自治县', '1', '4.2.2.441826', '1', '4', '连南瑶族自治县', '26', 'LNYZZZX', null, '003044018026', null);
INSERT INTO `pa_bmzd` VALUES ('002C54932735407C87B6B49452D4F2A3', '2015-05-03 11:15:43', '云南省文山壮族苗族自治州马关县', '1', '4.2.2.532625', '1', '4', '马关县', '25', 'MGX', null, '003053026025', null);
INSERT INTO `pa_bmzd` VALUES ('00713ABB4CF74E8BA5D9F2A3137CCC87', '2015-05-03 11:15:43', '四川省成都市邛崃市', '1', '4.2.2.510183', '1', '4', '邛崃市', '83', 'QLS', null, '003051001083', null);
INSERT INTO `pa_bmzd` VALUES ('009298D3F8B84387B59BD5F1E4F0ABAA', '2015-05-03 11:15:43', '山东省菏泽市', '1', '4.2.2.371700', '0', '3', '菏泽市', '17', 'HZS', null, '003037017', null);
INSERT INTO `pa_bmzd` VALUES ('00C566BA8E8548C0A3A5C9722FC7B555', '2015-05-03 11:15:43', '四川省凉山彝族自治州木里藏族自治县', '1', '4.2.2.513422', '1', '4', '木里藏族自治县', '22', 'MLZZZZX', null, '003051034022', null);
INSERT INTO `pa_bmzd` VALUES ('00CD2C7466024C98BAD751CAEC6823ED', '2015-05-03 11:15:43', '吉林省通化市集安市', '1', '4.2.2.220582', '1', '4', '集安市', '82', 'JAS', null, '003022005082', null);
INSERT INTO `pa_bmzd` VALUES ('00D288649E854CA8B10A0F4B3F4A6736', '2015-05-03 11:15:43', '安徽省铜陵市郊区', '1', '4.2.2.340711', '1', '4', '郊区', '11', 'JQ', null, '003034007011', null);
INSERT INTO `pa_bmzd` VALUES ('00DBBF55FC63453186FEC9A7F4127B96', '2015-05-03 11:15:43', '江西省九江市星子县', '1', '4.2.2.360427', '1', '4', '星子县', '27', 'XZX', null, '003036004027', null);
INSERT INTO `pa_bmzd` VALUES ('00E35BA62F044B21A4B3C78565C9EA15', '2015-05-03 11:15:43', '西藏自治区昌都地区芒康县', '1', '4.2.2.542129', '1', '4', '芒康县', '29', 'WKX', null, '003054021029', null);
INSERT INTO `pa_bmzd` VALUES ('0101919499BE425682236BB3E5DFA172', '2015-05-03 11:15:43', '四川省泸州市江阳区', '1', '4.2.2.510502', '1', '4', '江阳区', '2', 'JYQ', null, '003051005002', null);
INSERT INTO `pa_bmzd` VALUES ('011081604BEA468E9D6796BFA094BD4D', '2015-05-03 11:15:43', '吉林省长春市南关区', '1', '4.2.2.220102', '1', '4', '南关区', '2', 'NGQ', null, '003022001002', null);
INSERT INTO `pa_bmzd` VALUES ('012A4F6D26C7442EA2411482DE0911E2', '2015-05-03 11:15:43', '山东省日照市莒县', '1', '4.2.2.371122', '1', '4', '莒县', '22', 'JX', null, '003037011022', null);
INSERT INTO `pa_bmzd` VALUES ('013366C504F248988AA57831E58AC9B5', '2015-05-03 11:15:43', '辽宁省葫芦岛市龙港区', '1', '4.2.2.211403', '1', '4', '龙港区', '3', 'LGQ', null, '003021014003', null);
INSERT INTO `pa_bmzd` VALUES ('01506068FE4A48E4AFD702FF35ED290E', '2015-05-03 11:15:43', '广西壮族自治区梧州市市辖区', '1', '4.2.2.450401', '1', '4', '市辖区', '1', 'SXQ', null, '003045004001', null);
INSERT INTO `pa_bmzd` VALUES ('0154833F20F949718BDC34CFEB3EA955', '2015-05-03 11:15:43', '吉林省通化市东昌区', '1', '4.2.2.220502', '1', '4', '东昌区', '2', 'DCQ', null, '003022005002', null);
INSERT INTO `pa_bmzd` VALUES ('015EFDFFFD8E449986DCDBCC62CF5FDE', '2015-05-03 11:15:43', '广西壮族自治区钦州市', '1', '4.2.2.450700', '0', '3', '钦州市', '7', 'QZS', null, '003045007', null);
INSERT INTO `pa_bmzd` VALUES ('01698F8902044EA5B6A165A917C8D74B', '2015-05-03 11:15:43', '江西省新余市市辖区', '1', '4.2.2.360501', '1', '4', '市辖区', '1', 'SXQ', null, '003036005001', null);
INSERT INTO `pa_bmzd` VALUES ('017C7A7C723A4433BE6BF23A90E2ED0C', '2015-05-03 11:15:43', '福建省漳州市漳浦县', '1', '4.2.2.350623', '1', '4', '漳浦县', '23', 'ZPX', null, '003035006023', null);
INSERT INTO `pa_bmzd` VALUES ('01907E75A3494EEDAAAE70E5B06BADCD', '2015-05-03 11:15:43', '四川省广元市旺苍县', '1', '4.2.2.510821', '1', '4', '旺苍县', '21', 'WCX', null, '003051008021', null);
INSERT INTO `pa_bmzd` VALUES ('019E25FE895D45418D63F6DC6918E726', '2015-05-03 11:15:43', '内蒙古自治区呼和浩特市和林格尔县', '1', '4.2.2.150123', '1', '4', '和林格尔县', '23', 'HLGEX', null, '003015001023', null);
INSERT INTO `pa_bmzd` VALUES ('019EA163814F47B5975F0E357D22B050', '2015-05-03 11:15:43', '安徽省滁州市琅琊区', '1', '4.2.2.341102', '1', '4', '琅琊区', '2', 'LYQ', null, '003034011002', null);
INSERT INTO `pa_bmzd` VALUES ('01A82EC8827B421FAEB75F8C2FB3B6EB', '2015-05-03 11:15:43', '山西省临汾市隰县', '1', '4.2.2.141031', '1', '4', '隰县', '31', 'XX', null, '003014010031', null);
INSERT INTO `pa_bmzd` VALUES ('01B157B36DD441FCA4BDAD0E47E39332', '2015-05-03 11:15:43', '湖北省恩施土家族苗族自治州巴东县', '1', '4.2.2.422823', '1', '4', '巴东县', '23', 'BDX', null, '003042028023', null);
INSERT INTO `pa_bmzd` VALUES ('01B4BA89BB044EC999A9D412E435327D', '2015-05-03 11:15:43', '云南省普洱市江城哈尼族彝族自治县', '1', '4.2.2.530826', '1', '4', '江城哈尼族彝族自治县', '26', 'JCHNZYZZZX', null, '003053008026', null);
INSERT INTO `pa_bmzd` VALUES ('01CD08F3419E445BB44537E50A4CC58D', '2015-05-03 11:15:43', '山西省大同市灵丘县', '1', '4.2.2.140224', '1', '4', '灵丘县', '24', 'LQX', null, '003014002024', null);
INSERT INTO `pa_bmzd` VALUES ('01CF6A12E73240F0937086E0B69D1F81', '2015-05-03 11:15:43', '河北省衡水市阜城县', '1', '4.2.2.131128', '1', '4', '阜城县', '28', 'FCX', null, '003013011028', null);
INSERT INTO `pa_bmzd` VALUES ('01E23FBD4D374B53B4F413659A24FAE8', '2015-05-03 11:15:43', '湖北省咸宁市崇阳县', '1', '4.2.2.421223', '1', '4', '崇阳县', '23', 'CYX', null, '003042012023', null);
INSERT INTO `pa_bmzd` VALUES ('0207BDA069E84FE7BF8143DDBAF93D70', '2015-05-03 11:15:43', '广西壮族自治区桂林市资源县', '1', '4.2.2.450329', '1', '4', '资源县', '29', 'ZYX', null, '003045003029', null);
INSERT INTO `pa_bmzd` VALUES ('0243D5C7EFF844F3875257CED2C02068', '2015-05-03 11:15:43', '辽宁省抚顺市清原满族自治县', '1', '4.2.2.210423', '1', '4', '清原满族自治县', '23', 'QYMZZZX', null, '003021004023', null);
INSERT INTO `pa_bmzd` VALUES ('02618A476D5E44B4AA58F9DC32A48862', '2015-05-03 11:15:43', '新疆维吾尔自治区阿克苏地区库车县', '1', '4.2.2.652923', '1', '4', '库车县', '23', 'KJX', null, '003065029023', null);
INSERT INTO `pa_bmzd` VALUES ('02735DFEEA33497BA92331065C8A4534', '2015-05-03 11:15:43', '新疆维吾尔自治区昌吉回族自治州呼图壁县', '1', '4.2.2.652323', '1', '4', '呼图壁县', '23', 'HTBX', null, '003065023023', null);
INSERT INTO `pa_bmzd` VALUES ('027BA489C3C643739A7AEADA192F02AF', '2015-05-03 11:15:43', '江苏省淮安市淮阴区', '1', '4.2.2.320804', '1', '4', '淮阴区', '4', 'HYQ', null, '003032008004', null);
INSERT INTO `pa_bmzd` VALUES ('027C9E9B42A8436F90098ACF971A40D2', '2015-05-03 11:15:43', '新疆维吾尔自治区克拉玛依市白碱滩区', '1', '4.2.2.650204', '1', '4', '白碱滩区', '4', 'BJTQ', null, '003065002004', null);
INSERT INTO `pa_bmzd` VALUES ('0295342857544090BE6A329E49DE5214', '2015-05-03 11:15:43', '山西省太原市万柏林区', '1', '4.2.2.140109', '1', '4', '万柏林区', '9', 'WBLQ', null, '003014001009', null);
INSERT INTO `pa_bmzd` VALUES ('0299DF27A5C142568952932D86F311D2', '2015-05-03 11:15:43', '河北省邢台市市辖区', '1', '4.2.2.130501', '1', '4', '市辖区', '1', 'SXQ', null, '003013005001', null);
INSERT INTO `pa_bmzd` VALUES ('029AA8B734B24C768E06A12BA30480DF', '2015-05-03 11:15:43', '云南省昭通市镇雄县', '1', '4.2.2.530627', '1', '4', '镇雄县', '27', 'ZXX', null, '003053006027', null);
INSERT INTO `pa_bmzd` VALUES ('029CE73B32BD4E4BA9E85F7004365255', '2015-05-03 11:15:43', '四川省乐山市五通桥区', '1', '4.2.2.511112', '1', '4', '五通桥区', '12', 'WTQQ', null, '003051011012', null);
INSERT INTO `pa_bmzd` VALUES ('02A816C17AF246E5806560866C8042E1', '2015-05-03 11:15:43', '湖南省永州市江永县', '1', '4.2.2.431125', '1', '4', '江永县', '25', 'JYX', null, '003043011025', null);
INSERT INTO `pa_bmzd` VALUES ('02AC11EEE8914E1EAC3BD62CF67DF487', '2015-05-03 11:15:43', '河南省郑州市巩义市', '1', '4.2.2.410181', '1', '4', '巩义市', '81', 'GYS', null, '003041001081', null);
INSERT INTO `pa_bmzd` VALUES ('02B88634097F4765A3A39C6D7240DAC7', '2015-05-03 11:15:43', '云南省楚雄彝族自治州大姚县', '1', '4.2.2.532326', '1', '4', '大姚县', '26', 'DYX', null, '003053023026', null);
INSERT INTO `pa_bmzd` VALUES ('02D107062D4A4FD4AE9A4655C7398094', '2015-05-03 11:15:43', '广东省汕尾市陆丰市', '1', '4.2.2.441581', '1', '4', '陆丰市', '81', 'LFS', null, '003044015081', null);
INSERT INTO `pa_bmzd` VALUES ('032E3C61099C44599A07F7FD8D6FC3F3', '2015-05-03 11:15:43', '江西省抚州市南丰县', '1', '4.2.2.361023', '1', '4', '南丰县', '23', 'NFX', null, '003036010023', null);
INSERT INTO `pa_bmzd` VALUES ('0336FE0E33D54982A7BF8E7D716B3A40', '2015-05-03 11:15:43', '上海市市辖区青浦区', '1', '4.2.2.310118', '1', '4', '青浦区', '18', 'QPQ', null, '003031001018', null);
INSERT INTO `pa_bmzd` VALUES ('033DA451C92A4DDA80EEDE1B8EE351CD', '2015-05-03 11:15:43', '陕西省咸阳市秦都区', '1', '4.2.2.610402', '1', '4', '秦都区', '2', 'QDQ', null, '003061004002', null);
INSERT INTO `pa_bmzd` VALUES ('034FBEAAE19645099A47C2562C4C0513', '2015-05-03 11:15:43', '广西壮族自治区河池市市辖区', '1', '4.2.2.451201', '1', '4', '市辖区', '1', 'SXQ', null, '003045012001', null);
INSERT INTO `pa_bmzd` VALUES ('036616908F1E466F9D3E8F1E7824CAE7', '2015-05-03 11:15:43', '四川省南充市高坪区', '1', '4.2.2.511303', '1', '4', '高坪区', '3', 'GPQ', null, '003051013003', null);
INSERT INTO `pa_bmzd` VALUES ('0384B59EA9114551BF467306FEC3E02E', '2015-05-03 11:15:43', '贵州省六盘水市盘县', '1', '4.2.2.520222', '1', '4', '盘县', '22', 'PX', null, '003052002022', null);
INSERT INTO `pa_bmzd` VALUES ('038F6D502E944533BA61B7FA0675BEDF', '2015-05-03 11:15:43', '湖南省娄底市冷水江市', '1', '4.2.2.431381', '1', '4', '冷水江市', '81', 'LSJS', null, '003043013081', null);
INSERT INTO `pa_bmzd` VALUES ('039A8E0CF0964099A2B72F374D02AD96', '2015-05-03 11:15:43', '浙江省宁波市镇海区', '1', '4.2.2.330211', '1', '4', '镇海区', '11', 'ZHQ', null, '003033002011', null);
INSERT INTO `pa_bmzd` VALUES ('03A0CCDD3DA44798B7C7A116940CD04C', '2015-05-03 11:15:43', '安徽省六安市金寨县', '1', '4.2.2.341524', '1', '4', '金寨县', '24', 'JZX', null, '003034015024', null);
INSERT INTO `pa_bmzd` VALUES ('03D6B211019F4422A2B9F7235F94CF1B', '2015-05-03 11:15:43', '甘肃省平凉市庄浪县', '1', '4.2.2.620825', '1', '4', '庄浪县', '25', 'ZLX', null, '003062008025', null);
INSERT INTO `pa_bmzd` VALUES ('03E9695C39F1408CBDAB80656BD51F2C', '2015-05-03 11:15:43', '陕西省渭南市临渭区', '1', '4.2.2.610502', '1', '4', '临渭区', '2', 'LWQ', null, '003061005002', null);
INSERT INTO `pa_bmzd` VALUES ('03F6FE419403451B8AB024B34B03967A', '2015-05-03 11:15:43', '陕西省安康市', '1', '4.2.2.610900', '0', '3', '安康市', '9', 'AKS', null, '003061009', null);
INSERT INTO `pa_bmzd` VALUES ('03F7B7D61FB0437A86F8445B0B699F78', '2015-05-03 11:15:43', '西藏自治区阿里地区日土县', '1', '4.2.2.542524', '1', '4', '日土县', '24', 'RTX', null, '003054025024', null);
INSERT INTO `pa_bmzd` VALUES ('03FA2D0D478A4E1EB0AE4C355C74F76C', '2015-05-03 11:15:43', '陕西省汉中市南郑县', '1', '4.2.2.610721', '1', '4', '南郑县', '21', 'NZX', null, '003061007021', null);
INSERT INTO `pa_bmzd` VALUES ('03FEA6F0CEE24BAE94324EE4BF526F66', '2015-05-03 11:15:43', '安徽省滁州市市辖区', '1', '4.2.2.341101', '1', '4', '市辖区', '1', 'SXQ', null, '003034011001', null);
INSERT INTO `pa_bmzd` VALUES ('03FF82A2F20942EAB22A4683217E560C', '2015-05-03 11:15:43', '湖北省黄石市下陆区', '1', '4.2.2.420204', '1', '4', '下陆区', '4', 'XLQ', null, '003042002004', null);
INSERT INTO `pa_bmzd` VALUES ('04095D869AED4BF0A5B128E59D74667C', '2015-05-03 11:15:43', '辽宁省辽阳市文圣区', '1', '4.2.2.211003', '1', '4', '文圣区', '3', 'WSQ', null, '003021010003', null);
INSERT INTO `pa_bmzd` VALUES ('042D6B9E0D8E4EB2A6BA4C26016418D3', '2015-05-03 11:15:43', '云南省普洱市西盟佤族自治县', '1', '4.2.2.530829', '1', '4', '西盟佤族自治县', '29', 'XMWZZZX', null, '003053008029', null);
INSERT INTO `pa_bmzd` VALUES ('043BB48B6ADE447D8ED4B9B39857A37E', '2015-05-03 11:15:43', '辽宁省葫芦岛市兴城市', '1', '4.2.2.211481', '1', '4', '兴城市', '81', 'XCS', null, '003021014081', null);
INSERT INTO `pa_bmzd` VALUES ('043E956AE52343BAB3C82D927016FED6', '2015-05-03 11:15:43', '山西省长治市市辖区', '1', '4.2.2.140401', '1', '4', '市辖区', '1', 'SXQ', null, '003014004001', null);
INSERT INTO `pa_bmzd` VALUES ('044FBF30446342A0AA7C325CE63321DE', '2015-05-03 11:15:43', '贵州省黔南布依族苗族自治州', '1', '4.2.2.522700', '0', '3', '黔南布依族苗族自治州', '27', 'QNBYZMZZZZ', null, '003052027', null);
INSERT INTO `pa_bmzd` VALUES ('045F6588F7D141BEBB5D7F28B6CD2998', '2015-05-03 11:15:43', '黑龙江省伊春市', '1', '4.2.2.230700', '0', '3', '伊春市', '7', 'YCS', null, '003023007', null);
INSERT INTO `pa_bmzd` VALUES ('046BDC54031E4467BF655A887783DCEB', '2015-05-03 11:15:43', '河南省安阳市龙安区', '1', '4.2.2.410506', '1', '4', '龙安区', '6', 'LAQ', null, '003041005006', null);
INSERT INTO `pa_bmzd` VALUES ('047B4A82B03C453E966620EE8A2C7E3B', '2015-05-03 11:15:43', '河北省石家庄市赵县', '1', '4.2.2.130133', '1', '4', '赵县', '33', 'ZX', null, '003013001033', null);
INSERT INTO `pa_bmzd` VALUES ('04817956F38347CBBEA3CCA1B3C10106', '2015-05-03 11:15:43', '陕西省铜川市', '1', '4.2.2.610200', '0', '3', '铜川市', '2', 'TCS', null, '003061002', null);
INSERT INTO `pa_bmzd` VALUES ('04852A25EE33474AA09FC82472E24FB4', '2015-05-03 11:15:43', '江西省抚州市东乡县', '1', '4.2.2.361029', '1', '4', '东乡县', '29', 'DXX', null, '003036010029', null);
INSERT INTO `pa_bmzd` VALUES ('048ABFE6DF0846B6A072D63D0C6FF37C', '2015-05-03 11:15:43', '河南省驻马店市', '1', '4.2.2.411700', '0', '3', '驻马店市', '17', 'ZMDS', null, '003041017', null);
INSERT INTO `pa_bmzd` VALUES ('049881BAE4744B909E431E883539989D', '2015-05-03 11:15:43', '青海省海北藏族自治州刚察县', '1', '4.2.2.632224', '1', '4', '刚察县', '24', 'GCX', null, '003063022024', null);
INSERT INTO `pa_bmzd` VALUES ('04A899B39C924AE689B5352ACF8E21D7', '2015-05-03 11:15:43', '四川省阿坝藏族羌族自治州茂县', '1', '4.2.2.513223', '1', '4', '茂县', '23', 'MX', null, '003051032023', null);
INSERT INTO `pa_bmzd` VALUES ('04A8A725B22446A2898035AE00418DC6', '2015-05-03 11:15:43', '新疆维吾尔自治区克孜勒苏柯尔克孜自治州阿克陶县', '1', '4.2.2.653022', '1', '4', '阿克陶县', '22', 'AKYX', null, '003065030022', null);
INSERT INTO `pa_bmzd` VALUES ('04B2C928E88A484883E74D3924B75391', '2015-05-03 11:15:43', '陕西省宝鸡市太白县', '1', '4.2.2.610331', '1', '4', '太白县', '31', 'TBX', null, '003061003031', null);
INSERT INTO `pa_bmzd` VALUES ('04B441C25FF3471E89EE1D75BF91664B', '2015-05-03 11:15:43', '浙江省绍兴市嵊州市', '1', '4.2.2.330683', '1', '4', '嵊州市', '83', 'SZS', null, '003033006083', null);
INSERT INTO `pa_bmzd` VALUES ('04D07BFA5FE14A8CBD126C9B211C28C0', '2015-05-03 11:15:43', '重庆市市辖区南川区', '1', '4.2.2.500319', '1', '4', '南川区', '19', 'NCQ', null, '003050001019', null);
INSERT INTO `pa_bmzd` VALUES ('04D0877016AD4BFF91D8BF7D33D4DBFB', '2015-05-03 11:15:43', '广东省广州市越秀区', '1', '4.2.2.440104', '1', '4', '越秀区', '4', 'YXQ', null, '003044001004', null);
INSERT INTO `pa_bmzd` VALUES ('04EC64D956A64AB19302153BFD3A7F91', '2015-05-03 11:15:43', '广东省汕头市澄海区', '1', '4.2.2.440515', '1', '4', '澄海区', '15', 'DHQ', null, '003044005015', null);
INSERT INTO `pa_bmzd` VALUES ('0524BDAF52384B0B88829439868EE747', '2015-05-03 11:15:43', '甘肃省张掖市肃南裕固族自治县', '1', '4.2.2.620721', '1', '4', '肃南裕固族自治县', '21', 'SNYGZZZX', null, '003062007021', null);
INSERT INTO `pa_bmzd` VALUES ('0529424394364D75A7408A05A659158E', '2015-05-03 11:15:43', '云南省大理白族自治州漾濞彝族自治县', '1', '4.2.2.532922', '1', '4', '漾濞彝族自治县', '22', 'YBYZZZX', null, '003053029022', null);
INSERT INTO `pa_bmzd` VALUES ('05367D9B855044F0A54C6B4701EF00AC', '2015-05-03 11:15:43', '吉林省吉林市舒兰市', '1', '4.2.2.220283', '1', '4', '舒兰市', '83', 'SLS', null, '003022002083', null);
INSERT INTO `pa_bmzd` VALUES ('055A8CECD0494263967CCA2E4F7FCD35', '2015-05-03 11:15:43', '新疆维吾尔自治区阿克苏地区拜城县', '1', '4.2.2.652926', '1', '4', '拜城县', '26', 'BCX', null, '003065029026', null);
INSERT INTO `pa_bmzd` VALUES ('055C7722D1C24042BDC3081B1264CBE2', '2015-05-03 11:15:43', '上海市市辖区静安区', '1', '4.2.2.310106', '1', '4', '静安区', '6', 'JAQ', null, '003031001006', null);
INSERT INTO `pa_bmzd` VALUES ('056C98D176774992AA43E2982E352763', '2015-05-03 11:15:43', '安徽省亳州市利辛县', '1', '4.2.2.341623', '1', '4', '利辛县', '23', 'LXX', null, '003034016023', null);
INSERT INTO `pa_bmzd` VALUES ('05759FB9560D467890BAABF4A93DD9D3', '2015-05-03 11:15:43', '福建省南平市顺昌县', '1', '4.2.2.350721', '1', '4', '顺昌县', '21', 'SCX', null, '003035007021', null);
INSERT INTO `pa_bmzd` VALUES ('0577EC257DFE47958B9FBD3B3F6EF976', '2015-05-03 11:15:43', '广东省河源市龙川县', '1', '4.2.2.441622', '1', '4', '龙川县', '22', 'LCX', null, '003044016022', null);
INSERT INTO `pa_bmzd` VALUES ('05785F0D6BFD44F88D90EEB71C2CCD59', '2015-05-03 11:15:43', '湖南省张家界市市辖区', '1', '4.2.2.430801', '1', '4', '市辖区', '1', 'SXQ', null, '003043008001', null);
INSERT INTO `pa_bmzd` VALUES ('0583146F4CD34C4194C83A31A1C485C1', '2015-05-03 11:15:43', '广西壮族自治区来宾市合山市', '1', '4.2.2.451381', '1', '4', '合山市', '81', 'HSS', null, '003045013081', null);
INSERT INTO `pa_bmzd` VALUES ('05848B757224484CB080BA340309254C', '2015-05-03 11:15:43', '四川省凉山彝族自治州美姑县', '1', '4.2.2.513436', '1', '4', '美姑县', '36', 'MGX', null, '003051034036', null);
INSERT INTO `pa_bmzd` VALUES ('059F089A815D4CFD99A21A30FB02EEC9', '2015-05-03 11:15:43', '甘肃省兰州市市辖区', '1', '4.2.2.620101', '1', '4', '市辖区', '1', 'SXQ', null, '003062001001', null);
INSERT INTO `pa_bmzd` VALUES ('05C8648FA8A34C258269ED6774CB7AA7', '2015-05-03 11:15:43', '湖南省长沙市长沙县', '1', '4.2.2.430121', '1', '4', '长沙县', '21', 'ZSX', null, '003043001021', null);
INSERT INTO `pa_bmzd` VALUES ('05D38421015F4636B76DD484521EA8E9', '2015-05-03 11:15:43', '新疆维吾尔自治区喀什地区疏勒县', '1', '4.2.2.653122', '1', '4', '疏勒县', '22', 'SLX', null, '003065031022', null);
INSERT INTO `pa_bmzd` VALUES ('05DCAEB4D07D412898EE3BD89AA01FA9', '2015-05-03 11:15:43', '湖南省怀化市会同县', '1', '4.2.2.431225', '1', '4', '会同县', '25', 'KTX', null, '003043012025', null);
INSERT INTO `pa_bmzd` VALUES ('05E425EA5454427788035A2540DFC415', '2015-05-03 11:15:43', '山东省德州市市辖区', '1', '4.2.2.371401', '1', '4', '市辖区', '1', 'SXQ', null, '003037014001', null);
INSERT INTO `pa_bmzd` VALUES ('05EC9BE7C4904F488AC7CF4CA3677A41', '2015-05-03 11:15:43', '广东省肇庆市高要市', '1', '4.2.2.441283', '1', '4', '高要市', '83', 'GYS', null, '003044012083', null);
INSERT INTO `pa_bmzd` VALUES ('0617100E4A6E4444AB6AFA2FA11263AB', '2015-05-03 11:15:43', '黑龙江省黑河市市辖区', '1', '4.2.2.231101', '1', '4', '市辖区', '1', 'SXQ', null, '003023011001', null);
INSERT INTO `pa_bmzd` VALUES ('061E17F369FB4CEDABC8E5829089D8BE', '2015-05-03 11:15:43', '安徽省合肥市肥东县', '1', '4.2.2.340122', '1', '4', '肥东县', '22', 'FDX', null, '003034001022', null);
INSERT INTO `pa_bmzd` VALUES ('0625CA240062493E93F3D6795E75F5BC', '2015-05-03 11:15:43', '黑龙江省绥化市肇东市', '1', '4.2.2.231282', '1', '4', '肇东市', '82', 'ZDS', null, '003023012082', null);
INSERT INTO `pa_bmzd` VALUES ('062842BCE1904A888EC85504EA5CB76D', '2015-05-03 11:15:43', '湖北省十堰市茅箭区', '1', '4.2.2.420302', '1', '4', '茅箭区', '2', 'MJQ', null, '003042003002', null);
INSERT INTO `pa_bmzd` VALUES ('0631DACF05F84EF39D0C384DD037B306', '2015-05-03 11:15:43', '山东省德州市庆云县', '1', '4.2.2.371423', '1', '4', '庆云县', '23', 'QYX', null, '003037014023', null);
INSERT INTO `pa_bmzd` VALUES ('0642716375A846318BF682708051D1F7', '2015-05-03 11:15:43', '山西省临汾市洪洞县', '1', '4.2.2.141024', '1', '4', '洪洞县', '24', 'HDX', null, '003014010024', null);
INSERT INTO `pa_bmzd` VALUES ('067A89724DD142B096D024445A3EF01F', '2015-05-03 11:15:43', '陕西省宝鸡市凤翔县', '1', '4.2.2.610322', '1', '4', '凤翔县', '22', 'FXX', null, '003061003022', null);
INSERT INTO `pa_bmzd` VALUES ('067ED94BB17C4D5C8987295D841C1845', '2015-05-03 11:15:43', '重庆市市辖区永川区', '1', '4.2.2.500318', '1', '4', '永川区', '18', 'YCQ', null, '003050001018', null);
INSERT INTO `pa_bmzd` VALUES ('06841689CF4C452B849679D868BEB9B9', '2015-05-03 11:15:43', '广东省清远市阳山县', '1', '4.2.2.441823', '1', '4', '阳山县', '23', 'YSX', null, '003044018023', null);
INSERT INTO `pa_bmzd` VALUES ('068F0A2B6D3D419AA7CD99817503DCE7', '2015-05-03 11:15:43', '安徽省宿州市萧县', '1', '4.2.2.341322', '1', '4', '萧县', '22', 'XX', null, '003034013022', null);
INSERT INTO `pa_bmzd` VALUES ('0696240257C04766ABA20D947AA3D32D', '2015-05-03 11:15:43', '江西省吉安市峡江县', '1', '4.2.2.360823', '1', '4', '峡江县', '23', 'XJX', null, '003036008023', null);
INSERT INTO `pa_bmzd` VALUES ('0698BE5AED104A46B15E8D2086C82E8A', '2015-05-03 11:15:43', '辽宁省盘锦市', '1', '4.2.2.211100', '0', '3', '盘锦市', '11', 'PJS', null, '003021011', null);
INSERT INTO `pa_bmzd` VALUES ('069D0F9BBEC8486BB231752E735E2EE2', '2015-05-03 11:15:43', '河南省南阳市邓州市', '1', '4.2.2.411381', '1', '4', '邓州市', '81', 'DZS', null, '003041013081', null);
INSERT INTO `pa_bmzd` VALUES ('06A852F7F2254D8A9A5C67D7ADD41FF7', '2015-05-03 11:15:43', '山东省潍坊市诸城市', '1', '4.2.2.370782', '1', '4', '诸城市', '82', 'ZCS', null, '003037007082', null);
INSERT INTO `pa_bmzd` VALUES ('06B2589BCC7F4DC79E5A65BE83B52036', '2015-05-03 11:15:43', '内蒙古自治区鄂尔多斯市东胜区', '1', '4.2.2.150602', '1', '4', '东胜区', '2', 'DSQ', null, '003015006002', null);
INSERT INTO `pa_bmzd` VALUES ('EE61AE72A6744A38A09CA78D1FB8EACC', '2015-05-03 11:15:43', '河北省石家庄市桥东区', '1', '4.2.2.130103', '1', '4', '桥东区', '3', 'QDQ', null, '003013001003', null);
INSERT INTO `pa_bmzd` VALUES ('EE78E120BD69488EBDEA1E48AAD46DBD', '2015-05-03 11:15:43', '河南省周口市项城市', '1', '4.2.2.411681', '1', '4', '项城市', '81', 'XCS', null, '003041016081', null);
INSERT INTO `pa_bmzd` VALUES ('EE7F0D06B15546E4A536878F5BFD231F', '2015-05-03 11:15:43', '陕西省渭南市华阴市', '1', '4.2.2.610582', '1', '4', '华阴市', '82', 'HYS', null, '003061005082', null);
INSERT INTO `pa_bmzd` VALUES ('EE864D3A209240758C5F3323628DEB40', '2015-05-03 11:15:43', '贵州省铜仁市印江土家族苗族自治县', '1', '4.2.2.522226', '1', '4', '印江土家族苗族自治县', '25', 'YJTJZMZZZX', null, '003052006025', null);
INSERT INTO `pa_bmzd` VALUES ('EEB632CD5B4B413CAFE28F173A6E7BF6', '2015-05-03 11:15:43', '河北省保定市高阳县', '1', '4.2.2.130628', '1', '4', '高阳县', '28', 'GYX', null, '003013006028', null);
INSERT INTO `pa_bmzd` VALUES ('EEE26848E565441E9C67AA2D191E54CC', '2015-05-03 11:15:43', '贵州省安顺市市辖区', '1', '4.2.2.520401', '1', '4', '市辖区', '1', 'SXQ', null, '003052004001', null);
INSERT INTO `pa_bmzd` VALUES ('EEE87ECD8D0D4072A2FB2E97F336DCFB', '2015-05-03 11:15:43', '黑龙江省鹤岗市', '1', '4.2.2.230400', '0', '3', '鹤岗市', '4', 'HGS', null, '003023004', null);
INSERT INTO `pa_bmzd` VALUES ('EF1660577E7A42558C1AAC48B7124BC5', '2015-05-03 11:15:43', '湖南省长沙市宁乡县', '1', '4.2.2.430124', '1', '4', '宁乡县', '24', 'NXX', null, '003043001024', null);
INSERT INTO `pa_bmzd` VALUES ('EF38673E5D80485F801520724463774A', '2015-05-03 11:15:43', '甘肃省白银市景泰县', '1', '4.2.2.620423', '1', '4', '景泰县', '23', 'JTX', null, '003062004023', null);
INSERT INTO `pa_bmzd` VALUES ('EF3E32D8530144E0B5AB5AABFE9B7674', '2015-05-03 11:15:43', '山西省长治市长子县', '1', '4.2.2.140428', '1', '4', '长子县', '28', 'ZZX', null, '003014004028', null);
INSERT INTO `pa_bmzd` VALUES ('EF45B6B732794BDCB2275CA71C2734EC', '2015-05-03 11:15:43', '湖北省省直辖县级行政区划天门市', '1', '4.2.2.429006', '1', '4', '天门市', '6', 'TMS', null, '003042090006', null);
INSERT INTO `pa_bmzd` VALUES ('EF46A6804E654E0380DFD47DFBC2DF22', '2015-05-03 11:15:43', '河南省濮阳市华龙区', '1', '4.2.2.410902', '1', '4', '华龙区', '2', 'HLQ', null, '003041009002', null);
INSERT INTO `pa_bmzd` VALUES ('EF4E98067F444CDC85B90E4A1B4B8660', '2015-05-03 11:15:43', '辽宁省铁岭市清河区', '1', '4.2.2.211204', '1', '4', '清河区', '4', 'QHQ', null, '003021012004', null);
INSERT INTO `pa_bmzd` VALUES ('EF516C5C7573453688774D07A7D63850', '2015-05-03 11:15:43', '浙江省宁波市江北区', '1', '4.2.2.330205', '1', '4', '江北区', '5', 'JBQ', null, '003033002005', null);
INSERT INTO `pa_bmzd` VALUES ('EF5B0F5F44904A16AE97E1554FDC81AE', '2015-05-03 11:15:43', '内蒙古自治区通辽市科尔沁左翼后旗', '1', '4.2.2.150522', '1', '4', '科尔沁左翼后旗', '22', 'KEQZYHQ', null, '003015005022', null);
INSERT INTO `pa_bmzd` VALUES ('EF631497CD534D7FB0593EF150046AC2', '2015-05-03 11:15:43', '湖北省荆州市石首市', '1', '4.2.2.421081', '1', '4', '石首市', '81', 'SSS', null, '003042010081', null);
INSERT INTO `pa_bmzd` VALUES ('EF886F474EC84FCBB665D210ED10DF1C', '2015-05-03 11:15:43', '海南省三亚市', '1', '4.2.2.460200', '0', '3', '三亚市', '2', 'SYS', null, '003046002', null);
INSERT INTO `pa_bmzd` VALUES ('EFBFA4525C074AF58B69CF047AB1F0B9', '2015-05-03 11:15:43', '江苏省常州市武进区', '1', '4.2.2.320412', '1', '4', '武进区', '12', 'WJQ', null, '003032004012', null);
INSERT INTO `pa_bmzd` VALUES ('EFC0D9E4035F41F0B359D51C84CC9438', '2015-05-03 11:15:43', '山东省威海市环翠区', '1', '4.2.2.371002', '1', '4', '环翠区', '2', 'HCQ', null, '003037010002', null);
INSERT INTO `pa_bmzd` VALUES ('EFC4F898F4584EF0BE9B24290493A3C7', '2015-05-03 11:15:43', '福建省三明市永安市', '1', '4.2.2.350481', '1', '4', '永安市', '81', 'YAS', null, '003035004081', null);
INSERT INTO `pa_bmzd` VALUES ('EFC5FC3A70B24EF7AED4B920D58EE3CD', '2015-05-03 11:15:43', '山东省威海市', '1', '4.2.2.371000', '0', '3', '威海市', '10', 'WHS', null, '003037010', null);
INSERT INTO `pa_bmzd` VALUES ('EFDD083A572447B9B8E9EFB784FAE044', '2015-05-03 11:15:43', '青海省玉树藏族自治州称多县', '1', '4.2.2.632723', '1', '4', '称多县', '23', 'CDX', null, '003063027023', null);
INSERT INTO `pa_bmzd` VALUES ('F00AD645556B42BD83C1EAB20DBD3350', '2015-05-03 11:15:43', '新疆维吾尔自治区阿克苏地区乌什县', '1', '4.2.2.652927', '1', '4', '乌什县', '27', 'WSX', null, '003065029027', null);
INSERT INTO `pa_bmzd` VALUES ('F01AD7714A2D4C17A633A84D82951012', '2015-05-03 11:15:43', '福建省漳州市', '1', '4.2.2.350600', '0', '3', '漳州市', '6', 'ZZS', null, '003035006', null);
INSERT INTO `pa_bmzd` VALUES ('F04947DD1F66422296C9514E933F42B7', '2015-05-03 11:15:43', '广东省湛江市', '1', '4.2.2.440800', '0', '3', '湛江市', '8', 'ZJS', null, '003044008', null);
INSERT INTO `pa_bmzd` VALUES ('F04F9D3912834288A28BA43DF403C28C', '2015-05-03 11:15:43', '四川省绵阳市安县', '1', '4.2.2.510724', '1', '4', '安县', '24', 'AX', null, '003051007024', null);
INSERT INTO `pa_bmzd` VALUES ('F0561BDE8CC449FAA07E24BB87F00BF3', '2015-05-03 11:15:43', '浙江省宁波市余姚市', '1', '4.2.2.330281', '1', '4', '余姚市', '81', 'YYS', null, '003033002081', null);
INSERT INTO `pa_bmzd` VALUES ('F056B233D08E4150AA8E6592AF2D55FB', '2015-05-03 11:15:43', '陕西省汉中市汉台区', '1', '4.2.2.610702', '1', '4', '汉台区', '2', 'HTQ', null, '003061007002', null);
INSERT INTO `pa_bmzd` VALUES ('F0814D33AD794F368DD872DD3F7FFEAD', '2015-05-03 11:15:43', '江苏省扬州市', '1', '4.2.2.321000', '0', '3', '扬州市', '10', 'YZS', null, '003032010', null);
INSERT INTO `pa_bmzd` VALUES ('F08F33BB46FE4BB6817F2690BE29F14B', '2015-05-03 11:15:43', '安徽省马鞍山市花山区', '1', '4.2.2.340503', '1', '4', '花山区', '3', 'HSQ', null, '003034005003', null);
INSERT INTO `pa_bmzd` VALUES ('F0AFAB5BE06642F6BA04DAD0C149E311', '2015-05-03 11:15:43', '湖南省邵阳市隆回县', '1', '4.2.2.430524', '1', '4', '隆回县', '24', 'LHX', null, '003043005024', null);
INSERT INTO `pa_bmzd` VALUES ('F0C230E03FC34E76AAC317C5AB034AAB', '2015-05-03 11:15:43', '吉林省辽源市东丰县', '1', '4.2.2.220421', '1', '4', '东丰县', '21', 'DFX', null, '003022004021', null);
INSERT INTO `pa_bmzd` VALUES ('F0CB09D759CC4E0DA6035867B299FC33', '2015-05-03 11:15:43', '河南省开封市龙亭区', '1', '4.2.2.410202', '1', '4', '龙亭区', '2', 'LTQ', null, '003041002002', null);
INSERT INTO `pa_bmzd` VALUES ('F10C23895206467BB9BCB6425642E680', '2015-05-03 11:15:43', '浙江省绍兴市绍兴县', '1', '4.2.2.330621', '1', '4', '绍兴县', '21', 'SXX', null, '003033006021', null);
INSERT INTO `pa_bmzd` VALUES ('F11DFAC81A9448F5BB83AE2419CC55DD', '2015-05-03 11:15:43', '河南省新乡市辉县市', '1', '4.2.2.410782', '1', '4', '辉县市', '82', 'HXS', null, '003041007082', null);
INSERT INTO `pa_bmzd` VALUES ('F124D70711AB46A5BCEA8249FE2BEB40', '2015-05-03 11:15:43', '河南省许昌市许昌县', '1', '4.2.2.411023', '1', '4', '许昌县', '23', 'XCX', null, '003041010023', null);
INSERT INTO `pa_bmzd` VALUES ('F13F0B20CB1E4F6C888947FCC89E2D3F', '2015-05-03 11:15:43', '河北省张家口市阳原县', '1', '4.2.2.130727', '1', '4', '阳原县', '27', 'YYX', null, '003013007027', null);
INSERT INTO `pa_bmzd` VALUES ('F142378C5BC645FBA85E94DCC7A37090', '2015-05-03 11:15:43', '内蒙古自治区呼伦贝尔市扎兰屯市', '1', '4.2.2.150783', '1', '4', '扎兰屯市', '83', 'ZLZS', null, '003015007083', null);
INSERT INTO `pa_bmzd` VALUES ('F169CAD0E17E486D9E93FCF9FD9B34E9', '2015-05-03 11:15:43', '四川省凉山彝族自治州德昌县', '1', '4.2.2.513424', '1', '4', '德昌县', '24', 'DCX', null, '003051034024', null);
INSERT INTO `pa_bmzd` VALUES ('F16BCE76563A4830BB40FF6A4DC0F7A8', '2015-05-03 11:15:43', '浙江省绍兴市', '1', '4.2.2.330600', '0', '3', '绍兴市', '6', 'SXS', null, '003033006', null);
INSERT INTO `pa_bmzd` VALUES ('F19628B2FA53444BBFDA052FF20565B7', '2015-05-03 11:15:43', '安徽省淮南市八公山区', '1', '4.2.2.340405', '1', '4', '八公山区', '5', 'BGSQ', null, '003034004005', null);
INSERT INTO `pa_bmzd` VALUES ('F1A1481CAE744B598C5391E19818EC6C', '2015-05-03 11:15:43', '河南省新乡市获嘉县', '1', '4.2.2.410724', '1', '4', '获嘉县', '24', 'HJX', null, '003041007024', null);
INSERT INTO `pa_bmzd` VALUES ('F1EE0D175C164A7394A85E63B2260C31', '2015-05-03 11:15:43', '辽宁省阜新市海州区', '1', '4.2.2.210902', '1', '4', '海州区', '2', 'HZQ', null, '003021009002', null);
INSERT INTO `pa_bmzd` VALUES ('F1F028B7865D42659382E71301C67202', '2015-05-03 11:15:43', '浙江省丽水市景宁畲族自治县', '1', '4.2.2.331127', '1', '4', '景宁畲族自治县', '27', 'JNSZZZX', null, '003033011027', null);
INSERT INTO `pa_bmzd` VALUES ('F20BE184E3474D62871747FE3DEADB0E', '2015-05-03 11:15:43', '福建省龙岩市上杭县', '1', '4.2.2.350823', '1', '4', '上杭县', '23', 'SHX', null, '003035008023', null);
INSERT INTO `pa_bmzd` VALUES ('F2252D460F054E4FA5017DA067DD7446', '2015-05-03 11:15:43', '山西省运城市市辖区', '1', '4.2.2.140801', '1', '4', '市辖区', '1', 'SXQ', null, '003014008001', null);
INSERT INTO `pa_bmzd` VALUES ('F237E52977064B33B2E55C98D936D00E', '2015-05-03 11:15:43', '广西壮族自治区北海市铁山港区', '1', '4.2.2.450512', '1', '4', '铁山港区', '12', 'TSGQ', null, '003045005012', null);
INSERT INTO `pa_bmzd` VALUES ('F2481BB181EE45F6A0AA34AC441461FD', '2015-05-03 11:15:43', '江苏省苏州市市辖区', '1', '4.2.2.320501', '1', '4', '市辖区', '1', 'SXQ', null, '003032005001', null);
INSERT INTO `pa_bmzd` VALUES ('F27B01E6761F441BAEED249E8B752B7C', '2015-05-03 11:15:43', '河南省郑州市金水区', '1', '4.2.2.410105', '1', '4', '金水区', '5', 'JSQ', null, '003041001005', null);
INSERT INTO `pa_bmzd` VALUES ('F28754CD58EF4B6BAA5C696C10A5AAB5', '2015-05-03 11:15:43', '河北省邢台市巨鹿县', '1', '4.2.2.130529', '1', '4', '巨鹿县', '29', 'JLX', null, '003013005029', null);
INSERT INTO `pa_bmzd` VALUES ('F28F34299C4E40D1A0CEAAA88445B5A4', '2015-05-03 11:15:43', '宁夏回族自治区固原市泾源县', '1', '4.2.2.640424', '1', '4', '泾源县', '24', 'JYX', null, '003064004024', null);
INSERT INTO `pa_bmzd` VALUES ('F2B1C0AB3B07479C9CA5DC8CAD79A394', '2015-05-03 11:15:43', '海南省省直辖县级行政区划万宁市', '1', '4.2.2.469006', '1', '4', '万宁市', '6', 'WNS', null, '003046090006', null);
INSERT INTO `pa_bmzd` VALUES ('F2D20C579204411E82FD6521F3927646', '2015-05-03 11:15:43', '四川省成都市市辖区', '1', '4.2.2.510101', '1', '4', '市辖区', '1', 'SXQ', null, '003051001001', null);
INSERT INTO `pa_bmzd` VALUES ('F2DA1C56FD6D4D429076C0593B54FAB4', '2015-05-03 11:15:43', '广西壮族自治区梧州市蝶山区', '1', '4.2.2.450404', '1', '4', '蝶山区', '4', 'DSQ', null, '003045004004', null);
INSERT INTO `pa_bmzd` VALUES ('F329CDE73A6344D4837EB178676DB5D3', '2015-05-03 11:15:43', '江西省上饶市', '1', '4.2.2.361100', '0', '3', '上饶市', '11', 'SRS', null, '003036011', null);
INSERT INTO `pa_bmzd` VALUES ('F360EF4C2C604171B55F2868B61CBCBC', '2015-05-03 11:15:43', '北京市市辖区朝阳区', '1', '4.2.2.110105', '1', '4', '朝阳区', '5', 'ZYQ', null, '003011001005', null);
INSERT INTO `pa_bmzd` VALUES ('F363127A89784F22A373D40CB4ACFD05', '2015-05-03 11:15:43', '山西省阳泉市郊区', '1', '4.2.2.140311', '1', '4', '郊区', '11', 'JQ', null, '003014003011', null);
INSERT INTO `pa_bmzd` VALUES ('F3AA54014A9C49B091AF3EE191A70757', '2015-05-03 11:15:43', '新疆维吾尔自治区克孜勒苏柯尔克孜自治州', '1', '4.2.2.653000', '0', '3', '克孜勒苏柯尔克孜自治州', '30', 'KZLSKEKZZZZ', null, '003065030', null);
INSERT INTO `pa_bmzd` VALUES ('F3ABD3E6793943C395C080EEF50769DA', '2015-05-03 11:15:43', '浙江省湖州市南浔区', '1', '4.2.2.330503', '1', '4', '南浔区', '3', 'NXQ', null, '003033005003', null);
INSERT INTO `pa_bmzd` VALUES ('F3B2F5C73B4946769590F6457AA61D38', '2015-05-03 11:15:43', '广东省梅州市蕉岭县', '1', '4.2.2.441427', '1', '4', '蕉岭县', '27', 'QLX', null, '003044014027', null);
INSERT INTO `pa_bmzd` VALUES ('F3E37F5E4C6E4335AEC576956BD34FFD', '2015-05-03 11:15:43', '西藏自治区日喀则地区萨迦县', '1', '4.2.2.542325', '1', '4', '萨迦县', '25', 'SJX', null, '003054023025', null);
INSERT INTO `pa_bmzd` VALUES ('F3EA698BD9D6475B83AA56C6BB29361C', '2015-05-03 11:15:43', '河北省保定市安新县', '1', '4.2.2.130632', '1', '4', '安新县', '32', 'AXX', null, '003013006032', null);
INSERT INTO `pa_bmzd` VALUES ('F3EE4CB210114BE5B2A0C4897523940D', '2015-05-03 11:15:43', '四川省泸州市合江县', '1', '4.2.2.510522', '1', '4', '合江县', '22', 'HJX', null, '003051005022', null);
INSERT INTO `pa_bmzd` VALUES ('F41FCC2F3034443FAF83C9FEF8BD4048', '2015-05-03 11:15:43', '西藏自治区拉萨市', '1', '4.2.2.540100', '0', '3', '拉萨市', '1', 'LSS', null, '003054001', null);
INSERT INTO `pa_bmzd` VALUES ('F4437E8CBC944EAEB63B403A6E5C7373', '2015-05-03 11:15:43', '重庆市市辖区綦江区', '1', '4.2.2.500222', '1', '4', '綦江区', '10', 'QJQ', null, '003050001010', null);
INSERT INTO `pa_bmzd` VALUES ('F452F21FAF564A8398D14F80ABD85687', '2015-05-03 11:15:43', '江西省抚州市乐安县', '1', '4.2.2.361025', '1', '4', '乐安县', '25', 'YAX', null, '003036010025', null);
INSERT INTO `pa_bmzd` VALUES ('F45C6EE512A94746B34D9F009E92DEBE', '2015-05-03 11:15:43', '新疆维吾尔自治区和田地区皮山县', '1', '4.2.2.653223', '1', '4', '皮山县', '23', 'PSX', null, '003065032023', null);
INSERT INTO `pa_bmzd` VALUES ('F45E5179B7DE4D3BAEF44FA9A298A94C', '2015-05-03 11:15:43', '内蒙古自治区包头市九原区', '1', '4.2.2.150207', '1', '4', '九原区', '7', 'JYQ', null, '003015002007', null);
INSERT INTO `pa_bmzd` VALUES ('F4803FBE398944F2B3EB40014317AE0F', '2015-05-03 11:15:43', '广西壮族自治区玉林市北流市', '1', '4.2.2.450981', '1', '4', '北流市', '81', 'BLS', null, '003045009081', null);
INSERT INTO `pa_bmzd` VALUES ('F48C4422DB0A4003B6822D6A1AF64389', '2015-05-03 11:15:43', '黑龙江省伊春市五营区', '1', '4.2.2.230710', '1', '4', '五营区', '10', 'WYQ', null, '003023007010', null);
INSERT INTO `pa_bmzd` VALUES ('F49D7C3014F7451DA21E7A4F41A6F070', '2015-05-03 11:15:43', '山东省东营市东营区', '1', '4.2.2.370502', '1', '4', '东营区', '2', 'DYQ', null, '003037005002', null);
INSERT INTO `pa_bmzd` VALUES ('F4A1FD394DE64447920AAED81C36C013', '2015-05-03 11:15:43', '安徽省黄山市市辖区', '1', '4.2.2.341001', '1', '4', '市辖区', '1', 'SXQ', null, '003034010001', null);
INSERT INTO `pa_bmzd` VALUES ('F4C06066DCFE4560A30CC6494C131683', '2015-05-03 11:15:43', '江苏省苏州市太仓市', '1', '4.2.2.320585', '1', '4', '太仓市', '85', 'TCS', null, '003032005085', null);
INSERT INTO `pa_bmzd` VALUES ('F4C727319DD94C1A82D417640F572BC4', '2015-05-03 11:15:43', '黑龙江省齐齐哈尔市建华区', '1', '4.2.2.230203', '1', '4', '建华区', '3', 'JHQ', null, '003023002003', null);
INSERT INTO `pa_bmzd` VALUES ('F4CE087D77DC4B5EB37E21504DDCC401', '2015-05-03 11:15:43', '山西省运城市芮城县', '1', '4.2.2.140830', '1', '4', '芮城县', '30', 'RCX', null, '003014008030', null);
INSERT INTO `pa_bmzd` VALUES ('F4E60E6FBDFF4D188BD9954844A904E0', '2015-05-03 11:15:43', '云南省文山壮族苗族自治州富宁县', '1', '4.2.2.532628', '1', '4', '富宁县', '28', 'FNX', null, '003053026028', null);
INSERT INTO `pa_bmzd` VALUES ('F50474800C784390BC85F905265090BF', '2015-05-03 11:15:43', '云南省大理白族自治州大理市', '1', '4.2.2.532901', '1', '4', '大理市', '1', 'DLS', null, '003053029001', null);
INSERT INTO `pa_bmzd` VALUES ('F523856FC9C54EE392DAA2B21564B1EB', '2015-05-03 11:15:43', '吉林省松原市前郭尔罗斯蒙古族自治县', '1', '4.2.2.220721', '1', '4', '前郭尔罗斯蒙古族自治县', '21', 'QGELSMGZZZX', null, '003022007021', null);
INSERT INTO `pa_bmzd` VALUES ('F524763BF411421496532ED031F4A801', '2015-05-03 11:15:43', '河北省保定市清苑县', '1', '4.2.2.130622', '1', '4', '清苑县', '22', 'QYX', null, '003013006022', null);
INSERT INTO `pa_bmzd` VALUES ('F550FD0AD6444029B7B816FCD0A423B3', '2015-05-03 11:15:43', '重庆市市辖区江北区', '1', '4.2.2.500105', '1', '4', '江北区', '5', 'JBQ', null, '003050001005', null);
INSERT INTO `pa_bmzd` VALUES ('F566B7E6286044B38E1FAF0EC9CB9315', '2015-05-03 11:15:43', '湖南省张家界市武陵源区', '1', '4.2.2.430811', '1', '4', '武陵源区', '11', 'WLYQ', null, '003043008011', null);
INSERT INTO `pa_bmzd` VALUES ('F57828D9D5E2480DABC0F1606B3A33F0', '2015-05-03 11:15:43', '浙江省台州市临海市', '1', '4.2.2.331082', '1', '4', '临海市', '82', 'LHS', null, '003033010082', null);
INSERT INTO `pa_bmzd` VALUES ('F5A1455F0F6847B69AAB6A916E043ABC', '2015-05-03 11:15:43', '青海省海西蒙古族藏族自治州都兰县', '1', '4.2.2.632822', '1', '4', '都兰县', '22', 'DLX', null, '003063028022', null);
INSERT INTO `pa_bmzd` VALUES ('F5C7BB20586F4538A952DC2E95912A3A', '2015-05-03 11:15:43', '辽宁省沈阳市大东区', '1', '4.2.2.210104', '1', '4', '大东区', '4', 'DDQ', null, '003021001004', null);
INSERT INTO `pa_bmzd` VALUES ('F600674709464E5095A2CE8DEE508660', '2015-05-03 11:15:43', '四川省攀枝花市市辖区', '1', '4.2.2.510401', '1', '4', '市辖区', '1', 'SXQ', null, '003051004001', null);
INSERT INTO `pa_bmzd` VALUES ('F60B6926AF9945D2B2DD55BA0667054A', '2015-05-03 11:15:43', '内蒙古自治区兴安盟乌兰浩特市', '1', '4.2.2.152201', '1', '4', '乌兰浩特市', '1', 'WLHTS', null, '003015022001', null);
INSERT INTO `pa_bmzd` VALUES ('F60DBEA714E14780BAD4144091A6EC26', '2015-05-03 11:15:43', '四川省凉山彝族自治州', '1', '4.2.2.513400', '0', '3', '凉山彝族自治州', '34', 'LSYZZZZ', null, '003051034', null);
INSERT INTO `pa_bmzd` VALUES ('F61FBF8AB1B24314A5FFB884EFE209F7', '2015-05-03 11:15:43', '黑龙江省双鸭山市宝山区', '1', '4.2.2.230506', '1', '4', '宝山区', '6', 'BSQ', null, '003023005006', null);
INSERT INTO `pa_bmzd` VALUES ('F6209DC2CA6D4807800D2CE15755FAAB', '2015-05-03 11:15:43', '甘肃省临夏回族自治州永靖县', '1', '4.2.2.622923', '1', '4', '永靖县', '23', 'YJX', null, '003062029023', null);
INSERT INTO `pa_bmzd` VALUES ('F63EDBEEB5A54C10ACD385D56256A4DC', '2015-05-03 11:15:43', '山东省烟台市长岛县', '1', '4.2.2.370634', '1', '4', '长岛县', '34', 'ZDX', null, '003037006034', null);
INSERT INTO `pa_bmzd` VALUES ('F65AE783977D4C8F8CDB708E345E7C08', '2015-05-03 11:15:43', '西藏自治区阿里地区改则县', '1', '4.2.2.542526', '1', '4', '改则县', '26', 'GZX', null, '003054025026', null);
INSERT INTO `pa_bmzd` VALUES ('F66285DF0DF847CC953ADF01A377C46E', '2015-05-03 11:15:43', '福建省厦门市翔安区', '1', '4.2.2.350213', '1', '4', '翔安区', '13', 'XAQ', null, '003035002013', null);
INSERT INTO `pa_bmzd` VALUES ('F663395EEB1F45798BBD5161A5410EC6', '2015-05-03 11:15:43', '吉林省吉林市船营区', '1', '4.2.2.220204', '1', '4', '船营区', '4', 'CYQ', null, '003022002004', null);
INSERT INTO `pa_bmzd` VALUES ('F67516A1B08C4103BD94E955EC37A8E6', '2015-05-03 11:15:43', '辽宁省沈阳市市辖区', '1', '4.2.2.210101', '1', '4', '市辖区', '1', 'SXQ', null, '003021001001', null);
INSERT INTO `pa_bmzd` VALUES ('F68517EA961D4807A3A812B6CDC3345B', '2015-05-03 11:15:43', '重庆市县潼南县', '1', '4.2.2.500223', '1', '4', '潼南县', '23', 'TNX', null, '003050002023', null);
INSERT INTO `pa_bmzd` VALUES ('F68BC24E1CD243F788F25802D9207963', '2015-05-03 11:15:43', '山西省临汾市浮山县', '1', '4.2.2.141027', '1', '4', '浮山县', '27', 'FSX', null, '003014010027', null);
INSERT INTO `pa_bmzd` VALUES ('F6AB7EBDFF0248A18517EE15D4305BCF', '2015-05-03 11:15:43', '湖南省邵阳市邵阳县', '1', '4.2.2.430523', '1', '4', '邵阳县', '23', 'SYX', null, '003043005023', null);
INSERT INTO `pa_bmzd` VALUES ('4022818c3c42a184013c42abdff30002', '2013-01-16 17:23:46', '安徽巢湖居巢区', '0', '4.2.2.341402', '1', '5', '居巢区', '1', 'JCQ', null, '003034001081001', '0');
INSERT INTO `pa_bmzd` VALUES ('4022818c3c42a184013c42ac5f650003', '2013-01-16 17:24:18', '安徽巢湖庐江县', '0', '4.2.2.341421', '1', '5', '庐江县', '2', 'LJX', null, '003034001081002', '0');
INSERT INTO `pa_bmzd` VALUES ('4022818c3c42a184013c42ac87bc0004', '2013-01-16 17:24:29', '安徽巢湖无为县', '0', '4.2.2.341422', '1', '5', '无为县', '3', 'WWX', null, '003034001081003', '0');
INSERT INTO `pa_bmzd` VALUES ('4022818c3c42a184013c42aca9c30005', '2013-01-16 17:24:37', '安徽巢湖含山县', '0', '4.2.2.341423', '1', '5', '含山县', '4', 'HSX', null, '003034001081004', '0');
INSERT INTO `pa_bmzd` VALUES ('4022818c3c42a184013c42accad80006', '2013-01-16 17:24:46', '安徽巢湖和县', '0', '4.2.2.341424', '1', '5', '和县', '5', 'HX', null, '003034001081005', '0');
INSERT INTO `pa_bmzd` VALUES ('7F0C4740E12F491C8AF2F8F76293D17A', '2015-05-03 11:15:44', '安徽省六安市舒城县', '1', '4.2.2.341523', '1', '4', '舒城县', '23', 'SCX', null, '003034015023', null);
INSERT INTO `pa_bmzd` VALUES ('7F281F5CD37E49229B90BD85DDF679DF', '2015-05-03 11:15:44', '广东省湛江市吴川市', '1', '4.2.2.440883', '1', '4', '吴川市', '83', 'WCS', null, '003044008083', null);
INSERT INTO `pa_bmzd` VALUES ('7F32879B68544847AA69E6C3CC89BEFC', '2015-05-03 11:15:44', '内蒙古自治区乌兰察布市凉城县', '1', '4.2.2.150925', '1', '4', '凉城县', '25', 'LCX', null, '003015009025', null);
INSERT INTO `pa_bmzd` VALUES ('7F75A918A62340D49E33E9F4161978EA', '2015-05-03 11:15:44', '河北省张家口市怀安县', '1', '4.2.2.130728', '1', '4', '怀安县', '28', 'HAX', null, '003013007028', null);
INSERT INTO `pa_bmzd` VALUES ('7F988133B6604AEF9E9AC6A9E961CC43', '2015-05-03 11:15:44', '四川省甘孜藏族自治州康定县', '1', '4.2.2.513321', '1', '4', '康定县', '21', 'KDX', null, '003051033021', null);
INSERT INTO `pa_bmzd` VALUES ('7F9D65DFB888481E89AA232C62BBECD3', '2015-05-03 11:15:44', '湖北省黄冈市', '1', '4.2.2.421100', '0', '3', '黄冈市', '11', 'HGS', null, '003042011', null);
INSERT INTO `pa_bmzd` VALUES ('7FAA4E768CF24BC683ACE91A933B0A94', '2015-05-03 11:15:44', '西藏自治区日喀则地区江孜县', '1', '4.2.2.542323', '1', '4', '江孜县', '23', 'JZX', null, '003054023023', null);
INSERT INTO `pa_bmzd` VALUES ('7FAA73B20F89489E8FFAE142CC8A385B', '2015-05-03 11:15:44', '陕西省铜川市宜君县', '1', '4.2.2.610222', '1', '4', '宜君县', '22', 'YJX', null, '003061002022', null);
INSERT INTO `pa_bmzd` VALUES ('7FCF036F9FD748659D382699C8FC19AE', '2015-05-03 11:15:44', '安徽省淮南市大通区', '1', '4.2.2.340402', '1', '4', '大通区', '2', 'DTQ', null, '003034004002', null);
INSERT INTO `pa_bmzd` VALUES ('7FDCD415A3254C22902EC93843D99476', '2015-05-03 11:15:44', '内蒙古自治区通辽市霍林郭勒市', '1', '4.2.2.150581', '1', '4', '霍林郭勒市', '81', 'HLGLS', null, '003015005081', null);
INSERT INTO `pa_bmzd` VALUES ('7FE491F8B21443DDA4D79D4B9B1F4A5C', '2015-05-03 11:15:44', '吉林省长春市双阳区', '1', '4.2.2.220112', '1', '4', '双阳区', '12', 'SYQ', null, '003022001012', null);
INSERT INTO `pa_bmzd` VALUES ('802551F73A1D4DE2B2D2C2BF33002B18', '2015-05-03 11:15:44', '内蒙古自治区赤峰市宁城县', '1', '4.2.2.150429', '1', '4', '宁城县', '29', 'NCX', null, '003015004029', null);
INSERT INTO `pa_bmzd` VALUES ('8030CD522E834BC9B49B1FC3B5870991', '2015-05-03 11:15:44', '吉林省白城市市辖区', '1', '4.2.2.220801', '1', '4', '市辖区', '1', 'SXQ', null, '003022008001', null);
INSERT INTO `pa_bmzd` VALUES ('80330EBEDC3B45D4A2B422CEBA0C4C27', '2015-05-03 11:15:44', '四川省资阳市市辖区', '1', '4.2.2.512001', '1', '4', '市辖区', '1', 'SXQ', null, '003051020001', null);
INSERT INTO `pa_bmzd` VALUES ('8053A98C4AB94058A9AE96B79ADE3AA2', '2015-05-03 11:15:44', '河北省沧州市任丘市', '1', '4.2.2.130982', '1', '4', '任丘市', '82', 'RQS', null, '003013009082', null);
INSERT INTO `pa_bmzd` VALUES ('80565437D028443AB39C342088B9AEA5', '2015-05-03 11:15:44', '江苏省扬州市邗江区', '1', '4.2.2.321003', '1', '4', '邗江区', '3', 'HJQ', null, '003032010003', null);
INSERT INTO `pa_bmzd` VALUES ('807BAF8D3F0449829571F5C31E7101A9', '2015-05-03 11:15:44', '四川省雅安市市辖区', '1', '4.2.2.511801', '1', '4', '市辖区', '1', 'SXQ', null, '003051018001', null);
INSERT INTO `pa_bmzd` VALUES ('807FA4D9F35E4246B4E96041B8092117', '2015-05-03 11:15:44', '四川省凉山彝族自治州会理县', '1', '4.2.2.513425', '1', '4', '会理县', '25', 'KLX', null, '003051034025', null);
INSERT INTO `pa_bmzd` VALUES ('80937DB9799A46B6AB8EAD7DB8F1F244', '2015-05-03 11:15:44', '河南省驻马店市确山县', '1', '4.2.2.411725', '1', '4', '确山县', '25', 'QSX', null, '003041017025', null);
INSERT INTO `pa_bmzd` VALUES ('80A2AD01455347178A1300E734431120', '2015-05-03 11:15:44', '陕西省安康市石泉县', '1', '4.2.2.610922', '1', '4', '石泉县', '22', 'SQX', null, '003061009022', null);
INSERT INTO `pa_bmzd` VALUES ('80AF947EFFDA4DA3A9C768DB7F9356BB', '2015-05-03 11:15:44', '江西省赣州市寻乌县', '1', '4.2.2.360734', '1', '4', '寻乌县', '34', 'XWX', null, '003036007034', null);
INSERT INTO `pa_bmzd` VALUES ('80B3B209F7F74487BCF627B39893732B', '2015-05-03 11:15:44', '上海市市辖区虹口区', '1', '4.2.2.310109', '1', '4', '虹口区', '9', 'JKQ', null, '003031001009', null);
INSERT INTO `pa_bmzd` VALUES ('80BAD91BA0A74EEA94534223DB6D01B4', '2015-05-03 11:15:44', '西藏自治区山南地区贡嘎县', '1', '4.2.2.542223', '1', '4', '贡嘎县', '23', 'GGX', null, '003054022023', null);
INSERT INTO `pa_bmzd` VALUES ('80E8B0CB00934F93A464984259F0C322', '2015-05-03 11:15:44', '江苏省徐州市市辖区', '1', '4.2.2.320301', '1', '4', '市辖区', '1', 'SXQ', null, '003032003001', null);
INSERT INTO `pa_bmzd` VALUES ('8139BD32D2504CC698BC4423924FFD3C', '2015-05-03 11:15:44', '黑龙江省牡丹江市东安区', '1', '4.2.2.231002', '1', '4', '东安区', '2', 'DAQ', null, '003023010002', null);
INSERT INTO `pa_bmzd` VALUES ('817530E49703483CAEACC4584109DA7D', '2015-05-03 11:15:44', '安徽省阜阳市颍东区', '1', '4.2.2.341203', '1', '4', '颍东区', '3', 'YDQ', null, '003034012003', null);
INSERT INTO `pa_bmzd` VALUES ('818C79B83C7A4B3E9EF1AB58DBBE19E3', '2015-05-03 11:15:44', '陕西省安康市汉阴县', '1', '4.2.2.610921', '1', '4', '汉阴县', '21', 'HYX', null, '003061009021', null);
INSERT INTO `pa_bmzd` VALUES ('819860AF0AF94A398730FAAF306EB93A', '2015-05-03 11:15:44', '内蒙古自治区通辽市扎鲁特旗', '1', '4.2.2.150526', '1', '4', '扎鲁特旗', '26', 'ZLTQ', null, '003015005026', null);
INSERT INTO `pa_bmzd` VALUES ('819B2BA617E64F7BBC5678FF68B1C029', '2015-05-03 11:15:44', '安徽省安庆市迎江区', '1', '4.2.2.340802', '1', '4', '迎江区', '2', 'YJQ', null, '003034008002', null);
INSERT INTO `pa_bmzd` VALUES ('81D421A1CB354D649CAAD2A7152BECB8', '2015-05-03 11:15:44', '河北省邯郸市丛台区', '1', '4.2.2.130403', '1', '4', '丛台区', '3', 'CTQ', null, '003013004003', null);
INSERT INTO `pa_bmzd` VALUES ('81F6B654AE434E44BE3C7DE151253A6A', '2015-05-03 11:15:44', '江西省上饶市横峰县', '1', '4.2.2.361125', '1', '4', '横峰县', '25', 'HFX', null, '003036011025', null);
INSERT INTO `pa_bmzd` VALUES ('82187C188B9A4BE8AFE587C8348FF60B', '2015-05-03 11:15:44', '河北省邯郸市涉县', '1', '4.2.2.130426', '1', '4', '涉县', '26', 'SX', null, '003013004026', null);
INSERT INTO `pa_bmzd` VALUES ('828614355D2B4E6CBF006FA5A314F739', '2015-05-03 11:15:44', '新疆维吾尔自治区博尔塔拉蒙古自治州博乐市', '1', '4.2.2.652701', '1', '4', '博乐市', '1', 'BYS', null, '003065027001', null);
INSERT INTO `pa_bmzd` VALUES ('828CFB428B664F8697845FB0570F646E', '2015-05-03 11:15:44', '重庆市市辖区涪陵区', '1', '4.2.2.500102', '1', '4', '涪陵区', '2', 'FLQ', null, '003050001002', null);
INSERT INTO `pa_bmzd` VALUES ('82B2044257144383A7980BF523070FDD', '2015-05-03 11:15:44', '山西省太原市杏花岭区', '1', '4.2.2.140107', '1', '4', '杏花岭区', '7', 'XHLQ', null, '003014001007', null);
INSERT INTO `pa_bmzd` VALUES ('82BFB5BEB9FE42CFAE91812E17F0A70A', '2015-05-03 11:15:44', '河北省张家口市蔚县', '1', '4.2.2.130726', '1', '4', '蔚县', '26', 'YX', null, '003013007026', null);
INSERT INTO `pa_bmzd` VALUES ('82D7FDD37F5341D1B9C6159F933B7D06', '2015-05-03 11:15:44', '西藏自治区日喀则地区谢通门县', '1', '4.2.2.542328', '1', '4', '谢通门县', '28', 'XTMX', null, '003054023028', null);
INSERT INTO `pa_bmzd` VALUES ('82F08A76CF444E61AA2E7EA1BCB972DB', '2015-05-03 11:15:44', '江苏省盐城市亭湖区', '1', '4.2.2.320902', '1', '4', '亭湖区', '2', 'THQ', null, '003032009002', null);
INSERT INTO `pa_bmzd` VALUES ('82F3A76B2F924CE5AFE006756F647C10', '2015-05-03 11:15:44', '辽宁省大连市', '1', '4.2.2.210200', '0', '3', '大连市', '2', 'DLS', null, '003021002', null);
INSERT INTO `pa_bmzd` VALUES ('8300E68DEE074D10B03258B17CE9AD0A', '2015-05-03 11:15:44', '广东省韶关市乐昌市', '1', '4.2.2.440281', '1', '4', '乐昌市', '81', 'YCS', null, '003044002081', null);
INSERT INTO `pa_bmzd` VALUES ('8303063B1BF54B76AC662868CF11A506', '2015-05-03 11:15:44', '山东省烟台市龙口市', '1', '4.2.2.370681', '1', '4', '龙口市', '81', 'LKS', null, '003037006081', null);
INSERT INTO `pa_bmzd` VALUES ('8306E6CCF8744328A3207288B7094013', '2015-05-03 11:15:44', '四川省绵阳市三台县', '1', '4.2.2.510722', '1', '4', '三台县', '22', 'STX', null, '003051007022', null);
INSERT INTO `pa_bmzd` VALUES ('83097B2C3C43482D9584E81D31676BA3', '2015-05-03 11:15:44', '湖北省宜昌市长阳土家族自治县', '1', '4.2.2.420528', '1', '4', '长阳土家族自治县', '28', 'ZYTJZZZX', null, '003042005028', null);
INSERT INTO `pa_bmzd` VALUES ('83178CD456644C0BAC169F8E5D4C0D29', '2015-05-03 11:15:44', '湖南省湘西土家族苗族自治州永顺县', '1', '4.2.2.433127', '1', '4', '永顺县', '27', 'YSX', null, '003043031027', null);
INSERT INTO `pa_bmzd` VALUES ('833FEBF34F89417080AF55B09758B7F8', '2015-05-03 11:15:44', '上海市市辖区松江区', '1', '4.2.2.310117', '1', '4', '松江区', '17', 'SJQ', null, '003031001017', null);
INSERT INTO `pa_bmzd` VALUES ('8347109E64EA439886F0C0A476E1E06C', '2015-05-03 11:15:44', '青海省果洛藏族自治州', '1', '4.2.2.632600', '0', '3', '果洛藏族自治州', '26', 'GLZZZZZ', null, '003063026', null);
INSERT INTO `pa_bmzd` VALUES ('8356E729F5A5470F8AEB757248A54E8E', '2015-05-03 11:15:44', '河北省承德市兴隆县', '1', '4.2.2.130822', '1', '4', '兴隆县', '22', 'XLX', null, '003013008022', null);
INSERT INTO `pa_bmzd` VALUES ('835E78677757410FB6330B5BC5678C1E', '2015-05-03 11:15:44', '安徽省黄山市休宁县', '1', '4.2.2.341022', '1', '4', '休宁县', '22', 'XNX', null, '003034010022', null);
INSERT INTO `pa_bmzd` VALUES ('8361E9649F48406BA58AD70E9D5E51BD', '2015-05-03 11:15:44', '江西省萍乡市市辖区', '1', '4.2.2.360301', '1', '4', '市辖区', '1', 'SXQ', null, '003036003001', null);
INSERT INTO `pa_bmzd` VALUES ('836353DB631A4DBB9F1793A5D9EAE8D0', '2015-05-03 11:15:44', '云南省楚雄彝族自治州南华县', '1', '4.2.2.532324', '1', '4', '南华县', '24', 'NHX', null, '003053023024', null);
INSERT INTO `pa_bmzd` VALUES ('836FAEB2B23347F4A3341393D9F7CC72', '2015-05-03 11:15:44', '辽宁省阜新市彰武县', '1', '4.2.2.210922', '1', '4', '彰武县', '22', 'ZWX', null, '003021009022', null);
INSERT INTO `pa_bmzd` VALUES ('83B4607D4D204109AEF33F200A64DF58', '2015-05-03 11:15:44', '贵州省黔南布依族苗族自治州瓮安县', '1', '4.2.2.522725', '1', '4', '瓮安县', '25', 'WAX', null, '003052027025', null);
INSERT INTO `pa_bmzd` VALUES ('83B8B492D0E64F61A62345049ACE4F21', '2015-05-03 11:15:44', '河南省商丘市柘城县', '1', '4.2.2.411424', '1', '4', '柘城县', '24', 'ZCX', null, '003041014024', null);
INSERT INTO `pa_bmzd` VALUES ('83BA383A30704B8B8DC61BD1E560677B', '2015-05-03 11:15:44', '内蒙古自治区巴彦淖尔市乌拉特后旗', '1', '4.2.2.150825', '1', '4', '乌拉特后旗', '25', 'WLTHQ', null, '003015008025', null);
INSERT INTO `pa_bmzd` VALUES ('83C2B850AEBE45EE8B0D1C48B705C85F', '2015-05-03 11:15:44', '重庆市市辖区南岸区', '1', '4.2.2.500108', '1', '4', '南岸区', '8', 'NAQ', null, '003050001008', null);
INSERT INTO `pa_bmzd` VALUES ('83C58056DB194F4ABC359158252A0D7C', '2015-05-03 11:15:44', '内蒙古自治区乌兰察布市化德县', '1', '4.2.2.150922', '1', '4', '化德县', '22', 'HDX', null, '003015009022', null);
INSERT INTO `pa_bmzd` VALUES ('83CE9B0097FF4973869CE23C2331D3AB', '2015-05-03 11:15:44', '山西省朔州市市辖区', '1', '4.2.2.140601', '1', '4', '市辖区', '1', 'SXQ', null, '003014006001', null);
INSERT INTO `pa_bmzd` VALUES ('8447285272D44C82B86DFB3E2700F708', '2015-05-03 11:15:44', '黑龙江省牡丹江市海林市', '1', '4.2.2.231083', '1', '4', '海林市', '83', 'HLS', null, '003023010083', null);
INSERT INTO `pa_bmzd` VALUES ('8460A30884C44BEFB623176E23898C3A', '2015-05-03 11:15:44', '贵州省黔南布依族苗族自治州罗甸县', '1', '4.2.2.522728', '1', '4', '罗甸县', '28', 'LDX', null, '003052027028', null);
INSERT INTO `pa_bmzd` VALUES ('8465EDB2E3174FF5A2632FEFAD5D78EE', '2015-05-03 11:15:44', '四川省广安市武胜县', '1', '4.2.2.511622', '1', '4', '武胜县', '22', 'WSX', null, '003051016022', null);
INSERT INTO `pa_bmzd` VALUES ('8471BCF57E944B0CA3EEEF34E6D6C257', '2015-05-03 11:15:44', '陕西省汉中市宁强县', '1', '4.2.2.610726', '1', '4', '宁强县', '26', 'NQX', null, '003061007026', null);
INSERT INTO `pa_bmzd` VALUES ('8475330278094E53BCD4140227AB9ADF', '2015-05-03 11:15:44', '陕西省西安市阎良区', '1', '4.2.2.610114', '1', '4', '阎良区', '14', 'YLQ', null, '003061001014', null);
INSERT INTO `pa_bmzd` VALUES ('8493C507C74846A4A40C7E88C3760FE3', '2015-05-03 11:15:44', '山东省菏泽市成武县', '1', '4.2.2.371723', '1', '4', '成武县', '23', 'CWX', null, '003037017023', null);
INSERT INTO `pa_bmzd` VALUES ('849E61F3BC6E42199AAA602D42B1845E', '2015-05-03 11:15:44', '河北省廊坊市香河县', '1', '4.2.2.131024', '1', '4', '香河县', '24', 'XHX', null, '003013010024', null);
INSERT INTO `pa_bmzd` VALUES ('84B4703F583D4459B0926E79A2265E09', '2015-05-03 11:15:44', '江苏省徐州市邳州市', '1', '4.2.2.320382', '1', '4', '邳州市', '82', 'PZS', null, '003032003082', null);
INSERT INTO `pa_bmzd` VALUES ('84D5099DE03747AD9768DB59B4D1DDE1', '2015-05-03 11:15:44', '四川省雅安市天全县', '1', '4.2.2.511825', '1', '4', '天全县', '25', 'TQX', null, '003051018025', null);
INSERT INTO `pa_bmzd` VALUES ('84DABB8E14494707B8E56C66DF9DD61F', '2015-05-03 11:15:44', '贵州省黔东南苗族侗族自治州天柱县', '1', '4.2.2.522627', '1', '4', '天柱县', '27', 'TZX', null, '003052026027', null);
INSERT INTO `pa_bmzd` VALUES ('84DEBF0A056C4DB69A3291F5BC292D60', '2015-05-03 11:15:44', '浙江省台州市三门县', '1', '4.2.2.331022', '1', '4', '三门县', '22', 'SMX', null, '003033010022', null);
INSERT INTO `pa_bmzd` VALUES ('84E30071AED14A689C2EDC4B9A9FDBE6', '2015-05-03 11:15:44', '江西省赣州市安远县', '1', '4.2.2.360726', '1', '4', '安远县', '26', 'AYX', null, '003036007026', null);
INSERT INTO `pa_bmzd` VALUES ('850D219088384F47A4C22C7AB6AE2B04', '2015-05-03 11:15:44', '江苏省南京市下关区', '1', '4.2.2.320107', '1', '4', '下关区', '7', 'XGQ', null, '003032001007', null);
INSERT INTO `pa_bmzd` VALUES ('85198C80C959432CB1EE045341395645', '2015-05-03 11:15:44', '江西省南昌市', '1', '4.2.2.360100', '0', '3', '南昌市', '1', 'NCS', null, '003036001', null);
INSERT INTO `pa_bmzd` VALUES ('853122A792EA48459C6FBCF72D5F6923', '2015-05-03 11:15:44', '浙江省绍兴市上虞市', '1', '4.2.2.330682', '1', '4', '上虞市', '82', 'SYS', null, '003033006082', null);
INSERT INTO `pa_bmzd` VALUES ('853D9C37B6484FD89213F4A4F4B247BD', '2015-05-03 11:15:44', '甘肃省兰州市安宁区', '1', '4.2.2.620105', '1', '4', '安宁区', '5', 'ANQ', null, '003062001005', null);
INSERT INTO `pa_bmzd` VALUES ('85693A605B1C4BC19DEE82107AA33567', '2015-05-03 11:15:44', '山东省济宁市鱼台县', '1', '4.2.2.370827', '1', '4', '鱼台县', '27', 'YTX', null, '003037008027', null);
INSERT INTO `pa_bmzd` VALUES ('856B93F32FE54467B203C1259CC7DE66', '2015-05-03 11:15:44', '江西省南昌市青云谱区', '1', '4.2.2.360104', '1', '4', '青云谱区', '4', 'QYPQ', null, '003036001004', null);
INSERT INTO `pa_bmzd` VALUES ('85938932FC7A402A879CEB54014F2B25', '2015-05-03 11:15:44', '内蒙古自治区鄂尔多斯市杭锦旗', '1', '4.2.2.150625', '1', '4', '杭锦旗', '25', 'HJQ', null, '003015006025', null);
INSERT INTO `pa_bmzd` VALUES ('859E4D4AB10C4222B2ABC5F7AB7E717C', '2015-05-03 11:15:44', '陕西省西安市临潼区', '1', '4.2.2.610115', '1', '4', '临潼区', '15', 'LTQ', null, '003061001015', null);
INSERT INTO `pa_bmzd` VALUES ('85A04BD24D444859A31899C3E75B38D7', '2015-05-03 11:15:44', '云南省昆明市嵩明县', '1', '4.2.2.530127', '1', '4', '嵩明县', '27', 'SMX', null, '003053001027', null);
INSERT INTO `pa_bmzd` VALUES ('85ADE2F89A3D480CB9D5B57C1392BB82', '2015-05-03 11:15:44', '江苏省泰州市', '1', '4.2.2.321200', '0', '3', '泰州市', '12', 'TZS', null, '003032012', null);
INSERT INTO `pa_bmzd` VALUES ('85E9E09264FD4234BC825ECAC1562437', '2015-05-03 11:15:44', '新疆维吾尔自治区阿克苏地区温宿县', '1', '4.2.2.652922', '1', '4', '温宿县', '22', 'WSX', null, '003065029022', null);
INSERT INTO `pa_bmzd` VALUES ('85EAB6A6B4894740B06B75471526C128', '2015-05-03 11:15:44', '河北省张家口市', '1', '4.2.2.130700', '0', '3', '张家口市', '7', 'ZJKS', null, '003013007', null);
INSERT INTO `pa_bmzd` VALUES ('85F9BE300A844B8086CB2CD7587B56BC', '2015-05-03 11:15:44', '江西省赣州市大余县', '1', '4.2.2.360723', '1', '4', '大余县', '23', 'DYX', null, '003036007023', null);
INSERT INTO `pa_bmzd` VALUES ('862EEACA725745F2822C87B3E3F697A2', '2015-05-03 11:15:44', '河南省南阳市市辖区', '1', '4.2.2.411301', '1', '4', '市辖区', '1', 'SXQ', null, '003041013001', null);
INSERT INTO `pa_bmzd` VALUES ('863166C000C245CFB001D04AE84BB4B9', '2015-05-03 11:15:44', '内蒙古自治区包头市石拐区', '1', '4.2.2.150205', '1', '4', '石拐区', '5', 'SGQ', null, '003015002005', null);
INSERT INTO `pa_bmzd` VALUES ('86316DCDE33F479CA08C5E5EAE916466', '2015-05-03 11:15:44', '河南省三门峡市市辖区', '1', '4.2.2.411201', '1', '4', '市辖区', '1', 'SXQ', null, '003041012001', null);
INSERT INTO `pa_bmzd` VALUES ('863897AF59D84AE9B84022850462F892', '2015-05-03 11:15:44', '辽宁省葫芦岛市南票区', '1', '4.2.2.211404', '1', '4', '南票区', '4', 'NPQ', null, '003021014004', null);
INSERT INTO `pa_bmzd` VALUES ('8642DE0BCD6A4D3ABDF2743994D86795', '2015-05-03 11:15:44', '安徽省淮南市凤台县', '1', '4.2.2.340421', '1', '4', '凤台县', '21', 'FTX', null, '003034004021', null);
INSERT INTO `pa_bmzd` VALUES ('864D43DD929A4CBC81B44D144C03D6E0', '2015-05-03 11:15:44', '新疆维吾尔自治区阿勒泰地区吉木乃县', '1', '4.2.2.654326', '1', '4', '吉木乃县', '26', 'JMNX', null, '003065043026', null);
INSERT INTO `pa_bmzd` VALUES ('8652F739DAEB4EEEB07DB18E76CA96C0', '2015-05-03 11:15:44', '湖北省宜昌市伍家岗区', '1', '4.2.2.420503', '1', '4', '伍家岗区', '3', 'WJGQ', null, '003042005003', null);
INSERT INTO `pa_bmzd` VALUES ('8678C31FE4B944D9919E8931CB5079CA', '2015-05-03 11:15:44', '广东省云浮市云城区', '1', '4.2.2.445302', '1', '4', '云城区', '2', 'YCQ', null, '003044053002', null);
INSERT INTO `pa_bmzd` VALUES ('86A76F86DF58492DB6D7C70F4D20B3F2', '2015-05-03 11:15:44', '河南省郑州市上街区', '1', '4.2.2.410106', '1', '4', '上街区', '6', 'SJQ', null, '003041001006', null);
INSERT INTO `pa_bmzd` VALUES ('86B711E4991A47BF96E7C2FAA597AABB', '2015-05-03 11:15:44', '湖北省襄阳市老河口市', '1', '4.2.2.420682', '1', '4', '老河口市', '82', 'LHKS', null, '003042006082', null);
INSERT INTO `pa_bmzd` VALUES ('86D01485BFDE442CAA0F632A473EDE9B', '2015-05-03 11:15:44', '浙江省宁波市象山县', '1', '4.2.2.330225', '1', '4', '象山县', '25', 'XSX', null, '003033002025', null);
INSERT INTO `pa_bmzd` VALUES ('86D5DD682F764438911487F2B6BD16DD', '2015-05-03 11:15:44', '黑龙江省佳木斯市东风区', '1', '4.2.2.230805', '1', '4', '东风区', '5', 'DFQ', null, '003023008005', null);
INSERT INTO `pa_bmzd` VALUES ('86F2972FECA64E06A737A6504B668922', '2015-05-03 11:15:44', '甘肃省白银市', '1', '4.2.2.620400', '0', '3', '白银市', '4', 'BYS', null, '003062004', null);
INSERT INTO `pa_bmzd` VALUES ('86F6E3E22E3B4324AADA0E88E1E7B6A2', '2015-05-03 11:15:44', '山西省忻州市市辖区', '1', '4.2.2.140901', '1', '4', '市辖区', '1', 'SXQ', null, '003014009001', null);
INSERT INTO `pa_bmzd` VALUES ('8703121FB6134E2F89F08013CB30D705', '2015-05-03 11:15:44', '江西省九江市武宁县', '1', '4.2.2.360423', '1', '4', '武宁县', '23', 'WNX', null, '003036004023', null);
INSERT INTO `pa_bmzd` VALUES ('871460B17E124FA8AC7DC157A5D9EE15', '2015-05-03 11:15:44', '云南省怒江傈僳族自治州贡山独龙族怒族自治县', '1', '4.2.2.533324', '1', '4', '贡山独龙族怒族自治县', '24', 'GSDLZNZZZX', null, '003053033024', null);
INSERT INTO `pa_bmzd` VALUES ('874D44A63E9C4004A13474871E4CB013', '2015-05-03 11:15:44', '陕西省安康市宁陕县', '1', '4.2.2.610923', '1', '4', '宁陕县', '23', 'NSX', null, '003061009023', null);
INSERT INTO `pa_bmzd` VALUES ('874D875E07FA45F39093324BA34F47A2', '2015-05-03 11:15:44', '河南省信阳市息县', '1', '4.2.2.411528', '1', '4', '息县', '28', 'XX', null, '003041015028', null);
INSERT INTO `pa_bmzd` VALUES ('8756969533724C69AA63EB7E5BF66A38', '2015-05-03 11:15:44', '重庆市市辖区长寿区', '1', '4.2.2.500115', '1', '4', '长寿区', '15', 'ZSQ', null, '003050001015', null);
INSERT INTO `pa_bmzd` VALUES ('875F0D767D384065829918E8A50FB8B0', '2015-05-03 11:15:44', '江苏省镇江市', '1', '4.2.2.321100', '0', '3', '镇江市', '11', 'ZJS', null, '003032011', null);
INSERT INTO `pa_bmzd` VALUES ('8773176184B94085BE4990F5A0E7C50B', '2015-05-03 11:15:44', '河南省新乡市延津县', '1', '4.2.2.410726', '1', '4', '延津县', '26', 'YJX', null, '003041007026', null);
INSERT INTO `pa_bmzd` VALUES ('8784A5A1DD6A4FC683D8B657C4220A94', '2015-05-03 11:15:44', '四川省广元市元坝区', '1', '4.2.2.510811', '1', '4', '元坝区', '11', 'YBQ', null, '003051008011', null);
INSERT INTO `pa_bmzd` VALUES ('879590FC31C245148BA90276BC291DA3', '2015-05-03 11:15:44', '广东省韶关市南雄市', '1', '4.2.2.440282', '1', '4', '南雄市', '82', 'NXS', null, '003044002082', null);
INSERT INTO `pa_bmzd` VALUES ('87C2D4CC6FC9463CB3F1AC4833E10AE1', '2015-05-03 11:15:44', '云南省临沧市沧源佤族自治县', '1', '4.2.2.530927', '1', '4', '沧源佤族自治县', '27', 'CYWZZZX', null, '003053009027', null);
INSERT INTO `pa_bmzd` VALUES ('87C334890EDD4330BA4C0E6E557B1AD3', '2015-05-03 11:15:44', '江西省九江市永修县', '1', '4.2.2.360425', '1', '4', '永修县', '25', 'YXX', null, '003036004025', null);
INSERT INTO `pa_bmzd` VALUES ('87F5737192B6459AB38B08C5581CB22E', '2015-05-03 11:15:44', '湖南省娄底市涟源市', '1', '4.2.2.431382', '1', '4', '涟源市', '82', 'LYS', null, '003043013082', null);
INSERT INTO `pa_bmzd` VALUES ('881404DBB3C0484785784B2DC9FF3CCF', '2015-05-03 11:15:44', '湖南省常德市汉寿县', '1', '4.2.2.430722', '1', '4', '汉寿县', '22', 'HSX', null, '003043007022', null);
INSERT INTO `pa_bmzd` VALUES ('8814E98BB92F4607BE0701A937EFF7AB', '2015-05-03 11:15:44', '天津市市辖区北辰区', '1', '4.2.2.120113', '1', '4', '北辰区', '13', 'BCQ', null, '003012001013', null);
INSERT INTO `pa_bmzd` VALUES ('881927AE651B41FFB6DA597D3545E7C7', '2015-05-03 11:15:44', '西藏自治区拉萨市城关区', '1', '4.2.2.540102', '1', '4', '城关区', '2', 'CGQ', null, '003054001002', null);
INSERT INTO `pa_bmzd` VALUES ('882A3A028CA149E796CF968863B47560', '2015-05-03 11:15:44', '黑龙江省鹤岗市工农区', '1', '4.2.2.230403', '1', '4', '工农区', '3', 'GNQ', null, '003023004003', null);
INSERT INTO `pa_bmzd` VALUES ('8830B605B6E84D23BC483CA05FD98A01', '2015-05-03 11:15:44', '四川省遂宁市射洪县', '1', '4.2.2.510922', '1', '4', '射洪县', '22', 'SHX', null, '003051009022', null);
INSERT INTO `pa_bmzd` VALUES ('8858ECDE96BF498CB310084174210155', '2015-05-03 11:15:44', '辽宁省沈阳市铁西区', '1', '4.2.2.210106', '1', '4', '铁西区', '6', 'TXQ', null, '003021001006', null);
INSERT INTO `pa_bmzd` VALUES ('887B4E4FF7024863850EBB28C32AB834', '2015-05-03 11:15:44', '广西壮族自治区河池市', '1', '4.2.2.451200', '0', '3', '河池市', '12', 'HCS', null, '003045012', null);
INSERT INTO `pa_bmzd` VALUES ('88CD251C0E22471D8B88B6B0AA34CF90', '2015-05-03 11:15:44', '云南省昆明市石林彝族自治县', '1', '4.2.2.530126', '1', '4', '石林彝族自治县', '26', 'SLYZZZX', null, '003053001026', null);
INSERT INTO `pa_bmzd` VALUES ('88DCFEC4818F4F59AA05722CF3AC5B24', '2015-05-03 11:15:44', '陕西省榆林市米脂县', '1', '4.2.2.610827', '1', '4', '米脂县', '27', 'MZX', null, '003061008027', null);
INSERT INTO `pa_bmzd` VALUES ('88E86389622B402E9595E70EA27A2A3F', '2015-05-03 11:15:44', '河南省信阳市平桥区', '1', '4.2.2.411503', '1', '4', '平桥区', '3', 'PQQ', null, '003041015003', null);
INSERT INTO `pa_bmzd` VALUES ('8915C557A6E04D1BBA13923624C9EEBF', '2015-05-03 11:15:44', '安徽省芜湖市鸠江区', '1', '4.2.2.340207', '1', '4', '鸠江区', '7', 'JJQ', null, '003034002007', null);
INSERT INTO `pa_bmzd` VALUES ('892128497ED44FB4B27E9072AF08BCF5', '2015-05-03 11:15:44', '四川省甘孜藏族自治州新龙县', '1', '4.2.2.513329', '1', '4', '新龙县', '29', 'XLX', null, '003051033029', null);
INSERT INTO `pa_bmzd` VALUES ('895ACF9758494822B79054169F850C57', '2015-05-03 11:15:44', '山东省青岛市胶州市', '1', '4.2.2.370281', '1', '4', '胶州市', '81', 'JZS', null, '003037002081', null);
INSERT INTO `pa_bmzd` VALUES ('895C706046F2425BBDF96301FD3C1B78', '2015-05-03 11:15:44', '湖北省', '1', '4.2.2.420000', '0', '2', '湖北省', '42', 'HBS', null, '003042', null);
INSERT INTO `pa_bmzd` VALUES ('89629817DDAB4FA897B75E72F315D788', '2015-05-03 11:15:44', '福建省漳州市诏安县', '1', '4.2.2.350624', '1', '4', '诏安县', '24', 'ZAX', null, '003035006024', null);
INSERT INTO `pa_bmzd` VALUES ('8976B9F9B84648C1B307CA286EC5E78C', '2015-05-03 11:15:44', '四川省成都市温江区', '1', '4.2.2.510115', '1', '4', '温江区', '15', 'WJQ', null, '003051001015', null);
INSERT INTO `pa_bmzd` VALUES ('8986083DB4C9431DBCE8BEE680932F26', '2015-05-03 11:15:44', '河南省洛阳市市辖区', '1', '4.2.2.410301', '1', '4', '市辖区', '1', 'SXQ', null, '003041003001', null);
INSERT INTO `pa_bmzd` VALUES ('89AC2361647D428E8C465E71CA425824', '2015-05-03 11:15:44', '湖南省怀化市靖州苗族侗族自治县', '1', '4.2.2.431229', '1', '4', '靖州苗族侗族自治县', '29', 'JZMZTZZZX', null, '003043012029', null);
INSERT INTO `pa_bmzd` VALUES ('89B8DE0919B342F1B24E7BC5350C06DF', '2015-05-03 11:15:44', '山东省济南市商河县', '1', '4.2.2.370126', '1', '4', '商河县', '26', 'SHX', null, '003037001026', null);
INSERT INTO `pa_bmzd` VALUES ('8A1099F0F4AB4B69895AEB84570134B8', '2015-05-03 11:15:44', '广西壮族自治区南宁市良庆区', '1', '4.2.2.450108', '1', '4', '良庆区', '8', 'LQQ', null, '003045001008', null);
INSERT INTO `pa_bmzd` VALUES ('8A2B4A9413E74EFA902FB23AB727ECEE', '2015-05-03 11:15:44', '陕西省渭南市华县', '1', '4.2.2.610521', '1', '4', '华县', '21', 'HX', null, '003061005021', null);
INSERT INTO `pa_bmzd` VALUES ('8A340E353FD9439FBF30D8D3D4B00461', '2015-05-03 11:15:44', '云南省丽江市华坪县', '1', '4.2.2.530723', '1', '4', '华坪县', '23', 'HPX', null, '003053007023', null);
INSERT INTO `pa_bmzd` VALUES ('8AB7BA18BC464E8C993E53451475B45F', '2015-05-03 11:15:44', '山西省长治市潞城市', '1', '4.2.2.140481', '1', '4', '潞城市', '81', 'LCS', null, '003014004081', null);
INSERT INTO `pa_bmzd` VALUES ('8AB89E4FFBA344C69321287CD599F33A', '2015-05-03 11:15:44', '辽宁省辽阳市弓长岭区', '1', '4.2.2.211005', '1', '4', '弓长岭区', '5', 'GZLQ', null, '003021010005', null);
INSERT INTO `pa_bmzd` VALUES ('8ACAD6ED2D4D4B839707D61632F80416', '2015-05-03 11:15:44', '河北省石家庄市长安区', '1', '4.2.2.130102', '1', '4', '长安区', '2', 'ZAQ', null, '003013001002', null);
INSERT INTO `pa_bmzd` VALUES ('8ACFEE7891084AB187A4597316F46BD8', '2015-05-03 11:15:44', '内蒙古自治区通辽市科尔沁左翼中旗', '1', '4.2.2.150521', '1', '4', '科尔沁左翼中旗', '21', 'KEQZYZQ', null, '003015005021', null);
INSERT INTO `pa_bmzd` VALUES ('8B08A0C9FDAE423B85B69B07D5700706', '2015-05-03 11:15:44', '山西省朔州市怀仁县', '1', '4.2.2.140624', '1', '4', '怀仁县', '24', 'HRX', null, '003014006024', null);
INSERT INTO `pa_bmzd` VALUES ('8B10010D7A1A48639B5FC265EAD8BEC7', '2015-05-03 11:15:44', '河南省洛阳市吉利区', '1', '4.2.2.410306', '1', '4', '吉利区', '6', 'JLQ', null, '003041003006', null);
INSERT INTO `pa_bmzd` VALUES ('8B3254556ACA4F5C878C240E5A36005C', '2015-05-03 11:15:44', '河北省承德市承德县', '1', '4.2.2.130821', '1', '4', '承德县', '21', 'CDX', null, '003013008021', null);
INSERT INTO `pa_bmzd` VALUES ('8B4C99E789AC4C72A414BBF440B2F9BB', '2015-05-03 11:15:44', '四川省乐山市峨眉山市', '1', '4.2.2.511181', '1', '4', '峨眉山市', '81', 'EMSS', null, '003051011081', null);
INSERT INTO `pa_bmzd` VALUES ('8B59E54E6C5A43A3A70265552C66B0AE', '2015-05-03 11:15:44', '云南省玉溪市华宁县', '1', '4.2.2.530424', '1', '4', '华宁县', '24', 'HNX', null, '003053004024', null);
INSERT INTO `pa_bmzd` VALUES ('8B5E00BFC6074CC3989630E0AEC9F277', '2015-05-03 11:15:44', '广西壮族自治区贺州市钟山县', '1', '4.2.2.451122', '1', '4', '钟山县', '22', 'ZSX', null, '003045011022', null);
INSERT INTO `pa_bmzd` VALUES ('8B68397EC7204A1D925762C0186AA825', '2015-05-03 11:15:44', '湖北省荆州市松滋市', '1', '4.2.2.421087', '1', '4', '松滋市', '87', 'SZS', null, '003042010087', null);
INSERT INTO `pa_bmzd` VALUES ('8B7636051BF24315943F87A8C9CC0487', '2015-05-03 11:15:44', '青海省果洛藏族自治州玛沁县', '1', '4.2.2.632621', '1', '4', '玛沁县', '21', 'MQX', null, '003063026021', null);
INSERT INTO `pa_bmzd` VALUES ('8B860A7587EF4784990B2B89CDB071F8', '2015-05-03 11:15:44', '内蒙古自治区乌海市海勃湾区', '1', '4.2.2.150302', '1', '4', '海勃湾区', '2', 'HBWQ', null, '003015003002', null);
INSERT INTO `pa_bmzd` VALUES ('8B9507577C2C42B18858057A41B7BB8D', '2015-05-03 11:15:44', '贵州省毕节市纳雍县', '1', '4.2.2.522426', '1', '4', '纳雍县', '25', 'NYX', null, '003052005025', null);
INSERT INTO `pa_bmzd` VALUES ('8BBD37AA03DF4451856120D68CCF7609', '2015-05-03 11:15:44', '西藏自治区林芝地区墨脱县', '1', '4.2.2.542624', '1', '4', '墨脱县', '24', 'MTX', null, '003054026024', null);
INSERT INTO `pa_bmzd` VALUES ('8BE9B0C1776347088623971F27A4208A', '2015-05-03 11:15:44', '黑龙江省哈尔滨市依兰县', '1', '4.2.2.230123', '1', '4', '依兰县', '23', 'YLX', null, '003023001023', null);
INSERT INTO `pa_bmzd` VALUES ('8C487B4538AC47E4AF13B9CD8BC15708', '2015-05-03 11:15:44', '宁夏回族自治区固原市隆德县', '1', '4.2.2.640423', '1', '4', '隆德县', '23', 'LDX', null, '003064004023', null);
INSERT INTO `pa_bmzd` VALUES ('8C5F6A1043154136A7A1DF7AB7D5984A', '2015-05-03 11:15:44', '河南省洛阳市宜阳县', '1', '4.2.2.410327', '1', '4', '宜阳县', '27', 'YYX', null, '003041003027', null);
INSERT INTO `pa_bmzd` VALUES ('8C65B3E7B7E2481BB36E858AAAAB4659', '2015-05-03 11:15:44', '辽宁省大连市甘井子区', '1', '4.2.2.210211', '1', '4', '甘井子区', '11', 'GJZQ', null, '003021002011', null);
INSERT INTO `pa_bmzd` VALUES ('8C76EDB8A34D459CB5460D9C72A0D438', '2015-05-03 11:15:44', '甘肃省白银市平川区', '1', '4.2.2.620403', '1', '4', '平川区', '3', 'PCQ', null, '003062004003', null);
INSERT INTO `pa_bmzd` VALUES ('8C7DC2D284434A0787412659E462861A', '2015-05-03 11:15:44', '重庆市市辖区巴南区', '1', '4.2.2.500113', '1', '4', '巴南区', '13', 'BNQ', null, '003050001013', null);
INSERT INTO `pa_bmzd` VALUES ('8C80FA73F8874C14B5DCBCFF5D863183', '2015-05-03 11:15:44', '吉林省松原市长岭县', '1', '4.2.2.220722', '1', '4', '长岭县', '22', 'ZLX', null, '003022007022', null);
INSERT INTO `pa_bmzd` VALUES ('8C9108B8EA054D19A693B8907267FF9F', '2015-05-03 11:15:44', '内蒙古自治区巴彦淖尔市五原县', '1', '4.2.2.150821', '1', '4', '五原县', '21', 'WYX', null, '003015008021', null);
INSERT INTO `pa_bmzd` VALUES ('8CA57772B9E04E6D896F9298FB1B9E6A', '2015-05-03 11:15:44', '吉林省吉林市蛟河市', '1', '4.2.2.220281', '1', '4', '蛟河市', '81', 'JHS', null, '003022002081', null);
INSERT INTO `pa_bmzd` VALUES ('8CAC8C15900B48789925304E3CD71958', '2015-05-03 11:15:44', '山西省太原市小店区', '1', '4.2.2.140105', '1', '4', '小店区', '5', 'XDQ', null, '003014001005', null);
INSERT INTO `pa_bmzd` VALUES ('8CCA33CFB50F4B268540FC63B3A09882', '2015-05-03 11:15:44', '福建省南平市邵武市', '1', '4.2.2.350781', '1', '4', '邵武市', '81', 'SWS', null, '003035007081', null);
INSERT INTO `pa_bmzd` VALUES ('8CD41939B3D64810971A00D7EE31ED8F', '2015-05-03 11:15:44', '四川省广安市华蓥市', '1', '4.2.2.511681', '1', '4', '华蓥市', '81', 'HYS', null, '003051016081', null);
INSERT INTO `pa_bmzd` VALUES ('8CF33A0D80234F608C2A458C5C58B3C1', '2015-05-03 11:15:44', '广东省清远市连州市', '1', '4.2.2.441882', '1', '4', '连州市', '82', 'LZS', null, '003044018082', null);
INSERT INTO `pa_bmzd` VALUES ('8CF42DA160894C879EACB9B335414C5F', '2015-05-03 11:15:44', '福建省福州市仓山区', '1', '4.2.2.350104', '1', '4', '仓山区', '4', 'CSQ', null, '003035001004', null);
INSERT INTO `pa_bmzd` VALUES ('8CF85E832F6C4069BA6DC9A03A59C462', '2015-05-03 11:15:44', '上海市市辖区普陀区', '1', '4.2.2.310107', '1', '4', '普陀区', '7', 'PTQ', null, '003031001007', null);
INSERT INTO `pa_bmzd` VALUES ('8D1E1E504F134218A8AB9F608EAA6208', '2015-05-03 11:15:44', '湖北省襄阳市襄城区', '1', '4.2.2.420602', '1', '4', '襄城区', '2', 'XCQ', null, '003042006002', null);
INSERT INTO `pa_bmzd` VALUES ('8D58EC5AAE824C84AAEAE4BA68179A82', '2015-05-03 11:15:44', '河北省邯郸市邯郸县', '1', '4.2.2.130421', '1', '4', '邯郸县', '21', 'HDX', null, '003013004021', null);
INSERT INTO `pa_bmzd` VALUES ('8D6E49C03AF44EF699C626967FD8AFA8', '2015-05-03 11:15:44', '福建省莆田市秀屿区', '1', '4.2.2.350305', '1', '4', '秀屿区', '5', 'XYQ', null, '003035003005', null);
INSERT INTO `pa_bmzd` VALUES ('8D795262A5984EAEBA7284C129B4C2AD', '2015-05-03 11:15:44', '山西省临汾市吉县', '1', '4.2.2.141028', '1', '4', '吉县', '28', 'JX', null, '003014010028', null);
INSERT INTO `pa_bmzd` VALUES ('8D7FAE7D28A74968AEDA945B0815C7B1', '2015-05-03 11:15:44', '吉林省松原市', '1', '4.2.2.220700', '0', '3', '松原市', '7', 'SYS', null, '003022007', null);
INSERT INTO `pa_bmzd` VALUES ('8DC71BD4AB30493292EAC9C4C3DD20FE', '2015-05-03 11:15:44', '河北省廊坊市安次区', '1', '4.2.2.131002', '1', '4', '安次区', '2', 'ACQ', null, '003013010002', null);
INSERT INTO `pa_bmzd` VALUES ('8DC881DDC961481AA0FD437835A57DD4', '2015-05-03 11:15:44', '江苏省南通市如皋市', '1', '4.2.2.320682', '1', '4', '如皋市', '82', 'RGS', null, '003032006082', null);
INSERT INTO `pa_bmzd` VALUES ('8DCFBA9DA884445CB358D8A69FFC5A10', '2015-05-03 11:15:44', '四川省自贡市富顺县', '1', '4.2.2.510322', '1', '4', '富顺县', '22', 'FSX', null, '003051003022', null);
INSERT INTO `pa_bmzd` VALUES ('8DD26379F209445FA6AEFF49A7DC9738', '2015-05-03 11:15:44', '安徽省宿州市灵璧县', '1', '4.2.2.341323', '1', '4', '灵璧县', '23', 'LBX', null, '003034013023', null);
INSERT INTO `pa_bmzd` VALUES ('8DF740B749914A9F9DB5BC74486B7E5B', '2015-05-03 11:15:44', '辽宁省营口市盖州市', '1', '4.2.2.210881', '1', '4', '盖州市', '81', 'GZS', null, '003021008081', null);
INSERT INTO `pa_bmzd` VALUES ('8E1E9E2CA9EB47E5973F63318563AB13', '2015-05-03 11:15:44', '福建省泉州市洛江区', '1', '4.2.2.350504', '1', '4', '洛江区', '4', 'LJQ', null, '003035005004', null);
INSERT INTO `pa_bmzd` VALUES ('8E20644AA9D243ABB8EC0FDA89420568', '2015-05-03 11:15:44', '四川省成都市彭州市', '1', '4.2.2.510182', '1', '4', '彭州市', '82', 'PZS', null, '003051001082', null);
INSERT INTO `pa_bmzd` VALUES ('8E24BEC0A0284E5CA7A46238EC60CECD', '2015-05-03 11:15:44', '江西省赣州市上犹县', '1', '4.2.2.360724', '1', '4', '上犹县', '24', 'SYX', null, '003036007024', null);
INSERT INTO `pa_bmzd` VALUES ('8E34F75A9F7E4B18B66B7918600DE1FE', '2015-05-03 11:15:44', '福建省厦门市集美区', '1', '4.2.2.350211', '1', '4', '集美区', '11', 'JMQ', null, '003035002011', null);
INSERT INTO `pa_bmzd` VALUES ('8E4076064E754D8895329CBDDBE22E75', '2015-05-03 11:15:44', '四川省达州市市辖区', '1', '4.2.2.511701', '1', '4', '市辖区', '1', 'SXQ', null, '003051017001', null);
INSERT INTO `pa_bmzd` VALUES ('8E72FC0D694243938524879942EB585E', '2015-05-03 11:15:44', '黑龙江省绥化市海伦市', '1', '4.2.2.231283', '1', '4', '海伦市', '83', 'HLS', null, '003023012083', null);
INSERT INTO `pa_bmzd` VALUES ('8E8EEB3FC54B444D8ABD9ECE5C6AE4EB', '2015-05-03 11:15:44', '安徽省六安市金安区', '1', '4.2.2.341502', '1', '4', '金安区', '2', 'JAQ', null, '003034015002', null);
INSERT INTO `pa_bmzd` VALUES ('8EA871A155BD401B8F27703BF78B7A08', '2015-05-03 11:15:44', '内蒙古自治区乌兰察布市市辖区', '1', '4.2.2.150901', '1', '4', '市辖区', '1', 'SXQ', null, '003015009001', null);
INSERT INTO `pa_bmzd` VALUES ('8EB8528CB1244B28B79192EDBCECFEDC', '2015-05-03 11:15:44', '辽宁省本溪市市辖区', '1', '4.2.2.210501', '1', '4', '市辖区', '1', 'SXQ', null, '003021005001', null);
INSERT INTO `pa_bmzd` VALUES ('8EBC80FE43894D46B098B02DD30EA6C7', '2015-05-03 11:15:44', '湖南省娄底市', '1', '4.2.2.431300', '0', '3', '娄底市', '13', 'LDS', null, '003043013', null);
INSERT INTO `pa_bmzd` VALUES ('8ECB6830FBBE43179D9AD63BF7FC6848', '2015-05-03 11:15:44', '山东省潍坊市临朐县', '1', '4.2.2.370724', '1', '4', '临朐县', '24', 'LQX', null, '003037007024', null);
INSERT INTO `pa_bmzd` VALUES ('8ED220DD879542C1A5A49FBE144F8EF7', '2015-05-03 11:15:44', '广东省深圳市福田区', '1', '4.2.2.440304', '1', '4', '福田区', '4', 'FTQ', null, '003044003004', null);
INSERT INTO `pa_bmzd` VALUES ('8ED546708E1C47C0B782E94F45289A2B', '2015-05-03 11:15:44', '新疆维吾尔自治区巴音郭楞蒙古自治州和硕县', '1', '4.2.2.652828', '1', '4', '和硕县', '28', 'HSX', null, '003065028028', null);
INSERT INTO `pa_bmzd` VALUES ('8EED7331E1BC42C28146AF10E4983C7A', '2015-05-03 11:15:44', '西藏自治区山南地区措美县', '1', '4.2.2.542227', '1', '4', '措美县', '27', 'CMX', null, '003054022027', null);
INSERT INTO `pa_bmzd` VALUES ('8EEDE4A7D1894EE7A541EC129426100B', '2015-05-03 11:15:44', '河北省沧州市黄骅市', '1', '4.2.2.130983', '1', '4', '黄骅市', '83', 'HHS', null, '003013009083', null);
INSERT INTO `pa_bmzd` VALUES ('8F003824D28B48B4B2494932EAE3DF8B', '2015-05-03 11:15:44', '广东省汕头市潮阳区', '1', '4.2.2.440513', '1', '4', '潮阳区', '13', 'CYQ', null, '003044005013', null);
INSERT INTO `pa_bmzd` VALUES ('8F0485EDC63442928170EB8D93F36E5C', '2015-05-03 11:15:44', '黑龙江省黑河市逊克县', '1', '4.2.2.231123', '1', '4', '逊克县', '23', 'XKX', null, '003023011023', null);
INSERT INTO `pa_bmzd` VALUES ('8F11A04B61AF40ADBE629D528C63B090', '2015-05-03 11:15:44', '青海省西宁市城东区', '1', '4.2.2.630102', '1', '4', '城东区', '2', 'CDQ', null, '003063001002', null);
INSERT INTO `pa_bmzd` VALUES ('8F12F0F9D85B41D1B770CCEC2FA08941', '2015-05-03 11:15:44', '黑龙江省绥化市望奎县', '1', '4.2.2.231221', '1', '4', '望奎县', '21', 'WKX', null, '003023012021', null);
INSERT INTO `pa_bmzd` VALUES ('8F2E96DD899741BC8F612AF40EBD1050', '2015-05-03 11:15:44', '新疆维吾尔自治区克拉玛依市独山子区', '1', '4.2.2.650202', '1', '4', '独山子区', '2', 'DSZQ', null, '003065002002', null);
INSERT INTO `pa_bmzd` VALUES ('8F2F0DBCB72E446BA3AA20E26EA45BB4', '2015-05-03 11:15:44', '云南省楚雄彝族自治州', '1', '4.2.2.532300', '0', '3', '楚雄彝族自治州', '23', 'CXYZZZZ', null, '003053023', null);
INSERT INTO `pa_bmzd` VALUES ('8F451DDA04E04542BD5032B0F9F39E79', '2015-05-03 11:15:44', '辽宁省朝阳市市辖区', '1', '4.2.2.211301', '1', '4', '市辖区', '1', 'SXQ', null, '003021013001', null);
INSERT INTO `pa_bmzd` VALUES ('8F5FB96FADD549C8904660D25A0DC72D', '2015-05-03 11:15:44', '安徽省宿州市泗县', '1', '4.2.2.341324', '1', '4', '泗县', '24', 'SX', null, '003034013024', null);
INSERT INTO `pa_bmzd` VALUES ('8F6983BBE99D452C8F4ACB596BB668E0', '2015-05-03 11:15:44', '广东省珠海市香洲区', '1', '4.2.2.440402', '1', '4', '香洲区', '2', 'XZQ', null, '003044004002', null);
INSERT INTO `pa_bmzd` VALUES ('8F7C36AAAE424FA8B5B12CDFAC1273E2', '2015-05-03 11:15:44', '福建省龙岩市市辖区', '1', '4.2.2.350801', '1', '4', '市辖区', '1', 'SXQ', null, '003035008001', null);
INSERT INTO `pa_bmzd` VALUES ('8FBF16D168344E4EBC536202A6F6BC0D', '2015-05-03 11:15:44', '河北省保定市曲阳县', '1', '4.2.2.130634', '1', '4', '曲阳县', '34', 'QYX', null, '003013006034', null);
INSERT INTO `pa_bmzd` VALUES ('8FCA6D8A76934A40B9D52545D0333FEF', '2015-05-03 11:15:44', '黑龙江省鹤岗市兴山区', '1', '4.2.2.230407', '1', '4', '兴山区', '7', 'XSQ', null, '003023004007', null);
INSERT INTO `pa_bmzd` VALUES ('8FCD5936AEBB4D4F9716065851990033', '2015-05-03 11:15:44', '河北省邢台市任县', '1', '4.2.2.130526', '1', '4', '任县', '26', 'RX', null, '003013005026', null);
INSERT INTO `pa_bmzd` VALUES ('8FE6FCB7FE91448E871DA9D52BED0231', '2015-05-03 11:15:44', '江西省九江市九江县', '1', '4.2.2.360421', '1', '4', '九江县', '21', 'JJX', null, '003036004021', null);
INSERT INTO `pa_bmzd` VALUES ('900905FC95524EA184D1C1040C748E6D', '2015-05-03 11:15:44', '福建省泉州市晋江市', '1', '4.2.2.350582', '1', '4', '晋江市', '82', 'JJS', null, '003035005082', null);
INSERT INTO `pa_bmzd` VALUES ('90182AC6AFE843C39FF64B3B33FD5E1C', '2015-05-03 11:15:44', '河南省信阳市市辖区', '1', '4.2.2.411501', '1', '4', '市辖区', '1', 'SXQ', null, '003041015001', null);
INSERT INTO `pa_bmzd` VALUES ('901D33C47BD84ECBBE89F3B7247DB0BB', '2015-05-03 11:15:44', '贵州省铜仁市', '1', '4.2.2.522200', '0', '3', '铜仁市', '6', 'TRS', null, '003052006', null);
INSERT INTO `pa_bmzd` VALUES ('9033FA7E71174D389ACFD684B9B5BB68', '2015-05-03 11:15:44', '云南省', '1', '4.2.2.530000', '0', '2', '云南省', '53', 'YNS', null, '003053', null);
INSERT INTO `pa_bmzd` VALUES ('904C7C3D4E6A4B8D9494FED9CA82618C', '2015-05-03 11:15:44', '河北省保定市涞水县', '1', '4.2.2.130623', '1', '4', '涞水县', '23', 'LSX', null, '003013006023', null);
INSERT INTO `pa_bmzd` VALUES ('9053350FB42C49F7854047C249ADBA84', '2015-05-03 11:15:44', '青海省海南藏族自治州兴海县', '1', '4.2.2.632524', '1', '4', '兴海县', '24', 'XHX', null, '003063025024', null);
INSERT INTO `pa_bmzd` VALUES ('908FCDB6E4624E65A2CF64F625136070', '2015-05-03 11:15:44', '山西省长治市城区', '1', '4.2.2.140402', '1', '4', '城区', '2', 'CQ', null, '003014004002', null);
INSERT INTO `pa_bmzd` VALUES ('909F4A684080402AA70B1879C8D016B1', '2015-05-03 11:15:44', '湖南省怀化市洪江市', '1', '4.2.2.431281', '1', '4', '洪江市', '81', 'HJS', null, '003043012081', null);
INSERT INTO `pa_bmzd` VALUES ('90B46A7BFF1F49F78AF13C0163AC3AC0', '2015-05-03 11:15:44', '河南省焦作市孟州市', '1', '4.2.2.410883', '1', '4', '孟州市', '83', 'MZS', null, '003041008083', null);
INSERT INTO `pa_bmzd` VALUES ('911A51A548EC427A8FF3FFA1C545FF2C', '2015-05-03 11:15:44', '江苏省连云港市灌南县', '1', '4.2.2.320724', '1', '4', '灌南县', '24', 'GNX', null, '003032007024', null);
INSERT INTO `pa_bmzd` VALUES ('9124E283572544B492FD4F7ED2441BD0', '2015-05-03 11:15:44', '黑龙江省鹤岗市绥滨县', '1', '4.2.2.230422', '1', '4', '绥滨县', '22', 'SBX', null, '003023004022', null);
INSERT INTO `pa_bmzd` VALUES ('91251DD863EB4ED0AF4CA5155D6CA6C1', '2015-05-03 11:15:44', '黑龙江省鹤岗市南山区', '1', '4.2.2.230404', '1', '4', '南山区', '4', 'NSQ', null, '003023004004', null);
INSERT INTO `pa_bmzd` VALUES ('9128FFED8CBF43ECAF0D49D7A2FB94AE', '2015-05-03 11:15:44', '湖北省荆门市市辖区', '1', '4.2.2.420801', '1', '4', '市辖区', '1', 'SXQ', null, '003042008001', null);
INSERT INTO `pa_bmzd` VALUES ('914C7F11992B4DBB82C19E7101042BD0', '2015-05-03 11:15:44', '河南省许昌市鄢陵县', '1', '4.2.2.411024', '1', '4', '鄢陵县', '24', 'YLX', null, '003041010024', null);
INSERT INTO `pa_bmzd` VALUES ('9173B8666F31476FB47591E09A76DB7E', '2015-05-03 11:15:44', '山东省泰安市宁阳县', '1', '4.2.2.370921', '1', '4', '宁阳县', '21', 'NYX', null, '003037009021', null);
INSERT INTO `pa_bmzd` VALUES ('918FE387B0934120B1B7F649A2347989', '2015-05-03 11:15:44', '内蒙古自治区兴安盟科尔沁右翼前旗', '1', '4.2.2.152221', '1', '4', '科尔沁右翼前旗', '21', 'KEQYYQQ', null, '003015022021', null);
INSERT INTO `pa_bmzd` VALUES ('9196F12752A2460E89C046B8869ED3CA', '2015-05-03 11:15:44', '山西省长治市沁源县', '1', '4.2.2.140431', '1', '4', '沁源县', '31', 'QYX', null, '003014004031', null);
INSERT INTO `pa_bmzd` VALUES ('91AE60D3E830461FBB0852993A994FE3', '2015-05-03 11:15:44', '河南省驻马店市正阳县', '1', '4.2.2.411724', '1', '4', '正阳县', '24', 'ZYX', null, '003041017024', null);
INSERT INTO `pa_bmzd` VALUES ('91C58D1A80764578872063FAB9835874', '2015-05-03 11:15:44', '甘肃省酒泉市敦煌市', '1', '4.2.2.620982', '1', '4', '敦煌市', '82', 'DHS', null, '003062009082', null);
INSERT INTO `pa_bmzd` VALUES ('91D4CC9BE6E0450FA7CCACFACDF94C1B', '2015-05-03 11:15:44', '湖南省湘西土家族苗族自治州凤凰县', '1', '4.2.2.433123', '1', '4', '凤凰县', '23', 'FHX', null, '003043031023', null);
INSERT INTO `pa_bmzd` VALUES ('91E089C34FFE485081FD34F7C8A3D82D', '2015-05-03 11:15:44', '陕西省商洛市洛南县', '1', '4.2.2.611021', '1', '4', '洛南县', '21', 'LNX', null, '003061010021', null);
INSERT INTO `pa_bmzd` VALUES ('91E325A6B7D6437E96DE2672F073C139', '2015-05-03 11:15:44', '内蒙古自治区呼伦贝尔市牙克石市', '1', '4.2.2.150782', '1', '4', '牙克石市', '82', 'YKSS', null, '003015007082', null);
INSERT INTO `pa_bmzd` VALUES ('91FCAF5A522E47FEA87368CEB97D06C8', '2015-05-03 11:15:44', '湖南省衡阳市衡阳县', '1', '4.2.2.430421', '1', '4', '衡阳县', '21', 'HYX', null, '003043004021', null);
INSERT INTO `pa_bmzd` VALUES ('92132E59944C4560B8481F7515A97FE5', '2015-05-03 11:15:44', '福建省龙岩市', '1', '4.2.2.350800', '0', '3', '龙岩市', '8', 'LYS', null, '003035008', null);
INSERT INTO `pa_bmzd` VALUES ('923E1833CE7049FA90AC16F59B6F3A4D', '2015-05-03 11:15:44', '天津市市辖区南开区', '1', '4.2.2.120104', '1', '4', '南开区', '4', 'NKQ', null, '003012001004', null);
INSERT INTO `pa_bmzd` VALUES ('9268E7CBAC5D47CA8431F5E4C6809806', '2015-05-03 11:15:44', '内蒙古自治区通辽市开鲁县', '1', '4.2.2.150523', '1', '4', '开鲁县', '23', 'KLX', null, '003015005023', null);
INSERT INTO `pa_bmzd` VALUES ('92AAE04F4E8C4FB1AE77F3A02E3B09A6', '2015-05-03 11:15:44', '新疆维吾尔自治区和田地区和田市', '1', '4.2.2.653201', '1', '4', '和田市', '1', 'HTS', null, '003065032001', null);
INSERT INTO `pa_bmzd` VALUES ('92C1388DEB314A35A8CF8C54CFF02491', '2015-05-03 11:15:44', '内蒙古自治区锡林郭勒盟锡林浩特市', '1', '4.2.2.152502', '1', '4', '锡林浩特市', '2', 'XLHTS', null, '003015025002', null);
INSERT INTO `pa_bmzd` VALUES ('92E883AB039542C6804AB1931F1BB0BD', '2015-05-03 11:15:44', '湖北省恩施土家族苗族自治州宣恩县', '1', '4.2.2.422825', '1', '4', '宣恩县', '25', 'XEX', null, '003042028025', null);
INSERT INTO `pa_bmzd` VALUES ('92F542F37D3E40BBBE9B7E20AD26FDF7', '2015-05-03 11:15:44', '西藏自治区林芝地区', '1', '4.2.2.542600', '0', '3', '林芝地区', '26', 'LZDQ', null, '003054026', null);
INSERT INTO `pa_bmzd` VALUES ('9300434F91ED41A28C6FDF7514014331', '2015-05-03 11:15:44', '四川省资阳市安岳县', '1', '4.2.2.512021', '1', '4', '安岳县', '21', 'AYX', null, '003051020021', null);
INSERT INTO `pa_bmzd` VALUES ('9314D9756D394E288814628F0D77D177', '2015-05-03 11:15:44', '西藏自治区日喀则地区定日县', '1', '4.2.2.542324', '1', '4', '定日县', '24', 'DRX', null, '003054023024', null);
INSERT INTO `pa_bmzd` VALUES ('931CB6CAD0FB4549BB67D4A0B99CDED8', '2015-05-03 11:15:44', '黑龙江省齐齐哈尔市', '1', '4.2.2.230200', '0', '3', '齐齐哈尔市', '2', 'QQHES', null, '003023002', null);
INSERT INTO `pa_bmzd` VALUES ('933D5DCC853140D9B06E5F4ECEDC3B3D', '2015-05-03 11:15:44', '广西壮族自治区崇左市凭祥市', '1', '4.2.2.451481', '1', '4', '凭祥市', '81', 'PXS', null, '003045014081', null);
INSERT INTO `pa_bmzd` VALUES ('93414F3606D14476BC62F25B74A827A4', '2015-05-03 11:15:44', '黑龙江省七台河市茄子河区', '1', '4.2.2.230904', '1', '4', '茄子河区', '4', 'QZHQ', null, '003023009004', null);
INSERT INTO `pa_bmzd` VALUES ('934A91C2F5334AE390A77A06898B9052', '2015-05-03 11:15:44', '广东省珠海市斗门区', '1', '4.2.2.440403', '1', '4', '斗门区', '3', 'DMQ', null, '003044004003', null);
INSERT INTO `pa_bmzd` VALUES ('935F4C72401846CD847E0FBB3B2262A4', '2015-05-03 11:15:44', '江西省赣州市章贡区', '1', '4.2.2.360702', '1', '4', '章贡区', '2', 'ZGQ', null, '003036007002', null);
INSERT INTO `pa_bmzd` VALUES ('935F5E4DB31B44738891AE03D682E6BC', '2015-05-03 11:15:44', '浙江省绍兴市新昌县', '1', '4.2.2.330624', '1', '4', '新昌县', '24', 'XCX', null, '003033006024', null);
INSERT INTO `pa_bmzd` VALUES ('93631C5B83D540F9A27EC07530975317', '2015-05-03 11:15:44', '甘肃省天水市秦安县', '1', '4.2.2.620522', '1', '4', '秦安县', '22', 'QAX', null, '003062005022', null);
INSERT INTO `pa_bmzd` VALUES ('936985D04F47465DB7290B5D3A71DCD2', '2015-05-03 11:15:44', '江苏省南通市海门市', '1', '4.2.2.320684', '1', '4', '海门市', '84', 'HMS', null, '003032006084', null);
INSERT INTO `pa_bmzd` VALUES ('937A71B78BA64DC2AB86B77E58A27918', '2015-05-03 11:15:44', '陕西省西安市灞桥区', '1', '4.2.2.610111', '1', '4', '灞桥区', '11', 'BQQ', null, '003061001011', null);
INSERT INTO `pa_bmzd` VALUES ('93B2059CF233471FAABFA338E7342EAB', '2015-05-03 11:15:44', '河北省承德市围场满族蒙古族自治县', '1', '4.2.2.130828', '1', '4', '围场满族蒙古族自治县', '28', 'WCMZMGZZZX', null, '003013008028', null);
INSERT INTO `pa_bmzd` VALUES ('93C48CF3B02747B4B88D507566778C70', '2015-05-03 11:15:44', '黑龙江省鹤岗市向阳区', '1', '4.2.2.230402', '1', '4', '向阳区', '2', 'XYQ', null, '003023004002', null);
INSERT INTO `pa_bmzd` VALUES ('93DC5A94047144FD96C9FFA555FF3B13', '2015-05-03 11:15:44', '贵州省遵义市湄潭县', '1', '4.2.2.520328', '1', '4', '湄潭县', '28', 'MTX', null, '003052003028', null);
INSERT INTO `pa_bmzd` VALUES ('93FE26ABD679491CBE61F1E712A67D58', '2015-05-03 11:15:44', '湖南省株洲市株洲县', '1', '4.2.2.430221', '1', '4', '株洲县', '21', 'ZZX', null, '003043002021', null);
INSERT INTO `pa_bmzd` VALUES ('940A4AC665CD4BE3B1526DF8283D585A', '2015-05-03 11:15:44', '广西壮族自治区桂林市象山区', '1', '4.2.2.450304', '1', '4', '象山区', '4', 'XSQ', null, '003045003004', null);
INSERT INTO `pa_bmzd` VALUES ('9439716A9D4B47A7B84C07D1B00F419D', '2015-05-03 11:15:44', '内蒙古自治区通辽市', '1', '4.2.2.150500', '0', '3', '通辽市', '5', 'TLS', null, '003015005', null);
INSERT INTO `pa_bmzd` VALUES ('944DF132474D48B89402136A6F2ED123', '2015-05-03 11:15:44', '新疆维吾尔自治区乌鲁木齐市沙依巴克区', '1', '4.2.2.650103', '1', '4', '沙依巴克区', '3', 'SYBKQ', null, '003065001003', null);
INSERT INTO `pa_bmzd` VALUES ('947F6B7DE86A439BA5F2313313270E94', '2015-05-03 11:15:44', '四川省雅安市芦山县', '1', '4.2.2.511826', '1', '4', '芦山县', '26', 'LSX', null, '003051018026', null);
INSERT INTO `pa_bmzd` VALUES ('948CFFE8D6F64DEB9F30969E45C28FC0', '2015-05-03 11:15:44', '四川省南充市营山县', '1', '4.2.2.511322', '1', '4', '营山县', '22', 'YSX', null, '003051013022', null);
INSERT INTO `pa_bmzd` VALUES ('9491769AA8554A77885F2E457BB639BF', '2015-05-03 11:15:44', '四川省遂宁市大英县', '1', '4.2.2.510923', '1', '4', '大英县', '23', 'DYX', null, '003051009023', null);
INSERT INTO `pa_bmzd` VALUES ('949C1050767E41C8A472A9E31710F3F7', '2015-05-03 11:15:44', '青海省海西蒙古族藏族自治州天峻县', '1', '4.2.2.632823', '1', '4', '天峻县', '23', 'TJX', null, '003063028023', null);
INSERT INTO `pa_bmzd` VALUES ('94AD11E62C844487BF33F7B309294445', '2015-05-03 11:15:44', '云南省昭通市昭阳区', '1', '4.2.2.530602', '1', '4', '昭阳区', '2', 'ZYQ', null, '003053006002', null);
INSERT INTO `pa_bmzd` VALUES ('94AF19D6A0F44947854CF134849628C7', '2015-05-03 11:15:44', '广西壮族自治区梧州市万秀区', '1', '4.2.2.450403', '1', '4', '万秀区', '3', 'WXQ', null, '003045004003', null);
INSERT INTO `pa_bmzd` VALUES ('94AF2A3C5A7548AD9AB5C35D9C02BE2C', '2015-05-03 11:15:44', '山西省吕梁市岚县', '1', '4.2.2.141127', '1', '4', '岚县', '27', 'LX', null, '003014011027', null);
INSERT INTO `pa_bmzd` VALUES ('94C3980267AB457C9AC5F2E8002C43E8', '2015-05-03 11:15:44', '新疆维吾尔自治区昌吉回族自治州阜康市', '1', '4.2.2.652302', '1', '4', '阜康市', '2', 'FKS', null, '003065023002', null);
INSERT INTO `pa_bmzd` VALUES ('94CAB243CB80429FAEA7B853C738CE3D', '2015-05-03 11:15:44', '陕西省榆林市神木县', '1', '4.2.2.610821', '1', '4', '神木县', '21', 'SMX', null, '003061008021', null);
INSERT INTO `pa_bmzd` VALUES ('94CB6953277E4982BB21C3D0EC26C5B5', '2015-05-03 11:15:44', '安徽省安庆市望江县', '1', '4.2.2.340827', '1', '4', '望江县', '27', 'WJX', null, '003034008027', null);
INSERT INTO `pa_bmzd` VALUES ('94DD1CEA5ED042FB8FCCD902B66E3F5A', '2015-05-03 11:15:44', '福建省泉州市', '1', '4.2.2.350500', '0', '3', '泉州市', '5', 'QZS', null, '003035005', null);
INSERT INTO `pa_bmzd` VALUES ('9517B439BAE34C6FAFAF585414DBE103', '2015-05-03 11:15:44', '安徽省宣城市市辖区', '1', '4.2.2.341801', '1', '4', '市辖区', '1', 'SXQ', null, '003034018001', null);
INSERT INTO `pa_bmzd` VALUES ('95190760C3964DA3854A2F59EBEBC145', '2015-05-03 11:15:44', '山西省长治市沁县', '1', '4.2.2.140430', '1', '4', '沁县', '30', 'QX', null, '003014004030', null);
INSERT INTO `pa_bmzd` VALUES ('951999D5B9B345B883A89875F77E3CC4', '2015-05-03 11:15:44', '四川省凉山彝族自治州甘洛县', '1', '4.2.2.513435', '1', '4', '甘洛县', '35', 'GLX', null, '003051034035', null);
INSERT INTO `pa_bmzd` VALUES ('9519C954E22D4F5497079D9B45FD5B95', '2015-05-03 11:15:44', '辽宁省大连市市辖区', '1', '4.2.2.210201', '1', '4', '市辖区', '1', 'SXQ', null, '003021002001', null);
INSERT INTO `pa_bmzd` VALUES ('9520E76D416E4F1590530E656107B457', '2015-05-03 11:15:44', '河南省洛阳市', '1', '4.2.2.410300', '0', '3', '洛阳市', '3', 'LYS', null, '003041003', null);
INSERT INTO `pa_bmzd` VALUES ('9525CCB0E11F404892E41CFC677C1A0A', '2015-05-03 11:15:44', '四川省凉山彝族自治州盐源县', '1', '4.2.2.513423', '1', '4', '盐源县', '23', 'YYX', null, '003051034023', null);
INSERT INTO `pa_bmzd` VALUES ('95380CD4AE11478094018F083E5934DF', '2015-05-03 11:15:44', '河南省商丘市市辖区', '1', '4.2.2.411401', '1', '4', '市辖区', '1', 'SXQ', null, '003041014001', null);
INSERT INTO `pa_bmzd` VALUES ('953B5EAB78044469B3C3504B139F79C3', '2015-05-03 11:15:44', '河南省信阳市光山县', '1', '4.2.2.411522', '1', '4', '光山县', '22', 'GSX', null, '003041015022', null);
INSERT INTO `pa_bmzd` VALUES ('9552429012AD44C9A534DBF6AE58CECE', '2015-05-03 11:15:44', '黑龙江省鸡西市', '1', '4.2.2.230300', '0', '3', '鸡西市', '3', 'JXS', null, '003023003', null);
INSERT INTO `pa_bmzd` VALUES ('E2CEE1CE3A1744229AF3067C421AD4C0', '2015-05-03 11:15:44', '湖南省娄底市市辖区', '1', '4.2.2.431301', '1', '4', '市辖区', '1', 'SXQ', null, '003043013001', null);
INSERT INTO `pa_bmzd` VALUES ('E2CFA3E0AB7E41DEB281ACF23E619B06', '2015-05-03 11:15:44', '湖南省长沙市', '1', '4.2.2.430100', '0', '3', '长沙市', '1', 'ZSS', null, '003043001', null);
INSERT INTO `pa_bmzd` VALUES ('E2E1FF6B6C17479E85444B63F24A6A97', '2015-05-03 11:15:44', '黑龙江省伊春市伊春区', '1', '4.2.2.230702', '1', '4', '伊春区', '2', 'YCQ', null, '003023007002', null);
INSERT INTO `pa_bmzd` VALUES ('E324C930E8A748E89E327597F5BE33C2', '2015-05-03 11:15:44', '广东省揭阳市市辖区', '1', '4.2.2.445201', '1', '4', '市辖区', '1', 'SXQ', null, '003044052001', null);
INSERT INTO `pa_bmzd` VALUES ('E3319E46881C431BA60A8F039B8C3C82', '2015-05-03 11:15:44', '新疆维吾尔自治区昌吉回族自治州吉木萨尔县', '1', '4.2.2.652327', '1', '4', '吉木萨尔县', '27', 'JMSEX', null, '003065023027', null);
INSERT INTO `pa_bmzd` VALUES ('E339D4A3315F4E168C6DA2A5EBB3B245', '2015-05-03 11:15:44', '广西壮族自治区柳州市柳城县', '1', '4.2.2.450222', '1', '4', '柳城县', '22', 'LCX', null, '003045002022', null);
INSERT INTO `pa_bmzd` VALUES ('E35994C66BE04CBC941AE551ABD4DABA', '2015-05-03 11:15:44', '湖南省株洲市芦淞区', '1', '4.2.2.430203', '1', '4', '芦淞区', '3', 'LSQ', null, '003043002003', null);
INSERT INTO `pa_bmzd` VALUES ('E37986B649DD458BBCCB1D9F7800D3E8', '2015-05-03 11:15:44', '甘肃省嘉峪关市市辖区', '1', '4.2.2.620201', '1', '4', '市辖区', '1', 'SXQ', null, '003062002001', null);
INSERT INTO `pa_bmzd` VALUES ('E37FF42812DB43DC9F3208D5DDC4A339', '2015-05-03 11:15:44', '重庆市市辖区', '1', '4.2.2.500100', '0', '3', '市辖区', '1', 'SXQ', null, '003050001', null);
INSERT INTO `pa_bmzd` VALUES ('E3BF6DC233A74EF0B0E40EB500A0F0FD', '2015-05-03 11:15:44', '江苏省淮安市洪泽县', '1', '4.2.2.320829', '1', '4', '洪泽县', '29', 'HZX', null, '003032008029', null);
INSERT INTO `pa_bmzd` VALUES ('E3E1F38D700B452C8D58F44C9E7A8D7D', '2015-05-03 11:15:44', '河南省南阳市桐柏县', '1', '4.2.2.411330', '1', '4', '桐柏县', '30', 'TBX', null, '003041013030', null);
INSERT INTO `pa_bmzd` VALUES ('E3E4947DE1D3485E9CB414A1312A9B30', '2015-05-03 11:15:44', '湖南省常德市桃源县', '1', '4.2.2.430725', '1', '4', '桃源县', '25', 'TYX', null, '003043007025', null);
INSERT INTO `pa_bmzd` VALUES ('E3E6AEAB671E497FAA860429F3377166', '2015-05-03 11:15:44', '四川省成都市双流县', '1', '4.2.2.510122', '1', '4', '双流县', '22', 'SLX', null, '003051001022', null);
INSERT INTO `pa_bmzd` VALUES ('E406256DA27640BE9EE6B575193DA5AD', '2015-05-03 11:15:44', '宁夏回族自治区固原市西吉县', '1', '4.2.2.640422', '1', '4', '西吉县', '22', 'XJX', null, '003064004022', null);
INSERT INTO `pa_bmzd` VALUES ('E41C3143C4D3415DA255C46CE00A7F09', '2015-05-03 11:15:44', '湖南省衡阳市雁峰区', '1', '4.2.2.430406', '1', '4', '雁峰区', '6', 'YFQ', null, '003043004006', null);
INSERT INTO `pa_bmzd` VALUES ('E41E9B4B4E444E77B7C44BDF65633062', '2015-05-03 11:15:44', '河北省唐山市玉田县', '1', '4.2.2.130229', '1', '4', '玉田县', '29', 'YTX', null, '003013002029', null);
INSERT INTO `pa_bmzd` VALUES ('E421657BFDAD4DEEB89C67187B2AEBEA', '2015-05-03 11:15:44', '安徽省六安市霍邱县', '1', '4.2.2.341522', '1', '4', '霍邱县', '22', 'HQX', null, '003034015022', null);
INSERT INTO `pa_bmzd` VALUES ('E42CF054B84A44F696AE0164DE2C8D9D', '2015-05-03 11:15:44', '陕西省延安市宜川县', '1', '4.2.2.610630', '1', '4', '宜川县', '30', 'YCX', null, '003061006030', null);
INSERT INTO `pa_bmzd` VALUES ('E4343F1FB6A34987AF735BFEB2A86243', '2015-05-03 11:15:44', '黑龙江省双鸭山市饶河县', '1', '4.2.2.230524', '1', '4', '饶河县', '24', 'RHX', null, '003023005024', null);
INSERT INTO `pa_bmzd` VALUES ('E43AE65ECD944E46BEE0079A2942953C', '2015-05-03 11:15:44', '河北省邢台市临西县', '1', '4.2.2.130535', '1', '4', '临西县', '35', 'LXX', null, '003013005035', null);
INSERT INTO `pa_bmzd` VALUES ('E44CEB1E45844923BDF34ADEBEDB9B08', '2015-05-03 11:15:44', '河南省郑州市荥阳市', '1', '4.2.2.410182', '1', '4', '荥阳市', '82', 'YYS', null, '003041001082', null);
INSERT INTO `pa_bmzd` VALUES ('E455FB9773754215964FB05E58E39599', '2015-05-03 11:15:44', '西藏自治区那曲地区聂荣县', '1', '4.2.2.542424', '1', '4', '聂荣县', '24', 'NRX', null, '003054024024', null);
INSERT INTO `pa_bmzd` VALUES ('E45D62AF0A844915BDA72362511E42C6', '2015-05-03 11:15:44', '四川省南充市市辖区', '1', '4.2.2.511301', '1', '4', '市辖区', '1', 'SXQ', null, '003051013001', null);
INSERT INTO `pa_bmzd` VALUES ('E46D35FBA3B14DC6AA00504CF6C01203', '2015-05-03 11:15:44', '辽宁省盘锦市市辖区', '1', '4.2.2.211101', '1', '4', '市辖区', '1', 'SXQ', null, '003021011001', null);
INSERT INTO `pa_bmzd` VALUES ('E47252C28CD843BDA5393F7247FF69D0', '2015-05-03 11:15:44', '湖南省娄底市娄星区', '1', '4.2.2.431302', '1', '4', '娄星区', '2', 'LXQ', null, '003043013002', null);
INSERT INTO `pa_bmzd` VALUES ('E4813558F4BE4326952E0B3D1F243F0E', '2015-05-03 11:15:44', '广东省广州市黄埔区', '1', '4.2.2.440112', '1', '4', '黄埔区', '12', 'HPQ', null, '003044001012', null);
INSERT INTO `pa_bmzd` VALUES ('E4AD54F0F000428185620E4837EFEBEB', '2015-05-03 11:15:44', '甘肃省平凉市静宁县', '1', '4.2.2.620826', '1', '4', '静宁县', '26', 'JNX', null, '003062008026', null);
INSERT INTO `pa_bmzd` VALUES ('E4B05D3E0A9045F5B4B0468A45419639', '2015-05-03 11:15:44', '吉林省白山市长白朝鲜族自治县', '1', '4.2.2.220623', '1', '4', '长白朝鲜族自治县', '23', 'ZBZXZZZX', null, '003022006023', null);
INSERT INTO `pa_bmzd` VALUES ('E4B09FA1990E46ADB7E4B8B916035951', '2015-05-03 11:15:44', '广东省湛江市廉江市', '1', '4.2.2.440881', '1', '4', '廉江市', '81', 'LJS', null, '003044008081', null);
INSERT INTO `pa_bmzd` VALUES ('E4C2CA9189CB418590E50DEB582A04FA', '2015-05-03 11:15:44', '内蒙古自治区呼和浩特市新城区', '1', '4.2.2.150102', '1', '4', '新城区', '2', 'XCQ', null, '003015001002', null);
INSERT INTO `pa_bmzd` VALUES ('E4D0FDDF887E411DB7C7EBCE71F3707B', '2015-05-03 11:15:44', '四川省德阳市广汉市', '1', '4.2.2.510681', '1', '4', '广汉市', '81', 'GHS', null, '003051006081', null);
INSERT INTO `pa_bmzd` VALUES ('E4E5A7737DDA4E68BA5BC0C614E7D505', '2015-05-03 11:15:44', '新疆维吾尔自治区阿克苏地区阿瓦提县', '1', '4.2.2.652928', '1', '4', '阿瓦提县', '28', 'AWTX', null, '003065029028', null);
INSERT INTO `pa_bmzd` VALUES ('E4F4FDA049B545E797F704008BA218C8', '2015-05-03 11:15:44', '安徽省宿州市', '1', '4.2.2.341300', '0', '3', '宿州市', '13', 'SZS', null, '003034013', null);
INSERT INTO `pa_bmzd` VALUES ('E518FA8DD2E54F53B01A41A978FB2774', '2015-05-03 11:15:44', '云南省楚雄彝族自治州禄丰县', '1', '4.2.2.532331', '1', '4', '禄丰县', '31', 'LFX', null, '003053023031', null);
INSERT INTO `pa_bmzd` VALUES ('E5382BE84BC84474A87AC2149A24C375', '2015-05-03 11:15:44', '广东省东莞市', '1', '4.2.2.441900', '1', '3', '东莞市', '19', 'DWS', null, '003044019', null);
INSERT INTO `pa_bmzd` VALUES ('E5508BF5240941B48C0D24763E74CEE6', '2015-05-03 11:15:44', '广东省深圳市罗湖区', '1', '4.2.2.440303', '1', '4', '罗湖区', '3', 'LHQ', null, '003044003003', null);
INSERT INTO `pa_bmzd` VALUES ('E5871D7AABB941F3BEAE7BAAE1FB5450', '2015-05-03 11:15:44', '山东省青岛市崂山区', '1', '4.2.2.370212', '1', '4', '崂山区', '12', 'LSQ', null, '003037002012', null);
INSERT INTO `pa_bmzd` VALUES ('E58FE7CA3B9D419F9B778758077817D1', '2015-05-03 11:15:44', '海南省三亚市市辖区', '1', '4.2.2.460201', '1', '4', '市辖区', '1', 'SXQ', null, '003046002001', null);
INSERT INTO `pa_bmzd` VALUES ('E5AE3418D2D849B98CB01E320A2D88C1', '2015-05-03 11:15:44', '辽宁省铁岭市开原市', '1', '4.2.2.211282', '1', '4', '开原市', '82', 'KYS', null, '003021012082', null);
INSERT INTO `pa_bmzd` VALUES ('E5C879D79D15424FB89F76588B7D998F', '2015-05-03 11:15:44', '江苏省南通市港闸区', '1', '4.2.2.320611', '1', '4', '港闸区', '11', 'GZQ', null, '003032006011', null);
INSERT INTO `pa_bmzd` VALUES ('E5C8F773845F4AE080AFB19034D3528F', '2015-05-03 11:15:44', '江西省赣州市', '1', '4.2.2.360700', '0', '3', '赣州市', '7', 'GZS', null, '003036007', null);
INSERT INTO `pa_bmzd` VALUES ('E5D9EFA0330A4A1BBB95B8063BA1295D', '2015-05-03 11:15:44', '宁夏回族自治区吴忠市盐池县', '1', '4.2.2.640323', '1', '4', '盐池县', '23', 'YCX', null, '003064003023', null);
INSERT INTO `pa_bmzd` VALUES ('E5F2F4D123C347B6AC9A6DA64CEA70AE', '2015-05-03 11:15:44', '宁夏回族自治区银川市兴庆区', '1', '4.2.2.640104', '1', '4', '兴庆区', '4', 'XQQ', null, '003064001004', null);
INSERT INTO `pa_bmzd` VALUES ('E602148E012A44F583D66DF7A02AB794', '2015-05-03 11:15:44', '山西省朔州市', '1', '4.2.2.140600', '0', '3', '朔州市', '6', 'SZS', null, '003014006', null);
INSERT INTO `pa_bmzd` VALUES ('E61D1F9DA09744CD881C4E383DFC37D2', '2015-05-03 11:15:44', '福建省宁德市福安市', '1', '4.2.2.350981', '1', '4', '福安市', '81', 'FAS', null, '003035009081', null);
INSERT INTO `pa_bmzd` VALUES ('E62C41CC0E944F3B860D6FCF8A884084', '2015-05-03 11:15:44', '四川省南充市', '1', '4.2.2.511300', '0', '3', '南充市', '13', 'NCS', null, '003051013', null);
INSERT INTO `pa_bmzd` VALUES ('E64E94377D3A4C74BB6C8AE5EF759DAC', '2015-05-03 11:15:44', '湖南省湘潭市韶山市', '1', '4.2.2.430382', '1', '4', '韶山市', '82', 'SSS', null, '003043003082', null);
INSERT INTO `pa_bmzd` VALUES ('E6545603821641BBB04FEA4FC3214858', '2015-05-03 11:15:44', '广西壮族自治区南宁市邕宁区', '1', '4.2.2.450109', '1', '4', '邕宁区', '9', 'YNQ', null, '003045001009', null);
INSERT INTO `pa_bmzd` VALUES ('E672989F32FA464692E3641B96A3F6DC', '2015-05-03 11:15:44', '广西壮族自治区河池市都安瑶族自治县', '1', '4.2.2.451228', '1', '4', '都安瑶族自治县', '28', 'DAYZZZX', null, '003045012028', null);
INSERT INTO `pa_bmzd` VALUES ('E6777ACFA4D148678712026DCAD501F2', '2015-05-03 11:15:44', '黑龙江省鸡西市市辖区', '1', '4.2.2.230301', '1', '4', '市辖区', '1', 'SXQ', null, '003023003001', null);
INSERT INTO `pa_bmzd` VALUES ('E6975BA5B1134F658120A5EA1B87A41A', '2015-05-03 11:15:44', '黑龙江省大庆市市辖区', '1', '4.2.2.230601', '1', '4', '市辖区', '1', 'SXQ', null, '003023006001', null);
INSERT INTO `pa_bmzd` VALUES ('E6988D64710142B3925BCC477965643B', '2015-05-03 11:15:44', '贵州省遵义市凤冈县', '1', '4.2.2.520327', '1', '4', '凤冈县', '27', 'FGX', null, '003052003027', null);
INSERT INTO `pa_bmzd` VALUES ('E69BC60F859049FAAE9E90E5808D5BA1', '2015-05-03 11:15:44', '浙江省温州市龙湾区', '1', '4.2.2.330303', '1', '4', '龙湾区', '3', 'LWQ', null, '003033003003', null);
INSERT INTO `pa_bmzd` VALUES ('C1078182A4A449E5991D34FF284142C7', '2015-05-03 11:15:44', '山西省朔州市朔城区', '1', '4.2.2.140602', '1', '4', '朔城区', '2', 'SCQ', null, '003014006002', null);
INSERT INTO `pa_bmzd` VALUES ('C11DC2D2994F4836853756926CF54467', '2015-05-03 11:15:44', '新疆维吾尔自治区自治区直辖县级行政区划五家渠市', '1', '4.2.2.659004', '1', '4', '五家渠市', '4', 'WJQS', null, '003065090004', null);
INSERT INTO `pa_bmzd` VALUES ('C11FD74D26AB4BBAA602F8FE36550815', '2015-05-03 11:15:44', '四川省广元市利州区', '1', '4.2.2.510802', '1', '4', '利州区', '2', 'LZQ', null, '003051008002', null);
INSERT INTO `pa_bmzd` VALUES ('C15FE40727AA4DB2BD14D0B6F02FDB4F', '2015-05-03 11:15:44', '贵州省安顺市镇宁布依族苗族自治县', '1', '4.2.2.520423', '1', '4', '镇宁布依族苗族自治县', '23', 'ZNBYZMZZZX', null, '003052004023', null);
INSERT INTO `pa_bmzd` VALUES ('C16C2109D0C143DA8523D6B21BB91FE5', '2015-05-03 11:15:44', '浙江省舟山市岱山县', '1', '4.2.2.330921', '1', '4', '岱山县', '21', 'DSX', null, '003033009021', null);
INSERT INTO `pa_bmzd` VALUES ('C1A3A051F71547498D4E0A2F29D93490', '2015-05-03 11:15:44', '甘肃省兰州市榆中县', '1', '4.2.2.620123', '1', '4', '榆中县', '23', 'YZX', null, '003062001023', null);
INSERT INTO `pa_bmzd` VALUES ('C1B3CDEFF42F4379BD8254B827159D8D', '2015-05-03 11:15:44', '广西壮族自治区桂林市秀峰区', '1', '4.2.2.450302', '1', '4', '秀峰区', '2', 'XFQ', null, '003045003002', null);
INSERT INTO `pa_bmzd` VALUES ('C1CC1A64D77A40189F26DD4E1E799CA4', '2015-05-03 11:15:44', '河北省保定市顺平县', '1', '4.2.2.130636', '1', '4', '顺平县', '36', 'SPX', null, '003013006036', null);
INSERT INTO `pa_bmzd` VALUES ('C1FA3B7336434C6AA50E1531F5E2B836', '2015-05-03 11:15:44', '云南省文山壮族苗族自治州西畴县', '1', '4.2.2.532623', '1', '4', '西畴县', '23', 'XCX', null, '003053026023', null);
INSERT INTO `pa_bmzd` VALUES ('C209863074EF488DA847DC004C9107A3', '2015-05-03 11:15:44', '云南省昆明市宜良县', '1', '4.2.2.530125', '1', '4', '宜良县', '25', 'YLX', null, '003053001025', null);
INSERT INTO `pa_bmzd` VALUES ('C2190D2C80FA4A89BA888CBD22D8DDDA', '2015-05-03 11:15:44', '海南省省直辖县级行政区划乐东黎族自治县', '1', '4.2.2.469033', '1', '4', '乐东黎族自治县', '27', 'YDLZZZX', null, '003046090027', null);
INSERT INTO `pa_bmzd` VALUES ('C21CB16C6DB841B8914035E4725BC18E', '2015-05-03 11:15:44', '广西壮族自治区河池市罗城仫佬族自治县', '1', '4.2.2.451225', '1', '4', '罗城仫佬族自治县', '25', 'LCMLZZZX', null, '003045012025', null);
INSERT INTO `pa_bmzd` VALUES ('C243BF4ECA68461EBD0C808AF3DFBFA5', '2015-05-03 11:15:44', '江苏省宿迁市宿豫区', '1', '4.2.2.321311', '1', '4', '宿豫区', '11', 'SYQ', null, '003032013011', null);
INSERT INTO `pa_bmzd` VALUES ('C24E462B6A0F42B5A430E90E4CC1C075', '2015-05-03 11:15:44', '广东省揭阳市', '1', '4.2.2.445200', '0', '3', '揭阳市', '52', 'JYS', null, '003044052', null);
INSERT INTO `pa_bmzd` VALUES ('C26C91423C48460EBB4FB94CB6CC5DD6', '2015-05-03 11:15:44', '陕西省铜川市市辖区', '1', '4.2.2.610201', '1', '4', '市辖区', '1', 'SXQ', null, '003061002001', null);
INSERT INTO `pa_bmzd` VALUES ('C27D53D009A44BC0A8FE6710458C8BB8', '2015-05-03 11:15:44', '西藏自治区那曲地区安多县', '1', '4.2.2.542425', '1', '4', '安多县', '25', 'ADX', null, '003054024025', null);
INSERT INTO `pa_bmzd` VALUES ('C27DB3787D664EEAAA058151A4A48BE4', '2015-05-03 11:15:44', '湖北省武汉市东西湖区', '1', '4.2.2.420112', '1', '4', '东西湖区', '12', 'DXHQ', null, '003042001012', null);
INSERT INTO `pa_bmzd` VALUES ('C28A123F4BAE4ACF8A66EF56CC1431F4', '2015-05-03 11:15:44', '浙江省宁波市', '1', '4.2.2.330200', '0', '3', '宁波市', '2', 'NBS', null, '003033002', null);
INSERT INTO `pa_bmzd` VALUES ('C28BB03B674E415D8E70A1A1B5BF72E8', '2015-05-03 11:15:44', '河北省沧州市泊头市', '1', '4.2.2.130981', '1', '4', '泊头市', '81', 'PTS', null, '003013009081', null);
INSERT INTO `pa_bmzd` VALUES ('C299DEAA27934503B38EB2C1D20FB69F', '2015-05-03 11:15:44', '宁夏回族自治区石嘴山市市辖区', '1', '4.2.2.640201', '1', '4', '市辖区', '1', 'SXQ', null, '003064002001', null);
INSERT INTO `pa_bmzd` VALUES ('C2D6EE7AB0E140D9B9C298ADD3494DE8', '2015-05-03 11:15:44', '湖北省武汉市市辖区', '1', '4.2.2.420101', '1', '4', '市辖区', '1', 'SXQ', null, '003042001001', null);
INSERT INTO `pa_bmzd` VALUES ('C2DA561CE0814FB7A0BF40037E881345', '2015-05-03 11:15:44', '甘肃省定西市市辖区', '1', '4.2.2.621101', '1', '4', '市辖区', '1', 'SXQ', null, '003062011001', null);
INSERT INTO `pa_bmzd` VALUES ('C2E5CA9278794BF5B2295B0AEA1F9CE7', '2015-05-03 11:15:44', '浙江省温州市瓯海区', '1', '4.2.2.330304', '1', '4', '瓯海区', '4', 'OHQ', null, '003033003004', null);
INSERT INTO `pa_bmzd` VALUES ('C2F449D6357544238A046C01321FD848', '2015-05-03 11:15:44', '河北省邯郸市峰峰矿区', '1', '4.2.2.130406', '1', '4', '峰峰矿区', '6', 'FFKQ', null, '003013004006', null);
INSERT INTO `pa_bmzd` VALUES ('C2FD0FF6EF33475C902A7D126DE608ED', '2015-05-03 11:15:44', '福建省宁德市古田县', '1', '4.2.2.350922', '1', '4', '古田县', '22', 'GTX', null, '003035009022', null);
INSERT INTO `pa_bmzd` VALUES ('C300F41D3D71467493B8739FD6020AEA', '2015-05-03 11:15:44', '西藏自治区拉萨市市辖区', '1', '4.2.2.540101', '1', '4', '市辖区', '1', 'SXQ', null, '003054001001', null);
INSERT INTO `pa_bmzd` VALUES ('C321AEEC78704EC4930C409B246DC810', '2015-05-03 11:15:44', '云南省临沧市永德县', '1', '4.2.2.530923', '1', '4', '永德县', '23', 'YDX', null, '003053009023', null);
INSERT INTO `pa_bmzd` VALUES ('C327ECF72F0A4C91B42995A5C0C28F94', '2015-05-03 11:15:44', '辽宁省本溪市溪湖区', '1', '4.2.2.210503', '1', '4', '溪湖区', '3', 'XHQ', null, '003021005003', null);
INSERT INTO `pa_bmzd` VALUES ('C32C90094372482893500591EB4F5D7C', '2015-05-03 11:15:44', '贵州省黔东南苗族侗族自治州镇远县', '1', '4.2.2.522625', '1', '4', '镇远县', '25', 'ZYX', null, '003052026025', null);
INSERT INTO `pa_bmzd` VALUES ('C3534FDD77764087BCE1049752035E0C', '2015-05-03 11:15:44', '黑龙江省牡丹江市绥芬河市', '1', '4.2.2.231081', '1', '4', '绥芬河市', '81', 'SFHS', null, '003023010081', null);
INSERT INTO `pa_bmzd` VALUES ('C39AA51249F04FB28CBC08E47517F7B1', '2015-05-03 11:15:44', '河北省唐山市遵化市', '1', '4.2.2.130281', '1', '4', '遵化市', '81', 'ZHS', null, '003013002081', null);
INSERT INTO `pa_bmzd` VALUES ('C3ADCD83C7104E54830F98D701072DC3', '2015-05-03 11:15:44', '四川省眉山市仁寿县', '1', '4.2.2.511421', '1', '4', '仁寿县', '21', 'RSX', null, '003051014021', null);
INSERT INTO `pa_bmzd` VALUES ('C3B0B2C6EB194633A9C2F908D236FF36', '2015-05-03 11:15:44', '甘肃省平凉市泾川县', '1', '4.2.2.620821', '1', '4', '泾川县', '21', 'JCX', null, '003062008021', null);
INSERT INTO `pa_bmzd` VALUES ('C3B47E63D8C140AA9D31E6B3EB01828B', '2015-05-03 11:15:44', '湖北省十堰市张湾区', '1', '4.2.2.420303', '1', '4', '张湾区', '3', 'ZWQ', null, '003042003003', null);
INSERT INTO `pa_bmzd` VALUES ('C3BA1F41E1A64B7EAF2ED67441454602', '2015-05-03 11:15:44', '浙江省丽水市龙泉市', '1', '4.2.2.331181', '1', '4', '龙泉市', '81', 'LQS', null, '003033011081', null);
INSERT INTO `pa_bmzd` VALUES ('C3BC0EF30B314EE6BAD169013A9F4360', '2015-05-03 11:15:44', '辽宁省抚顺市顺城区', '1', '4.2.2.210411', '1', '4', '顺城区', '11', 'SCQ', null, '003021004011', null);
INSERT INTO `pa_bmzd` VALUES ('C3C1903D413140E198DC17AB7FC98052', '2015-05-03 11:15:44', '湖南省怀化市市辖区', '1', '4.2.2.431201', '1', '4', '市辖区', '1', 'SXQ', null, '003043012001', null);
INSERT INTO `pa_bmzd` VALUES ('C3C7EED92257449B93ADA5F21A68399E', '2015-05-03 11:15:44', '浙江省温州市洞头县', '1', '4.2.2.330322', '1', '4', '洞头县', '22', 'DTX', null, '003033003022', null);
INSERT INTO `pa_bmzd` VALUES ('C3DB013568D84B54811FA7AA69E9B998', '2015-05-03 11:15:44', '福建省厦门市同安区', '1', '4.2.2.350212', '1', '4', '同安区', '12', 'TAQ', null, '003035002012', null);
INSERT INTO `pa_bmzd` VALUES ('C3EF8190E1AA456198808CF6636B2FE1', '2015-05-03 11:15:44', '广东省河源市紫金县', '1', '4.2.2.441621', '1', '4', '紫金县', '21', 'ZJX', null, '003044016021', null);
INSERT INTO `pa_bmzd` VALUES ('C3F4D0261977464791CBA86047C6C997', '2015-05-03 11:15:44', '四川省南充市嘉陵区', '1', '4.2.2.511304', '1', '4', '嘉陵区', '4', 'JLQ', null, '003051013004', null);
INSERT INTO `pa_bmzd` VALUES ('C401589C18D2420E812A405E22E4CE9A', '2015-05-03 11:15:44', '河南省开封市杞县', '1', '4.2.2.410221', '1', '4', '杞县', '21', 'QX', null, '003041002021', null);
INSERT INTO `pa_bmzd` VALUES ('C404E2A154DB45A5962BB0D7B382A37C', '2015-05-03 11:15:44', '安徽省池州市青阳县', '1', '4.2.2.341723', '1', '4', '青阳县', '23', 'QYX', null, '003034017023', null);
INSERT INTO `pa_bmzd` VALUES ('C42C13899C2B4AD69B09391EF01F0D44', '2015-05-03 11:15:44', '广西壮族自治区贺州市昭平县', '1', '4.2.2.451121', '1', '4', '昭平县', '21', 'ZPX', null, '003045011021', null);
INSERT INTO `pa_bmzd` VALUES ('C43B369FE91C4B1FBEF4472889DCA4FE', '2015-05-03 11:15:44', '河北省石家庄市', '1', '4.2.2.130100', '0', '3', '石家庄市', '1', 'SJZS', null, '003013001', null);
INSERT INTO `pa_bmzd` VALUES ('C440D70CB23D46028AABEFCBB1C66605', '2015-05-03 11:15:44', '福建省宁德市屏南县', '1', '4.2.2.350923', '1', '4', '屏南县', '23', 'PNX', null, '003035009023', null);
INSERT INTO `pa_bmzd` VALUES ('C441D3C9293143BCB66177CC8BA979E6', '2015-05-03 11:15:44', '黑龙江省大庆市肇源县', '1', '4.2.2.230622', '1', '4', '肇源县', '22', 'ZYX', null, '003023006022', null);
INSERT INTO `pa_bmzd` VALUES ('C4443E6E9D804CBA99AD52910643A294', '2015-05-03 11:15:44', '浙江省台州市玉环县', '1', '4.2.2.331021', '1', '4', '玉环县', '21', 'YHX', null, '003033010021', null);
INSERT INTO `pa_bmzd` VALUES ('C4468523996D4A3590A47B9A959DBBF7', '2015-05-03 11:15:44', '江西省九江市瑞昌市', '1', '4.2.2.360481', '1', '4', '瑞昌市', '81', 'RCS', null, '003036004081', null);
INSERT INTO `pa_bmzd` VALUES ('C454740358834A27B0BBE10066040687', '2015-05-03 11:15:44', '安徽省芜湖市镜湖区', '1', '4.2.2.340202', '1', '4', '镜湖区', '2', 'JHQ', null, '003034002002', null);
INSERT INTO `pa_bmzd` VALUES ('C4CA78FCB7334AC999E123F29C3C47EE', '2015-05-03 11:15:44', '江苏省淮安市盱眙县', '1', '4.2.2.320830', '1', '4', '盱眙县', '30', 'XYX', null, '003032008030', null);
INSERT INTO `pa_bmzd` VALUES ('C4DF0D53816D465D8B4C3A33FF93CAC6', '2015-05-03 11:15:44', '河南省周口市川汇区', '1', '4.2.2.411602', '1', '4', '川汇区', '2', 'CHQ', null, '003041016002', null);
INSERT INTO `pa_bmzd` VALUES ('C4FC20A1FBEA49179F962A08B47243F0', '2015-05-03 11:15:44', '湖南省湘西土家族苗族自治州吉首市', '1', '4.2.2.433101', '1', '4', '吉首市', '1', 'JSS', null, '003043031001', null);
INSERT INTO `pa_bmzd` VALUES ('C52D7C81D99C4EF096E08777D1F51305', '2015-05-03 11:15:44', '山西省太原市迎泽区', '1', '4.2.2.140106', '1', '4', '迎泽区', '6', 'YZQ', null, '003014001006', null);
INSERT INTO `pa_bmzd` VALUES ('C53F6134C12B4CDEBA9DDF89652CB5FF', '2015-05-03 11:15:44', '辽宁省阜新市市辖区', '1', '4.2.2.210901', '1', '4', '市辖区', '1', 'SXQ', null, '003021009001', null);
INSERT INTO `pa_bmzd` VALUES ('C56721A2F7744CA3873D9F2726981BB3', '2015-05-03 11:15:44', '西藏自治区那曲地区班戈县', '1', '4.2.2.542428', '1', '4', '班戈县', '28', 'BGX', null, '003054024028', null);
INSERT INTO `pa_bmzd` VALUES ('C569D5ED99F9450098B0367327F8B094', '2015-05-03 11:15:44', '西藏自治区昌都地区江达县', '1', '4.2.2.542122', '1', '4', '江达县', '22', 'JDX', null, '003054021022', null);
INSERT INTO `pa_bmzd` VALUES ('C5709804C4F0428C980CDE1D76DFE089', '2015-05-03 11:15:44', '四川省甘孜藏族自治州炉霍县', '1', '4.2.2.513327', '1', '4', '炉霍县', '27', 'LHX', null, '003051033027', null);
INSERT INTO `pa_bmzd` VALUES ('C575E32B8E2445A1908C43233235347E', '2015-05-03 11:15:44', '江西省景德镇市昌江区', '1', '4.2.2.360202', '1', '4', '昌江区', '2', 'CJQ', null, '003036002002', null);
INSERT INTO `pa_bmzd` VALUES ('C58B0E816FBB476283DD7DB4B6D6A23D', '2015-05-03 11:15:44', '山东省聊城市临清市', '1', '4.2.2.371581', '1', '4', '临清市', '81', 'LQS', null, '003037015081', null);
INSERT INTO `pa_bmzd` VALUES ('C5B41F2F95CC4DDCA8062B922BD4EFE4', '2015-05-03 11:15:44', '河南省信阳市新县', '1', '4.2.2.411523', '1', '4', '新县', '23', 'XX', null, '003041015023', null);
INSERT INTO `pa_bmzd` VALUES ('C5E0FDBAB4CE4F0BB3F0009AACD06EEB', '2015-05-03 11:15:44', '福建省莆田市城厢区', '1', '4.2.2.350302', '1', '4', '城厢区', '2', 'CXQ', null, '003035003002', null);
INSERT INTO `pa_bmzd` VALUES ('C5E77F51691243E09462BD08260A109E', '2015-05-03 11:15:44', '辽宁省锦州市市辖区', '1', '4.2.2.210701', '1', '4', '市辖区', '1', 'SXQ', null, '003021007001', null);
INSERT INTO `pa_bmzd` VALUES ('C5E7AB42013F4EEE91D8D9A7775F8C02', '2015-05-03 11:15:44', '福建省福州市长乐市', '1', '4.2.2.350182', '1', '4', '长乐市', '82', 'ZYS', null, '003035001082', null);
INSERT INTO `pa_bmzd` VALUES ('C5F2CF1C1A3A4CDC900A763BF02BC77A', '2015-05-03 11:15:44', '江西省赣州市瑞金市', '1', '4.2.2.360781', '1', '4', '瑞金市', '81', 'RJS', null, '003036007081', null);
INSERT INTO `pa_bmzd` VALUES ('C61A16379595472F9735AF1836B1EA94', '2015-05-03 11:15:44', '湖南省益阳市资阳区', '1', '4.2.2.430902', '1', '4', '资阳区', '2', 'ZYQ', null, '003043009002', null);
INSERT INTO `pa_bmzd` VALUES ('C62785B107BB40BC99809016CEA9EDD0', '2015-05-03 11:15:44', '浙江省衢州市', '1', '4.2.2.330800', '0', '3', '衢州市', '8', 'QZS', null, '003033008', null);
INSERT INTO `pa_bmzd` VALUES ('C62F909C2D154356BFCFB57F55B3AC44', '2015-05-03 11:15:44', '浙江省湖州市吴兴区', '1', '4.2.2.330502', '1', '4', '吴兴区', '2', 'WXQ', null, '003033005002', null);
INSERT INTO `pa_bmzd` VALUES ('C67034C8D3084916B3E77519C9C7B641', '2015-05-03 11:15:44', '福建省宁德市寿宁县', '1', '4.2.2.350924', '1', '4', '寿宁县', '24', 'SNX', null, '003035009024', null);
INSERT INTO `pa_bmzd` VALUES ('C6815BA4A8EA41D5AE871E1F5AD5C491', '2015-05-03 11:15:44', '云南省昭通市彝良县', '1', '4.2.2.530628', '1', '4', '彝良县', '28', 'YLX', null, '003053006028', null);
INSERT INTO `pa_bmzd` VALUES ('C692F8D229694F4598667D66A3205FD9', '2015-05-03 11:15:44', '安徽省宣城市绩溪县', '1', '4.2.2.341824', '1', '4', '绩溪县', '24', 'JXX', null, '003034018024', null);
INSERT INTO `pa_bmzd` VALUES ('C69F43CEB2CF4EFEBF8B141C3329378A', '2015-05-03 11:15:44', '广东省汕尾市', '1', '4.2.2.441500', '0', '3', '汕尾市', '15', 'SYS', null, '003044015', null);
INSERT INTO `pa_bmzd` VALUES ('C6C6124D5A5E4C60B96B5085763CDA51', '2015-05-03 11:15:44', '上海市市辖区', '1', '4.2.2.310100', '0', '3', '市辖区', '1', 'SXQ', null, '003031001', null);
INSERT INTO `pa_bmzd` VALUES ('C6D1A43EEA024FD7826F965451D125D5', '2015-05-03 11:15:44', '陕西省商洛市市辖区', '1', '4.2.2.611001', '1', '4', '市辖区', '1', 'SXQ', null, '003061010001', null);
INSERT INTO `pa_bmzd` VALUES ('C6E7A33E290B4677837424AEAF2BB101', '2015-05-03 11:15:44', '上海市市辖区闵行区', '1', '4.2.2.310112', '1', '4', '闵行区', '12', 'MXQ', null, '003031001012', null);
INSERT INTO `pa_bmzd` VALUES ('C6EE5A39ED8C4D908CE191212697D789', '2015-05-03 11:15:44', '湖北省荆州市市辖区', '1', '4.2.2.421001', '1', '4', '市辖区', '1', 'SXQ', null, '003042010001', null);
INSERT INTO `pa_bmzd` VALUES ('C6EF638485284F72ACCE262A5C30CD02', '2015-05-03 11:15:44', '河北省张家口市康保县', '1', '4.2.2.130723', '1', '4', '康保县', '23', 'KBX', null, '003013007023', null);
INSERT INTO `pa_bmzd` VALUES ('C6F061AC3FEA4400A97EEE4D6165616E', '2015-05-03 11:15:44', '黑龙江省大庆市杜尔伯特蒙古族自治县', '1', '4.2.2.230624', '1', '4', '杜尔伯特蒙古族自治县', '24', 'DEBTMGZZZX', null, '003023006024', null);
INSERT INTO `pa_bmzd` VALUES ('C6F49F9064154326A154F17A04F6B9B9', '2015-05-03 11:15:44', '吉林省白山市江源区', '1', '4.2.2.220605', '1', '4', '江源区', '5', 'JYQ', null, '003022006005', null);
INSERT INTO `pa_bmzd` VALUES ('C6FB039B38084038BF20DF0A97879D98', '2015-05-03 11:15:44', '江苏省扬州市高邮市', '1', '4.2.2.321084', '1', '4', '高邮市', '84', 'GYS', null, '003032010084', null);
INSERT INTO `pa_bmzd` VALUES ('C70AE28FF9044906984EC7F59E379EFF', '2015-05-03 11:15:44', '河北省邢台市南宫市', '1', '4.2.2.130581', '1', '4', '南宫市', '81', 'NGS', null, '003013005081', null);
INSERT INTO `pa_bmzd` VALUES ('C70EDB0329F64F5EBDEDE946C43B4D5D', '2015-05-03 11:15:44', '甘肃省庆阳市正宁县', '1', '4.2.2.621025', '1', '4', '正宁县', '25', 'ZNX', null, '003062010025', null);
INSERT INTO `pa_bmzd` VALUES ('C72CDA270BC342D9BA2FB7441AD5B466', '2015-05-03 11:15:44', '贵州省贵阳市云岩区', '1', '4.2.2.520103', '1', '4', '云岩区', '3', 'YYQ', null, '003052001003', null);
INSERT INTO `pa_bmzd` VALUES ('C7374DDBB1804E6E88F01897EA8B146B', '2015-05-03 11:15:44', '山西省运城市绛县', '1', '4.2.2.140826', '1', '4', '绛县', '26', 'JX', null, '003014008026', null);
INSERT INTO `pa_bmzd` VALUES ('C759CE4B83D049FFB416AB8CBA9F9613', '2015-05-03 11:15:44', '福建省南平市建阳市', '1', '4.2.2.350784', '1', '4', '建阳市', '84', 'JYS', null, '003035007084', null);
INSERT INTO `pa_bmzd` VALUES ('C77DF6DA9C9049B3A8C55C1D75D6B912', '2015-05-03 11:15:44', '山东省德州市德城区', '1', '4.2.2.371402', '1', '4', '德城区', '2', 'DCQ', null, '003037014002', null);
INSERT INTO `pa_bmzd` VALUES ('C77F369F3AA04FE78B499CC8D16FCD16', '2015-05-03 11:15:44', '江苏省镇江市扬中市', '1', '4.2.2.321182', '1', '4', '扬中市', '82', 'YZS', null, '003032011082', null);
INSERT INTO `pa_bmzd` VALUES ('C7813A8C0E564664898C38859C176620', '2015-05-03 11:15:44', '内蒙古自治区通辽市科尔沁区', '1', '4.2.2.150502', '1', '4', '科尔沁区', '2', 'KEQQ', null, '003015005002', null);
INSERT INTO `pa_bmzd` VALUES ('C7BA0480DCC04A33AA2E3F3139257C64', '2015-05-03 11:15:44', '云南省昭通市水富县', '1', '4.2.2.530630', '1', '4', '水富县', '30', 'SFX', null, '003053006030', null);
INSERT INTO `pa_bmzd` VALUES ('C7BE89516C7B45D4B343EEDA5C2FA52D', '2015-05-03 11:15:44', '黑龙江省伊春市带岭区', '1', '4.2.2.230713', '1', '4', '带岭区', '13', 'DLQ', null, '003023007013', null);
INSERT INTO `pa_bmzd` VALUES ('C7C565B46DCE4BD399B03167BD1FFEC6', '2015-05-03 11:15:44', '甘肃省临夏回族自治州临夏县', '1', '4.2.2.622921', '1', '4', '临夏县', '21', 'LXX', null, '003062029021', null);
INSERT INTO `pa_bmzd` VALUES ('C7E30A4D255647AE84F90AEB21763CD7', '2015-05-03 11:15:44', '山西省晋城市阳城县', '1', '4.2.2.140522', '1', '4', '阳城县', '22', 'YCX', null, '003014005022', null);
INSERT INTO `pa_bmzd` VALUES ('C7E3D5404F8641508F4CD66155732788', '2015-05-03 11:15:44', '内蒙古自治区赤峰市', '1', '4.2.2.150400', '0', '3', '赤峰市', '4', 'CFS', null, '003015004', null);
INSERT INTO `pa_bmzd` VALUES ('C7EAE46290214C1B9B116DBDF841FA52', '2015-05-03 11:15:44', '内蒙古自治区鄂尔多斯市达拉特旗', '1', '4.2.2.150621', '1', '4', '达拉特旗', '21', 'DLTQ', null, '003015006021', null);
INSERT INTO `pa_bmzd` VALUES ('C7FD58D900964673A3ACDB8F4B7B6D68', '2015-05-03 11:15:44', '天津市县静海县', '1', '4.2.2.120223', '1', '4', '静海县', '23', 'JHX', null, '003012002023', null);
INSERT INTO `pa_bmzd` VALUES ('C8018B6590B44901B15426B9FE0FE9FD', '2015-05-03 11:15:44', '河南省焦作市沁阳市', '1', '4.2.2.410882', '1', '4', '沁阳市', '82', 'QYS', null, '003041008082', null);
INSERT INTO `pa_bmzd` VALUES ('C8670922555347BB8A8F8FE0AE927393', '2015-05-03 11:15:44', '河北省保定市定兴县', '1', '4.2.2.130626', '1', '4', '定兴县', '26', 'DXX', null, '003013006026', null);
INSERT INTO `pa_bmzd` VALUES ('C86B589F84D546DA8A21AAB297014380', '2015-05-03 11:15:44', '新疆维吾尔自治区和田地区民丰县', '1', '4.2.2.653227', '1', '4', '民丰县', '27', 'MFX', null, '003065032027', null);
INSERT INTO `pa_bmzd` VALUES ('C87675176A49499983410808276E974D', '2015-05-03 11:15:44', '甘肃省张掖市临泽县', '1', '4.2.2.620723', '1', '4', '临泽县', '23', 'LZX', null, '003062007023', null);
INSERT INTO `pa_bmzd` VALUES ('C87F1EC7A19040A6B894A1EEA99104E4', '2015-05-03 11:15:44', '河南省安阳市文峰区', '1', '4.2.2.410502', '1', '4', '文峰区', '2', 'WFQ', null, '003041005002', null);
INSERT INTO `pa_bmzd` VALUES ('C896D576B9EE44EAA8DD214F7C872CFE', '2015-05-03 11:15:44', '安徽省阜阳市颍上县', '1', '4.2.2.341226', '1', '4', '颍上县', '26', 'YSX', null, '003034012026', null);
INSERT INTO `pa_bmzd` VALUES ('C8A472C58E144C95A0A2A1EF38A65A17', '2015-05-03 11:15:44', '湖南省益阳市赫山区', '1', '4.2.2.430903', '1', '4', '赫山区', '3', 'HSQ', null, '003043009003', null);
INSERT INTO `pa_bmzd` VALUES ('C8B9EF282EB84070B3D8588FB1C66919', '2015-05-03 11:15:44', '四川省成都市蒲江县', '1', '4.2.2.510131', '1', '4', '蒲江县', '31', 'PJX', null, '003051001031', null);
INSERT INTO `pa_bmzd` VALUES ('C8CDA76C6574487196D7E72CA3E8E6DD', '2015-05-03 11:15:44', '江西省抚州市', '1', '4.2.2.361000', '0', '3', '抚州市', '10', 'FZS', null, '003036010', null);
INSERT INTO `pa_bmzd` VALUES ('C8EA1ABE93734B56A6B08ACDFE2D9F60', '2015-05-03 11:15:44', '陕西省延安市安塞县', '1', '4.2.2.610624', '1', '4', '安塞县', '24', 'ASX', null, '003061006024', null);
INSERT INTO `pa_bmzd` VALUES ('C8EE54DDC76E47BAA46E8E4656901406', '2015-05-03 11:15:44', '广西壮族自治区柳州市', '1', '4.2.2.450200', '0', '3', '柳州市', '2', 'LZS', null, '003045002', null);
INSERT INTO `pa_bmzd` VALUES ('C903DD95468E408F94E904A23262B699', '2015-05-03 11:15:44', '浙江省台州市市辖区', '1', '4.2.2.331001', '1', '4', '市辖区', '1', 'SXQ', null, '003033010001', null);
INSERT INTO `pa_bmzd` VALUES ('C90B88837C854FDCB208CB0AC39230F6', '2015-05-03 11:15:44', '黑龙江省大庆市林甸县', '1', '4.2.2.230623', '1', '4', '林甸县', '23', 'LDX', null, '003023006023', null);
INSERT INTO `pa_bmzd` VALUES ('C90EF38BB4254FFA94BD406740C81BFC', '2015-05-03 11:15:44', '安徽省安庆市市辖区', '1', '4.2.2.340801', '1', '4', '市辖区', '1', 'SXQ', null, '003034008001', null);
INSERT INTO `pa_bmzd` VALUES ('C920874F471F46418EAC346AC79DFEAD', '2015-05-03 11:15:44', '江西省赣州市市辖区', '1', '4.2.2.360701', '1', '4', '市辖区', '1', 'SXQ', null, '003036007001', null);
INSERT INTO `pa_bmzd` VALUES ('C92291D164CF4F85A4F972DB717DB945', '2015-05-03 11:15:44', '云南省临沧市镇康县', '1', '4.2.2.530924', '1', '4', '镇康县', '24', 'ZKX', null, '003053009024', null);
INSERT INTO `pa_bmzd` VALUES ('C931D804250A4FA7A441C82CBA9D6D8E', '2015-05-03 11:15:44', '山西省临汾市霍州市', '1', '4.2.2.141082', '1', '4', '霍州市', '82', 'HZS', null, '003014010082', null);
INSERT INTO `pa_bmzd` VALUES ('C93455FC6CEF4EDDA0DD689CC859084D', '2015-05-03 11:15:44', '河南省驻马店市西平县', '1', '4.2.2.411721', '1', '4', '西平县', '21', 'XPX', null, '003041017021', null);
INSERT INTO `pa_bmzd` VALUES ('C93B9C3D8F0D4655A4415D962B155F7F', '2015-05-03 11:15:44', '四川省绵阳市平武县', '1', '4.2.2.510727', '1', '4', '平武县', '27', 'PWX', null, '003051007027', null);
INSERT INTO `pa_bmzd` VALUES ('C93ECBFBC21A4AB8AF755A35D3C0C135', '2015-05-03 11:15:44', '内蒙古自治区锡林郭勒盟多伦县', '1', '4.2.2.152531', '1', '4', '多伦县', '31', 'DLX', null, '003015025031', null);
INSERT INTO `pa_bmzd` VALUES ('C9431111384B4D00945707F3AC7E55C3', '2015-05-03 11:15:44', '贵州省遵义市绥阳县', '1', '4.2.2.520323', '1', '4', '绥阳县', '23', 'SYX', null, '003052003023', null);
INSERT INTO `pa_bmzd` VALUES ('C94667FD25274B5B88A70EE1BA08244E', '2015-05-03 11:15:44', '四川省凉山彝族自治州雷波县', '1', '4.2.2.513437', '1', '4', '雷波县', '37', 'LBX', null, '003051034037', null);
INSERT INTO `pa_bmzd` VALUES ('C948350CAAF04A36AF33EC44B81EEC4A', '2015-05-03 11:15:44', '江苏省淮安市', '1', '4.2.2.320800', '0', '3', '淮安市', '8', 'HAS', null, '003032008', null);
INSERT INTO `pa_bmzd` VALUES ('C95422869E244B0D9A02FD47BACE1B07', '2015-05-03 11:15:44', '辽宁省大连市瓦房店市', '1', '4.2.2.210281', '1', '4', '瓦房店市', '81', 'WFDS', null, '003021002081', null);
INSERT INTO `pa_bmzd` VALUES ('C95C2F0A0E98496683F483165CEADA3F', '2015-05-03 11:15:44', '湖北省恩施土家族苗族自治州咸丰县', '1', '4.2.2.422826', '1', '4', '咸丰县', '26', 'XFX', null, '003042028026', null);
INSERT INTO `pa_bmzd` VALUES ('C966856CC7544D979339E389BC0BF2D6', '2015-05-03 11:15:44', '甘肃省天水市张家川回族自治县', '1', '4.2.2.620525', '1', '4', '张家川回族自治县', '25', 'ZJCHZZZX', null, '003062005025', null);
INSERT INTO `pa_bmzd` VALUES ('C98CDEB495344CE3B1D5B42889931148', '2015-05-03 11:15:44', '福建省泉州市丰泽区', '1', '4.2.2.350503', '1', '4', '丰泽区', '3', 'FZQ', null, '003035005003', null);
INSERT INTO `pa_bmzd` VALUES ('C98F9D2B17C84EA59003DC7DABCE5335', '2015-05-03 11:15:44', '四川省阿坝藏族羌族自治州', '1', '4.2.2.513200', '0', '3', '阿坝藏族羌族自治州', '32', 'ABZZQZZZZ', null, '003051032', null);
INSERT INTO `pa_bmzd` VALUES ('C9B9F72DE81142F8B1687DDF5A8D806E', '2015-05-03 11:15:44', '云南省昆明市晋宁县', '1', '4.2.2.530122', '1', '4', '晋宁县', '22', 'JNX', null, '003053001022', null);
INSERT INTO `pa_bmzd` VALUES ('C9BDC24278014CAA9FA96F8592043115', '2015-05-03 11:15:44', '重庆市县巫溪县', '1', '4.2.2.500238', '1', '4', '巫溪县', '38', 'WXX', null, '003050002038', null);
INSERT INTO `pa_bmzd` VALUES ('C9BE742854F444CEAAB3D9D4D4317552', '2015-05-03 11:15:44', '内蒙古自治区巴彦淖尔市乌拉特中旗', '1', '4.2.2.150824', '1', '4', '乌拉特中旗', '24', 'WLTZQ', null, '003015008024', null);
INSERT INTO `pa_bmzd` VALUES ('C9CFE43183014CA7A4B7BCA2A89077EE', '2015-05-03 11:15:44', '河南省南阳市南召县', '1', '4.2.2.411321', '1', '4', '南召县', '21', 'NZX', null, '003041013021', null);
INSERT INTO `pa_bmzd` VALUES ('C9D4D92CF5C6402190B5C2CDD8711662', '2015-05-03 11:15:44', '黑龙江省齐齐哈尔市克东县', '1', '4.2.2.230230', '1', '4', '克东县', '30', 'KDX', null, '003023002030', null);
INSERT INTO `pa_bmzd` VALUES ('C9EA98012A2846059BD2D8264E2AF317', '2015-05-03 11:15:44', '贵州省黔西南布依族苗族自治州册亨县', '1', '4.2.2.522327', '1', '4', '册亨县', '27', 'CHX', null, '003052023027', null);
INSERT INTO `pa_bmzd` VALUES ('C9EF77ECD9F04792949A1647E0DD7B86', '2015-05-03 11:15:44', '浙江省杭州市桐庐县', '1', '4.2.2.330122', '1', '4', '桐庐县', '22', 'TLX', null, '003033001022', null);
INSERT INTO `pa_bmzd` VALUES ('C9F40248988B494B8CF16D1C58D3033D', '2015-05-03 11:15:44', '湖南省湘潭市湘潭县', '1', '4.2.2.430321', '1', '4', '湘潭县', '21', 'XTX', null, '003043003021', null);
INSERT INTO `pa_bmzd` VALUES ('CA0BE4CBC2954272ADBEA05C65985AFE', '2015-05-03 11:15:44', '河南省信阳市固始县', '1', '4.2.2.411525', '1', '4', '固始县', '25', 'GSX', null, '003041015025', null);
INSERT INTO `pa_bmzd` VALUES ('CA18AADDF7C54D87893BCD703457BDFA', '2015-05-03 11:15:44', '黑龙江省牡丹江市东宁县', '1', '4.2.2.231024', '1', '4', '东宁县', '24', 'DNX', null, '003023010024', null);
INSERT INTO `pa_bmzd` VALUES ('CA247FB13DCA4EDB92ED2D3BC65D82AA', '2015-05-03 11:15:44', '广西壮族自治区防城港市市辖区', '1', '4.2.2.450601', '1', '4', '市辖区', '1', 'SXQ', null, '003045006001', null);
INSERT INTO `pa_bmzd` VALUES ('CA30F4F85B0D4F0AB5517E94604E3D76', '2015-05-03 11:15:44', '黑龙江省双鸭山市尖山区', '1', '4.2.2.230502', '1', '4', '尖山区', '2', 'JSQ', null, '003023005002', null);
INSERT INTO `pa_bmzd` VALUES ('CA3BE8215130480792B4E34B65E5C77B', '2015-05-03 11:15:44', '河南省漯河市', '1', '4.2.2.411100', '0', '3', '漯河市', '11', 'THS', null, '003041011', null);
INSERT INTO `pa_bmzd` VALUES ('CA6736ACCA8B490FBA250953F220D083', '2015-05-03 11:15:44', '湖南省郴州市桂东县', '1', '4.2.2.431027', '1', '4', '桂东县', '27', 'GDX', null, '003043010027', null);
INSERT INTO `pa_bmzd` VALUES ('CA6A26923A20464ABE50AA9DCCFB67BF', '2015-05-03 11:15:44', '广东省揭阳市榕城区', '1', '4.2.2.445202', '1', '4', '榕城区', '2', 'RCQ', null, '003044052002', null);
INSERT INTO `pa_bmzd` VALUES ('CA939FB41B4B4CFA8A881D9775DD1087', '2015-05-03 11:15:44', '安徽省淮南市田家庵区', '1', '4.2.2.340403', '1', '4', '田家庵区', '3', 'TJAQ', null, '003034004003', null);
INSERT INTO `pa_bmzd` VALUES ('CAAE1699D9514047A9EE87BE545A5B61', '2015-05-03 11:15:44', '内蒙古自治区呼伦贝尔市市辖区', '1', '4.2.2.150701', '1', '4', '市辖区', '1', 'SXQ', null, '003015007001', null);
INSERT INTO `pa_bmzd` VALUES ('CAD3B72ADB0645AEBDA82B911E2CB1D1', '2015-05-03 11:15:44', '辽宁省辽阳市太子河区', '1', '4.2.2.211011', '1', '4', '太子河区', '11', 'TZHQ', null, '003021010011', null);
INSERT INTO `pa_bmzd` VALUES ('CADBA1B4591A4F71B86954C4BF1A8BA2', '2015-05-03 11:15:44', '湖北省孝感市安陆市', '1', '4.2.2.420982', '1', '4', '安陆市', '82', 'ALS', null, '003042009082', null);
INSERT INTO `pa_bmzd` VALUES ('CAE1F90AF3D541F294FACA30A451B20F', '2015-05-03 11:15:44', '湖南省郴州市市辖区', '1', '4.2.2.431001', '1', '4', '市辖区', '1', 'SXQ', null, '003043010001', null);
INSERT INTO `pa_bmzd` VALUES ('CB0B6E36CE574D6698DDEFB8B33CB128', '2015-05-03 11:15:44', '河南省开封市开封县', '1', '4.2.2.410224', '1', '4', '开封县', '24', 'KFX', null, '003041002024', null);
INSERT INTO `pa_bmzd` VALUES ('CB4541BA01FE4CD7885300B0FFA06AAE', '2015-05-03 11:15:44', '新疆维吾尔自治区博尔塔拉蒙古自治州温泉县', '1', '4.2.2.652723', '1', '4', '温泉县', '23', 'WQX', null, '003065027023', null);
INSERT INTO `pa_bmzd` VALUES ('CB481A9B4CF04974BE5625785F6F0E9B', '2015-05-03 11:15:44', '重庆市市辖区渝中区', '1', '4.2.2.500103', '1', '4', '渝中区', '3', 'YZQ', null, '003050001003', null);
INSERT INTO `pa_bmzd` VALUES ('CB5DC748BCFE40C2AA3FF715E899A237', '2015-05-03 11:15:44', '新疆维吾尔自治区吐鲁番地区托克逊县', '1', '4.2.2.652123', '1', '4', '托克逊县', '23', 'TKXX', null, '003065021023', null);
INSERT INTO `pa_bmzd` VALUES ('CBA6D33A950A4EAE8F3976824AB64E8C', '2015-05-03 11:15:44', '安徽省铜陵市狮子山区', '1', '4.2.2.340703', '1', '4', '狮子山区', '3', 'SZSQ', null, '003034007003', null);
INSERT INTO `pa_bmzd` VALUES ('CBAC4439C38E48FB80D073E6499AD5C1', '2015-05-03 11:15:44', '广西壮族自治区玉林市市辖区', '1', '4.2.2.450901', '1', '4', '市辖区', '1', 'SXQ', null, '003045009001', null);
INSERT INTO `pa_bmzd` VALUES ('CBD2402BCDBD49BAA1BB16550F90BBEF', '2015-05-03 11:15:44', '福建省福州市闽清县', '1', '4.2.2.350124', '1', '4', '闽清县', '24', 'MQX', null, '003035001024', null);
INSERT INTO `pa_bmzd` VALUES ('CBDF25C4756F4B7181D3CC33EDD6586C', '2015-05-03 11:15:44', '广西壮族自治区贺州市市辖区', '1', '4.2.2.451101', '1', '4', '市辖区', '1', 'SXQ', null, '003045011001', null);
INSERT INTO `pa_bmzd` VALUES ('CBEE2520DFAE44928272E84B6E4697B6', '2015-05-03 11:15:44', '陕西省宝鸡市金台区', '1', '4.2.2.610303', '1', '4', '金台区', '3', 'JTQ', null, '003061003003', null);
INSERT INTO `pa_bmzd` VALUES ('CC046413072A403A9B9161D39A43CAF3', '2015-05-03 11:15:44', '四川省甘孜藏族自治州巴塘县', '1', '4.2.2.513335', '1', '4', '巴塘县', '35', 'BTX', null, '003051033035', null);
INSERT INTO `pa_bmzd` VALUES ('CC23D0FDA9844865879F99261A437D6B', '2015-05-03 11:15:44', '重庆市市辖区九龙坡区', '1', '4.2.2.500107', '1', '4', '九龙坡区', '7', 'JLPQ', null, '003050001007', null);
INSERT INTO `pa_bmzd` VALUES ('CC4802EF0DC44F77A35AB1C6EDECB5A2', '2015-05-03 11:15:44', '云南省楚雄彝族自治州元谋县', '1', '4.2.2.532328', '1', '4', '元谋县', '28', 'YMX', null, '003053023028', null);
INSERT INTO `pa_bmzd` VALUES ('CC580D8510534FA881B2032ECF88DCDB', '2015-05-03 11:15:44', '河北省承德市宽城满族自治县', '1', '4.2.2.130827', '1', '4', '宽城满族自治县', '27', 'KCMZZZX', null, '003013008027', null);
INSERT INTO `pa_bmzd` VALUES ('CC6751378D4F4671BD8C641562FC9918', '2015-05-03 11:15:44', '新疆维吾尔自治区乌鲁木齐市水磨沟区', '1', '4.2.2.650105', '1', '4', '水磨沟区', '5', 'SMGQ', null, '003065001005', null);
INSERT INTO `pa_bmzd` VALUES ('CC70F0994DC74AB6B410919F30FD5E31', '2015-05-03 11:15:44', '湖南省常德市鼎城区', '1', '4.2.2.430703', '1', '4', '鼎城区', '3', 'DCQ', null, '003043007003', null);
INSERT INTO `pa_bmzd` VALUES ('CCA7BF246EF54C5C9B5F706C3C72058E', '2015-05-03 11:15:44', '河北省唐山市开平区', '1', '4.2.2.130205', '1', '4', '开平区', '5', 'KPQ', null, '003013002005', null);
INSERT INTO `pa_bmzd` VALUES ('CCBAA6E88FDB4F4BB0BAED5CD66B5E33', '2015-05-03 11:15:44', '甘肃省张掖市市辖区', '1', '4.2.2.620701', '1', '4', '市辖区', '1', 'SXQ', null, '003062007001', null);
INSERT INTO `pa_bmzd` VALUES ('CCC0D8F643CF4F5DA589C03428665B89', '2015-05-03 11:15:44', '辽宁省辽阳市市辖区', '1', '4.2.2.211001', '1', '4', '市辖区', '1', 'SXQ', null, '003021010001', null);
INSERT INTO `pa_bmzd` VALUES ('CCD763CB04BE4A6D9964CE24FAFFE4F3', '2015-05-03 11:15:44', '陕西省延安市甘泉县', '1', '4.2.2.610627', '1', '4', '甘泉县', '27', 'GQX', null, '003061006027', null);
INSERT INTO `pa_bmzd` VALUES ('CCDCCD9977AF4831AE14B97EA30C1D4E', '2015-05-03 11:15:44', '湖北省荆州市公安县', '1', '4.2.2.421022', '1', '4', '公安县', '22', 'GAX', null, '003042010022', null);
INSERT INTO `pa_bmzd` VALUES ('CCF34B9D7C6E4CE49381091AE77EDB68', '2015-05-03 11:15:44', '辽宁省丹东市市辖区', '1', '4.2.2.210601', '1', '4', '市辖区', '1', 'SXQ', null, '003021006001', null);
INSERT INTO `pa_bmzd` VALUES ('CD1A79D7681D4B47BB79E7905016B2C9', '2015-05-03 11:15:44', '北京市', '1', '4.2.2.110000', '0', '2', '北京市', '11', 'BJS', null, '003011', null);
INSERT INTO `pa_bmzd` VALUES ('CD4DD788DDD3475B8A279250CD226E79', '2015-05-03 11:15:44', '广东省韶关市新丰县', '1', '4.2.2.440233', '1', '4', '新丰县', '33', 'XFX', null, '003044002033', null);
INSERT INTO `pa_bmzd` VALUES ('CD5AEAF401784B328E8208654460D353', '2015-05-03 11:15:44', '山东省聊城市莘县', '1', '4.2.2.371522', '1', '4', '莘县', '22', 'SX', null, '003037015022', null);
INSERT INTO `pa_bmzd` VALUES ('CD6C7558E2A94A70B8F090127F4F5F44', '2015-05-03 11:15:44', '广东省湛江市麻章区', '1', '4.2.2.440811', '1', '4', '麻章区', '11', 'MZQ', null, '003044008011', null);
INSERT INTO `pa_bmzd` VALUES ('CD7092E47215427195AF9B7E0F4DC201', '2015-05-03 11:15:44', '安徽省安庆市大观区', '1', '4.2.2.340803', '1', '4', '大观区', '3', 'DGQ', null, '003034008003', null);
INSERT INTO `pa_bmzd` VALUES ('CD77753FE37141D08A4B285776966569', '2015-05-03 11:15:44', '湖南省娄底市新化县', '1', '4.2.2.431322', '1', '4', '新化县', '22', 'XHX', null, '003043013022', null);
INSERT INTO `pa_bmzd` VALUES ('CD97E81CC3F04ACB94E0629FACC08D95', '2015-05-03 11:15:44', '山东省淄博市张店区', '1', '4.2.2.370303', '1', '4', '张店区', '3', 'ZDQ', null, '003037003003', null);
INSERT INTO `pa_bmzd` VALUES ('CDF3E75647AE4E23BED0690BDF6F6A42', '2015-05-03 11:15:44', '山东省东营市广饶县', '1', '4.2.2.370523', '1', '4', '广饶县', '23', 'GRX', null, '003037005023', null);
INSERT INTO `pa_bmzd` VALUES ('CE12AF3C44834970AFDBADC06224194D', '2015-05-03 11:15:44', '辽宁省阜新市清河门区', '1', '4.2.2.210905', '1', '4', '清河门区', '5', 'QHMQ', null, '003021009005', null);
INSERT INTO `pa_bmzd` VALUES ('CE1A1601748346698FBB45719187EAAA', '2015-05-03 11:15:44', '新疆维吾尔自治区阿勒泰地区布尔津县', '1', '4.2.2.654321', '1', '4', '布尔津县', '21', 'BEJX', null, '003065043021', null);
INSERT INTO `pa_bmzd` VALUES ('CE2FC3E3E81C4AADA0ECC6F89540C86F', '2015-05-03 11:15:44', '吉林省四平市市辖区', '1', '4.2.2.220301', '1', '4', '市辖区', '1', 'SXQ', null, '003022003001', null);
INSERT INTO `pa_bmzd` VALUES ('CE3AACEEBF544830BCCF376EB5D4BC0B', '2015-05-03 11:15:44', '山西省晋中市平遥县', '1', '4.2.2.140728', '1', '4', '平遥县', '28', 'PYX', null, '003014007028', null);
INSERT INTO `pa_bmzd` VALUES ('CE409CFAADBA40228ECD5D5333DB7156', '2015-05-03 11:15:44', '湖北省黄石市阳新县', '1', '4.2.2.420222', '1', '4', '阳新县', '22', 'YXX', null, '003042002022', null);
INSERT INTO `pa_bmzd` VALUES ('CE4DD2C82EFD43DEB3D73C4E1B3FD7A8', '2015-05-03 11:15:44', '四川省德阳市罗江县', '1', '4.2.2.510626', '1', '4', '罗江县', '26', 'LJX', null, '003051006026', null);
INSERT INTO `pa_bmzd` VALUES ('CE5E80D6AED34098A6ED6F5A517E4CAD', '2015-05-03 11:15:44', '广东省茂名市信宜市', '1', '4.2.2.440983', '1', '4', '信宜市', '83', 'XYS', null, '003044009083', null);
INSERT INTO `pa_bmzd` VALUES ('CE7F64F3E90C44FA9F88E2DF3F3CD0F8', '2015-05-03 11:15:44', '陕西省安康市白河县', '1', '4.2.2.610929', '1', '4', '白河县', '29', 'BHX', null, '003061009029', null);
INSERT INTO `pa_bmzd` VALUES ('CE8CEB56C0ED4E20B93BBAEA93A08C5B', '2015-05-03 11:15:44', '云南省红河哈尼族彝族自治州泸西县', '1', '4.2.2.532527', '1', '4', '泸西县', '27', 'LXX', null, '003053025027', null);
INSERT INTO `pa_bmzd` VALUES ('CE99A8ADC78C48D3BEAFC25217713C82', '2015-05-03 11:15:44', '辽宁省锦州市', '1', '4.2.2.210700', '0', '3', '锦州市', '7', 'JZS', null, '003021007', null);
INSERT INTO `pa_bmzd` VALUES ('CEAE2BB0927C4FDEBBD3438D6670B93E', '2015-05-03 11:15:44', '山西省忻州市五寨县', '1', '4.2.2.140928', '1', '4', '五寨县', '28', 'WZX', null, '003014009028', null);
INSERT INTO `pa_bmzd` VALUES ('CEB35859FA5349E585DF2A0F40827F1A', '2015-05-03 11:15:44', '山东省济南市历城区', '1', '4.2.2.370112', '1', '4', '历城区', '12', 'LCQ', null, '003037001012', null);
INSERT INTO `pa_bmzd` VALUES ('CEB4BE1564C5440DA75C08D9A3F47001', '2015-05-03 11:15:44', '河北省保定市北市区', '1', '4.2.2.130603', '1', '4', '北市区', '3', 'BSQ', null, '003013006003', null);
INSERT INTO `pa_bmzd` VALUES ('CEC0DF0C350D4B2BAD64349367D6DD0D', '2015-05-03 11:15:44', '安徽省马鞍山市当涂县', '1', '4.2.2.340521', '1', '4', '当涂县', '21', 'DTX', null, '003034005021', null);
INSERT INTO `pa_bmzd` VALUES ('CECC5409E2864BCCA9922569A3C677E4', '2015-05-03 11:15:44', '辽宁省沈阳市皇姑区', '1', '4.2.2.210105', '1', '4', '皇姑区', '5', 'HGQ', null, '003021001005', null);
INSERT INTO `pa_bmzd` VALUES ('CEF52DA0CC00426A814BE4C1C26D8561', '2015-05-03 11:15:44', '广东省汕尾市城区', '1', '4.2.2.441502', '1', '4', '城区', '2', 'CQ', null, '003044015002', null);
INSERT INTO `pa_bmzd` VALUES ('CEF9C4542AF5498B9AC904DCC3D35F6F', '2015-05-03 11:15:44', '河南省商丘市虞城县', '1', '4.2.2.411425', '1', '4', '虞城县', '25', 'YCX', null, '003041014025', null);
INSERT INTO `pa_bmzd` VALUES ('CF0A4DB4F09249E78ABF2476EBF39CA4', '2015-05-03 11:15:44', '浙江省湖州市德清县', '1', '4.2.2.330521', '1', '4', '德清县', '21', 'DQX', null, '003033005021', null);
INSERT INTO `pa_bmzd` VALUES ('CF17B8BF58F14D78B91C06083B762FBD', '2015-05-03 11:15:44', '天津市市辖区滨海新区', '1', '4.2.2.120116', '1', '4', '滨海新区', '16', 'BHXQ', null, '003012001016', null);
INSERT INTO `pa_bmzd` VALUES ('CF17BB69613F4EA9AC82FB46436E760A', '2015-05-03 11:15:44', '广东省珠海市市辖区', '1', '4.2.2.440401', '1', '4', '市辖区', '1', 'SXQ', null, '003044004001', null);
INSERT INTO `pa_bmzd` VALUES ('CF19E86D6FB04C12A49B86FD00AFC755', '2015-05-03 11:15:44', '湖北省恩施土家族苗族自治州恩施市', '1', '4.2.2.422801', '1', '4', '恩施市', '1', 'ESS', null, '003042028001', null);
INSERT INTO `pa_bmzd` VALUES ('CF3339B0330C4AE5BC63298C006F1BF1', '2015-05-03 11:15:44', '陕西省商洛市丹凤县', '1', '4.2.2.611022', '1', '4', '丹凤县', '22', 'DFX', null, '003061010022', null);
INSERT INTO `pa_bmzd` VALUES ('CF4F9A31291A418B97095072FFFCBC35', '2015-05-03 11:15:44', '浙江省台州市黄岩区', '1', '4.2.2.331003', '1', '4', '黄岩区', '3', 'HYQ', null, '003033010003', null);
INSERT INTO `pa_bmzd` VALUES ('CF525C15590445FCA582926AB4C8CB07', '2015-05-03 11:15:44', '江苏省泰州市市辖区', '1', '4.2.2.321201', '1', '4', '市辖区', '1', 'SXQ', null, '003032012001', null);
INSERT INTO `pa_bmzd` VALUES ('CF5AC2C6478B4AFFB0C71B74A7BD8A85', '2015-05-03 11:15:44', '山东省菏泽市单县', '1', '4.2.2.371722', '1', '4', '单县', '22', 'SX', null, '003037017022', null);
INSERT INTO `pa_bmzd` VALUES ('CF5C78878B3F4A52BDA8FA2BC6B0864D', '2015-05-03 11:15:44', '湖南省岳阳市市辖区', '1', '4.2.2.430601', '1', '4', '市辖区', '1', 'SXQ', null, '003043006001', null);
INSERT INTO `pa_bmzd` VALUES ('CF9A615B1ABB48EFA026BEF5971AA3B1', '2015-05-03 11:15:44', '吉林省延边朝鲜族自治州图们市', '1', '4.2.2.222402', '1', '4', '图们市', '2', 'TMS', null, '003022024002', null);
INSERT INTO `pa_bmzd` VALUES ('CFB76163830E4F1BBE41B25C2F74901A', '2015-05-03 11:15:44', '黑龙江省齐齐哈尔市甘南县', '1', '4.2.2.230225', '1', '4', '甘南县', '25', 'GNX', null, '003023002025', null);
INSERT INTO `pa_bmzd` VALUES ('CFB8ADFDD683421B90CC2EEF3BCC4488', '2015-05-03 11:15:44', '河北省唐山市丰润区', '1', '4.2.2.130208', '1', '4', '丰润区', '8', 'FRQ', null, '003013002008', null);
INSERT INTO `pa_bmzd` VALUES ('CFC7E4C19C794394BBD55385DA04A188', '2015-05-03 11:15:44', '河北省保定市满城县', '1', '4.2.2.130621', '1', '4', '满城县', '21', 'MCX', null, '003013006021', null);
INSERT INTO `pa_bmzd` VALUES ('CFE48DE579F34BA88F137B4510702173', '2015-05-03 11:15:44', '湖北省武汉市江夏区', '1', '4.2.2.420115', '1', '4', '江夏区', '15', 'JXQ', null, '003042001015', null);
INSERT INTO `pa_bmzd` VALUES ('CFE81BD7188249DBA34AFC978C0F00A6', '2015-05-03 11:15:44', '贵州省黔南布依族苗族自治州贵定县', '1', '4.2.2.522723', '1', '4', '贵定县', '23', 'GDX', null, '003052027023', null);
INSERT INTO `pa_bmzd` VALUES ('D005A38A6C1D4D1AAA999EF69E492860', '2015-05-03 11:15:44', '安徽省黄山市徽州区', '1', '4.2.2.341004', '1', '4', '徽州区', '4', 'HZQ', null, '003034010004', null);
INSERT INTO `pa_bmzd` VALUES ('D03B471B2CEC486B9FBFA5399C1B3EBE', '2015-05-03 11:15:44', '河北省邢台市清河县', '1', '4.2.2.130534', '1', '4', '清河县', '34', 'QHX', null, '003013005034', null);
INSERT INTO `pa_bmzd` VALUES ('D066C7E7239347F69FDE4C4BC6959C76', '2015-05-03 11:15:44', '安徽省阜阳市临泉县', '1', '4.2.2.341221', '1', '4', '临泉县', '21', 'LQX', null, '003034012021', null);
INSERT INTO `pa_bmzd` VALUES ('D0C5C14F90D94FF4AFD2D89EC80E6136', '2015-05-03 11:15:44', '四川省达州市渠县', '1', '4.2.2.511725', '1', '4', '渠县', '25', 'QX', null, '003051017025', null);
INSERT INTO `pa_bmzd` VALUES ('D0DEE494FC064F529267F487B7ADFBEE', '2015-05-03 11:15:44', '湖南省岳阳市岳阳楼区', '1', '4.2.2.430602', '1', '4', '岳阳楼区', '2', 'YYLQ', null, '003043006002', null);
INSERT INTO `pa_bmzd` VALUES ('D0E36601C87F4F3A978EABE5C2C87CCF', '2015-05-03 11:15:44', '云南省丽江市市辖区', '1', '4.2.2.530701', '1', '4', '市辖区', '1', 'SXQ', null, '003053007001', null);
INSERT INTO `pa_bmzd` VALUES ('D0EE88292EBB4600A6395CA221387A7D', '2015-05-03 11:15:44', '江西省上饶市德兴市', '1', '4.2.2.361181', '1', '4', '德兴市', '81', 'DXS', null, '003036011081', null);
INSERT INTO `pa_bmzd` VALUES ('D10CA2427EDA46D0A5A99D03F02E2C72', '2015-05-03 11:15:44', '辽宁省沈阳市和平区', '1', '4.2.2.210102', '1', '4', '和平区', '2', 'HPQ', null, '003021001002', null);
INSERT INTO `pa_bmzd` VALUES ('D122CF6455334924AAD3D826D209124B', '2015-05-03 11:15:44', '吉林省长春市绿园区', '1', '4.2.2.220106', '1', '4', '绿园区', '6', 'LYQ', null, '003022001006', null);
INSERT INTO `pa_bmzd` VALUES ('D140358C25A046D399CD719329CD2DDE', '2015-05-03 11:15:44', '云南省保山市', '1', '4.2.2.530500', '0', '3', '保山市', '5', 'BSS', null, '003053005', null);
INSERT INTO `pa_bmzd` VALUES ('D14A9E60E05549FAAAFA9A6FBE77A976', '2015-05-03 11:15:44', '吉林省通化市通化县', '1', '4.2.2.220521', '1', '4', '通化县', '21', 'THX', null, '003022005021', null);
INSERT INTO `pa_bmzd` VALUES ('D17ECD2C3BB74F49AB02CEAAFA6AC760', '2015-05-03 11:15:44', '湖南省岳阳市平江县', '1', '4.2.2.430626', '1', '4', '平江县', '26', 'PJX', null, '003043006026', null);
INSERT INTO `pa_bmzd` VALUES ('D1B5D7DA09DB47DA824FD25D3C199A06', '2015-05-03 11:15:44', '山东省滨州市无棣县', '1', '4.2.2.371623', '1', '4', '无棣县', '23', 'WDX', null, '003037016023', null);
INSERT INTO `pa_bmzd` VALUES ('D1D1D949D640461693DAC8B131341A4D', '2015-05-03 11:15:44', '安徽省宣城市', '1', '4.2.2.341800', '0', '3', '宣城市', '18', 'XCS', null, '003034018', null);
INSERT INTO `pa_bmzd` VALUES ('D1D32B6238C2447B9EBF015C8142EB7F', '2015-05-03 11:15:44', '甘肃省白银市会宁县', '1', '4.2.2.620422', '1', '4', '会宁县', '22', 'KNX', null, '003062004022', null);
INSERT INTO `pa_bmzd` VALUES ('D1DFA812C6EF49DBBBBEE14EF7BBFABD', '2015-05-03 11:15:44', '广西壮族自治区桂林市七星区', '1', '4.2.2.450305', '1', '4', '七星区', '5', 'QXQ', null, '003045003005', null);
INSERT INTO `pa_bmzd` VALUES ('D1F6C5749E0248FDB6406BF8AA41822E', '2015-05-03 11:15:44', '江苏省常州市新北区', '1', '4.2.2.320411', '1', '4', '新北区', '11', 'XBQ', null, '003032004011', null);
INSERT INTO `pa_bmzd` VALUES ('D205C5D2FD08454B9F0594FC1CB9A5E4', '2015-05-03 11:15:44', '河南省周口市太康县', '1', '4.2.2.411627', '1', '4', '太康县', '27', 'TKX', null, '003041016027', null);
INSERT INTO `pa_bmzd` VALUES ('D20B1E9C953B4331BB2637A3B4CAC87D', '2015-05-03 11:15:44', '河北省沧州市新华区', '1', '4.2.2.130902', '1', '4', '新华区', '2', 'XHQ', null, '003013009002', null);
INSERT INTO `pa_bmzd` VALUES ('D20BE957418B4118A158AD3303698837', '2015-05-03 11:15:44', '吉林省长春市', '1', '4.2.2.220100', '0', '3', '长春市', '1', 'ZCS', null, '003022001', null);
INSERT INTO `pa_bmzd` VALUES ('D21DF568E99B41A18947B22C66894BB9', '2015-05-03 11:15:44', '广西壮族自治区南宁市市辖区', '1', '4.2.2.450101', '1', '4', '市辖区', '1', 'SXQ', null, '003045001001', null);
INSERT INTO `pa_bmzd` VALUES ('D22406174DF24CD989222023AD6B2543', '2015-05-03 11:15:44', '重庆市县酉阳土家族苗族自治县', '1', '4.2.2.500242', '1', '4', '酉阳土家族苗族自治县', '42', 'YYTJZMZZZX', null, '003050002042', null);
INSERT INTO `pa_bmzd` VALUES ('D26047DB5B56474AB152D203D9736E92', '2015-05-03 11:15:44', '湖北省襄阳市市辖区', '1', '4.2.2.420601', '1', '4', '市辖区', '1', 'SXQ', null, '003042006001', null);
INSERT INTO `pa_bmzd` VALUES ('D2664FD2FFD947EC9C4EE3DC228F2F08', '2015-05-03 11:15:44', '广西壮族自治区南宁市宾阳县', '1', '4.2.2.450126', '1', '4', '宾阳县', '26', 'BYX', null, '003045001026', null);
INSERT INTO `pa_bmzd` VALUES ('D2CA4CE051B04ABD935956E39BC0D8F3', '2015-05-03 11:15:44', '广西壮族自治区百色市田阳县', '1', '4.2.2.451021', '1', '4', '田阳县', '21', 'TYX', null, '003045010021', null);
INSERT INTO `pa_bmzd` VALUES ('D2CE8BF1AF864CCB9F8A15A596BE399F', '2015-05-03 11:15:44', '黑龙江省伊春市南岔区', '1', '4.2.2.230703', '1', '4', '南岔区', '3', 'NCQ', null, '003023007003', null);
INSERT INTO `pa_bmzd` VALUES ('D2CF3189A01E4C40B53A239F51A5AC37', '2015-05-03 11:15:44', '山东省潍坊市昌邑市', '1', '4.2.2.370786', '1', '4', '昌邑市', '86', 'CYS', null, '003037007086', null);
INSERT INTO `pa_bmzd` VALUES ('D2DCE3C3424A40AEBAD30A3D88553D86', '2015-05-03 11:15:44', '四川省宜宾市屏山县', '1', '4.2.2.511529', '1', '4', '屏山县', '29', 'PSX', null, '003051015029', null);
INSERT INTO `pa_bmzd` VALUES ('D2E0A5B4295543868D0FA59CA4939379', '2015-05-03 11:15:44', '新疆维吾尔自治区克拉玛依市克拉玛依区', '1', '4.2.2.650203', '1', '4', '克拉玛依区', '3', 'KLMYQ', null, '003065002003', null);
INSERT INTO `pa_bmzd` VALUES ('D2F329EEE14C4CF3BEE6BEBA270740CA', '2015-05-03 11:15:44', '辽宁省沈阳市新民市', '1', '4.2.2.210181', '1', '4', '新民市', '81', 'XMS', null, '003021001081', null);
INSERT INTO `pa_bmzd` VALUES ('D2F35A3CD89E48ECA0181B50CD1AD996', '2015-05-03 11:15:44', '河南省开封市', '1', '4.2.2.410200', '0', '3', '开封市', '2', 'KFS', null, '003041002', null);
INSERT INTO `pa_bmzd` VALUES ('D31F98CA726E4E88839C17B338304979', '2015-05-03 11:15:44', '福建省泉州市鲤城区', '1', '4.2.2.350502', '1', '4', '鲤城区', '2', 'LCQ', null, '003035005002', null);
INSERT INTO `pa_bmzd` VALUES ('D33434264E864CE9B28787F084D04B80', '2015-05-03 11:15:44', '江苏省无锡市', '1', '4.2.2.320200', '0', '3', '无锡市', '2', 'WXS', null, '003032002', null);
INSERT INTO `pa_bmzd` VALUES ('D34683ADAAC244EBB0596469C56C57F0', '2015-05-03 11:15:44', '山东省济南市市辖区', '1', '4.2.2.370101', '1', '4', '市辖区', '1', 'SXQ', null, '003037001001', null);
INSERT INTO `pa_bmzd` VALUES ('D34FD545B30E498D9C969288C3C5F077', '2015-05-03 11:15:44', '新疆维吾尔自治区克拉玛依市', '1', '4.2.2.650200', '0', '3', '克拉玛依市', '2', 'KLMYS', null, '003065002', null);
INSERT INTO `pa_bmzd` VALUES ('D35037CC9F1F4434AD9031C19ABA963C', '2015-05-03 11:15:44', '广西壮族自治区贵港市平南县', '1', '4.2.2.450821', '1', '4', '平南县', '21', 'PNX', null, '003045008021', null);
INSERT INTO `pa_bmzd` VALUES ('D377F3564E9C43D788A750FA4287D5BE', '2015-05-03 11:15:44', '贵州省黔东南苗族侗族自治州丹寨县', '1', '4.2.2.522636', '1', '4', '丹寨县', '36', 'DZX', null, '003052026036', null);
INSERT INTO `pa_bmzd` VALUES ('D3786F91980F409F92AFB9A31392857C', '2015-05-03 11:15:44', '安徽省安庆市桐城市', '1', '4.2.2.340881', '1', '4', '桐城市', '81', 'TCS', null, '003034008081', null);
INSERT INTO `pa_bmzd` VALUES ('D390E137F9EB4D6C8BBF0431F48EE747', '2015-05-03 11:15:44', '甘肃省定西市岷县', '1', '4.2.2.621126', '1', '4', '岷县', '26', 'MX', null, '003062011026', null);
INSERT INTO `pa_bmzd` VALUES ('D394B3094C3B4E898278E7FDFBA01390', '2015-05-03 11:15:44', '四川省绵阳市盐亭县', '1', '4.2.2.510723', '1', '4', '盐亭县', '23', 'YTX', null, '003051007023', null);
INSERT INTO `pa_bmzd` VALUES ('D3B21BBA578A465B9340F545D204102D', '2015-05-03 11:15:44', '湖北省恩施土家族苗族自治州建始县', '1', '4.2.2.422822', '1', '4', '建始县', '22', 'JSX', null, '003042028022', null);
INSERT INTO `pa_bmzd` VALUES ('D3B53A96680C43E1B9B17798D91837D2', '2015-05-03 11:15:44', '江苏省苏州市常熟市', '1', '4.2.2.320581', '1', '4', '常熟市', '81', 'CSS', null, '003032005081', null);
INSERT INTO `pa_bmzd` VALUES ('D3BC902B62E24D08976C987504592AE7', '2015-05-03 11:15:44', '湖南省常德市武陵区', '1', '4.2.2.430702', '1', '4', '武陵区', '2', 'WLQ', null, '003043007002', null);
INSERT INTO `pa_bmzd` VALUES ('D3E0A168CBC947ADA0FD2B196E434343', '2015-05-03 11:15:44', '安徽省蚌埠市淮上区', '1', '4.2.2.340311', '1', '4', '淮上区', '11', 'HSQ', null, '003034003011', null);
INSERT INTO `pa_bmzd` VALUES ('D3EFE4C0457C422A8CCE80E716F0211F', '2015-05-03 11:15:44', '辽宁省丹东市元宝区', '1', '4.2.2.210602', '1', '4', '元宝区', '2', 'YBQ', null, '003021006002', null);
INSERT INTO `pa_bmzd` VALUES ('D3F74CA3F39C47F9BBEEDA5482019891', '2015-05-03 11:15:44', '甘肃省临夏回族自治州积石山保安族东乡族撒拉族自治县', '1', '4.2.2.622927', '1', '4', '积石山保安族东乡族撒拉族自治县', '27', 'JSSBAZDXZSLZZZX', null, '003062029027', null);
INSERT INTO `pa_bmzd` VALUES ('D44F8A6E79594943A634420F8A992BFF', '2015-05-03 11:15:44', '江苏省连云港市新浦区', '1', '4.2.2.320705', '1', '4', '新浦区', '5', 'XPQ', null, '003032007005', null);
INSERT INTO `pa_bmzd` VALUES ('D47E9CAEC7894605887752AE45801C0C', '2015-05-03 11:15:44', '内蒙古自治区兴安盟突泉县', '1', '4.2.2.152224', '1', '4', '突泉县', '24', 'TQX', null, '003015022024', null);
INSERT INTO `pa_bmzd` VALUES ('D486492367B644C781CFDE56298680C2', '2015-05-03 11:15:44', '安徽省蚌埠市龙子湖区', '1', '4.2.2.340302', '1', '4', '龙子湖区', '2', 'LZHQ', null, '003034003002', null);
INSERT INTO `pa_bmzd` VALUES ('D48D61DFB3004B4597FE0FDF36D8C136', '2015-05-03 11:15:44', '江苏省宿迁市市辖区', '1', '4.2.2.321301', '1', '4', '市辖区', '1', 'SXQ', null, '003032013001', null);
INSERT INTO `pa_bmzd` VALUES ('D4C079488C924882991B56DBBEA0DFD1', '2015-05-03 11:15:44', '西藏自治区昌都地区察雅县', '1', '4.2.2.542126', '1', '4', '察雅县', '26', 'CYX', null, '003054021026', null);
INSERT INTO `pa_bmzd` VALUES ('D4D851A003AD462DB7F1A84D9B6F6068', '2015-05-03 11:15:44', '山东省菏泽市巨野县', '1', '4.2.2.371724', '1', '4', '巨野县', '24', 'JYX', null, '003037017024', null);
INSERT INTO `pa_bmzd` VALUES ('D4F2E1F085984AADA1A53B8EFBDB1A80', '2015-05-03 11:15:44', '北京市县延庆县', '1', '4.2.2.110229', '1', '4', '延庆县', '29', 'YQX', null, '003011002029', null);
INSERT INTO `pa_bmzd` VALUES ('D50A69CB0A334FBBBAB9EDCBC46E04A4', '2015-05-03 11:15:44', '湖南省张家界市', '1', '4.2.2.430800', '0', '3', '张家界市', '8', 'ZJJS', null, '003043008', null);
INSERT INTO `pa_bmzd` VALUES ('D525708E5EFD45F8A1E51DEBAFE8F72F', '2015-05-03 11:15:44', '新疆维吾尔自治区乌鲁木齐市', '1', '4.2.2.650100', '0', '3', '乌鲁木齐市', '1', 'WLMQS', null, '003065001', null);
INSERT INTO `pa_bmzd` VALUES ('D5417306C52D4279907871400CD2D6D0', '2015-05-03 11:15:44', '陕西省宝鸡市陇县', '1', '4.2.2.610327', '1', '4', '陇县', '27', 'LX', null, '003061003027', null);
INSERT INTO `pa_bmzd` VALUES ('D55443ED1B354136ADD867114701C699', '2015-05-03 11:15:44', '江苏省连云港市东海县', '1', '4.2.2.320722', '1', '4', '东海县', '22', 'DHX', null, '003032007022', null);
INSERT INTO `pa_bmzd` VALUES ('D5640BDD8DEE452C96986348EE466125', '2015-05-03 11:15:44', '湖南省益阳市市辖区', '1', '4.2.2.430901', '1', '4', '市辖区', '1', 'SXQ', null, '003043009001', null);
INSERT INTO `pa_bmzd` VALUES ('D568ECF7B5BB46D394E7BD3ABA545AF2', '2015-05-03 11:15:44', '山东省聊城市茌平县', '1', '4.2.2.371523', '1', '4', '茌平县', '23', 'CPX', null, '003037015023', null);
INSERT INTO `pa_bmzd` VALUES ('D590435BCF5C4E65921C11CEFF427987', '2015-05-03 11:15:44', '陕西省延安市洛川县', '1', '4.2.2.610629', '1', '4', '洛川县', '29', 'LCX', null, '003061006029', null);
INSERT INTO `pa_bmzd` VALUES ('D5B6EC119533489582841F4FFA0D89C8', '2015-05-03 11:15:44', '辽宁省抚顺市市辖区', '1', '4.2.2.210401', '1', '4', '市辖区', '1', 'SXQ', null, '003021004001', null);
INSERT INTO `pa_bmzd` VALUES ('D627A97AD25943BCA49581D9973B0CB0', '2015-05-03 11:15:44', '广西壮族自治区贵港市港北区', '1', '4.2.2.450802', '1', '4', '港北区', '2', 'GBQ', null, '003045008002', null);
INSERT INTO `pa_bmzd` VALUES ('D6526E850E2140D1B24CA42A721B2E07', '2015-05-03 11:15:44', '河北省邢台市南和县', '1', '4.2.2.130527', '1', '4', '南和县', '27', 'NHX', null, '003013005027', null);
INSERT INTO `pa_bmzd` VALUES ('D654EE3178074F36BE2E0752C2880618', '2015-05-03 11:15:44', '福建省南平市', '1', '4.2.2.350700', '0', '3', '南平市', '7', 'NPS', null, '003035007', null);
INSERT INTO `pa_bmzd` VALUES ('D65CA4B454E14ABFAFC46FB3235D3E7A', '2015-05-03 11:15:44', '辽宁省铁岭市西丰县', '1', '4.2.2.211223', '1', '4', '西丰县', '23', 'XFX', null, '003021012023', null);
INSERT INTO `pa_bmzd` VALUES ('D666EB1B739D401492AD3EBA5199875C', '2015-05-03 11:15:44', '陕西省汉中市佛坪县', '1', '4.2.2.610730', '1', '4', '佛坪县', '30', 'BPX', null, '003061007030', null);
INSERT INTO `pa_bmzd` VALUES ('D66DE7990D7A42B294B4981CC1152C9E', '2015-05-03 11:15:44', '河北省沧州市沧县', '1', '4.2.2.130921', '1', '4', '沧县', '21', 'CX', null, '003013009021', null);
INSERT INTO `pa_bmzd` VALUES ('D6757D0AD2854EB5B986A5A2E310ABB5', '2015-05-03 11:15:44', '河北省邢台市桥东区', '1', '4.2.2.130502', '1', '4', '桥东区', '2', 'QDQ', null, '003013005002', null);
INSERT INTO `pa_bmzd` VALUES ('D68201FEA62D4E09B0E2A0E10FF9E8D5', '2015-05-03 11:15:44', '重庆市市辖区渝北区', '1', '4.2.2.500112', '1', '4', '渝北区', '12', 'YBQ', null, '003050001012', null);
INSERT INTO `pa_bmzd` VALUES ('D6913FBC2D1D412093B5F5AB10739519', '2015-05-03 11:15:44', '云南省大理白族自治州永平县', '1', '4.2.2.532928', '1', '4', '永平县', '28', 'YPX', null, '003053029028', null);
INSERT INTO `pa_bmzd` VALUES ('D691B7F8915E46DCBFAC8405AA746F87', '2015-05-03 11:15:44', '湖北省宜昌市当阳市', '1', '4.2.2.420582', '1', '4', '当阳市', '82', 'DYS', null, '003042005082', null);
INSERT INTO `pa_bmzd` VALUES ('D6928683C3684BE3B66250027B3C3A5C', '2015-05-03 11:15:44', '山东省东营市垦利县', '1', '4.2.2.370521', '1', '4', '垦利县', '21', 'KLX', null, '003037005021', null);
INSERT INTO `pa_bmzd` VALUES ('D6ADA6C825EF4373A5CEF9D1D1102BD7', '2015-05-03 11:15:44', '四川省雅安市雨城区', '1', '4.2.2.511802', '1', '4', '雨城区', '2', 'YCQ', null, '003051018002', null);
INSERT INTO `pa_bmzd` VALUES ('D6CC79831F91430182626F8FDB7F1212', '2015-05-03 11:15:44', '山东省聊城市市辖区', '1', '4.2.2.371501', '1', '4', '市辖区', '1', 'SXQ', null, '003037015001', null);
INSERT INTO `pa_bmzd` VALUES ('D6E2A0F134C14ED7815A9C93C230CF50', '2015-05-03 11:15:44', '安徽省铜陵市', '1', '4.2.2.340700', '0', '3', '铜陵市', '7', 'TLS', null, '003034007', null);
INSERT INTO `pa_bmzd` VALUES ('D6EF5F6396134FD4B9CD18AD98AF7ACF', '2015-05-03 11:15:44', '甘肃省陇南市礼县', '1', '4.2.2.621226', '1', '4', '礼县', '26', 'LX', null, '003062012026', null);
INSERT INTO `pa_bmzd` VALUES ('D6F04ED7F62A4EDE92523B870176CB45', '2015-05-03 11:15:44', '山西省长治市屯留县', '1', '4.2.2.140424', '1', '4', '屯留县', '24', 'ZLX', null, '003014004024', null);
INSERT INTO `pa_bmzd` VALUES ('D71F3C5839EA4AB6A8BBF4379FB99CD0', '2015-05-03 11:15:44', '新疆维吾尔自治区阿勒泰地区青河县', '1', '4.2.2.654325', '1', '4', '青河县', '25', 'QHX', null, '003065043025', null);
INSERT INTO `pa_bmzd` VALUES ('D73BD1AB53D14CE5A60BBB6A9FA6A0DF', '2015-05-03 11:15:44', '吉林省通化市梅河口市', '1', '4.2.2.220581', '1', '4', '梅河口市', '81', 'MHKS', null, '003022005081', null);
INSERT INTO `pa_bmzd` VALUES ('D75D3D98A68648938D6C9C1836B631A6', '2015-05-03 11:15:44', '四川省泸州市纳溪区', '1', '4.2.2.510503', '1', '4', '纳溪区', '3', 'NXQ', null, '003051005003', null);
INSERT INTO `pa_bmzd` VALUES ('D75F6C9EC828499DB7E1A98776BB226D', '2015-05-03 11:15:44', '山东省潍坊市市辖区', '1', '4.2.2.370701', '1', '4', '市辖区', '1', 'SXQ', null, '003037007001', null);
INSERT INTO `pa_bmzd` VALUES ('D779248DB58D4006B64B4BDE2E0CB639', '2015-05-03 11:15:44', '安徽省亳州市', '1', '4.2.2.341600', '0', '3', '亳州市', '16', 'BZS', null, '003034016', null);
INSERT INTO `pa_bmzd` VALUES ('D79B5621F61940AB96A43223AB5E07E6', '2015-05-03 11:15:44', '云南省曲靖市麒麟区', '1', '4.2.2.530302', '1', '4', '麒麟区', '2', 'QLQ', null, '003053003002', null);
INSERT INTO `pa_bmzd` VALUES ('D7C30719BE8E40E4875D3E0B66E1422E', '2015-05-03 11:15:44', '黑龙江省牡丹江市爱民区', '1', '4.2.2.231004', '1', '4', '爱民区', '4', 'AMQ', null, '003023010004', null);
INSERT INTO `pa_bmzd` VALUES ('D7DDF6966C224E938E0ECCC5D7B22CC0', '2015-05-03 11:15:44', '山东省莱芜市', '1', '4.2.2.371200', '0', '3', '莱芜市', '12', 'LWS', null, '003037012', null);
INSERT INTO `pa_bmzd` VALUES ('D80FC9003F6743609B1B1EA3A43A4E32', '2015-05-03 11:15:44', '新疆维吾尔自治区塔城地区和布克赛尔蒙古自治县', '1', '4.2.2.654226', '1', '4', '和布克赛尔蒙古自治县', '26', 'HBKSEMGZZX', null, '003065042026', null);
INSERT INTO `pa_bmzd` VALUES ('D8218B8133D84242A45CC628114C11FD', '2015-05-03 11:15:44', '吉林省白城市镇赉县', '1', '4.2.2.220821', '1', '4', '镇赉县', '21', 'ZLX', null, '003022008021', null);
INSERT INTO `pa_bmzd` VALUES ('D8299EB2094B4C3AB593E7A1570EC068', '2015-05-03 11:15:44', '云南省普洱市墨江哈尼族自治县', '1', '4.2.2.530822', '1', '4', '墨江哈尼族自治县', '22', 'MJHNZZZX', null, '003053008022', null);
INSERT INTO `pa_bmzd` VALUES ('D8395B63E39E4856B333EAD1E0EA5F92', '2015-05-03 11:15:44', '山西省忻州市岢岚县', '1', '4.2.2.140929', '1', '4', '岢岚县', '29', 'KLX', null, '003014009029', null);
INSERT INTO `pa_bmzd` VALUES ('D83A7799CE0E47F5AC76DA8ABA249E10', '2015-05-03 11:15:44', '四川省德阳市什邡市', '1', '4.2.2.510682', '1', '4', '什邡市', '82', 'SFS', null, '003051006082', null);
INSERT INTO `pa_bmzd` VALUES ('D8565D6B260B46ABA18C587E5B4913E3', '2015-05-03 11:15:44', '河南省南阳市新野县', '1', '4.2.2.411329', '1', '4', '新野县', '29', 'XYX', null, '003041013029', null);
INSERT INTO `pa_bmzd` VALUES ('D85D552A7AEB45E3A58A45F1F12761AC', '2015-05-03 11:15:44', '河北省衡水市深州市', '1', '4.2.2.131182', '1', '4', '深州市', '82', 'SZS', null, '003013011082', null);
INSERT INTO `pa_bmzd` VALUES ('D8644E25A03D472FB4607ADF49A081D9', '2015-05-03 11:15:44', '新疆维吾尔自治区乌鲁木齐市米东区', '1', '4.2.2.650109', '1', '4', '米东区', '9', 'MDQ', null, '003065001009', null);
INSERT INTO `pa_bmzd` VALUES ('D878174CB0EA4784BC387F8FB9FE79B1', '2015-05-03 11:15:44', '河南省许昌市禹州市', '1', '4.2.2.411081', '1', '4', '禹州市', '81', 'YZS', null, '003041010081', null);
INSERT INTO `pa_bmzd` VALUES ('D88A3F2725F14B849C26C6DD0CFFD0FF', '2015-05-03 11:15:44', '福建省福州市罗源县', '1', '4.2.2.350123', '1', '4', '罗源县', '23', 'LYX', null, '003035001023', null);
INSERT INTO `pa_bmzd` VALUES ('D88DD66A55584096BD0E7ED0EB9DD338', '2015-05-03 11:15:44', '四川省眉山市丹棱县', '1', '4.2.2.511424', '1', '4', '丹棱县', '24', 'DLX', null, '003051014024', null);
INSERT INTO `pa_bmzd` VALUES ('D896661C7A81408ABCF0CA3788EBEEB8', '2015-05-03 11:15:44', '辽宁省朝阳市朝阳县', '1', '4.2.2.211321', '1', '4', '朝阳县', '21', 'ZYX', null, '003021013021', null);
INSERT INTO `pa_bmzd` VALUES ('D8DD090FC68344A887246D38902E6161', '2015-05-03 11:15:44', '贵州省黔南布依族苗族自治州平塘县', '1', '4.2.2.522727', '1', '4', '平塘县', '27', 'PTX', null, '003052027027', null);
INSERT INTO `pa_bmzd` VALUES ('D8E71B4D2E944A7FAB453BE1C10CD10B', '2015-05-03 11:15:44', '湖北省宜昌市', '1', '4.2.2.420500', '0', '3', '宜昌市', '5', 'YCS', null, '003042005', null);
INSERT INTO `pa_bmzd` VALUES ('D8EE2D9569E544958601F5928B4544F8', '2015-05-03 11:15:44', '重庆市县秀山土家族苗族自治县', '1', '4.2.2.500241', '1', '4', '秀山土家族苗族自治县', '41', 'XSTJZMZZZX', null, '003050002041', null);
INSERT INTO `pa_bmzd` VALUES ('D8FFCE1B250440CFBF3CAEE3039C917D', '2015-05-03 11:15:44', '山东省淄博市市辖区', '1', '4.2.2.370301', '1', '4', '市辖区', '1', 'SXQ', null, '003037003001', null);
INSERT INTO `pa_bmzd` VALUES ('D9552A32A102420E8B64A70CD80F36CF', '2015-05-03 11:15:44', '湖北省襄阳市樊城区', '1', '4.2.2.420606', '1', '4', '樊城区', '6', 'FCQ', null, '003042006006', null);
INSERT INTO `pa_bmzd` VALUES ('D955B7DADFCC426F8878E2690C00313D', '2015-05-03 11:15:44', '内蒙古自治区赤峰市市辖区', '1', '4.2.2.150401', '1', '4', '市辖区', '1', 'SXQ', null, '003015004001', null);
INSERT INTO `pa_bmzd` VALUES ('D963B30A78B04B6D815EC99EDBC85F65', '2015-05-03 11:15:44', '浙江省杭州市余杭区', '1', '4.2.2.330110', '1', '4', '余杭区', '10', 'YHQ', null, '003033001010', null);
INSERT INTO `pa_bmzd` VALUES ('D98A91D501A941F693E9386FDB4D70A3', '2015-05-03 11:15:44', '辽宁省沈阳市于洪区', '1', '4.2.2.210114', '1', '4', '于洪区', '14', 'YHQ', null, '003021001014', null);
INSERT INTO `pa_bmzd` VALUES ('D9AC5207972E4F4E876117F45F6BC223', '2015-05-03 11:15:44', '浙江省温州市苍南县', '1', '4.2.2.330327', '1', '4', '苍南县', '27', 'CNX', null, '003033003027', null);
INSERT INTO `pa_bmzd` VALUES ('D9BAE914661C4CF0858C56AC025515FF', '2015-05-03 11:15:44', '广东省肇庆市德庆县', '1', '4.2.2.441226', '1', '4', '德庆县', '26', 'DQX', null, '003044012026', null);
INSERT INTO `pa_bmzd` VALUES ('D9CBA87A9E014721BA622DEF76F45A29', '2015-05-03 11:15:44', '宁夏回族自治区吴忠市同心县', '1', '4.2.2.640324', '1', '4', '同心县', '24', 'TXX', null, '003064003024', null);
INSERT INTO `pa_bmzd` VALUES ('D9D777690F10437D8531EBE0AD372306', '2015-05-03 11:15:44', '四川省达州市大竹县', '1', '4.2.2.511724', '1', '4', '大竹县', '24', 'DZX', null, '003051017024', null);
INSERT INTO `pa_bmzd` VALUES ('D9DF1077DB60454780BF5F883996B3D9', '2015-05-03 11:15:44', '内蒙古自治区赤峰市巴林右旗', '1', '4.2.2.150423', '1', '4', '巴林右旗', '23', 'BLYQ', null, '003015004023', null);
INSERT INTO `pa_bmzd` VALUES ('D9E26F8850B24437B269EB71B61508F4', '2015-05-03 11:15:44', '山东省烟台市市辖区', '1', '4.2.2.370601', '1', '4', '市辖区', '1', 'SXQ', null, '003037006001', null);
INSERT INTO `pa_bmzd` VALUES ('D9F5D77838A1408FBD0C568C910CD599', '2015-05-03 11:15:44', '福建省三明市尤溪县', '1', '4.2.2.350426', '1', '4', '尤溪县', '26', 'YXX', null, '003035004026', null);
INSERT INTO `pa_bmzd` VALUES ('D9FC9083C2F5467DB77157336EEDEB11', '2015-05-03 11:15:44', '黑龙江省七台河市市辖区', '1', '4.2.2.230901', '1', '4', '市辖区', '1', 'SXQ', null, '003023009001', null);
INSERT INTO `pa_bmzd` VALUES ('D9FE97CD4907482EB9B764758BA0B90C', '2015-05-03 11:15:44', '浙江省金华市市辖区', '1', '4.2.2.330701', '1', '4', '市辖区', '1', 'SXQ', null, '003033007001', null);
INSERT INTO `pa_bmzd` VALUES ('DA502297B0B84FD89E9E2F95C8DABF9B', '2015-05-03 11:15:44', '浙江省台州市天台县', '1', '4.2.2.331023', '1', '4', '天台县', '23', 'TTX', null, '003033010023', null);
INSERT INTO `pa_bmzd` VALUES ('DA60FB6E98844B57914D5E7727F236AD', '2015-05-03 11:15:44', '福建省福州市平潭县', '1', '4.2.2.350128', '1', '4', '平潭县', '28', 'PTX', null, '003035001028', null);
INSERT INTO `pa_bmzd` VALUES ('DA83214F63D84385BCE9FA069B5CCBFE', '2015-05-03 11:15:44', '山西省运城市', '1', '4.2.2.140800', '0', '3', '运城市', '8', 'YCS', null, '003014008', null);
INSERT INTO `pa_bmzd` VALUES ('DA889F5A300B41FFB65CD799E0D4B4D9', '2015-05-03 11:15:44', '河北省衡水市武邑县', '1', '4.2.2.131122', '1', '4', '武邑县', '22', 'WYX', null, '003013011022', null);
INSERT INTO `pa_bmzd` VALUES ('DAA8288F672A4EAB96ECFFE536F456CA', '2015-05-03 11:15:44', '广西壮族自治区贵港市覃塘区', '1', '4.2.2.450804', '1', '4', '覃塘区', '4', 'TTQ', null, '003045008004', null);
INSERT INTO `pa_bmzd` VALUES ('DAAD5F695D4E4279AF9399BB73081FCB', '2015-05-03 11:15:44', '四川省遂宁市', '1', '4.2.2.510900', '0', '3', '遂宁市', '9', 'SNS', null, '003051009', null);
INSERT INTO `pa_bmzd` VALUES ('DAE107531CC14BEA925A818AA2F419C4', '2015-05-03 11:15:44', '福建省宁德市市辖区', '1', '4.2.2.350901', '1', '4', '市辖区', '1', 'SXQ', null, '003035009001', null);
INSERT INTO `pa_bmzd` VALUES ('DAFB59F5E2644A29991C7BAF50A298D4', '2015-05-03 11:15:44', '山西省运城市平陆县', '1', '4.2.2.140829', '1', '4', '平陆县', '29', 'PLX', null, '003014008029', null);
INSERT INTO `pa_bmzd` VALUES ('DB0B4D6CA2094FFD8DE6240EC1123AA5', '2015-05-03 11:15:44', '山西省太原市古交市', '1', '4.2.2.140181', '1', '4', '古交市', '81', 'GJS', null, '003014001081', null);
INSERT INTO `pa_bmzd` VALUES ('DB21AE1B1C914692B8096EED24A4CC08', '2015-05-03 11:15:44', '西藏自治区拉萨市当雄县', '1', '4.2.2.540122', '1', '4', '当雄县', '22', 'DXX', null, '003054001022', null);
INSERT INTO `pa_bmzd` VALUES ('DB43A07135CF49949FB3D1671D131AF2', '2015-05-03 11:15:44', '安徽省', '1', '4.2.2.340000', '0', '2', '安徽省', '34', 'AHS', null, '003034', null);
INSERT INTO `pa_bmzd` VALUES ('DB468CE991DC4711BBA46A7F54BBA508', '2015-05-03 11:15:44', '安徽省合肥市市辖区', '1', '4.2.2.340101', '1', '4', '市辖区', '1', 'SXQ', null, '003034001001', null);
INSERT INTO `pa_bmzd` VALUES ('DB931C5F09AB44DD90C8C65E21D22A93', '2015-05-03 11:15:44', '湖北省武汉市黄陂区', '1', '4.2.2.420116', '1', '4', '黄陂区', '16', 'HPQ', null, '003042001016', null);
INSERT INTO `pa_bmzd` VALUES ('DBB8524C594849868B44078D012725F7', '2015-05-03 11:15:44', '内蒙古自治区锡林郭勒盟正蓝旗', '1', '4.2.2.152530', '1', '4', '正蓝旗', '30', 'ZLQ', null, '003015025030', null);
INSERT INTO `pa_bmzd` VALUES ('DBBE8C6EA6374FFF8EABB1C7C30D1C97', '2015-05-03 11:15:44', '江西省景德镇市珠山区', '1', '4.2.2.360203', '1', '4', '珠山区', '3', 'ZSQ', null, '003036002003', null);
INSERT INTO `pa_bmzd` VALUES ('DBCE275BD75C47EBB03CFDCB02089122', '2015-05-03 11:15:44', '云南省怒江傈僳族自治州', '1', '4.2.2.533300', '0', '3', '怒江傈僳族自治州', '33', 'NJLSZZZZ', null, '003053033', null);
INSERT INTO `pa_bmzd` VALUES ('DBE7A99A49A5438896397C2BEB2AAB29', '2015-05-03 11:15:44', '新疆维吾尔自治区昌吉回族自治州玛纳斯县', '1', '4.2.2.652324', '1', '4', '玛纳斯县', '24', 'MNSX', null, '003065023024', null);
INSERT INTO `pa_bmzd` VALUES ('DBF00F9D8A8A4018A9A7BD00C3A924C1', '2015-05-03 11:15:44', '辽宁省本溪市平山区', '1', '4.2.2.210502', '1', '4', '平山区', '2', 'PSQ', null, '003021005002', null);
INSERT INTO `pa_bmzd` VALUES ('DBF48B8153124DF7999094344DFB60BF', '2015-05-03 11:15:44', '江苏省扬州市江都区', '1', '4.2.2.321088', '1', '4', '江都区', '12', 'JDQ', null, '003032010012', null);
INSERT INTO `pa_bmzd` VALUES ('DC2BF3D0E2594E0A8A8BE2E8414BE4E5', '2015-05-03 11:15:44', '吉林省四平市', '1', '4.2.2.220300', '0', '3', '四平市', '3', 'SPS', null, '003022003', null);
INSERT INTO `pa_bmzd` VALUES ('DC38218893624DEB83380C61882BCD78', '2015-05-03 11:15:44', '新疆维吾尔自治区阿克苏地区', '1', '4.2.2.652900', '0', '3', '阿克苏地区', '29', 'AKSDQ', null, '003065029', null);
INSERT INTO `pa_bmzd` VALUES ('DC3A33CC60BB450299650EAC8A46ED65', '2015-05-03 11:15:44', '云南省楚雄彝族自治州牟定县', '1', '4.2.2.532323', '1', '4', '牟定县', '23', 'MDX', null, '003053023023', null);
INSERT INTO `pa_bmzd` VALUES ('DC3F51B4358640C4816466A302685BED', '2015-05-03 11:15:44', '贵州省安顺市普定县', '1', '4.2.2.520422', '1', '4', '普定县', '22', 'PDX', null, '003052004022', null);
INSERT INTO `pa_bmzd` VALUES ('DC4B521F286E480DAE7ACBE6B5A730C3', '2015-05-03 11:15:44', '河南省驻马店市汝南县', '1', '4.2.2.411727', '1', '4', '汝南县', '27', 'RNX', null, '003041017027', null);
INSERT INTO `pa_bmzd` VALUES ('DC508CEB6CF642E3BFBED0E4DA293CA3', '2015-05-03 11:15:44', '广东省清远市市辖区', '1', '4.2.2.441801', '1', '4', '市辖区', '1', 'SXQ', null, '003044018001', null);
INSERT INTO `pa_bmzd` VALUES ('DC6AA5C773D24D1ABF97CF4A721DFAB6', '2015-05-03 11:15:44', '湖南省株洲市炎陵县', '1', '4.2.2.430225', '1', '4', '炎陵县', '25', 'YLX', null, '003043002025', null);
INSERT INTO `pa_bmzd` VALUES ('DC74DC226150496BA9B9B85FE5864348', '2015-05-03 11:15:44', '四川省广元市市辖区', '1', '4.2.2.510801', '1', '4', '市辖区', '1', 'SXQ', null, '003051008001', null);
INSERT INTO `pa_bmzd` VALUES ('DC8B1A080C4642B4AE394ED48AEF0329', '2015-05-03 11:15:44', '黑龙江省哈尔滨市通河县', '1', '4.2.2.230128', '1', '4', '通河县', '28', 'THX', null, '003023001028', null);
INSERT INTO `pa_bmzd` VALUES ('DC8E71D71DD24BC0866F58E1B616E903', '2015-05-03 11:15:44', '辽宁省沈阳市辽中县', '1', '4.2.2.210122', '1', '4', '辽中县', '22', 'LZX', null, '003021001022', null);
INSERT INTO `pa_bmzd` VALUES ('DC900217625F43F49EFC71CDD894C632', '2015-05-03 11:15:44', '吉林省吉林市昌邑区', '1', '4.2.2.220202', '1', '4', '昌邑区', '2', 'CYQ', null, '003022002002', null);
INSERT INTO `pa_bmzd` VALUES ('DC964ABFD9EB4967AF6AA3593C9AD55E', '2015-05-03 11:15:44', '河北省邯郸市复兴区', '1', '4.2.2.130404', '1', '4', '复兴区', '4', 'FXQ', null, '003013004004', null);
INSERT INTO `pa_bmzd` VALUES ('DCB6122588CD4685BF7B6F045A99BA5B', '2015-05-03 11:15:44', '湖南省娄底市双峰县', '1', '4.2.2.431321', '1', '4', '双峰县', '21', 'SFX', null, '003043013021', null);
INSERT INTO `pa_bmzd` VALUES ('DCBC25FCA3344968AB2A3085E5A4B16B', '2015-05-03 11:15:44', '山西省吕梁市市辖区', '1', '4.2.2.141101', '1', '4', '市辖区', '1', 'SXQ', null, '003014011001', null);
INSERT INTO `pa_bmzd` VALUES ('DCBEE14C71E344909AE33D0CCF999254', '2015-05-03 11:15:44', '云南省临沧市双江拉祜族佤族布朗族傣族自治县', '1', '4.2.2.530925', '1', '4', '双江拉祜族佤族布朗族傣族自治县', '25', 'SJLHZWZBLZDZZZX', null, '003053009025', null);
INSERT INTO `pa_bmzd` VALUES ('DCD2AA035B144DC39D4372FE93FD9F41', '2015-05-03 11:15:44', '贵州省黔东南苗族侗族自治州黄平县', '1', '4.2.2.522622', '1', '4', '黄平县', '22', 'HPX', null, '003052026022', null);
INSERT INTO `pa_bmzd` VALUES ('DCF5A69C47D547FD947731410346248F', '2015-05-03 11:15:44', '湖北省咸宁市嘉鱼县', '1', '4.2.2.421221', '1', '4', '嘉鱼县', '21', 'JYX', null, '003042012021', null);
INSERT INTO `pa_bmzd` VALUES ('DCFB86B9FEE24DCBB814FD3B3D376A4A', '2015-05-03 11:15:44', '重庆市县城口县', '1', '4.2.2.500229', '1', '4', '城口县', '29', 'CKX', null, '003050002029', null);
INSERT INTO `pa_bmzd` VALUES ('DD291B05F04C4C1580A67F42AA485A15', '2015-05-03 11:15:44', '新疆维吾尔自治区和田地区和田县', '1', '4.2.2.653221', '1', '4', '和田县', '21', 'HTX', null, '003065032021', null);
INSERT INTO `pa_bmzd` VALUES ('DD39D352C8FE49F0AD0C50649538CF5F', '2015-05-03 11:15:44', '广东省阳江市', '1', '4.2.2.441700', '0', '3', '阳江市', '17', 'YJS', null, '003044017', null);
INSERT INTO `pa_bmzd` VALUES ('DD3ED10546364C448062576DB52CB274', '2015-05-03 11:15:44', '云南省昆明市盘龙区', '1', '4.2.2.530103', '1', '4', '盘龙区', '3', 'PLQ', null, '003053001003', null);
INSERT INTO `pa_bmzd` VALUES ('DD44EE2AEAAA43D99466A75E8C40D999', '2015-05-03 11:15:44', '安徽省芜湖市繁昌县', '1', '4.2.2.340222', '1', '4', '繁昌县', '22', 'PCX', null, '003034002022', null);
INSERT INTO `pa_bmzd` VALUES ('DD4F3D5C7D4843068EB2BE28D6ACDC76', '2015-05-03 11:15:44', '内蒙古自治区通辽市库伦旗', '1', '4.2.2.150524', '1', '4', '库伦旗', '24', 'KLQ', null, '003015005024', null);
INSERT INTO `pa_bmzd` VALUES ('DD62B350DC8E43F391CD96CCCA79B935', '2015-05-03 11:15:44', '山东省东营市河口区', '1', '4.2.2.370503', '1', '4', '河口区', '3', 'HKQ', null, '003037005003', null);
INSERT INTO `pa_bmzd` VALUES ('DD683A42E4F24F5582B38DE83E178F3E', '2015-05-03 11:15:44', '四川省乐山市犍为县', '1', '4.2.2.511123', '1', '4', '犍为县', '23', 'QWX', null, '003051011023', null);
INSERT INTO `pa_bmzd` VALUES ('DD74EE671DA64AB3A68D6089858ABEF1', '2015-05-03 11:15:44', '青海省玉树藏族自治州杂多县', '1', '4.2.2.632722', '1', '4', '杂多县', '22', 'ZDX', null, '003063027022', null);
INSERT INTO `pa_bmzd` VALUES ('DDB62E4E4A7B4721917ABC8F81B74E60', '2015-05-03 11:15:44', '贵州省贵阳市清镇市', '1', '4.2.2.520181', '1', '4', '清镇市', '81', 'QZS', null, '003052001081', null);
INSERT INTO `pa_bmzd` VALUES ('DDB762348C4F475BA3644036A62CD839', '2015-05-03 11:15:44', '山东省潍坊市青州市', '1', '4.2.2.370781', '1', '4', '青州市', '81', 'QZS', null, '003037007081', null);
INSERT INTO `pa_bmzd` VALUES ('DDE0E9BA68E44C068F71FACC99913FD4', '2015-05-03 11:15:44', '新疆维吾尔自治区阿克苏地区柯坪县', '1', '4.2.2.652929', '1', '4', '柯坪县', '29', 'KPX', null, '003065029029', null);
INSERT INTO `pa_bmzd` VALUES ('DE11338E24864849A2576A0E1C475607', '2015-05-03 11:15:44', '辽宁省朝阳市', '1', '4.2.2.211300', '0', '3', '朝阳市', '13', 'ZYS', null, '003021013', null);
INSERT INTO `pa_bmzd` VALUES ('DE2E906DD5E5449A9797DB6290A8C816', '2015-05-03 11:15:44', '黑龙江省哈尔滨市', '1', '4.2.2.230100', '0', '3', '哈尔滨市', '1', 'HEBS', null, '003023001', null);
INSERT INTO `pa_bmzd` VALUES ('DE39E830CDB44D09B1B97E137819611F', '2015-05-03 11:15:44', '贵州省黔东南苗族侗族自治州台江县', '1', '4.2.2.522630', '1', '4', '台江县', '30', 'TJX', null, '003052026030', null);
INSERT INTO `pa_bmzd` VALUES ('DE4248D7B3204E3DBFC14465CF19BEB7', '2015-05-03 11:15:44', '甘肃省临夏回族自治州东乡族自治县', '1', '4.2.2.622926', '1', '4', '东乡族自治县', '26', 'DXZZZX', null, '003062029026', null);
INSERT INTO `pa_bmzd` VALUES ('DE622156EB044341AADC67B0B77424D3', '2015-05-03 11:15:44', '黑龙江省佳木斯市汤原县', '1', '4.2.2.230828', '1', '4', '汤原县', '28', 'TYX', null, '003023008028', null);
INSERT INTO `pa_bmzd` VALUES ('DE83DED19AC049B3BBD0D338933F54CC', '2015-05-03 11:15:44', '福建省宁德市柘荣县', '1', '4.2.2.350926', '1', '4', '柘荣县', '26', 'ZRX', null, '003035009026', null);
INSERT INTO `pa_bmzd` VALUES ('DE9012A8014C4B928DD7EB49CD871CC1', '2015-05-03 11:15:44', '安徽省芜湖市', '1', '4.2.2.340200', '0', '3', '芜湖市', '2', 'WHS', null, '003034002', null);
INSERT INTO `pa_bmzd` VALUES ('DEA1D3F4E9D34B6C8EA38FA713E9A2E3', '2015-05-03 11:15:44', '北京市市辖区海淀区', '1', '4.2.2.110108', '1', '4', '海淀区', '8', 'HDQ', null, '003011001008', null);
INSERT INTO `pa_bmzd` VALUES ('DEB4E4F169734A3C947C35BF4A0B59AE', '2015-05-03 11:15:44', '河北省邯郸市肥乡县', '1', '4.2.2.130428', '1', '4', '肥乡县', '28', 'FXX', null, '003013004028', null);
INSERT INTO `pa_bmzd` VALUES ('DEC2E37FEB284E5B926AA4117AF98824', '2015-05-03 11:15:44', '湖北省宜昌市夷陵区', '1', '4.2.2.420506', '1', '4', '夷陵区', '6', 'YLQ', null, '003042005006', null);
INSERT INTO `pa_bmzd` VALUES ('DECB9595C5F244879524D95A808D8A64', '2015-05-03 11:15:44', '吉林省延边朝鲜族自治州汪清县', '1', '4.2.2.222424', '1', '4', '汪清县', '24', 'WQX', null, '003022024024', null);
INSERT INTO `pa_bmzd` VALUES ('E6DAC4B41BAC4469BE23B57212F9EC0C', '2015-05-03 11:15:44', '浙江省杭州市富阳市', '1', '4.2.2.330183', '1', '4', '富阳市', '83', 'FYS', null, '003033001083', null);
INSERT INTO `pa_bmzd` VALUES ('E6F3FB1A2D564249B0439EB8A60ED815', '2015-05-03 11:15:44', '青海省海西蒙古族藏族自治州德令哈市', '1', '4.2.2.632802', '1', '4', '德令哈市', '2', 'DLHS', null, '003063028002', null);
INSERT INTO `pa_bmzd` VALUES ('E6F4B096445144D3BE1546950411E063', '2015-05-03 11:15:44', '山西省吕梁市临县', '1', '4.2.2.141124', '1', '4', '临县', '24', 'LX', null, '003014011024', null);
INSERT INTO `pa_bmzd` VALUES ('E70E318136AC424887FF7E7F210BCDAF', '2015-05-03 11:15:44', '西藏自治区拉萨市林周县', '1', '4.2.2.540121', '1', '4', '林周县', '21', 'LZX', null, '003054001021', null);
INSERT INTO `pa_bmzd` VALUES ('E7261A329CCC493884C13A6776D89349', '2015-05-03 11:15:44', '四川省攀枝花市东区', '1', '4.2.2.510402', '1', '4', '东区', '2', 'DQ', null, '003051004002', null);
INSERT INTO `pa_bmzd` VALUES ('E73A53661FCD44DB8696F58FBDC1383D', '2015-05-03 11:15:44', '广西壮族自治区防城港市港口区', '1', '4.2.2.450602', '1', '4', '港口区', '2', 'GKQ', null, '003045006002', null);
INSERT INTO `pa_bmzd` VALUES ('E7417B2E1A3147288C63A9E6CC503120', '2015-05-03 11:15:44', '辽宁省盘锦市兴隆台区', '1', '4.2.2.211103', '1', '4', '兴隆台区', '3', 'XLTQ', null, '003021011003', null);
INSERT INTO `pa_bmzd` VALUES ('E7517D131B0F4E82ABCEA4D31C1B6A0D', '2015-05-03 11:15:44', '辽宁省鞍山市台安县', '1', '4.2.2.210321', '1', '4', '台安县', '21', 'TAX', null, '003021003021', null);
INSERT INTO `pa_bmzd` VALUES ('E769983E13484FAD8F71C74785D015F4', '2015-05-03 11:15:44', '广西壮族自治区河池市大化瑶族自治县', '1', '4.2.2.451229', '1', '4', '大化瑶族自治县', '29', 'DHYZZZX', null, '003045012029', null);
INSERT INTO `pa_bmzd` VALUES ('E771796A5C184B1591210BCEBC62FF39', '2015-05-03 11:15:44', '山东省菏泽市鄄城县', '1', '4.2.2.371726', '1', '4', '鄄城县', '26', 'JCX', null, '003037017026', null);
INSERT INTO `pa_bmzd` VALUES ('E77D0663CFEF48B9A3A2AC72A82FF2C4', '2015-05-03 11:15:44', '云南省红河哈尼族彝族自治州建水县', '1', '4.2.2.532524', '1', '4', '建水县', '24', 'JSX', null, '003053025024', null);
INSERT INTO `pa_bmzd` VALUES ('E784CD4C6785480EBABAA83FFF3FA76F', '2015-05-03 11:15:44', '新疆维吾尔自治区喀什地区疏附县', '1', '4.2.2.653121', '1', '4', '疏附县', '21', 'SFX', null, '003065031021', null);
INSERT INTO `pa_bmzd` VALUES ('E7959EA16BD449E7B5E7A2D920511765', '2015-05-03 11:15:44', '湖北省襄阳市襄州区', '1', '4.2.2.420607', '1', '4', '襄州区', '7', 'XZQ', null, '003042006007', null);
INSERT INTO `pa_bmzd` VALUES ('E7C531BADA664AA792FDBD0E5D361F58', '2015-05-03 11:15:44', '江苏省无锡市惠山区', '1', '4.2.2.320206', '1', '4', '惠山区', '6', 'HSQ', null, '003032002006', null);
INSERT INTO `pa_bmzd` VALUES ('E7C71ABA1CBC49B1B9F0FEE07692A0AB', '2015-05-03 11:15:44', '湖北省咸宁市通城县', '1', '4.2.2.421222', '1', '4', '通城县', '22', 'TCX', null, '003042012022', null);
INSERT INTO `pa_bmzd` VALUES ('E7DD3BC297CD4239BE1A6546E8CF0990', '2015-05-03 11:15:44', '山西省运城市万荣县', '1', '4.2.2.140822', '1', '4', '万荣县', '22', 'WRX', null, '003014008022', null);
INSERT INTO `pa_bmzd` VALUES ('E7E2908F286D48928F8076ED75FFB77F', '2015-05-03 11:15:44', '贵州省黔南布依族苗族自治州龙里县', '1', '4.2.2.522730', '1', '4', '龙里县', '30', 'LLX', null, '003052027030', null);
INSERT INTO `pa_bmzd` VALUES ('E7E61BDFCC494AB1B548EAA8201DB276', '2015-05-03 11:15:44', '上海市市辖区奉贤区', '1', '4.2.2.310120', '1', '4', '奉贤区', '20', 'FXQ', null, '003031001020', null);
INSERT INTO `pa_bmzd` VALUES ('E7F3ABBD0A014C6EAE149E9938C248FE', '2015-05-03 11:15:44', '辽宁省鞍山市市辖区', '1', '4.2.2.210301', '1', '4', '市辖区', '1', 'SXQ', null, '003021003001', null);
INSERT INTO `pa_bmzd` VALUES ('E81147488C8F4A1EA4CC0021438EB63E', '2015-05-03 11:15:44', '辽宁省鞍山市', '1', '4.2.2.210300', '0', '3', '鞍山市', '3', 'ASS', null, '003021003', null);
INSERT INTO `pa_bmzd` VALUES ('E813CE5D6BCD451980CCB62F45A647EA', '2015-05-03 11:15:44', '河南省洛阳市偃师市', '1', '4.2.2.410381', '1', '4', '偃师市', '81', 'YSS', null, '003041003081', null);
INSERT INTO `pa_bmzd` VALUES ('E81D8872BFEB41549D43185FDA41F94B', '2015-05-03 11:15:44', '湖南省怀化市新晃侗族自治县', '1', '4.2.2.431227', '1', '4', '新晃侗族自治县', '27', 'XHTZZZX', null, '003043012027', null);
INSERT INTO `pa_bmzd` VALUES ('E82113E83B0A4394B76AF887681F323A', '2015-05-03 11:15:44', '广东省江门市台山市', '1', '4.2.2.440781', '1', '4', '台山市', '81', 'TSS', null, '003044007081', null);
INSERT INTO `pa_bmzd` VALUES ('E825563677B9490BA4CF9AA896EDD763', '2015-05-03 11:15:44', '山西省吕梁市中阳县', '1', '4.2.2.141129', '1', '4', '中阳县', '29', 'ZYX', null, '003014011029', null);
INSERT INTO `pa_bmzd` VALUES ('E831A50684E846EF8E9E05F0446E1074', '2015-05-03 11:15:44', '福建省福州市鼓楼区', '1', '4.2.2.350102', '1', '4', '鼓楼区', '2', 'GLQ', null, '003035001002', null);
INSERT INTO `pa_bmzd` VALUES ('E847FCD6C7964ACFA182CB6F7B8CF5EC', '2015-05-03 11:15:44', '云南省昆明市官渡区', '1', '4.2.2.530111', '1', '4', '官渡区', '11', 'GDQ', null, '003053001011', null);
INSERT INTO `pa_bmzd` VALUES ('E872277B8F3A498A9D8CE3529B716A6E', '2015-05-03 11:15:44', '江苏省徐州市云龙区', '1', '4.2.2.320303', '1', '4', '云龙区', '3', 'YLQ', null, '003032003003', null);
INSERT INTO `pa_bmzd` VALUES ('E8AB3571B88243E3970EC38B1B84123E', '2015-05-03 11:15:44', '山西省晋中市昔阳县', '1', '4.2.2.140724', '1', '4', '昔阳县', '24', 'XYX', null, '003014007024', null);
INSERT INTO `pa_bmzd` VALUES ('E8B28BCFA5044836A4501957B3A7A23E', '2015-05-03 11:15:44', '陕西省西安市莲湖区', '1', '4.2.2.610104', '1', '4', '莲湖区', '4', 'LHQ', null, '003061001004', null);
INSERT INTO `pa_bmzd` VALUES ('E8B63AE527BE47D3B0FD3DFCAC5BA576', '2015-05-03 11:15:44', '河北省保定市唐县', '1', '4.2.2.130627', '1', '4', '唐县', '27', 'TX', null, '003013006027', null);
INSERT INTO `pa_bmzd` VALUES ('E8CF860E82824763A36B39259C686F99', '2015-05-03 11:15:44', '黑龙江省齐齐哈尔市克山县', '1', '4.2.2.230229', '1', '4', '克山县', '29', 'KSX', null, '003023002029', null);
INSERT INTO `pa_bmzd` VALUES ('E8D3652DAB5E414DAD14A44AF1BD3402', '2015-05-03 11:15:44', '四川省资阳市', '1', '4.2.2.512000', '0', '3', '资阳市', '20', 'ZYS', null, '003051020', null);
INSERT INTO `pa_bmzd` VALUES ('E8D8E540DAA446139E60AC38EA1F0F6B', '2015-05-03 11:15:44', '广西壮族自治区北海市市辖区', '1', '4.2.2.450501', '1', '4', '市辖区', '1', 'SXQ', null, '003045005001', null);
INSERT INTO `pa_bmzd` VALUES ('E8D988211C8C45F381AF18938D74E266', '2015-05-03 11:15:44', '浙江省湖州市长兴县', '1', '4.2.2.330522', '1', '4', '长兴县', '22', 'ZXX', null, '003033005022', null);
INSERT INTO `pa_bmzd` VALUES ('E8E3FE896FF24DEEA21F8A5BA4D14546', '2015-05-03 11:15:44', '湖南省永州市祁阳县', '1', '4.2.2.431121', '1', '4', '祁阳县', '21', 'QYX', null, '003043011021', null);
INSERT INTO `pa_bmzd` VALUES ('E8E6798B183447CF91139DCCC3CC9765', '2015-05-03 11:15:44', '河南省新乡市卫滨区', '1', '4.2.2.410703', '1', '4', '卫滨区', '3', 'WBQ', null, '003041007003', null);
INSERT INTO `pa_bmzd` VALUES ('E8FD7DE7AAEE40F8AA2E6B84A55E8D47', '2015-05-03 11:15:44', '安徽省马鞍山市和县', '1', '4.2.2.340506', '1', '4', '和县', '23', 'HX', null, '003034005023', null);
INSERT INTO `pa_bmzd` VALUES ('E90218CCA9834352A004E9FD4519C398', '2015-05-03 11:15:44', '甘肃省酒泉市金塔县', '1', '4.2.2.620921', '1', '4', '金塔县', '21', 'JTX', null, '003062009021', null);
INSERT INTO `pa_bmzd` VALUES ('E90A8179195647CD98D5A325AC62AB6E', '2015-05-03 11:15:44', '江西省吉安市遂川县', '1', '4.2.2.360827', '1', '4', '遂川县', '27', 'SCX', null, '003036008027', null);
INSERT INTO `pa_bmzd` VALUES ('E91CEA2979BE4F088CF1A5D6723A750E', '2015-05-03 11:15:44', '四川省雅安市荥经县', '1', '4.2.2.511822', '1', '4', '荥经县', '22', 'YJX', null, '003051018022', null);
INSERT INTO `pa_bmzd` VALUES ('E921BBD561174826BEE1BD3242E07C12', '2015-05-03 11:15:44', '云南省昆明市东川区', '1', '4.2.2.530113', '1', '4', '东川区', '13', 'DCQ', null, '003053001013', null);
INSERT INTO `pa_bmzd` VALUES ('E9386476179F4C6989F96B8A6DD31E8D', '2015-05-03 11:15:44', '山东省青岛市黄岛区', '1', '4.2.2.370211', '1', '4', '黄岛区', '11', 'HDQ', null, '003037002011', null);
INSERT INTO `pa_bmzd` VALUES ('E974F75DF0C5401C91F79A73FF465747', '2015-05-03 11:15:44', '河北省沧州市吴桥县', '1', '4.2.2.130928', '1', '4', '吴桥县', '28', 'WQX', null, '003013009028', null);
INSERT INTO `pa_bmzd` VALUES ('E97ADC8E78244F7FA78C711162B26241', '2015-05-03 11:15:44', '云南省德宏傣族景颇族自治州', '1', '4.2.2.533100', '0', '3', '德宏傣族景颇族自治州', '31', 'DHDZJPZZZZ', null, '003053031', null);
INSERT INTO `pa_bmzd` VALUES ('E9BF336047B246F2B244B9748AFD9F8E', '2015-05-03 11:15:44', '贵州省遵义市正安县', '1', '4.2.2.520324', '1', '4', '正安县', '24', 'ZAX', null, '003052003024', null);
INSERT INTO `pa_bmzd` VALUES ('E9CE64E27F204BB88C0AB4F1665BBCF8', '2015-05-03 11:15:44', '浙江省台州市仙居县', '1', '4.2.2.331024', '1', '4', '仙居县', '24', 'XJX', null, '003033010024', null);
INSERT INTO `pa_bmzd` VALUES ('DED2B4D9A2EC4F89AA306289BE68D06F', '2015-05-03 11:15:44', '云南省普洱市景谷傣族彝族自治县', '1', '4.2.2.530824', '1', '4', '景谷傣族彝族自治县', '24', 'JYDZYZZZX', null, '003053008024', null);
INSERT INTO `pa_bmzd` VALUES ('DED36AF0FAAE4B1A8C825D7EBCB1B19E', '2015-05-03 11:15:44', '湖南省湘潭市湘乡市', '1', '4.2.2.430381', '1', '4', '湘乡市', '81', 'XXS', null, '003043003081', null);
INSERT INTO `pa_bmzd` VALUES ('DF24BA6578044FFFB8C5CC40D915EAFA', '2015-05-03 11:15:44', '广西壮族自治区来宾市象州县', '1', '4.2.2.451322', '1', '4', '象州县', '22', 'XZX', null, '003045013022', null);
INSERT INTO `pa_bmzd` VALUES ('DF2804C2523B4871B881CB9FBDD529B0', '2015-05-03 11:15:44', '江苏省盐城市', '1', '4.2.2.320900', '0', '3', '盐城市', '9', 'YCS', null, '003032009', null);
INSERT INTO `pa_bmzd` VALUES ('DF32F9B428BB4749A7536FF00BC9835C', '2015-05-03 11:15:44', '山东省青岛市莱西市', '1', '4.2.2.370285', '1', '4', '莱西市', '85', 'LXS', null, '003037002085', null);
INSERT INTO `pa_bmzd` VALUES ('DF3783D1513A417FBA9206DBC2BF7CC6', '2015-05-03 11:15:44', '广东省江门市', '1', '4.2.2.440700', '0', '3', '江门市', '7', 'JMS', null, '003044007', null);
INSERT INTO `pa_bmzd` VALUES ('DF3B74B850684973B8FBAB4FE7AE8B32', '2015-05-03 11:15:44', '河南省洛阳市汝阳县', '1', '4.2.2.410326', '1', '4', '汝阳县', '26', 'RYX', null, '003041003026', null);
INSERT INTO `pa_bmzd` VALUES ('DF40AA2A8F9C45B4862A1088F3674D7E', '2015-05-03 11:15:44', '辽宁省铁岭市市辖区', '1', '4.2.2.211201', '1', '4', '市辖区', '1', 'SXQ', null, '003021012001', null);
INSERT INTO `pa_bmzd` VALUES ('DF4C3D86F1534D8CA0D8E64140A84FA4', '2015-05-03 11:15:44', '浙江省温州市市辖区', '1', '4.2.2.330301', '1', '4', '市辖区', '1', 'SXQ', null, '003033003001', null);
INSERT INTO `pa_bmzd` VALUES ('DF52898BBB7344C0B81D600637956468', '2015-05-03 11:15:44', '内蒙古自治区赤峰市林西县', '1', '4.2.2.150424', '1', '4', '林西县', '24', 'LXX', null, '003015004024', null);
INSERT INTO `pa_bmzd` VALUES ('DF58F1268A95477197C5B4493005BD67', '2015-05-03 11:15:44', '陕西省渭南市白水县', '1', '4.2.2.610527', '1', '4', '白水县', '27', 'BSX', null, '003061005027', null);
INSERT INTO `pa_bmzd` VALUES ('DF6EB8E3CDF6470DBBFD15B5918D8D07', '2015-05-03 11:15:44', '辽宁省盘锦市双台子区', '1', '4.2.2.211102', '1', '4', '双台子区', '2', 'STZQ', null, '003021011002', null);
INSERT INTO `pa_bmzd` VALUES ('DF769E1B878B4489824146592DE62D0D', '2015-05-03 11:15:44', '内蒙古自治区鄂尔多斯市伊金霍洛旗', '1', '4.2.2.150627', '1', '4', '伊金霍洛旗', '27', 'YJHLQ', null, '003015006027', null);
INSERT INTO `pa_bmzd` VALUES ('DF8698A965D346EB888994085F659889', '2015-05-03 11:15:44', '湖南省郴州市', '1', '4.2.2.431000', '0', '3', '郴州市', '10', 'CZS', null, '003043010', null);
INSERT INTO `pa_bmzd` VALUES ('DF890801818A41968074CDA13090FFD1', '2015-05-03 11:15:44', '新疆维吾尔自治区伊犁哈萨克自治州昭苏县', '1', '4.2.2.654026', '1', '4', '昭苏县', '26', 'ZSX', null, '003065040026', null);
INSERT INTO `pa_bmzd` VALUES ('DFA297BFA3554201A0A1EBF828121AE6', '2015-05-03 11:15:44', '山西省晋中市寿阳县', '1', '4.2.2.140725', '1', '4', '寿阳县', '25', 'SYX', null, '003014007025', null);
INSERT INTO `pa_bmzd` VALUES ('DFCC86AFAF41481F9387741858CF9750', '2015-05-03 11:15:44', '云南省保山市昌宁县', '1', '4.2.2.530524', '1', '4', '昌宁县', '24', 'CNX', null, '003053005024', null);
INSERT INTO `pa_bmzd` VALUES ('DFD411DBE9854F0E8D94F9FFDB91B638', '2015-05-03 11:15:44', '辽宁省葫芦岛市建昌县', '1', '4.2.2.211422', '1', '4', '建昌县', '22', 'JCX', null, '003021014022', null);
INSERT INTO `pa_bmzd` VALUES ('DFDE1BDD540243828CB6464193A8DC4A', '2015-05-03 11:15:44', '吉林省白城市洮北区', '1', '4.2.2.220802', '1', '4', '洮北区', '2', 'TBQ', null, '003022008002', null);
INSERT INTO `pa_bmzd` VALUES ('DFFE53B23C2144EDA8EBEA41BE4CC762', '2015-05-03 11:15:44', '黑龙江省牡丹江市', '1', '4.2.2.231000', '0', '3', '牡丹江市', '10', 'MDJS', null, '003023010', null);
INSERT INTO `pa_bmzd` VALUES ('E0022354EC4F466782A9EAE57A503B77', '2015-05-03 11:15:44', '河南省周口市鹿邑县', '1', '4.2.2.411628', '1', '4', '鹿邑县', '28', 'LYX', null, '003041016028', null);
INSERT INTO `pa_bmzd` VALUES ('E02C20D5A8B7444C9C246B1EC8A9B529', '2015-05-03 11:15:44', '甘肃省金昌市金川区', '1', '4.2.2.620302', '1', '4', '金川区', '2', 'JCQ', null, '003062003002', null);
INSERT INTO `pa_bmzd` VALUES ('E03DFF2C2C924D8780F40E1D256C3D8F', '2015-05-03 11:15:44', '云南省普洱市孟连傣族拉祜族佤族自治县', '1', '4.2.2.530827', '1', '4', '孟连傣族拉祜族佤族自治县', '27', 'MLDZLHZWZZZX', null, '003053008027', null);
INSERT INTO `pa_bmzd` VALUES ('E043B6328F3C45E4A0052C85AFCE2FB8', '2015-05-03 11:15:44', '辽宁省大连市金州区', '1', '4.2.2.210213', '1', '4', '金州区', '13', 'JZQ', null, '003021002013', null);
INSERT INTO `pa_bmzd` VALUES ('E06D98BA4A7B4644B8A17A5F77C712EB', '2015-05-03 11:15:44', '江苏省连云港市灌云县', '1', '4.2.2.320723', '1', '4', '灌云县', '23', 'GYX', null, '003032007023', null);
INSERT INTO `pa_bmzd` VALUES ('E080337B5F244DFDA361FA05E9C6C6E3', '2015-05-03 11:15:44', '海南省省直辖县级行政区划澄迈县', '1', '4.2.2.469027', '1', '4', '澄迈县', '23', 'DMX', null, '003046090023', null);
INSERT INTO `pa_bmzd` VALUES ('E083B740E9C94468A15DD60C3388C6BC', '2015-05-03 11:15:44', '广东省汕尾市海丰县', '1', '4.2.2.441521', '1', '4', '海丰县', '21', 'HFX', null, '003044015021', null);
INSERT INTO `pa_bmzd` VALUES ('E09AE993CD704792A9784777A8C2BD4D', '2015-05-03 11:15:44', '青海省海西蒙古族藏族自治州乌兰县', '1', '4.2.2.632821', '1', '4', '乌兰县', '21', 'WLX', null, '003063028021', null);
INSERT INTO `pa_bmzd` VALUES ('E0B8BA96C5854FE8AAD34003E73476A3', '2015-05-03 11:15:44', '西藏自治区日喀则地区白朗县', '1', '4.2.2.542329', '1', '4', '白朗县', '29', 'BLX', null, '003054023029', null);
INSERT INTO `pa_bmzd` VALUES ('E0BACAC97DDF479F9B8A5465F90B0D76', '2015-05-03 11:15:44', '云南省昆明市安宁市', '1', '4.2.2.530181', '1', '4', '安宁市', '81', 'ANS', null, '003053001081', null);
INSERT INTO `pa_bmzd` VALUES ('E0F64A93172048E0A4961EBB6A6F3BAA', '2015-05-03 11:15:44', '江西省赣州市崇义县', '1', '4.2.2.360725', '1', '4', '崇义县', '25', 'CYX', null, '003036007025', null);
INSERT INTO `pa_bmzd` VALUES ('E11B2B320AEA4E13930F8D787A481E4A', '2015-05-03 11:15:44', '广西壮族自治区桂林市荔蒲县', '1', '4.2.2.450331', '1', '4', '荔蒲县', '31', 'LPX', null, '003045003031', null);
INSERT INTO `pa_bmzd` VALUES ('E1243D6380604C86A6BF14C0D6B1ECC5', '2015-05-03 11:15:44', '湖南省永州市新田县', '1', '4.2.2.431128', '1', '4', '新田县', '28', 'XTX', null, '003043011028', null);
INSERT INTO `pa_bmzd` VALUES ('E12D97D0774F4AD0B435F86B03B222FB', '2015-05-03 11:15:44', '湖北省荆州市沙市区', '1', '4.2.2.421002', '1', '4', '沙市区', '2', 'SSQ', null, '003042010002', null);
INSERT INTO `pa_bmzd` VALUES ('E143E57FE27B48C8B8E797853E01D29D', '2015-05-03 11:15:44', '四川省阿坝藏族羌族自治州九寨沟县', '1', '4.2.2.513225', '1', '4', '九寨沟县', '25', 'JZGX', null, '003051032025', null);
INSERT INTO `pa_bmzd` VALUES ('E154A6448187404C837A9C0CDB5FC6A0', '2015-05-03 11:15:44', '广东省佛山市南海区', '1', '4.2.2.440605', '1', '4', '南海区', '5', 'NHQ', null, '003044006005', null);
INSERT INTO `pa_bmzd` VALUES ('E164F6C2CDFB40FA94420B23F7005C93', '2015-05-03 11:15:44', '黑龙江省牡丹江市西安区', '1', '4.2.2.231005', '1', '4', '西安区', '5', 'XAQ', null, '003023010005', null);
INSERT INTO `pa_bmzd` VALUES ('E16FC21D557F4ACBAEF8B1596D803CCB', '2015-05-03 11:15:44', '云南省红河哈尼族彝族自治州元阳县', '1', '4.2.2.532528', '1', '4', '元阳县', '28', 'YYX', null, '003053025028', null);
INSERT INTO `pa_bmzd` VALUES ('E17D173FF16F491F83257E28F54E6AD7', '2015-05-03 11:15:44', '安徽省淮北市烈山区', '1', '4.2.2.340604', '1', '4', '烈山区', '4', 'LSQ', null, '003034006004', null);
INSERT INTO `pa_bmzd` VALUES ('E1863305D8D7455C9A6B2FCCEEC92586', '2015-05-03 11:15:44', '江苏省扬州市广陵区', '1', '4.2.2.321002', '1', '4', '广陵区', '2', 'GLQ', null, '003032010002', null);
INSERT INTO `pa_bmzd` VALUES ('E189B5EB52C64769A5BE12A56F470AA9', '2015-05-03 11:15:44', '西藏自治区拉萨市尼木县', '1', '4.2.2.540123', '1', '4', '尼木县', '23', 'NMX', null, '003054001023', null);
INSERT INTO `pa_bmzd` VALUES ('E1952C8552A446BDA945D90518C1C109', '2015-05-03 11:15:44', '广东省广州市萝岗区', '1', '4.2.2.440116', '1', '4', '萝岗区', '16', 'LGQ', null, '003044001016', null);
INSERT INTO `pa_bmzd` VALUES ('E1A80BB13F5B4B789BE4632C5DDD1EBF', '2015-05-03 11:15:44', '山东省济南市天桥区', '1', '4.2.2.370105', '1', '4', '天桥区', '5', 'TQQ', null, '003037001005', null);
INSERT INTO `pa_bmzd` VALUES ('E1DB38F70FF64E3D97A1320BFB0A84C7', '2015-05-03 11:15:44', '新疆维吾尔自治区乌鲁木齐市达坂城区', '1', '4.2.2.650107', '1', '4', '达坂城区', '7', 'DBCQ', null, '003065001007', null);
INSERT INTO `pa_bmzd` VALUES ('E1EB7F92375B4AF6BD527174AEEEE478', '2015-05-03 11:15:44', '甘肃省天水市武山县', '1', '4.2.2.620524', '1', '4', '武山县', '24', 'WSX', null, '003062005024', null);
INSERT INTO `pa_bmzd` VALUES ('E1EBFF90AE774456BBE13489C669F0A4', '2015-05-03 11:15:44', '山东省青岛市平度市', '1', '4.2.2.370283', '1', '4', '平度市', '83', 'PDS', null, '003037002083', null);
INSERT INTO `pa_bmzd` VALUES ('E1F6DC7933A24C2CA22FA44390CB5E68', '2015-05-03 11:15:44', '江西省宜春市市辖区', '1', '4.2.2.360901', '1', '4', '市辖区', '1', 'SXQ', null, '003036009001', null);
INSERT INTO `pa_bmzd` VALUES ('E204314DC72446E88DAD7C02E7C58924', '2015-05-03 11:15:44', '新疆维吾尔自治区塔城地区托里县', '1', '4.2.2.654224', '1', '4', '托里县', '24', 'TLX', null, '003065042024', null);
INSERT INTO `pa_bmzd` VALUES ('E208C60427E34C0A8D8A24E923504829', '2015-05-03 11:15:44', '云南省玉溪市红塔区', '1', '4.2.2.530402', '1', '4', '红塔区', '2', 'HTQ', null, '003053004002', null);
INSERT INTO `pa_bmzd` VALUES ('E22B06581DA245D4B6E170206A231944', '2015-05-03 11:15:44', '天津市市辖区武清区', '1', '4.2.2.120114', '1', '4', '武清区', '14', 'WQQ', null, '003012001014', null);
INSERT INTO `pa_bmzd` VALUES ('E235A9DE54AA43A49498131286688668', '2015-05-03 11:15:44', '北京市市辖区大兴区', '1', '4.2.2.110115', '1', '4', '大兴区', '15', 'DXQ', null, '003011001015', null);
INSERT INTO `pa_bmzd` VALUES ('E25BFC8AE07B4BC1BD8AA9A698FD33CB', '2015-05-03 11:15:44', '广西壮族自治区桂林市永福县', '1', '4.2.2.450326', '1', '4', '永福县', '26', 'YFX', null, '003045003026', null);
INSERT INTO `pa_bmzd` VALUES ('E278F40DA7C84C14BAC16EDA18D01BA1', '2015-05-03 11:15:44', '贵州省铜仁市玉屏侗族自治县', '1', '4.2.2.522223', '1', '4', '玉屏侗族自治县', '22', 'YPTZZZX', null, '003052006022', null);
INSERT INTO `pa_bmzd` VALUES ('E2A7396A820042AAB2F01C8E955FEF56', '2015-05-03 11:15:44', '辽宁省沈阳市康平县', '1', '4.2.2.210123', '1', '4', '康平县', '23', 'KPX', null, '003021001023', null);
INSERT INTO `pa_bmzd` VALUES ('E2AAA2EE79864AD197426040225CA93F', '2015-05-03 11:15:44', '山西省晋中市和顺县', '1', '4.2.2.140723', '1', '4', '和顺县', '23', 'HSX', null, '003014007023', null);
INSERT INTO `pa_bmzd` VALUES ('E2B466B5C0AF4C14B8CEEDC72A393A76', '2015-05-03 11:15:44', '安徽省合肥市长丰县', '1', '4.2.2.340121', '1', '4', '长丰县', '21', 'ZFX', null, '003034001021', null);
INSERT INTO `pa_bmzd` VALUES ('E2B9AC2F7BFD4A69A0D22DE0603150B4', '2015-05-03 11:15:44', '甘肃省陇南市', '1', '4.2.2.621200', '0', '3', '陇南市', '12', 'LNS', null, '003062012', null);
INSERT INTO `pa_bmzd` VALUES ('E2BB624A82FA45A78841C02EE376550A', '2015-05-03 11:15:44', '湖南省岳阳市华容县', '1', '4.2.2.430623', '1', '4', '华容县', '23', 'HRX', null, '003043006023', null);
INSERT INTO `pa_bmzd` VALUES ('E2BF668F3C074AAABEEBCA5D5589F59B', '2015-05-03 11:15:44', '四川省广元市剑阁县', '1', '4.2.2.510823', '1', '4', '剑阁县', '23', 'JGX', null, '003051008023', null);
INSERT INTO `pa_bmzd` VALUES ('E2C34915A3B8488B92A49CB110A07355', '2015-05-03 11:15:44', '安徽省宿州市市辖区', '1', '4.2.2.341301', '1', '4', '市辖区', '1', 'SXQ', null, '003034013001', null);
INSERT INTO `pa_bmzd` VALUES ('E2C6415CD2EF4BBCB75C738DF378CBFF', '2015-05-03 11:15:44', '河北省张家口市万全县', '1', '4.2.2.130729', '1', '4', '万全县', '29', 'WQX', null, '003013007029', null);
INSERT INTO `pa_bmzd` VALUES ('958A554231664D8C91C96215B5E7813C', '2015-05-03 11:15:45', '甘肃省天水市甘谷县', '1', '4.2.2.620523', '1', '4', '甘谷县', '23', 'GYX', null, '003062005023', null);
INSERT INTO `pa_bmzd` VALUES ('95A29EB860214DE19F9D6CD48CC2E3E9', '2015-05-03 11:15:45', '广东省惠州市惠东县', '1', '4.2.2.441323', '1', '4', '惠东县', '23', 'HDX', null, '003044013023', null);
INSERT INTO `pa_bmzd` VALUES ('95A434DD5A1F4E6989F09FF1B1A630A0', '2015-05-03 11:15:45', '浙江省杭州市滨江区', '1', '4.2.2.330108', '1', '4', '滨江区', '8', 'BJQ', null, '003033001008', null);
INSERT INTO `pa_bmzd` VALUES ('95AF0F6FD7464EF8977C645A28312785', '2015-05-03 11:15:45', '山东省潍坊市坊子区', '1', '4.2.2.370704', '1', '4', '坊子区', '4', 'FZQ', null, '003037007004', null);
INSERT INTO `pa_bmzd` VALUES ('95CCBE62413C48CCAC92425D61DA0F77', '2015-05-03 11:15:45', '黑龙江省哈尔滨市阿城区', '1', '4.2.2.230112', '1', '4', '阿城区', '12', 'ACQ', null, '003023001012', null);
INSERT INTO `pa_bmzd` VALUES ('95FC99088A0E4D34B9B5F9DD3C02DC6D', '2015-05-03 11:15:45', '吉林省白城市洮南市', '1', '4.2.2.220881', '1', '4', '洮南市', '81', 'TNS', null, '003022008081', null);
INSERT INTO `pa_bmzd` VALUES ('960794A886FF4F2EA3FDD34090075349', '2015-05-03 11:15:45', '广西壮族自治区百色市隆林各族自治县', '1', '4.2.2.451031', '1', '4', '隆林各族自治县', '31', 'LLGZZZX', null, '003045010031', null);
INSERT INTO `pa_bmzd` VALUES ('960CE76DE13D4C188FCF92291F97F688', '2015-05-03 11:15:45', '河北省唐山市', '1', '4.2.2.130200', '0', '3', '唐山市', '2', 'TSS', null, '003013002', null);
INSERT INTO `pa_bmzd` VALUES ('9611584568EC49C89630A0BCC6BEA6AF', '2015-05-03 11:15:45', '河北省保定市蠡县', '1', '4.2.2.130635', '1', '4', '蠡县', '35', 'LX', null, '003013006035', null);
INSERT INTO `pa_bmzd` VALUES ('962070E58FC7479C9051D0B68E23BE73', '2015-05-03 11:15:45', '湖北省荆州市监利县', '1', '4.2.2.421023', '1', '4', '监利县', '23', 'JLX', null, '003042010023', null);
INSERT INTO `pa_bmzd` VALUES ('963E031E91D64B4E8E037EDCA270A924', '2015-05-03 11:15:45', '吉林省通化市市辖区', '1', '4.2.2.220501', '1', '4', '市辖区', '1', 'SXQ', null, '003022005001', null);
INSERT INTO `pa_bmzd` VALUES ('965DFA4AECAA41DDB3F37B5A70F398C4', '2015-05-03 11:15:45', '山东省临沂市罗庄区', '1', '4.2.2.371311', '1', '4', '罗庄区', '11', 'LZQ', null, '003037013011', null);
INSERT INTO `pa_bmzd` VALUES ('965EC6CCC52748D38FB2CBBB1B4EAF3F', '2015-05-03 11:15:45', '内蒙古自治区鄂尔多斯市', '1', '4.2.2.150600', '0', '3', '鄂尔多斯市', '6', 'EEDSS', null, '003015006', null);
INSERT INTO `pa_bmzd` VALUES ('966F12AAE1BE41229A34FC3DE9AD43AB', '2015-05-03 11:15:45', '山东省德州市武城县', '1', '4.2.2.371428', '1', '4', '武城县', '28', 'WCX', null, '003037014028', null);
INSERT INTO `pa_bmzd` VALUES ('96875856BE65472085103F952774141B', '2015-05-03 11:15:45', '新疆维吾尔自治区乌鲁木齐市市辖区', '1', '4.2.2.650101', '1', '4', '市辖区', '1', 'SXQ', null, '003065001001', null);
INSERT INTO `pa_bmzd` VALUES ('9699A7BB0B6442598DCB9E86F9741D0B', '2015-05-03 11:15:45', '福建省南平市光泽县', '1', '4.2.2.350723', '1', '4', '光泽县', '23', 'GZX', null, '003035007023', null);
INSERT INTO `pa_bmzd` VALUES ('96A00BACC7E14C41BBD1E8E2857BA6BA', '2015-05-03 11:15:45', '辽宁省朝阳市建平县', '1', '4.2.2.211322', '1', '4', '建平县', '22', 'JPX', null, '003021013022', null);
INSERT INTO `pa_bmzd` VALUES ('96AD75C582C647CCA51E69D113F98DED', '2015-05-03 11:15:45', '陕西省宝鸡市扶风县', '1', '4.2.2.610324', '1', '4', '扶风县', '24', 'FFX', null, '003061003024', null);
INSERT INTO `pa_bmzd` VALUES ('96B08E0F695F4981BDD713B1BBCE29DA', '2015-05-03 11:15:45', '湖北省随州市市辖区', '1', '4.2.2.421301', '1', '4', '市辖区', '1', 'SXQ', null, '003042013001', null);
INSERT INTO `pa_bmzd` VALUES ('96B483491ED24E46A94493587D8D59F1', '2015-05-03 11:15:45', '贵州省毕节市七星关区', '1', '4.2.2.520502', '1', '4', '七星关区', '2', 'QXGQ', null, '003052005002', null);
INSERT INTO `pa_bmzd` VALUES ('96C3C9011B694BE38D2D57394C68632D', '2015-05-03 11:15:45', '广东省深圳市宝安区', '1', '4.2.2.440306', '1', '4', '宝安区', '6', 'BAQ', null, '003044003006', null);
INSERT INTO `pa_bmzd` VALUES ('96C96F128EBE4A97AF7FF4B4AA68638D', '2015-05-03 11:15:45', '吉林省延边朝鲜族自治州延吉市', '1', '4.2.2.222401', '1', '4', '延吉市', '1', 'YJS', null, '003022024001', null);
INSERT INTO `pa_bmzd` VALUES ('96D2DC32038A48D0A6F955623727B22A', '2015-05-03 11:15:45', '广西壮族自治区柳州市鹿寨县', '1', '4.2.2.450223', '1', '4', '鹿寨县', '23', 'LZX', null, '003045002023', null);
INSERT INTO `pa_bmzd` VALUES ('96D352D59A1D423EAE1D1DD1193FDDA9', '2015-05-03 11:15:45', '广东省阳江市阳西县', '1', '4.2.2.441721', '1', '4', '阳西县', '21', 'YXX', null, '003044017021', null);
INSERT INTO `pa_bmzd` VALUES ('96DAB249BB49400F84EE1BCFD0807FA4', '2015-05-03 11:15:45', '陕西省延安市志丹县', '1', '4.2.2.610625', '1', '4', '志丹县', '25', 'ZDX', null, '003061006025', null);
INSERT INTO `pa_bmzd` VALUES ('96DEC5D47C444A7EBE8ED59419C1E66C', '2015-05-03 11:15:45', '四川省甘孜藏族自治州石渠县', '1', '4.2.2.513332', '1', '4', '石渠县', '32', 'SQX', null, '003051033032', null);
INSERT INTO `pa_bmzd` VALUES ('96E8372F1C304DBBAA5561FA47B20C70', '2015-05-03 11:15:45', '湖南省株洲市攸县', '1', '4.2.2.430223', '1', '4', '攸县', '23', 'YX', null, '003043002023', null);
INSERT INTO `pa_bmzd` VALUES ('973AB61B62CF4723B0AA230FF6419F1F', '2015-05-03 11:15:45', '黑龙江省哈尔滨市南岗区', '1', '4.2.2.230103', '1', '4', '南岗区', '3', 'NGQ', null, '003023001003', null);
INSERT INTO `pa_bmzd` VALUES ('973D6380ABC04357846967BBAC340C2A', '2015-05-03 11:15:45', '辽宁省阜新市太平区', '1', '4.2.2.210904', '1', '4', '太平区', '4', 'TPQ', null, '003021009004', null);
INSERT INTO `pa_bmzd` VALUES ('9785A3D5CE014DA7A9664F5FE8F0ACEF', '2015-05-03 11:15:45', '贵州省铜仁市石阡县', '1', '4.2.2.522224', '1', '4', '石阡县', '23', 'SQX', null, '003052006023', null);
INSERT INTO `pa_bmzd` VALUES ('978EDFC0F76A472B80A3F45CDE4B825A', '2015-05-03 11:15:45', '江苏省连云港市海州区', '1', '4.2.2.320706', '1', '4', '海州区', '6', 'HZQ', null, '003032007006', null);
INSERT INTO `pa_bmzd` VALUES ('9790911FDDBC49C59DC3591AC2375C74', '2015-05-03 11:15:45', '浙江省丽水市青田县', '1', '4.2.2.331121', '1', '4', '青田县', '21', 'QTX', null, '003033011021', null);
INSERT INTO `pa_bmzd` VALUES ('97A5DC3AB8D041A99307EFB655CD25E7', '2015-05-03 11:15:45', '黑龙江省绥化市市辖区', '1', '4.2.2.231201', '1', '4', '市辖区', '1', 'SXQ', null, '003023012001', null);
INSERT INTO `pa_bmzd` VALUES ('97CD5909E42E4E63B320D1466B2989D5', '2015-05-03 11:15:45', '四川省宜宾市宜宾县', '1', '4.2.2.511521', '1', '4', '宜宾县', '21', 'YBX', null, '003051015021', null);
INSERT INTO `pa_bmzd` VALUES ('97D318302ABD408DB86A53825A239C59', '2015-05-03 11:15:45', '河南省安阳市市辖区', '1', '4.2.2.410501', '1', '4', '市辖区', '1', 'SXQ', null, '003041005001', null);
INSERT INTO `pa_bmzd` VALUES ('97D5196CAD214FCDABF8DC4887C1873C', '2015-05-03 11:15:45', '山西省临汾市大宁县', '1', '4.2.2.141030', '1', '4', '大宁县', '30', 'DNX', null, '003014010030', null);
INSERT INTO `pa_bmzd` VALUES ('97D80CBB29B046AF8FE2006CF88F2266', '2015-05-03 11:15:45', '湖北省宜昌市兴山县', '1', '4.2.2.420526', '1', '4', '兴山县', '26', 'XSX', null, '003042005026', null);
INSERT INTO `pa_bmzd` VALUES ('97E591AC092E4CE6AEF433F00B8CEACB', '2015-05-03 11:15:45', '山西省长治市平顺县', '1', '4.2.2.140425', '1', '4', '平顺县', '25', 'PSX', null, '003014004025', null);
INSERT INTO `pa_bmzd` VALUES ('97E73A1DB6DD46D8B25EB4520C6390B6', '2015-05-03 11:15:45', '江西省宜春市万载县', '1', '4.2.2.360922', '1', '4', '万载县', '22', 'WZX', null, '003036009022', null);
INSERT INTO `pa_bmzd` VALUES ('97E8698EB6CA4A1BA1F4115079F5CDAE', '2015-05-03 11:15:45', '广西壮族自治区钦州市灵山县', '1', '4.2.2.450721', '1', '4', '灵山县', '21', 'LSX', null, '003045007021', null);
INSERT INTO `pa_bmzd` VALUES ('9805A671233041829743295AA9E74D1E', '2015-05-03 11:15:45', '江苏省扬州市宝应县', '1', '4.2.2.321023', '1', '4', '宝应县', '23', 'BYX', null, '003032010023', null);
INSERT INTO `pa_bmzd` VALUES ('980A547AA770428E8D557912B4C99080', '2015-05-03 11:15:45', '河北省沧州市盐山县', '1', '4.2.2.130925', '1', '4', '盐山县', '25', 'YSX', null, '003013009025', null);
INSERT INTO `pa_bmzd` VALUES ('980CE873CDC549968F6FD510079546AB', '2015-05-03 11:15:45', '青海省海西蒙古族藏族自治州', '1', '4.2.2.632800', '0', '3', '海西蒙古族藏族自治州', '28', 'HXMGZZZZZZ', null, '003063028', null);
INSERT INTO `pa_bmzd` VALUES ('9817D8710F454947BB74650E313E761F', '2015-05-03 11:15:45', '辽宁省鞍山市千山区', '1', '4.2.2.210311', '1', '4', '千山区', '11', 'QSQ', null, '003021003011', null);
INSERT INTO `pa_bmzd` VALUES ('982891AA9A3841C0A75B344E3184930E', '2015-05-03 11:15:45', '河北省张家口市赤城县', '1', '4.2.2.130732', '1', '4', '赤城县', '32', 'CCX', null, '003013007032', null);
INSERT INTO `pa_bmzd` VALUES ('9834853517124B8F94142FAFC9153A0C', '2015-05-03 11:15:45', '辽宁省铁岭市银州区', '1', '4.2.2.211202', '1', '4', '银州区', '2', 'YZQ', null, '003021012002', null);
INSERT INTO `pa_bmzd` VALUES ('98371978BE9847928B23CC1D6B659FB6', '2015-05-03 11:15:45', '山东省潍坊市高密市', '1', '4.2.2.370785', '1', '4', '高密市', '85', 'GMS', null, '003037007085', null);
INSERT INTO `pa_bmzd` VALUES ('9849738FB74B4DFCB768CB347D50F267', '2015-05-03 11:15:45', '四川省凉山彝族自治州布拖县', '1', '4.2.2.513429', '1', '4', '布拖县', '29', 'BTX', null, '003051034029', null);
INSERT INTO `pa_bmzd` VALUES ('984DFE8274A44C9FB7814BE8EB40CFB4', '2015-05-03 11:15:45', '云南省曲靖市陆良县', '1', '4.2.2.530322', '1', '4', '陆良县', '22', 'LLX', null, '003053003022', null);
INSERT INTO `pa_bmzd` VALUES ('9859B117D0244EF398DE331AD8F586AA', '2015-05-03 11:15:45', '湖南省株洲市市辖区', '1', '4.2.2.430201', '1', '4', '市辖区', '1', 'SXQ', null, '003043002001', null);
INSERT INTO `pa_bmzd` VALUES ('986BAFD5943841A581A1399C34B42429', '2015-05-03 11:15:45', '江苏省徐州市沛县', '1', '4.2.2.320322', '1', '4', '沛县', '22', 'PX', null, '003032003022', null);
INSERT INTO `pa_bmzd` VALUES ('988BFCCD32724E9AB230CCAB14E2C8DA', '2015-05-03 11:15:45', '海南省省直辖县级行政区划琼中黎族苗族自治县', '1', '4.2.2.469036', '1', '4', '琼中黎族苗族自治县', '30', 'QZLZMZZZX', null, '003046090030', null);
INSERT INTO `pa_bmzd` VALUES ('989B815447CD4D7F96CF7C53E38A9D4A', '2015-05-03 11:15:45', '江苏省徐州市新沂市', '1', '4.2.2.320381', '1', '4', '新沂市', '81', 'XYS', null, '003032003081', null);
INSERT INTO `pa_bmzd` VALUES ('98E2F45D63C54B558FD5BE80B87D447D', '2015-05-03 11:15:45', '湖北省十堰市', '1', '4.2.2.420300', '0', '3', '十堰市', '3', 'SYS', null, '003042003', null);
INSERT INTO `pa_bmzd` VALUES ('98E96AF1A33749818793B751FEA91E6A', '2015-05-03 11:15:45', '山西省阳泉市城区', '1', '4.2.2.140302', '1', '4', '城区', '2', 'CQ', null, '003014003002', null);
INSERT INTO `pa_bmzd` VALUES ('9909559DE9C540E09208333BF343AA2E', '2015-05-03 11:15:45', '河北省沧州市东光县', '1', '4.2.2.130923', '1', '4', '东光县', '23', 'DGX', null, '003013009023', null);
INSERT INTO `pa_bmzd` VALUES ('991798EEB5B3478C9271082B867AE156', '2015-05-03 11:15:45', '湖北省黄冈市英山县', '1', '4.2.2.421124', '1', '4', '英山县', '24', 'YSX', null, '003042011024', null);
INSERT INTO `pa_bmzd` VALUES ('9947B2B17B3847B3AC288FFAA357F3DA', '2015-05-03 11:15:45', '安徽省合肥市蜀山区', '1', '4.2.2.340104', '1', '4', '蜀山区', '4', 'SSQ', null, '003034001004', null);
INSERT INTO `pa_bmzd` VALUES ('9968F100C4944AAB96D09FAE2EDBD4A2', '2015-05-03 11:15:45', '青海省玉树藏族自治州', '1', '4.2.2.632700', '0', '3', '玉树藏族自治州', '27', 'YSZZZZZ', null, '003063027', null);
INSERT INTO `pa_bmzd` VALUES ('99A30B5804CE4A8CAC8E2302D06D0029', '2015-05-03 11:15:45', '云南省临沧市凤庆县', '1', '4.2.2.530921', '1', '4', '凤庆县', '21', 'FQX', null, '003053009021', null);
INSERT INTO `pa_bmzd` VALUES ('99B470D15D704421992C248CA1A08000', '2015-05-03 11:15:45', '福建省厦门市海沧区', '1', '4.2.2.350205', '1', '4', '海沧区', '5', 'HCQ', null, '003035002005', null);
INSERT INTO `pa_bmzd` VALUES ('99BE5261AC584E82B01225AA910FAD63', '2015-05-03 11:15:45', '云南省文山壮族苗族自治州砚山县', '1', '4.2.2.532622', '1', '4', '砚山县', '22', 'YSX', null, '003053026022', null);
INSERT INTO `pa_bmzd` VALUES ('99C02D44F9F14F618AB94EFA883398F0', '2015-05-03 11:15:45', '山东省威海市市辖区', '1', '4.2.2.371001', '1', '4', '市辖区', '1', 'SXQ', null, '003037010001', null);
INSERT INTO `pa_bmzd` VALUES ('99D45CF772384D5BB7AD42A37D07DFE2', '2015-05-03 11:15:45', '海南省海口市美兰区', '1', '4.2.2.460108', '1', '4', '美兰区', '8', 'MLQ', null, '003046001008', null);
INSERT INTO `pa_bmzd` VALUES ('99F0C8486ECB432AB9AB487ED9C20377', '2015-05-03 11:15:45', '内蒙古自治区巴彦淖尔市', '1', '4.2.2.150800', '0', '3', '巴彦淖尔市', '8', 'BYNES', null, '003015008', null);
INSERT INTO `pa_bmzd` VALUES ('99F1B5ECDBDB46D290DF895E56C16B10', '2015-05-03 11:15:45', '辽宁省抚顺市', '1', '4.2.2.210400', '0', '3', '抚顺市', '4', 'FSS', null, '003021004', null);
INSERT INTO `pa_bmzd` VALUES ('99F44EA01639433EA9C83C3A5F29148B', '2015-05-03 11:15:45', '甘肃省甘南藏族自治州玛曲县', '1', '4.2.2.623025', '1', '4', '玛曲县', '25', 'MQX', null, '003062030025', null);
INSERT INTO `pa_bmzd` VALUES ('9A0991FF0EF44417BEE7C762A438A537', '2015-05-03 11:15:45', '安徽省滁州市全椒县', '1', '4.2.2.341124', '1', '4', '全椒县', '24', 'QJX', null, '003034011024', null);
INSERT INTO `pa_bmzd` VALUES ('9A0AC4CA3F5445EA945CC58405CEEFE2', '2015-05-03 11:15:45', '湖北省黄冈市黄梅县', '1', '4.2.2.421127', '1', '4', '黄梅县', '27', 'HMX', null, '003042011027', null);
INSERT INTO `pa_bmzd` VALUES ('9A0F5BB3EDC244C8AF2C618D8B5DABBF', '2015-05-03 11:15:45', '青海省黄南藏族自治州尖扎县', '1', '4.2.2.632322', '1', '4', '尖扎县', '22', 'JZX', null, '003063023022', null);
INSERT INTO `pa_bmzd` VALUES ('9A12602771194E75B27A18068BA3D0DF', '2015-05-03 11:15:45', '山西省大同市矿区', '1', '4.2.2.140203', '1', '4', '矿区', '3', 'KQ', null, '003014002003', null);
INSERT INTO `pa_bmzd` VALUES ('9A193EF37E3D40BCBB5458809FF95E00', '2015-05-03 11:15:45', '北京市市辖区门头沟区', '1', '4.2.2.110109', '1', '4', '门头沟区', '9', 'MTGQ', null, '003011001009', null);
INSERT INTO `pa_bmzd` VALUES ('9A1CA57540B9434FA0C4F328860CE983', '2015-05-03 11:15:45', '广东省汕头市金平区', '1', '4.2.2.440511', '1', '4', '金平区', '11', 'JPQ', null, '003044005011', null);
INSERT INTO `pa_bmzd` VALUES ('9A5338FCD5274FC9917391F4ECD41121', '2015-05-03 11:15:45', '重庆市县丰都县', '1', '4.2.2.500230', '1', '4', '丰都县', '30', 'FDX', null, '003050002030', null);
INSERT INTO `pa_bmzd` VALUES ('9A58CD8B98B34176AA2476409C0C39D2', '2015-05-03 11:15:45', '江苏省徐州市鼓楼区', '1', '4.2.2.320302', '1', '4', '鼓楼区', '2', 'GLQ', null, '003032003002', null);
INSERT INTO `pa_bmzd` VALUES ('9A5F527D777047079D6AC15EBC65649F', '2015-05-03 11:15:45', '山西省长治市武乡县', '1', '4.2.2.140429', '1', '4', '武乡县', '29', 'WXX', null, '003014004029', null);
INSERT INTO `pa_bmzd` VALUES ('9A734517F35D4921B43226905C104714', '2015-05-03 11:15:45', '内蒙古自治区呼伦贝尔市海拉尔区', '1', '4.2.2.150702', '1', '4', '海拉尔区', '2', 'HLEQ', null, '003015007002', null);
INSERT INTO `pa_bmzd` VALUES ('9A7E226BF7294AFF947D46F3465AE604', '2015-05-03 11:15:45', '福建省三明市市辖区', '1', '4.2.2.350401', '1', '4', '市辖区', '1', 'SXQ', null, '003035004001', null);
INSERT INTO `pa_bmzd` VALUES ('9ACAF55E3C7849E3B172F7733679BADC', '2015-05-03 11:15:45', '河南省洛阳市老城区', '1', '4.2.2.410302', '1', '4', '老城区', '2', 'LCQ', null, '003041003002', null);
INSERT INTO `pa_bmzd` VALUES ('9ACD2EBC40104D8CA38B36003A01E96B', '2015-05-03 11:15:45', '北京市县密云县', '1', '4.2.2.110228', '1', '4', '密云县', '28', 'MYX', null, '003011002028', null);
INSERT INTO `pa_bmzd` VALUES ('9ACE20538AC04D708B60C1FD6D41104D', '2015-05-03 11:15:45', '河北省保定市博野县', '1', '4.2.2.130637', '1', '4', '博野县', '37', 'BYX', null, '003013006037', null);
INSERT INTO `pa_bmzd` VALUES ('9ACE43D738BB4F919791377840C1CA43', '2015-05-03 11:15:45', '安徽省阜阳市太和县', '1', '4.2.2.341222', '1', '4', '太和县', '22', 'THX', null, '003034012022', null);
INSERT INTO `pa_bmzd` VALUES ('9AF19A761C0F4074BC4C23EE9E182CDE', '2015-05-03 11:15:45', '西藏自治区林芝地区工布江达县', '1', '4.2.2.542622', '1', '4', '工布江达县', '22', 'GBJDX', null, '003054026022', null);
INSERT INTO `pa_bmzd` VALUES ('9AF785B2E1384E4E8A00657F1E90A421', '2015-05-03 11:15:45', '河北省秦皇岛市北戴河区', '1', '4.2.2.130304', '1', '4', '北戴河区', '4', 'BDHQ', null, '003013003004', null);
INSERT INTO `pa_bmzd` VALUES ('9AFCF31368DE4528AA30F19B52930BA1', '2015-05-03 11:15:45', '安徽省滁州市天长市', '1', '4.2.2.341181', '1', '4', '天长市', '81', 'TZS', null, '003034011081', null);
INSERT INTO `pa_bmzd` VALUES ('9B6FF8E62B134BE58EA413CA6E9CFA2A', '2015-05-03 11:15:45', '天津市市辖区津南区', '1', '4.2.2.120112', '1', '4', '津南区', '12', 'JNQ', null, '003012001012', null);
INSERT INTO `pa_bmzd` VALUES ('9B7C3237EFC34102B317ED589873AA0E', '2015-05-03 11:15:45', '天津市市辖区宝坻区', '1', '4.2.2.120115', '1', '4', '宝坻区', '15', 'BDQ', null, '003012001015', null);
INSERT INTO `pa_bmzd` VALUES ('9B8778F4897B455697C7DDC0980EEE71', '2015-05-03 11:15:45', '浙江省金华市浦江县', '1', '4.2.2.330726', '1', '4', '浦江县', '26', 'PJX', null, '003033007026', null);
INSERT INTO `pa_bmzd` VALUES ('9C089E4425C146CCA194399FDFC7DCCB', '2015-05-03 11:15:45', '山西省阳泉市', '1', '4.2.2.140300', '0', '3', '阳泉市', '3', 'YQS', null, '003014003', null);
INSERT INTO `pa_bmzd` VALUES ('9C2D9573E23F4208A5DA3F6EE2324051', '2015-05-03 11:15:45', '辽宁省本溪市本溪满族自治县', '1', '4.2.2.210521', '1', '4', '本溪满族自治县', '21', 'BXMZZZX', null, '003021005021', null);
INSERT INTO `pa_bmzd` VALUES ('9CB132EE02D04389B5907A2A59FCF999', '2015-05-03 11:15:45', '河北省衡水市市辖区', '1', '4.2.2.131101', '1', '4', '市辖区', '1', 'SXQ', null, '003013011001', null);
INSERT INTO `pa_bmzd` VALUES ('9CD03F3479FF4A00AC32B2C8570F70AD', '2015-05-03 11:15:45', '新疆维吾尔自治区阿勒泰地区富蕴县', '1', '4.2.2.654322', '1', '4', '富蕴县', '22', 'FYX', null, '003065043022', null);
INSERT INTO `pa_bmzd` VALUES ('9CDA6FDD55274EB696EDCD9E101B53C6', '2015-05-03 11:15:45', '河北省廊坊市文安县', '1', '4.2.2.131026', '1', '4', '文安县', '26', 'WAX', null, '003013010026', null);
INSERT INTO `pa_bmzd` VALUES ('9CF078C6E1634E308AE2E0054C366E77', '2015-05-03 11:15:45', '陕西省汉中市洋县', '1', '4.2.2.610723', '1', '4', '洋县', '23', 'YX', null, '003061007023', null);
INSERT INTO `pa_bmzd` VALUES ('9D00F33EE39D4C2AB989B1021B79AF1C', '2015-05-03 11:15:45', '广西壮族自治区钦州市市辖区', '1', '4.2.2.450701', '1', '4', '市辖区', '1', 'SXQ', null, '003045007001', null);
INSERT INTO `pa_bmzd` VALUES ('9D26987E4643473EB01006FA249B0834', '2015-05-03 11:15:45', '贵州省遵义市桐梓县', '1', '4.2.2.520322', '1', '4', '桐梓县', '22', 'TZX', null, '003052003022', null);
INSERT INTO `pa_bmzd` VALUES ('9D35344E9FFE4D9D83774215C34559B0', '2015-05-03 11:15:45', '四川省内江市市辖区', '1', '4.2.2.511001', '1', '4', '市辖区', '1', 'SXQ', null, '003051010001', null);
INSERT INTO `pa_bmzd` VALUES ('9D638E3E863E43B781AE74EE82D2CF77', '2015-05-03 11:15:45', '陕西省', '1', '4.2.2.610000', '0', '2', '陕西省', '61', 'SXS', null, '003061', null);
INSERT INTO `pa_bmzd` VALUES ('9DBAA3A42A8A49BA865E1D313933851B', '2015-05-03 11:15:45', '吉林省吉林市市辖区', '1', '4.2.2.220201', '1', '4', '市辖区', '1', 'SXQ', null, '003022002001', null);
INSERT INTO `pa_bmzd` VALUES ('9DDE0DA2132A4774ADEB45196C5A12FA', '2015-05-03 11:15:45', '江西省赣州市信丰县', '1', '4.2.2.360722', '1', '4', '信丰县', '22', 'XFX', null, '003036007022', null);
INSERT INTO `pa_bmzd` VALUES ('9DEE6702A2D6458F94B3643C9D92781D', '2015-05-03 11:15:45', '青海省海北藏族自治州祁连县', '1', '4.2.2.632222', '1', '4', '祁连县', '22', 'QLX', null, '003063022022', null);
INSERT INTO `pa_bmzd` VALUES ('9E0BDB32735B46979AC69409B38C0CB1', '2015-05-03 11:15:45', '广东省汕头市濠江区', '1', '4.2.2.440512', '1', '4', '濠江区', '12', 'HJQ', null, '003044005012', null);
INSERT INTO `pa_bmzd` VALUES ('9E0CF4692FFF46A698F23B69AC6D1784', '2015-05-03 11:15:45', '安徽省蚌埠市怀远县', '1', '4.2.2.340321', '1', '4', '怀远县', '21', 'HYX', null, '003034003021', null);
INSERT INTO `pa_bmzd` VALUES ('9E0D496F72334780923D127B3289AAE7', '2015-05-03 11:15:45', '云南省红河哈尼族彝族自治州屏边苗族自治县', '1', '4.2.2.532523', '1', '4', '屏边苗族自治县', '23', 'PBMZZZX', null, '003053025023', null);
INSERT INTO `pa_bmzd` VALUES ('9E12CA924A814F20B575F4E40D867E96', '2015-05-03 11:15:45', '河南省平顶山市卫东区', '1', '4.2.2.410403', '1', '4', '卫东区', '3', 'WDQ', null, '003041004003', null);
INSERT INTO `pa_bmzd` VALUES ('9E6AE1EA43D843C0A33900C777A6211E', '2015-05-03 11:15:45', '浙江省杭州市建德市', '1', '4.2.2.330182', '1', '4', '建德市', '82', 'JDS', null, '003033001082', null);
INSERT INTO `pa_bmzd` VALUES ('9E82A922A34948409E6EA53B855E4D59', '2015-05-03 11:15:45', '吉林省长春市德惠市', '1', '4.2.2.220183', '1', '4', '德惠市', '83', 'DHS', null, '003022001083', null);
INSERT INTO `pa_bmzd` VALUES ('9E899A4A8CC24D0A8A879CD6583B7FF2', '2015-05-03 11:15:45', '福建省厦门市湖里区', '1', '4.2.2.350206', '1', '4', '湖里区', '6', 'HLQ', null, '003035002006', null);
INSERT INTO `pa_bmzd` VALUES ('9E9789B728164E9DAE82B4DB048539A3', '2015-05-03 11:15:45', '宁夏回族自治区石嘴山市大武口区', '1', '4.2.2.640202', '1', '4', '大武口区', '2', 'DWKQ', null, '003064002002', null);
INSERT INTO `pa_bmzd` VALUES ('9EB54A47F7124D2FA9F5BD1CF66F9D12', '2015-05-03 11:15:45', '北京市市辖区东城区', '1', '4.2.2.110101', '1', '4', '东城区', '1', 'DCQ', null, '003011001001', null);
INSERT INTO `pa_bmzd` VALUES ('9ECFE9D446EE4137B8DE15D12109D381', '2015-05-03 11:15:45', '山东省日照市东港区', '1', '4.2.2.371102', '1', '4', '东港区', '2', 'DGQ', null, '003037011002', null);
INSERT INTO `pa_bmzd` VALUES ('9EDB6C9ED2064747B50E1F7DB6FB5240', '2015-05-03 11:15:45', '安徽省合肥市包河区', '1', '4.2.2.340111', '1', '4', '包河区', '11', 'BHQ', null, '003034001011', null);
INSERT INTO `pa_bmzd` VALUES ('9F1F25BD6F50488987EA158AC832A343', '2015-05-03 11:15:45', '河南省信阳市', '1', '4.2.2.411500', '0', '3', '信阳市', '15', 'XYS', null, '003041015', null);
INSERT INTO `pa_bmzd` VALUES ('9F2DEB94D84A4AC6A7EF818EA34D691C', '2015-05-03 11:15:45', '辽宁省辽阳市辽阳县', '1', '4.2.2.211021', '1', '4', '辽阳县', '21', 'LYX', null, '003021010021', null);
INSERT INTO `pa_bmzd` VALUES ('9F54CBA03C664870BB98625779786E77', '2015-05-03 11:15:45', '云南省大理白族自治州祥云县', '1', '4.2.2.532923', '1', '4', '祥云县', '23', 'XYX', null, '003053029023', null);
INSERT INTO `pa_bmzd` VALUES ('9F7E59AFF5E8483B960B221717A1B226', '2015-05-03 11:15:45', '西藏自治区山南地区', '1', '4.2.2.542200', '0', '3', '山南地区', '22', 'SNDQ', null, '003054022', null);
INSERT INTO `pa_bmzd` VALUES ('9F9071B278C14B8A833F5729F0CE1105', '2015-05-03 11:15:45', '黑龙江省七台河市勃利县', '1', '4.2.2.230921', '1', '4', '勃利县', '21', 'BLX', null, '003023009021', null);
INSERT INTO `pa_bmzd` VALUES ('9F950AB3EE294F2FBAA4E7C7EA815CDE', '2015-05-03 11:15:45', '湖南省郴州市临武县', '1', '4.2.2.431025', '1', '4', '临武县', '25', 'LWX', null, '003043010025', null);
INSERT INTO `pa_bmzd` VALUES ('9F991BC4266244839B604BC6DE50522B', '2015-05-03 11:15:45', '山西省阳泉市平定县', '1', '4.2.2.140321', '1', '4', '平定县', '21', 'PDX', null, '003014003021', null);
INSERT INTO `pa_bmzd` VALUES ('9FA1489171F04389830449A86745DC6E', '2015-05-03 11:15:45', '黑龙江省佳木斯市郊区', '1', '4.2.2.230811', '1', '4', '郊区', '11', 'JQ', null, '003023008011', null);
INSERT INTO `pa_bmzd` VALUES ('9FA353FEA2E24179A04AB234A7414341', '2015-05-03 11:15:45', '山东省滨州市', '1', '4.2.2.371600', '0', '3', '滨州市', '16', 'BZS', null, '003037016', null);
INSERT INTO `pa_bmzd` VALUES ('9FA8BB79ADA44DA7B4761A6FDB92EFDC', '2015-05-03 11:15:45', '河北省保定市南市区', '1', '4.2.2.130604', '1', '4', '南市区', '4', 'NSQ', null, '003013006004', null);
INSERT INTO `pa_bmzd` VALUES ('9FBFFA612F9F47759458E5EA746659F7', '2015-05-03 11:15:45', '山西省大同市城区', '1', '4.2.2.140202', '1', '4', '城区', '2', 'CQ', null, '003014002002', null);
INSERT INTO `pa_bmzd` VALUES ('9FC22382345A4E95A0612F9D2391AEB8', '2015-05-03 11:15:45', '河北省衡水市', '1', '4.2.2.131100', '0', '3', '衡水市', '11', 'HSS', null, '003013011', null);
INSERT INTO `pa_bmzd` VALUES ('9FC3D5DC600145969681D013A4A53D52', '2015-05-03 11:15:45', '湖南省湘西土家族苗族自治州古丈县', '1', '4.2.2.433126', '1', '4', '古丈县', '26', 'GZX', null, '003043031026', null);
INSERT INTO `pa_bmzd` VALUES ('9FEB4493B919481EA6264AB8CD7F555F', '2015-05-03 11:15:45', '天津市县蓟县', '1', '4.2.2.120225', '1', '4', '蓟县', '25', 'JX', null, '003012002025', null);
INSERT INTO `pa_bmzd` VALUES ('9FF222B3FBA141868122DEEDD7F29DF6', '2015-05-03 11:15:45', '黑龙江省绥化市庆安县', '1', '4.2.2.231224', '1', '4', '庆安县', '24', 'QAX', null, '003023012024', null);
INSERT INTO `pa_bmzd` VALUES ('9FFC9C0CA9394AA79F950FDF442C4D1A', '2015-05-03 11:15:45', '宁夏回族自治区', '1', '4.2.2.640000', '0', '2', '宁夏回族自治区', '64', 'NXHZZZQ', null, '003064', null);
INSERT INTO `pa_bmzd` VALUES ('A0040E16566444A28D684F31AE48A674', '2015-05-03 11:15:45', '山西省临汾市襄汾县', '1', '4.2.2.141023', '1', '4', '襄汾县', '23', 'XFX', null, '003014010023', null);
INSERT INTO `pa_bmzd` VALUES ('A010DEDE4AC047F0A9866F0E627D5ACD', '2015-05-03 11:15:45', '广东省河源市源城区', '1', '4.2.2.441602', '1', '4', '源城区', '2', 'YCQ', null, '003044016002', null);
INSERT INTO `pa_bmzd` VALUES ('A049103F9F9D4D119900E27257A7E6A3', '2015-05-03 11:15:45', '四川省自贡市荣县', '1', '4.2.2.510321', '1', '4', '荣县', '21', 'RX', null, '003051003021', null);
INSERT INTO `pa_bmzd` VALUES ('A084DE7D5DAA4D1CBC8F4CCC72C5534F', '2015-05-03 11:15:45', '辽宁省营口市鲅鱼圈区', '1', '4.2.2.210804', '1', '4', '鲅鱼圈区', '4', 'BYJQ', null, '003021008004', null);
INSERT INTO `pa_bmzd` VALUES ('A099A3278D76456699CEA39B576AFB68', '2015-05-03 11:15:45', '江西省鹰潭市', '1', '4.2.2.360600', '0', '3', '鹰潭市', '6', 'YTS', null, '003036006', null);
INSERT INTO `pa_bmzd` VALUES ('A0AA2D7025464CA1A3AB8CC1DC2BE49C', '2015-05-03 11:15:45', '新疆维吾尔自治区伊犁哈萨克自治州尼勒克县', '1', '4.2.2.654028', '1', '4', '尼勒克县', '28', 'NLKX', null, '003065040028', null);
INSERT INTO `pa_bmzd` VALUES ('A0CD8090005F4D03B5E0DE4AA339B7D0', '2015-05-03 11:15:45', '山东省威海市文登市', '1', '4.2.2.371081', '1', '4', '文登市', '81', 'WDS', null, '003037010081', null);
INSERT INTO `pa_bmzd` VALUES ('A0F32F0FD8E54593AF1933E2324D7CAE', '2015-05-03 11:15:45', '江苏省南京市玄武区', '1', '4.2.2.320102', '1', '4', '玄武区', '2', 'XWQ', null, '003032001002', null);
INSERT INTO `pa_bmzd` VALUES ('A0FAC222E21E4193864180745E95A665', '2015-05-03 11:15:45', '西藏自治区日喀则地区南木林县', '1', '4.2.2.542322', '1', '4', '南木林县', '22', 'NMLX', null, '003054023022', null);
INSERT INTO `pa_bmzd` VALUES ('A1275B8B6E60498FB917BF00D066F223', '2015-05-03 11:15:45', '福建省莆田市涵江区', '1', '4.2.2.350303', '1', '4', '涵江区', '3', 'HJQ', null, '003035003003', null);
INSERT INTO `pa_bmzd` VALUES ('A128952040E54F53AAD5818FABFF71C3', '2015-05-03 11:15:45', '河南省新乡市封丘县', '1', '4.2.2.410727', '1', '4', '封丘县', '27', 'FQX', null, '003041007027', null);
INSERT INTO `pa_bmzd` VALUES ('A129DFC51DF44BEB9851333A2554E915', '2015-05-03 11:15:45', '四川省巴中市市辖区', '1', '4.2.2.511901', '1', '4', '市辖区', '1', 'SXQ', null, '003051019001', null);
INSERT INTO `pa_bmzd` VALUES ('A136B03841734A34982149A0384DD100', '2015-05-03 11:15:45', '云南省保山市市辖区', '1', '4.2.2.530501', '1', '4', '市辖区', '1', 'SXQ', null, '003053005001', null);
INSERT INTO `pa_bmzd` VALUES ('A147AF64DCEF441FA1443CFFAB033614', '2015-05-03 11:15:45', '广东省佛山市禅城区', '1', '4.2.2.440604', '1', '4', '禅城区', '4', 'SCQ', null, '003044006004', null);
INSERT INTO `pa_bmzd` VALUES ('A14E9D05D889497AAA93F8FDCD261809', '2015-05-03 11:15:45', '浙江省宁波市慈溪市', '1', '4.2.2.330282', '1', '4', '慈溪市', '82', 'CXS', null, '003033002082', null);
INSERT INTO `pa_bmzd` VALUES ('A156914BDB0B4BB2B9FF7537230A6685', '2015-05-03 11:15:45', '广东省韶关市', '1', '4.2.2.440200', '0', '3', '韶关市', '2', 'SGS', null, '003044002', null);
INSERT INTO `pa_bmzd` VALUES ('A1A16EE19E8C456B8124EC53BD16FC7C', '2015-05-03 11:15:45', '河北省石家庄市高邑县', '1', '4.2.2.130127', '1', '4', '高邑县', '27', 'GYX', null, '003013001027', null);
INSERT INTO `pa_bmzd` VALUES ('A1A950D9B100405AAC56DB0D05C486E2', '2015-05-03 11:15:45', '陕西省商洛市镇安县', '1', '4.2.2.611025', '1', '4', '镇安县', '25', 'ZAX', null, '003061010025', null);
INSERT INTO `pa_bmzd` VALUES ('A1AE37F92B4D40C2AEDF883CF060B409', '2015-05-03 11:15:45', '黑龙江省伊春市西林区', '1', '4.2.2.230705', '1', '4', '西林区', '5', 'XLQ', null, '003023007005', null);
INSERT INTO `pa_bmzd` VALUES ('A1D0D26AEA9742ADA7C225CD2FA3590C', '2015-05-03 11:15:45', '内蒙古自治区通辽市市辖区', '1', '4.2.2.150501', '1', '4', '市辖区', '1', 'SXQ', null, '003015005001', null);
INSERT INTO `pa_bmzd` VALUES ('A1E2FC8248964E6AA6E6AB4E1C0995D1', '2015-05-03 11:15:45', '浙江省金华市金东区', '1', '4.2.2.330703', '1', '4', '金东区', '3', 'JDQ', null, '003033007003', null);
INSERT INTO `pa_bmzd` VALUES ('A1E4BE58C9FB4F1D9A202DCF704A12B0', '2015-05-03 11:15:45', '江苏省徐州市睢宁县', '1', '4.2.2.320324', '1', '4', '睢宁县', '24', 'SNX', null, '003032003024', null);
INSERT INTO `pa_bmzd` VALUES ('A21767040A0E47729F3E9945B5CCE34A', '2015-05-03 11:15:45', '河北省保定市', '1', '4.2.2.130600', '0', '3', '保定市', '6', 'BDS', null, '003013006', null);
INSERT INTO `pa_bmzd` VALUES ('A236AF1279034563B3AA147C78E1211D', '2015-05-03 11:15:45', '湖南省岳阳市临湘市', '1', '4.2.2.430682', '1', '4', '临湘市', '82', 'LXS', null, '003043006082', null);
INSERT INTO `pa_bmzd` VALUES ('A241985089274368B4F6C23924618D51', '2015-05-03 11:15:45', '陕西省咸阳市礼泉县', '1', '4.2.2.610425', '1', '4', '礼泉县', '25', 'LQX', null, '003061004025', null);
INSERT INTO `pa_bmzd` VALUES ('A257B57FA18C48BDBBD12DF8F42F3CC0', '2015-05-03 11:15:45', '山东省菏泽市牡丹区', '1', '4.2.2.371702', '1', '4', '牡丹区', '2', 'MDQ', null, '003037017002', null);
INSERT INTO `pa_bmzd` VALUES ('A2740EACA083441CB241A5E55A11B65C', '2015-05-03 11:15:45', '安徽省滁州市来安县', '1', '4.2.2.341122', '1', '4', '来安县', '22', 'LAX', null, '003034011022', null);
INSERT INTO `pa_bmzd` VALUES ('A2828DA912BA4CB5B66B196158E28E79', '2015-05-03 11:15:45', '河南省焦作市市辖区', '1', '4.2.2.410801', '1', '4', '市辖区', '1', 'SXQ', null, '003041008001', null);
INSERT INTO `pa_bmzd` VALUES ('A298D76A5CF7440A8441C4859FD168DF', '2015-05-03 11:15:45', '广东省梅州市兴宁市', '1', '4.2.2.441481', '1', '4', '兴宁市', '81', 'XNS', null, '003044014081', null);
INSERT INTO `pa_bmzd` VALUES ('A2A124E70EE2463EA233EF1CF3680E35', '2015-05-03 11:15:45', '福建省漳州市东山县', '1', '4.2.2.350626', '1', '4', '东山县', '26', 'DSX', null, '003035006026', null);
INSERT INTO `pa_bmzd` VALUES ('A2B2E1F25BEF4BE89D4F2ECC944CEDAE', '2015-05-03 11:15:45', '河北省保定市涿州市', '1', '4.2.2.130681', '1', '4', '涿州市', '81', 'ZZS', null, '003013006081', null);
INSERT INTO `pa_bmzd` VALUES ('A2BAA7D3B462413A973DE246437F3BFF', '2015-05-03 11:15:45', '江苏省常州市戚墅堰区', '1', '4.2.2.320405', '1', '4', '戚墅堰区', '5', 'QSYQ', null, '003032004005', null);
INSERT INTO `pa_bmzd` VALUES ('A2BE5F7032224DA0A27031E76B792ED9', '2015-05-03 11:15:45', '西藏自治区山南地区曲松县', '1', '4.2.2.542226', '1', '4', '曲松县', '26', 'QSX', null, '003054022026', null);
INSERT INTO `pa_bmzd` VALUES ('A2C8D358EED14420822093BF1D59B13E', '2015-05-03 11:15:45', '福建省南平市市辖区', '1', '4.2.2.350701', '1', '4', '市辖区', '1', 'SXQ', null, '003035007001', null);
INSERT INTO `pa_bmzd` VALUES ('A2E69A34A1F346D2BC959B6715A3DD7A', '2015-05-03 11:15:45', '山东省济宁市邹城市', '1', '4.2.2.370883', '1', '4', '邹城市', '83', 'ZCS', null, '003037008083', null);
INSERT INTO `pa_bmzd` VALUES ('A2F34D380B0047A291A13776D6396E66', '2015-05-03 11:15:45', '广东省广州市番禺区', '1', '4.2.2.440113', '1', '4', '番禺区', '13', 'PYQ', null, '003044001013', null);
INSERT INTO `pa_bmzd` VALUES ('A2F4FCF4B0D943AFA61086692A6F1E11', '2015-05-03 11:15:45', '内蒙古自治区巴彦淖尔市杭锦后旗', '1', '4.2.2.150826', '1', '4', '杭锦后旗', '26', 'HJHQ', null, '003015008026', null);
INSERT INTO `pa_bmzd` VALUES ('A2FA6F10D38241599788A094AD549328', '2015-05-03 11:15:45', '四川省甘孜藏族自治州乡城县', '1', '4.2.2.513336', '1', '4', '乡城县', '36', 'XCX', null, '003051033036', null);
INSERT INTO `pa_bmzd` VALUES ('A312B11D449E433C91C56C154A2815A5', '2015-05-03 11:15:45', '福建省莆田市荔城区', '1', '4.2.2.350304', '1', '4', '荔城区', '4', 'LCQ', null, '003035003004', null);
INSERT INTO `pa_bmzd` VALUES ('A325A6E5E51B4B11BCDF68983AFB10F9', '2015-05-03 11:15:45', '陕西省延安市延长县', '1', '4.2.2.610621', '1', '4', '延长县', '21', 'YZX', null, '003061006021', null);
INSERT INTO `pa_bmzd` VALUES ('A329EE0F15FE4BF588E78FF97E370503', '2015-05-03 11:15:45', '甘肃省陇南市市辖区', '1', '4.2.2.621201', '1', '4', '市辖区', '1', 'SXQ', null, '003062012001', null);
INSERT INTO `pa_bmzd` VALUES ('A32C5F55A1AF44008F3F18771883959F', '2015-05-03 11:15:45', '河北省张家口市涿鹿县', '1', '4.2.2.130731', '1', '4', '涿鹿县', '31', 'ZLX', null, '003013007031', null);
INSERT INTO `pa_bmzd` VALUES ('A3404848025543E5BBD69A7640A1E4B9', '2015-05-03 11:15:45', '内蒙古自治区包头市昆都仑区', '1', '4.2.2.150203', '1', '4', '昆都仑区', '3', 'KDLQ', null, '003015002003', null);
INSERT INTO `pa_bmzd` VALUES ('A35C6E292F6D43549855F70F9BF891DB', '2015-05-03 11:15:45', '山东省临沂市费县', '1', '4.2.2.371325', '1', '4', '费县', '25', 'FX', null, '003037013025', null);
INSERT INTO `pa_bmzd` VALUES ('A3605EF6117C404BB4704F692ADC5B47', '2015-05-03 11:15:45', '河北省承德市双滦区', '1', '4.2.2.130803', '1', '4', '双滦区', '3', 'SLQ', null, '003013008003', null);
INSERT INTO `pa_bmzd` VALUES ('A3806DAD0CE04E4F8BC8EE386E3D3AC0', '2015-05-03 11:15:45', '新疆维吾尔自治区乌鲁木齐市头屯河区', '1', '4.2.2.650106', '1', '4', '头屯河区', '6', 'TZHQ', null, '003065001006', null);
INSERT INTO `pa_bmzd` VALUES ('A3954AAE28BE48A3A1434435A3305E9A', '2015-05-03 11:15:45', '江苏省常州市市辖区', '1', '4.2.2.320401', '1', '4', '市辖区', '1', 'SXQ', null, '003032004001', null);
INSERT INTO `pa_bmzd` VALUES ('A3A99714E83C4C1E9F0181289DEA6DFE', '2015-05-03 11:15:45', '山东省济南市', '1', '4.2.2.370100', '0', '3', '济南市', '1', 'JNS', null, '003037001', null);
INSERT INTO `pa_bmzd` VALUES ('A3BCC7200EDC4EA590A64FD1E13FBD8D', '2015-05-03 11:15:45', '宁夏回族自治区银川市永宁县', '1', '4.2.2.640121', '1', '4', '永宁县', '21', 'YNX', null, '003064001021', null);
INSERT INTO `pa_bmzd` VALUES ('A3E873FCE9DD4165BEF49A572DE6ABAD', '2015-05-03 11:15:45', '安徽省六安市裕安区', '1', '4.2.2.341503', '1', '4', '裕安区', '3', 'YAQ', null, '003034015003', null);
INSERT INTO `pa_bmzd` VALUES ('A40BAB75EA514DA19D4A3B5599BFB364', '2015-05-03 11:15:45', '安徽省宣城市宣州区', '1', '4.2.2.341802', '1', '4', '宣州区', '2', 'XZQ', null, '003034018002', null);
INSERT INTO `pa_bmzd` VALUES ('A40C923DF6D44E34A19F9DE79DCBB687', '2015-05-03 11:15:45', '陕西省咸阳市长武县', '1', '4.2.2.610428', '1', '4', '长武县', '28', 'ZWX', null, '003061004028', null);
INSERT INTO `pa_bmzd` VALUES ('A45953FBF0714AA39692625A90D29869', '2015-05-03 11:15:45', '内蒙古自治区赤峰市阿鲁科尔沁旗', '1', '4.2.2.150421', '1', '4', '阿鲁科尔沁旗', '21', 'ALKEQQ', null, '003015004021', null);
INSERT INTO `pa_bmzd` VALUES ('A469C5C6EC3A4457ADE7AC60FCE2C432', '2015-05-03 11:15:45', '四川省绵阳市北川羌族自治县', '1', '4.2.2.510726', '1', '4', '北川羌族自治县', '26', 'BCQZZZX', null, '003051007026', null);
INSERT INTO `pa_bmzd` VALUES ('A49569F0D1774E34A9B497B9DEE34463', '2015-05-03 11:15:45', '山西省长治市郊区', '1', '4.2.2.140411', '1', '4', '郊区', '11', 'JQ', null, '003014004011', null);
INSERT INTO `pa_bmzd` VALUES ('A4A6889A1C9D44D3AD9B67D4FF79691F', '2015-05-03 11:15:45', '河南省驻马店市上蔡县', '1', '4.2.2.411722', '1', '4', '上蔡县', '22', 'SCX', null, '003041017022', null);
INSERT INTO `pa_bmzd` VALUES ('A4D96F571BF3431AAA0A61D79655F9DD', '2015-05-03 11:15:45', '广东省梅州市市辖区', '1', '4.2.2.441401', '1', '4', '市辖区', '1', 'SXQ', null, '003044014001', null);
INSERT INTO `pa_bmzd` VALUES ('A4DCE692652A4C51A8F2F641D5868A13', '2015-05-03 11:15:45', '云南省大理白族自治州云龙县', '1', '4.2.2.532929', '1', '4', '云龙县', '29', 'YLX', null, '003053029029', null);
INSERT INTO `pa_bmzd` VALUES ('A4E441598346491FAA0F9D3F4F62D7EC', '2015-05-03 11:15:45', '广东省阳江市阳东县', '1', '4.2.2.441723', '1', '4', '阳东县', '23', 'YDX', null, '003044017023', null);
INSERT INTO `pa_bmzd` VALUES ('A4EF68B6717B4D6D948B827513DA9323', '2015-05-03 11:15:45', '山西省太原市阳曲县', '1', '4.2.2.140122', '1', '4', '阳曲县', '22', 'YQX', null, '003014001022', null);
INSERT INTO `pa_bmzd` VALUES ('A4F1F3E450FA457BB15CFBBA534A3B4B', '2015-05-03 11:15:45', '浙江省丽水市缙云县', '1', '4.2.2.331122', '1', '4', '缙云县', '22', 'JYX', null, '003033011022', null);
INSERT INTO `pa_bmzd` VALUES ('A4F65B3ADDCD4070B4AC1C04005CB982', '2015-05-03 11:15:45', '江西省吉安市吉水县', '1', '4.2.2.360822', '1', '4', '吉水县', '22', 'JSX', null, '003036008022', null);
INSERT INTO `pa_bmzd` VALUES ('A4F866A7352B49909A396249BF742CB3', '2015-05-03 11:15:45', '山东省济宁市泗水县', '1', '4.2.2.370831', '1', '4', '泗水县', '31', 'SSX', null, '003037008031', null);
INSERT INTO `pa_bmzd` VALUES ('A509840B39884FC3A5E5AD88573F9C04', '2015-05-03 11:15:45', '河南省周口市扶沟县', '1', '4.2.2.411621', '1', '4', '扶沟县', '21', 'FGX', null, '003041016021', null);
INSERT INTO `pa_bmzd` VALUES ('A51A87B211924691A5A5C241143949ED', '2015-05-03 11:15:45', '黑龙江省哈尔滨市平房区', '1', '4.2.2.230108', '1', '4', '平房区', '8', 'PFQ', null, '003023001008', null);
INSERT INTO `pa_bmzd` VALUES ('A55741654A3E4EFBADE832EC7AEE5A3C', '2015-05-03 11:15:45', '江苏省常州市金坛市', '1', '4.2.2.320482', '1', '4', '金坛市', '82', 'JTS', null, '003032004082', null);
INSERT INTO `pa_bmzd` VALUES ('A570522BE4514B89AAE818458E094E1A', '2015-05-03 11:15:45', '安徽省亳州市蒙城县', '1', '4.2.2.341622', '1', '4', '蒙城县', '22', 'MCX', null, '003034016022', null);
INSERT INTO `pa_bmzd` VALUES ('A57B9261513C49CA966AA8997CF16ED4', '2015-05-03 11:15:45', '四川省乐山市夹江县', '1', '4.2.2.511126', '1', '4', '夹江县', '26', 'JJX', null, '003051011026', null);
INSERT INTO `pa_bmzd` VALUES ('A5889703BD7942A4BEEF675F829BE161', '2015-05-03 11:15:45', '湖南省湘西土家族苗族自治州', '1', '4.2.2.433100', '0', '3', '湘西土家族苗族自治州', '31', 'XXTJZMZZZZ', null, '003043031', null);
INSERT INTO `pa_bmzd` VALUES ('A5A73FF8F4AF42458615BC0BE1A3670A', '2015-05-03 11:15:45', '广东省河源市和平县', '1', '4.2.2.441624', '1', '4', '和平县', '24', 'HPX', null, '003044016024', null);
INSERT INTO `pa_bmzd` VALUES ('A5B0B78B49004D5484DBE1F5CE25D22C', '2015-05-03 11:15:45', '湖南省邵阳市武冈市', '1', '4.2.2.430581', '1', '4', '武冈市', '81', 'WGS', null, '003043005081', null);
INSERT INTO `pa_bmzd` VALUES ('A5BDC87587AE4CBCA1794D01070ED6C4', '2015-05-03 11:15:45', '山西省忻州市保德县', '1', '4.2.2.140931', '1', '4', '保德县', '31', 'BDX', null, '003014009031', null);
INSERT INTO `pa_bmzd` VALUES ('A5D455D0B17543F7A4F26CBB16CAF4A0', '2015-05-03 11:15:45', '福建省泉州市德化县', '1', '4.2.2.350526', '1', '4', '德化县', '26', 'DHX', null, '003035005026', null);
INSERT INTO `pa_bmzd` VALUES ('A5FCE79B6CB6441F8640B9A715DA113A', '2015-05-03 11:15:45', '江西省宜春市樟树市', '1', '4.2.2.360982', '1', '4', '樟树市', '82', 'ZSS', null, '003036009082', null);
INSERT INTO `pa_bmzd` VALUES ('A6118D23D3E4498DA5DB17C446DD9DA8', '2015-05-03 11:15:45', '福建省龙岩市武平县', '1', '4.2.2.350824', '1', '4', '武平县', '24', 'WPX', null, '003035008024', null);
INSERT INTO `pa_bmzd` VALUES ('A64DF5C849D843F298BF4D87EF872992', '2015-05-03 11:15:45', '山西省忻州市神池县', '1', '4.2.2.140927', '1', '4', '神池县', '27', 'SCX', null, '003014009027', null);
INSERT INTO `pa_bmzd` VALUES ('A64EC7CD4327447C8844023F80F3D0F4', '2015-05-03 11:15:45', '四川省绵阳市梓潼县', '1', '4.2.2.510725', '1', '4', '梓潼县', '25', 'ZTX', null, '003051007025', null);
INSERT INTO `pa_bmzd` VALUES ('A66685EDC046469095487F6C622CC404', '2015-05-03 11:15:45', '湖南省衡阳市蒸湘区', '1', '4.2.2.430408', '1', '4', '蒸湘区', '8', 'ZXQ', null, '003043004008', null);
INSERT INTO `pa_bmzd` VALUES ('A66FCC62264440E2B12580614524E96B', '2015-05-03 11:15:45', '湖南省邵阳市新宁县', '1', '4.2.2.430528', '1', '4', '新宁县', '28', 'XNX', null, '003043005028', null);
INSERT INTO `pa_bmzd` VALUES ('A69364DB8D424A3F958D0A2222170EA9', '2015-05-03 11:15:45', '江苏省常州市溧阳市', '1', '4.2.2.320481', '1', '4', '溧阳市', '81', 'LYS', null, '003032004081', null);
INSERT INTO `pa_bmzd` VALUES ('A6AF3FFCB7EA4519A717596EC7966769', '2015-05-03 11:15:45', '辽宁省葫芦岛市市辖区', '1', '4.2.2.211401', '1', '4', '市辖区', '1', 'SXQ', null, '003021014001', null);
INSERT INTO `pa_bmzd` VALUES ('A6D7E1C5070F4436985D5E3BDD932CE2', '2015-05-03 11:15:45', '上海市市辖区浦东新区', '1', '4.2.2.310115', '1', '4', '浦东新区', '15', 'PDXQ', null, '003031001015', null);
INSERT INTO `pa_bmzd` VALUES ('A72775B94AAC4F8F868591D112826AC6', '2015-05-03 11:15:45', '陕西省汉中市市辖区', '1', '4.2.2.610701', '1', '4', '市辖区', '1', 'SXQ', null, '003061007001', null);
INSERT INTO `pa_bmzd` VALUES ('A72B4FCD71574318A8F9CB9DF84BC818', '2015-05-03 11:15:45', '福建省厦门市市辖区', '1', '4.2.2.350201', '1', '4', '市辖区', '1', 'SXQ', null, '003035002001', null);
INSERT INTO `pa_bmzd` VALUES ('A72F09B2F65A42AC817E01CC858DEC24', '2015-05-03 11:15:45', '河北省邢台市隆尧县', '1', '4.2.2.130525', '1', '4', '隆尧县', '25', 'LYX', null, '003013005025', null);
INSERT INTO `pa_bmzd` VALUES ('A72F9D95BFE74D96A5CCEFB67D9F7A31', '2015-05-03 11:15:45', '北京市市辖区通州区', '1', '4.2.2.110112', '1', '4', '通州区', '12', 'TZQ', null, '003011001012', null);
INSERT INTO `pa_bmzd` VALUES ('A730F32B55324F0AB3900831735AC742', '2015-05-03 11:15:45', '四川省阿坝藏族羌族自治州金川县', '1', '4.2.2.513226', '1', '4', '金川县', '26', 'JCX', null, '003051032026', null);
INSERT INTO `pa_bmzd` VALUES ('A73D580A1495481E9D55D9E3AECF33D2', '2015-05-03 11:15:45', '湖北省荆门市东宝区', '1', '4.2.2.420802', '1', '4', '东宝区', '2', 'DBQ', null, '003042008002', null);
INSERT INTO `pa_bmzd` VALUES ('A73F91FBF0F74822965363F81DD8E99B', '2015-05-03 11:15:45', '河南省鹤壁市淇滨区', '1', '4.2.2.410611', '1', '4', '淇滨区', '11', 'QBQ', null, '003041006011', null);
INSERT INTO `pa_bmzd` VALUES ('A74DFE87E6B04C7192BF1889254C6AC5', '2015-05-03 11:15:45', '河北省保定市望都县', '1', '4.2.2.130631', '1', '4', '望都县', '31', 'WDX', null, '003013006031', null);
INSERT INTO `pa_bmzd` VALUES ('A76EFEE987224C80A78488881E823D8B', '2015-05-03 11:15:45', '湖南省怀化市通道侗族自治县', '1', '4.2.2.431230', '1', '4', '通道侗族自治县', '30', 'TDTZZZX', null, '003043012030', null);
INSERT INTO `pa_bmzd` VALUES ('A775E27A864B4208A0B04D8CD3222D00', '2015-05-03 11:15:45', '江西省宜春市铜鼓县', '1', '4.2.2.360926', '1', '4', '铜鼓县', '26', 'TGX', null, '003036009026', null);
INSERT INTO `pa_bmzd` VALUES ('A78CBE268E34444E935B02CE5DEC23CE', '2015-05-03 11:15:45', '湖北省武汉市硚口区', '1', '4.2.2.420104', '1', '4', '硚口区', '4', 'QKQ', null, '003042001004', null);
INSERT INTO `pa_bmzd` VALUES ('A7A0FB10FEA545048ADD40FAE30FFE33', '2015-05-03 11:15:45', '黑龙江省齐齐哈尔市富裕县', '1', '4.2.2.230227', '1', '4', '富裕县', '27', 'FYX', null, '003023002027', null);
INSERT INTO `pa_bmzd` VALUES ('A7E719A36AB64072A9F7272D87D3137B', '2015-05-03 11:15:45', '内蒙古自治区鄂尔多斯市乌审旗', '1', '4.2.2.150626', '1', '4', '乌审旗', '26', 'WSQ', null, '003015006026', null);
INSERT INTO `pa_bmzd` VALUES ('A801386268FF40E68E7995C94241D87A', '2015-05-03 11:15:45', '河南省南阳市唐河县', '1', '4.2.2.411328', '1', '4', '唐河县', '28', 'THX', null, '003041013028', null);
INSERT INTO `pa_bmzd` VALUES ('A803F2C5842F4235AAA3570CD8909944', '2015-05-03 11:15:45', '江苏省泰州市高港区', '1', '4.2.2.321203', '1', '4', '高港区', '3', 'GGQ', null, '003032012003', null);
INSERT INTO `pa_bmzd` VALUES ('A80422ED16CF450D8EAB90B1DA9C7E0F', '2015-05-03 11:15:45', '河南省信阳市商城县', '1', '4.2.2.411524', '1', '4', '商城县', '24', 'SCX', null, '003041015024', null);
INSERT INTO `pa_bmzd` VALUES ('A815B13BB44B426CA4AC557174E827F9', '2015-05-03 11:15:45', '辽宁省沈阳市东陵区', '1', '4.2.2.210112', '1', '4', '东陵区', '12', 'DLQ', null, '003021001012', null);
INSERT INTO `pa_bmzd` VALUES ('A8496610D8504EA98669B790E0066085', '2015-05-03 11:15:45', '甘肃省张掖市高台县', '1', '4.2.2.620724', '1', '4', '高台县', '24', 'GTX', null, '003062007024', null);
INSERT INTO `pa_bmzd` VALUES ('A884FD2721D14945A640EE5A1CE58A35', '2015-05-03 11:15:45', '山东省聊城市', '1', '4.2.2.371500', '0', '3', '聊城市', '15', 'LCS', null, '003037015', null);
INSERT INTO `pa_bmzd` VALUES ('A8889F75123442E985600F58B9FCE301', '2015-05-03 11:15:45', '甘肃省兰州市永登县', '1', '4.2.2.620121', '1', '4', '永登县', '21', 'YDX', null, '003062001021', null);
INSERT INTO `pa_bmzd` VALUES ('A89FBBF53E284B44AB8C779B50DA2BDB', '2015-05-03 11:15:45', '山东省滨州市市辖区', '1', '4.2.2.371601', '1', '4', '市辖区', '1', 'SXQ', null, '003037016001', null);
INSERT INTO `pa_bmzd` VALUES ('A8BE6D3960174A22B38AB26D9B1C34DB', '2015-05-03 11:15:45', '广西壮族自治区防城港市上思县', '1', '4.2.2.450621', '1', '4', '上思县', '21', 'SSX', null, '003045006021', null);
INSERT INTO `pa_bmzd` VALUES ('A8F0FF26CFBB497FB048C8FDEEFE6C37', '2015-05-03 11:15:45', '甘肃省甘南藏族自治州卓尼县', '1', '4.2.2.623022', '1', '4', '卓尼县', '22', 'ZNX', null, '003062030022', null);
INSERT INTO `pa_bmzd` VALUES ('A9173718083A4243940750642DBB7406', '2015-05-03 11:15:45', '广西壮族自治区桂林市龙胜各族自治县', '1', '4.2.2.450328', '1', '4', '龙胜各族自治县', '28', 'LSGZZZX', null, '003045003028', null);
INSERT INTO `pa_bmzd` VALUES ('A917D78853C44413A388A71483B4C33C', '2015-05-03 11:15:45', '湖北省恩施土家族苗族自治州来凤县', '1', '4.2.2.422827', '1', '4', '来凤县', '27', 'LFX', null, '003042028027', null);
INSERT INTO `pa_bmzd` VALUES ('A919B91C005D42DB8D24AB44297D4DEA', '2015-05-03 11:15:45', '湖南省怀化市辰溪县', '1', '4.2.2.431223', '1', '4', '辰溪县', '23', 'CXX', null, '003043012023', null);
INSERT INTO `pa_bmzd` VALUES ('A91A935707E946FFB95A160BADECDB2D', '2015-05-03 11:15:45', '河南省洛阳市孟津县', '1', '4.2.2.410322', '1', '4', '孟津县', '22', 'MJX', null, '003041003022', null);
INSERT INTO `pa_bmzd` VALUES ('A91CCBF4D1464E3387D744039AA28D4F', '2015-05-03 11:15:45', '新疆维吾尔自治区塔城地区乌苏市', '1', '4.2.2.654202', '1', '4', '乌苏市', '2', 'WSS', null, '003065042002', null);
INSERT INTO `pa_bmzd` VALUES ('A91FEFBF1D7B412EAD9E557B4C9D5B94', '2015-05-03 11:15:45', '安徽省阜阳市', '1', '4.2.2.341200', '0', '3', '阜阳市', '12', 'FYS', null, '003034012', null);
INSERT INTO `pa_bmzd` VALUES ('A93A64CE46564FE1B8004F214E3ECD64', '2015-05-03 11:15:45', '四川省甘孜藏族自治州泸定县', '1', '4.2.2.513322', '1', '4', '泸定县', '22', 'LDX', null, '003051033022', null);
INSERT INTO `pa_bmzd` VALUES ('A947C806A9BC437DBB4E4B212E7EE40C', '2015-05-03 11:15:45', '湖南省岳阳市岳阳县', '1', '4.2.2.430621', '1', '4', '岳阳县', '21', 'YYX', null, '003043006021', null);
INSERT INTO `pa_bmzd` VALUES ('A947E5E10CBF4892AABE41572585F232', '2015-05-03 11:15:45', '四川省凉山彝族自治州昭觉县', '1', '4.2.2.513431', '1', '4', '昭觉县', '31', 'ZJX', null, '003051034031', null);
INSERT INTO `pa_bmzd` VALUES ('A960ADECCD9A474B8574264BF5B7F86D', '2015-05-03 11:15:45', '湖南省怀化市鹤城区', '1', '4.2.2.431202', '1', '4', '鹤城区', '2', 'HCQ', null, '003043012002', null);
INSERT INTO `pa_bmzd` VALUES ('A988DA58014B4F5D9FA0651CEE544B8E', '2015-05-03 11:15:45', '山西省大同市市辖区', '1', '4.2.2.140201', '1', '4', '市辖区', '1', 'SXQ', null, '003014002001', null);
INSERT INTO `pa_bmzd` VALUES ('A9A1FE8FF9E845669341AA9CB1BEBF51', '2015-05-03 11:15:45', '广东省肇庆市四会市', '1', '4.2.2.441284', '1', '4', '四会市', '84', 'SKS', null, '003044012084', null);
INSERT INTO `pa_bmzd` VALUES ('A9B0FB9916284F6B9CA76D60DF03BC30', '2015-05-03 11:15:45', '西藏自治区昌都地区', '1', '4.2.2.542100', '0', '3', '昌都地区', '21', 'CDDQ', null, '003054021', null);
INSERT INTO `pa_bmzd` VALUES ('A9B197C9CFA046778F0A42C68841996C', '2015-05-03 11:15:45', '江苏省盐城市盐都区', '1', '4.2.2.320903', '1', '4', '盐都区', '3', 'YDQ', null, '003032009003', null);
INSERT INTO `pa_bmzd` VALUES ('A9BC00A5D5474EED8A91C57EEB817DB3', '2015-05-03 11:15:45', '内蒙古自治区包头市达尔罕茂明安联合旗', '1', '4.2.2.150223', '1', '4', '达尔罕茂明安联合旗', '23', 'DEHMMALHQ', null, '003015002023', null);
INSERT INTO `pa_bmzd` VALUES ('A9C59CADBB974B1F97C880EE6AF43C0F', '2015-05-03 11:15:45', '四川省眉山市东坡区', '1', '4.2.2.511402', '1', '4', '东坡区', '2', 'DPQ', null, '003051014002', null);
INSERT INTO `pa_bmzd` VALUES ('A9D21D360EAE43AE981257DF06E88EDB', '2015-05-03 11:15:45', '福建省三明市清流县', '1', '4.2.2.350423', '1', '4', '清流县', '23', 'QLX', null, '003035004023', null);
INSERT INTO `pa_bmzd` VALUES ('A9E0FB5B2B2245EB88B3817A10754341', '2015-05-03 11:15:45', '湖南省衡阳市衡山县', '1', '4.2.2.430423', '1', '4', '衡山县', '23', 'HSX', null, '003043004023', null);
INSERT INTO `pa_bmzd` VALUES ('A9E960ED7A3C438CB602FBD4ED81EF1A', '2015-05-03 11:15:45', '江苏省苏州市', '1', '4.2.2.320500', '0', '3', '苏州市', '5', 'SZS', null, '003032005', null);
INSERT INTO `pa_bmzd` VALUES ('A9FC9CD022D446D49331A43A28AB4B3D', '2015-05-03 11:15:45', '广东省汕头市南澳县', '1', '4.2.2.440523', '1', '4', '南澳县', '23', 'NAX', null, '003044005023', null);
INSERT INTO `pa_bmzd` VALUES ('AA2FEB131C914F32BDF4D272E961B191', '2015-05-03 11:15:45', '安徽省铜陵市铜官山区', '1', '4.2.2.340702', '1', '4', '铜官山区', '2', 'TGSQ', null, '003034007002', null);
INSERT INTO `pa_bmzd` VALUES ('AA5A765E98A24ED29F463F1EA0F3EFEC', '2015-05-03 11:15:45', '广西壮族自治区梧州市藤县', '1', '4.2.2.450422', '1', '4', '藤县', '22', 'TX', null, '003045004022', null);
INSERT INTO `pa_bmzd` VALUES ('AA80D241A62B4E5EA7E6AC3EDD2064A4', '2015-05-03 11:15:45', '浙江省衢州市江山市', '1', '4.2.2.330881', '1', '4', '江山市', '81', 'JSS', null, '003033008081', null);
INSERT INTO `pa_bmzd` VALUES ('AA972C6CB60C4E54812910F8BC312221', '2015-05-03 11:15:45', '浙江省舟山市市辖区', '1', '4.2.2.330901', '1', '4', '市辖区', '1', 'SXQ', null, '003033009001', null);
INSERT INTO `pa_bmzd` VALUES ('AA9CD9C2CB6945338480E60B9CA7E3B4', '2015-05-03 11:15:45', '上海市县', '1', '4.2.2.310200', '0', '3', '县', '2', 'X', null, '003031002', null);
INSERT INTO `pa_bmzd` VALUES ('AAA14E33C45C4A34B989BA2EAEE88328', '2015-05-03 11:15:45', '陕西省咸阳市淳化县', '1', '4.2.2.610430', '1', '4', '淳化县', '30', 'CHX', null, '003061004030', null);
INSERT INTO `pa_bmzd` VALUES ('AAB1822D3DB24153ABC00819D111DD91', '2015-05-03 11:15:45', '黑龙江省哈尔滨市市辖区', '1', '4.2.2.230101', '1', '4', '市辖区', '1', 'SXQ', null, '003023001001', null);
INSERT INTO `pa_bmzd` VALUES ('AAC6414FC2574440A35B7C55DA4C6799', '2015-05-03 11:15:45', '山东省枣庄市市中区', '1', '4.2.2.370402', '1', '4', '市中区', '2', 'SZQ', null, '003037004002', null);
INSERT INTO `pa_bmzd` VALUES ('AAC81AA6A6C7491990232B1F116363DB', '2015-05-03 11:15:45', '湖南省长沙市望城区', '1', '4.2.2.430112', '1', '4', '望城区', '12', 'WCQ', null, '003043001012', null);
INSERT INTO `pa_bmzd` VALUES ('AAD86BF0FC6B45EF83D5D3F4AE0221F8', '2015-05-03 11:15:45', '湖北省孝感市应城市', '1', '4.2.2.420981', '1', '4', '应城市', '81', 'YCS', null, '003042009081', null);
INSERT INTO `pa_bmzd` VALUES ('AAF66ADCEE454BFF92E8D18BE69F6D41', '2015-05-03 11:15:45', '河南省南阳市宛城区', '1', '4.2.2.411302', '1', '4', '宛城区', '2', 'WCQ', null, '003041013002', null);
INSERT INTO `pa_bmzd` VALUES ('AAFDD71B662F445EB7D012A55B8866D0', '2015-05-03 11:15:45', '云南省丽江市', '1', '4.2.2.530700', '0', '3', '丽江市', '7', 'LJS', null, '003053007', null);
INSERT INTO `pa_bmzd` VALUES ('AB0BA9841A334030BB3BD874E90915E4', '2015-05-03 11:15:45', '河北省张家口市怀来县', '1', '4.2.2.130730', '1', '4', '怀来县', '30', 'HLX', null, '003013007030', null);
INSERT INTO `pa_bmzd` VALUES ('AB2588F18B114A38BA1EDF33B406CDE2', '2015-05-03 11:15:45', '福建省龙岩市长汀县', '1', '4.2.2.350821', '1', '4', '长汀县', '21', 'ZTX', null, '003035008021', null);
INSERT INTO `pa_bmzd` VALUES ('AB3B3B88DE8442EE82E2AE24139B2049', '2015-05-03 11:15:45', '四川省攀枝花市盐边县', '1', '4.2.2.510422', '1', '4', '盐边县', '22', 'YBX', null, '003051004022', null);
INSERT INTO `pa_bmzd` VALUES ('AB43950B46E14D0FB5348F0FECF976AF', '2015-05-03 11:15:45', '吉林省白城市通榆县', '1', '4.2.2.220822', '1', '4', '通榆县', '22', 'TYX', null, '003022008022', null);
INSERT INTO `pa_bmzd` VALUES ('AB59837A2C69448392C5F9E1EEA38FCD', '2015-05-03 11:15:45', '广西壮族自治区崇左市宁明县', '1', '4.2.2.451422', '1', '4', '宁明县', '22', 'NMX', null, '003045014022', null);
INSERT INTO `pa_bmzd` VALUES ('AB6EF63EF29843F1B2857340A94BF375', '2015-05-03 11:15:45', '甘肃省张掖市山丹县', '1', '4.2.2.620725', '1', '4', '山丹县', '25', 'SDX', null, '003062007025', null);
INSERT INTO `pa_bmzd` VALUES ('AB71A146C7424C04BEE7DB19ED3F62C9', '2015-05-03 11:15:45', '江西省宜春市宜丰县', '1', '4.2.2.360924', '1', '4', '宜丰县', '24', 'YFX', null, '003036009024', null);
INSERT INTO `pa_bmzd` VALUES ('AB7A4002A6EE4AF594CCEEEDFBECD721', '2015-05-03 11:15:45', '安徽省阜阳市界首市', '1', '4.2.2.341282', '1', '4', '界首市', '82', 'JSS', null, '003034012082', null);
INSERT INTO `pa_bmzd` VALUES ('AB852566F76540C19723FAE7CE7F7BA1', '2015-05-03 11:15:45', '四川省攀枝花市米易县', '1', '4.2.2.510421', '1', '4', '米易县', '21', 'MYX', null, '003051004021', null);
INSERT INTO `pa_bmzd` VALUES ('AB96CDAEDFAA4E3F94CB4ACE696D67FD', '2015-05-03 11:15:45', '山东省烟台市莱阳市', '1', '4.2.2.370682', '1', '4', '莱阳市', '82', 'LYS', null, '003037006082', null);
INSERT INTO `pa_bmzd` VALUES ('AB9AD67F155C48E193E07A4ABA52ED16', '2015-05-03 11:15:45', '河北省廊坊市永清县', '1', '4.2.2.131023', '1', '4', '永清县', '23', 'YQX', null, '003013010023', null);
INSERT INTO `pa_bmzd` VALUES ('ABA14F37E88947F4944E3F7F97DF03EA', '2015-05-03 11:15:45', '河南省漯河市源汇区', '1', '4.2.2.411102', '1', '4', '源汇区', '2', 'YHQ', null, '003041011002', null);
INSERT INTO `pa_bmzd` VALUES ('ABB7C795CB454012B096BD661259C779', '2015-05-03 11:15:45', '贵州省黔东南苗族侗族自治州榕江县', '1', '4.2.2.522632', '1', '4', '榕江县', '32', 'RJX', null, '003052026032', null);
INSERT INTO `pa_bmzd` VALUES ('ABDAF0D93E4848E88FFA155421B83876', '2015-05-03 11:15:45', '辽宁省丹东市东港市', '1', '4.2.2.210681', '1', '4', '东港市', '81', 'DGS', null, '003021006081', null);
INSERT INTO `pa_bmzd` VALUES ('ABE08C5D12984D2B970C18D28D9B9220', '2015-05-03 11:15:45', '甘肃省陇南市西和县', '1', '4.2.2.621225', '1', '4', '西和县', '25', 'XHX', null, '003062012025', null);
INSERT INTO `pa_bmzd` VALUES ('AC1C7C61986B438DBF0608159C4E0AC3', '2015-05-03 11:15:45', '贵州省安顺市平坝县', '1', '4.2.2.520421', '1', '4', '平坝县', '21', 'PBX', null, '003052004021', null);
INSERT INTO `pa_bmzd` VALUES ('AC38C39AAA1D4C1C8DE3257B62262004', '2015-05-03 11:15:45', '陕西省铜川市王益区', '1', '4.2.2.610202', '1', '4', '王益区', '2', 'WYQ', null, '003061002002', null);
INSERT INTO `pa_bmzd` VALUES ('AC3F52B191C3497B95C1AE22EB271D4C', '2015-05-03 11:15:45', '陕西省西安市市辖区', '1', '4.2.2.610101', '1', '4', '市辖区', '1', 'SXQ', null, '003061001001', null);
INSERT INTO `pa_bmzd` VALUES ('AC6A7277B5E84F438F2345E4E9068003', '2015-05-03 11:15:45', '云南省昭通市巧家县', '1', '4.2.2.530622', '1', '4', '巧家县', '22', 'QJX', null, '003053006022', null);
INSERT INTO `pa_bmzd` VALUES ('AC6A95C3A6664094A8E5016E7B196678', '2015-05-03 11:15:45', '江苏省', '1', '4.2.2.320000', '0', '2', '江苏省', '32', 'JSS', null, '003032', null);
INSERT INTO `pa_bmzd` VALUES ('AC93F31868B7496CA421B42B1AF31132', '2015-05-03 11:15:45', '黑龙江省哈尔滨市香坊区', '1', '4.2.2.230110', '1', '4', '香坊区', '10', 'XFQ', null, '003023001010', null);
INSERT INTO `pa_bmzd` VALUES ('ACB5F27A932F48E18958670E51C1A747', '2015-05-03 11:15:45', '广西壮族自治区钦州市钦南区', '1', '4.2.2.450702', '1', '4', '钦南区', '2', 'QNQ', null, '003045007002', null);
INSERT INTO `pa_bmzd` VALUES ('ACF1AF7DE2064A5E9DCA67B82564C956', '2015-05-03 11:15:45', '湖北省十堰市竹溪县', '1', '4.2.2.420324', '1', '4', '竹溪县', '24', 'ZXX', null, '003042003024', null);
INSERT INTO `pa_bmzd` VALUES ('AD06949B80E747BA8D2CEC31623557B6', '2015-05-03 11:15:45', '陕西省榆林市榆阳区', '1', '4.2.2.610802', '1', '4', '榆阳区', '2', 'YYQ', null, '003061008002', null);
INSERT INTO `pa_bmzd` VALUES ('AD472FEB3C864B8F9A2B4ACBE0959D5C', '2015-05-03 11:15:45', '湖北省武汉市新洲区', '1', '4.2.2.420117', '1', '4', '新洲区', '17', 'XZQ', null, '003042001017', null);
INSERT INTO `pa_bmzd` VALUES ('AD51053A943C419A85EB42652D181179', '2015-05-03 11:15:45', '江苏省泰州市兴化市', '1', '4.2.2.321281', '1', '4', '兴化市', '81', 'XHS', null, '003032012081', null);
INSERT INTO `pa_bmzd` VALUES ('AD51B159538946A3BBE562D20DA275AB', '2015-05-03 11:15:45', '浙江省温州市', '1', '4.2.2.330300', '0', '3', '温州市', '3', 'WZS', null, '003033003', null);
INSERT INTO `pa_bmzd` VALUES ('AD63F876701C443288CBD51AA98DB474', '2015-05-03 11:15:45', '辽宁省沈阳市法库县', '1', '4.2.2.210124', '1', '4', '法库县', '24', 'FKX', null, '003021001024', null);
INSERT INTO `pa_bmzd` VALUES ('AD7573BE52AF4414A275FEA5F7A1E029', '2015-05-03 11:15:45', '河北省邯郸市成安县', '1', '4.2.2.130424', '1', '4', '成安县', '24', 'CAX', null, '003013004024', null);
INSERT INTO `pa_bmzd` VALUES ('AD759813ACA74FA79141E7E5A3FFC784', '2015-05-03 11:15:45', '浙江省杭州市西湖区', '1', '4.2.2.330106', '1', '4', '西湖区', '6', 'XHQ', null, '003033001006', null);
INSERT INTO `pa_bmzd` VALUES ('AD7DF7F2E9D14CDDAACCF60574BC9BC6', '2015-05-03 11:15:45', '福建省泉州市金门县', '1', '4.2.2.350527', '1', '4', '金门县', '27', 'JMX', null, '003035005027', null);
INSERT INTO `pa_bmzd` VALUES ('ADB1EFF19C2E4DB890FF76623A349794', '2015-05-03 11:15:45', '内蒙古自治区包头市白云鄂博矿区', '1', '4.2.2.150206', '1', '4', '白云鄂博矿区', '6', 'BYEBKQ', null, '003015002006', null);
INSERT INTO `pa_bmzd` VALUES ('ADB2DC8959314E388273DD4BC63139AA', '2015-05-03 11:15:45', '湖北省黄石市黄石港区', '1', '4.2.2.420202', '1', '4', '黄石港区', '2', 'HSGQ', null, '003042002002', null);
INSERT INTO `pa_bmzd` VALUES ('ADBC5A105C3144A4A81D3B3C87417494', '2015-05-03 11:15:45', '重庆市县巫山县', '1', '4.2.2.500237', '1', '4', '巫山县', '37', 'WSX', null, '003050002037', null);
INSERT INTO `pa_bmzd` VALUES ('ADCC68D704B24B8C903836DA774C0D97', '2015-05-03 11:15:45', '四川省泸州市龙马潭区', '1', '4.2.2.510504', '1', '4', '龙马潭区', '4', 'LMTQ', null, '003051005004', null);
INSERT INTO `pa_bmzd` VALUES ('ADD74CA8EF804ACBA1DEDADD73DBB4A4', '2015-05-03 11:15:45', '青海省西宁市城中区', '1', '4.2.2.630103', '1', '4', '城中区', '3', 'CZQ', null, '003063001003', null);
INSERT INTO `pa_bmzd` VALUES ('ADD75A914B4C4C548260A1CA9AC7A6E5', '2015-05-03 11:15:45', '黑龙江省大兴安岭地区塔河县', '1', '4.2.2.232722', '1', '4', '塔河县', '22', 'THX', null, '003023027022', null);
INSERT INTO `pa_bmzd` VALUES ('ADE298FCB2BF420FAF4E41DF2B105E7B', '2015-05-03 11:15:45', '山西省阳泉市矿区', '1', '4.2.2.140303', '1', '4', '矿区', '3', 'KQ', null, '003014003003', null);
INSERT INTO `pa_bmzd` VALUES ('AE0C6BAAAE334E94A170F2FA02D11FF5', '2015-05-03 11:15:45', '湖南省永州市市辖区', '1', '4.2.2.431101', '1', '4', '市辖区', '1', 'SXQ', null, '003043011001', null);
INSERT INTO `pa_bmzd` VALUES ('AE3455922F3E44E29579D903BD8865AD', '2015-05-03 11:15:45', '江西省吉安市吉安县', '1', '4.2.2.360821', '1', '4', '吉安县', '21', 'JAX', null, '003036008021', null);
INSERT INTO `pa_bmzd` VALUES ('AE45F4EA363D40C0B5647AD4B64E64D0', '2015-05-03 11:15:45', '广东省梅州市大埔县', '1', '4.2.2.441422', '1', '4', '大埔县', '22', 'DPX', null, '003044014022', null);
INSERT INTO `pa_bmzd` VALUES ('AE61C72C32E045E2B7A63E104C46EC19', '2015-05-03 11:15:45', '河北省沧州市市辖区', '1', '4.2.2.130901', '1', '4', '市辖区', '1', 'SXQ', null, '003013009001', null);
INSERT INTO `pa_bmzd` VALUES ('AE86FA9ABB7E4432886BC5CE3BFB2AE9', '2015-05-03 11:15:45', '云南省曲靖市沾益县', '1', '4.2.2.530328', '1', '4', '沾益县', '28', 'ZYX', null, '003053003028', null);
INSERT INTO `pa_bmzd` VALUES ('AE9EF372C88D42F7AF9AD06C5D7C43F2', '2015-05-03 11:15:45', '重庆市县忠县', '1', '4.2.2.500233', '1', '4', '忠县', '33', 'ZX', null, '003050002033', null);
INSERT INTO `pa_bmzd` VALUES ('AEAE2651CED945999524630E95785E1D', '2015-05-03 11:15:45', '安徽省芜湖市芜湖县', '1', '4.2.2.340221', '1', '4', '芜湖县', '21', 'WHX', null, '003034002021', null);
INSERT INTO `pa_bmzd` VALUES ('AEB4CDB8C94742729B014E4FD373CF91', '2015-05-03 11:15:45', '河北省石家庄市井陉矿区', '1', '4.2.2.130107', '1', '4', '井陉矿区', '7', 'JXKQ', null, '003013001007', null);
INSERT INTO `pa_bmzd` VALUES ('AEBF57CD9B46427CB8A7C73FF0E438D1', '2015-05-03 11:15:45', '贵州省黔西南布依族苗族自治州贞丰县', '1', '4.2.2.522325', '1', '4', '贞丰县', '25', 'ZFX', null, '003052023025', null);
INSERT INTO `pa_bmzd` VALUES ('AEC8C3984E7C457CADFB5EE1246CA1AD', '2015-05-03 11:15:45', '新疆维吾尔自治区克孜勒苏柯尔克孜自治州阿图什市', '1', '4.2.2.653001', '1', '4', '阿图什市', '1', 'ATSS', null, '003065030001', null);
INSERT INTO `pa_bmzd` VALUES ('AEDE753F742A4BC6B789A34F0C37CE0A', '2015-05-03 11:15:45', '山东省济南市槐荫区', '1', '4.2.2.370104', '1', '4', '槐荫区', '4', 'HYQ', null, '003037001004', null);
INSERT INTO `pa_bmzd` VALUES ('AEE09F75431D420DB1BD0C3E99C658FF', '2015-05-03 11:15:45', '云南省曲靖市会泽县', '1', '4.2.2.530326', '1', '4', '会泽县', '26', 'KZX', null, '003053003026', null);
INSERT INTO `pa_bmzd` VALUES ('AEE2C62690E047D4B643DD396AE29811', '2015-05-03 11:15:45', '山东省泰安市市辖区', '1', '4.2.2.370901', '1', '4', '市辖区', '1', 'SXQ', null, '003037009001', null);
INSERT INTO `pa_bmzd` VALUES ('AEF9D9D136FA4CF9A28C46A96427C4FE', '2015-05-03 11:15:45', '宁夏回族自治区固原市彭阳县', '1', '4.2.2.640425', '1', '4', '彭阳县', '25', 'PYX', null, '003064004025', null);
INSERT INTO `pa_bmzd` VALUES ('AF2CB6801D49446CBBFAD7C8564D84E3', '2015-05-03 11:15:45', '安徽省宣城市广德县', '1', '4.2.2.341822', '1', '4', '广德县', '22', 'GDX', null, '003034018022', null);
INSERT INTO `pa_bmzd` VALUES ('AF311EB45B7947939FD762DD7C49115D', '2015-05-03 11:15:45', '山东省潍坊市潍城区', '1', '4.2.2.370702', '1', '4', '潍城区', '2', 'WCQ', null, '003037007002', null);
INSERT INTO `pa_bmzd` VALUES ('AF36626FF9074CB0A8218DDA4775C39C', '2015-05-03 11:15:45', '山东省淄博市临淄区', '1', '4.2.2.370305', '1', '4', '临淄区', '5', 'LZQ', null, '003037003005', null);
INSERT INTO `pa_bmzd` VALUES ('AF5AB54FEEA14700A6F0588478C2CA2E', '2015-05-03 11:15:45', '安徽省合肥市肥西县', '1', '4.2.2.340123', '1', '4', '肥西县', '23', 'FXX', null, '003034001023', null);
INSERT INTO `pa_bmzd` VALUES ('AFA38A4A86ED4F00A3D387697B2FE27D', '2015-05-03 11:15:45', '宁夏回族自治区吴忠市利通区', '1', '4.2.2.640302', '1', '4', '利通区', '2', 'LTQ', null, '003064003002', null);
INSERT INTO `pa_bmzd` VALUES ('AFBEC383BE914D0499AC6762B4472139', '2015-05-03 11:15:45', '山东省淄博市高青县', '1', '4.2.2.370322', '1', '4', '高青县', '22', 'GQX', null, '003037003022', null);
INSERT INTO `pa_bmzd` VALUES ('AFE0070F800B4323ABAFE64559B946DA', '2015-05-03 11:15:45', '浙江省嘉兴市南湖区', '1', '4.2.2.330402', '1', '4', '南湖区', '2', 'NHQ', null, '003033004002', null);
INSERT INTO `pa_bmzd` VALUES ('AFEBBA064697407EA60712B2D516422D', '2015-05-03 11:15:45', '河南省三门峡市义马市', '1', '4.2.2.411281', '1', '4', '义马市', '81', 'YMS', null, '003041012081', null);
INSERT INTO `pa_bmzd` VALUES ('B034E1E0084C480DBF2613E13AA53C06', '2015-05-03 11:15:45', '湖南省衡阳市祁东县', '1', '4.2.2.430426', '1', '4', '祁东县', '26', 'QDX', null, '003043004026', null);
INSERT INTO `pa_bmzd` VALUES ('B0423E7378B24FCD98FD8816553A1F81', '2015-05-03 11:15:45', '山东省滨州市阳信县', '1', '4.2.2.371622', '1', '4', '阳信县', '22', 'YXX', null, '003037016022', null);
INSERT INTO `pa_bmzd` VALUES ('B0784F1652A24A079DAA1ABF254B9F96', '2015-05-03 11:15:45', '海南省省直辖县级行政区划南沙群岛', '1', '4.2.2.469038', '1', '4', '南沙群岛', '32', 'NSQD', null, '003046090032', null);
INSERT INTO `pa_bmzd` VALUES ('B09C731065244C21AD3CE301BF82E09E', '2015-05-03 11:15:45', '江西省九江市彭泽县', '1', '4.2.2.360430', '1', '4', '彭泽县', '30', 'PZX', null, '003036004030', null);
INSERT INTO `pa_bmzd` VALUES ('B09E86A65E984458BB2EE8103A9B65ED', '2015-05-03 11:15:45', '宁夏回族自治区银川市市辖区', '1', '4.2.2.640101', '1', '4', '市辖区', '1', 'SXQ', null, '003064001001', null);
INSERT INTO `pa_bmzd` VALUES ('B0D8BEE7CBD145FA9373A455F3B3B368', '2015-05-03 11:15:45', '广西壮族自治区崇左市龙州县', '1', '4.2.2.451423', '1', '4', '龙州县', '23', 'LZX', null, '003045014023', null);
INSERT INTO `pa_bmzd` VALUES ('B0F2856CD50E4EE58B7CDCECA5B61BDD', '2015-05-03 11:15:45', '广东省江门市蓬江区', '1', '4.2.2.440703', '1', '4', '蓬江区', '3', 'PJQ', null, '003044007003', null);
INSERT INTO `pa_bmzd` VALUES ('B1009A3E63574894A497556483527411', '2015-05-03 11:15:45', '内蒙古自治区阿拉善盟阿拉善左旗', '1', '4.2.2.152921', '1', '4', '阿拉善左旗', '21', 'ALSZQ', null, '003015029021', null);
INSERT INTO `pa_bmzd` VALUES ('B1271D34EFC04356A0E5797AA8FEC462', '2015-05-03 11:15:45', '云南省红河哈尼族彝族自治州河口瑶族自治县', '1', '4.2.2.532532', '1', '4', '河口瑶族自治县', '32', 'HKYZZZX', null, '003053025032', null);
INSERT INTO `pa_bmzd` VALUES ('B12A1E573F04419D87652000B1958AE5', '2015-05-03 11:15:45', '安徽省芜湖市无为县', '1', '4.2.2.340224', '1', '4', '无为县', '25', 'WWX', null, '003034002025', null);
INSERT INTO `pa_bmzd` VALUES ('B1316E3BCD47430A9022731656ABD9A6', '2015-05-03 11:15:45', '山西省忻州市代县', '1', '4.2.2.140923', '1', '4', '代县', '23', 'DX', null, '003014009023', null);
INSERT INTO `pa_bmzd` VALUES ('B14222259F8E4D339B8B5CBF6729BBB3', '2015-05-03 11:15:45', '山西省临汾市古县', '1', '4.2.2.141025', '1', '4', '古县', '25', 'GX', null, '003014010025', null);
INSERT INTO `pa_bmzd` VALUES ('B15B4E22383F4084A474789B510E3406', '2015-05-03 11:15:45', '陕西省商洛市柞水县', '1', '4.2.2.611026', '1', '4', '柞水县', '26', 'ZSX', null, '003061010026', null);
INSERT INTO `pa_bmzd` VALUES ('B18C61D8B33B4E0F92A5B5AFBA1F1601', '2015-05-03 11:15:45', '陕西省榆林市府谷县', '1', '4.2.2.610822', '1', '4', '府谷县', '22', 'FYX', null, '003061008022', null);
INSERT INTO `pa_bmzd` VALUES ('B193C1DCCFE24D44BC02B137E6978A6E', '2015-05-03 11:15:45', '云南省曲靖市师宗县', '1', '4.2.2.530323', '1', '4', '师宗县', '23', 'SZX', null, '003053003023', null);
INSERT INTO `pa_bmzd` VALUES ('B1AC12E713C54E48B0042879F3BBF71D', '2015-05-03 11:15:45', '安徽省芜湖市三山区', '1', '4.2.2.340208', '1', '4', '三山区', '8', 'SSQ', null, '003034002008', null);
INSERT INTO `pa_bmzd` VALUES ('B1BD408E98844FAE9EB9D1F065F6B58E', '2015-05-03 11:15:45', '四川省成都市锦江区', '1', '4.2.2.510104', '1', '4', '锦江区', '4', 'JJQ', null, '003051001004', null);
INSERT INTO `pa_bmzd` VALUES ('B1C674FFD72B49AA90BC9C0755CD86F3', '2015-05-03 11:15:45', '福建省泉州市永春县', '1', '4.2.2.350525', '1', '4', '永春县', '25', 'YCX', null, '003035005025', null);
INSERT INTO `pa_bmzd` VALUES ('B1CDEADEA6AF47DE8F3DDAE2CE5CAD88', '2015-05-03 11:15:45', '安徽省铜陵市市辖区', '1', '4.2.2.340701', '1', '4', '市辖区', '1', 'SXQ', null, '003034007001', null);
INSERT INTO `pa_bmzd` VALUES ('B1D5678BF8024E2B8AA1776F773BF833', '2015-05-03 11:15:45', '河南省周口市商水县', '1', '4.2.2.411623', '1', '4', '商水县', '23', 'SSX', null, '003041016023', null);
INSERT INTO `pa_bmzd` VALUES ('B1D689105C554D70BE10E065BE157397', '2015-05-03 11:15:45', '河南省安阳市汤阴县', '1', '4.2.2.410523', '1', '4', '汤阴县', '23', 'TYX', null, '003041005023', null);
INSERT INTO `pa_bmzd` VALUES ('B1DBED1D10564EA8966574F0FEAE147F', '2015-05-03 11:15:45', '河北省廊坊市霸州市', '1', '4.2.2.131081', '1', '4', '霸州市', '81', 'BZS', null, '003013010081', null);
INSERT INTO `pa_bmzd` VALUES ('B1E4EE2BD1664EF9B66DD8F328BA5544', '2015-05-03 11:15:45', '上海市市辖区闸北区', '1', '4.2.2.310108', '1', '4', '闸北区', '8', 'ZBQ', null, '003031001008', null);
INSERT INTO `pa_bmzd` VALUES ('B1EEC823B7A44BF583F54AB572318E9A', '2015-05-03 11:15:45', '河南省洛阳市洛龙区', '1', '4.2.2.410307', '1', '4', '洛龙区', '11', 'LLQ', null, '003041003011', null);
INSERT INTO `pa_bmzd` VALUES ('B20C5BD7A2F74C4080EDA8DC0252C4B4', '2015-05-03 11:15:45', '云南省红河哈尼族彝族自治州绿春县', '1', '4.2.2.532531', '1', '4', '绿春县', '31', 'LCX', null, '003053025031', null);
INSERT INTO `pa_bmzd` VALUES ('B22427D7512F4BF4902286614E43F78F', '2015-05-03 11:15:45', '云南省曲靖市宣威市', '1', '4.2.2.530381', '1', '4', '宣威市', '81', 'XWS', null, '003053003081', null);
INSERT INTO `pa_bmzd` VALUES ('B22753E84AAA471BB16AEA869F1FB8FA', '2015-05-03 11:15:45', '云南省昭通市大关县', '1', '4.2.2.530624', '1', '4', '大关县', '24', 'DGX', null, '003053006024', null);
INSERT INTO `pa_bmzd` VALUES ('B22D4ED57FAF4ADC949652C700BD334B', '2015-05-03 11:15:45', '甘肃省兰州市红古区', '1', '4.2.2.620111', '1', '4', '红古区', '11', 'HGQ', null, '003062001011', null);
INSERT INTO `pa_bmzd` VALUES ('B2340DF5AD7D4DF082250EFAF88355AD', '2015-05-03 11:15:45', '云南省红河哈尼族彝族自治州石屏县', '1', '4.2.2.532525', '1', '4', '石屏县', '25', 'SPX', null, '003053025025', null);
INSERT INTO `pa_bmzd` VALUES ('B23613AAFD64469D985E3579134EB342', '2015-05-03 11:15:45', '广东省潮州市饶平县', '1', '4.2.2.445122', '1', '4', '饶平县', '22', 'RPX', null, '003044051022', null);
INSERT INTO `pa_bmzd` VALUES ('B23D780FBD424371B707921B51D2FB22', '2015-05-03 11:15:45', '江西省赣州市定南县', '1', '4.2.2.360728', '1', '4', '定南县', '28', 'DNX', null, '003036007028', null);
INSERT INTO `pa_bmzd` VALUES ('B24EF9739F0A4BB195230B7EE5C3B4AB', '2015-05-03 11:15:45', '青海省果洛藏族自治州久治县', '1', '4.2.2.632625', '1', '4', '久治县', '25', 'JZX', null, '003063026025', null);
INSERT INTO `pa_bmzd` VALUES ('B281D0D55AB24A6780924F195DB36BEA', '2015-05-03 11:15:45', '青海省海南藏族自治州贵德县', '1', '4.2.2.632523', '1', '4', '贵德县', '23', 'GDX', null, '003063025023', null);
INSERT INTO `pa_bmzd` VALUES ('B28A8114EAF748D7B1CD5B234A4263DD', '2015-05-03 11:15:45', '广西壮族自治区柳州市三江侗族自治县', '1', '4.2.2.450226', '1', '4', '三江侗族自治县', '26', 'SJTZZZX', null, '003045002026', null);
INSERT INTO `pa_bmzd` VALUES ('B2C509E08F0143CCA5864E0C79A3C95D', '2015-05-03 11:15:45', '江苏省苏州市吴江市', '1', '4.2.2.320584', '1', '4', '吴江市', '84', 'WJS', null, '003032005084', null);
INSERT INTO `pa_bmzd` VALUES ('B2C8422A96044A199A631E776EA91CC8', '2015-05-03 11:15:45', '河南省郑州市新密市', '1', '4.2.2.410183', '1', '4', '新密市', '83', 'XMS', null, '003041001083', null);
INSERT INTO `pa_bmzd` VALUES ('B2C998DF2B0244CD85370110711B9248', '2015-05-03 11:15:45', '黑龙江省牡丹江市市辖区', '1', '4.2.2.231001', '1', '4', '市辖区', '1', 'SXQ', null, '003023010001', null);
INSERT INTO `pa_bmzd` VALUES ('B2EAEC31D9D8408E9342CE1357D2C8FD', '2015-05-03 11:15:45', '湖北省荆门市掇刀区', '1', '4.2.2.420804', '1', '4', '掇刀区', '4', 'DDQ', null, '003042008004', null);
INSERT INTO `pa_bmzd` VALUES ('B31F43D6F0B9404EBDA79A7C9B1229CB', '2015-05-03 11:15:45', '河北省邯郸市魏县', '1', '4.2.2.130434', '1', '4', '魏县', '34', 'WX', null, '003013004034', null);
INSERT INTO `pa_bmzd` VALUES ('B32FB4E26F634E2D948D1BC608F518F5', '2015-05-03 11:15:45', '广东省珠海市金湾区', '1', '4.2.2.440404', '1', '4', '金湾区', '4', 'JWQ', null, '003044004004', null);
INSERT INTO `pa_bmzd` VALUES ('B33E6C7938314145AE3002D0561C2D8B', '2015-05-03 11:15:45', '辽宁省本溪市', '1', '4.2.2.210500', '0', '3', '本溪市', '5', 'BXS', null, '003021005', null);
INSERT INTO `pa_bmzd` VALUES ('B33EEF42356E42AE8BF61846466826B3', '2015-05-03 11:15:45', '山东省济南市平阴县', '1', '4.2.2.370124', '1', '4', '平阴县', '24', 'PYX', null, '003037001024', null);
INSERT INTO `pa_bmzd` VALUES ('B34853EDE8EE4FEA9672ED957C8A0C01', '2015-05-03 11:15:45', '江苏省南通市启东市', '1', '4.2.2.320681', '1', '4', '启东市', '81', 'QDS', null, '003032006081', null);
INSERT INTO `pa_bmzd` VALUES ('B36D354F09F04DA4A0361653F704C690', '2015-05-03 11:15:45', '湖北省随州市随县', '1', '4.2.2.421321', '1', '4', '随县', '21', 'SX', null, '003042013021', null);
INSERT INTO `pa_bmzd` VALUES ('B36D5BC290C241D38124FC802AAC63BC', '2015-05-03 11:15:45', '广东省茂名市高州市', '1', '4.2.2.440981', '1', '4', '高州市', '81', 'GZS', null, '003044009081', null);
INSERT INTO `pa_bmzd` VALUES ('B37D8DEE4563429B8FDB9093B441509A', '2015-05-03 11:15:45', '青海省西宁市城西区', '1', '4.2.2.630104', '1', '4', '城西区', '4', 'CXQ', null, '003063001004', null);
INSERT INTO `pa_bmzd` VALUES ('B37E037E310A40158F6155F0330703BB', '2015-05-03 11:15:45', '湖南省邵阳市绥宁县', '1', '4.2.2.430527', '1', '4', '绥宁县', '27', 'SNX', null, '003043005027', null);
INSERT INTO `pa_bmzd` VALUES ('B38F86DE7D3449968189DD64422DD118', '2015-05-03 11:15:45', '四川省南充市蓬安县', '1', '4.2.2.511323', '1', '4', '蓬安县', '23', 'PAX', null, '003051013023', null);
INSERT INTO `pa_bmzd` VALUES ('B397C179065D497A9B07F6B7BAA77C2C', '2015-05-03 11:15:45', '云南省昆明市寻甸回族彝族自治县', '1', '4.2.2.530129', '1', '4', '寻甸回族彝族自治县', '29', 'XDHZYZZZX', null, '003053001029', null);
INSERT INTO `pa_bmzd` VALUES ('B3A2936A4B544AF08DF7B2EBEC2805E3', '2015-05-03 11:15:45', '浙江省金华市磐安县', '1', '4.2.2.330727', '1', '4', '磐安县', '27', 'PAX', null, '003033007027', null);
INSERT INTO `pa_bmzd` VALUES ('B3BE58489D4C458B94056757A6929788', '2015-05-03 11:15:45', '浙江省金华市兰溪市', '1', '4.2.2.330781', '1', '4', '兰溪市', '81', 'LXS', null, '003033007081', null);
INSERT INTO `pa_bmzd` VALUES ('B3D9DBCEF3B94A2AB1CC6F3AA8D3C33E', '2015-05-03 11:15:45', '福建省厦门市', '1', '4.2.2.350200', '0', '3', '厦门市', '2', 'XMS', null, '003035002', null);
INSERT INTO `pa_bmzd` VALUES ('B3FE0FECCCDA4D2F95A68CFFD57F764D', '2015-05-03 11:15:45', '山东省青岛市市北区', '1', '4.2.2.370203', '1', '4', '市北区', '3', 'SBQ', null, '003037002003', null);
INSERT INTO `pa_bmzd` VALUES ('B41A58007C6C4D9FA283940358F94A30', '2015-05-03 11:15:45', '湖南省怀化市麻阳苗族自治县', '1', '4.2.2.431226', '1', '4', '麻阳苗族自治县', '26', 'MYMZZZX', null, '003043012026', null);
INSERT INTO `pa_bmzd` VALUES ('B41B9006A30748D6AB1B0468C427018C', '2015-05-03 11:15:45', '湖南省湘西土家族苗族自治州龙山县', '1', '4.2.2.433130', '1', '4', '龙山县', '30', 'LSX', null, '003043031030', null);
INSERT INTO `pa_bmzd` VALUES ('B42A557781274EA08736F5704E6BA301', '2015-05-03 11:15:45', '湖北省黄石市', '1', '4.2.2.420200', '0', '3', '黄石市', '2', 'HSS', null, '003042002', null);
INSERT INTO `pa_bmzd` VALUES ('B43643EC2E174255BE39794627023F6B', '2015-05-03 11:15:45', '湖北省黄石市西塞山区', '1', '4.2.2.420203', '1', '4', '西塞山区', '3', 'XSSQ', null, '003042002003', null);
INSERT INTO `pa_bmzd` VALUES ('B447C46577694F299D00FF658FE2D161', '2015-05-03 11:15:45', '北京市市辖区', '1', '4.2.2.110100', '0', '3', '市辖区', '1', 'SXQ', null, '003011001', null);
INSERT INTO `pa_bmzd` VALUES ('B44FC0F071394B4CA1EC1AF67E8D3B4C', '2015-05-03 11:15:45', '河北省张家口市市辖区', '1', '4.2.2.130701', '1', '4', '市辖区', '1', 'SXQ', null, '003013007001', null);
INSERT INTO `pa_bmzd` VALUES ('B4618A56837C4037AF87EDD17D28296C', '2015-05-03 11:15:45', '江苏省镇江市润州区', '1', '4.2.2.321111', '1', '4', '润州区', '11', 'RZQ', null, '003032011011', null);
INSERT INTO `pa_bmzd` VALUES ('B46A8784C08E4BB9B854CB13247451B9', '2015-05-03 11:15:45', '云南省玉溪市市辖区', '1', '4.2.2.530401', '1', '4', '市辖区', '1', 'SXQ', null, '003053004001', null);
INSERT INTO `pa_bmzd` VALUES ('B4706ED8ABE04188B2F5571A506E57D9', '2015-05-03 11:15:45', '四川省绵阳市', '1', '4.2.2.510700', '0', '3', '绵阳市', '7', 'MYS', null, '003051007', null);
INSERT INTO `pa_bmzd` VALUES ('B48638B7D2444208901093F95C68493D', '2015-05-03 11:15:45', '甘肃省陇南市文县', '1', '4.2.2.621222', '1', '4', '文县', '22', 'WX', null, '003062012022', null);
INSERT INTO `pa_bmzd` VALUES ('B494C1E86BFA48019E4475BC222DB539', '2015-05-03 11:15:45', '河北省邯郸市临漳县', '1', '4.2.2.130423', '1', '4', '临漳县', '23', 'LZX', null, '003013004023', null);
INSERT INTO `pa_bmzd` VALUES ('B4B0A4B328ED4EF78DDEA81A850C4C3B', '2015-05-03 11:15:45', '宁夏回族自治区中卫市中宁县', '1', '4.2.2.640521', '1', '4', '中宁县', '21', 'ZNX', null, '003064005021', null);
INSERT INTO `pa_bmzd` VALUES ('B4BB293F568445CBB5E2D890862F0E6F', '2015-05-03 11:15:45', '山西省太原市', '1', '4.2.2.140100', '0', '3', '太原市', '1', 'TYS', null, '003014001', null);
INSERT INTO `pa_bmzd` VALUES ('B4BCD36B49B04B479AEA1126469D5A6B', '2015-05-03 11:15:45', '河北省邢台市平乡县', '1', '4.2.2.130532', '1', '4', '平乡县', '32', 'PXX', null, '003013005032', null);
INSERT INTO `pa_bmzd` VALUES ('B4DA1F286FE64491890A4F7E4EBACE5D', '2015-05-03 11:15:45', '安徽省安庆市宜秀区', '1', '4.2.2.340811', '1', '4', '宜秀区', '11', 'YXQ', null, '003034008011', null);
INSERT INTO `pa_bmzd` VALUES ('B4E314D20D6B48739DFA2765FAE1E58C', '2015-05-03 11:15:45', '新疆维吾尔自治区哈密地区巴里坤哈萨克自治县', '1', '4.2.2.652222', '1', '4', '巴里坤哈萨克自治县', '22', 'BLKHSKZZX', null, '003065022022', null);
INSERT INTO `pa_bmzd` VALUES ('B4EFE189037C4BA491C41A6C462037CC', '2015-05-03 11:15:45', '湖北省咸宁市市辖区', '1', '4.2.2.421201', '1', '4', '市辖区', '1', 'SXQ', null, '003042012001', null);
INSERT INTO `pa_bmzd` VALUES ('B4F8F9E9F7C5416DB207C611FA1A2ADB', '2015-05-03 11:15:45', '青海省黄南藏族自治州同仁县', '1', '4.2.2.632321', '1', '4', '同仁县', '21', 'TRX', null, '003063023021', null);
INSERT INTO `pa_bmzd` VALUES ('B509B3315D1E48C3A642FBB67E7E68D6', '2015-05-03 11:15:45', '黑龙江省大庆市龙凤区', '1', '4.2.2.230603', '1', '4', '龙凤区', '3', 'LFQ', null, '003023006003', null);
INSERT INTO `pa_bmzd` VALUES ('B51300F2118247F0A0298B38E86C3B61', '2015-05-03 11:15:45', '湖南省衡阳市常宁市', '1', '4.2.2.430482', '1', '4', '常宁市', '82', 'CNS', null, '003043004082', null);
INSERT INTO `pa_bmzd` VALUES ('B515BD33722E42BF94E47AD8A7817F31', '2015-05-03 11:15:45', '四川省阿坝藏族羌族自治州阿坝县', '1', '4.2.2.513231', '1', '4', '阿坝县', '31', 'ABX', null, '003051032031', null);
INSERT INTO `pa_bmzd` VALUES ('B5164289968942168842D260F0CB405F', '2015-05-03 11:15:45', '浙江省衢州市柯城区', '1', '4.2.2.330802', '1', '4', '柯城区', '2', 'KCQ', null, '003033008002', null);
INSERT INTO `pa_bmzd` VALUES ('B543DEB442AC425389D81F16207DC740', '2015-05-03 11:15:45', '山东省济南市长清区', '1', '4.2.2.370113', '1', '4', '长清区', '13', 'ZQQ', null, '003037001013', null);
INSERT INTO `pa_bmzd` VALUES ('B5451ADFE6B44E1B91369A4062B12573', '2015-05-03 11:15:45', '河北省张家口市下花园区', '1', '4.2.2.130706', '1', '4', '下花园区', '6', 'XHYQ', null, '003013007006', null);
INSERT INTO `pa_bmzd` VALUES ('B54C48EC8ED24D958ED1FA18FADF2ED6', '2015-05-03 11:15:45', '内蒙古自治区锡林郭勒盟东乌珠穆沁旗', '1', '4.2.2.152525', '1', '4', '东乌珠穆沁旗', '25', 'DWZMQQ', null, '003015025025', null);
INSERT INTO `pa_bmzd` VALUES ('B5594BC1A1864D82A99D0E089C456D11', '2015-05-03 11:15:45', '陕西省商洛市山阳县', '1', '4.2.2.611024', '1', '4', '山阳县', '24', 'SYX', null, '003061010024', null);
INSERT INTO `pa_bmzd` VALUES ('B55BCA5641BA4FB0AD7847BB620D4160', '2015-05-03 11:15:45', '辽宁省大连市西岗区', '1', '4.2.2.210203', '1', '4', '西岗区', '3', 'XGQ', null, '003021002003', null);
INSERT INTO `pa_bmzd` VALUES ('B57CE53A03234A5D886B5A0555E1C79D', '2015-05-03 11:15:45', '四川省成都市金牛区', '1', '4.2.2.510106', '1', '4', '金牛区', '6', 'JNQ', null, '003051001006', null);
INSERT INTO `pa_bmzd` VALUES ('B587D20A8C404B858D550B400AFD5B00', '2015-05-03 11:15:45', '河北省邢台市柏乡县', '1', '4.2.2.130524', '1', '4', '柏乡县', '24', 'BXX', null, '003013005024', null);
INSERT INTO `pa_bmzd` VALUES ('B5D3C02F801C49D7A3FC1923BFDA5DFA', '2015-05-03 11:15:45', '黑龙江省双鸭山市四方台区', '1', '4.2.2.230505', '1', '4', '四方台区', '5', 'SFTQ', null, '003023005005', null);
INSERT INTO `pa_bmzd` VALUES ('B5FAA6B37FD74DC2A0E8D39C5902DFA0', '2015-05-03 11:15:45', '内蒙古自治区包头市土默特右旗', '1', '4.2.2.150221', '1', '4', '土默特右旗', '21', 'TMTYQ', null, '003015002021', null);
INSERT INTO `pa_bmzd` VALUES ('B606F627FA474C479C6AB8C5DE0914C4', '2015-05-03 11:15:45', '内蒙古自治区锡林郭勒盟镶黄旗', '1', '4.2.2.152528', '1', '4', '镶黄旗', '28', 'XHQ', null, '003015025028', null);
INSERT INTO `pa_bmzd` VALUES ('B60A23CE535E4FF699935438388BB413', '2015-05-03 11:15:45', '内蒙古自治区乌兰察布市察哈尔右翼后旗', '1', '4.2.2.150928', '1', '4', '察哈尔右翼后旗', '28', 'CHEYYHQ', null, '003015009028', null);
INSERT INTO `pa_bmzd` VALUES ('B63B891E273641F0ABBB0195311725F7', '2015-05-03 11:15:45', '四川省资阳市雁江区', '1', '4.2.2.512002', '1', '4', '雁江区', '2', 'YJQ', null, '003051020002', null);
INSERT INTO `pa_bmzd` VALUES ('B657D7AE165A45548EE374A34BAE150A', '2015-05-03 11:15:45', '河北省石家庄市正定县', '1', '4.2.2.130123', '1', '4', '正定县', '23', 'ZDX', null, '003013001023', null);
INSERT INTO `pa_bmzd` VALUES ('B66397396B314EBD9A0D446219E12D7A', '2015-05-03 11:15:45', '内蒙古自治区兴安盟', '1', '4.2.2.152200', '0', '3', '兴安盟', '22', 'XAM', null, '003015022', null);
INSERT INTO `pa_bmzd` VALUES ('B66D4DE8A1A54CB7B9594B6644753A3A', '2015-05-03 11:15:45', '广西壮族自治区来宾市', '1', '4.2.2.451300', '0', '3', '来宾市', '13', 'LBS', null, '003045013', null);
INSERT INTO `pa_bmzd` VALUES ('B676C06C157947BB87A549716078A4EE', '2015-05-03 11:15:45', '云南省楚雄彝族自治州武定县', '1', '4.2.2.532329', '1', '4', '武定县', '29', 'WDX', null, '003053023029', null);
INSERT INTO `pa_bmzd` VALUES ('B689949AE8A54BBCB3D6A77E1B339B53', '2015-05-03 11:15:45', '新疆维吾尔自治区自治区直辖县级行政区划阿拉尔市', '1', '4.2.2.659002', '1', '4', '阿拉尔市', '2', 'ALES', null, '003065090002', null);
INSERT INTO `pa_bmzd` VALUES ('B69913110BA340EC89FFD7A29320A6B3', '2015-05-03 11:15:45', '河北省廊坊市大厂回族自治县', '1', '4.2.2.131028', '1', '4', '大厂回族自治县', '28', 'DCHZZZX', null, '003013010028', null);
INSERT INTO `pa_bmzd` VALUES ('B6A4BA0D4DEE46F38CBB76CE1823FC4E', '2015-05-03 11:15:45', '宁夏回族自治区银川市', '1', '4.2.2.640100', '0', '3', '银川市', '1', 'YCS', null, '003064001', null);
INSERT INTO `pa_bmzd` VALUES ('B6C500D471204413ADEDE221DAF1F61A', '2015-05-03 11:15:45', '新疆维吾尔自治区克孜勒苏柯尔克孜自治州阿合奇县', '1', '4.2.2.653023', '1', '4', '阿合奇县', '23', 'AHQX', null, '003065030023', null);
INSERT INTO `pa_bmzd` VALUES ('B6E83331EB0440C8886B48C15CD05982', '2015-05-03 11:15:45', '新疆维吾尔自治区博尔塔拉蒙古自治州', '1', '4.2.2.652700', '0', '3', '博尔塔拉蒙古自治州', '27', 'BETLMGZZZ', null, '003065027', null);
INSERT INTO `pa_bmzd` VALUES ('B70463B6010D45BCBBE02BD02B47BCAF', '2015-05-03 11:15:45', '黑龙江省绥化市北林区', '1', '4.2.2.231202', '1', '4', '北林区', '2', 'BLQ', null, '003023012002', null);
INSERT INTO `pa_bmzd` VALUES ('B7123202013845E6A9F11EDA884E147D', '2015-05-03 11:15:45', '黑龙江省牡丹江市林口县', '1', '4.2.2.231025', '1', '4', '林口县', '25', 'LKX', null, '003023010025', null);
INSERT INTO `pa_bmzd` VALUES ('B71B1E1425414C89A3C5AF85E8952785', '2015-05-03 11:15:45', '河北省石家庄市辛集市', '1', '4.2.2.130181', '1', '4', '辛集市', '81', 'XJS', null, '003013001081', null);
INSERT INTO `pa_bmzd` VALUES ('B72FB19843074938A54FFA1099EC99F0', '2015-05-03 11:15:45', '湖北省黄冈市市辖区', '1', '4.2.2.421101', '1', '4', '市辖区', '1', 'SXQ', null, '003042011001', null);
INSERT INTO `pa_bmzd` VALUES ('B7302BC718AF4B3C8BBA627D8006BE3E', '2015-05-03 11:15:45', '湖北省十堰市竹山县', '1', '4.2.2.420323', '1', '4', '竹山县', '23', 'ZSX', null, '003042003023', null);
INSERT INTO `pa_bmzd` VALUES ('B73114C18ED14BBB9F4E71BABA885D7F', '2015-05-03 11:15:45', '西藏自治区昌都地区边坝县', '1', '4.2.2.542133', '1', '4', '边坝县', '33', 'BBX', null, '003054021033', null);
INSERT INTO `pa_bmzd` VALUES ('B73C644FC27B42FEAB3D41A906BC2013', '2015-05-03 11:15:45', '西藏自治区那曲地区索县', '1', '4.2.2.542427', '1', '4', '索县', '27', 'SX', null, '003054024027', null);
INSERT INTO `pa_bmzd` VALUES ('B74635DF3A224978B93662A74E04693D', '2015-05-03 11:15:45', '甘肃省临夏回族自治州', '1', '4.2.2.622900', '0', '3', '临夏回族自治州', '29', 'LXHZZZZ', null, '003062029', null);
INSERT INTO `pa_bmzd` VALUES ('B779436AC4B543E4B1276D49B3BF6B64', '2015-05-03 11:15:45', '河北省承德市滦平县', '1', '4.2.2.130824', '1', '4', '滦平县', '24', 'LPX', null, '003013008024', null);
INSERT INTO `pa_bmzd` VALUES ('B78429E19DAB4D6486EB5FC743BEDF85', '2015-05-03 11:15:45', '广西壮族自治区北海市合浦县', '1', '4.2.2.450521', '1', '4', '合浦县', '21', 'HPX', null, '003045005021', null);
INSERT INTO `pa_bmzd` VALUES ('B7A5398C7693444F89946489F6B3ADAA', '2015-05-03 11:15:45', '广东省韶关市仁化县', '1', '4.2.2.440224', '1', '4', '仁化县', '24', 'RHX', null, '003044002024', null);
INSERT INTO `pa_bmzd` VALUES ('B7CEC2DBD08046769C6A168327382141', '2015-05-03 11:15:45', '山东省滨州市博兴县', '1', '4.2.2.371625', '1', '4', '博兴县', '25', 'BXX', null, '003037016025', null);
INSERT INTO `pa_bmzd` VALUES ('B7E3F1F8EADC49A0A8687EA24F9915EC', '2015-05-03 11:15:45', '广西壮族自治区南宁市马山县', '1', '4.2.2.450124', '1', '4', '马山县', '24', 'MSX', null, '003045001024', null);
INSERT INTO `pa_bmzd` VALUES ('B7F20CE23EE345C09649DE57E0090A7A', '2015-05-03 11:15:45', '湖北省黄石市市辖区', '1', '4.2.2.420201', '1', '4', '市辖区', '1', 'SXQ', null, '003042002001', null);
INSERT INTO `pa_bmzd` VALUES ('B80DDB3F3A7F4827B34835C5898CD924', '2015-05-03 11:15:45', '甘肃省武威市民勤县', '1', '4.2.2.620621', '1', '4', '民勤县', '21', 'MQX', null, '003062006021', null);
INSERT INTO `pa_bmzd` VALUES ('B81CCFCE4B79494296FA5BCA7758DA99', '2015-05-03 11:15:45', '江苏省无锡市南长区', '1', '4.2.2.320203', '1', '4', '南长区', '3', 'NZQ', null, '003032002003', null);
INSERT INTO `pa_bmzd` VALUES ('B824502116CB495788BA30DE55CE1513', '2015-05-03 11:15:45', '河北省衡水市安平县', '1', '4.2.2.131125', '1', '4', '安平县', '25', 'APX', null, '003013011025', null);
INSERT INTO `pa_bmzd` VALUES ('B84AF45713EC455CAC0FF54EFF305B1E', '2015-05-03 11:15:45', '安徽省六安市', '1', '4.2.2.341500', '0', '3', '六安市', '15', 'LAS', null, '003034015', null);
INSERT INTO `pa_bmzd` VALUES ('B84DABDF3FE346E986106B2342AE7D02', '2015-05-03 11:15:45', '甘肃省庆阳市环县', '1', '4.2.2.621022', '1', '4', '环县', '22', 'HX', null, '003062010022', null);
INSERT INTO `pa_bmzd` VALUES ('B86E3582FD7247A8B352512F76A80B34', '2015-05-03 11:15:45', '青海省海东地区互助土族自治县', '1', '4.2.2.632126', '1', '4', '互助土族自治县', '26', 'HZTZZZX', null, '003063021026', null);
INSERT INTO `pa_bmzd` VALUES ('B88035F52F2F495E8C8769A5202ED799', '2015-05-03 11:15:45', '湖北省随州市广水市', '1', '4.2.2.421381', '1', '4', '广水市', '81', 'GSS', null, '003042013081', null);
INSERT INTO `pa_bmzd` VALUES ('B8BE7C0142FA4E649D8B3FD54AAD6AAA', '2015-05-03 11:15:45', '辽宁省沈阳市沈河区', '1', '4.2.2.210103', '1', '4', '沈河区', '3', 'SHQ', null, '003021001003', null);
INSERT INTO `pa_bmzd` VALUES ('B8C3B3AEDC6B4428AB9BD8703E88DBB0', '2015-05-03 11:15:45', '四川省自贡市贡井区', '1', '4.2.2.510303', '1', '4', '贡井区', '3', 'GJQ', null, '003051003003', null);
INSERT INTO `pa_bmzd` VALUES ('B8E60F1978804F0CBB7E2CAC8A2B2691', '2015-05-03 11:15:45', '辽宁省营口市站前区', '1', '4.2.2.210802', '1', '4', '站前区', '2', 'ZQQ', null, '003021008002', null);
INSERT INTO `pa_bmzd` VALUES ('B8EA410718584440B453A91086CEE655', '2015-05-03 11:15:45', '内蒙古自治区乌兰察布市商都县', '1', '4.2.2.150923', '1', '4', '商都县', '23', 'SDX', null, '003015009023', null);
INSERT INTO `pa_bmzd` VALUES ('B8F4E28065A746AD81E82707F6DE07B3', '2015-05-03 11:15:45', '广西壮族自治区防城港市东兴市', '1', '4.2.2.450681', '1', '4', '东兴市', '81', 'DXS', null, '003045006081', null);
INSERT INTO `pa_bmzd` VALUES ('B8FC7485B8F04ED5A2FC56E22E2668EE', '2015-05-03 11:15:45', '山东省莱芜市莱城区', '1', '4.2.2.371202', '1', '4', '莱城区', '2', 'LCQ', null, '003037012002', null);
INSERT INTO `pa_bmzd` VALUES ('B9006A91B0584DA48E031E844E9066EC', '2015-05-03 11:15:45', '山西省吕梁市石楼县', '1', '4.2.2.141126', '1', '4', '石楼县', '26', 'SLX', null, '003014011026', null);
INSERT INTO `pa_bmzd` VALUES ('B90A063724FD4755A11DA7B99A7BB095', '2015-05-03 11:15:45', '江西省九江市德安县', '1', '4.2.2.360426', '1', '4', '德安县', '26', 'DAX', null, '003036004026', null);
INSERT INTO `pa_bmzd` VALUES ('B92A751D63D94C1C838768EB497FBC6D', '2015-05-03 11:15:45', '湖北省十堰市房县', '1', '4.2.2.420325', '1', '4', '房县', '25', 'FX', null, '003042003025', null);
INSERT INTO `pa_bmzd` VALUES ('B97731135CD9496C9F269EF07D58F842', '2015-05-03 11:15:45', '广东省清远市英德市', '1', '4.2.2.441881', '1', '4', '英德市', '81', 'YDS', null, '003044018081', null);
INSERT INTO `pa_bmzd` VALUES ('B98113FD42A848508A50E0B1D7735C44', '2015-05-03 11:15:45', '内蒙古自治区包头市市辖区', '1', '4.2.2.150201', '1', '4', '市辖区', '1', 'SXQ', null, '003015002001', null);
INSERT INTO `pa_bmzd` VALUES ('B990DC4D5B554732801678E02BC97BAE', '2015-05-03 11:15:45', '湖北省荆门市沙洋县', '1', '4.2.2.420822', '1', '4', '沙洋县', '22', 'SYX', null, '003042008022', null);
INSERT INTO `pa_bmzd` VALUES ('B9A4B86502ED40898B7F803DAC349167', '2015-05-03 11:15:45', '广东省深圳市', '1', '4.2.2.440300', '0', '3', '深圳市', '3', 'SZS', null, '003044003', null);
INSERT INTO `pa_bmzd` VALUES ('B9AC9A35950442239B72B9B915D18CDD', '2015-05-03 11:15:45', '河南省新乡市原阳县', '1', '4.2.2.410725', '1', '4', '原阳县', '25', 'YYX', null, '003041007025', null);
INSERT INTO `pa_bmzd` VALUES ('B9AE3169F4874EC89AF4D59CA8D5A9AA', '2015-05-03 11:15:45', '四川省遂宁市安居区', '1', '4.2.2.510904', '1', '4', '安居区', '4', 'AJQ', null, '003051009004', null);
INSERT INTO `pa_bmzd` VALUES ('B9B0D939E270415BA88946DCCEC923BD', '2015-05-03 11:15:45', '河南省三门峡市湖滨区', '1', '4.2.2.411202', '1', '4', '湖滨区', '2', 'HBQ', null, '003041012002', null);
INSERT INTO `pa_bmzd` VALUES ('B9B85929F60C4B34933BCD5993CAD87B', '2015-05-03 11:15:45', '内蒙古自治区锡林郭勒盟苏尼特右旗', '1', '4.2.2.152524', '1', '4', '苏尼特右旗', '24', 'SNTYQ', null, '003015025024', null);
INSERT INTO `pa_bmzd` VALUES ('B9ED7354BF714AF780F1B657987C5422', '2015-05-03 11:15:45', '湖北省恩施土家族苗族自治州利川市', '1', '4.2.2.422802', '1', '4', '利川市', '2', 'LCS', null, '003042028002', null);
INSERT INTO `pa_bmzd` VALUES ('B9F602CB4DBE4DF9A6C8FC18D27E36D0', '2015-05-03 11:15:45', '河南省开封市尉氏县', '1', '4.2.2.410223', '1', '4', '尉氏县', '23', 'YZX', null, '003041002023', null);
INSERT INTO `pa_bmzd` VALUES ('BA0530AD6B8542B5B04FFD17DBED1D73', '2015-05-03 11:15:45', '广东省广州市花都区', '1', '4.2.2.440114', '1', '4', '花都区', '14', 'HDQ', null, '003044001014', null);
INSERT INTO `pa_bmzd` VALUES ('BA05D1B466ED4473AA1A5CF58DC4191B', '2015-05-03 11:15:45', '山东省聊城市阳谷县', '1', '4.2.2.371521', '1', '4', '阳谷县', '21', 'YYX', null, '003037015021', null);
INSERT INTO `pa_bmzd` VALUES ('BA298DB7DF074021AA87B58DDAD3CCD8', '2015-05-03 11:15:45', '新疆维吾尔自治区塔城地区额敏县', '1', '4.2.2.654221', '1', '4', '额敏县', '21', 'EMX', null, '003065042021', null);
INSERT INTO `pa_bmzd` VALUES ('BA434D990DBC49B0A8EBCB154B0D9540', '2015-05-03 11:15:45', '安徽省黄山市黄山区', '1', '4.2.2.341003', '1', '4', '黄山区', '3', 'HSQ', null, '003034010003', null);
INSERT INTO `pa_bmzd` VALUES ('BA4B784FB4A44DC2B01ED85CE71E0642', '2015-05-03 11:15:45', '湖南省株洲市', '1', '4.2.2.430200', '0', '3', '株洲市', '2', 'ZZS', null, '003043002', null);
INSERT INTO `pa_bmzd` VALUES ('BA68C2EE3F0847CF9CAE690E73AECFC7', '2015-05-03 11:15:45', '辽宁省鞍山市海城市', '1', '4.2.2.210381', '1', '4', '海城市', '81', 'HCS', null, '003021003081', null);
INSERT INTO `pa_bmzd` VALUES ('BA6E06EF42CC4F2BA66DAE200895E21B', '2015-05-03 11:15:45', '山东省德州市禹城市', '1', '4.2.2.371482', '1', '4', '禹城市', '82', 'YCS', null, '003037014082', null);
INSERT INTO `pa_bmzd` VALUES ('BA6F707EAEFA409ABF2567F2FC838A01', '2015-05-03 11:15:45', '山东省滨州市滨城区', '1', '4.2.2.371602', '1', '4', '滨城区', '2', 'BCQ', null, '003037016002', null);
INSERT INTO `pa_bmzd` VALUES ('BA94976D925942F9941F48B49502BFE9', '2015-05-03 11:15:45', '西藏自治区阿里地区札达县', '1', '4.2.2.542522', '1', '4', '札达县', '22', 'ZDX', null, '003054025022', null);
INSERT INTO `pa_bmzd` VALUES ('BA976D4B3A534CFB9CEC8AAC11A22663', '2015-05-03 11:15:45', '四川省泸州市古蔺县', '1', '4.2.2.510525', '1', '4', '古蔺县', '25', 'GLX', null, '003051005025', null);
INSERT INTO `pa_bmzd` VALUES ('BAD816505B5A4D2F84401D9D95ECEBEA', '2015-05-03 11:15:45', '云南省西双版纳傣族自治州', '1', '4.2.2.532800', '0', '3', '西双版纳傣族自治州', '28', 'XSBNDZZZZ', null, '003053028', null);
INSERT INTO `pa_bmzd` VALUES ('BAF154726A914E0E894E29929F5B517B', '2015-05-03 11:15:45', '湖南省湘西土家族苗族自治州保靖县', '1', '4.2.2.433125', '1', '4', '保靖县', '25', 'BJX', null, '003043031025', null);
INSERT INTO `pa_bmzd` VALUES ('BB15EF00E4CC4708AE5B09DBF8AFA68D', '2015-05-03 11:15:45', '江苏省淮安市清河区', '1', '4.2.2.320802', '1', '4', '清河区', '2', 'QHQ', null, '003032008002', null);
INSERT INTO `pa_bmzd` VALUES ('BB2002E1471745BE94E4450E802E2BE5', '2015-05-03 11:15:45', '江苏省南通市如东县', '1', '4.2.2.320623', '1', '4', '如东县', '23', 'RDX', null, '003032006023', null);
INSERT INTO `pa_bmzd` VALUES ('BB33E60BC1984CE1A4B13AA398388E15', '2015-05-03 11:15:45', '新疆维吾尔自治区喀什地区英吉沙县', '1', '4.2.2.653123', '1', '4', '英吉沙县', '23', 'YJSX', null, '003065031023', null);
INSERT INTO `pa_bmzd` VALUES ('BB416EF59AA54656988FA843CA8E4A06', '2015-05-03 11:15:45', '甘肃省平凉市崆峒区', '1', '4.2.2.620802', '1', '4', '崆峒区', '2', 'KTQ', null, '003062008002', null);
INSERT INTO `pa_bmzd` VALUES ('BB467739E7FA4CF1954128A97A3425BE', '2015-05-03 11:15:45', '贵州省贵阳市南明区', '1', '4.2.2.520102', '1', '4', '南明区', '2', 'NMQ', null, '003052001002', null);
INSERT INTO `pa_bmzd` VALUES ('BB500A5C31234873BEA2E7B12BCD6B09', '2015-05-03 11:15:45', '甘肃省陇南市成县', '1', '4.2.2.621221', '1', '4', '成县', '21', 'CX', null, '003062012021', null);
INSERT INTO `pa_bmzd` VALUES ('BB6B222011914B51AB316133B59A5B23', '2015-05-03 11:15:45', '甘肃省陇南市武都区', '1', '4.2.2.621202', '1', '4', '武都区', '2', 'WDQ', null, '003062012002', null);
INSERT INTO `pa_bmzd` VALUES ('BB71FCCD4A3F4B0FB58E5D24CF62702C', '2015-05-03 11:15:45', '黑龙江省哈尔滨市尚志市', '1', '4.2.2.230183', '1', '4', '尚志市', '83', 'SZS', null, '003023001083', null);
INSERT INTO `pa_bmzd` VALUES ('BB9489B6EED94CF6AE1FB80999A94402', '2015-05-03 11:15:45', '湖北省宜昌市西陵区', '1', '4.2.2.420502', '1', '4', '西陵区', '2', 'XLQ', null, '003042005002', null);
INSERT INTO `pa_bmzd` VALUES ('BB9E761FC8874BFC9622A448F0ABB348', '2015-05-03 11:15:45', '河南省郑州市市辖区', '1', '4.2.2.410101', '1', '4', '市辖区', '1', 'SXQ', null, '003041001001', null);
INSERT INTO `pa_bmzd` VALUES ('BBA2BE09D2A24836A908E7F604B17143', '2015-05-03 11:15:45', '湖南省衡阳市衡东县', '1', '4.2.2.430424', '1', '4', '衡东县', '24', 'HDX', null, '003043004024', null);
INSERT INTO `pa_bmzd` VALUES ('BBA3194FA1FC41DCB9535CEB0FA75840', '2015-05-03 11:15:45', '海南省省直辖县级行政区划东方市', '1', '4.2.2.469007', '1', '4', '东方市', '7', 'DFS', null, '003046090007', null);
INSERT INTO `pa_bmzd` VALUES ('BBAB523DF339428181C8A5F4A5DC5E32', '2015-05-03 11:15:45', '黑龙江省双鸭山市宝清县', '1', '4.2.2.230523', '1', '4', '宝清县', '23', 'BQX', null, '003023005023', null);
INSERT INTO `pa_bmzd` VALUES ('BBD31AB0A52C4E1695CC588322500700', '2015-05-03 11:15:45', '甘肃省定西市渭源县', '1', '4.2.2.621123', '1', '4', '渭源县', '23', 'WYX', null, '003062011023', null);
INSERT INTO `pa_bmzd` VALUES ('BBDBD285AD2D4F7EA6FF33F88D462894', '2015-05-03 11:15:45', '山西省忻州市忻府区', '1', '4.2.2.140902', '1', '4', '忻府区', '2', 'XFQ', null, '003014009002', null);
INSERT INTO `pa_bmzd` VALUES ('BBF153FAF2CF45E5A2F3769F1F36B24F', '2015-05-03 11:15:45', '江西省上饶市余干县', '1', '4.2.2.361127', '1', '4', '余干县', '27', 'YGX', null, '003036011027', null);
INSERT INTO `pa_bmzd` VALUES ('BBF3D66A56C749F8BB73F4C829CFE1FD', '2015-05-03 11:15:45', '湖南省常德市津市市', '1', '4.2.2.430781', '1', '4', '津市市', '81', 'JSS', null, '003043007081', null);
INSERT INTO `pa_bmzd` VALUES ('BC17E0D052DD4CEEB8C40775ACD6747F', '2015-05-03 11:15:45', '山西省朔州市应县', '1', '4.2.2.140622', '1', '4', '应县', '22', 'YX', null, '003014006022', null);
INSERT INTO `pa_bmzd` VALUES ('BC1CAA2787B0478F9ADA35D726DE1A78', '2015-05-03 11:15:45', '江苏省南京市栖霞区', '1', '4.2.2.320113', '1', '4', '栖霞区', '13', 'XXQ', null, '003032001013', null);
INSERT INTO `pa_bmzd` VALUES ('BC2D1A04E5A34836900F474626528A2B', '2015-05-03 11:15:45', '河北省秦皇岛市市辖区', '1', '4.2.2.130301', '1', '4', '市辖区', '1', 'SXQ', null, '003013003001', null);
INSERT INTO `pa_bmzd` VALUES ('BC32056F3A2D4E34B9534A94FB1CBF82', '2015-05-03 11:15:45', '新疆维吾尔自治区阿克苏地区阿克苏市', '1', '4.2.2.652901', '1', '4', '阿克苏市', '1', 'AKSS', null, '003065029001', null);
INSERT INTO `pa_bmzd` VALUES ('BC33E2274D6747A9834C533F17F7B247', '2015-05-03 11:15:45', '新疆维吾尔自治区喀什地区喀什市', '1', '4.2.2.653101', '1', '4', '喀什市', '1', 'KSS', null, '003065031001', null);
INSERT INTO `pa_bmzd` VALUES ('BC389AD1B15B4D45B213A34A6637D9A5', '2015-05-03 11:15:45', '河北省石家庄市新乐市', '1', '4.2.2.130184', '1', '4', '新乐市', '84', 'XYS', null, '003013001084', null);
INSERT INTO `pa_bmzd` VALUES ('BC49839B107042D188C8AC5E7DE42BB3', '2015-05-03 11:15:45', '辽宁省沈阳市沈北新区', '1', '4.2.2.210113', '1', '4', '沈北新区', '13', 'SBXQ', null, '003021001013', null);
INSERT INTO `pa_bmzd` VALUES ('BC6B4B7C98F34EBAAEB24AEDB90721DD', '2015-05-03 11:15:45', '江苏省南京市秦淮区', '1', '4.2.2.320104', '1', '4', '秦淮区', '4', 'QHQ', null, '003032001004', null);
INSERT INTO `pa_bmzd` VALUES ('BC9CE2D324E043728C268F5368ED51C9', '2015-05-03 11:15:45', '黑龙江省哈尔滨市宾县', '1', '4.2.2.230125', '1', '4', '宾县', '25', 'BX', null, '003023001025', null);
INSERT INTO `pa_bmzd` VALUES ('BCB9E37E3DE5409EB6644EDD5E6B1830', '2015-05-03 11:15:45', '宁夏回族自治区固原市原州区', '1', '4.2.2.640402', '1', '4', '原州区', '2', 'YZQ', null, '003064004002', null);
INSERT INTO `pa_bmzd` VALUES ('BCD180D912E14F918881831F694F3478', '2015-05-03 11:15:45', '贵州省贵阳市修文县', '1', '4.2.2.520123', '1', '4', '修文县', '23', 'XWX', null, '003052001023', null);
INSERT INTO `pa_bmzd` VALUES ('BCE01C750ADC4BFC8E5D647BC9985FF5', '2015-05-03 11:15:45', '内蒙古自治区巴彦淖尔市临河区', '1', '4.2.2.150802', '1', '4', '临河区', '2', 'LHQ', null, '003015008002', null);
INSERT INTO `pa_bmzd` VALUES ('BCE1196F171B4572B9AC4832B6F2AD7D', '2015-05-03 11:15:45', '湖北省襄阳市谷城县', '1', '4.2.2.420625', '1', '4', '谷城县', '25', 'YCX', null, '003042006025', null);
INSERT INTO `pa_bmzd` VALUES ('BD145BACD465429686E29FC277089366', '2015-05-03 11:15:45', '河北省衡水市故城县', '1', '4.2.2.131126', '1', '4', '故城县', '26', 'GCX', null, '003013011026', null);
INSERT INTO `pa_bmzd` VALUES ('BD14C30FF90544A5A9685CD271DC7E10', '2015-05-03 11:15:45', '山东省烟台市莱州市', '1', '4.2.2.370683', '1', '4', '莱州市', '83', 'LZS', null, '003037006083', null);
INSERT INTO `pa_bmzd` VALUES ('BD20E152E08C4B009287FE89D807840A', '2015-05-03 11:15:45', '新疆维吾尔自治区巴音郭楞蒙古自治州和静县', '1', '4.2.2.652827', '1', '4', '和静县', '27', 'HJX', null, '003065028027', null);
INSERT INTO `pa_bmzd` VALUES ('BD23D5327BCB43CEAD2A2743A07CE248', '2015-05-03 11:15:45', '山东省德州市陵县', '1', '4.2.2.371421', '1', '4', '陵县', '21', 'LX', null, '003037014021', null);
INSERT INTO `pa_bmzd` VALUES ('BD2B9642BD034B0DAAB2B06C9DB26A68', '2015-05-03 11:15:45', '江西省萍乡市', '1', '4.2.2.360300', '0', '3', '萍乡市', '3', 'PXS', null, '003036003', null);
INSERT INTO `pa_bmzd` VALUES ('BD52E3664DDD4E7E8BEFD4EC63FB7805', '2015-05-03 11:15:45', '青海省黄南藏族自治州河南蒙古族自治县', '1', '4.2.2.632324', '1', '4', '河南蒙古族自治县', '24', 'HNMGZZZX', null, '003063023024', null);
INSERT INTO `pa_bmzd` VALUES ('BD5C4B7FF4BD47F7AB2A395F4C7B7A93', '2015-05-03 11:15:45', '河南省驻马店市市辖区', '1', '4.2.2.411701', '1', '4', '市辖区', '1', 'SXQ', null, '003041017001', null);
INSERT INTO `pa_bmzd` VALUES ('BD69BE48D89D44A8A63C7D62CE92F73D', '2015-05-03 11:15:45', '辽宁省锦州市太和区', '1', '4.2.2.210711', '1', '4', '太和区', '11', 'THQ', null, '003021007011', null);
INSERT INTO `pa_bmzd` VALUES ('BD75F299B0484E24B5A1FDE4DAB3B012', '2015-05-03 11:15:45', '山东省枣庄市山亭区', '1', '4.2.2.370406', '1', '4', '山亭区', '6', 'STQ', null, '003037004006', null);
INSERT INTO `pa_bmzd` VALUES ('BDA129F88F1E498A80780DCB7180A2E3', '2015-05-03 11:15:45', '河北省沧州市海兴县', '1', '4.2.2.130924', '1', '4', '海兴县', '24', 'HXX', null, '003013009024', null);
INSERT INTO `pa_bmzd` VALUES ('BDAA38F92E1143B3916E8270E4CBCD8D', '2015-05-03 11:15:45', '四川省巴中市巴州区', '1', '4.2.2.511902', '1', '4', '巴州区', '2', 'BZQ', null, '003051019002', null);
INSERT INTO `pa_bmzd` VALUES ('BDC9B3439B624CC993E1C8E1296ED7DA', '2015-05-03 11:15:45', '江苏省苏州市虎丘区', '1', '4.2.2.320505', '1', '4', '虎丘区', '5', 'HQQ', null, '003032005005', null);
INSERT INTO `pa_bmzd` VALUES ('BDCD292232D44734BB494BEB0C174E4E', '2015-05-03 11:15:45', '宁夏回族自治区固原市', '1', '4.2.2.640400', '0', '3', '固原市', '4', 'GYS', null, '003064004', null);
INSERT INTO `pa_bmzd` VALUES ('BDECA289ABC44BD5AC18B296E3D0D981', '2015-05-03 11:15:45', '河南省安阳市林州市', '1', '4.2.2.410581', '1', '4', '林州市', '81', 'LZS', null, '003041005081', null);
INSERT INTO `pa_bmzd` VALUES ('BE344ED78B824FCBAB8B73291552CDCA', '2015-05-03 11:15:45', '河北省唐山市古冶区', '1', '4.2.2.130204', '1', '4', '古冶区', '4', 'GYQ', null, '003013002004', null);
INSERT INTO `pa_bmzd` VALUES ('BE3FC5B049F64462914A6E408E6D6CD6', '2015-05-03 11:15:45', '辽宁省本溪市南芬区', '1', '4.2.2.210505', '1', '4', '南芬区', '5', 'NFQ', null, '003021005005', null);
INSERT INTO `pa_bmzd` VALUES ('BE4944EB1EC1425181F5856222E90579', '2015-05-03 11:15:45', '黑龙江省鹤岗市东山区', '1', '4.2.2.230406', '1', '4', '东山区', '6', 'DSQ', null, '003023004006', null);
INSERT INTO `pa_bmzd` VALUES ('BEA3CCC8CA274D679C82F4E0049F6FAA', '2015-05-03 11:15:45', '江西省景德镇市乐平市', '1', '4.2.2.360281', '1', '4', '乐平市', '81', 'YPS', null, '003036002081', null);
INSERT INTO `pa_bmzd` VALUES ('BEEE6454B13D4115B422AEB2BD09DC0C', '2015-05-03 11:15:45', '云南省玉溪市通海县', '1', '4.2.2.530423', '1', '4', '通海县', '23', 'THX', null, '003053004023', null);
INSERT INTO `pa_bmzd` VALUES ('BEFD3CE08B29413293AB413F5B9776BF', '2015-05-03 11:15:45', '青海省西宁市大通回族土族自治县', '1', '4.2.2.630121', '1', '4', '大通回族土族自治县', '21', 'DTHZTZZZX', null, '003063001021', null);
INSERT INTO `pa_bmzd` VALUES ('BF09A797D2724E3CA6BBD455CCAD11DA', '2015-05-03 11:15:45', '江苏省镇江市丹阳市', '1', '4.2.2.321181', '1', '4', '丹阳市', '81', 'DYS', null, '003032011081', null);
INSERT INTO `pa_bmzd` VALUES ('BF108DCFC31741BFBC67BC96A475CE75', '2015-05-03 11:15:45', '新疆维吾尔自治区乌鲁木齐市乌鲁木齐县', '1', '4.2.2.650121', '1', '4', '乌鲁木齐县', '21', 'WLMQX', null, '003065001021', null);
INSERT INTO `pa_bmzd` VALUES ('BF20B63036DB4FF1A74433C1F2472AEB', '2015-05-03 11:15:45', '河南省三门峡市渑池县', '1', '4.2.2.411221', '1', '4', '渑池县', '21', 'SCX', null, '003041012021', null);
INSERT INTO `pa_bmzd` VALUES ('BF3B01C264684A92943CE99D5636DA2B', '2015-05-03 11:15:45', '浙江省杭州市淳安县', '1', '4.2.2.330127', '1', '4', '淳安县', '27', 'CAX', null, '003033001027', null);
INSERT INTO `pa_bmzd` VALUES ('BF3C72FF2F304F6C9E2EC3528C0BFD96', '2015-05-03 11:15:45', '河北省衡水市桃城区', '1', '4.2.2.131102', '1', '4', '桃城区', '2', 'TCQ', null, '003013011002', null);
INSERT INTO `pa_bmzd` VALUES ('BF42625AF2DD4B88852BD91A633E1F02', '2015-05-03 11:15:45', '江苏省南通市市辖区', '1', '4.2.2.320601', '1', '4', '市辖区', '1', 'SXQ', null, '003032006001', null);
INSERT INTO `pa_bmzd` VALUES ('BF4C11D317344D2B81DB5548C2D71798', '2015-05-03 11:15:45', '湖北省武汉市青山区', '1', '4.2.2.420107', '1', '4', '青山区', '7', 'QSQ', null, '003042001007', null);
INSERT INTO `pa_bmzd` VALUES ('BF6912C323654A5A8E9176B2EE4D6ABD', '2015-05-03 11:15:45', '湖南省长沙市市辖区', '1', '4.2.2.430101', '1', '4', '市辖区', '1', 'SXQ', null, '003043001001', null);
INSERT INTO `pa_bmzd` VALUES ('BF7919B2829C42C2AD19644D953E6240', '2015-05-03 11:15:45', '河南省商丘市民权县', '1', '4.2.2.411421', '1', '4', '民权县', '21', 'MQX', null, '003041014021', null);
INSERT INTO `pa_bmzd` VALUES ('BF9DDF2BBB6C4077B2A4D77A31F1FC7A', '2015-05-03 11:15:45', '四川省遂宁市市辖区', '1', '4.2.2.510901', '1', '4', '市辖区', '1', 'SXQ', null, '003051009001', null);
INSERT INTO `pa_bmzd` VALUES ('BFB0350363424FB5894C73A6B9E7B2CA', '2015-05-03 11:15:45', '陕西省宝鸡市岐山县', '1', '4.2.2.610323', '1', '4', '岐山县', '23', 'QSX', null, '003061003023', null);
INSERT INTO `pa_bmzd` VALUES ('BFEC624C6C1A40EBA2B852ED14648A02', '2015-05-03 11:15:45', '四川省巴中市通江县', '1', '4.2.2.511921', '1', '4', '通江县', '21', 'TJX', null, '003051019021', null);
INSERT INTO `pa_bmzd` VALUES ('C002BEC460D847FF9F52E9BF9E10C559', '2015-05-03 11:15:45', '新疆维吾尔自治区伊犁哈萨克自治州察布查尔锡伯自治县', '1', '4.2.2.654022', '1', '4', '察布查尔锡伯自治县', '22', 'CBCEXBZZX', null, '003065040022', null);
INSERT INTO `pa_bmzd` VALUES ('C00F7E0D57F94C2BB68379C2408CCB3C', '2015-05-03 11:15:45', '湖北省黄石市铁山区', '1', '4.2.2.420205', '1', '4', '铁山区', '5', 'TSQ', null, '003042002005', null);
INSERT INTO `pa_bmzd` VALUES ('C015A0927D9940D48CEFD9266A40B8E7', '2015-05-03 11:15:45', '河北省承德市双桥区', '1', '4.2.2.130802', '1', '4', '双桥区', '2', 'SQQ', null, '003013008002', null);
INSERT INTO `pa_bmzd` VALUES ('C03AADA399F44366BDDD20CBA87BC924', '2015-05-03 11:15:45', '福建省漳州市平和县', '1', '4.2.2.350628', '1', '4', '平和县', '28', 'PHX', null, '003035006028', null);
INSERT INTO `pa_bmzd` VALUES ('C03C5EE9B81E4B098B33218E71EAB7C6', '2015-05-03 11:15:45', '辽宁省抚顺市抚顺县', '1', '4.2.2.210421', '1', '4', '抚顺县', '21', 'FSX', null, '003021004021', null);
INSERT INTO `pa_bmzd` VALUES ('C08BBC24018E4529A2771DBBDFE7AFDD', '2015-05-03 11:15:45', '四川省南充市仪陇县', '1', '4.2.2.511324', '1', '4', '仪陇县', '24', 'YLX', null, '003051013024', null);
INSERT INTO `pa_bmzd` VALUES ('C0DBF257B12A4CF09F4C9D9007F4E6BE', '2015-05-03 11:15:45', '贵州省铜仁市松桃苗族自治县', '1', '4.2.2.522229', '1', '4', '松桃苗族自治县', '28', 'STMZZZX', null, '003052006028', null);
INSERT INTO `pa_bmzd` VALUES ('4483DA8300934B4ABEBEA3EC703C6030', '2015-05-03 11:15:45', '陕西省咸阳市', '1', '4.2.2.610400', '0', '3', '咸阳市', '4', 'XYS', null, '003061004', null);
INSERT INTO `pa_bmzd` VALUES ('448C6BC0B3A1458488E5696D49A92053', '2015-05-03 11:15:45', '福建省宁德市霞浦县', '1', '4.2.2.350921', '1', '4', '霞浦县', '21', 'XPX', null, '003035009021', null);
INSERT INTO `pa_bmzd` VALUES ('44AEBFE39D5944EA89D2B5DAF0B87A87', '2015-05-03 11:15:45', '辽宁省丹东市宽甸满族自治县', '1', '4.2.2.210624', '1', '4', '宽甸满族自治县', '24', 'KDMZZZX', null, '003021006024', null);
INSERT INTO `pa_bmzd` VALUES ('44CF27DD467248ABBEE006738E5F32F7', '2015-05-03 11:15:45', '云南省文山壮族苗族自治州麻栗坡县', '1', '4.2.2.532624', '1', '4', '麻栗坡县', '24', 'MLPX', null, '003053026024', null);
INSERT INTO `pa_bmzd` VALUES ('44D6DE76D8A049A8A91D5323356C5E09', '2015-05-03 11:15:45', '河南省焦作市博爱县', '1', '4.2.2.410822', '1', '4', '博爱县', '22', 'BAX', null, '003041008022', null);
INSERT INTO `pa_bmzd` VALUES ('44E12062C8B44113BDBF20E466F7E77A', '2015-05-03 11:15:45', '河南省信阳市淮滨县', '1', '4.2.2.411527', '1', '4', '淮滨县', '27', 'HBX', null, '003041015027', null);
INSERT INTO `pa_bmzd` VALUES ('44EE0A1ED0B94CE081E310F157E5609E', '2015-05-03 11:15:45', '云南省临沧市云县', '1', '4.2.2.530922', '1', '4', '云县', '22', 'YX', null, '003053009022', null);
INSERT INTO `pa_bmzd` VALUES ('451046AA4A5646FA8FC7B83711129DFC', '2015-05-03 11:15:45', '河南省南阳市淅川县', '1', '4.2.2.411326', '1', '4', '淅川县', '26', 'XCX', null, '003041013026', null);
INSERT INTO `pa_bmzd` VALUES ('4510BC29B2434436B3EEC8968DAD9D2C', '2015-05-03 11:15:45', '河北省张家口市尚义县', '1', '4.2.2.130725', '1', '4', '尚义县', '25', 'SYX', null, '003013007025', null);
INSERT INTO `pa_bmzd` VALUES ('453852BFF38E4EC1818FAC424389ADA9', '2015-05-03 11:15:45', '青海省海西蒙古族藏族自治州格尔木市', '1', '4.2.2.632801', '1', '4', '格尔木市', '1', 'GEMS', null, '003063028001', null);
INSERT INTO `pa_bmzd` VALUES ('4543F229DC624F9EAD17D8DD988B3A70', '2015-05-03 11:15:45', '贵州省遵义市遵义县', '1', '4.2.2.520321', '1', '4', '遵义县', '21', 'ZYX', null, '003052003021', null);
INSERT INTO `pa_bmzd` VALUES ('45462BB405B7474FB625C8C8A4E1300A', '2015-05-03 11:15:45', '广西壮族自治区', '1', '4.2.2.450000', '0', '2', '广西壮族自治区', '45', 'GXZZZZQ', null, '003045', null);
INSERT INTO `pa_bmzd` VALUES ('456AADF0EB7B43178EDAF6EAB95D1C26', '2015-05-03 11:15:45', '贵州省铜仁市江口县', '1', '4.2.2.522222', '1', '4', '江口县', '21', 'JKX', null, '003052006021', null);
INSERT INTO `pa_bmzd` VALUES ('458DB94784484F7EBB465CECC9DD870A', '2015-05-03 11:15:45', '河北省邢台市临城县', '1', '4.2.2.130522', '1', '4', '临城县', '22', 'LCX', null, '003013005022', null);
INSERT INTO `pa_bmzd` VALUES ('4593B4756E8745D5B771E0AB23F228BD', '2015-05-03 11:15:45', '新疆维吾尔自治区和田地区策勒县', '1', '4.2.2.653225', '1', '4', '策勒县', '25', 'CLX', null, '003065032025', null);
INSERT INTO `pa_bmzd` VALUES ('45B7789385B74EA7B95E1D5F64AB2E2D', '2015-05-03 11:15:45', '新疆维吾尔自治区吐鲁番地区', '1', '4.2.2.652100', '0', '3', '吐鲁番地区', '21', 'TLPDQ', null, '003065021', null);
INSERT INTO `pa_bmzd` VALUES ('45C222B4D25A453E90468F8D823D3E04', '2015-05-03 11:15:45', '河南省南阳市内乡县', '1', '4.2.2.411325', '1', '4', '内乡县', '25', 'NXX', null, '003041013025', null);
INSERT INTO `pa_bmzd` VALUES ('45E158A6B62E446DA03651AECF89627C', '2015-05-03 11:15:45', '西藏自治区山南地区隆子县', '1', '4.2.2.542231', '1', '4', '隆子县', '31', 'LZX', null, '003054022031', null);
INSERT INTO `pa_bmzd` VALUES ('45E257EB6D124879A81FD422D99C2967', '2015-05-03 11:15:45', '江苏省宿迁市宿城区', '1', '4.2.2.321302', '1', '4', '宿城区', '2', 'SCQ', null, '003032013002', null);
INSERT INTO `pa_bmzd` VALUES ('45F2720945974BC488391F07AB12C53C', '2015-05-03 11:15:45', '安徽省池州市石台县', '1', '4.2.2.341722', '1', '4', '石台县', '22', 'STX', null, '003034017022', null);
INSERT INTO `pa_bmzd` VALUES ('460A3A3648E547BAA146CEBD2C421EE7', '2015-05-03 11:15:45', '黑龙江省伊春市铁力市', '1', '4.2.2.230781', '1', '4', '铁力市', '81', 'TLS', null, '003023007081', null);
INSERT INTO `pa_bmzd` VALUES ('460C744E79574999842A2FB6285DE052', '2015-05-03 11:15:45', '陕西省汉中市略阳县', '1', '4.2.2.610727', '1', '4', '略阳县', '27', 'LYX', null, '003061007027', null);
INSERT INTO `pa_bmzd` VALUES ('4632072DDB234E55A25951398ABFAA71', '2015-05-03 11:15:45', '江苏省宿迁市泗阳县', '1', '4.2.2.321323', '1', '4', '泗阳县', '23', 'SYX', null, '003032013023', null);
INSERT INTO `pa_bmzd` VALUES ('46484E92BD0F4AEDAA62D1C4DAE5D3AA', '2015-05-03 11:15:45', '广西壮族自治区梧州市长洲区', '1', '4.2.2.450405', '1', '4', '长洲区', '5', 'ZZQ', null, '003045004005', null);
INSERT INTO `pa_bmzd` VALUES ('4649C72127014B8D9F69E60DD8E8164C', '2015-05-03 11:15:45', '内蒙古自治区阿拉善盟阿拉善右旗', '1', '4.2.2.152922', '1', '4', '阿拉善右旗', '22', 'ALSYQ', null, '003015029022', null);
INSERT INTO `pa_bmzd` VALUES ('464E3B75FF034D9FBF078EAB6F1B4A05', '2015-05-03 11:15:45', '青海省海东地区平安县', '1', '4.2.2.632121', '1', '4', '平安县', '21', 'PAX', null, '003063021021', null);
INSERT INTO `pa_bmzd` VALUES ('4657A3DDBEC245028E4825E5AD62C726', '2015-05-03 11:15:45', '河北省石家庄市行唐县', '1', '4.2.2.130125', '1', '4', '行唐县', '25', 'XTX', null, '003013001025', null);
INSERT INTO `pa_bmzd` VALUES ('4678B7D20447434195EC56B07A29CDE4', '2015-05-03 11:15:45', '广东省云浮市', '1', '4.2.2.445300', '0', '3', '云浮市', '53', 'YFS', null, '003044053', null);
INSERT INTO `pa_bmzd` VALUES ('4680B02DBCEB424D92C7D6A09F7C6183', '2015-05-03 11:15:45', '陕西省西安市碑林区', '1', '4.2.2.610103', '1', '4', '碑林区', '3', 'BLQ', null, '003061001003', null);
INSERT INTO `pa_bmzd` VALUES ('46B59BBC436749C4A3CA536D1BAEC145', '2015-05-03 11:15:45', '甘肃省张掖市民乐县', '1', '4.2.2.620722', '1', '4', '民乐县', '22', 'MYX', null, '003062007022', null);
INSERT INTO `pa_bmzd` VALUES ('46B93403384240D58BCA87CAB5794C11', '2015-05-03 11:15:45', '甘肃省天水市麦积区', '1', '4.2.2.620503', '1', '4', '麦积区', '3', 'MJQ', null, '003062005003', null);
INSERT INTO `pa_bmzd` VALUES ('46BEB69E8399478CAAE9047573136330', '2015-05-03 11:15:45', '河北省唐山市路南区', '1', '4.2.2.130202', '1', '4', '路南区', '2', 'LNQ', null, '003013002002', null);
INSERT INTO `pa_bmzd` VALUES ('46EC1FD85C6D497E875B99252A0AF2D2', '2015-05-03 11:15:45', '内蒙古自治区呼伦贝尔市阿荣旗', '1', '4.2.2.150721', '1', '4', '阿荣旗', '21', 'ARQ', null, '003015007021', null);
INSERT INTO `pa_bmzd` VALUES ('471422E9551746DCBAA168C5C9C6AFAE', '2015-05-03 11:15:45', '黑龙江省齐齐哈尔市铁锋区', '1', '4.2.2.230204', '1', '4', '铁锋区', '4', 'TFQ', null, '003023002004', null);
INSERT INTO `pa_bmzd` VALUES ('471E785E21C04EB482BB29423C260859', '2015-05-03 11:15:45', '山西省晋中市祁县', '1', '4.2.2.140727', '1', '4', '祁县', '27', 'QX', null, '003014007027', null);
INSERT INTO `pa_bmzd` VALUES ('47455E921EBF4424AAAC490411A34BBA', '2015-05-03 11:15:45', '贵州省黔南布依族苗族自治州三都水族自治县', '1', '4.2.2.522732', '1', '4', '三都水族自治县', '32', 'SDSZZZX', null, '003052027032', null);
INSERT INTO `pa_bmzd` VALUES ('474BC9B962734C46A3690002FE37D8C1', '2015-05-03 11:15:45', '安徽省宣城市旌德县', '1', '4.2.2.341825', '1', '4', '旌德县', '25', 'JDX', null, '003034018025', null);
INSERT INTO `pa_bmzd` VALUES ('474F649024D6498B8E58407AE92313E2', '2015-05-03 11:15:45', '广西壮族自治区南宁市江南区', '1', '4.2.2.450105', '1', '4', '江南区', '5', 'JNQ', null, '003045001005', null);
INSERT INTO `pa_bmzd` VALUES ('475FC5BA11B34D2693D5EBC3BAAAEE10', '2015-05-03 11:15:45', '浙江省衢州市衢江区', '1', '4.2.2.330803', '1', '4', '衢江区', '3', 'QJQ', null, '003033008003', null);
INSERT INTO `pa_bmzd` VALUES ('476F25850DFB41369180921CA34C8D04', '2015-05-03 11:15:45', '云南省红河哈尼族彝族自治州弥勒县', '1', '4.2.2.532526', '1', '4', '弥勒县', '26', 'MLX', null, '003053025026', null);
INSERT INTO `pa_bmzd` VALUES ('477523BCC5374DCDA39A6ED13A2275B1', '2015-05-03 11:15:45', '湖南省张家界市桑植县', '1', '4.2.2.430822', '1', '4', '桑植县', '22', 'SZX', null, '003043008022', null);
INSERT INTO `pa_bmzd` VALUES ('4789F854ACAD403D85B0E1A0CAC1E468', '2015-05-03 11:15:45', '河南省商丘市睢县', '1', '4.2.2.411422', '1', '4', '睢县', '22', 'SX', null, '003041014022', null);
INSERT INTO `pa_bmzd` VALUES ('47A90C982432442797C01C50403A165A', '2015-05-03 11:15:45', '安徽省宣城市宁国市', '1', '4.2.2.341881', '1', '4', '宁国市', '81', 'NGS', null, '003034018081', null);
INSERT INTO `pa_bmzd` VALUES ('4845367C26C441D0A26B720BFF9E11B2', '2015-05-03 11:15:45', '河北省唐山市迁安市', '1', '4.2.2.130283', '1', '4', '迁安市', '83', 'QAS', null, '003013002083', null);
INSERT INTO `pa_bmzd` VALUES ('485555F58AD64695A6D38012E542DA2F', '2015-05-03 11:15:45', '新疆维吾尔自治区吐鲁番地区吐鲁番市', '1', '4.2.2.652101', '1', '4', '吐鲁番市', '1', 'TLPS', null, '003065021001', null);
INSERT INTO `pa_bmzd` VALUES ('4858399D04484281841CA11F39BCCFA5', '2015-05-03 11:15:45', '山西省晋城市', '1', '4.2.2.140500', '0', '3', '晋城市', '5', 'JCS', null, '003014005', null);
INSERT INTO `pa_bmzd` VALUES ('48692ED3C44E439AB908BE8EDEFF4DEF', '2015-05-03 11:15:45', '海南省省直辖县级行政区划中沙群岛的岛礁及其海域', '1', '4.2.2.469039', '1', '4', '中沙群岛的岛礁及其海域', '33', 'ZSQDDDJJQHY', null, '003046090033', null);
INSERT INTO `pa_bmzd` VALUES ('486A91DE99BE4C948814F78BD8EC5BCE', '2015-05-03 11:15:45', '安徽省安庆市', '1', '4.2.2.340800', '0', '3', '安庆市', '8', 'AQS', null, '003034008', null);
INSERT INTO `pa_bmzd` VALUES ('4889931A67264A6B94F2723993B4EC66', '2015-05-03 11:15:45', '广西壮族自治区柳州市融水苗族自治县', '1', '4.2.2.450225', '1', '4', '融水苗族自治县', '25', 'RSMZZZX', null, '003045002025', null);
INSERT INTO `pa_bmzd` VALUES ('489BB0AC4D0D4B09B2ABAC13989E5963', '2015-05-03 11:15:45', '江苏省盐城市滨海县', '1', '4.2.2.320922', '1', '4', '滨海县', '22', 'BHX', null, '003032009022', null);
INSERT INTO `pa_bmzd` VALUES ('48CA0FF1EF544A7EBD69EDB4DBC1D1F7', '2015-05-03 11:15:45', '广东省汕头市', '1', '4.2.2.440500', '0', '3', '汕头市', '5', 'STS', null, '003044005', null);
INSERT INTO `pa_bmzd` VALUES ('490C1BDC85BB42BAB3ACA58828ED0E6D', '2015-05-03 11:15:45', '青海省西宁市市辖区', '1', '4.2.2.630101', '1', '4', '市辖区', '1', 'SXQ', null, '003063001001', null);
INSERT INTO `pa_bmzd` VALUES ('49127BA80EE54E148F8A79B18F716F43', '2015-05-03 11:15:45', '内蒙古自治区巴彦淖尔市市辖区', '1', '4.2.2.150801', '1', '4', '市辖区', '1', 'SXQ', null, '003015008001', null);
INSERT INTO `pa_bmzd` VALUES ('4927348AAC8341ECA43197F021A94A64', '2015-05-03 11:15:45', '陕西省延安市黄陵县', '1', '4.2.2.610632', '1', '4', '黄陵县', '32', 'HLX', null, '003061006032', null);
INSERT INTO `pa_bmzd` VALUES ('4929FD797AEF40F88C1680CA8CFEFA49', '2015-05-03 11:15:45', '贵州省黔西南布依族苗族自治州兴义市', '1', '4.2.2.522301', '1', '4', '兴义市', '1', 'XYS', null, '003052023001', null);
INSERT INTO `pa_bmzd` VALUES ('493736B19B0B4908BD5881549B412A43', '2015-05-03 11:15:45', '新疆维吾尔自治区伊犁哈萨克自治州新源县', '1', '4.2.2.654025', '1', '4', '新源县', '25', 'XYX', null, '003065040025', null);
INSERT INTO `pa_bmzd` VALUES ('493C944DC0464C61B106EBBB64B09C0C', '2015-05-03 11:15:45', '湖南省长沙市雨花区', '1', '4.2.2.430111', '1', '4', '雨花区', '11', 'YHQ', null, '003043001011', null);
INSERT INTO `pa_bmzd` VALUES ('49425D6FD14647B3AE60BB974617D9AA', '2015-05-03 11:15:45', '新疆维吾尔自治区喀什地区', '1', '4.2.2.653100', '0', '3', '喀什地区', '31', 'KSDQ', null, '003065031', null);
INSERT INTO `pa_bmzd` VALUES ('495C80F41AA841B1AE4C7FFA01243B32', '2015-05-03 11:15:45', '河南省南阳市', '1', '4.2.2.411300', '0', '3', '南阳市', '13', 'NYS', null, '003041013', null);
INSERT INTO `pa_bmzd` VALUES ('4973041BC218430C9A4AA884A131D3EC', '2015-05-03 11:15:45', '河南省洛阳市伊川县', '1', '4.2.2.410329', '1', '4', '伊川县', '29', 'YCX', null, '003041003029', null);
INSERT INTO `pa_bmzd` VALUES ('49858A862098425F90F7827ED7F47AD4', '2015-05-03 11:15:45', '黑龙江省齐齐哈尔市梅里斯达斡尔族区', '1', '4.2.2.230208', '1', '4', '梅里斯达斡尔族区', '8', 'MLSDWEZQ', null, '003023002008', null);
INSERT INTO `pa_bmzd` VALUES ('4990532B80BC438CBB1DF36AC70C4395', '2015-05-03 11:15:45', '山东省潍坊市', '1', '4.2.2.370700', '0', '3', '潍坊市', '7', 'WFS', null, '003037007', null);
INSERT INTO `pa_bmzd` VALUES ('49A93A510F9E43D688CA6D9D1E943281', '2015-05-03 11:15:45', '黑龙江省七台河市桃山区', '1', '4.2.2.230903', '1', '4', '桃山区', '3', 'TSQ', null, '003023009003', null);
INSERT INTO `pa_bmzd` VALUES ('49D55D0DF487473297EF3AF3E2BA9D9D', '2015-05-03 11:15:45', '陕西省咸阳市兴平市', '1', '4.2.2.610481', '1', '4', '兴平市', '81', 'XPS', null, '003061004081', null);
INSERT INTO `pa_bmzd` VALUES ('49D589BBCB454ACBBCF1AA1EFFAF3A14', '2015-05-03 11:15:45', '湖南省株洲市荷塘区', '1', '4.2.2.430202', '1', '4', '荷塘区', '2', 'HTQ', null, '003043002002', null);
INSERT INTO `pa_bmzd` VALUES ('49E6BFD13FD744D58D4DC0C9E36646A0', '2015-05-03 11:15:45', '四川省自贡市沿滩区', '1', '4.2.2.510311', '1', '4', '沿滩区', '11', 'YTQ', null, '003051003011', null);
INSERT INTO `pa_bmzd` VALUES ('49ED2F0462664522B974DE728ECDEDE0', '2015-05-03 11:15:45', '云南省大理白族自治州', '1', '4.2.2.532900', '0', '3', '大理白族自治州', '29', 'DLBZZZZ', null, '003053029', null);
INSERT INTO `pa_bmzd` VALUES ('49F25A683A164273AEDC560D2973CD57', '2015-05-03 11:15:45', '新疆维吾尔自治区喀什地区莎车县', '1', '4.2.2.653125', '1', '4', '莎车县', '25', 'SJX', null, '003065031025', null);
INSERT INTO `pa_bmzd` VALUES ('49F346909F1343EE9560FC2D85F8F94D', '2015-05-03 11:15:45', '湖南省湘西土家族苗族自治州花垣县', '1', '4.2.2.433124', '1', '4', '花垣县', '24', 'HYX', null, '003043031024', null);
INSERT INTO `pa_bmzd` VALUES ('4A25BB129CA2467693A32F580B92F6FC', '2015-05-03 11:15:45', '新疆维吾尔自治区巴音郭楞蒙古自治州库尔勒市', '1', '4.2.2.652801', '1', '4', '库尔勒市', '1', 'KELS', null, '003065028001', null);
INSERT INTO `pa_bmzd` VALUES ('4A3937423ABF4F778625161A78101D15', '2015-05-03 11:15:45', '四川省南充市顺庆区', '1', '4.2.2.511302', '1', '4', '顺庆区', '2', 'SQQ', null, '003051013002', null);
INSERT INTO `pa_bmzd` VALUES ('4A451F11C58C4F32AA69B2BB721D108E', '2015-05-03 11:15:45', '江苏省徐州市丰县', '1', '4.2.2.320321', '1', '4', '丰县', '21', 'FX', null, '003032003021', null);
INSERT INTO `pa_bmzd` VALUES ('4A51F8EE744D40CF8F8AA3926CA19447', '2015-05-03 11:15:45', '辽宁省铁岭市', '1', '4.2.2.211200', '0', '3', '铁岭市', '12', 'TLS', null, '003021012', null);
INSERT INTO `pa_bmzd` VALUES ('4A55B6C95E554E7C9C8BB4C8623600BD', '2015-05-03 11:15:45', '湖北省荆门市钟祥市', '1', '4.2.2.420881', '1', '4', '钟祥市', '81', 'ZXS', null, '003042008081', null);
INSERT INTO `pa_bmzd` VALUES ('4A55D741342A498BA9EB1D5187EE753C', '2015-05-03 11:15:45', '广东省揭阳市揭西县', '1', '4.2.2.445222', '1', '4', '揭西县', '22', 'JXX', null, '003044052022', null);
INSERT INTO `pa_bmzd` VALUES ('4A584EE1D97244A2AC5F33B17A2B65C2', '2015-05-03 11:15:45', '吉林省通化市', '1', '4.2.2.220500', '0', '3', '通化市', '5', 'THS', null, '003022005', null);
INSERT INTO `pa_bmzd` VALUES ('4A5D81148BD948F28EC6423DDB88600E', '2015-05-03 11:15:45', '江苏省无锡市市辖区', '1', '4.2.2.320201', '1', '4', '市辖区', '1', 'SXQ', null, '003032002001', null);
INSERT INTO `pa_bmzd` VALUES ('4A5FA5014E9E4F2281B17A7E69575FE7', '2015-05-03 11:15:45', '江西省赣州市于都县', '1', '4.2.2.360731', '1', '4', '于都县', '31', 'YDX', null, '003036007031', null);
INSERT INTO `pa_bmzd` VALUES ('4A7FFCE0E19643EDBB646B0ED969CFDE', '2015-05-03 11:15:45', '西藏自治区日喀则地区拉孜县', '1', '4.2.2.542326', '1', '4', '拉孜县', '26', 'LZX', null, '003054023026', null);
INSERT INTO `pa_bmzd` VALUES ('4A89DD7693CA4A42A08CAB2BA6EE82CA', '2015-05-03 11:15:45', '西藏自治区日喀则地区仁布县', '1', '4.2.2.542330', '1', '4', '仁布县', '30', 'RBX', null, '003054023030', null);
INSERT INTO `pa_bmzd` VALUES ('4A8B2C2E7AEA4D2C976561A99BFD7426', '2015-05-03 11:15:45', '安徽省合肥市庐阳区', '1', '4.2.2.340103', '1', '4', '庐阳区', '3', 'LYQ', null, '003034001003', null);
INSERT INTO `pa_bmzd` VALUES ('4A9E7F09448A4E6498EF520F2F85B94E', '2015-05-03 11:15:45', '辽宁省辽阳市灯塔市', '1', '4.2.2.211081', '1', '4', '灯塔市', '81', 'DTS', null, '003021010081', null);
INSERT INTO `pa_bmzd` VALUES ('4AA196008A7C46E1B5F339E2DDCF5589', '2015-05-03 11:15:45', '江西省宜春市高安市', '1', '4.2.2.360983', '1', '4', '高安市', '83', 'GAS', null, '003036009083', null);
INSERT INTO `pa_bmzd` VALUES ('4AB753F9677240FAA3700FEA1E7E88AC', '2015-05-03 11:15:45', '甘肃省酒泉市瓜州县', '1', '4.2.2.620922', '1', '4', '瓜州县', '22', 'GZX', null, '003062009022', null);
INSERT INTO `pa_bmzd` VALUES ('4AB8D21C9CB84AB293F44FE76A130FC4', '2015-05-03 11:15:45', '湖北省省直辖县级行政区划神农架林区', '1', '4.2.2.429021', '1', '4', '神农架林区', '21', 'SNJLQ', null, '003042090021', null);
INSERT INTO `pa_bmzd` VALUES ('4ABA85B83E5847AD894F0B2E3B04C44A', '2015-05-03 11:15:45', '山西省长治市黎城县', '1', '4.2.2.140426', '1', '4', '黎城县', '26', 'LCX', null, '003014004026', null);
INSERT INTO `pa_bmzd` VALUES ('4ABD76E489784571A503E50E9C99ABD1', '2015-05-03 11:15:45', '云南省文山壮族苗族自治州', '1', '4.2.2.532600', '0', '3', '文山壮族苗族自治州', '26', 'WSZZMZZZZ', null, '003053026', null);
INSERT INTO `pa_bmzd` VALUES ('4AC714394E7846A392AFB25B76D67D28', '2015-05-03 11:15:45', '西藏自治区山南地区加查县', '1', '4.2.2.542229', '1', '4', '加查县', '29', 'JCX', null, '003054022029', null);
INSERT INTO `pa_bmzd` VALUES ('4AD5BC1777EA40758328D8BC1E76E47D', '2015-05-03 11:15:45', '黑龙江省大庆市肇州县', '1', '4.2.2.230621', '1', '4', '肇州县', '21', 'ZZX', null, '003023006021', null);
INSERT INTO `pa_bmzd` VALUES ('4AF00F93798849928325F66407EA5C30', '2015-05-03 11:15:45', '安徽省芜湖市市辖区', '1', '4.2.2.340201', '1', '4', '市辖区', '1', 'SXQ', null, '003034002001', null);
INSERT INTO `pa_bmzd` VALUES ('4B0EA0240A3D40E186C3B0A5D2E9C0DB', '2015-05-03 11:15:45', '陕西省汉中市西乡县', '1', '4.2.2.610724', '1', '4', '西乡县', '24', 'XXX', null, '003061007024', null);
INSERT INTO `pa_bmzd` VALUES ('4B1090405F4841AFA7220BBC6AA11A49', '2015-05-03 11:15:45', '云南省昭通市威信县', '1', '4.2.2.530629', '1', '4', '威信县', '29', 'WXX', null, '003053006029', null);
INSERT INTO `pa_bmzd` VALUES ('4B19F8FD325D4ABC9B71B10308B467CB', '2015-05-03 11:15:45', '内蒙古自治区呼和浩特市', '1', '4.2.2.150100', '0', '3', '呼和浩特市', '1', 'HHHTS', null, '003015001', null);
INSERT INTO `pa_bmzd` VALUES ('4B31FA95DD3A41CE8338E8AA496F2400', '2015-05-03 11:15:45', '安徽省蚌埠市蚌山区', '1', '4.2.2.340303', '1', '4', '蚌山区', '3', 'BSQ', null, '003034003003', null);
INSERT INTO `pa_bmzd` VALUES ('4B3538C7625547E38ACB2A577376F3A6', '2015-05-03 11:15:45', '浙江省湖州市安吉县', '1', '4.2.2.330523', '1', '4', '安吉县', '23', 'AJX', null, '003033005023', null);
INSERT INTO `pa_bmzd` VALUES ('4B3990D620024DD58156DE7DC655D6E6', '2015-05-03 11:15:45', '西藏自治区阿里地区措勤县', '1', '4.2.2.542527', '1', '4', '措勤县', '27', 'CQX', null, '003054025027', null);
INSERT INTO `pa_bmzd` VALUES ('4B6C0BFC6E74436B866CBA6F1ADEC0A3', '2015-05-03 11:15:45', '辽宁省抚顺市新宾满族自治县', '1', '4.2.2.210422', '1', '4', '新宾满族自治县', '22', 'XBMZZZX', null, '003021004022', null);
INSERT INTO `pa_bmzd` VALUES ('4B86A40E17314FC0B782533C3AAEE0BD', '2015-05-03 11:15:45', '湖北省省直辖县级行政区划仙桃市', '1', '4.2.2.429004', '1', '4', '仙桃市', '4', 'XTS', null, '003042090004', null);
INSERT INTO `pa_bmzd` VALUES ('4B93B70F4CAE4ABDBC2562C87169927B', '2015-05-03 11:15:45', '湖北省鄂州市市辖区', '1', '4.2.2.420701', '1', '4', '市辖区', '1', 'SXQ', null, '003042007001', null);
INSERT INTO `pa_bmzd` VALUES ('4BC9B378E95A43A9A57DBC72F2931665', '2015-05-03 11:15:45', '湖北省黄冈市武穴市', '1', '4.2.2.421182', '1', '4', '武穴市', '82', 'WXS', null, '003042011082', null);
INSERT INTO `pa_bmzd` VALUES ('4BD090A34DF544CFB3145C44AC20CEED', '2015-05-03 11:15:45', '湖北省黄冈市麻城市', '1', '4.2.2.421181', '1', '4', '麻城市', '81', 'MCS', null, '003042011081', null);
INSERT INTO `pa_bmzd` VALUES ('4BD0F82860D54A8B8C2D8C34A998D889', '2015-05-03 11:15:45', '山西省吕梁市交口县', '1', '4.2.2.141130', '1', '4', '交口县', '30', 'JKX', null, '003014011030', null);
INSERT INTO `pa_bmzd` VALUES ('4BD106F423174FC5AB2BEE73E2756161', '2015-05-03 11:15:45', '福建省三明市明溪县', '1', '4.2.2.350421', '1', '4', '明溪县', '21', 'MXX', null, '003035004021', null);
INSERT INTO `pa_bmzd` VALUES ('4BDF6EBA00B3453E91E79755C5AE3A23', '2015-05-03 11:15:45', '河南省新乡市红旗区', '1', '4.2.2.410702', '1', '4', '红旗区', '2', 'HQQ', null, '003041007002', null);
INSERT INTO `pa_bmzd` VALUES ('4BE21B3293474F05BAEF84A74C33868B', '2015-05-03 11:15:45', '浙江省丽水市莲都区', '1', '4.2.2.331102', '1', '4', '莲都区', '2', 'LDQ', null, '003033011002', null);
INSERT INTO `pa_bmzd` VALUES ('4C039F25AB96473ABA146BF50E9B0A70', '2015-05-03 11:15:45', '新疆维吾尔自治区巴音郭楞蒙古自治州且末县', '1', '4.2.2.652825', '1', '4', '且末县', '25', 'QMX', null, '003065028025', null);
INSERT INTO `pa_bmzd` VALUES ('4C101C3A43AD4243821927206BE64F5C', '2015-05-03 11:15:45', '陕西省榆林市靖边县', '1', '4.2.2.610824', '1', '4', '靖边县', '24', 'JBX', null, '003061008024', null);
INSERT INTO `pa_bmzd` VALUES ('4C197AF8FAA04249B70F31343C9D4860', '2015-05-03 11:15:45', '黑龙江省哈尔滨市巴彦县', '1', '4.2.2.230126', '1', '4', '巴彦县', '26', 'BYX', null, '003023001026', null);
INSERT INTO `pa_bmzd` VALUES ('4C2E1C7CEA6946C29D231C49E2027F60', '2015-05-03 11:15:45', '广西壮族自治区柳州市柳南区', '1', '4.2.2.450204', '1', '4', '柳南区', '4', 'LNQ', null, '003045002004', null);
INSERT INTO `pa_bmzd` VALUES ('4C3344A799884E9B83921CAE04F10363', '2015-05-03 11:15:45', '山西省太原市尖草坪区', '1', '4.2.2.140108', '1', '4', '尖草坪区', '8', 'JCPQ', null, '003014001008', null);
INSERT INTO `pa_bmzd` VALUES ('4C645C76FE784CBEBA1CB0E506F39651', '2015-05-03 11:15:45', '新疆维吾尔自治区塔城地区', '1', '4.2.2.654200', '0', '3', '塔城地区', '42', 'TCDQ', null, '003065042', null);
INSERT INTO `pa_bmzd` VALUES ('4C6CEF02572D4DEA9A10F031C0A2626F', '2015-05-03 11:15:45', '甘肃省庆阳市', '1', '4.2.2.621000', '0', '3', '庆阳市', '10', 'QYS', null, '003062010', null);
INSERT INTO `pa_bmzd` VALUES ('4C7037D34ED248F783D25671C13611C1', '2015-05-03 11:15:45', '安徽省巢湖市', '1', '4.2.2.340124', '0', '4', '巢湖市', '81', 'CHS', null, '003034001081', null);
INSERT INTO `pa_bmzd` VALUES ('4CB43538A7524B9ABFF7B8582383F326', '2015-05-03 11:15:45', '福建省龙岩市新罗区', '1', '4.2.2.350802', '1', '4', '新罗区', '2', 'XLQ', null, '003035008002', null);
INSERT INTO `pa_bmzd` VALUES ('4CD7136FE6FE41318DAAE85550DF0BFF', '2015-05-03 11:15:45', '江苏省无锡市江阴市', '1', '4.2.2.320281', '1', '4', '江阴市', '81', 'JYS', null, '003032002081', null);
INSERT INTO `pa_bmzd` VALUES ('4CE431DC9BED485382CC69CC2B643F75', '2015-05-03 11:15:45', '新疆维吾尔自治区喀什地区巴楚县', '1', '4.2.2.653130', '1', '4', '巴楚县', '30', 'BCX', null, '003065031030', null);
INSERT INTO `pa_bmzd` VALUES ('4CFDDE6037744E0297C4CB01D0AC9465', '2015-05-03 11:15:45', '河南省安阳市北关区', '1', '4.2.2.410503', '1', '4', '北关区', '3', 'BGQ', null, '003041005003', null);
INSERT INTO `pa_bmzd` VALUES ('4D02C4215DBA4C3CA9FD7C5CFF5EC2A3', '2015-05-03 11:15:45', '江西省赣州市宁都县', '1', '4.2.2.360730', '1', '4', '宁都县', '30', 'NDX', null, '003036007030', null);
INSERT INTO `pa_bmzd` VALUES ('4D1F3B50BED643649CC98F1ED535D9E6', '2015-05-03 11:15:45', '江苏省淮安市楚州区', '1', '4.2.2.320803', '1', '4', '楚州区', '3', 'CZQ', null, '003032008003', null);
INSERT INTO `pa_bmzd` VALUES ('4D21C70B6BF848E98128FE33835F47B8', '2015-05-03 11:15:45', '西藏自治区日喀则地区萨嘎县', '1', '4.2.2.542337', '1', '4', '萨嘎县', '37', 'SGX', null, '003054023037', null);
INSERT INTO `pa_bmzd` VALUES ('4D26B230302840368D528BC44A0BE817', '2015-05-03 11:15:45', '黑龙江省哈尔滨市方正县', '1', '4.2.2.230124', '1', '4', '方正县', '24', 'FZX', null, '003023001024', null);
INSERT INTO `pa_bmzd` VALUES ('4D435A34360944B0B3A34D8F266F82F8', '2015-05-03 11:15:45', '黑龙江省伊春市新青区', '1', '4.2.2.230707', '1', '4', '新青区', '7', 'XQQ', null, '003023007007', null);
INSERT INTO `pa_bmzd` VALUES ('4D468188F55A4E998E5181AC14AB1E03', '2015-05-03 11:15:45', '广西壮族自治区河池市金城江区', '1', '4.2.2.451202', '1', '4', '金城江区', '2', 'JCJQ', null, '003045012002', null);
INSERT INTO `pa_bmzd` VALUES ('4D6302BF404F46A69602A8CCAE60174C', '2015-05-03 11:15:45', '吉林省四平市铁西区', '1', '4.2.2.220302', '1', '4', '铁西区', '2', 'TXQ', null, '003022003002', null);
INSERT INTO `pa_bmzd` VALUES ('4D6359FCEF144627B4EBD74D271D0BA9', '2015-05-03 11:15:45', '青海省海南藏族自治州', '1', '4.2.2.632500', '0', '3', '海南藏族自治州', '25', 'HNZZZZZ', null, '003063025', null);
INSERT INTO `pa_bmzd` VALUES ('4D6DC6C2382A4F32802E6E5603D3B844', '2015-05-03 11:15:45', '广东省揭阳市揭东县', '1', '4.2.2.445221', '1', '4', '揭东县', '21', 'JDX', null, '003044052021', null);
INSERT INTO `pa_bmzd` VALUES ('4D8112F6A2E24AF982C13A7DBBEDB278', '2015-05-03 11:15:45', '浙江省台州市椒江区', '1', '4.2.2.331002', '1', '4', '椒江区', '2', 'JJQ', null, '003033010002', null);
INSERT INTO `pa_bmzd` VALUES ('4D96F2C3BD1A4F48BB9AA5C628EF7862', '2015-05-03 11:15:45', '江西省上饶市万年县', '1', '4.2.2.361129', '1', '4', '万年县', '29', 'WNX', null, '003036011029', null);
INSERT INTO `pa_bmzd` VALUES ('4DF0871DDE274DD28E07F11050495C28', '2015-05-03 11:15:45', '陕西省延安市富县', '1', '4.2.2.610628', '1', '4', '富县', '28', 'FX', null, '003061006028', null);
INSERT INTO `pa_bmzd` VALUES ('4DF676E6B02D46148AA5018D825BD2A6', '2015-05-03 11:15:45', '甘肃省甘南藏族自治州', '1', '4.2.2.623000', '0', '3', '甘南藏族自治州', '30', 'GNZZZZZ', null, '003062030', null);
INSERT INTO `pa_bmzd` VALUES ('4E05D809EED24AF9BFB94851DF755016', '2015-05-03 11:15:45', '贵州省黔东南苗族侗族自治州黎平县', '1', '4.2.2.522631', '1', '4', '黎平县', '31', 'LPX', null, '003052026031', null);
INSERT INTO `pa_bmzd` VALUES ('4E1A94101F29490BB0BC1C6B2C662E23', '2015-05-03 11:15:45', '辽宁省葫芦岛市绥中县', '1', '4.2.2.211421', '1', '4', '绥中县', '21', 'SZX', null, '003021014021', null);
INSERT INTO `pa_bmzd` VALUES ('4E5358B7F02540FFBEFFF3EF712030FD', '2015-05-03 11:15:45', '河南省周口市市辖区', '1', '4.2.2.411601', '1', '4', '市辖区', '1', 'SXQ', null, '003041016001', null);
INSERT INTO `pa_bmzd` VALUES ('4E5B40A8AD5A445490D9E0B4823327BA', '2015-05-03 11:15:45', '云南省曲靖市罗平县', '1', '4.2.2.530324', '1', '4', '罗平县', '24', 'LPX', null, '003053003024', null);
INSERT INTO `pa_bmzd` VALUES ('4E5E7D8BB865440298270B66BED15FD6', '2015-05-03 11:15:45', '河北省唐山市乐亭县', '1', '4.2.2.130225', '1', '4', '乐亭县', '25', 'YTX', null, '003013002025', null);
INSERT INTO `pa_bmzd` VALUES ('4E93732760654E19B626DC58CF0D96DB', '2015-05-03 11:15:45', '陕西省安康市紫阳县', '1', '4.2.2.610924', '1', '4', '紫阳县', '24', 'ZYX', null, '003061009024', null);
INSERT INTO `pa_bmzd` VALUES ('4EB20E9F7A9B4C3F83A7D9360A27ED80', '2015-05-03 11:15:45', '陕西省宝鸡市凤县', '1', '4.2.2.610330', '1', '4', '凤县', '30', 'FX', null, '003061003030', null);
INSERT INTO `pa_bmzd` VALUES ('4ECB0139C6BC40E2BF75582275AA48B8', '2015-05-03 11:15:45', '四川省成都市大邑县', '1', '4.2.2.510129', '1', '4', '大邑县', '29', 'DYX', null, '003051001029', null);
INSERT INTO `pa_bmzd` VALUES ('4EEAA4C17C7B41329C40DAB87A1C3DEC', '2015-05-03 11:15:45', '湖北省宜昌市远安县', '1', '4.2.2.420525', '1', '4', '远安县', '25', 'YAX', null, '003042005025', null);
INSERT INTO `pa_bmzd` VALUES ('4EF272C6B5714EBCA4BD7437B70C09EF', '2015-05-03 11:15:45', '河北省唐山市市辖区', '1', '4.2.2.130201', '1', '4', '市辖区', '1', 'SXQ', null, '003013002001', null);
INSERT INTO `pa_bmzd` VALUES ('4EF5B575D25C4C2EBA5C5B4771F788CD', '2015-05-03 11:15:45', '山东省临沂市河东区', '1', '4.2.2.371312', '1', '4', '河东区', '12', 'HDQ', null, '003037013012', null);
INSERT INTO `pa_bmzd` VALUES ('4F2C75A30BBC43B28ED1C3C048FD8E7E', '2015-05-03 11:15:45', '四川省绵阳市市辖区', '1', '4.2.2.510701', '1', '4', '市辖区', '1', 'SXQ', null, '003051007001', null);
INSERT INTO `pa_bmzd` VALUES ('4F49ABAA573A4127B665F7EA972F80FD', '2015-05-03 11:15:45', '江苏省淮安市清浦区', '1', '4.2.2.320811', '1', '4', '清浦区', '11', 'QPQ', null, '003032008011', null);
INSERT INTO `pa_bmzd` VALUES ('4F68FC449B7F448C851E2CAF12871D69', '2015-05-03 11:15:45', '贵州省遵义市务川仡佬族苗族自治县', '1', '4.2.2.520326', '1', '4', '务川仡佬族苗族自治县', '26', 'WCYLZMZZZX', null, '003052003026', null);
INSERT INTO `pa_bmzd` VALUES ('4F7FC7138A6A4956A1813B0897430955', '2015-05-03 11:15:45', '甘肃省临夏回族自治州广河县', '1', '4.2.2.622924', '1', '4', '广河县', '24', 'GHX', null, '003062029024', null);
INSERT INTO `pa_bmzd` VALUES ('4FA3FC2B908C498D8882DADA1A2BB152', '2015-05-03 11:15:45', '贵州省铜仁市沿河土家族自治县', '1', '4.2.2.522228', '1', '4', '沿河土家族自治县', '27', 'YHTJZZZX', null, '003052006027', null);
INSERT INTO `pa_bmzd` VALUES ('4FAF00FF1CFC487CAC1B8B49857DE3CE', '2015-05-03 11:15:45', '贵州省黔东南苗族侗族自治州从江县', '1', '4.2.2.522633', '1', '4', '从江县', '33', 'CJX', null, '003052026033', null);
INSERT INTO `pa_bmzd` VALUES ('4FB4313A30E04DE8B25AAA5DCF9BC226', '2015-05-03 11:15:45', '云南省大理白族自治州弥渡县', '1', '4.2.2.532925', '1', '4', '弥渡县', '25', 'MDX', null, '003053029025', null);
INSERT INTO `pa_bmzd` VALUES ('4FDC4335EE9F4C1193C6BFBC3706252B', '2015-05-03 11:15:45', '云南省玉溪市元江哈尼族彝族傣族自治县', '1', '4.2.2.530428', '1', '4', '元江哈尼族彝族傣族自治县', '28', 'YJHNZYZDZZZX', null, '003053004028', null);
INSERT INTO `pa_bmzd` VALUES ('4FE9EB0A124A472BB217193366C2E114', '2015-05-03 11:15:45', '山东省青岛市市南区', '1', '4.2.2.370202', '1', '4', '市南区', '2', 'SNQ', null, '003037002002', null);
INSERT INTO `pa_bmzd` VALUES ('4FECFCB03CE5455F80C15C5116B18020', '2015-05-03 11:15:45', '西藏自治区那曲地区那曲县', '1', '4.2.2.542421', '1', '4', '那曲县', '21', 'NQX', null, '003054024021', null);
INSERT INTO `pa_bmzd` VALUES ('4FEFCBE2A0414995A743694D59CC6762', '2015-05-03 11:15:45', '河南省焦作市山阳区', '1', '4.2.2.410811', '1', '4', '山阳区', '11', 'SYQ', null, '003041008011', null);
INSERT INTO `pa_bmzd` VALUES ('4FFF6949689948FCB676111116AC5EF8', '2015-05-03 11:15:45', '河北省石家庄市井陉县', '1', '4.2.2.130121', '1', '4', '井陉县', '21', 'JXX', null, '003013001021', null);
INSERT INTO `pa_bmzd` VALUES ('5003AFE77C2E4344BF2BDF81C062746A', '2015-05-03 11:15:45', '青海省海南藏族自治州贵南县', '1', '4.2.2.632525', '1', '4', '贵南县', '25', 'GNX', null, '003063025025', null);
INSERT INTO `pa_bmzd` VALUES ('501DF81EA3114681BC7A3BBFDF397B53', '2015-05-03 11:15:45', '云南省大理白族自治州宾川县', '1', '4.2.2.532924', '1', '4', '宾川县', '24', 'BCX', null, '003053029024', null);
INSERT INTO `pa_bmzd` VALUES ('50219C58AECB4CD1B59CD43D98E07435', '2015-05-03 11:15:45', '山东省济南市市中区', '1', '4.2.2.370103', '1', '4', '市中区', '3', 'SZQ', null, '003037001003', null);
INSERT INTO `pa_bmzd` VALUES ('50499A47E3904D38A3D1D68DCBA49B2F', '2015-05-03 11:15:45', '河北省沧州市河间市', '1', '4.2.2.130984', '1', '4', '河间市', '84', 'HJS', null, '003013009084', null);
INSERT INTO `pa_bmzd` VALUES ('504B0C97503442C58CF987BEEDFA2A09', '2015-05-03 11:15:45', '陕西省渭南市合阳县', '1', '4.2.2.610524', '1', '4', '合阳县', '24', 'HYX', null, '003061005024', null);
INSERT INTO `pa_bmzd` VALUES ('506E2BE4FFC84D6585F97DF5C9E175DB', '2015-05-03 11:15:45', '江西省宜春市靖安县', '1', '4.2.2.360925', '1', '4', '靖安县', '25', 'JAX', null, '003036009025', null);
INSERT INTO `pa_bmzd` VALUES ('5075CD3C395641A5BB1BBE8920FAF1B0', '2015-05-03 11:15:45', '广东省广州市海珠区', '1', '4.2.2.440105', '1', '4', '海珠区', '5', 'HZQ', null, '003044001005', null);
INSERT INTO `pa_bmzd` VALUES ('507C0882BE664878A4929EA3F410818C', '2015-05-03 11:15:45', '山西省临汾市蒲县', '1', '4.2.2.141033', '1', '4', '蒲县', '33', 'PX', null, '003014010033', null);
INSERT INTO `pa_bmzd` VALUES ('50857D0630504C6CB0A857E1054685F3', '2015-05-03 11:15:45', '浙江省丽水市云和县', '1', '4.2.2.331125', '1', '4', '云和县', '25', 'YHX', null, '003033011025', null);
INSERT INTO `pa_bmzd` VALUES ('509D824328F04C73AB09B90B32412F22', '2015-05-03 11:15:45', '广西壮族自治区玉林市', '1', '4.2.2.450900', '0', '3', '玉林市', '9', 'YLS', null, '003045009', null);
INSERT INTO `pa_bmzd` VALUES ('50AF6B9B65854A1A827B0B4D14F3CFD9', '2015-05-03 11:15:45', '湖北省襄阳市枣阳市', '1', '4.2.2.420683', '1', '4', '枣阳市', '83', 'ZYS', null, '003042006083', null);
INSERT INTO `pa_bmzd` VALUES ('50D921204F0A4F54BEE2C373ABDBEFA5', '2015-05-03 11:15:45', '河北省唐山市滦南县', '1', '4.2.2.130224', '1', '4', '滦南县', '24', 'LNX', null, '003013002024', null);
INSERT INTO `pa_bmzd` VALUES ('50DE368C73534B08BB9E79F56CED7107', '2015-05-03 11:15:45', '西藏自治区那曲地区比如县', '1', '4.2.2.542423', '1', '4', '比如县', '23', 'BRX', null, '003054024023', null);
INSERT INTO `pa_bmzd` VALUES ('50E1CD471EBC4C2D82CBF579674213F1', '2015-05-03 11:15:45', '山东省枣庄市薛城区', '1', '4.2.2.370403', '1', '4', '薛城区', '3', 'XCQ', null, '003037004003', null);
INSERT INTO `pa_bmzd` VALUES ('50F0BD7C705A4B2A9326B35B2579CBE9', '2015-05-03 11:15:45', '山东省菏泽市市辖区', '1', '4.2.2.371701', '1', '4', '市辖区', '1', 'SXQ', null, '003037017001', null);
INSERT INTO `pa_bmzd` VALUES ('5100C0642FA6401E942D2A430FB4C49F', '2015-05-03 11:15:45', '上海市市辖区黄浦区', '1', '4.2.2.310101', '1', '4', '黄浦区', '1', 'HPQ', null, '003031001001', null);
INSERT INTO `pa_bmzd` VALUES ('51140821A0264E648B3A0410C046C5A3', '2015-05-03 11:15:45', '西藏自治区日喀则地区亚东县', '1', '4.2.2.542334', '1', '4', '亚东县', '34', 'YDX', null, '003054023034', null);
INSERT INTO `pa_bmzd` VALUES ('5119554877E54EA1BB2C2BB9D9B3E282', '2015-05-03 11:15:45', '河北省保定市安国市', '1', '4.2.2.130683', '1', '4', '安国市', '83', 'AGS', null, '003013006083', null);
INSERT INTO `pa_bmzd` VALUES ('511C07168EB04F7D98D7D8B207A71ABF', '2015-05-03 11:15:45', '新疆维吾尔自治区伊犁哈萨克自治州巩留县', '1', '4.2.2.654024', '1', '4', '巩留县', '24', 'GLX', null, '003065040024', null);
INSERT INTO `pa_bmzd` VALUES ('5124D6CF22724D2B80BD1012BF28F934', '2015-05-03 11:15:45', '云南省迪庆藏族自治州维西傈僳族自治县', '1', '4.2.2.533423', '1', '4', '维西傈僳族自治县', '23', 'WXLSZZZX', null, '003053034023', null);
INSERT INTO `pa_bmzd` VALUES ('514F82E8003E480F89AEF5493768180A', '2015-05-03 11:15:45', '河南省开封市兰考县', '1', '4.2.2.410225', '1', '4', '兰考县', '25', 'LKX', null, '003041002025', null);
INSERT INTO `pa_bmzd` VALUES ('519B900D76154C8CB17E6E79DA4F40EF', '2015-05-03 11:15:45', '山西省大同市广灵县', '1', '4.2.2.140223', '1', '4', '广灵县', '23', 'GLX', null, '003014002023', null);
INSERT INTO `pa_bmzd` VALUES ('51B6153DCCB5453394B645E4F72E9371', '2015-05-03 11:15:45', '山西省吕梁市柳林县', '1', '4.2.2.141125', '1', '4', '柳林县', '25', 'LLX', null, '003014011025', null);
INSERT INTO `pa_bmzd` VALUES ('51DBDB2201504E7888708C233D87363F', '2015-05-03 11:15:45', '山东省临沂市临沭县', '1', '4.2.2.371329', '1', '4', '临沭县', '29', 'LSX', null, '003037013029', null);
INSERT INTO `pa_bmzd` VALUES ('51DF08ADFB624A75B9B91CD2F2585197', '2015-05-03 11:15:45', '江西省吉安市青原区', '1', '4.2.2.360803', '1', '4', '青原区', '3', 'QYQ', null, '003036008003', null);
INSERT INTO `pa_bmzd` VALUES ('51E7FBF7F8DD4FB2861321D027F37AE7', '2015-05-03 11:15:45', '福建省莆田市', '1', '4.2.2.350300', '0', '3', '莆田市', '3', 'PTS', null, '003035003', null);
INSERT INTO `pa_bmzd` VALUES ('520447C9A38C4E54B36B9B29F06DA821', '2015-05-03 11:15:45', '吉林省延边朝鲜族自治州', '1', '4.2.2.222400', '0', '3', '延边朝鲜族自治州', '24', 'YBZXZZZZ', null, '003022024', null);
INSERT INTO `pa_bmzd` VALUES ('523FEFE4FD134E3FBA75A333C779DC59', '2015-05-03 11:15:45', '四川省宜宾市筠连县', '1', '4.2.2.511527', '1', '4', '筠连县', '27', 'YLX', null, '003051015027', null);
INSERT INTO `pa_bmzd` VALUES ('524887A7B03949CDA059479218A088FB', '2015-05-03 11:15:45', '天津市', '1', '4.2.2.120000', '0', '2', '天津市', '12', 'TJS', null, '003012', null);
INSERT INTO `pa_bmzd` VALUES ('52539DA1B757407B9F193A2A977A2F50', '2015-05-03 11:15:45', '广西壮族自治区河池市南丹县', '1', '4.2.2.451221', '1', '4', '南丹县', '21', 'NDX', null, '003045012021', null);
INSERT INTO `pa_bmzd` VALUES ('5264C4FB8D164A9F9B382D07D54FFF2C', '2015-05-03 11:15:45', '西藏自治区昌都地区贡觉县', '1', '4.2.2.542123', '1', '4', '贡觉县', '23', 'GJX', null, '003054021023', null);
INSERT INTO `pa_bmzd` VALUES ('5268EF6CEC594CBCAC5B397806A8EE7E', '2015-05-03 11:15:45', '湖南省郴州市宜章县', '1', '4.2.2.431022', '1', '4', '宜章县', '22', 'YZX', null, '003043010022', null);
INSERT INTO `pa_bmzd` VALUES ('528FE5F78A414360A273EBC44EBC2373', '2015-05-03 11:15:45', '陕西省铜川市耀州区', '1', '4.2.2.610204', '1', '4', '耀州区', '4', 'YZQ', null, '003061002004', null);
INSERT INTO `pa_bmzd` VALUES ('5291421C960A4B32B8C74233B71DD949', '2015-05-03 11:15:45', '四川省眉山市市辖区', '1', '4.2.2.511401', '1', '4', '市辖区', '1', 'SXQ', null, '003051014001', null);
INSERT INTO `pa_bmzd` VALUES ('529E9DDF922044509E693053B48B1521', '2015-05-03 11:15:45', '陕西省渭南市澄城县', '1', '4.2.2.610525', '1', '4', '澄城县', '25', 'DCX', null, '003061005025', null);
INSERT INTO `pa_bmzd` VALUES ('52AFBB97C2E940F2ADF21C2C095320CA', '2015-05-03 11:15:45', '四川省广安市岳池县', '1', '4.2.2.511621', '1', '4', '岳池县', '21', 'YCX', null, '003051016021', null);
INSERT INTO `pa_bmzd` VALUES ('53201819869C44DBAED03707C07E9A42', '2015-05-03 11:15:45', '辽宁省抚顺市新抚区', '1', '4.2.2.210402', '1', '4', '新抚区', '2', 'XFQ', null, '003021004002', null);
INSERT INTO `pa_bmzd` VALUES ('536F3B741A6349838C06D7D3F25B1747', '2015-05-03 11:15:45', '湖南省衡阳市市辖区', '1', '4.2.2.430401', '1', '4', '市辖区', '1', 'SXQ', null, '003043004001', null);
INSERT INTO `pa_bmzd` VALUES ('538CA3C8C1E1422896487BE5A817678A', '2015-05-03 11:15:45', '江西省吉安市市辖区', '1', '4.2.2.360801', '1', '4', '市辖区', '1', 'SXQ', null, '003036008001', null);
INSERT INTO `pa_bmzd` VALUES ('538E2E9370EE476F8328A6F2745C0FF1', '2015-05-03 11:15:45', '北京市市辖区怀柔区', '1', '4.2.2.110116', '1', '4', '怀柔区', '16', 'HRQ', null, '003011001016', null);
INSERT INTO `pa_bmzd` VALUES ('539EADEFD69F4C72BE353C8833F80FFE', '2015-05-03 11:15:45', '黑龙江省大兴安岭地区呼玛县', '1', '4.2.2.232721', '1', '4', '呼玛县', '21', 'HMX', null, '003023027021', null);
INSERT INTO `pa_bmzd` VALUES ('53A7EB893EB14E478C4ADA52BB53753F', '2015-05-03 11:15:45', '江苏省连云港市连云区', '1', '4.2.2.320703', '1', '4', '连云区', '3', 'LYQ', null, '003032007003', null);
INSERT INTO `pa_bmzd` VALUES ('53E8B0D5A4FD4D80B68B93FFC209534C', '2015-05-03 11:15:45', '广西壮族自治区桂林市灌阳县', '1', '4.2.2.450327', '1', '4', '灌阳县', '27', 'GYX', null, '003045003027', null);
INSERT INTO `pa_bmzd` VALUES ('53EA33FC207643B88D480C6BC0C15014', '2015-05-03 11:15:45', '黑龙江省大庆市', '1', '4.2.2.230600', '0', '3', '大庆市', '6', 'DQS', null, '003023006', null);
INSERT INTO `pa_bmzd` VALUES ('53F0E3B41D04412CA63EC7BE050D801C', '2015-05-03 11:15:45', '黑龙江省双鸭山市岭东区', '1', '4.2.2.230503', '1', '4', '岭东区', '3', 'LDQ', null, '003023005003', null);
INSERT INTO `pa_bmzd` VALUES ('542F75F8F65449858E972225BEDFB8EF', '2015-05-03 11:15:45', '河北省邯郸市鸡泽县', '1', '4.2.2.130431', '1', '4', '鸡泽县', '31', 'JZX', null, '003013004031', null);
INSERT INTO `pa_bmzd` VALUES ('54466B34F2FD43A2A4F9738941B5E352', '2015-05-03 11:15:45', '陕西省安康市汉滨区', '1', '4.2.2.610902', '1', '4', '汉滨区', '2', 'HBQ', null, '003061009002', null);
INSERT INTO `pa_bmzd` VALUES ('546FB6286CC146DF8EC1AD700E53458C', '2015-05-03 11:15:45', '广西壮族自治区桂林市恭城瑶族自治县', '1', '4.2.2.450332', '1', '4', '恭城瑶族自治县', '32', 'GCYZZZX', null, '003045003032', null);
INSERT INTO `pa_bmzd` VALUES ('5479D7D952F042C2AD8A5F8B4CF7E3CF', '2015-05-03 11:15:45', '山东省淄博市淄川区', '1', '4.2.2.370302', '1', '4', '淄川区', '2', 'ZCQ', null, '003037003002', null);
INSERT INTO `pa_bmzd` VALUES ('547F6B103B6D4A8F88E40FAF18D83B7D', '2015-05-03 11:15:45', '山东省泰安市肥城市', '1', '4.2.2.370983', '1', '4', '肥城市', '83', 'FCS', null, '003037009083', null);
INSERT INTO `pa_bmzd` VALUES ('54B76471C51B4BCBA287E92014514878', '2015-05-03 11:15:45', '河北省保定市容城县', '1', '4.2.2.130629', '1', '4', '容城县', '29', 'RCX', null, '003013006029', null);
INSERT INTO `pa_bmzd` VALUES ('54E6117DC9B04D4B8613EC83C6097F8A', '2015-05-03 11:15:45', '湖北省鄂州市梁子湖区', '1', '4.2.2.420702', '1', '4', '梁子湖区', '2', 'LZHQ', null, '003042007002', null);
INSERT INTO `pa_bmzd` VALUES ('54F3F07BB28B4B76A8CAB12C800FB82E', '2015-05-03 11:15:45', '湖北省武汉市洪山区', '1', '4.2.2.420111', '1', '4', '洪山区', '11', 'HSQ', null, '003042001011', null);
INSERT INTO `pa_bmzd` VALUES ('5502039F3C944B20A7A2ACFF73B8E72A', '2015-05-03 11:15:45', '江西省吉安市吉州区', '1', '4.2.2.360802', '1', '4', '吉州区', '2', 'JZQ', null, '003036008002', null);
INSERT INTO `pa_bmzd` VALUES ('550C099C7411495AA179D1594536FB0B', '2015-05-03 11:15:45', '福建省南平市政和县', '1', '4.2.2.350725', '1', '4', '政和县', '25', 'ZHX', null, '003035007025', null);
INSERT INTO `pa_bmzd` VALUES ('550D0BE86F4D40A6BD6A97966C7C4A7E', '2015-05-03 11:15:45', '浙江省嘉兴市平湖市', '1', '4.2.2.330482', '1', '4', '平湖市', '82', 'PHS', null, '003033004082', null);
INSERT INTO `pa_bmzd` VALUES ('55130268B579490887A2F9E2D10800C6', '2015-05-03 11:15:45', '吉林省吉林市磐石市', '1', '4.2.2.220284', '1', '4', '磐石市', '84', 'PSS', null, '003022002084', null);
INSERT INTO `pa_bmzd` VALUES ('551401F87F934C68A103B6424F21612E', '2015-05-03 11:15:45', '内蒙古自治区锡林郭勒盟苏尼特左旗', '1', '4.2.2.152523', '1', '4', '苏尼特左旗', '23', 'SNTZQ', null, '003015025023', null);
INSERT INTO `pa_bmzd` VALUES ('551C7D2416454BCEB5A8FC980B63253D', '2015-05-03 11:15:45', '安徽省池州市市辖区', '1', '4.2.2.341701', '1', '4', '市辖区', '1', 'SXQ', null, '003034017001', null);
INSERT INTO `pa_bmzd` VALUES ('552E28C7564A4EF087041E55B36553ED', '2015-05-03 11:15:45', '湖南省长沙市芙蓉区', '1', '4.2.2.430102', '1', '4', '芙蓉区', '2', 'FRQ', null, '003043001002', null);
INSERT INTO `pa_bmzd` VALUES ('552F55F6DABD4AA7BCC4A03D89B6BBAE', '2015-05-03 11:15:45', '山东省济宁市汶上县', '1', '4.2.2.370830', '1', '4', '汶上县', '30', 'WSX', null, '003037008030', null);
INSERT INTO `pa_bmzd` VALUES ('554390636FB54CBCA3A5CCBDFF9167F0', '2015-05-03 11:15:45', '云南省德宏傣族景颇族自治州盈江县', '1', '4.2.2.533123', '1', '4', '盈江县', '23', 'YJX', null, '003053031023', null);
INSERT INTO `pa_bmzd` VALUES ('554F5524FB264935AD8B96F2686B4334', '2015-05-03 11:15:45', '山西省忻州市河曲县', '1', '4.2.2.140930', '1', '4', '河曲县', '30', 'HQX', null, '003014009030', null);
INSERT INTO `pa_bmzd` VALUES ('4022818b3c1ce261013c1ec1f6830010', '2013-01-09 18:01:34', '北京市市辖区崇文区', '1', '4.2.2.110103', '1', '4', '崇文区', '18', 'CWQ', null, '003011001018', '0');
INSERT INTO `pa_bmzd` VALUES ('4022818b3c1ce261013c1ec26a630011', '2013-01-09 18:02:03', '北京市市辖区宣武区', '1', '4.2.2.110104', '1', '4', '宣武区', '19', 'XWQ', null, '003011001019', '0');
INSERT INTO `pa_bmzd` VALUES ('5f70ed953c204315013c220560390012', '2013-01-10 09:14:03', '湖南省长沙市望城县 ', '1', '4.2.2.430122', '1', '4', '望城县 ', '82', 'WCX ', null, '003043001082', '0');
INSERT INTO `pa_bmzd` VALUES ('5f70ed953c204315013c22145c400014', '2013-01-10 09:30:25', '新疆维吾尔自治区乌鲁木齐市东山区', '1', '4.2.2.650108', '1', '4', '东山区', '22', 'DSQ', null, '003065001022', '0');
INSERT INTO `pa_bmzd` VALUES ('5f70ed953c204315013c232650d50016', '2013-01-10 14:29:39', '重庆市市辖区万盛区', '1', '4.2.2.500110', '1', '4', '万盛区', '20', 'WSQ', null, '003050001020', '0');
INSERT INTO `pa_bmzd` VALUES ('58E73336694C459A925B759AD0A23CF2', '2015-05-03 11:15:46', '甘肃省金昌市', '1', '4.2.2.620300', '0', '3', '金昌市', '3', 'JCS', null, '003062003', null);
INSERT INTO `pa_bmzd` VALUES ('58ED144D7EAE418DA25E0D8939F25558', '2015-05-03 11:15:46', '贵州省黔南布依族苗族自治州荔波县', '1', '4.2.2.522722', '1', '4', '荔波县', '22', 'LBX', null, '003052027022', null);
INSERT INTO `pa_bmzd` VALUES ('5903F051ACB44A0BBD29306D8F34BF6B', '2015-05-03 11:15:46', '内蒙古自治区呼伦贝尔市', '1', '4.2.2.150700', '0', '3', '呼伦贝尔市', '7', 'HLBES', null, '003015007', null);
INSERT INTO `pa_bmzd` VALUES ('590982D2459F40C1929789EFF17C5140', '2015-05-03 11:15:46', '安徽省安庆市岳西县', '1', '4.2.2.340828', '1', '4', '岳西县', '28', 'YXX', null, '003034008028', null);
INSERT INTO `pa_bmzd` VALUES ('593892FEFC094F3A90EBBC2E54C7D34C', '2015-05-03 11:15:46', '河南省濮阳市清丰县', '1', '4.2.2.410922', '1', '4', '清丰县', '22', 'QFX', null, '003041009022', null);
INSERT INTO `pa_bmzd` VALUES ('5945221391184A34BB1F1088E97C3595', '2015-05-03 11:15:46', '安徽省合肥市庐江县', '1', '4.2.2.340125', '1', '4', '庐江县', '24', 'LJX', null, '003034001024', null);
INSERT INTO `pa_bmzd` VALUES ('595A89670D5F41E3A04F595F5B16ACB7', '2015-05-03 11:15:46', '广西壮族自治区河池市凤山县', '1', '4.2.2.451223', '1', '4', '凤山县', '23', 'FSX', null, '003045012023', null);
INSERT INTO `pa_bmzd` VALUES ('5966E46B393542F4AD7AD6EE94C4F29E', '2015-05-03 11:15:46', '西藏自治区日喀则地区日喀则市', '1', '4.2.2.542301', '1', '4', '日喀则市', '1', 'RKZS', null, '003054023001', null);
INSERT INTO `pa_bmzd` VALUES ('5985E668E2764E91B322411B8C16CF1D', '2015-05-03 11:15:46', '河北省石家庄市灵寿县', '1', '4.2.2.130126', '1', '4', '灵寿县', '26', 'LSX', null, '003013001026', null);
INSERT INTO `pa_bmzd` VALUES ('598CC6AADC9D429C8E3184AE8E0FB3D4', '2015-05-03 11:15:46', '内蒙古自治区呼和浩特市清水河县', '1', '4.2.2.150124', '1', '4', '清水河县', '24', 'QSHX', null, '003015001024', null);
INSERT INTO `pa_bmzd` VALUES ('59AFDE7264CA49D9BEE55C2EB810F8DC', '2015-05-03 11:15:46', '甘肃省庆阳市镇原县', '1', '4.2.2.621027', '1', '4', '镇原县', '27', 'ZYX', null, '003062010027', null);
INSERT INTO `pa_bmzd` VALUES ('59BB28930EA348F8A3CFB23EA20E7ABD', '2015-05-03 11:15:46', '辽宁省锦州市北镇市', '1', '4.2.2.210782', '1', '4', '北镇市', '82', 'BZS', null, '003021007082', null);
INSERT INTO `pa_bmzd` VALUES ('59DA3D5AB6284438AF0ED66E285EE36A', '2015-05-03 11:15:46', '云南省保山市腾冲县', '1', '4.2.2.530522', '1', '4', '腾冲县', '22', 'TCX', null, '003053005022', null);
INSERT INTO `pa_bmzd` VALUES ('5A0946ABC33E4D528331D5E120614C06', '2015-05-03 11:15:46', '河南省鹤壁市山城区', '1', '4.2.2.410603', '1', '4', '山城区', '3', 'SCQ', null, '003041006003', null);
INSERT INTO `pa_bmzd` VALUES ('5A3B81EFD2354E00BA27BDE13906AFB0', '2015-05-03 11:15:46', '河南省开封市禹王台区', '1', '4.2.2.410205', '1', '4', '禹王台区', '5', 'YWTQ', null, '003041002005', null);
INSERT INTO `pa_bmzd` VALUES ('5A3E35C8190248A8911E1ED532BEC366', '2015-05-03 11:15:46', '陕西省商洛市', '1', '4.2.2.611000', '0', '3', '商洛市', '10', 'SLS', null, '003061010', null);
INSERT INTO `pa_bmzd` VALUES ('5A4288B911E2495CBBBCA37F85A3322B', '2015-05-03 11:15:46', '四川省乐山市金口河区', '1', '4.2.2.511113', '1', '4', '金口河区', '13', 'JKHQ', null, '003051011013', null);
INSERT INTO `pa_bmzd` VALUES ('5A65F01812664510BCC6D97D6E887E3A', '2015-05-03 11:15:46', '广东省广州市', '1', '4.2.2.440100', '0', '3', '广州市', '1', 'GZS', null, '003044001', null);
INSERT INTO `pa_bmzd` VALUES ('5A6B47B6645245508F060534ADD25C10', '2015-05-03 11:15:46', '四川省', '1', '4.2.2.510000', '0', '2', '四川省', '51', 'SCS', null, '003051', null);
INSERT INTO `pa_bmzd` VALUES ('5A739BF281974246BFE20F5B8782E15B', '2015-05-03 11:15:46', '江西省九江市', '1', '4.2.2.360400', '0', '3', '九江市', '4', 'JJS', null, '003036004', null);
INSERT INTO `pa_bmzd` VALUES ('5A8F3EB755F747D08380BF8AEE2D2554', '2015-05-03 11:15:46', '新疆维吾尔自治区和田地区', '1', '4.2.2.653200', '0', '3', '和田地区', '32', 'HTDQ', null, '003065032', null);
INSERT INTO `pa_bmzd` VALUES ('5A9416FEF52742A786C82A16E9E60B4B', '2015-05-03 11:15:46', '内蒙古自治区乌兰察布市兴和县', '1', '4.2.2.150924', '1', '4', '兴和县', '24', 'XHX', null, '003015009024', null);
INSERT INTO `pa_bmzd` VALUES ('5AA4CCCC7A014C6E93382FDA424348E6', '2015-05-03 11:15:46', '湖南省益阳市', '1', '4.2.2.430900', '0', '3', '益阳市', '9', 'YYS', null, '003043009', null);
INSERT INTO `pa_bmzd` VALUES ('5AB0AB99D9064240B26267E1BBA5F8FE', '2015-05-03 11:15:46', '陕西省宝鸡市眉县', '1', '4.2.2.610326', '1', '4', '眉县', '26', 'MX', null, '003061003026', null);
INSERT INTO `pa_bmzd` VALUES ('5ABE09FFAB6A4AE19CAFC91C83CDE353', '2015-05-03 11:15:46', '云南省迪庆藏族自治州德钦县', '1', '4.2.2.533422', '1', '4', '德钦县', '22', 'DQX', null, '003053034022', null);
INSERT INTO `pa_bmzd` VALUES ('5ACE7005A52E4F1D96A6CAD9ABC2D0C3', '2015-05-03 11:15:46', '四川省乐山市井研县', '1', '4.2.2.511124', '1', '4', '井研县', '24', 'JYX', null, '003051011024', null);
INSERT INTO `pa_bmzd` VALUES ('5AE53406E4A544938328F8055F5C8A8C', '2015-05-03 11:15:46', '云南省昭通市盐津县', '1', '4.2.2.530623', '1', '4', '盐津县', '23', 'YJX', null, '003053006023', null);
INSERT INTO `pa_bmzd` VALUES ('5AF1C1BE1698453A9CE339E54EEFDC1F', '2015-05-03 11:15:46', '新疆维吾尔自治区和田地区洛浦县', '1', '4.2.2.653224', '1', '4', '洛浦县', '24', 'LPX', null, '003065032024', null);
INSERT INTO `pa_bmzd` VALUES ('5B109181876D46249582765CDE6B10AC', '2015-05-03 11:15:46', '安徽省安庆市太湖县', '1', '4.2.2.340825', '1', '4', '太湖县', '25', 'THX', null, '003034008025', null);
INSERT INTO `pa_bmzd` VALUES ('5B1DEA67459F44E8BBCE423AFB046BCD', '2015-05-03 11:15:46', '山东省威海市乳山市', '1', '4.2.2.371083', '1', '4', '乳山市', '83', 'RSS', null, '003037010083', null);
INSERT INTO `pa_bmzd` VALUES ('5B1F7CEC5FE64C76A64B311BBC87EC18', '2015-05-03 11:15:46', '湖南省长沙市岳麓区', '1', '4.2.2.430104', '1', '4', '岳麓区', '4', 'YLQ', null, '003043001004', null);
INSERT INTO `pa_bmzd` VALUES ('5B3C7C54CC134B3ABC9C1F878A189A27', '2015-05-03 11:15:46', '浙江省宁波市市辖区', '1', '4.2.2.330201', '1', '4', '市辖区', '1', 'SXQ', null, '003033002001', null);
INSERT INTO `pa_bmzd` VALUES ('5B5376BAA0DD436F839EA953AE05FBF8', '2015-05-03 11:15:46', '西藏自治区昌都地区昌都县', '1', '4.2.2.542121', '1', '4', '昌都县', '21', 'CDX', null, '003054021021', null);
INSERT INTO `pa_bmzd` VALUES ('5B591602E61E45128DA65C0505DE201F', '2015-05-03 11:15:46', '湖南省郴州市安仁县', '1', '4.2.2.431028', '1', '4', '安仁县', '28', 'ARX', null, '003043010028', null);
INSERT INTO `pa_bmzd` VALUES ('5B6272B69EA8439297A30163210C083E', '2015-05-03 11:15:46', '安徽省黄山市祁门县', '1', '4.2.2.341024', '1', '4', '祁门县', '24', 'QMX', null, '003034010024', null);
INSERT INTO `pa_bmzd` VALUES ('5B878C7C4C974B23A98BF926E03070E6', '2015-05-03 11:15:46', '江苏省镇江市市辖区', '1', '4.2.2.321101', '1', '4', '市辖区', '1', 'SXQ', null, '003032011001', null);
INSERT INTO `pa_bmzd` VALUES ('5BB6CC30716B42D09246B13EF5844A10', '2015-05-03 11:15:46', '吉林省通化市柳河县', '1', '4.2.2.220524', '1', '4', '柳河县', '24', 'LHX', null, '003022005024', null);
INSERT INTO `pa_bmzd` VALUES ('5BBBC5C6E8ED4A0EB1EADED9F3B8C1DA', '2015-05-03 11:15:46', '江西省抚州市资溪县', '1', '4.2.2.361028', '1', '4', '资溪县', '28', 'ZXX', null, '003036010028', null);
INSERT INTO `pa_bmzd` VALUES ('5BE648FF62A34BBDA2803E48EBCAD798', '2015-05-03 11:15:46', '北京市市辖区平谷区', '1', '4.2.2.110117', '1', '4', '平谷区', '17', 'PYQ', null, '003011001017', null);
INSERT INTO `pa_bmzd` VALUES ('5BE706908B8D40628C1D2554E3ECD9AE', '2015-05-03 11:15:46', '浙江省杭州市萧山区', '1', '4.2.2.330109', '1', '4', '萧山区', '9', 'XSQ', null, '003033001009', null);
INSERT INTO `pa_bmzd` VALUES ('5C1D2F8387244FAE97308DB588B4DAD1', '2015-05-03 11:15:46', '广东省阳江市市辖区', '1', '4.2.2.441701', '1', '4', '市辖区', '1', 'SXQ', null, '003044017001', null);
INSERT INTO `pa_bmzd` VALUES ('5C27636AC8B2458D84F5F9738FDB2805', '2015-05-03 11:15:46', '河南省郑州市新郑市', '1', '4.2.2.410184', '1', '4', '新郑市', '84', 'XZS', null, '003041001084', null);
INSERT INTO `pa_bmzd` VALUES ('5C2BA91AAB04482382A09A14ED692625', '2015-05-03 11:15:46', '湖北省十堰市郧西县', '1', '4.2.2.420322', '1', '4', '郧西县', '22', 'YXX', null, '003042003022', null);
INSERT INTO `pa_bmzd` VALUES ('5C4DCD0102754B3DB4A0B1357DCA9F7A', '2015-05-03 11:15:46', '山西省运城市垣曲县', '1', '4.2.2.140827', '1', '4', '垣曲县', '27', 'YQX', null, '003014008027', null);
INSERT INTO `pa_bmzd` VALUES ('5C4E24A1297140DEB3EF392AF3AB9A13', '2015-05-03 11:15:46', '湖北省孝感市孝昌县', '1', '4.2.2.420921', '1', '4', '孝昌县', '21', 'XCX', null, '003042009021', null);
INSERT INTO `pa_bmzd` VALUES ('5C512E7D71E644E9A03A5067F92B15F0', '2015-05-03 11:15:46', '吉林省辽源市西安区', '1', '4.2.2.220403', '1', '4', '西安区', '3', 'XAQ', null, '003022004003', null);
INSERT INTO `pa_bmzd` VALUES ('5C6AFE48212844D6AC635F9FE895FEC0', '2015-05-03 11:15:46', '内蒙古自治区呼伦贝尔市陈巴尔虎旗', '1', '4.2.2.150725', '1', '4', '陈巴尔虎旗', '25', 'CBEHQ', null, '003015007025', null);
INSERT INTO `pa_bmzd` VALUES ('5C7016B30E5342A2A34112E28206848E', '2015-05-03 11:15:46', '黑龙江省大庆市萨尔图区', '1', '4.2.2.230602', '1', '4', '萨尔图区', '2', 'SETQ', null, '003023006002', null);
INSERT INTO `pa_bmzd` VALUES ('5C84383802C9442393D63D0DB94E7D1D', '2015-05-03 11:15:46', '江苏省南通市海安县', '1', '4.2.2.320621', '1', '4', '海安县', '21', 'HAX', null, '003032006021', null);
INSERT INTO `pa_bmzd` VALUES ('5C8B4E5401B740A7B7A22EDEB068AB72', '2015-05-03 11:15:46', '黑龙江省大兴安岭地区漠河县', '1', '4.2.2.232723', '1', '4', '漠河县', '23', 'MHX', null, '003023027023', null);
INSERT INTO `pa_bmzd` VALUES ('5CA773C80C6547E58079B029B7D88537', '2015-05-03 11:15:46', '云南省昭通市永善县', '1', '4.2.2.530625', '1', '4', '永善县', '25', 'YSX', null, '003053006025', null);
INSERT INTO `pa_bmzd` VALUES ('5CB27EFC39174B5A9CEEAE1210C11439', '2015-05-03 11:15:46', '内蒙古自治区乌兰察布市丰镇市', '1', '4.2.2.150981', '1', '4', '丰镇市', '81', 'FZS', null, '003015009081', null);
INSERT INTO `pa_bmzd` VALUES ('5CBED41F01EA467EA55C13F176831391', '2015-05-03 11:15:46', '河北省沧州市', '1', '4.2.2.130900', '0', '3', '沧州市', '9', 'CZS', null, '003013009', null);
INSERT INTO `pa_bmzd` VALUES ('5CC15E036F574238BF850F1E03001DF7', '2015-05-03 11:15:46', '江西省景德镇市', '1', '4.2.2.360200', '0', '3', '景德镇市', '2', 'JDZS', null, '003036002', null);
INSERT INTO `pa_bmzd` VALUES ('5CC17F430DD743769DC9C8E8744533A1', '2015-05-03 11:15:46', '浙江省宁波市海曙区', '1', '4.2.2.330203', '1', '4', '海曙区', '3', 'HSQ', null, '003033002003', null);
INSERT INTO `pa_bmzd` VALUES ('5CC9833AA4F443C29F0F7E42F7757843', '2015-05-03 11:15:46', '青海省西宁市湟源县', '1', '4.2.2.630123', '1', '4', '湟源县', '23', 'HYX', null, '003063001023', null);
INSERT INTO `pa_bmzd` VALUES ('5CDC7020154D4F269C760699BA7C2C45', '2015-05-03 11:15:46', '河南省漯河市临颍县', '1', '4.2.2.411122', '1', '4', '临颍县', '22', 'LYX', null, '003041011022', null);
INSERT INTO `pa_bmzd` VALUES ('5D062D6318754FA3AB8E1718D6AC6403', '2015-05-03 11:15:46', '江苏省南京市', '1', '4.2.2.320100', '0', '3', '南京市', '1', 'NJS', null, '003032001', null);
INSERT INTO `pa_bmzd` VALUES ('5D095084DE91491BB1DFDBD6C0878BC4', '2015-05-03 11:15:46', '浙江省杭州市上城区', '1', '4.2.2.330102', '1', '4', '上城区', '2', 'SCQ', null, '003033001002', null);
INSERT INTO `pa_bmzd` VALUES ('5D0D8F32C8CA4B18B32465BEF4D1187A', '2015-05-03 11:15:46', '西藏自治区日喀则地区', '1', '4.2.2.542300', '0', '3', '日喀则地区', '23', 'RKZDQ', null, '003054023', null);
INSERT INTO `pa_bmzd` VALUES ('5D1D64FE9AAD4026B33C9691E22E42A5', '2015-05-03 11:15:46', '吉林省松原市乾安县', '1', '4.2.2.220723', '1', '4', '乾安县', '23', 'QAX', null, '003022007023', null);
INSERT INTO `pa_bmzd` VALUES ('5D250EDA280147C4B4F20FE65224B8AA', '2015-05-03 11:15:46', '广东省茂名市电白县', '1', '4.2.2.440923', '1', '4', '电白县', '23', 'DBX', null, '003044009023', null);
INSERT INTO `pa_bmzd` VALUES ('5D63D3C80629470E8499D0A873B98A3F', '2015-05-03 11:15:46', '四川省成都市金堂县', '1', '4.2.2.510121', '1', '4', '金堂县', '21', 'JTX', null, '003051001021', null);
INSERT INTO `pa_bmzd` VALUES ('5D6CAD0217864C3787F2A4140A864D91', '2015-05-03 11:15:46', '福建省三明市大田县', '1', '4.2.2.350425', '1', '4', '大田县', '25', 'DTX', null, '003035004025', null);
INSERT INTO `pa_bmzd` VALUES ('5D8CD5881B2D488C91798287B97B3D3B', '2015-05-03 11:15:46', '广东省肇庆市端州区', '1', '4.2.2.441202', '1', '4', '端州区', '2', 'DZQ', null, '003044012002', null);
INSERT INTO `pa_bmzd` VALUES ('5D9135F9C7994AA091869CB2C6040E21', '2015-05-03 11:15:46', '河北省保定市新市区', '1', '4.2.2.130602', '1', '4', '新市区', '2', 'XSQ', null, '003013006002', null);
INSERT INTO `pa_bmzd` VALUES ('5D974B11FB3A47F2A37F966F15303D28', '2015-05-03 11:15:46', '广东省肇庆市鼎湖区', '1', '4.2.2.441203', '1', '4', '鼎湖区', '3', 'DHQ', null, '003044012003', null);
INSERT INTO `pa_bmzd` VALUES ('5DADEF59289440669495948DB15CA655', '2015-05-03 11:15:46', '陕西省西安市未央区', '1', '4.2.2.610112', '1', '4', '未央区', '12', 'WYQ', null, '003061001012', null);
INSERT INTO `pa_bmzd` VALUES ('5DB63506A43F424C98C7F022E22D0B42', '2015-05-03 11:15:46', '江西省吉安市永新县', '1', '4.2.2.360830', '1', '4', '永新县', '30', 'YXX', null, '003036008030', null);
INSERT INTO `pa_bmzd` VALUES ('5DC52F0786074384AE7C33F83A994602', '2015-05-03 11:15:46', '上海市市辖区金山区', '1', '4.2.2.310116', '1', '4', '金山区', '16', 'JSQ', null, '003031001016', null);
INSERT INTO `pa_bmzd` VALUES ('5DD5A9E18B1C4F89B0C8D1B0830931A8', '2015-05-03 11:15:46', '湖北省宜昌市五峰土家族自治县', '1', '4.2.2.420529', '1', '4', '五峰土家族自治县', '29', 'WFTJZZZX', null, '003042005029', null);
INSERT INTO `pa_bmzd` VALUES ('5DEA85CA78A341689CEA0AE85BD17034', '2015-05-03 11:15:46', '陕西省商洛市商州区', '1', '4.2.2.611002', '1', '4', '商州区', '2', 'SZQ', null, '003061010002', null);
INSERT INTO `pa_bmzd` VALUES ('5E06B039A4044DD18D09C2C9BFCEF842', '2015-05-03 11:15:46', '广西壮族自治区桂林市临桂县', '1', '4.2.2.450322', '1', '4', '临桂县', '22', 'LGX', null, '003045003022', null);
INSERT INTO `pa_bmzd` VALUES ('5E1D4A8305604448942736149001E018', '2015-05-03 11:15:46', '山西省忻州市五台县', '1', '4.2.2.140922', '1', '4', '五台县', '22', 'WTX', null, '003014009022', null);
INSERT INTO `pa_bmzd` VALUES ('5E54E35B5C744DF5A37DC09706F066C7', '2015-05-03 11:15:46', '河南省新乡市新乡县', '1', '4.2.2.410721', '1', '4', '新乡县', '21', 'XXX', null, '003041007021', null);
INSERT INTO `pa_bmzd` VALUES ('5E5C3203681346A8A625BABA67B4960C', '2015-05-03 11:15:46', '云南省玉溪市澄江县', '1', '4.2.2.530422', '1', '4', '澄江县', '22', 'DJX', null, '003053004022', null);
INSERT INTO `pa_bmzd` VALUES ('5E7403195382431AAC4791EE5DA9801B', '2015-05-03 11:15:46', '湖北省襄阳市南漳县', '1', '4.2.2.420624', '1', '4', '南漳县', '24', 'NZX', null, '003042006024', null);
INSERT INTO `pa_bmzd` VALUES ('5E7697FCC836431BACC4B7E4F7E50A4C', '2015-05-03 11:15:46', '内蒙古自治区鄂尔多斯市准格尔旗', '1', '4.2.2.150622', '1', '4', '准格尔旗', '22', 'ZGEQ', null, '003015006022', null);
INSERT INTO `pa_bmzd` VALUES ('5E7FC4FC8C1F41309E0EB84571A04F00', '2015-05-03 11:15:46', '青海省黄南藏族自治州泽库县', '1', '4.2.2.632323', '1', '4', '泽库县', '23', 'ZKX', null, '003063023023', null);
INSERT INTO `pa_bmzd` VALUES ('5EA4780342344E3E97127082D10B91DD', '2015-05-03 11:15:46', '海南省省直辖县级行政区划白沙黎族自治县', '1', '4.2.2.469030', '1', '4', '白沙黎族自治县', '25', 'BSLZZZX', null, '003046090025', null);
INSERT INTO `pa_bmzd` VALUES ('5ED35A6CAD0C41C0A0F9E765F5AE655D', '2015-05-03 11:15:46', '广东省汕头市市辖区', '1', '4.2.2.440501', '1', '4', '市辖区', '1', 'SXQ', null, '003044005001', null);
INSERT INTO `pa_bmzd` VALUES ('5EDA8C8D1BB84428AE7F75B89FC82360', '2015-05-03 11:15:46', '广东省肇庆市封开县', '1', '4.2.2.441225', '1', '4', '封开县', '25', 'FKX', null, '003044012025', null);
INSERT INTO `pa_bmzd` VALUES ('5EDB9406B1CC42CDBD5055EC933BC243', '2015-05-03 11:15:46', '四川省内江市隆昌县', '1', '4.2.2.511028', '1', '4', '隆昌县', '28', 'LCX', null, '003051010028', null);
INSERT INTO `pa_bmzd` VALUES ('5EDCA4AF75BF4FA6BDB1BBBA842D148E', '2015-05-03 11:15:46', '江苏省苏州市相城区', '1', '4.2.2.320507', '1', '4', '相城区', '7', 'XCQ', null, '003032005007', null);
INSERT INTO `pa_bmzd` VALUES ('5EE50BC7E0B547CB89EC72F63C15545D', '2015-05-03 11:15:46', '广西壮族自治区梧州市岑溪市', '1', '4.2.2.450481', '1', '4', '岑溪市', '81', 'CXS', null, '003045004081', null);
INSERT INTO `pa_bmzd` VALUES ('5EF19BF3B16F4F2E8A2B29B847D25C9E', '2015-05-03 11:15:46', '青海省海东地区化隆回族自治县', '1', '4.2.2.632127', '1', '4', '化隆回族自治县', '27', 'HLHZZZX', null, '003063021027', null);
INSERT INTO `pa_bmzd` VALUES ('5EFE6411D24B45B2815EE2CBE73B75CE', '2015-05-03 11:15:46', '安徽省合肥市', '1', '4.2.2.340100', '0', '3', '合肥市', '1', 'HFS', null, '003034001', null);
INSERT INTO `pa_bmzd` VALUES ('5F01866C31E54A00A96EA08A694C9B64', '2015-05-03 11:15:46', '山西省临汾市汾西县', '1', '4.2.2.141034', '1', '4', '汾西县', '34', 'FXX', null, '003014010034', null);
INSERT INTO `pa_bmzd` VALUES ('5F03017D09FF4A68B1AD54F36E1AC9FF', '2015-05-03 11:15:46', '四川省阿坝藏族羌族自治州若尔盖县', '1', '4.2.2.513232', '1', '4', '若尔盖县', '32', 'REGX', null, '003051032032', null);
INSERT INTO `pa_bmzd` VALUES ('5F250B0F8223496494AF40CD0118BB64', '2015-05-03 11:15:46', '山西省吕梁市', '1', '4.2.2.141100', '0', '3', '吕梁市', '11', 'LLS', null, '003014011', null);
INSERT INTO `pa_bmzd` VALUES ('5F30C34006B04744AF8BA3C293727125', '2015-05-03 11:15:46', '山西省朔州市山阴县', '1', '4.2.2.140621', '1', '4', '山阴县', '21', 'SYX', null, '003014006021', null);
INSERT INTO `pa_bmzd` VALUES ('5F383BB01D87457EB77CD04349B6FBE0', '2015-05-03 11:15:46', '湖北省襄阳市', '1', '4.2.2.420600', '0', '3', '襄阳市', '6', 'XYS', null, '003042006', null);
INSERT INTO `pa_bmzd` VALUES ('5F3AD9A2AD1940B5812C9E5BA0ACB378', '2015-05-03 11:15:46', '内蒙古自治区锡林郭勒盟阿巴嘎旗', '1', '4.2.2.152522', '1', '4', '阿巴嘎旗', '22', 'ABGQ', null, '003015025022', null);
INSERT INTO `pa_bmzd` VALUES ('5F3D533D5D2F4018AB2C480B3FD9FF97', '2015-05-03 11:15:46', '江苏省苏州市平江区', '1', '4.2.2.320503', '1', '4', '平江区', '3', 'PJQ', null, '003032005003', null);
INSERT INTO `pa_bmzd` VALUES ('5F3E3E02178F46BE90E7277056E635B1', '2015-05-03 11:15:46', '河北省沧州市肃宁县', '1', '4.2.2.130926', '1', '4', '肃宁县', '26', 'SNX', null, '003013009026', null);
INSERT INTO `pa_bmzd` VALUES ('5F4CA884495B480282F09C51C1FE2143', '2015-05-03 11:15:46', '贵州省遵义市赤水市', '1', '4.2.2.520381', '1', '4', '赤水市', '81', 'CSS', null, '003052003081', null);
INSERT INTO `pa_bmzd` VALUES ('5F6730B21B02480D964C1463ECC73159', '2015-05-03 11:15:46', '山东省烟台市海阳市', '1', '4.2.2.370687', '1', '4', '海阳市', '87', 'HYS', null, '003037006087', null);
INSERT INTO `pa_bmzd` VALUES ('5F73380D3FD54E8CAF2D8BAEA84ED57E', '2015-05-03 11:15:46', '广东省清远市清城区', '1', '4.2.2.441802', '1', '4', '清城区', '2', 'QCQ', null, '003044018002', null);
INSERT INTO `pa_bmzd` VALUES ('5F8C96A0572240238D01EEBFE66F8235', '2015-05-03 11:15:46', '山西省忻州市定襄县', '1', '4.2.2.140921', '1', '4', '定襄县', '21', 'DXX', null, '003014009021', null);
INSERT INTO `pa_bmzd` VALUES ('5F9EFA3B6544479A8683D69EC750974A', '2015-05-03 11:15:46', '云南省红河哈尼族彝族自治州金平苗族瑶族傣族自治县', '1', '4.2.2.532530', '1', '4', '金平苗族瑶族傣族自治县', '30', 'JPMZYZDZZZX', null, '003053025030', null);
INSERT INTO `pa_bmzd` VALUES ('5FA8C5E8A1B64CE1AE8D556B95B90BDF', '2015-05-03 11:15:46', '安徽省芜湖市弋江区', '1', '4.2.2.340203', '1', '4', '弋江区', '3', 'YJQ', null, '003034002003', null);
INSERT INTO `pa_bmzd` VALUES ('5FB49F875EE9406FB1D89A8825A86176', '2015-05-03 11:15:46', '新疆维吾尔自治区昌吉回族自治州木垒哈萨克自治县', '1', '4.2.2.652328', '1', '4', '木垒哈萨克自治县', '28', 'MLHSKZZX', null, '003065023028', null);
INSERT INTO `pa_bmzd` VALUES ('5FBCE4DFA5724FE4A1FF646833DACE4E', '2015-05-03 11:15:46', '河北省衡水市冀州市', '1', '4.2.2.131181', '1', '4', '冀州市', '81', 'JZS', null, '003013011081', null);
INSERT INTO `pa_bmzd` VALUES ('5FC37947FDAA4CE7A3D846B508F1CFC5', '2015-05-03 11:15:46', '河北省邯郸市邯山区', '1', '4.2.2.130402', '1', '4', '邯山区', '2', 'HSQ', null, '003013004002', null);
INSERT INTO `pa_bmzd` VALUES ('5FC3FBA5811940328A47D708D43A4C19', '2015-05-03 11:15:46', '山东省德州市乐陵市', '1', '4.2.2.371481', '1', '4', '乐陵市', '81', 'YLS', null, '003037014081', null);
INSERT INTO `pa_bmzd` VALUES ('5FC6961C6609499882ADB6CDE98380D0', '2015-05-03 11:15:46', '山东省泰安市', '1', '4.2.2.370900', '0', '3', '泰安市', '9', 'TAS', null, '003037009', null);
INSERT INTO `pa_bmzd` VALUES ('5FCB4449A9EC41FD9AFCD6355BC54BFE', '2015-05-03 11:15:46', '广西壮族自治区百色市田林县', '1', '4.2.2.451029', '1', '4', '田林县', '29', 'TLX', null, '003045010029', null);
INSERT INTO `pa_bmzd` VALUES ('5FCEE300B70B439FACE6812640EBF7A2', '2015-05-03 11:15:46', '内蒙古自治区赤峰市松山区', '1', '4.2.2.150404', '1', '4', '松山区', '4', 'SSQ', null, '003015004004', null);
INSERT INTO `pa_bmzd` VALUES ('5FD7A0071B124DF3A7623CBBC4C0DA96', '2015-05-03 11:15:46', '黑龙江省鹤岗市萝北县', '1', '4.2.2.230421', '1', '4', '萝北县', '21', 'LBX', null, '003023004021', null);
INSERT INTO `pa_bmzd` VALUES ('604C071122A443A5B6350C11244BA251', '2015-05-03 11:15:46', '河南省平顶山市汝州市', '1', '4.2.2.410482', '1', '4', '汝州市', '82', 'RZS', null, '003041004082', null);
INSERT INTO `pa_bmzd` VALUES ('6052E8587DE148A6BD8984A7933326E7', '2015-05-03 11:15:46', '河南省南阳市方城县', '1', '4.2.2.411322', '1', '4', '方城县', '22', 'FCX', null, '003041013022', null);
INSERT INTO `pa_bmzd` VALUES ('606966B6D87342C99FAA9F1E3B857784', '2015-05-03 11:15:46', '甘肃省兰州市西固区', '1', '4.2.2.620104', '1', '4', '西固区', '4', 'XGQ', null, '003062001004', null);
INSERT INTO `pa_bmzd` VALUES ('60915822BB294F2B86B4E02FB184B2AF', '2015-05-03 11:15:46', '四川省阿坝藏族羌族自治州黑水县', '1', '4.2.2.513228', '1', '4', '黑水县', '28', 'HSX', null, '003051032028', null);
INSERT INTO `pa_bmzd` VALUES ('6095AFFE775D491EB4D9BE63F216B577', '2015-05-03 11:15:46', '北京市市辖区房山区', '1', '4.2.2.110111', '1', '4', '房山区', '11', 'FSQ', null, '003011001011', null);
INSERT INTO `pa_bmzd` VALUES ('609659207CB748598AFBC5A37B2237EF', '2015-05-03 11:15:46', '西藏自治区那曲地区尼玛县', '1', '4.2.2.542430', '1', '4', '尼玛县', '30', 'NMX', null, '003054024030', null);
INSERT INTO `pa_bmzd` VALUES ('60B33A6C1C934B45BAEFE5F46FA42BDE', '2015-05-03 11:15:46', '黑龙江省伊春市汤旺河区', '1', '4.2.2.230712', '1', '4', '汤旺河区', '12', 'TWHQ', null, '003023007012', null);
INSERT INTO `pa_bmzd` VALUES ('60BB927DBFF34CD0A7BFFCF0795B0DE4', '2015-05-03 11:15:46', '陕西省渭南市大荔县', '1', '4.2.2.610523', '1', '4', '大荔县', '23', 'DLX', null, '003061005023', null);
INSERT INTO `pa_bmzd` VALUES ('60BE75A81FC64E4AB343676474954768', '2015-05-03 11:15:46', '河北省保定市徐水县', '1', '4.2.2.130625', '1', '4', '徐水县', '25', 'XSX', null, '003013006025', null);
INSERT INTO `pa_bmzd` VALUES ('60ECC25C30444BC281FAC2C8BE38FD93', '2015-05-03 11:15:46', '山西省忻州市繁峙县', '1', '4.2.2.140924', '1', '4', '繁峙县', '24', 'PZX', null, '003014009024', null);
INSERT INTO `pa_bmzd` VALUES ('60ED334FEC9840F4A657DA8645D1E20A', '2015-05-03 11:15:46', '广西壮族自治区来宾市市辖区', '1', '4.2.2.451301', '1', '4', '市辖区', '1', 'SXQ', null, '003045013001', null);
INSERT INTO `pa_bmzd` VALUES ('60FE11DDAF8649BBA2E3D4AF7965CFAE', '2015-05-03 11:15:46', '山西省吕梁市兴县', '1', '4.2.2.141123', '1', '4', '兴县', '23', 'XX', null, '003014011023', null);
INSERT INTO `pa_bmzd` VALUES ('610DA84A21D4401C9C7856632449A856', '2015-05-03 11:15:46', '新疆维吾尔自治区巴音郭楞蒙古自治州', '1', '4.2.2.652800', '0', '3', '巴音郭楞蒙古自治州', '28', 'BYGLMGZZZ', null, '003065028', null);
INSERT INTO `pa_bmzd` VALUES ('611C0248C50047A7ADC4046BF10EFDF6', '2015-05-03 11:15:46', '广西壮族自治区玉林市博白县', '1', '4.2.2.450923', '1', '4', '博白县', '23', 'BBX', null, '003045009023', null);
INSERT INTO `pa_bmzd` VALUES ('6128191A00E54D1DB0EEA96CA6E12A15', '2015-05-03 11:15:46', '贵州省毕节市赫章县', '1', '4.2.2.522428', '1', '4', '赫章县', '27', 'HZX', null, '003052005027', null);
INSERT INTO `pa_bmzd` VALUES ('6132125D48F8473DA236B42A8FE8BE9A', '2015-05-03 11:15:46', '重庆市市辖区北碚区', '1', '4.2.2.500109', '1', '4', '北碚区', '9', 'BBQ', null, '003050001009', null);
INSERT INTO `pa_bmzd` VALUES ('61343995D5604AD8B17D34E08F589A9A', '2015-05-03 11:15:46', '湖北省宜昌市市辖区', '1', '4.2.2.420501', '1', '4', '市辖区', '1', 'SXQ', null, '003042005001', null);
INSERT INTO `pa_bmzd` VALUES ('61407B4165C94E6FBEE3E17E4C9753F3', '2015-05-03 11:15:46', '湖北省十堰市丹江口市', '1', '4.2.2.420381', '1', '4', '丹江口市', '81', 'DJKS', null, '003042003081', null);
INSERT INTO `pa_bmzd` VALUES ('615EA4F804E44BB9BCF259D9B9C51D5D', '2015-05-03 11:15:46', '宁夏回族自治区吴忠市红寺堡区', '1', '4.2.2.640303', '1', '4', '红寺堡区', '3', 'HSPQ', null, '003064003003', null);
INSERT INTO `pa_bmzd` VALUES ('617E3FB82E4F480D938B4518D0C76922', '2015-05-03 11:15:46', '云南省保山市施甸县', '1', '4.2.2.530521', '1', '4', '施甸县', '21', 'SDX', null, '003053005021', null);
INSERT INTO `pa_bmzd` VALUES ('6184957D2B3446E6BE0BDDD7876E34D3', '2015-05-03 11:15:46', '江苏省盐城市大丰市', '1', '4.2.2.320982', '1', '4', '大丰市', '82', 'DFS', null, '003032009082', null);
INSERT INTO `pa_bmzd` VALUES ('61852BC8C6004EA4AD0D7A97A61739D0', '2015-05-03 11:15:46', '内蒙古自治区巴彦淖尔市乌拉特前旗', '1', '4.2.2.150823', '1', '4', '乌拉特前旗', '23', 'WLTQQ', null, '003015008023', null);
INSERT INTO `pa_bmzd` VALUES ('6186559FF979430D9DA9CE385602D1D9', '2015-05-03 11:15:46', '西藏自治区阿里地区噶尔县', '1', '4.2.2.542523', '1', '4', '噶尔县', '23', 'GEX', null, '003054025023', null);
INSERT INTO `pa_bmzd` VALUES ('61A35C8E4DBA4C6E9778DE0C4CD38A8F', '2015-05-03 11:15:46', '福建省福州市市辖区', '1', '4.2.2.350101', '1', '4', '市辖区', '1', 'SXQ', null, '003035001001', null);
INSERT INTO `pa_bmzd` VALUES ('61A43F8C4E1F41A8B19F258E6FEA2419', '2015-05-03 11:15:46', '湖北省鄂州市华容区', '1', '4.2.2.420703', '1', '4', '华容区', '3', 'HRQ', null, '003042007003', null);
INSERT INTO `pa_bmzd` VALUES ('61AB41CC965C42F883D3D603C7ED42EC', '2015-05-03 11:15:46', '青海省海东地区民和回族土族自治县', '1', '4.2.2.632122', '1', '4', '民和回族土族自治县', '22', 'MHHZTZZZX', null, '003063021022', null);
INSERT INTO `pa_bmzd` VALUES ('61B37B90DE92454D8A398AE9449AD58C', '2015-05-03 11:15:46', '安徽省黄山市', '1', '4.2.2.341000', '0', '3', '黄山市', '10', 'HSS', null, '003034010', null);
INSERT INTO `pa_bmzd` VALUES ('61D8E1586685492A9DF83A629DE7CF63', '2015-05-03 11:15:46', '广东省潮州市市辖区', '1', '4.2.2.445101', '1', '4', '市辖区', '1', 'SXQ', null, '003044051001', null);
INSERT INTO `pa_bmzd` VALUES ('61DE832D87B5413F8B9D089B431BC2CF', '2015-05-03 11:15:46', '西藏自治区日喀则地区岗巴县', '1', '4.2.2.542338', '1', '4', '岗巴县', '38', 'GBX', null, '003054023038', null);
INSERT INTO `pa_bmzd` VALUES ('61E35A4DF187441885F055BE76A55360', '2015-05-03 11:15:46', '山东省德州市宁津县', '1', '4.2.2.371422', '1', '4', '宁津县', '22', 'NJX', null, '003037014022', null);
INSERT INTO `pa_bmzd` VALUES ('62032D3B25D34E9EA66328A6F587D388', '2015-05-03 11:15:46', '甘肃省武威市天祝藏族自治县', '1', '4.2.2.620623', '1', '4', '天祝藏族自治县', '23', 'TZZZZZX', null, '003062006023', null);
INSERT INTO `pa_bmzd` VALUES ('62059343EE394D56BD514A441F1463D9', '2015-05-03 11:15:46', '广西壮族自治区崇左市大新县', '1', '4.2.2.451424', '1', '4', '大新县', '24', 'DXX', null, '003045014024', null);
INSERT INTO `pa_bmzd` VALUES ('620EEA8A6C8D4BE29C7C3E8D1B9DAEA6', '2015-05-03 11:15:46', '黑龙江省哈尔滨市松北区', '1', '4.2.2.230109', '1', '4', '松北区', '9', 'SBQ', null, '003023001009', null);
INSERT INTO `pa_bmzd` VALUES ('621806C5B0484B18AECEE8D97C12AD35', '2015-05-03 11:15:46', '广东省云浮市市辖区', '1', '4.2.2.445301', '1', '4', '市辖区', '1', 'SXQ', null, '003044053001', null);
INSERT INTO `pa_bmzd` VALUES ('621CBC8E8C8F43528D78B3F186540BC2', '2015-05-03 11:15:46', '江西省上饶市玉山县', '1', '4.2.2.361123', '1', '4', '玉山县', '23', 'YSX', null, '003036011023', null);
INSERT INTO `pa_bmzd` VALUES ('6244ACC679C8420C9194CDA645014382', '2015-05-03 11:15:46', '河北省唐山市唐海县', '1', '4.2.2.130230', '1', '4', '唐海县', '30', 'THX', null, '003013002030', null);
INSERT INTO `pa_bmzd` VALUES ('6261CDFB18E74988AF90355AEB033780', '2015-05-03 11:15:46', '安徽省淮北市杜集区', '1', '4.2.2.340602', '1', '4', '杜集区', '2', 'DJQ', null, '003034006002', null);
INSERT INTO `pa_bmzd` VALUES ('629B99190B9B4EA5BC4CC7BBD7BD9ACD', '2015-05-03 11:15:46', '四川省内江市资中县', '1', '4.2.2.511025', '1', '4', '资中县', '25', 'ZZX', null, '003051010025', null);
INSERT INTO `pa_bmzd` VALUES ('62A6009E8F9C4A1BAFC85A1323946F47', '2015-05-03 11:15:46', '河北省', '1', '4.2.2.130000', '0', '2', '河北省', '13', 'HBS', null, '003013', null);
INSERT INTO `pa_bmzd` VALUES ('62B3111C611C41749C8A005D58A285D8', '2015-05-03 11:15:46', '河南省平顶山市湛河区', '1', '4.2.2.410411', '1', '4', '湛河区', '11', 'ZHQ', null, '003041004011', null);
INSERT INTO `pa_bmzd` VALUES ('62BEA212793F4C7B9912C84E3AF10E69', '2015-05-03 11:15:46', '黑龙江省齐齐哈尔市泰来县', '1', '4.2.2.230224', '1', '4', '泰来县', '24', 'TLX', null, '003023002024', null);
INSERT INTO `pa_bmzd` VALUES ('62E48BF0F3744E5B849F62AF859C10F8', '2015-05-03 11:15:46', '新疆维吾尔自治区塔城地区沙湾县', '1', '4.2.2.654223', '1', '4', '沙湾县', '23', 'SWX', null, '003065042023', null);
INSERT INTO `pa_bmzd` VALUES ('630C631B63C94EC28F64E1FCAB795BD0', '2015-05-03 11:15:46', '黑龙江省绥化市明水县', '1', '4.2.2.231225', '1', '4', '明水县', '25', 'MSX', null, '003023012025', null);
INSERT INTO `pa_bmzd` VALUES ('631FADE46327451EB0EF0951A12D175E', '2015-05-03 11:15:46', '河南省鹤壁市鹤山区', '1', '4.2.2.410602', '1', '4', '鹤山区', '2', 'HSQ', null, '003041006002', null);
INSERT INTO `pa_bmzd` VALUES ('632D4DDA60AF45888BF36CF2E7EF02F1', '2015-05-03 11:15:46', '河南省商丘市梁园区', '1', '4.2.2.411402', '1', '4', '梁园区', '2', 'LYQ', null, '003041014002', null);
INSERT INTO `pa_bmzd` VALUES ('63340D242B82456C8610051B33226BF9', '2015-05-03 11:15:46', '江西省鹰潭市月湖区', '1', '4.2.2.360602', '1', '4', '月湖区', '2', 'YHQ', null, '003036006002', null);
INSERT INTO `pa_bmzd` VALUES ('634788343B9F49679DB1890D2C627E07', '2015-05-03 11:15:46', '云南省昆明市西山区', '1', '4.2.2.530112', '1', '4', '西山区', '12', 'XSQ', null, '003053001012', null);
INSERT INTO `pa_bmzd` VALUES ('634B0D94A5504F41AF1D863362EBABFE', '2015-05-03 11:15:46', '陕西省安康市旬阳县', '1', '4.2.2.610928', '1', '4', '旬阳县', '28', 'XYX', null, '003061009028', null);
INSERT INTO `pa_bmzd` VALUES ('63501B11579C42F7B0B89986C5972A90', '2015-05-03 11:15:46', '江苏省南京市六合区', '1', '4.2.2.320116', '1', '4', '六合区', '16', 'LHQ', null, '003032001016', null);
INSERT INTO `pa_bmzd` VALUES ('6352E5B2EB3C45FD965BA3DE55DC5343', '2015-05-03 11:15:46', '四川省甘孜藏族自治州丹巴县', '1', '4.2.2.513323', '1', '4', '丹巴县', '23', 'DBX', null, '003051033023', null);
INSERT INTO `pa_bmzd` VALUES ('63579869FDF5417B98B5F5FD9261ED64', '2015-05-03 11:15:46', '山东省聊城市冠县', '1', '4.2.2.371525', '1', '4', '冠县', '25', 'GX', null, '003037015025', null);
INSERT INTO `pa_bmzd` VALUES ('635DB419EBDB4B88BBBF32C55293CEAA', '2015-05-03 11:15:46', '黑龙江省伊春市友好区', '1', '4.2.2.230704', '1', '4', '友好区', '4', 'YHQ', null, '003023007004', null);
INSERT INTO `pa_bmzd` VALUES ('6372B8FD69404EFD8DA992EA82E61E50', '2015-05-03 11:15:46', '辽宁省丹东市', '1', '4.2.2.210600', '0', '3', '丹东市', '6', 'DDS', null, '003021006', null);
INSERT INTO `pa_bmzd` VALUES ('63845C0D102A4AD2902C66AE477D02F4', '2015-05-03 11:15:46', '四川省达州市通川区', '1', '4.2.2.511702', '1', '4', '通川区', '2', 'TCQ', null, '003051017002', null);
INSERT INTO `pa_bmzd` VALUES ('6388D625760F459085587592A405A405', '2015-05-03 11:15:46', '浙江省宁波市宁海县', '1', '4.2.2.330226', '1', '4', '宁海县', '26', 'NHX', null, '003033002026', null);
INSERT INTO `pa_bmzd` VALUES ('63A3A5AFF2C94926860426113BE63BBF', '2015-05-03 11:15:46', '江苏省镇江市京口区', '1', '4.2.2.321102', '1', '4', '京口区', '2', 'JKQ', null, '003032011002', null);
INSERT INTO `pa_bmzd` VALUES ('63AC59B39A754B3A82A5F27842B19EDB', '2015-05-03 11:15:46', '吉林省通化市二道江区', '1', '4.2.2.220503', '1', '4', '二道江区', '3', 'EDJQ', null, '003022005003', null);
INSERT INTO `pa_bmzd` VALUES ('63BEC6F73DA64592836E2C28972022DF', '2015-05-03 11:15:46', '云南省迪庆藏族自治州', '1', '4.2.2.533400', '0', '3', '迪庆藏族自治州', '34', 'DQZZZZZ', null, '003053034', null);
INSERT INTO `pa_bmzd` VALUES ('63C2AE54631D4927B52BA52CFC402452', '2015-05-03 11:15:46', '江西省宜春市丰城市', '1', '4.2.2.360981', '1', '4', '丰城市', '81', 'FCS', null, '003036009081', null);
INSERT INTO `pa_bmzd` VALUES ('63D87F03893B4B9DBCE376E39C6BC85C', '2015-05-03 11:15:46', '江苏省盐城市东台市', '1', '4.2.2.320981', '1', '4', '东台市', '81', 'DTS', null, '003032009081', null);
INSERT INTO `pa_bmzd` VALUES ('63E8B9CFBCAC4DC89D87F19740B4DC99', '2015-05-03 11:15:46', '内蒙古自治区呼伦贝尔市鄂伦春自治旗', '1', '4.2.2.150723', '1', '4', '鄂伦春自治旗', '23', 'ELCZZQ', null, '003015007023', null);
INSERT INTO `pa_bmzd` VALUES ('63FDE1C377E848F083818243A4C67443', '2015-05-03 11:15:46', '内蒙古自治区兴安盟科尔沁右翼中旗', '1', '4.2.2.152222', '1', '4', '科尔沁右翼中旗', '22', 'KEQYYZQ', null, '003015022022', null);
INSERT INTO `pa_bmzd` VALUES ('641D7D77950349C3BACCA99429CA7040', '2015-05-03 11:15:46', '黑龙江省鹤岗市兴安区', '1', '4.2.2.230405', '1', '4', '兴安区', '5', 'XAQ', null, '003023004005', null);
INSERT INTO `pa_bmzd` VALUES ('64391C3E59AD4099B5CEF4993A016053', '2015-05-03 11:15:46', '西藏自治区那曲地区巴青县', '1', '4.2.2.542429', '1', '4', '巴青县', '29', 'BQX', null, '003054024029', null);
INSERT INTO `pa_bmzd` VALUES ('64449FD389154E81971C9AB91D16393B', '2015-05-03 11:15:46', '江西省九江市庐山区', '1', '4.2.2.360402', '1', '4', '庐山区', '2', 'LSQ', null, '003036004002', null);
INSERT INTO `pa_bmzd` VALUES ('6445CB390EAA4E43BDDA08FD0B5C3559', '2015-05-03 11:15:46', '河北省石家庄市市辖区', '1', '4.2.2.130101', '1', '4', '市辖区', '1', 'SXQ', null, '003013001001', null);
INSERT INTO `pa_bmzd` VALUES ('646FB615537D4F389DF003059CBCC992', '2015-05-03 11:15:46', '重庆市县奉节县', '1', '4.2.2.500236', '1', '4', '奉节县', '36', 'FJX', null, '003050002036', null);
INSERT INTO `pa_bmzd` VALUES ('647043A918C6484C89589BD8FF4F4FFE', '2015-05-03 11:15:46', '湖北省随州市曾都区', '1', '4.2.2.421302', '1', '4', '曾都区', '3', 'CDQ', null, '003042013003', null);
INSERT INTO `pa_bmzd` VALUES ('6480F56221664D29B36FD11B91D3C607', '2015-05-03 11:15:46', '江苏省盐城市响水县', '1', '4.2.2.320921', '1', '4', '响水县', '21', 'XSX', null, '003032009021', null);
INSERT INTO `pa_bmzd` VALUES ('64821354D82C4B5699C6A41DA9083704', '2015-05-03 11:15:46', '广西壮族自治区桂林市灵川县', '1', '4.2.2.450323', '1', '4', '灵川县', '23', 'LCX', null, '003045003023', null);
INSERT INTO `pa_bmzd` VALUES ('6499ED65FBB645A18041D58C581DF756', '2015-05-03 11:15:46', '安徽省滁州市明光市', '1', '4.2.2.341182', '1', '4', '明光市', '82', 'MGS', null, '003034011082', null);
INSERT INTO `pa_bmzd` VALUES ('64BE82EF208945BAA9F20D297141F9C9', '2015-05-03 11:15:46', '四川省遂宁市蓬溪县', '1', '4.2.2.510921', '1', '4', '蓬溪县', '21', 'PXX', null, '003051009021', null);
INSERT INTO `pa_bmzd` VALUES ('64E981520FD64E9BB69292AFE3F10687', '2015-05-03 11:15:46', '浙江省温州市泰顺县', '1', '4.2.2.330329', '1', '4', '泰顺县', '29', 'TSX', null, '003033003029', null);
INSERT INTO `pa_bmzd` VALUES ('6518444517524B4FAFA556E1D6D2E9CF', '2015-05-03 11:15:46', '河北省石家庄市裕华区', '1', '4.2.2.130108', '1', '4', '裕华区', '8', 'YHQ', null, '003013001008', null);
INSERT INTO `pa_bmzd` VALUES ('651A50126C84447BB5DB7DF9B015C404', '2015-05-03 11:15:46', '西藏自治区阿里地区普兰县', '1', '4.2.2.542521', '1', '4', '普兰县', '21', 'PLX', null, '003054025021', null);
INSERT INTO `pa_bmzd` VALUES ('651DA91724554B1781FBD27C5B9A7C04', '2015-05-03 11:15:46', '山西省朔州市右玉县', '1', '4.2.2.140623', '1', '4', '右玉县', '23', 'YYX', null, '003014006023', null);
INSERT INTO `pa_bmzd` VALUES ('6531DEF6782D46AABD609F0FC61F22F7', '2015-05-03 11:15:46', '湖北省十堰市郧县', '1', '4.2.2.420321', '1', '4', '郧县', '21', 'YX', null, '003042003021', null);
INSERT INTO `pa_bmzd` VALUES ('653D6B6B154E4DFD9AB17467D557C80F', '2015-05-03 11:15:46', '云南省玉溪市易门县', '1', '4.2.2.530425', '1', '4', '易门县', '25', 'YMX', null, '003053004025', null);
INSERT INTO `pa_bmzd` VALUES ('65403C78DF8C4077B09C4BACAFB55784', '2015-05-03 11:15:46', '青海省西宁市湟中县', '1', '4.2.2.630122', '1', '4', '湟中县', '22', 'HZX', null, '003063001022', null);
INSERT INTO `pa_bmzd` VALUES ('65435F7461E5480FB8EB766215508ACA', '2015-05-03 11:15:46', '湖南省株洲市石峰区', '1', '4.2.2.430204', '1', '4', '石峰区', '4', 'SFQ', null, '003043002004', null);
INSERT INTO `pa_bmzd` VALUES ('6552F6A9D086421D88FA8AF8AEADD36D', '2015-05-03 11:15:46', '四川省南充市西充县', '1', '4.2.2.511325', '1', '4', '西充县', '25', 'XCX', null, '003051013025', null);
INSERT INTO `pa_bmzd` VALUES ('656198C927124EB88FAA1100014A866D', '2015-05-03 11:15:46', '山东省济宁市嘉祥县', '1', '4.2.2.370829', '1', '4', '嘉祥县', '29', 'JXX', null, '003037008029', null);
INSERT INTO `pa_bmzd` VALUES ('65709EFD841E4DD2A90EC3AEDC9CB3F0', '2015-05-03 11:15:46', '安徽省安庆市枞阳县', '1', '4.2.2.340823', '1', '4', '枞阳县', '23', 'ZYX', null, '003034008023', null);
INSERT INTO `pa_bmzd` VALUES ('65B9CDF8E872404EAB7C964E07FD39AD', '2015-05-03 11:15:46', '广东省广州市天河区', '1', '4.2.2.440106', '1', '4', '天河区', '6', 'THQ', null, '003044001006', null);
INSERT INTO `pa_bmzd` VALUES ('65BCF391E1F7447FAD146727373C22D1', '2015-05-03 11:15:46', '广东省韶关市武江区', '1', '4.2.2.440203', '1', '4', '武江区', '3', 'WJQ', null, '003044002003', null);
INSERT INTO `pa_bmzd` VALUES ('65C8360B5A884F5DB20F287DC79BD3D7', '2015-05-03 11:15:46', '西藏自治区山南地区扎囊县', '1', '4.2.2.542222', '1', '4', '扎囊县', '22', 'ZNX', null, '003054022022', null);
INSERT INTO `pa_bmzd` VALUES ('65C97786C16D45FCB23B8289B4C69EA7', '2015-05-03 11:15:46', '青海省黄南藏族自治州', '1', '4.2.2.632300', '0', '3', '黄南藏族自治州', '23', 'HNZZZZZ', null, '003063023', null);
INSERT INTO `pa_bmzd` VALUES ('65CDE7E3DC8F41B89C5EC748419BE3D7', '2015-05-03 11:15:46', '四川省内江市市中区', '1', '4.2.2.511002', '1', '4', '市中区', '2', 'SZQ', null, '003051010002', null);
INSERT INTO `pa_bmzd` VALUES ('65EFDA5BAEF34460B6D0F83ADA56B730', '2015-05-03 11:15:46', '陕西省宝鸡市千阳县', '1', '4.2.2.610328', '1', '4', '千阳县', '28', 'QYX', null, '003061003028', null);
INSERT INTO `pa_bmzd` VALUES ('65F089DA77304901B50A32201989AE1F', '2015-05-03 11:15:46', '福建省厦门市思明区', '1', '4.2.2.350203', '1', '4', '思明区', '3', 'SMQ', null, '003035002003', null);
INSERT INTO `pa_bmzd` VALUES ('65F34F7D496D4090AD157C8A4EE1C6FA', '2015-05-03 11:15:46', '新疆维吾尔自治区博尔塔拉蒙古自治州精河县', '1', '4.2.2.652722', '1', '4', '精河县', '22', 'JHX', null, '003065027022', null);
INSERT INTO `pa_bmzd` VALUES ('65F75150F98749199595E07C0DA5F386', '2015-05-03 11:15:46', '云南省楚雄彝族自治州楚雄市', '1', '4.2.2.532301', '1', '4', '楚雄市', '1', 'CXS', null, '003053023001', null);
INSERT INTO `pa_bmzd` VALUES ('65F7B49F62874938940E2C35CD56719C', '2015-05-03 11:15:46', '黑龙江省牡丹江市宁安市', '1', '4.2.2.231084', '1', '4', '宁安市', '84', 'NAS', null, '003023010084', null);
INSERT INTO `pa_bmzd` VALUES ('65FD68E343F445C384B920E704D6CF64', '2015-05-03 11:15:46', '贵州省安顺市关岭布依族苗族自治县', '1', '4.2.2.520424', '1', '4', '关岭布依族苗族自治县', '24', 'GLBYZMZZZX', null, '003052004024', null);
INSERT INTO `pa_bmzd` VALUES ('65FE7BBBE7AA4FE883D0814524A4EEC1', '2015-05-03 11:15:46', '贵州省黔东南苗族侗族自治州岑巩县', '1', '4.2.2.522626', '1', '4', '岑巩县', '26', 'CGX', null, '003052026026', null);
INSERT INTO `pa_bmzd` VALUES ('6608D3D3E26143E0A7138C6F718E4681', '2015-05-03 11:15:46', '四川省阿坝藏族羌族自治州红原县', '1', '4.2.2.513233', '1', '4', '红原县', '33', 'HYX', null, '003051032033', null);
INSERT INTO `pa_bmzd` VALUES ('660DA235FFF5473F9CB70DD417AA3CDF', '2015-05-03 11:15:46', '黑龙江省伊春市金山屯区', '1', '4.2.2.230709', '1', '4', '金山屯区', '9', 'JSZQ', null, '003023007009', null);
INSERT INTO `pa_bmzd` VALUES ('6614D7029C784FA48CD82DBFE455C50C', '2015-05-03 11:15:46', '河北省沧州市青县', '1', '4.2.2.130922', '1', '4', '青县', '22', 'QX', null, '003013009022', null);
INSERT INTO `pa_bmzd` VALUES ('66583F94BEA641DE81FAE4BA59AB0890', '2015-05-03 11:15:46', '陕西省汉中市', '1', '4.2.2.610700', '0', '3', '汉中市', '7', 'HZS', null, '003061007', null);
INSERT INTO `pa_bmzd` VALUES ('668A71294A1B463097685279D01CC2CB', '2015-05-03 11:15:46', '山西省太原市清徐县', '1', '4.2.2.140121', '1', '4', '清徐县', '21', 'QXX', null, '003014001021', null);
INSERT INTO `pa_bmzd` VALUES ('668AD2AF38B64F1B9C734DFCE79CD872', '2015-05-03 11:15:46', '河北省唐山市滦县', '1', '4.2.2.130223', '1', '4', '滦县', '23', 'LX', null, '003013002023', null);
INSERT INTO `pa_bmzd` VALUES ('668DC6AA09CD44B2A01777E3689A7AAF', '2015-05-03 11:15:46', '江西省赣州市兴国县', '1', '4.2.2.360732', '1', '4', '兴国县', '32', 'XGX', null, '003036007032', null);
INSERT INTO `pa_bmzd` VALUES ('669EB098AB754A4FB237A4C0508FD12C', '2015-05-03 11:15:46', '江西省抚州市金溪县', '1', '4.2.2.361027', '1', '4', '金溪县', '27', 'JXX', null, '003036010027', null);
INSERT INTO `pa_bmzd` VALUES ('66C69082E0F84E5D916C0BCF13B74493', '2015-05-03 11:15:46', '黑龙江省伊春市乌伊岭区', '1', '4.2.2.230714', '1', '4', '乌伊岭区', '14', 'WYLQ', null, '003023007014', null);
INSERT INTO `pa_bmzd` VALUES ('66DF8EB71E6B4F0CA92EC72BB8506749', '2015-05-03 11:15:46', '广西壮族自治区贺州市富川瑶族自治县', '1', '4.2.2.451123', '1', '4', '富川瑶族自治县', '23', 'FCYZZZX', null, '003045011023', null);
INSERT INTO `pa_bmzd` VALUES ('66E14E1642934734B470B3DC8AAE5F62', '2015-05-03 11:15:46', '山东省枣庄市', '1', '4.2.2.370400', '0', '3', '枣庄市', '4', 'ZZS', null, '003037004', null);
INSERT INTO `pa_bmzd` VALUES ('66F2242868364903882CF259849B5AE9', '2015-05-03 11:15:46', '湖南省株洲市醴陵市', '1', '4.2.2.430281', '1', '4', '醴陵市', '81', 'LLS', null, '003043002081', null);
INSERT INTO `pa_bmzd` VALUES ('66F6053649114D08B2FF425E94F9199D', '2015-05-03 11:15:46', '四川省内江市东兴区', '1', '4.2.2.511011', '1', '4', '东兴区', '11', 'DXQ', null, '003051010011', null);
INSERT INTO `pa_bmzd` VALUES ('670CA71E0C344A37AE796FBB66CD2108', '2015-05-03 11:15:46', '吉林省长春市二道区', '1', '4.2.2.220105', '1', '4', '二道区', '5', 'EDQ', null, '003022001005', null);
INSERT INTO `pa_bmzd` VALUES ('670D0D043BD7445093632BD9EA051899', '2015-05-03 11:15:46', '湖北省黄冈市浠水县', '1', '4.2.2.421125', '1', '4', '浠水县', '25', 'XSX', null, '003042011025', null);
INSERT INTO `pa_bmzd` VALUES ('6711CE9F668E4236B0EF43C864187811', '2015-05-03 11:15:46', '浙江省舟山市定海区', '1', '4.2.2.330902', '1', '4', '定海区', '2', 'DHQ', null, '003033009002', null);
INSERT INTO `pa_bmzd` VALUES ('672978CE64AA42E784F1317F7074E902', '2015-05-03 11:15:46', '福建省泉州市泉港区', '1', '4.2.2.350505', '1', '4', '泉港区', '5', 'QGQ', null, '003035005005', null);
INSERT INTO `pa_bmzd` VALUES ('6738E194EA7C4143A2F7FABB070C2334', '2015-05-03 11:15:46', '甘肃省白银市市辖区', '1', '4.2.2.620401', '1', '4', '市辖区', '1', 'SXQ', null, '003062004001', null);
INSERT INTO `pa_bmzd` VALUES ('6739C5BB9EB84C3E803F2D848F924200', '2015-05-03 11:15:46', '甘肃省定西市', '1', '4.2.2.621100', '0', '3', '定西市', '11', 'DXS', null, '003062011', null);
INSERT INTO `pa_bmzd` VALUES ('67417F930A5643DAB5A55E1EFEAE0B09', '2015-05-03 11:15:46', '云南省大理白族自治州洱源县', '1', '4.2.2.532930', '1', '4', '洱源县', '30', 'EYX', null, '003053029030', null);
INSERT INTO `pa_bmzd` VALUES ('674592F609224FC38DFC03CBFBE970A5', '2015-05-03 11:15:46', '广西壮族自治区崇左市', '1', '4.2.2.451400', '0', '3', '崇左市', '14', 'CZS', null, '003045014', null);
INSERT INTO `pa_bmzd` VALUES ('6749D56B18BC47A2A2FA4636D06D4C9E', '2015-05-03 11:15:46', '西藏自治区山南地区桑日县', '1', '4.2.2.542224', '1', '4', '桑日县', '24', 'SRX', null, '003054022024', null);
INSERT INTO `pa_bmzd` VALUES ('675327A1846649239E1F8F658C07DB52', '2015-05-03 11:15:46', '四川省甘孜藏族自治州', '1', '4.2.2.513300', '0', '3', '甘孜藏族自治州', '33', 'GZZZZZZ', null, '003051033', null);
INSERT INTO `pa_bmzd` VALUES ('67665A1F33384C4BB727141FCBEB3075', '2015-05-03 11:15:46', '江西省上饶市上饶县', '1', '4.2.2.361121', '1', '4', '上饶县', '21', 'SRX', null, '003036011021', null);
INSERT INTO `pa_bmzd` VALUES ('677881895303404F8F3798C236D9BB96', '2015-05-03 11:15:46', '江西省抚州市宜黄县', '1', '4.2.2.361026', '1', '4', '宜黄县', '26', 'YHX', null, '003036010026', null);
INSERT INTO `pa_bmzd` VALUES ('67869AFB420F4EE294D35D7B3F905DC6', '2015-05-03 11:15:46', '四川省遂宁市船山区', '1', '4.2.2.510903', '1', '4', '船山区', '3', 'CSQ', null, '003051009003', null);
INSERT INTO `pa_bmzd` VALUES ('67C31578628B4CBEBB745AAC3CD1666C', '2015-05-03 11:15:46', '江苏省徐州市贾汪区', '1', '4.2.2.320305', '1', '4', '贾汪区', '5', 'JWQ', null, '003032003005', null);
INSERT INTO `pa_bmzd` VALUES ('67C61AC6A09240A89EFFEB74C2CAF281', '2015-05-03 11:15:46', '江西省萍乡市湘东区', '1', '4.2.2.360313', '1', '4', '湘东区', '13', 'XDQ', null, '003036003013', null);
INSERT INTO `pa_bmzd` VALUES ('67C968F27D0F4BF89D5057A8BD626567', '2015-05-03 11:15:46', '江苏省连云港市赣榆县', '1', '4.2.2.320721', '1', '4', '赣榆县', '21', 'GYX', null, '003032007021', null);
INSERT INTO `pa_bmzd` VALUES ('67C99990AB1D4263899C7455E9673470', '2015-05-03 11:15:46', '新疆维吾尔自治区阿勒泰地区福海县', '1', '4.2.2.654323', '1', '4', '福海县', '23', 'FHX', null, '003065043023', null);
INSERT INTO `pa_bmzd` VALUES ('67D6FEB4034B435286D364B6BF894707', '2015-05-03 11:15:46', '宁夏回族自治区中卫市沙坡头区', '1', '4.2.2.640502', '1', '4', '沙坡头区', '2', 'SPTQ', null, '003064005002', null);
INSERT INTO `pa_bmzd` VALUES ('67EAD87490A6470EA2F8D8477034CE00', '2015-05-03 11:15:46', '宁夏回族自治区石嘴山市', '1', '4.2.2.640200', '0', '3', '石嘴山市', '2', 'SZSS', null, '003064002', null);
INSERT INTO `pa_bmzd` VALUES ('6812B31FB90C412DB112962849CAB818', '2015-05-03 11:15:46', '云南省西双版纳傣族自治州勐海县', '1', '4.2.2.532822', '1', '4', '勐海县', '22', 'MHX', null, '003053028022', null);
INSERT INTO `pa_bmzd` VALUES ('6840FC2C230B453BA1C287BEB73DD921', '2015-05-03 11:15:46', '广西壮族自治区玉林市容县', '1', '4.2.2.450921', '1', '4', '容县', '21', 'RX', null, '003045009021', null);
INSERT INTO `pa_bmzd` VALUES ('6851B086C74D4C2C9FD0660BE07BBE9C', '2015-05-03 11:15:46', '山东省青岛市胶南市', '1', '4.2.2.370284', '1', '4', '胶南市', '84', 'JNS', null, '003037002084', null);
INSERT INTO `pa_bmzd` VALUES ('6855EDCE185543418373F2229FE1E72A', '2015-05-03 11:15:46', '山西省长治市', '1', '4.2.2.140400', '0', '3', '长治市', '4', 'ZZS', null, '003014004', null);
INSERT INTO `pa_bmzd` VALUES ('6862381A207842EAB79EB385E7FFD73C', '2015-05-03 11:15:46', '四川省攀枝花市仁和区', '1', '4.2.2.510411', '1', '4', '仁和区', '11', 'RHQ', null, '003051004011', null);
INSERT INTO `pa_bmzd` VALUES ('68661BD722334DDBBE2DDBFD7A4A9288', '2015-05-03 11:15:46', '四川省达州市', '1', '4.2.2.511700', '0', '3', '达州市', '17', 'DZS', null, '003051017', null);
INSERT INTO `pa_bmzd` VALUES ('68856084FECC481E8567EDE2F8D7FDE5', '2015-05-03 11:15:46', '湖南省衡阳市南岳区', '1', '4.2.2.430412', '1', '4', '南岳区', '12', 'NYQ', null, '003043004012', null);
INSERT INTO `pa_bmzd` VALUES ('68A72A61ED0A434FA3E7ECB042F05164', '2015-05-03 11:15:46', '西藏自治区山南地区错那县', '1', '4.2.2.542232', '1', '4', '错那县', '32', 'CNX', null, '003054022032', null);
INSERT INTO `pa_bmzd` VALUES ('68B1CD3FB7924F12872892CCD50E0D5B', '2015-05-03 11:15:46', '天津市市辖区河北区', '1', '4.2.2.120105', '1', '4', '河北区', '5', 'HBQ', null, '003012001005', null);
INSERT INTO `pa_bmzd` VALUES ('68B373787CD040548F337EED3B52E764', '2015-05-03 11:15:46', '陕西省延安市黄龙县', '1', '4.2.2.610631', '1', '4', '黄龙县', '31', 'HLX', null, '003061006031', null);
INSERT INTO `pa_bmzd` VALUES ('68BF577719C84B0492BFA69E9E5D0B1F', '2015-05-03 11:15:46', '内蒙古自治区乌兰察布市', '1', '4.2.2.150900', '0', '3', '乌兰察布市', '9', 'WLCBS', null, '003015009', null);
INSERT INTO `pa_bmzd` VALUES ('68DA9F60CA1541128F74478E7DE95E5B', '2015-05-03 11:15:46', '福建省漳州市芗城区', '1', '4.2.2.350602', '1', '4', '芗城区', '2', 'XCQ', null, '003035006002', null);
INSERT INTO `pa_bmzd` VALUES ('68DFB0CB659C4DB3A8EC40F758E17A0C', '2015-05-03 11:15:46', '四川省达州市万源市', '1', '4.2.2.511781', '1', '4', '万源市', '81', 'WYS', null, '003051017081', null);
INSERT INTO `pa_bmzd` VALUES ('69059E4C711E4E8B8851045BCAED6F85', '2015-05-03 11:15:46', '贵州省毕节市市辖区', '1', '4.2.2.522401', '1', '4', '市辖区', '1', 'SXQ', null, '003052005001', null);
INSERT INTO `pa_bmzd` VALUES ('6913401EA9C048A7AC8523EE084D320D', '2015-05-03 11:15:46', '黑龙江省绥化市兰西县', '1', '4.2.2.231222', '1', '4', '兰西县', '22', 'LXX', null, '003023012022', null);
INSERT INTO `pa_bmzd` VALUES ('69304AD9E1084228B08D1733DF170395', '2015-05-03 11:15:46', '广西壮族自治区桂林市兴安县', '1', '4.2.2.450325', '1', '4', '兴安县', '25', 'XAX', null, '003045003025', null);
INSERT INTO `pa_bmzd` VALUES ('69436CD64A18470ABF8DB14BD63B6131', '2015-05-03 11:15:46', '贵州省安顺市', '1', '4.2.2.520400', '0', '3', '安顺市', '4', 'ASS', null, '003052004', null);
INSERT INTO `pa_bmzd` VALUES ('694C002ED49144238149BF3FFB393C7E', '2015-05-03 11:15:46', '河南省', '1', '4.2.2.410000', '0', '2', '河南省', '41', 'HNS', null, '003041', null);
INSERT INTO `pa_bmzd` VALUES ('6953EC1C1D70459EBFB0536DC92022DF', '2015-05-03 11:15:46', '宁夏回族自治区银川市西夏区', '1', '4.2.2.640105', '1', '4', '西夏区', '5', 'XXQ', null, '003064001005', null);
INSERT INTO `pa_bmzd` VALUES ('69645160D4C14F9A83747B33EC4B042D', '2015-05-03 11:15:46', '黑龙江省鹤岗市市辖区', '1', '4.2.2.230401', '1', '4', '市辖区', '1', 'SXQ', null, '003023004001', null);
INSERT INTO `pa_bmzd` VALUES ('6985C7D44E954CCBA5B7427D4A7589C2', '2015-05-03 11:15:46', '陕西省咸阳市三原县', '1', '4.2.2.610422', '1', '4', '三原县', '22', 'SYX', null, '003061004022', null);
INSERT INTO `pa_bmzd` VALUES ('69907EE5DE834338AD582D78825E0117', '2015-05-03 11:15:46', '安徽省安庆市怀宁县', '1', '4.2.2.340822', '1', '4', '怀宁县', '22', 'HNX', null, '003034008022', null);
INSERT INTO `pa_bmzd` VALUES ('6992938C323247D580FAEC746EB5176A', '2015-05-03 11:15:46', '内蒙古自治区乌海市', '1', '4.2.2.150300', '0', '3', '乌海市', '3', 'WHS', null, '003015003', null);
INSERT INTO `pa_bmzd` VALUES ('69990A1E3ACA4B5D8A040D1E6A1C8DBC', '2015-05-03 11:15:46', '广东省湛江市雷州市', '1', '4.2.2.440882', '1', '4', '雷州市', '82', 'LZS', null, '003044008082', null);
INSERT INTO `pa_bmzd` VALUES ('69A722AAB0A44399B3D10AF72D9AF01B', '2015-05-03 11:15:46', '山西省吕梁市孝义市', '1', '4.2.2.141181', '1', '4', '孝义市', '81', 'XYS', null, '003014011081', null);
INSERT INTO `pa_bmzd` VALUES ('69A834D7D5A943239EF51343BC784C16', '2015-05-03 11:15:46', '辽宁省辽阳市白塔区', '1', '4.2.2.211002', '1', '4', '白塔区', '2', 'BTQ', null, '003021010002', null);
INSERT INTO `pa_bmzd` VALUES ('69A9F0BAA44B4C67B6A660F1503292C2', '2015-05-03 11:15:46', '新疆维吾尔自治区喀什地区塔什库尔干塔吉克自治县', '1', '4.2.2.653131', '1', '4', '塔什库尔干塔吉克自治县', '31', 'TSKEGTJKZZX', null, '003065031031', null);
INSERT INTO `pa_bmzd` VALUES ('69CC277E4F44462298EA1CF3C9CB3CF6', '2015-05-03 11:15:46', '河南省安阳市', '1', '4.2.2.410500', '0', '3', '安阳市', '5', 'AYS', null, '003041005', null);
INSERT INTO `pa_bmzd` VALUES ('69CE84B55E7543339806A625158BD7B7', '2015-05-03 11:15:46', '江西省上饶市婺源县', '1', '4.2.2.361130', '1', '4', '婺源县', '30', 'WYX', null, '003036011030', null);
INSERT INTO `pa_bmzd` VALUES ('69D44437F8B94791BBBD8FF22FE22A80', '2015-05-03 11:15:46', '青海省海北藏族自治州', '1', '4.2.2.632200', '0', '3', '海北藏族自治州', '22', 'HBZZZZZ', null, '003063022', null);
INSERT INTO `pa_bmzd` VALUES ('69ED81CD159545E28AC396CD1661AD17', '2015-05-03 11:15:46', '江西省九江市共青城市', '1', '4.2.2.360482', '1', '4', '共青城市', '82', 'GQCS', null, '003036004082', null);
INSERT INTO `pa_bmzd` VALUES ('69FBFFE9D63F4399A532635E59120632', '2015-05-03 11:15:46', '江西省南昌市青山湖区', '1', '4.2.2.360111', '1', '4', '青山湖区', '11', 'QSHQ', null, '003036001011', null);
INSERT INTO `pa_bmzd` VALUES ('6A077A4F710F47D3832BC0C43FE90357', '2015-05-03 11:15:46', '广东省清远市', '1', '4.2.2.441800', '0', '3', '清远市', '18', 'QYS', null, '003044018', null);
INSERT INTO `pa_bmzd` VALUES ('6A124A0F587F424BA39D79BB1438F6A5', '2015-05-03 11:15:46', '山东省日照市五莲县', '1', '4.2.2.371121', '1', '4', '五莲县', '21', 'WLX', null, '003037011021', null);
INSERT INTO `pa_bmzd` VALUES ('6A15D8F88344447AA9D29D44518348BF', '2015-05-03 11:15:46', '云南省临沧市临翔区', '1', '4.2.2.530902', '1', '4', '临翔区', '2', 'LXQ', null, '003053009002', null);
INSERT INTO `pa_bmzd` VALUES ('6A3B1623AA1A4DB1854381C9C534E467', '2015-05-03 11:15:46', '山西省长治市长治县', '1', '4.2.2.140421', '1', '4', '长治县', '21', 'ZZX', null, '003014004021', null);
INSERT INTO `pa_bmzd` VALUES ('6A3CF7CD78FD488290238D2DC2924FB9', '2015-05-03 11:15:46', '河南省三门峡市', '1', '4.2.2.411200', '0', '3', '三门峡市', '12', 'SMXS', null, '003041012', null);
INSERT INTO `pa_bmzd` VALUES ('6A519D933D7A441ABB241F79FBBA88A7', '2015-05-03 11:15:46', '广东省汕头市龙湖区', '1', '4.2.2.440507', '1', '4', '龙湖区', '7', 'LHQ', null, '003044005007', null);
INSERT INTO `pa_bmzd` VALUES ('6A61A5C8A38D4DF086DE97CDDE7F4C47', '2015-05-03 11:15:46', '河南省三门峡市陕县', '1', '4.2.2.411222', '1', '4', '陕县', '22', 'SX', null, '003041012022', null);
INSERT INTO `pa_bmzd` VALUES ('6A675425EDFB44AAA1B421A449A1AD0C', '2015-05-03 11:15:46', '广西壮族自治区百色市乐业县', '1', '4.2.2.451028', '1', '4', '乐业县', '28', 'YYX', null, '003045010028', null);
INSERT INTO `pa_bmzd` VALUES ('6A6C917A5B8F448A916B2DD3375DD2EB', '2015-05-03 11:15:46', '海南省省直辖县级行政区划五指山市', '1', '4.2.2.469001', '1', '4', '五指山市', '1', 'WZSS', null, '003046090001', null);
INSERT INTO `pa_bmzd` VALUES ('6A84E77AF95F472DA8E00E7BFC389FE2', '2015-05-03 11:15:46', '河南省周口市西华县', '1', '4.2.2.411622', '1', '4', '西华县', '22', 'XHX', null, '003041016022', null);
INSERT INTO `pa_bmzd` VALUES ('6A8A7A750B274A0DA1A0D0AEA83674A8', '2015-05-03 11:15:46', '河北省邢台市', '1', '4.2.2.130500', '0', '3', '邢台市', '5', 'XTS', null, '003013005', null);
INSERT INTO `pa_bmzd` VALUES ('6A9C92C2826B48BB83374C156109EED4', '2015-05-03 11:15:46', '浙江省嘉兴市市辖区', '1', '4.2.2.330401', '1', '4', '市辖区', '1', 'SXQ', null, '003033004001', null);
INSERT INTO `pa_bmzd` VALUES ('6AB4A569CC4D4A79A8F30F16646631C3', '2015-05-03 11:15:46', '西藏自治区昌都地区八宿县', '1', '4.2.2.542127', '1', '4', '八宿县', '27', 'BSX', null, '003054021027', null);
INSERT INTO `pa_bmzd` VALUES ('6AC397E93A2A43E6A02EE9F002F1DA18', '2015-05-03 11:15:46', '河南省三门峡市卢氏县', '1', '4.2.2.411224', '1', '4', '卢氏县', '24', 'LZX', null, '003041012024', null);
INSERT INTO `pa_bmzd` VALUES ('6AD1B2BF5AB44E699567FC6F0AB61F31', '2015-05-03 11:15:46', '山西省吕梁市交城县', '1', '4.2.2.141122', '1', '4', '交城县', '22', 'JCX', null, '003014011022', null);
INSERT INTO `pa_bmzd` VALUES ('6AF3C1F510D542059D09C25490A8E812', '2015-05-03 11:15:46', '河南省开封市通许县', '1', '4.2.2.410222', '1', '4', '通许县', '22', 'TXX', null, '003041002022', null);
INSERT INTO `pa_bmzd` VALUES ('6AFE8BDBBF1040D29B974457015418CF', '2015-05-03 11:15:46', '河北省石家庄市藁城市', '1', '4.2.2.130182', '1', '4', '藁城市', '82', 'GCS', null, '003013001082', null);
INSERT INTO `pa_bmzd` VALUES ('6B0A9B5021DF4B50BE2F443F67802CDB', '2015-05-03 11:15:46', '广东省惠州市惠城区', '1', '4.2.2.441302', '1', '4', '惠城区', '2', 'HCQ', null, '003044013002', null);
INSERT INTO `pa_bmzd` VALUES ('6B2144CA967841F7ABEB4616479CD68C', '2015-05-03 11:15:46', '云南省迪庆藏族自治州香格里拉县', '1', '4.2.2.533421', '1', '4', '香格里拉县', '21', 'XGLLX', null, '003053034021', null);
INSERT INTO `pa_bmzd` VALUES ('6B35FEEA0F9E40FB88C2EFF69751EEBB', '2015-05-03 11:15:46', '河南省开封市市辖区', '1', '4.2.2.410201', '1', '4', '市辖区', '1', 'SXQ', null, '003041002001', null);
INSERT INTO `pa_bmzd` VALUES ('6B3C8005E78B4215A8F4EB57CD240D93', '2015-05-03 11:15:46', '广东省深圳市市辖区', '1', '4.2.2.440301', '1', '4', '市辖区', '1', 'SXQ', null, '003044003001', null);
INSERT INTO `pa_bmzd` VALUES ('6B490A7ADB6E4A24B609AFD757BA3C97', '2015-05-03 11:15:46', '四川省德阳市中江县', '1', '4.2.2.510623', '1', '4', '中江县', '23', 'ZJX', null, '003051006023', null);
INSERT INTO `pa_bmzd` VALUES ('6B628AB73F8A4A94BD19C5138460A1D2', '2015-05-03 11:15:46', '云南省普洱市镇沅彝族哈尼族拉祜族自治县', '1', '4.2.2.530825', '1', '4', '镇沅彝族哈尼族拉祜族自治县', '25', 'ZYYZHNZLHZZZX', null, '003053008025', null);
INSERT INTO `pa_bmzd` VALUES ('6B73EB1890884B778B06BC0FE1739731', '2015-05-03 11:15:46', '河北省邯郸市磁县', '1', '4.2.2.130427', '1', '4', '磁县', '27', 'CX', null, '003013004027', null);
INSERT INTO `pa_bmzd` VALUES ('6B819039ED3948FC9516D6489C7BA9FE', '2015-05-03 11:15:46', '河北省衡水市枣强县', '1', '4.2.2.131121', '1', '4', '枣强县', '21', 'ZQX', null, '003013011021', null);
INSERT INTO `pa_bmzd` VALUES ('6B8B6DEBC3D84D519E5BA43A121709EB', '2015-05-03 11:15:46', '河北省石家庄市鹿泉市', '1', '4.2.2.130185', '1', '4', '鹿泉市', '85', 'LQS', null, '003013001085', null);
INSERT INTO `pa_bmzd` VALUES ('6B9B2C57090D4AAF9B3F050FBDB07F38', '2015-05-03 11:15:46', '广东省韶关市翁源县', '1', '4.2.2.440229', '1', '4', '翁源县', '29', 'WYX', null, '003044002029', null);
INSERT INTO `pa_bmzd` VALUES ('6BA33BB8A72A4051A2CE32CC136ECEFF', '2015-05-03 11:15:46', '黑龙江省黑河市孙吴县', '1', '4.2.2.231124', '1', '4', '孙吴县', '24', 'SWX', null, '003023011024', null);
INSERT INTO `pa_bmzd` VALUES ('6BADD60BD793427581CF1E0BBC3AB087', '2015-05-03 11:15:46', '重庆市县石柱土家族自治县', '1', '4.2.2.500240', '1', '4', '石柱土家族自治县', '40', 'SZTJZZZX', null, '003050002040', null);
INSERT INTO `pa_bmzd` VALUES ('6BCEBF3ABBB04E33A7BC468B42B8B0C3', '2015-05-03 11:15:46', '云南省玉溪市峨山彝族自治县', '1', '4.2.2.530426', '1', '4', '峨山彝族自治县', '26', 'ESYZZZX', null, '003053004026', null);
INSERT INTO `pa_bmzd` VALUES ('6BD9DE10DE644D70A991DEB1D2BB8D81', '2015-05-03 11:15:46', '广西壮族自治区贵港市市辖区', '1', '4.2.2.450801', '1', '4', '市辖区', '1', 'SXQ', null, '003045008001', null);
INSERT INTO `pa_bmzd` VALUES ('6BF7103ADE6942F09FC4446C4C807466', '2015-05-03 11:15:46', '河南省商丘市宁陵县', '1', '4.2.2.411423', '1', '4', '宁陵县', '23', 'NLX', null, '003041014023', null);
INSERT INTO `pa_bmzd` VALUES ('6BF86E08CB1D4A78AB0C371CF64382FB', '2015-05-03 11:15:46', '四川省乐山市峨边彝族自治县', '1', '4.2.2.511132', '1', '4', '峨边彝族自治县', '32', 'EBYZZZX', null, '003051011032', null);
INSERT INTO `pa_bmzd` VALUES ('6BFA7A43AE6048B49940295B1F99F255', '2015-05-03 11:15:46', '贵州省铜仁市万山区', '1', '4.2.2.522230', '1', '4', '万山区', '3', 'WSQ', null, '003052006003', null);
INSERT INTO `pa_bmzd` VALUES ('6C1585DE7B9D4D4C8E6BB18823DB05C4', '2015-05-03 11:15:46', '湖北省咸宁市咸安区', '1', '4.2.2.421202', '1', '4', '咸安区', '2', 'XAQ', null, '003042012002', null);
INSERT INTO `pa_bmzd` VALUES ('6C1676DBB0744221A96F002807A5E993', '2015-05-03 11:15:46', '河南省平顶山市郏县', '1', '4.2.2.410425', '1', '4', '郏县', '25', 'JX', null, '003041004025', null);
INSERT INTO `pa_bmzd` VALUES ('6C2D4765417A4D67BF4E06D17CD531CE', '2015-05-03 11:15:46', '贵州省六盘水市水城县', '1', '4.2.2.520221', '1', '4', '水城县', '21', 'SCX', null, '003052002021', null);
INSERT INTO `pa_bmzd` VALUES ('6C56496423DE44AAA6DD206B3C0A2032', '2015-05-03 11:15:46', '湖北省黄冈市红安县', '1', '4.2.2.421122', '1', '4', '红安县', '22', 'HAX', null, '003042011022', null);
INSERT INTO `pa_bmzd` VALUES ('6C6445DFA8A0421098755E43D983C6B9', '2015-05-03 11:15:46', '湖北省荆门市', '1', '4.2.2.420800', '0', '3', '荆门市', '8', 'JMS', null, '003042008', null);
INSERT INTO `pa_bmzd` VALUES ('6C96223825EE42D18EA67E9CFB68F913', '2015-05-03 11:15:46', '江西省萍乡市上栗县', '1', '4.2.2.360322', '1', '4', '上栗县', '22', 'SLX', null, '003036003022', null);
INSERT INTO `pa_bmzd` VALUES ('6CC531504A5942A7AC82C60134EF7886', '2015-05-03 11:15:46', '广东省阳江市阳春市', '1', '4.2.2.441781', '1', '4', '阳春市', '81', 'YCS', null, '003044017081', null);
INSERT INTO `pa_bmzd` VALUES ('6CCE408200974938ADB7CDC7A3B3DCCA', '2015-05-03 11:15:46', '甘肃省酒泉市肃州区', '1', '4.2.2.620902', '1', '4', '肃州区', '2', 'SZQ', null, '003062009002', null);
INSERT INTO `pa_bmzd` VALUES ('6CF02357B7874A2E99B303FFE49F3BAA', '2015-05-03 11:15:46', '贵州省遵义市', '1', '4.2.2.520300', '0', '3', '遵义市', '3', 'ZYS', null, '003052003', null);
INSERT INTO `pa_bmzd` VALUES ('6D1B88193D7443E88BDBA383CA9E733C', '2015-05-03 11:15:46', '四川省宜宾市江安县', '1', '4.2.2.511523', '1', '4', '江安县', '23', 'JAX', null, '003051015023', null);
INSERT INTO `pa_bmzd` VALUES ('6D3E372F64234302B3D4056CECE45876', '2015-05-03 11:15:46', '四川省甘孜藏族自治州甘孜县', '1', '4.2.2.513328', '1', '4', '甘孜县', '28', 'GZX', null, '003051033028', null);
INSERT INTO `pa_bmzd` VALUES ('6D7F85A446F64BE78743F4E0B206E681', '2015-05-03 11:15:46', '云南省楚雄彝族自治州永仁县', '1', '4.2.2.532327', '1', '4', '永仁县', '27', 'YRX', null, '003053023027', null);
INSERT INTO `pa_bmzd` VALUES ('6DA39542745F4743A324369F87E8844B', '2015-05-03 11:15:46', '安徽省淮南市市辖区', '1', '4.2.2.340401', '1', '4', '市辖区', '1', 'SXQ', null, '003034004001', null);
INSERT INTO `pa_bmzd` VALUES ('6DBB22C322C94F138284D96703FA15BE', '2015-05-03 11:15:46', '浙江省嘉兴市海宁市', '1', '4.2.2.330481', '1', '4', '海宁市', '81', 'HNS', null, '003033004081', null);
INSERT INTO `pa_bmzd` VALUES ('6E09C1FB9E474F338566915E009988C5', '2015-05-03 11:15:46', '北京市县', '1', '4.2.2.110200', '0', '3', '县', '2', 'X', null, '003011002', null);
INSERT INTO `pa_bmzd` VALUES ('6E13F13E1ABD4DE5A98AC752ECBC9C70', '2015-05-03 11:15:46', '福建省漳州市龙海市', '1', '4.2.2.350681', '1', '4', '龙海市', '81', 'LHS', null, '003035006081', null);
INSERT INTO `pa_bmzd` VALUES ('6E1885CD511F483EA021C0749E75DD94', '2015-05-03 11:15:46', '湖北省咸宁市', '1', '4.2.2.421200', '0', '3', '咸宁市', '12', 'XNS', null, '003042012', null);
INSERT INTO `pa_bmzd` VALUES ('6E31D9E31A454C41812BEB882B50C4FD', '2015-05-03 11:15:46', '河北省承德市鹰手营子矿区', '1', '4.2.2.130804', '1', '4', '鹰手营子矿区', '4', 'YSYZKQ', null, '003013008004', null);
INSERT INTO `pa_bmzd` VALUES ('6E450649B6C64DAE87D13B5BC5ED9B8A', '2015-05-03 11:15:46', '湖北省襄阳市保康县', '1', '4.2.2.420626', '1', '4', '保康县', '26', 'BKX', null, '003042006026', null);
INSERT INTO `pa_bmzd` VALUES ('6E80A5D24DF843FBAC6DECA50C87FFD5', '2015-05-03 11:15:46', '广东省茂名市', '1', '4.2.2.440900', '0', '3', '茂名市', '9', 'MMS', null, '003044009', null);
INSERT INTO `pa_bmzd` VALUES ('6ECCD9CEAEF942EF8742FAE9FC0D9F1F', '2015-05-03 11:15:46', '陕西省渭南市韩城市', '1', '4.2.2.610581', '1', '4', '韩城市', '81', 'HCS', null, '003061005081', null);
INSERT INTO `pa_bmzd` VALUES ('6ED5756BA1D440319D11B42765A2A82C', '2015-05-03 11:15:46', '甘肃省定西市通渭县', '1', '4.2.2.621121', '1', '4', '通渭县', '21', 'TWX', null, '003062011021', null);
INSERT INTO `pa_bmzd` VALUES ('6EEC4638E3934C8F9F07B3F9D9EB2C36', '2015-05-03 11:15:46', '重庆市', '1', '4.2.2.500000', '0', '2', '重庆市', '0', 'CQS', null, '003050', null);
INSERT INTO `pa_bmzd` VALUES ('6EFD1A84CF30452BB8EDC3683FD9BB24', '2015-05-03 11:15:46', '河北省衡水市武强县', '1', '4.2.2.131123', '1', '4', '武强县', '23', 'WQX', null, '003013011023', null);
INSERT INTO `pa_bmzd` VALUES ('6F05B15118E846039AB7E0DB4DAB8A92', '2015-05-03 11:15:46', '四川省凉山彝族自治州越西县', '1', '4.2.2.513434', '1', '4', '越西县', '34', 'YXX', null, '003051034034', null);
INSERT INTO `pa_bmzd` VALUES ('6F1F935363D54FCCAB82368B5057B449', '2015-05-03 11:15:46', '广西壮族自治区百色市市辖区', '1', '4.2.2.451001', '1', '4', '市辖区', '1', 'SXQ', null, '003045010001', null);
INSERT INTO `pa_bmzd` VALUES ('6F227E78DFAE4E0F8199F7B9344E6BE2', '2015-05-03 11:15:46', '贵州省', '1', '4.2.2.520000', '0', '2', '贵州省', '52', 'GZS', null, '003052', null);
INSERT INTO `pa_bmzd` VALUES ('6F84D9F28A674C3D9B7CDBC5A4F175B5', '2015-05-03 11:15:46', '内蒙古自治区呼伦贝尔市新巴尔虎左旗', '1', '4.2.2.150726', '1', '4', '新巴尔虎左旗', '26', 'XBEHZQ', null, '003015007026', null);
INSERT INTO `pa_bmzd` VALUES ('6F8C7668CFD44950BC244AB2B7D21DBF', '2015-05-03 11:15:46', '黑龙江省佳木斯市向阳区', '1', '4.2.2.230803', '1', '4', '向阳区', '3', 'XYQ', null, '003023008003', null);
INSERT INTO `pa_bmzd` VALUES ('6F8DF3BDB2904877AB641CB12F48F4B2', '2015-05-03 11:15:46', '黑龙江省牡丹江市阳明区', '1', '4.2.2.231003', '1', '4', '阳明区', '3', 'YMQ', null, '003023010003', null);
INSERT INTO `pa_bmzd` VALUES ('6F90A68B70E149EAAF9BD27E47039D54', '2015-05-03 11:15:46', '甘肃省', '1', '4.2.2.620000', '0', '2', '甘肃省', '62', 'GSS', null, '003062', null);
INSERT INTO `pa_bmzd` VALUES ('6F9B69A232E24196B1ADAD5CC649D8B5', '2015-05-03 11:15:46', '黑龙江省大庆市大同区', '1', '4.2.2.230606', '1', '4', '大同区', '6', 'DTQ', null, '003023006006', null);
INSERT INTO `pa_bmzd` VALUES ('6FB4B16EFFED4BBD9DE3C72E23346449', '2015-05-03 11:15:46', '黑龙江省', '1', '4.2.2.230000', '0', '2', '黑龙江省', '23', 'HLJS', null, '003023', null);
INSERT INTO `pa_bmzd` VALUES ('6FB6315663064CAB8051B4B95B960EE7', '2015-05-03 11:15:46', '江西省南昌市东湖区', '1', '4.2.2.360102', '1', '4', '东湖区', '2', 'DHQ', null, '003036001002', null);
INSERT INTO `pa_bmzd` VALUES ('6FEDD25E17C44813A4D1E70A5B0B5BFA', '2015-05-03 11:15:46', '四川省雅安市石棉县', '1', '4.2.2.511824', '1', '4', '石棉县', '24', 'SMX', null, '003051018024', null);
INSERT INTO `pa_bmzd` VALUES ('700D95EC3E1546FA8383199EBEB8EA43', '2015-05-03 11:15:46', '江苏省苏州市金阊区', '1', '4.2.2.320504', '1', '4', '金阊区', '4', 'JCQ', null, '003032005004', null);
INSERT INTO `pa_bmzd` VALUES ('702A91BE295C4720931E781A71B843EF', '2015-05-03 11:15:46', '河南省开封市顺河回族区', '1', '4.2.2.410203', '1', '4', '顺河回族区', '3', 'SHHZQ', null, '003041002003', null);
INSERT INTO `pa_bmzd` VALUES ('7035474619334B7AB8E8D9D2A5FB7072', '2015-05-03 11:15:46', '贵州省贵阳市乌当区', '1', '4.2.2.520112', '1', '4', '乌当区', '12', 'WDQ', null, '003052001012', null);
INSERT INTO `pa_bmzd` VALUES ('703B336C9B4844C9B0AE9C9FE75FEF94', '2015-05-03 11:15:46', '吉林省辽源市东辽县', '1', '4.2.2.220422', '1', '4', '东辽县', '22', 'DLX', null, '003022004022', null);
INSERT INTO `pa_bmzd` VALUES ('703C9ED40DDB42E89CA0B9ACBC5EB39C', '2015-05-03 11:15:46', '西藏自治区那曲地区', '1', '4.2.2.542400', '0', '3', '那曲地区', '24', 'NQDQ', null, '003054024', null);
INSERT INTO `pa_bmzd` VALUES ('703DC3E02E394AEE83C378897AFD45CD', '2015-05-03 11:15:46', '江苏省宿迁市沭阳县', '1', '4.2.2.321322', '1', '4', '沭阳县', '22', 'SYX', null, '003032013022', null);
INSERT INTO `pa_bmzd` VALUES ('703EAFDAAFFE4451B4823790B9975AF8', '2015-05-03 11:15:46', '宁夏回族自治区石嘴山市平罗县', '1', '4.2.2.640221', '1', '4', '平罗县', '21', 'PLX', null, '003064002021', null);
INSERT INTO `pa_bmzd` VALUES ('70408041B412452C97443CEBD620C026', '2015-05-03 11:15:46', '甘肃省张掖市甘州区', '1', '4.2.2.620702', '1', '4', '甘州区', '2', 'GZQ', null, '003062007002', null);
INSERT INTO `pa_bmzd` VALUES ('704142917C6A437C90E3AA70A0AA6F6B', '2015-05-03 11:15:46', '云南省红河哈尼族彝族自治州红河县', '1', '4.2.2.532529', '1', '4', '红河县', '29', 'HHX', null, '003053025029', null);
INSERT INTO `pa_bmzd` VALUES ('706F44F1C5544258A3F5BCF1C8B4D3B6', '2015-05-03 11:15:46', '河北省秦皇岛市昌黎县', '1', '4.2.2.130322', '1', '4', '昌黎县', '22', 'CLX', null, '003013003022', null);
INSERT INTO `pa_bmzd` VALUES ('707573898C394D05803F445770A3F134', '2015-05-03 11:15:46', '黑龙江省七台河市新兴区', '1', '4.2.2.230902', '1', '4', '新兴区', '2', 'XXQ', null, '003023009002', null);
INSERT INTO `pa_bmzd` VALUES ('708EAB23AB6143EDA05DFBFAD039095E', '2015-05-03 11:15:46', '贵州省安顺市西秀区', '1', '4.2.2.520402', '1', '4', '西秀区', '2', 'XXQ', null, '003052004002', null);
INSERT INTO `pa_bmzd` VALUES ('70909FC499BF4E9B9A825A2A47D5FBF5', '2015-05-03 11:15:46', '黑龙江省黑河市爱辉区', '1', '4.2.2.231102', '1', '4', '爱辉区', '2', 'AHQ', null, '003023011002', null);
INSERT INTO `pa_bmzd` VALUES ('70926F1FBD7A4041A182F62CE0D3570E', '2015-05-03 11:15:46', '黑龙江省齐齐哈尔市市辖区', '1', '4.2.2.230201', '1', '4', '市辖区', '1', 'SXQ', null, '003023002001', null);
INSERT INTO `pa_bmzd` VALUES ('7094A6179B6A4D61831ECD885C0AAE98', '2015-05-03 11:15:46', '内蒙古自治区乌海市海南区', '1', '4.2.2.150303', '1', '4', '海南区', '3', 'HNQ', null, '003015003003', null);
INSERT INTO `pa_bmzd` VALUES ('70B360787D684EFB980D800C244628DF', '2015-05-03 11:15:46', '青海省海北藏族自治州海晏县', '1', '4.2.2.632223', '1', '4', '海晏县', '23', 'HYX', null, '003063022023', null);
INSERT INTO `pa_bmzd` VALUES ('70F3E13998594022809F8D8BBDE9AB19', '2015-05-03 11:15:46', '江西省上饶市信州区', '1', '4.2.2.361102', '1', '4', '信州区', '2', 'XZQ', null, '003036011002', null);
INSERT INTO `pa_bmzd` VALUES ('7103FA52859147138BD1391977629C25', '2015-05-03 11:15:46', '河南省平顶山市石龙区', '1', '4.2.2.410404', '1', '4', '石龙区', '4', 'SLQ', null, '003041004004', null);
INSERT INTO `pa_bmzd` VALUES ('712DE83BAA41465EACAC78A45C72E0DC', '2015-05-03 11:15:46', '山东省潍坊市安丘市', '1', '4.2.2.370784', '1', '4', '安丘市', '84', 'AQS', null, '003037007084', null);
INSERT INTO `pa_bmzd` VALUES ('71624DACB35E41AEAAA071A3812E1A45', '2015-05-03 11:15:46', '浙江省杭州市临安市', '1', '4.2.2.330185', '1', '4', '临安市', '85', 'LAS', null, '003033001085', null);
INSERT INTO `pa_bmzd` VALUES ('717ECB59EDCA463BBFFDB4CD2693EA4B', '2015-05-03 11:15:46', '山东省滨州市沾化县', '1', '4.2.2.371624', '1', '4', '沾化县', '24', 'ZHX', null, '003037016024', null);
INSERT INTO `pa_bmzd` VALUES ('7185B613B5CE4FABB5C712E26446883A', '2015-05-03 11:15:46', '广西壮族自治区桂林市阳朔县', '1', '4.2.2.450321', '1', '4', '阳朔县', '21', 'YSX', null, '003045003021', null);
INSERT INTO `pa_bmzd` VALUES ('71AA1B150AA24AA6AE5CF577B75E49A1', '2015-05-03 11:15:46', '安徽省铜陵市铜陵县', '1', '4.2.2.340721', '1', '4', '铜陵县', '21', 'TLX', null, '003034007021', null);
INSERT INTO `pa_bmzd` VALUES ('71B548B91E24423FA11E3CA167641894', '2015-05-03 11:15:46', '河北省邢台市广宗县', '1', '4.2.2.130531', '1', '4', '广宗县', '31', 'GZX', null, '003013005031', null);
INSERT INTO `pa_bmzd` VALUES ('71E52D614D75472C87B4B3E7C49E78EB', '2015-05-03 11:15:46', '江西省赣州市全南县', '1', '4.2.2.360729', '1', '4', '全南县', '29', 'QNX', null, '003036007029', null);
INSERT INTO `pa_bmzd` VALUES ('71FC5E52CD68423AB557F61059301D1E', '2015-05-03 11:15:46', '辽宁省阜新市', '1', '4.2.2.210900', '0', '3', '阜新市', '9', 'FXS', null, '003021009', null);
INSERT INTO `pa_bmzd` VALUES ('72059F4A44344E63A1A5761F67C9E416', '2015-05-03 11:15:46', '陕西省汉中市留坝县', '1', '4.2.2.610729', '1', '4', '留坝县', '29', 'LBX', null, '003061007029', null);
INSERT INTO `pa_bmzd` VALUES ('721A93029F5F4664910278CF92A193EC', '2015-05-03 11:15:46', '甘肃省庆阳市西峰区', '1', '4.2.2.621002', '1', '4', '西峰区', '2', 'XFQ', null, '003062010002', null);
INSERT INTO `pa_bmzd` VALUES ('721FD17EC10B4685890284B4653DA0EF', '2015-05-03 11:15:46', '河北省邢台市桥西区', '1', '4.2.2.130503', '1', '4', '桥西区', '3', 'QXQ', null, '003013005003', null);
INSERT INTO `pa_bmzd` VALUES ('724816E74A2D494E855C0D7039F61330', '2015-05-03 11:15:46', '云南省大理白族自治州鹤庆县', '1', '4.2.2.532932', '1', '4', '鹤庆县', '32', 'HQX', null, '003053029032', null);
INSERT INTO `pa_bmzd` VALUES ('72754E55E4CB4A56BA10681C1964393B', '2015-05-03 11:15:46', '广东省', '1', '4.2.2.440000', '0', '2', '广东省', '44', 'GDS', null, '003044', null);
INSERT INTO `pa_bmzd` VALUES ('728CBB55D3954318801C0528CA2566D5', '2015-05-03 11:15:46', '湖南省怀化市溆浦县', '1', '4.2.2.431224', '1', '4', '溆浦县', '24', 'XPX', null, '003043012024', null);
INSERT INTO `pa_bmzd` VALUES ('729649B0FF524A5B9F0A1544A5FB230A', '2015-05-03 11:15:46', '江苏省南京市鼓楼区', '1', '4.2.2.320106', '1', '4', '鼓楼区', '6', 'GLQ', null, '003032001006', null);
INSERT INTO `pa_bmzd` VALUES ('72AE74C030774349B14D6413EE6CE839', '2015-05-03 11:15:46', '江苏省无锡市锡山区', '1', '4.2.2.320205', '1', '4', '锡山区', '5', 'XSQ', null, '003032002005', null);
INSERT INTO `pa_bmzd` VALUES ('72B3341231C246AE921B9BC76858F8A8', '2015-05-03 11:15:46', '福建省泉州市安溪县', '1', '4.2.2.350524', '1', '4', '安溪县', '24', 'AXX', null, '003035005024', null);
INSERT INTO `pa_bmzd` VALUES ('72C5BB80FC194FB3B31D395F034D9E77', '2015-05-03 11:15:46', '山东省德州市齐河县', '1', '4.2.2.371425', '1', '4', '齐河县', '25', 'QHX', null, '003037014025', null);
INSERT INTO `pa_bmzd` VALUES ('72C8C3004C1F424FBBA60BE7F58B45B4', '2015-05-03 11:15:46', '云南省昆明市五华区', '1', '4.2.2.530102', '1', '4', '五华区', '2', 'WHQ', null, '003053001002', null);
INSERT INTO `pa_bmzd` VALUES ('72D81DCEA83140B4973EEF43CF0B1409', '2015-05-03 11:15:46', '山西省运城市夏县', '1', '4.2.2.140828', '1', '4', '夏县', '28', 'XX', null, '003014008028', null);
INSERT INTO `pa_bmzd` VALUES ('72F481F4601B4009B285C461D963CF5C', '2015-05-03 11:15:46', '山东省临沂市市辖区', '1', '4.2.2.371301', '1', '4', '市辖区', '1', 'SXQ', null, '003037013001', null);
INSERT INTO `pa_bmzd` VALUES ('72FA71843C4447F4B1CF26773A60A401', '2015-05-03 11:15:46', '广东省肇庆市', '1', '4.2.2.441200', '0', '3', '肇庆市', '12', 'ZQS', null, '003044012', null);
INSERT INTO `pa_bmzd` VALUES ('730D526FBBF9429184C4A514FF67B2DD', '2015-05-03 11:15:46', '四川省泸州市泸县', '1', '4.2.2.510521', '1', '4', '泸县', '21', 'LX', null, '003051005021', null);
INSERT INTO `pa_bmzd` VALUES ('73105E93569F495F86F7F9CF4E9F6B60', '2015-05-03 11:15:46', '辽宁省抚顺市东洲区', '1', '4.2.2.210403', '1', '4', '东洲区', '3', 'DZQ', null, '003021004003', null);
INSERT INTO `pa_bmzd` VALUES ('7315767D6FB043BAADD33829F2B9A850', '2015-05-03 11:15:46', '四川省达州市宣汉县', '1', '4.2.2.511722', '1', '4', '宣汉县', '22', 'XHX', null, '003051017022', null);
INSERT INTO `pa_bmzd` VALUES ('731B7375263D428789420A11AA9385C3', '2015-05-03 11:15:46', '甘肃省庆阳市宁县', '1', '4.2.2.621026', '1', '4', '宁县', '26', 'NX', null, '003062010026', null);
INSERT INTO `pa_bmzd` VALUES ('731DF53B66D64BF79053463BF80ECC01', '2015-05-03 11:15:46', '云南省大理白族自治州剑川县', '1', '4.2.2.532931', '1', '4', '剑川县', '31', 'JCX', null, '003053029031', null);
INSERT INTO `pa_bmzd` VALUES ('73283F365D084041B1FD215B3922CB18', '2015-05-03 11:15:46', '广西壮族自治区河池市宜州市', '1', '4.2.2.451281', '1', '4', '宜州市', '81', 'YZS', null, '003045012081', null);
INSERT INTO `pa_bmzd` VALUES ('7335CB3552A14AABBD416209BDD56A7C', '2015-05-03 11:15:46', '安徽省淮南市谢家集区', '1', '4.2.2.340404', '1', '4', '谢家集区', '4', 'XJJQ', null, '003034004004', null);
INSERT INTO `pa_bmzd` VALUES ('733A433017D44B778D547B16C31DC80F', '2015-05-03 11:15:46', '辽宁省鞍山市岫岩满族自治县', '1', '4.2.2.210323', '1', '4', '岫岩满族自治县', '23', 'XYMZZZX', null, '003021003023', null);
INSERT INTO `pa_bmzd` VALUES ('734405F38841439EAE33CFD7D5FFB8D5', '2015-05-03 11:15:46', '山东省烟台市莱山区', '1', '4.2.2.370613', '1', '4', '莱山区', '13', 'LSQ', null, '003037006013', null);
INSERT INTO `pa_bmzd` VALUES ('7359D378FC3443678602D046DAE48909', '2015-05-03 11:15:46', '广东省惠州市', '1', '4.2.2.441300', '0', '3', '惠州市', '13', 'HZS', null, '003044013', null);
INSERT INTO `pa_bmzd` VALUES ('7368363646B84A90A5950C079315621C', '2015-05-03 11:15:46', '浙江省温州市乐清市', '1', '4.2.2.330382', '1', '4', '乐清市', '82', 'YQS', null, '003033003082', null);
INSERT INTO `pa_bmzd` VALUES ('737E07A78F264F8894A2D03E94E0AC77', '2015-05-03 11:15:46', '河北省石家庄市元氏县', '1', '4.2.2.130132', '1', '4', '元氏县', '32', 'YZX', null, '003013001032', null);
INSERT INTO `pa_bmzd` VALUES ('73B5B523B60C44A29F6B029D85C0ADF3', '2015-05-03 11:15:46', '福建省莆田市市辖区', '1', '4.2.2.350301', '1', '4', '市辖区', '1', 'SXQ', null, '003035003001', null);
INSERT INTO `pa_bmzd` VALUES ('73BA59C5D6E648FFABBCCA7F980B976A', '2015-05-03 11:15:46', '吉林省长春市榆树市', '1', '4.2.2.220182', '1', '4', '榆树市', '82', 'YSS', null, '003022001082', null);
INSERT INTO `pa_bmzd` VALUES ('73ED106442AA412ABD82A453B8ECE2CE', '2015-05-03 11:15:46', '山西省晋中市榆次区', '1', '4.2.2.140702', '1', '4', '榆次区', '2', 'YCQ', null, '003014007002', null);
INSERT INTO `pa_bmzd` VALUES ('73EE166FA157461583702EBEBD61EAB2', '2015-05-03 11:15:46', '福建省三明市三元区', '1', '4.2.2.350403', '1', '4', '三元区', '3', 'SYQ', null, '003035004003', null);
INSERT INTO `pa_bmzd` VALUES ('73F4A3F38DC24CA0B9A43DF16D7FDB8C', '2015-05-03 11:15:46', '云南省普洱市市辖区', '1', '4.2.2.530801', '1', '4', '市辖区', '1', 'SXQ', null, '003053008001', null);
INSERT INTO `pa_bmzd` VALUES ('747068475A16462EA25E7B9CE9154CC8', '2015-05-03 11:15:46', '西藏自治区那曲地区嘉黎县', '1', '4.2.2.542422', '1', '4', '嘉黎县', '22', 'JLX', null, '003054024022', null);
INSERT INTO `pa_bmzd` VALUES ('7493861FA60A4C4E86746F1EFEB373F8', '2015-05-03 11:15:46', '北京市市辖区丰台区', '1', '4.2.2.110106', '1', '4', '丰台区', '6', 'FTQ', null, '003011001006', null);
INSERT INTO `pa_bmzd` VALUES ('749702F5310545FF8C1894A458E049CD', '2015-05-03 11:15:46', '甘肃省陇南市徽县', '1', '4.2.2.621227', '1', '4', '徽县', '27', 'HX', null, '003062012027', null);
INSERT INTO `pa_bmzd` VALUES ('74B05E14042F4BCE9C462DB7F54F1307', '2015-05-03 11:15:46', '江苏省镇江市丹徒区', '1', '4.2.2.321112', '1', '4', '丹徒区', '12', 'DTQ', null, '003032011012', null);
INSERT INTO `pa_bmzd` VALUES ('74D9A8A23C97477A8CE731E46ECDC193', '2015-05-03 11:15:46', '青海省海北藏族自治州门源回族自治县', '1', '4.2.2.632221', '1', '4', '门源回族自治县', '21', 'MYHZZZX', null, '003063022021', null);
INSERT INTO `pa_bmzd` VALUES ('74FE1B04257648C69C7FF6F1BD22C271', '2015-05-03 11:15:46', '湖北省荆州市洪湖市', '1', '4.2.2.421083', '1', '4', '洪湖市', '83', 'HHS', null, '003042010083', null);
INSERT INTO `pa_bmzd` VALUES ('7506D0F5E2CC4B198183D4E3D0C46628', '2015-05-03 11:15:46', '重庆市县璧山县', '1', '4.2.2.500227', '1', '4', '璧山县', '27', 'BSX', null, '003050002027', null);
INSERT INTO `pa_bmzd` VALUES ('751951476CCC4C918AC328059E5052C8', '2015-05-03 11:15:46', '辽宁省铁岭市昌图县', '1', '4.2.2.211224', '1', '4', '昌图县', '24', 'CTX', null, '003021012024', null);
INSERT INTO `pa_bmzd` VALUES ('751F84E079844ACEBFB08FCE710C828E', '2015-05-03 11:15:46', '河南省洛阳市新安县', '1', '4.2.2.410323', '1', '4', '新安县', '23', 'XAX', null, '003041003023', null);
INSERT INTO `pa_bmzd` VALUES ('7529C1B8C1F4411F81C433B6EFA2BB52', '2015-05-03 11:15:46', '山西省运城市河津市', '1', '4.2.2.140882', '1', '4', '河津市', '82', 'HJS', null, '003014008082', null);
INSERT INTO `pa_bmzd` VALUES ('7535D6E6500A40E5970C1DEE73DF79AA', '2015-05-03 11:15:46', '四川省阿坝藏族羌族自治州汶川县', '1', '4.2.2.513221', '1', '4', '汶川县', '21', 'WCX', null, '003051032021', null);
INSERT INTO `pa_bmzd` VALUES ('753CA18C15A84455A0736A1878435EF1', '2015-05-03 11:15:46', '山东省淄博市沂源县', '1', '4.2.2.370323', '1', '4', '沂源县', '23', 'YYX', null, '003037003023', null);
INSERT INTO `pa_bmzd` VALUES ('7558702419984549B79DACE66457DFA0', '2015-05-03 11:15:46', '河南省漯河市市辖区', '1', '4.2.2.411101', '1', '4', '市辖区', '1', 'SXQ', null, '003041011001', null);
INSERT INTO `pa_bmzd` VALUES ('757469E7C3124D1EB9D4308A4418D14A', '2015-05-03 11:15:46', '贵州省遵义市道真仡佬族苗族自治县', '1', '4.2.2.520325', '1', '4', '道真仡佬族苗族自治县', '25', 'DZYLZMZZZX', null, '003052003025', null);
INSERT INTO `pa_bmzd` VALUES ('75834F85634E44FF9518B2115C8BAC8A', '2015-05-03 11:15:46', '湖北省武汉市蔡甸区', '1', '4.2.2.420114', '1', '4', '蔡甸区', '14', 'CDQ', null, '003042001014', null);
INSERT INTO `pa_bmzd` VALUES ('75862DF3BFC34A09B23E048784701CB1', '2015-05-03 11:15:46', '山东省烟台市福山区', '1', '4.2.2.370611', '1', '4', '福山区', '11', 'FSQ', null, '003037006011', null);
INSERT INTO `pa_bmzd` VALUES ('758F275202FC4F3AA0567B00F5852EBA', '2015-05-03 11:15:46', '河南省许昌市襄城县', '1', '4.2.2.411025', '1', '4', '襄城县', '25', 'XCX', null, '003041010025', null);
INSERT INTO `pa_bmzd` VALUES ('75984E46E03E40D7887E7AA015C9FAD0', '2015-05-03 11:15:46', '山东省潍坊市寿光市', '1', '4.2.2.370783', '1', '4', '寿光市', '83', 'SGS', null, '003037007083', null);
INSERT INTO `pa_bmzd` VALUES ('75A8C01D893C432CB4A4FEC8D131B6A3', '2015-05-03 11:15:46', '湖北省武汉市江岸区', '1', '4.2.2.420102', '1', '4', '江岸区', '2', 'JAQ', null, '003042001002', null);
INSERT INTO `pa_bmzd` VALUES ('75B7CE70819D498C9647AC0530D81DA0', '2015-05-03 11:15:46', '贵州省遵义市汇川区', '1', '4.2.2.520303', '1', '4', '汇川区', '3', 'HCQ', null, '003052003003', null);
INSERT INTO `pa_bmzd` VALUES ('75BD3B51EED844B999416F6AF474FC6B', '2015-05-03 11:15:46', '广东省汕尾市市辖区', '1', '4.2.2.441501', '1', '4', '市辖区', '1', 'SXQ', null, '003044015001', null);
INSERT INTO `pa_bmzd` VALUES ('75BE597A26304F8DA057E25FE5B05A71', '2015-05-03 11:15:46', '江苏省南通市通州区', '1', '4.2.2.320612', '1', '4', '通州区', '12', 'TZQ', null, '003032006012', null);
INSERT INTO `pa_bmzd` VALUES ('75C043D003814A119A614C64FFFD7BC9', '2015-05-03 11:15:46', '江西省上饶市弋阳县', '1', '4.2.2.361126', '1', '4', '弋阳县', '26', 'YYX', null, '003036011026', null);
INSERT INTO `pa_bmzd` VALUES ('75D3A36889A641659DD40F5B451750D5', '2015-05-03 11:15:46', '内蒙古自治区乌兰察布市察哈尔右翼中旗', '1', '4.2.2.150927', '1', '4', '察哈尔右翼中旗', '27', 'CHEYYZQ', null, '003015009027', null);
INSERT INTO `pa_bmzd` VALUES ('75D4E12948D04A6EA3F781FE62B1F754', '2015-05-03 11:15:46', '山西省朔州市平鲁区', '1', '4.2.2.140603', '1', '4', '平鲁区', '3', 'PLQ', null, '003014006003', null);
INSERT INTO `pa_bmzd` VALUES ('75D79D5F8F7D4FFB8CD0B587855D5B33', '2015-05-03 11:15:46', '广东省韶关市乳源瑶族自治县', '1', '4.2.2.440232', '1', '4', '乳源瑶族自治县', '32', 'RYYZZZX', null, '003044002032', null);
INSERT INTO `pa_bmzd` VALUES ('7602A944864F47E08F408F7A7686F7E8', '2015-05-03 11:15:46', '山东省济宁市市辖区', '1', '4.2.2.370801', '1', '4', '市辖区', '1', 'SXQ', null, '003037008001', null);
INSERT INTO `pa_bmzd` VALUES ('7607CCF981304B9BA273E3692EEFFBA7', '2015-05-03 11:15:46', '河北省张家口市张北县', '1', '4.2.2.130722', '1', '4', '张北县', '22', 'ZBX', null, '003013007022', null);
INSERT INTO `pa_bmzd` VALUES ('761E13046BA045D186D729E2BFF65DA3', '2015-05-03 11:15:46', '河北省秦皇岛市卢龙县', '1', '4.2.2.130324', '1', '4', '卢龙县', '24', 'LLX', null, '003013003024', null);
INSERT INTO `pa_bmzd` VALUES ('762F76A61D1B4E88BEAEFAAC5A49DE09', '2015-05-03 11:15:46', '浙江省舟山市嵊泗县', '1', '4.2.2.330922', '1', '4', '嵊泗县', '22', 'SSX', null, '003033009022', null);
INSERT INTO `pa_bmzd` VALUES ('763335BA25E04190965AF47AAEAFF38D', '2015-05-03 11:15:46', '内蒙古自治区赤峰市翁牛特旗', '1', '4.2.2.150426', '1', '4', '翁牛特旗', '26', 'WNTQ', null, '003015004026', null);
INSERT INTO `pa_bmzd` VALUES ('7637AB50D02E40BBBA0BA1A4D1AE526D', '2015-05-03 11:15:46', '四川省眉山市', '1', '4.2.2.511400', '0', '3', '眉山市', '14', 'MSS', null, '003051014', null);
INSERT INTO `pa_bmzd` VALUES ('7645D299BF1E4E4FB3BEEC5A8F8B62FD', '2015-05-03 11:15:46', '云南省昆明市呈贡区', '1', '4.2.2.530121', '1', '4', '呈贡区', '14', 'CGQ', null, '003053001014', null);
INSERT INTO `pa_bmzd` VALUES ('76570F7E78C54CBA9AB28123CC31FC3A', '2015-05-03 11:15:46', '浙江省丽水市市辖区', '1', '4.2.2.331101', '1', '4', '市辖区', '1', 'SXQ', null, '003033011001', null);
INSERT INTO `pa_bmzd` VALUES ('76693C75856943509C46513F8E4075C3', '2015-05-03 11:15:46', '广西壮族自治区百色市田东县', '1', '4.2.2.451022', '1', '4', '田东县', '22', 'TDX', null, '003045010022', null);
INSERT INTO `pa_bmzd` VALUES ('7679920FBF60490CB0D06883FEA52C9A', '2015-05-03 11:15:46', '福建省', '1', '4.2.2.350000', '0', '2', '福建省', '35', 'FJS', null, '003035', null);
INSERT INTO `pa_bmzd` VALUES ('76838882B90543038F52221B614F140B', '2015-05-03 11:15:46', '安徽省淮北市市辖区', '1', '4.2.2.340601', '1', '4', '市辖区', '1', 'SXQ', null, '003034006001', null);
INSERT INTO `pa_bmzd` VALUES ('7688D407DAB1493CA1471B7A383DDEDC', '2015-05-03 11:15:46', '山东省菏泽市郓城县', '1', '4.2.2.371725', '1', '4', '郓城县', '25', 'YCX', null, '003037017025', null);
INSERT INTO `pa_bmzd` VALUES ('7688EE7C375145DA9B99497A9E78BFFF', '2015-05-03 11:15:46', '河南省漯河市郾城区', '1', '4.2.2.411103', '1', '4', '郾城区', '3', 'YCQ', null, '003041011003', null);
INSERT INTO `pa_bmzd` VALUES ('768CC5DF68B14AD582B824B57CACD4C6', '2015-05-03 11:15:46', '广东省梅州市梅江区', '1', '4.2.2.441402', '1', '4', '梅江区', '2', 'MJQ', null, '003044014002', null);
INSERT INTO `pa_bmzd` VALUES ('76B20F334B07488397F29E03052600B7', '2015-05-03 11:15:46', '辽宁省锦州市义县', '1', '4.2.2.210727', '1', '4', '义县', '27', 'YX', null, '003021007027', null);
INSERT INTO `pa_bmzd` VALUES ('76C48B393F094D408DF949ABD177A697', '2015-05-03 11:15:46', '广西壮族自治区桂林市', '1', '4.2.2.450300', '0', '3', '桂林市', '3', 'GLS', null, '003045003', null);
INSERT INTO `pa_bmzd` VALUES ('76C67F1CCF3048969E4A18D1C161239F', '2015-05-03 11:15:46', '辽宁省营口市市辖区', '1', '4.2.2.210801', '1', '4', '市辖区', '1', 'SXQ', null, '003021008001', null);
INSERT INTO `pa_bmzd` VALUES ('76E480D7AD874CB1BD171FDA6CFD953E', '2015-05-03 11:15:46', '贵州省六盘水市六枝特区', '1', '4.2.2.520203', '1', '4', '六枝特区', '3', 'LZTQ', null, '003052002003', null);
INSERT INTO `pa_bmzd` VALUES ('76E51F45077142F399E4194E5DAFC63A', '2015-05-03 11:15:46', '陕西省榆林市', '1', '4.2.2.610800', '0', '3', '榆林市', '8', 'YLS', null, '003061008', null);
INSERT INTO `pa_bmzd` VALUES ('76E6B022C3504BA38DF8F11B7FE5C655', '2015-05-03 11:15:46', '四川省雅安市', '1', '4.2.2.511800', '0', '3', '雅安市', '18', 'YAS', null, '003051018', null);
INSERT INTO `pa_bmzd` VALUES ('76F32BF25B0B429BBDB2D4F805C1B046', '2015-05-03 11:15:46', '河北省廊坊市大城县', '1', '4.2.2.131025', '1', '4', '大城县', '25', 'DCX', null, '003013010025', null);
INSERT INTO `pa_bmzd` VALUES ('76F9D84EA538421CAF743F2597C1EC55', '2015-05-03 11:15:46', '山东省泰安市泰山区', '1', '4.2.2.370902', '1', '4', '泰山区', '2', 'TSQ', null, '003037009002', null);
INSERT INTO `pa_bmzd` VALUES ('7701CE94870F4F8D9BB63842824D4ED2', '2015-05-03 11:15:46', '江西省九江市市辖区', '1', '4.2.2.360401', '1', '4', '市辖区', '1', 'SXQ', null, '003036004001', null);
INSERT INTO `pa_bmzd` VALUES ('770F4C61D2C2453FB3F5F2E431038682', '2015-05-03 11:15:46', '河北省秦皇岛市抚宁县', '1', '4.2.2.130323', '1', '4', '抚宁县', '23', 'FNX', null, '003013003023', null);
INSERT INTO `pa_bmzd` VALUES ('771A94825EB048A1866EF8D1777D5A94', '2015-05-03 11:15:46', '山东省临沂市郯城县', '1', '4.2.2.371322', '1', '4', '郯城县', '22', 'TCX', null, '003037013022', null);
INSERT INTO `pa_bmzd` VALUES ('7720326761ED462889F1365DFADD5287', '2015-05-03 11:15:46', '江苏省宿迁市泗洪县', '1', '4.2.2.321324', '1', '4', '泗洪县', '24', 'SHX', null, '003032013024', null);
INSERT INTO `pa_bmzd` VALUES ('7720D615FEB04C9F9E573FCBBDD1AD82', '2015-05-03 11:15:46', '云南省文山壮族苗族自治州文山市', '1', '4.2.2.532621', '1', '4', '文山市', '1', 'WSS', null, '003053026001', null);
INSERT INTO `pa_bmzd` VALUES ('772C7C1BC08044DAAE6349F0C899F10D', '2015-05-03 11:15:46', '广东省茂名市茂南区', '1', '4.2.2.440902', '1', '4', '茂南区', '2', 'MNQ', null, '003044009002', null);
INSERT INTO `pa_bmzd` VALUES ('7735D8D5C6124474BD6159091A3A68FB', '2015-05-03 11:15:46', '福建省漳州市云霄县', '1', '4.2.2.350622', '1', '4', '云霄县', '22', 'YXX', null, '003035006022', null);
INSERT INTO `pa_bmzd` VALUES ('773B550379E8413BB0E5A4BCC5C3EACB', '2015-05-03 11:15:46', '广东省河源市市辖区', '1', '4.2.2.441601', '1', '4', '市辖区', '1', 'SXQ', null, '003044016001', null);
INSERT INTO `pa_bmzd` VALUES ('7747A7AEF3D04DA5906C7B0563C6E97B', '2015-05-03 11:15:46', '福建省三明市建宁县', '1', '4.2.2.350430', '1', '4', '建宁县', '30', 'JNX', null, '003035004030', null);
INSERT INTO `pa_bmzd` VALUES ('7749FDF59112430695FAECC6D84C8005', '2015-05-03 11:15:46', '广东省湛江市徐闻县', '1', '4.2.2.440825', '1', '4', '徐闻县', '25', 'XWX', null, '003044008025', null);
INSERT INTO `pa_bmzd` VALUES ('774A5825495F47B28D04AA30228A9D67', '2015-05-03 11:15:46', '河北省唐山市丰南区', '1', '4.2.2.130207', '1', '4', '丰南区', '7', 'FNQ', null, '003013002007', null);
INSERT INTO `pa_bmzd` VALUES ('77560D1DC69B45A88A3815EFC217285B', '2015-05-03 11:15:46', '山东省东营市市辖区', '1', '4.2.2.370501', '1', '4', '市辖区', '1', 'SXQ', null, '003037005001', null);
INSERT INTO `pa_bmzd` VALUES ('7770307292A9488E8219C5E59BE9CE2A', '2015-05-03 11:15:46', '甘肃省陇南市宕昌县', '1', '4.2.2.621223', '1', '4', '宕昌县', '23', 'DCX', null, '003062012023', null);
INSERT INTO `pa_bmzd` VALUES ('77714413F73A4907B9216423FFD1BA03', '2015-05-03 11:15:46', '江西省吉安市', '1', '4.2.2.360800', '0', '3', '吉安市', '8', 'JAS', null, '003036008', null);
INSERT INTO `pa_bmzd` VALUES ('778F738067F94482A2BD6BAA0A14CC7A', '2015-05-03 11:15:46', '山西省晋城市高平市', '1', '4.2.2.140581', '1', '4', '高平市', '81', 'GPS', null, '003014005081', null);
INSERT INTO `pa_bmzd` VALUES ('779B9C66BD7146CAAAA4647F42A7B1E0', '2015-05-03 11:15:46', '河南省洛阳市瀍河回族区', '1', '4.2.2.410304', '1', '4', '瀍河回族区', '4', 'CHHZQ', null, '003041003004', null);
INSERT INTO `pa_bmzd` VALUES ('77A2D3FDBBD844F3912A5E43F3CFD88A', '2015-05-03 11:15:46', '广西壮族自治区南宁市西乡塘区', '1', '4.2.2.450107', '1', '4', '西乡塘区', '7', 'XXTQ', null, '003045001007', null);
INSERT INTO `pa_bmzd` VALUES ('77E14931AF8B472CAB19718633D7976A', '2015-05-03 11:15:46', '山东省东营市', '1', '4.2.2.370500', '0', '3', '东营市', '5', 'DYS', null, '003037005', null);
INSERT INTO `pa_bmzd` VALUES ('77E29F88EE174A56B51DC80F61228345', '2015-05-03 11:15:46', '四川省资阳市乐至县', '1', '4.2.2.512022', '1', '4', '乐至县', '22', 'YZX', null, '003051020022', null);
INSERT INTO `pa_bmzd` VALUES ('77F7B17B12D148BB888292435FDE72E8', '2015-05-03 11:15:46', '甘肃省平凉市', '1', '4.2.2.620800', '0', '3', '平凉市', '8', 'PLS', null, '003062008', null);
INSERT INTO `pa_bmzd` VALUES ('78241A617D0F415D860689736DC97991', '2015-05-03 11:15:46', '黑龙江省大庆市红岗区', '1', '4.2.2.230605', '1', '4', '红岗区', '5', 'HGQ', null, '003023006005', null);
INSERT INTO `pa_bmzd` VALUES ('78906D8A932D4B57B8EA03634BC02FD6', '2015-05-03 11:15:46', '陕西省渭南市富平县', '1', '4.2.2.610528', '1', '4', '富平县', '28', 'FPX', null, '003061005028', null);
INSERT INTO `pa_bmzd` VALUES ('789482E402F64295B277D8A283765859', '2015-05-03 11:15:46', '广西壮族自治区玉林市陆川县', '1', '4.2.2.450922', '1', '4', '陆川县', '22', 'LCX', null, '003045009022', null);
INSERT INTO `pa_bmzd` VALUES ('789F971E3BBE4C57B04B68BD6DBD5670', '2015-05-03 11:15:46', '辽宁省营口市大石桥市', '1', '4.2.2.210882', '1', '4', '大石桥市', '82', 'DSQS', null, '003021008082', null);
INSERT INTO `pa_bmzd` VALUES ('78AB331770C1452895AF555B85A71361', '2015-05-03 11:15:46', '福建省龙岩市漳平市', '1', '4.2.2.350881', '1', '4', '漳平市', '81', 'ZPS', null, '003035008081', null);
INSERT INTO `pa_bmzd` VALUES ('78BB63CC6C7A419C807163CFD79F57EE', '2015-05-03 11:15:46', '福建省南平市浦城县', '1', '4.2.2.350722', '1', '4', '浦城县', '22', 'PCX', null, '003035007022', null);
INSERT INTO `pa_bmzd` VALUES ('78BF36096E2A48D785CEABF521C43A35', '2015-05-03 11:15:46', '辽宁省阜新市细河区', '1', '4.2.2.210911', '1', '4', '细河区', '11', 'XHQ', null, '003021009011', null);
INSERT INTO `pa_bmzd` VALUES ('78FB294883164620BC2E159E6E2E942B', '2015-05-03 11:15:46', '四川省巴中市平昌县', '1', '4.2.2.511923', '1', '4', '平昌县', '23', 'PCX', null, '003051019023', null);
INSERT INTO `pa_bmzd` VALUES ('7908BF70523E4418B39C6A64EBFC49E3', '2015-05-03 11:15:46', '内蒙古自治区呼伦贝尔市新巴尔虎右旗', '1', '4.2.2.150727', '1', '4', '新巴尔虎右旗', '27', 'XBEHYQ', null, '003015007027', null);
INSERT INTO `pa_bmzd` VALUES ('790F8B79E1974866B7730DD7C8584544', '2015-05-03 11:15:46', '甘肃省白银市白银区', '1', '4.2.2.620402', '1', '4', '白银区', '2', 'BYQ', null, '003062004002', null);
INSERT INTO `pa_bmzd` VALUES ('793C75948FDC400DA061C388BA6FBC18', '2015-05-03 11:15:46', '陕西省咸阳市永寿县', '1', '4.2.2.610426', '1', '4', '永寿县', '26', 'YSX', null, '003061004026', null);
INSERT INTO `pa_bmzd` VALUES ('79515846C8FE4523AD879963D790E7AD', '2015-05-03 11:15:46', '福建省南平市建瓯市', '1', '4.2.2.350783', '1', '4', '建瓯市', '83', 'JOS', null, '003035007083', null);
INSERT INTO `pa_bmzd` VALUES ('795BB9D8B9B841ECB5D3261AEFF022E2', '2015-05-03 11:15:46', '河南省濮阳市范县', '1', '4.2.2.410926', '1', '4', '范县', '26', 'FX', null, '003041009026', null);
INSERT INTO `pa_bmzd` VALUES ('7968AA4A30704710A89543F9037E0D84', '2015-05-03 11:15:46', '山东省烟台市牟平区', '1', '4.2.2.370612', '1', '4', '牟平区', '12', 'MPQ', null, '003037006012', null);
INSERT INTO `pa_bmzd` VALUES ('797021B37EC143FBA09F603BA512CB2C', '2015-05-03 11:15:46', '四川省攀枝花市西区', '1', '4.2.2.510403', '1', '4', '西区', '3', 'XQ', null, '003051004003', null);
INSERT INTO `pa_bmzd` VALUES ('7972CA45B21948909D50C91370ADF769', '2015-05-03 11:15:46', '河南省洛阳市栾川县', '1', '4.2.2.410324', '1', '4', '栾川县', '24', 'LCX', null, '003041003024', null);
INSERT INTO `pa_bmzd` VALUES ('797EB6BD92B74964AA5C887727079B16', '2015-05-03 11:15:46', '广东省汕头市潮南区', '1', '4.2.2.440514', '1', '4', '潮南区', '14', 'CNQ', null, '003044005014', null);
INSERT INTO `pa_bmzd` VALUES ('79A455FFAA224DE7BCCD2E6CFC3526E6', '2015-05-03 11:15:46', '河南省省直辖县级行政区划', '1', '4.2.2.419000', '0', '3', '省直辖县级行政区划', '90', 'SZXXJXZQH', null, '003041090', null);
INSERT INTO `pa_bmzd` VALUES ('79A7BB0F72C245F4B00981062D6A3435', '2015-05-03 11:15:46', '西藏自治区拉萨市墨竹工卡县', '1', '4.2.2.540127', '1', '4', '墨竹工卡县', '27', 'MZGQX', null, '003054001027', null);
INSERT INTO `pa_bmzd` VALUES ('79D547D8889946D68B63492FF05BD36A', '2015-05-03 11:15:46', '重庆市县', '1', '4.2.2.500200', '0', '3', '县', '2', 'X', null, '003050002', null);
INSERT INTO `pa_bmzd` VALUES ('79F4D35E53E34F9B9CB3E1A4CE83E429', '2015-05-03 11:15:46', '辽宁省大连市沙河口区', '1', '4.2.2.210204', '1', '4', '沙河口区', '4', 'SHKQ', null, '003021002004', null);
INSERT INTO `pa_bmzd` VALUES ('79F766B176994434B0C175077A8CCDFF', '2015-05-03 11:15:46', '河北省保定市市辖区', '1', '4.2.2.130601', '1', '4', '市辖区', '1', 'SXQ', null, '003013006001', null);
INSERT INTO `pa_bmzd` VALUES ('7A0AA8808DE6447FB603A20CA3FABE53', '2015-05-03 11:15:46', '黑龙江省伊春市美溪区', '1', '4.2.2.230708', '1', '4', '美溪区', '8', 'MXQ', null, '003023007008', null);
INSERT INTO `pa_bmzd` VALUES ('7A1C6ACA1F0B47DF8C5EAA72ED89E6AC', '2015-05-03 11:15:46', '贵州省贵阳市市辖区', '1', '4.2.2.520101', '1', '4', '市辖区', '1', 'SXQ', null, '003052001001', null);
INSERT INTO `pa_bmzd` VALUES ('7A2E4BB03EE841448DE3F35BDBFD9249', '2015-05-03 11:15:46', '四川省成都市都江堰市', '1', '4.2.2.510181', '1', '4', '都江堰市', '81', 'DJYS', null, '003051001081', null);
INSERT INTO `pa_bmzd` VALUES ('7A4B46E58476472BBC6F05DD485D9B43', '2015-05-03 11:15:46', '河南省濮阳市台前县', '1', '4.2.2.410927', '1', '4', '台前县', '27', 'TQX', null, '003041009027', null);
INSERT INTO `pa_bmzd` VALUES ('7A54EFA3598A4BF880781A602479A532', '2015-05-03 11:15:46', '陕西省咸阳市渭城区', '1', '4.2.2.610404', '1', '4', '渭城区', '4', 'WCQ', null, '003061004004', null);
INSERT INTO `pa_bmzd` VALUES ('7A867EF4FF0741509F7722078D2204B7', '2015-05-03 11:15:46', '云南省德宏傣族景颇族自治州梁河县', '1', '4.2.2.533122', '1', '4', '梁河县', '22', 'LHX', null, '003053031022', null);
INSERT INTO `pa_bmzd` VALUES ('7A9CF5514B7E451498496A3D424BFE68', '2015-05-03 11:15:46', '浙江省温州市瑞安市', '1', '4.2.2.330381', '1', '4', '瑞安市', '81', 'RAS', null, '003033003081', null);
INSERT INTO `pa_bmzd` VALUES ('7AB567EA1C924386A6D38FCE981B70D3', '2015-05-03 11:15:46', '广东省惠州市博罗县', '1', '4.2.2.441322', '1', '4', '博罗县', '22', 'BLX', null, '003044013022', null);
INSERT INTO `pa_bmzd` VALUES ('7AB5FA8EA76247C49A0AE9288B35AAB2', '2015-05-03 11:15:46', '内蒙古自治区乌兰察布市四子王旗', '1', '4.2.2.150929', '1', '4', '四子王旗', '29', 'SZWQ', null, '003015009029', null);
INSERT INTO `pa_bmzd` VALUES ('7ACBB83142884FFDB9795951251775A4', '2015-05-03 11:15:46', '黑龙江省黑河市', '1', '4.2.2.231100', '0', '3', '黑河市', '11', 'HHS', null, '003023011', null);
INSERT INTO `pa_bmzd` VALUES ('7AEAE02104F4407ABB5520CFA59FE7FF', '2015-05-03 11:15:46', '湖北省咸宁市通山县', '1', '4.2.2.421224', '1', '4', '通山县', '24', 'TSX', null, '003042012024', null);
INSERT INTO `pa_bmzd` VALUES ('7B093935F05D4B9D86E1F4FB9E9A32CD', '2015-05-03 11:15:46', '江西省鹰潭市市辖区', '1', '4.2.2.360601', '1', '4', '市辖区', '1', 'SXQ', null, '003036006001', null);
INSERT INTO `pa_bmzd` VALUES ('7B4BAB1773D7407C91964738F6A1E239', '2015-05-03 11:15:46', '云南省西双版纳傣族自治州勐腊县', '1', '4.2.2.532823', '1', '4', '勐腊县', '23', 'MXX', null, '003053028023', null);
INSERT INTO `pa_bmzd` VALUES ('7B6C24E7ABAC44339D5A0ED56A1D0306', '2015-05-03 11:15:46', '新疆维吾尔自治区阿勒泰地区阿勒泰市', '1', '4.2.2.654301', '1', '4', '阿勒泰市', '1', 'ALTS', null, '003065043001', null);
INSERT INTO `pa_bmzd` VALUES ('7B7A1F8BB0174BB18AB5996B7425A6EF', '2015-05-03 11:15:46', '四川省泸州市', '1', '4.2.2.510500', '0', '3', '泸州市', '5', 'LZS', null, '003051005', null);
INSERT INTO `pa_bmzd` VALUES ('7B8F950A2B8A4AC5B82AA7A893EE69B0', '2015-05-03 11:15:46', '四川省雅安市汉源县', '1', '4.2.2.511823', '1', '4', '汉源县', '23', 'HYX', null, '003051018023', null);
INSERT INTO `pa_bmzd` VALUES ('7BB3F52CFB8C470DA37B5AEA247BC42B', '2015-05-03 11:15:46', '甘肃省平凉市崇信县', '1', '4.2.2.620823', '1', '4', '崇信县', '23', 'CXX', null, '003062008023', null);
INSERT INTO `pa_bmzd` VALUES ('7BCD551B21E44AB2B191455FA3EFF2D7', '2015-05-03 11:15:46', '福建省宁德市蕉城区', '1', '4.2.2.350902', '1', '4', '蕉城区', '2', 'QCQ', null, '003035009002', null);
INSERT INTO `pa_bmzd` VALUES ('7BD768BA4EE94F59B7D59DF3C4ACDC09', '2015-05-03 11:15:46', '山西省晋城市沁水县', '1', '4.2.2.140521', '1', '4', '沁水县', '21', 'QSX', null, '003014005021', null);
INSERT INTO `pa_bmzd` VALUES ('7BD9226C55F6454B9B6639B1EE11C7DD', '2015-05-03 11:15:46', '吉林省辽源市市辖区', '1', '4.2.2.220401', '1', '4', '市辖区', '1', 'SXQ', null, '003022004001', null);
INSERT INTO `pa_bmzd` VALUES ('7C1E7238A40F44F4A233EB0125CA69FC', '2015-05-03 11:15:46', '四川省南充市南部县', '1', '4.2.2.511321', '1', '4', '南部县', '21', 'NBX', null, '003051013021', null);
INSERT INTO `pa_bmzd` VALUES ('7C2A31BD415B44038690838B61ADB78B', '2015-05-03 11:15:46', '贵州省黔南布依族苗族自治州长顺县', '1', '4.2.2.522729', '1', '4', '长顺县', '29', 'ZSX', null, '003052027029', null);
INSERT INTO `pa_bmzd` VALUES ('7C2D95EE23B74A659C92D778B63CF937', '2015-05-03 11:15:46', '海南省海口市秀英区', '1', '4.2.2.460105', '1', '4', '秀英区', '5', 'XYQ', null, '003046001005', null);
INSERT INTO `pa_bmzd` VALUES ('7C33D294FA8C441C97D8421C92EE270D', '2015-05-03 11:15:46', '西藏自治区日喀则地区吉隆县', '1', '4.2.2.542335', '1', '4', '吉隆县', '35', 'JLX', null, '003054023035', null);
INSERT INTO `pa_bmzd` VALUES ('7C452EBC556049E7A9FFC9D6364F66F9', '2015-05-03 11:15:46', '河北省承德市市辖区', '1', '4.2.2.130801', '1', '4', '市辖区', '1', 'SXQ', null, '003013008001', null);
INSERT INTO `pa_bmzd` VALUES ('7C4AACD5CCC84AD2B51750707A6153E2', '2015-05-03 11:15:46', '江苏省苏州市吴中区', '1', '4.2.2.320506', '1', '4', '吴中区', '6', 'WZQ', null, '003032005006', null);
INSERT INTO `pa_bmzd` VALUES ('7C7C5DED4A13464F8F404E4E53085C5A', '2015-05-03 11:15:46', '山西省大同市浑源县', '1', '4.2.2.140225', '1', '4', '浑源县', '25', 'HYX', null, '003014002025', null);
INSERT INTO `pa_bmzd` VALUES ('7C7E398905FD469A905959DFB5538EE5', '2015-05-03 11:15:46', '内蒙古自治区呼伦贝尔市额尔古纳市', '1', '4.2.2.150784', '1', '4', '额尔古纳市', '84', 'EEGNS', null, '003015007084', null);
INSERT INTO `pa_bmzd` VALUES ('7CA11E6FC4FC4014881257677CD15561', '2015-05-03 11:15:46', '广东省河源市', '1', '4.2.2.441600', '0', '3', '河源市', '16', 'HYS', null, '003044016', null);
INSERT INTO `pa_bmzd` VALUES ('7CA9CE70290E44E5B1D0611F4911FA87', '2015-05-03 11:15:46', '黑龙江省鸡西市鸡冠区', '1', '4.2.2.230302', '1', '4', '鸡冠区', '2', 'JGQ', null, '003023003002', null);
INSERT INTO `pa_bmzd` VALUES ('7CC17A967894433BB83DF801CD46BD7B', '2015-05-03 11:15:46', '广西壮族自治区贺州市八步区', '1', '4.2.2.451102', '1', '4', '八步区', '2', 'BBQ', null, '003045011002', null);
INSERT INTO `pa_bmzd` VALUES ('7CE733DF53C440448623750CD4EFA93B', '2015-05-03 11:15:46', '江西省新余市分宜县', '1', '4.2.2.360521', '1', '4', '分宜县', '21', 'FYX', null, '003036005021', null);
INSERT INTO `pa_bmzd` VALUES ('7CFD2D03B4A6445D8610E97705D5CB83', '2015-05-03 11:15:46', '四川省泸州市市辖区', '1', '4.2.2.510501', '1', '4', '市辖区', '1', 'SXQ', null, '003051005001', null);
INSERT INTO `pa_bmzd` VALUES ('7CFFAFFC4CC8458EA65DCFED8592D772', '2015-05-03 11:15:46', '山西省运城市永济市', '1', '4.2.2.140881', '1', '4', '永济市', '81', 'YJS', null, '003014008081', null);
INSERT INTO `pa_bmzd` VALUES ('7D0196C8AC5847ADBDA5DE4FE700EB0C', '2015-05-03 11:15:46', '贵州省铜仁市思南县', '1', '4.2.2.522225', '1', '4', '思南县', '24', 'SNX', null, '003052006024', null);
INSERT INTO `pa_bmzd` VALUES ('7D25B9D9F8F842B48BF4E187662EF20E', '2015-05-03 11:15:46', '四川省成都市', '1', '4.2.2.510100', '0', '3', '成都市', '1', 'CDS', null, '003051001', null);
INSERT INTO `pa_bmzd` VALUES ('7D49DCD36D9F46199C79E8ECB58B5943', '2015-05-03 11:15:46', '广东省肇庆市广宁县', '1', '4.2.2.441223', '1', '4', '广宁县', '23', 'GNX', null, '003044012023', null);
INSERT INTO `pa_bmzd` VALUES ('7D82009AC9174C5D8BA5BF4785550A2D', '2015-05-03 11:15:46', '湖南省衡阳市衡南县', '1', '4.2.2.430422', '1', '4', '衡南县', '22', 'HNX', null, '003043004022', null);
INSERT INTO `pa_bmzd` VALUES ('7D836F2FA9F04114B60DDE242D41AEE2', '2015-05-03 11:15:46', '河北省廊坊市固安县', '1', '4.2.2.131022', '1', '4', '固安县', '22', 'GAX', null, '003013010022', null);
INSERT INTO `pa_bmzd` VALUES ('7DAFA8063A2C4A28B6974C86BDA69D55', '2015-05-03 11:15:46', '安徽省淮南市潘集区', '1', '4.2.2.340406', '1', '4', '潘集区', '6', 'PJQ', null, '003034004006', null);
INSERT INTO `pa_bmzd` VALUES ('7DC3A524DD5C42C28A9362BC8E8838CD', '2015-05-03 11:15:46', '山东省日照市', '1', '4.2.2.371100', '0', '3', '日照市', '11', 'RZS', null, '003037011', null);
INSERT INTO `pa_bmzd` VALUES ('7DCE1A7E9D9340239093494F8FD2BC33', '2015-05-03 11:15:46', '重庆市县荣昌县', '1', '4.2.2.500226', '1', '4', '荣昌县', '26', 'RCX', null, '003050002026', null);
INSERT INTO `pa_bmzd` VALUES ('7DED5D7F007E46A9A4E9C9FD5BD7A805', '2015-05-03 11:15:46', '江苏省南京市高淳县', '1', '4.2.2.320125', '1', '4', '高淳县', '25', 'GCX', null, '003032001025', null);
INSERT INTO `pa_bmzd` VALUES ('7E0DEB2701F24EDBA9B753E852AE70B6', '2015-05-03 11:15:46', '安徽省宣城市泾县', '1', '4.2.2.341823', '1', '4', '泾县', '23', 'JX', null, '003034018023', null);
INSERT INTO `pa_bmzd` VALUES ('7E0FC0E8929A42CB80DC39E208FE4C04', '2015-05-03 11:15:46', '安徽省滁州市', '1', '4.2.2.341100', '0', '3', '滁州市', '11', 'CZS', null, '003034011', null);
INSERT INTO `pa_bmzd` VALUES ('7E2C5704E5694D2E9A2D0A7DB00F1A3D', '2015-05-03 11:15:46', '内蒙古自治区包头市青山区', '1', '4.2.2.150204', '1', '4', '青山区', '4', 'QSQ', null, '003015002004', null);
INSERT INTO `pa_bmzd` VALUES ('7E3348C3D408420C9A9C1D70F342CC50', '2015-05-03 11:15:46', '四川省甘孜藏族自治州得荣县', '1', '4.2.2.513338', '1', '4', '得荣县', '38', 'DRX', null, '003051033038', null);
INSERT INTO `pa_bmzd` VALUES ('7E392104CC924707B21410A2383F6081', '2015-05-03 11:15:46', '内蒙古自治区锡林郭勒盟二连浩特市', '1', '4.2.2.152501', '1', '4', '二连浩特市', '1', 'ELHTS', null, '003015025001', null);
INSERT INTO `pa_bmzd` VALUES ('7E6AD83D59B8443C97FAF258D00A7E96', '2015-05-03 11:15:46', '河北省邢台市宁晋县', '1', '4.2.2.130528', '1', '4', '宁晋县', '28', 'NJX', null, '003013005028', null);
INSERT INTO `pa_bmzd` VALUES ('7E6B750992DC4091A80E3A4F8F09AF5F', '2015-05-03 11:15:46', '广东省佛山市', '1', '4.2.2.440600', '0', '3', '佛山市', '6', 'BSS', null, '003044006', null);
INSERT INTO `pa_bmzd` VALUES ('7E759A4DE3364A8D8D1F15A5F73EF589', '2015-05-03 11:15:46', '山东省青岛市四方区', '1', '4.2.2.370205', '1', '4', '四方区', '5', 'SFQ', null, '003037002005', null);
INSERT INTO `pa_bmzd` VALUES ('7E8D0EADB3A3428BB4825094E6F59ED6', '2015-05-03 11:15:46', '山西省运城市新绛县', '1', '4.2.2.140825', '1', '4', '新绛县', '25', 'XJX', null, '003014008025', null);
INSERT INTO `pa_bmzd` VALUES ('7E960A22F03C485B91E385FBC83A3425', '2015-05-03 11:15:46', '甘肃省临夏回族自治州和政县', '1', '4.2.2.622925', '1', '4', '和政县', '25', 'HZX', null, '003062029025', null);
INSERT INTO `pa_bmzd` VALUES ('7E960B7F270D40948ACD13B39CF2FD93', '2015-05-03 11:15:46', '广西壮族自治区崇左市扶绥县', '1', '4.2.2.451421', '1', '4', '扶绥县', '21', 'FSX', null, '003045014021', null);
INSERT INTO `pa_bmzd` VALUES ('7EB5E574035F4B699EC0597D76D616D5', '2015-05-03 11:15:46', '辽宁省锦州市古塔区', '1', '4.2.2.210702', '1', '4', '古塔区', '2', 'GTQ', null, '003021007002', null);
INSERT INTO `pa_bmzd` VALUES ('7ED2E4AA8B934B0C845BB4774FBF02DF', '2015-05-03 11:15:46', '甘肃省酒泉市', '1', '4.2.2.620900', '0', '3', '酒泉市', '9', 'JQS', null, '003062009', null);
INSERT INTO `pa_bmzd` VALUES ('7EDAD8CF9BE04C64891D21BF5ADD9CE5', '2015-05-03 11:15:46', '天津市市辖区', '1', '4.2.2.120100', '0', '3', '市辖区', '1', 'SXQ', null, '003012001', null);
INSERT INTO `pa_bmzd` VALUES ('7EEAF5BC6B3B4549B8DF4334FAE6676B', '2015-05-03 11:15:46', '湖南省衡阳市', '1', '4.2.2.430400', '0', '3', '衡阳市', '4', 'HYS', null, '003043004', null);
INSERT INTO `pa_bmzd` VALUES ('7EF7DAA9836E4869B5B1368881F7DD24', '2015-05-03 11:15:46', '内蒙古自治区赤峰市克什克腾旗', '1', '4.2.2.150425', '1', '4', '克什克腾旗', '25', 'KSKTQ', null, '003015004025', null);
INSERT INTO `pa_bmzd` VALUES ('4022818a3c420682013c42cf216a0036', '2013-01-16 18:02:16', '安徽省芜湖市沈巷', '1', '4.2.2.340225', '1', '4', '沈巷', '26', 'SX', null, '003034002026', '0');
INSERT INTO `pa_bmzd` VALUES ('4022818a3c420682013c42d3ae990037', '2013-01-16 18:07:15', '重庆市市辖区双桥区', '1', '4.2.2.500111', '1', '4', '双桥区', '21', 'SQQ', null, '003050001021', '0');
INSERT INTO `pa_bmzd` VALUES ('5f70ed953c204315013c21f5f2420003', '2013-01-10 08:57:12', '天津市市辖区塘沽区', '1', '4.2.2.120107', '1', '4', '塘沽区', '17', 'TGQ', null, '003012001017', '0');
INSERT INTO `pa_bmzd` VALUES ('5f70ed953c204315013c21f6393d0004', '2013-01-10 08:57:30', '天津市市辖区汉沽区', '1', '4.2.2.120108', '1', '4', '汉沽区', '18', 'HGQ', null, '003012001018', '0');
INSERT INTO `pa_bmzd` VALUES ('5f70ed953c204315013c21f698330005', '2013-01-10 08:57:54', '天津市市辖区大港区', '1', '4.2.2.120109', '1', '4', '大港区', '19', 'DGQ', null, '003012001019', '0');
INSERT INTO `pa_bmzd` VALUES ('5f70ed953c204315013c21f79efe0006', '2013-01-10 08:59:02', '吉林省白山市江源县', '1', '4.2.2.220625', '1', '4', '江源县', '82', 'JYX', null, '003022006082', '0');
INSERT INTO `pa_bmzd` VALUES ('5f70ed953c204315013c21f888450007', '2013-01-10 09:00:01', '黑龙江省哈尔滨市香坊区', '1', '4.2.2.230106', '1', '4', '香坊区', '85', 'XFQ', null, '003023001085', '0');
INSERT INTO `pa_bmzd` VALUES ('5f70ed953c204315013c21f8c7f10008', '2013-01-10 09:00:18', '黑龙江省哈尔滨市动力区 ', '1', '4.2.2.230107', '1', '4', '动力区 ', '86', 'DLQ ', null, '003023001086', '0');
INSERT INTO `pa_bmzd` VALUES ('5f70ed953c204315013c21f98e540009', '2013-01-10 09:01:09', '黑龙江省佳木斯市永红区\n', '1', '4.2.2.230802', '1', '4', '永红区\n', '83', 'YHQ\n', null, '003023008083', '0');
INSERT INTO `pa_bmzd` VALUES ('5f70ed953c204315013c21fa5469000a', '2013-01-10 09:01:59', '上海市市辖区卢湾区', '1', '4.2.2.310103', '1', '4', '卢湾区', '21', 'LWQ', null, '003031001021', '0');
INSERT INTO `pa_bmzd` VALUES ('5f70ed953c204315013c21faec7e000b', '2013-01-10 09:02:38', '上海市市辖区南汇区 ', '1', '4.2.2.310119', '1', '4', '南汇区 ', '22', 'NHQ ', null, '003031001022', '0');
INSERT INTO `pa_bmzd` VALUES ('5f70ed953c204315013c21fbca8c000c', '2013-01-10 09:03:35', '江苏省徐州市九里区 ', '1', '4.2.2.320304', '1', '4', '九里区 ', '83', 'JLQ ', null, '003032003083', '0');
INSERT INTO `pa_bmzd` VALUES ('5f70ed953c204315013c21fc0720000d', '2013-01-10 09:03:51', '江苏省徐州市铜山县', '1', '4.2.2.320323', '1', '4', '铜山县', '84', 'TSX', null, '003032003084', '0');
INSERT INTO `pa_bmzd` VALUES ('5f70ed953c204315013c21fcef7c000e', '2013-01-10 09:04:50', '江苏省南通市通州市', '1', '4.2.2.320683', '1', '4', '通州市', '85', 'TZS', null, '003032006085', '0');
INSERT INTO `pa_bmzd` VALUES ('5f70ed953c204315013c21fe279f000f', '2013-01-10 09:06:10', '江苏省扬州市维扬区', '1', '4.2.2.321011', '1', '4', '维扬区', '85', 'WYQ', null, '003032010085', '0');
INSERT INTO `pa_bmzd` VALUES ('5f70ed953c204315013c21feaaf20010', '2013-01-10 09:06:44', '安徽省合肥市经开区', '1', '4.2.2.340105', '1', '4', '经开区', '82', 'JKQ', null, '003034001082', '0');
INSERT INTO `pa_bmzd` VALUES ('5f70ed953c204315013c22037fe30011', '2013-01-10 09:12:00', '河南省焦作市济源市 ', '1', '4.2.2.410881', '1', '4', '济源市 ', '84', 'JYS ', null, '003041008084', '0');
INSERT INTO `pa_bmzd` VALUES ('5555C249A76E4F219C3ADDF0838D9C63', '2015-05-03 11:15:46', '浙江省丽水市庆元县', '1', '4.2.2.331126', '1', '4', '庆元县', '26', 'QYX', null, '003033011026', null);
INSERT INTO `pa_bmzd` VALUES ('5560E4E007784A75895FC70F38406058', '2015-05-03 11:15:46', '河南省鹤壁市市辖区', '1', '4.2.2.410601', '1', '4', '市辖区', '1', 'SXQ', null, '003041006001', null);
INSERT INTO `pa_bmzd` VALUES ('55643DB9BA40418B8998E0BD53813720', '2015-05-03 11:15:46', '辽宁省营口市西市区', '1', '4.2.2.210803', '1', '4', '西市区', '3', 'XSQ', null, '003021008003', null);
INSERT INTO `pa_bmzd` VALUES ('5578149CED9549368ABCAC0A0C7AD076', '2015-05-03 11:15:46', '四川省阿坝藏族羌族自治州马尔康县', '1', '4.2.2.513229', '1', '4', '马尔康县', '29', 'MEKX', null, '003051032029', null);
INSERT INTO `pa_bmzd` VALUES ('5584A50B704740BF9D52DB3A0F9C09FA', '2015-05-03 11:15:46', '四川省自贡市市辖区', '1', '4.2.2.510301', '1', '4', '市辖区', '1', 'SXQ', null, '003051003001', null);
INSERT INTO `pa_bmzd` VALUES ('5587FFDF63F14CEE809D6337A12FD117', '2015-05-03 11:15:46', '陕西省西安市高陵县', '1', '4.2.2.610126', '1', '4', '高陵县', '26', 'GLX', null, '003061001026', null);
INSERT INTO `pa_bmzd` VALUES ('558D440320E0417BBAA032AC6C11ECDF', '2015-05-03 11:15:46', '山西省忻州市', '1', '4.2.2.140900', '0', '3', '忻州市', '9', 'XZS', null, '003014009', null);
INSERT INTO `pa_bmzd` VALUES ('55943A354F7843BC9CACEBBC701304F2', '2015-05-03 11:15:46', '黑龙江省佳木斯市市辖区', '1', '4.2.2.230801', '1', '4', '市辖区', '1', 'SXQ', null, '003023008001', null);
INSERT INTO `pa_bmzd` VALUES ('559FBE86614441C1890A9DED686C410D', '2015-05-03 11:15:46', '海南省省直辖县级行政区划临高县', '1', '4.2.2.469028', '1', '4', '临高县', '24', 'LGX', null, '003046090024', null);
INSERT INTO `pa_bmzd` VALUES ('56137D03698D45C09553EA9180092AE8', '2015-05-03 11:15:46', '湖南省岳阳市', '1', '4.2.2.430600', '0', '3', '岳阳市', '6', 'YYS', null, '003043006', null);
INSERT INTO `pa_bmzd` VALUES ('561BDB06B1294AA0962E37C65F991DB2', '2015-05-03 11:15:46', '贵州省遵义市红花岗区', '1', '4.2.2.520302', '1', '4', '红花岗区', '2', 'HHGQ', null, '003052003002', null);
INSERT INTO `pa_bmzd` VALUES ('5638A73DE44F433487C4E511928ABD2E', '2015-05-03 11:15:46', '上海市市辖区长宁区', '1', '4.2.2.310105', '1', '4', '长宁区', '5', 'ZNQ', null, '003031001005', null);
INSERT INTO `pa_bmzd` VALUES ('5655FEC0989C41588D1890B406B6C96E', '2015-05-03 11:15:46', '内蒙古自治区鄂尔多斯市市辖区', '1', '4.2.2.150601', '1', '4', '市辖区', '1', 'SXQ', null, '003015006001', null);
INSERT INTO `pa_bmzd` VALUES ('5656E8E286474DABB5DF40AAEFEE6850', '2015-05-03 11:15:46', '山西省阳泉市盂县', '1', '4.2.2.140322', '1', '4', '盂县', '22', 'YX', null, '003014003022', null);
INSERT INTO `pa_bmzd` VALUES ('565854CB8C224F7EB99EFFDDD4239266', '2015-05-03 11:15:46', '内蒙古自治区赤峰市喀喇沁旗', '1', '4.2.2.150428', '1', '4', '喀喇沁旗', '28', 'KLQQ', null, '003015004028', null);
INSERT INTO `pa_bmzd` VALUES ('565E19F4ED4B40FF8A8BBA8E55FC7819', '2015-05-03 11:15:46', '贵州省铜仁市碧江区', '1', '4.2.2.520602', '1', '4', '碧江区', '2', 'BJQ', null, '003052006002', null);
INSERT INTO `pa_bmzd` VALUES ('565EE3F934184CD5B49160BFA96CC95B', '2015-05-03 11:15:46', '湖南省郴州市资兴市', '1', '4.2.2.431081', '1', '4', '资兴市', '81', 'ZXS', null, '003043010081', null);
INSERT INTO `pa_bmzd` VALUES ('565F81AA9FA94097BE7D131CE5763199', '2015-05-03 11:15:46', '安徽省马鞍山市市辖区', '1', '4.2.2.340501', '1', '4', '市辖区', '1', 'SXQ', null, '003034005001', null);
INSERT INTO `pa_bmzd` VALUES ('56603BA2D1CC452D8C8E22A732A1A88E', '2015-05-03 11:15:46', '江苏省盐城市射阳县', '1', '4.2.2.320924', '1', '4', '射阳县', '24', 'SYX', null, '003032009024', null);
INSERT INTO `pa_bmzd` VALUES ('56725C58391D422B9DDCCC58636ED8A9', '2015-05-03 11:15:46', '新疆维吾尔自治区喀什地区岳普湖县', '1', '4.2.2.653128', '1', '4', '岳普湖县', '28', 'YPHX', null, '003065031028', null);
INSERT INTO `pa_bmzd` VALUES ('568010E569F6407BA4E546A91D77FBBC', '2015-05-03 11:15:46', '广东省云浮市云安县', '1', '4.2.2.445323', '1', '4', '云安县', '23', 'YAX', null, '003044053023', null);
INSERT INTO `pa_bmzd` VALUES ('5686BB8C40D0443FA8CF89D3D07A5178', '2015-05-03 11:15:46', '甘肃省陇南市两当县', '1', '4.2.2.621228', '1', '4', '两当县', '28', 'LDX', null, '003062012028', null);
INSERT INTO `pa_bmzd` VALUES ('569B8D05DAEC498281E2169190307747', '2015-05-03 11:15:46', '安徽省淮北市相山区', '1', '4.2.2.340603', '1', '4', '相山区', '3', 'XSQ', null, '003034006003', null);
INSERT INTO `pa_bmzd` VALUES ('569E9A4172304554B2ADC35FB6044214', '2015-05-03 11:15:46', '湖南省张家界市永定区', '1', '4.2.2.430802', '1', '4', '永定区', '2', 'YDQ', null, '003043008002', null);
INSERT INTO `pa_bmzd` VALUES ('569F265DE86B492EB2319BBD51966421', '2015-05-03 11:15:46', '河北省承德市丰宁满族自治县', '1', '4.2.2.130826', '1', '4', '丰宁满族自治县', '26', 'FNMZZZX', null, '003013008026', null);
INSERT INTO `pa_bmzd` VALUES ('56A1D5F3B66B491FB7CBC28FCE5EEF7A', '2015-05-03 11:15:46', '新疆维吾尔自治区伊犁哈萨克自治州特克斯县', '1', '4.2.2.654027', '1', '4', '特克斯县', '27', 'TKSX', null, '003065040027', null);
INSERT INTO `pa_bmzd` VALUES ('5716DDAF1775472D9B3977448B0C4419', '2015-05-03 11:15:46', '湖南省益阳市桃江县', '1', '4.2.2.430922', '1', '4', '桃江县', '22', 'TJX', null, '003043009022', null);
INSERT INTO `pa_bmzd` VALUES ('571DCB2D6DCA41FEA14EFC0218DB8F01', '2015-05-03 11:15:46', '甘肃省庆阳市华池县', '1', '4.2.2.621023', '1', '4', '华池县', '23', 'HCX', null, '003062010023', null);
INSERT INTO `pa_bmzd` VALUES ('571F41EABADC46A4A6535C2D9FA95DFD', '2015-05-03 11:15:46', '江苏省连云港市市辖区', '1', '4.2.2.320701', '1', '4', '市辖区', '1', 'SXQ', null, '003032007001', null);
INSERT INTO `pa_bmzd` VALUES ('572F828597B248FAA99CAAEA1379BF6F', '2015-05-03 11:15:46', '甘肃省天水市市辖区', '1', '4.2.2.620501', '1', '4', '市辖区', '1', 'SXQ', null, '003062005001', null);
INSERT INTO `pa_bmzd` VALUES ('573294814E8C4008B23AE0FB6DAC3F37', '2015-05-03 11:15:46', '安徽省阜阳市阜南县', '1', '4.2.2.341225', '1', '4', '阜南县', '25', 'FNX', null, '003034012025', null);
INSERT INTO `pa_bmzd` VALUES ('5732B5A628A74578A7B39DAE11C73D5D', '2015-05-03 11:15:46', '广东省江门市开平市', '1', '4.2.2.440783', '1', '4', '开平市', '83', 'KPS', null, '003044007083', null);
INSERT INTO `pa_bmzd` VALUES ('573DE1BE280846E4A0A96D08A2A3C187', '2015-05-03 11:15:46', '内蒙古自治区阿拉善盟', '1', '4.2.2.152900', '0', '3', '阿拉善盟', '29', 'ALSM', null, '003015029', null);
INSERT INTO `pa_bmzd` VALUES ('5789A6CEF0504CF2B955246B393FD813', '2015-05-03 11:15:46', '山东省青岛市城阳区', '1', '4.2.2.370214', '1', '4', '城阳区', '14', 'CYQ', null, '003037002014', null);
INSERT INTO `pa_bmzd` VALUES ('579088B24A1D47B5A0C36FA817E711A9', '2015-05-03 11:15:46', '江苏省徐州市铜山区', '1', '4.2.2.320312', '1', '4', '铜山区', '12', 'TSQ', null, '003032003012', null);
INSERT INTO `pa_bmzd` VALUES ('57ADD6817A7E4A10BBEF0F4C8282D97F', '2015-05-03 11:15:46', '陕西省汉中市城固县', '1', '4.2.2.610722', '1', '4', '城固县', '22', 'CGX', null, '003061007022', null);
INSERT INTO `pa_bmzd` VALUES ('5808CA4519644846A9900CD8456ECD6F', '2015-05-03 11:15:46', '江西省上饶市鄱阳县', '1', '4.2.2.361128', '1', '4', '鄱阳县', '28', 'PYX', null, '003036011028', null);
INSERT INTO `pa_bmzd` VALUES ('5809EB22B6FD47158D11CB5822B743DD', '2015-05-03 11:15:46', '河南省漯河市召陵区', '1', '4.2.2.411104', '1', '4', '召陵区', '4', 'ZLQ', null, '003041011004', null);
INSERT INTO `pa_bmzd` VALUES ('580A958CF6DB44E48D48DC8529DE5B62', '2015-05-03 11:15:46', '四川省成都市青羊区', '1', '4.2.2.510105', '1', '4', '青羊区', '5', 'QYQ', null, '003051001005', null);
INSERT INTO `pa_bmzd` VALUES ('5814F9F00B8546758A48BE3CC65AD4DF', '2015-05-03 11:15:46', '江苏省苏州市沧浪区', '1', '4.2.2.320502', '1', '4', '沧浪区', '2', 'CLQ', null, '003032005002', null);
INSERT INTO `pa_bmzd` VALUES ('581537320E114E8196C4F41EEDDC8D83', '2015-05-03 11:15:46', '湖北省鄂州市', '1', '4.2.2.420700', '0', '3', '鄂州市', '7', 'EZS', null, '003042007', null);
INSERT INTO `pa_bmzd` VALUES ('582AE60884FD4874904FA52250B1659D', '2015-05-03 11:15:46', '浙江省丽水市松阳县', '1', '4.2.2.331124', '1', '4', '松阳县', '24', 'SYX', null, '003033011024', null);
INSERT INTO `pa_bmzd` VALUES ('58387B8CE75645529B01E540FB494C3E', '2015-05-03 11:15:46', '天津市市辖区河东区', '1', '4.2.2.120102', '1', '4', '河东区', '2', 'HDQ', null, '003012001002', null);
INSERT INTO `pa_bmzd` VALUES ('5838A6673F0D4BFA8B56E45A67AC4734', '2015-05-03 11:15:46', '黑龙江省鸡西市鸡东县', '1', '4.2.2.230321', '1', '4', '鸡东县', '21', 'JDX', null, '003023003021', null);
INSERT INTO `pa_bmzd` VALUES ('5848093BCA5F4E9DA5DD7FF0F6B3A681', '2015-05-03 11:15:46', '浙江省舟山市', '1', '4.2.2.330900', '0', '3', '舟山市', '9', 'ZSS', null, '003033009', null);
INSERT INTO `pa_bmzd` VALUES ('5856368A1FB84A848B827DA27BB1AB4F', '2015-05-03 11:15:46', '江苏省常州市天宁区', '1', '4.2.2.320402', '1', '4', '天宁区', '2', 'TNQ', null, '003032004002', null);
INSERT INTO `pa_bmzd` VALUES ('585A2D61EF2B4C40A95B641F26DF90CE', '2015-05-03 11:15:46', '广西壮族自治区钦州市钦北区', '1', '4.2.2.450703', '1', '4', '钦北区', '3', 'QBQ', null, '003045007003', null);
INSERT INTO `pa_bmzd` VALUES ('585CE95E43D64FC287AD924E9B3783DE', '2015-05-03 11:15:46', '西藏自治区拉萨市达孜县', '1', '4.2.2.540126', '1', '4', '达孜县', '26', 'DZX', null, '003054001026', null);
INSERT INTO `pa_bmzd` VALUES ('58723A3527914129801A9CB7B9060CD9', '2015-05-03 11:15:46', '浙江省宁波市奉化市', '1', '4.2.2.330283', '1', '4', '奉化市', '83', 'FHS', null, '003033002083', null);
INSERT INTO `pa_bmzd` VALUES ('217CDA7BBC72430584176D64B21B127C', '2015-05-03 11:15:46', '河南省南阳市卧龙区', '1', '4.2.2.411303', '1', '4', '卧龙区', '3', 'WLQ', null, '003041013003', null);
INSERT INTO `pa_bmzd` VALUES ('21846AA15133494587C4825159FDA516', '2015-05-03 11:15:46', '湖南省长沙市天心区', '1', '4.2.2.430103', '1', '4', '天心区', '3', 'TXQ', null, '003043001003', null);
INSERT INTO `pa_bmzd` VALUES ('2194A005F9A14FAFAF5C051788A52B5B', '2015-05-03 11:15:46', '四川省达州市开江县', '1', '4.2.2.511723', '1', '4', '开江县', '23', 'KJX', null, '003051017023', null);
INSERT INTO `pa_bmzd` VALUES ('219F614361E643648B4AF4B15DF705A3', '2015-05-03 11:15:46', '山西省太原市晋源区', '1', '4.2.2.140110', '1', '4', '晋源区', '10', 'JYQ', null, '003014001010', null);
INSERT INTO `pa_bmzd` VALUES ('21AC05082C194EE6BFF34BACA369CDF9', '2015-05-03 11:15:46', '江西省鹰潭市余江县', '1', '4.2.2.360622', '1', '4', '余江县', '22', 'YJX', null, '003036006022', null);
INSERT INTO `pa_bmzd` VALUES ('21C92ED090D741CF80BF0689E72B59C4', '2015-05-03 11:15:46', '西藏自治区昌都地区左贡县', '1', '4.2.2.542128', '1', '4', '左贡县', '28', 'ZGX', null, '003054021028', null);
INSERT INTO `pa_bmzd` VALUES ('2205809E782143CDAFE835B5B1C0DD70', '2015-05-03 11:15:46', '江西省赣州市南康市', '1', '4.2.2.360782', '1', '4', '南康市', '82', 'NKS', null, '003036007082', null);
INSERT INTO `pa_bmzd` VALUES ('221EBD029D0142609DD0659BC0DD632A', '2015-05-03 11:15:46', '河北省衡水市饶阳县', '1', '4.2.2.131124', '1', '4', '饶阳县', '24', 'RYX', null, '003013011024', null);
INSERT INTO `pa_bmzd` VALUES ('224C478E5EE243BB8105A51CCA90385B', '2015-05-03 11:15:46', '云南省德宏傣族景颇族自治州芒市', '1', '4.2.2.533103', '1', '4', '芒市', '3', 'WS', null, '003053031003', null);
INSERT INTO `pa_bmzd` VALUES ('225F6DBC65D84917B9422DFC39E3A7FB', '2015-05-03 11:15:46', '云南省文山壮族苗族自治州广南县', '1', '4.2.2.532627', '1', '4', '广南县', '27', 'GNX', null, '003053026027', null);
INSERT INTO `pa_bmzd` VALUES ('226DA185331D4CC2834EABE8BD78FC9B', '2015-05-03 11:15:46', '广东省惠州市惠阳区', '1', '4.2.2.441303', '1', '4', '惠阳区', '3', 'HYQ', null, '003044013003', null);
INSERT INTO `pa_bmzd` VALUES ('22719908C8B9421E9D0B3573F0394AA0', '2015-05-03 11:15:46', '四川省雅安市宝兴县', '1', '4.2.2.511827', '1', '4', '宝兴县', '27', 'BXX', null, '003051018027', null);
INSERT INTO `pa_bmzd` VALUES ('227CE3D6FDF942149B1D4CE655549436', '2015-05-03 11:15:46', '安徽省黄山市屯溪区', '1', '4.2.2.341002', '1', '4', '屯溪区', '2', 'ZXQ', null, '003034010002', null);
INSERT INTO `pa_bmzd` VALUES ('22A2FB4E56884428B3A78A9FC032E11F', '2015-05-03 11:15:46', '四川省自贡市', '1', '4.2.2.510300', '0', '3', '自贡市', '3', 'ZGS', null, '003051003', null);
INSERT INTO `pa_bmzd` VALUES ('22B9767BC948432F969A23D9CB5EFD99', '2015-05-03 11:15:46', '湖南省岳阳市君山区', '1', '4.2.2.430611', '1', '4', '君山区', '11', 'JSQ', null, '003043006011', null);
INSERT INTO `pa_bmzd` VALUES ('22BFA915EDCB40C9AEFE2BCA82BDF9DA', '2015-05-03 11:15:46', '辽宁省阜新市阜新蒙古族自治县', '1', '4.2.2.210921', '1', '4', '阜新蒙古族自治县', '21', 'FXMGZZZX', null, '003021009021', null);
INSERT INTO `pa_bmzd` VALUES ('22C63136F524426BAB3CB3723B1AE6A4', '2015-05-03 11:15:46', '内蒙古自治区乌海市市辖区', '1', '4.2.2.150301', '1', '4', '市辖区', '1', 'SXQ', null, '003015003001', null);
INSERT INTO `pa_bmzd` VALUES ('22E63DC208044A10A2DB4C824BD8C173', '2015-05-03 11:15:46', '河北省石家庄市深泽县', '1', '4.2.2.130128', '1', '4', '深泽县', '28', 'SZX', null, '003013001028', null);
INSERT INTO `pa_bmzd` VALUES ('22E7B1485685403191D55D1C01F63C03', '2015-05-03 11:15:46', '贵州省黔南布依族苗族自治州福泉市', '1', '4.2.2.522702', '1', '4', '福泉市', '2', 'FQS', null, '003052027002', null);
INSERT INTO `pa_bmzd` VALUES ('2306F130A4644BA4A8B9430D8BF3D93C', '2015-05-03 11:15:46', '四川省甘孜藏族自治州九龙县', '1', '4.2.2.513324', '1', '4', '九龙县', '24', 'JLX', null, '003051033024', null);
INSERT INTO `pa_bmzd` VALUES ('2319190EF0FE410D9522782B1861A12B', '2015-05-03 11:15:46', '安徽省六安市市辖区', '1', '4.2.2.341501', '1', '4', '市辖区', '1', 'SXQ', null, '003034015001', null);
INSERT INTO `pa_bmzd` VALUES ('231922C04EB544CB8D6154C3A71D4AE9', '2015-05-03 11:15:46', '浙江省丽水市遂昌县', '1', '4.2.2.331123', '1', '4', '遂昌县', '23', 'SCX', null, '003033011023', null);
INSERT INTO `pa_bmzd` VALUES ('23471C67299241DFA10E246FCF6CBD07', '2015-05-03 11:15:46', '云南省德宏傣族景颇族自治州陇川县', '1', '4.2.2.533124', '1', '4', '陇川县', '24', 'LCX', null, '003053031024', null);
INSERT INTO `pa_bmzd` VALUES ('23660765A4E84635B7C6264EEDDF8F90', '2015-05-03 11:15:46', '山东省聊城市东昌府区', '1', '4.2.2.371502', '1', '4', '东昌府区', '2', 'DCFQ', null, '003037015002', null);
INSERT INTO `pa_bmzd` VALUES ('23963A44B2B54B33AB9DF27D970B4C71', '2015-05-03 11:15:46', '江苏省淮安市市辖区', '1', '4.2.2.320801', '1', '4', '市辖区', '1', 'SXQ', null, '003032008001', null);
INSERT INTO `pa_bmzd` VALUES ('23A11F258D3349B1A8ED13FDCC1D35DB', '2015-05-03 11:15:46', '云南省红河哈尼族彝族自治州个旧市', '1', '4.2.2.532501', '1', '4', '个旧市', '1', 'GJS', null, '003053025001', null);
INSERT INTO `pa_bmzd` VALUES ('23A21ADF555448DD8070999AA6914725', '2015-05-03 11:15:46', '浙江省金华市武义县', '1', '4.2.2.330723', '1', '4', '武义县', '23', 'WYX', null, '003033007023', null);
INSERT INTO `pa_bmzd` VALUES ('23CFF9B6874D4300B0532432768591CA', '2015-05-03 11:15:46', '广西壮族自治区来宾市忻城县', '1', '4.2.2.451321', '1', '4', '忻城县', '21', 'XCX', null, '003045013021', null);
INSERT INTO `pa_bmzd` VALUES ('23D6D01F9FD24F91AD6E77FF9473E7C5', '2015-05-03 11:15:46', '陕西省汉中市勉县', '1', '4.2.2.610725', '1', '4', '勉县', '25', 'MX', null, '003061007025', null);
INSERT INTO `pa_bmzd` VALUES ('23D85BFD9E5E4DA1BD241B21BFE45E10', '2015-05-03 11:15:46', '河南省平顶山市新华区', '1', '4.2.2.410402', '1', '4', '新华区', '2', 'XHQ', null, '003041004002', null);
INSERT INTO `pa_bmzd` VALUES ('23D93BBDAC71480CB63A96E6AE2D613B', '2015-05-03 11:15:46', '贵州省黔东南苗族侗族自治州雷山县', '1', '4.2.2.522634', '1', '4', '雷山县', '34', 'LSX', null, '003052026034', null);
INSERT INTO `pa_bmzd` VALUES ('241783773948489B9ADA740504B9B788', '2015-05-03 11:15:46', '湖南省邵阳市城步苗族自治县', '1', '4.2.2.430529', '1', '4', '城步苗族自治县', '29', 'CBMZZZX', null, '003043005029', null);
INSERT INTO `pa_bmzd` VALUES ('2422EC92FC3148B09352E1E669818F69', '2015-05-03 11:15:46', '湖北省恩施土家族苗族自治州', '1', '4.2.2.422800', '0', '3', '恩施土家族苗族自治州', '28', 'ESTJZMZZZZ', null, '003042028', null);
INSERT INTO `pa_bmzd` VALUES ('242EB9C0E0F5462881A2F88797435BB8', '2015-05-03 11:15:46', '江苏省泰州市姜堰市', '1', '4.2.2.321284', '1', '4', '姜堰市', '84', 'JYS', null, '003032012084', null);
INSERT INTO `pa_bmzd` VALUES ('2455D47C317B48DB991FF6988B37128F', '2015-05-03 11:15:46', '河北省沧州市南皮县', '1', '4.2.2.130927', '1', '4', '南皮县', '27', 'NPX', null, '003013009027', null);
INSERT INTO `pa_bmzd` VALUES ('248FCD8EFA574E4F87427FD9BC2A9B4F', '2015-05-03 11:15:46', '广东省惠州市市辖区', '1', '4.2.2.441301', '1', '4', '市辖区', '1', 'SXQ', null, '003044013001', null);
INSERT INTO `pa_bmzd` VALUES ('2493CF50C3FC41038EBE775508658542', '2015-05-03 11:15:46', '湖南省邵阳市', '1', '4.2.2.430500', '0', '3', '邵阳市', '5', 'SYS', null, '003043005', null);
INSERT INTO `pa_bmzd` VALUES ('24D0DA66242F47A0949DEA3F4B6457F5', '2015-05-03 11:15:46', '海南省省直辖县级行政区划陵水黎族自治县', '1', '4.2.2.469034', '1', '4', '陵水黎族自治县', '28', 'LSLZZZX', null, '003046090028', null);
INSERT INTO `pa_bmzd` VALUES ('06B3A95D84A5421FB8CD08B7D4DFC180', '2015-05-03 11:15:46', '广东省云浮市郁南县', '1', '4.2.2.445322', '1', '4', '郁南县', '22', 'YNX', null, '003044053022', null);
INSERT INTO `pa_bmzd` VALUES ('06CAC0B46A2C4B96B7152A3E11858D7F', '2015-05-03 11:15:46', '湖南省衡阳市珠晖区', '1', '4.2.2.430405', '1', '4', '珠晖区', '5', 'ZHQ', null, '003043004005', null);
INSERT INTO `pa_bmzd` VALUES ('06D8480817AC459EA79A81A34336AF2E', '2015-05-03 11:15:46', '山东省', '1', '4.2.2.370000', '0', '2', '山东省', '37', 'SDS', null, '003037', null);
INSERT INTO `pa_bmzd` VALUES ('06DDD33F80C04BBDB7EAB9355F3ABE47', '2015-05-03 11:15:46', '山西省晋城市陵川县', '1', '4.2.2.140524', '1', '4', '陵川县', '24', 'LCX', null, '003014005024', null);
INSERT INTO `pa_bmzd` VALUES ('06E16C20B20B4CD2ACCBA00F7BAF8610', '2015-05-03 11:15:46', '黑龙江省齐齐哈尔市昂昂溪区', '1', '4.2.2.230205', '1', '4', '昂昂溪区', '5', 'AAXQ', null, '003023002005', null);
INSERT INTO `pa_bmzd` VALUES ('0704CE4961AF45B68AD68FFF4233E396', '2015-05-03 11:15:46', '河北省邢台市新河县', '1', '4.2.2.130530', '1', '4', '新河县', '30', 'XHX', null, '003013005030', null);
INSERT INTO `pa_bmzd` VALUES ('07080A4C041049579AC1B8FED3E2D938', '2015-05-03 11:15:46', '辽宁省朝阳市双塔区', '1', '4.2.2.211302', '1', '4', '双塔区', '2', 'STQ', null, '003021013002', null);
INSERT INTO `pa_bmzd` VALUES ('0712A966D6F04DFDB6F7045266312399', '2015-05-03 11:15:46', '山东省聊城市高唐县', '1', '4.2.2.371526', '1', '4', '高唐县', '26', 'GTX', null, '003037015026', null);
INSERT INTO `pa_bmzd` VALUES ('07172E05007B4A908FBDD565EFE5BE8F', '2015-05-03 11:15:46', '山西省临汾市曲沃县', '1', '4.2.2.141021', '1', '4', '曲沃县', '21', 'QWX', null, '003014010021', null);
INSERT INTO `pa_bmzd` VALUES ('072B24A8B4054E2EBA556E982BE9D656', '2015-05-03 11:15:46', '新疆维吾尔自治区昌吉回族自治州昌吉市', '1', '4.2.2.652301', '1', '4', '昌吉市', '1', 'CJS', null, '003065023001', null);
INSERT INTO `pa_bmzd` VALUES ('0748129034004D08B104F5EC02635B5B', '2015-05-03 11:15:46', '河南省濮阳市', '1', '4.2.2.410900', '0', '3', '濮阳市', '9', 'PYS', null, '003041009', null);
INSERT INTO `pa_bmzd` VALUES ('074B97F82F5248C99397E52E34A83FD5', '2015-05-03 11:15:46', '江苏省南京市溧水县', '1', '4.2.2.320124', '1', '4', '溧水县', '24', 'LSX', null, '003032001024', null);
INSERT INTO `pa_bmzd` VALUES ('074E660CCD4342A9A841A043796F1F78', '2015-05-03 11:15:46', '山西省忻州市宁武县', '1', '4.2.2.140925', '1', '4', '宁武县', '25', 'NWX', null, '003014009025', null);
INSERT INTO `pa_bmzd` VALUES ('0750E41704514BB392259FDF92BB57AF', '2015-05-03 11:15:46', '广东省揭阳市普宁市', '1', '4.2.2.445281', '1', '4', '普宁市', '81', 'PNS', null, '003044052081', null);
INSERT INTO `pa_bmzd` VALUES ('07630BEE21A14293B878958BCFFFB745', '2015-05-03 11:15:46', '黑龙江省哈尔滨市延寿县', '1', '4.2.2.230129', '1', '4', '延寿县', '29', 'YSX', null, '003023001029', null);
INSERT INTO `pa_bmzd` VALUES ('0784165D83064B4E8A13349FC2AE7BE8', '2015-05-03 11:15:46', '甘肃省张掖市', '1', '4.2.2.620700', '0', '3', '张掖市', '7', 'ZYS', null, '003062007', null);
INSERT INTO `pa_bmzd` VALUES ('07A1824ECCD74685B18BB5B6ABC78993', '2015-05-03 11:15:46', '浙江省绍兴市越城区', '1', '4.2.2.330602', '1', '4', '越城区', '2', 'YCQ', null, '003033006002', null);
INSERT INTO `pa_bmzd` VALUES ('07AD24A0816E409BA3A5713AE6B6E3C5', '2015-05-03 11:15:46', '山西省大同市左云县', '1', '4.2.2.140226', '1', '4', '左云县', '26', 'ZYX', null, '003014002026', null);
INSERT INTO `pa_bmzd` VALUES ('07B159FF0CA34FD0835B0F66EC8C5C2F', '2015-05-03 11:15:46', '重庆市县云阳县', '1', '4.2.2.500235', '1', '4', '云阳县', '35', 'YYX', null, '003050002035', null);
INSERT INTO `pa_bmzd` VALUES ('07B3EF86B5E4458C86FBB9B1D2CAD9CB', '2015-05-03 11:15:46', '江西省九江市修水县', '1', '4.2.2.360424', '1', '4', '修水县', '24', 'XSX', null, '003036004024', null);
INSERT INTO `pa_bmzd` VALUES ('07BE653256424FACBC42E2E02374EC0E', '2015-05-03 11:15:46', '新疆维吾尔自治区和田地区墨玉县', '1', '4.2.2.653222', '1', '4', '墨玉县', '22', 'MYX', null, '003065032022', null);
INSERT INTO `pa_bmzd` VALUES ('07D4CFD1A8B74852A1FE89EC0B2A40F6', '2015-05-03 11:15:46', '广西壮族自治区南宁市隆安县', '1', '4.2.2.450123', '1', '4', '隆安县', '23', 'LAX', null, '003045001023', null);
INSERT INTO `pa_bmzd` VALUES ('07DE8CEF4DFD4AF79CF60B3B6B6A0104', '2015-05-03 11:15:46', '湖北省武汉市武昌区', '1', '4.2.2.420106', '1', '4', '武昌区', '6', 'WCQ', null, '003042001006', null);
INSERT INTO `pa_bmzd` VALUES ('07DEEDDE834F48E0AD639B9B1DCF67B1', '2015-05-03 11:15:46', '黑龙江省齐齐哈尔市龙沙区', '1', '4.2.2.230202', '1', '4', '龙沙区', '2', 'LSQ', null, '003023002002', null);
INSERT INTO `pa_bmzd` VALUES ('080711BC291642C3B8866804E981B7B7', '2015-05-03 11:15:46', '河北省唐山市路北区', '1', '4.2.2.130203', '1', '4', '路北区', '3', 'LBQ', null, '003013002003', null);
INSERT INTO `pa_bmzd` VALUES ('08094980D15847B3807B91AD9A7B28B2', '2015-05-03 11:15:46', '山东省淄博市博山区', '1', '4.2.2.370304', '1', '4', '博山区', '4', 'BSQ', null, '003037003004', null);
INSERT INTO `pa_bmzd` VALUES ('082D4DED68604579809A23829ADEF547', '2015-05-03 11:15:46', '山东省菏泽市曹县', '1', '4.2.2.371721', '1', '4', '曹县', '21', 'CX', null, '003037017021', null);
INSERT INTO `pa_bmzd` VALUES ('083469E9FCF74294A73756E9D894FA26', '2015-05-03 11:15:46', '新疆维吾尔自治区喀什地区麦盖提县', '1', '4.2.2.653127', '1', '4', '麦盖提县', '27', 'MGTX', null, '003065031027', null);
INSERT INTO `pa_bmzd` VALUES ('0841FCA374DA42EB96F8842D2C6FC569', '2015-05-03 11:15:46', '新疆维吾尔自治区巴音郭楞蒙古自治州轮台县', '1', '4.2.2.652822', '1', '4', '轮台县', '22', 'LTX', null, '003065028022', null);
INSERT INTO `pa_bmzd` VALUES ('084968C6E177456FB063932E209BA688', '2015-05-03 11:15:46', '山西省忻州市静乐县', '1', '4.2.2.140926', '1', '4', '静乐县', '26', 'JYX', null, '003014009026', null);
INSERT INTO `pa_bmzd` VALUES ('085F917033BE4E2F9AB069A2EDD55357', '2015-05-03 11:15:46', '云南省昭通市市辖区', '1', '4.2.2.530601', '1', '4', '市辖区', '1', 'SXQ', null, '003053006001', null);
INSERT INTO `pa_bmzd` VALUES ('0861DC1BECC64D368A72AF9A5BC7B501', '2015-05-03 11:15:46', '湖南省邵阳市洞口县', '1', '4.2.2.430525', '1', '4', '洞口县', '25', 'DKX', null, '003043005025', null);
INSERT INTO `pa_bmzd` VALUES ('08A318E5879B44E4A15FF08484299A8F', '2015-05-03 11:15:46', '甘肃省兰州市七里河区', '1', '4.2.2.620103', '1', '4', '七里河区', '3', 'QLHQ', null, '003062001003', null);
INSERT INTO `pa_bmzd` VALUES ('08A671DA412C48F7ABBFC36F19416286', '2015-05-03 11:15:46', '新疆维吾尔自治区哈密地区', '1', '4.2.2.652200', '0', '3', '哈密地区', '22', 'HMDQ', null, '003065022', null);
INSERT INTO `pa_bmzd` VALUES ('08AEF68AAED64FD8A865478E5F2AF127', '2015-05-03 11:15:46', '黑龙江省鸡西市梨树区', '1', '4.2.2.230305', '1', '4', '梨树区', '5', 'LSQ', null, '003023003005', null);
INSERT INTO `pa_bmzd` VALUES ('08C13F11C2BF4E7DA3897925B7DE54FA', '2015-05-03 11:15:46', '广西壮族自治区柳州市市辖区', '1', '4.2.2.450201', '1', '4', '市辖区', '1', 'SXQ', null, '003045002001', null);
INSERT INTO `pa_bmzd` VALUES ('08CAD85936EC4C11A5D4D8ABB1D6362B', '2015-05-03 11:15:46', '河北省张家口市沽源县', '1', '4.2.2.130724', '1', '4', '沽源县', '24', 'GYX', null, '003013007024', null);
INSERT INTO `pa_bmzd` VALUES ('08F6697E7B9347ACB03018E819D37976', '2015-05-03 11:15:46', '辽宁省丹东市振安区', '1', '4.2.2.210604', '1', '4', '振安区', '4', 'ZAQ', null, '003021006004', null);
INSERT INTO `pa_bmzd` VALUES ('090695E6A20E43118521AE2D5E1D4180', '2015-05-03 11:15:46', '广东省梅州市丰顺县', '1', '4.2.2.441423', '1', '4', '丰顺县', '23', 'FSX', null, '003044014023', null);
INSERT INTO `pa_bmzd` VALUES ('09141D2D44A548549480089481230D7F', '2015-05-03 11:15:46', '广西壮族自治区南宁市青秀区', '1', '4.2.2.450103', '1', '4', '青秀区', '3', 'QXQ', null, '003045001003', null);
INSERT INTO `pa_bmzd` VALUES ('0914A76AF5114AD5A839E700898F69E1', '2015-05-03 11:15:46', '重庆市市辖区大渡口区', '1', '4.2.2.500104', '1', '4', '大渡口区', '4', 'DDKQ', null, '003050001004', null);
INSERT INTO `pa_bmzd` VALUES ('0928EACD5BBA4BF291A920FF9F2DE711', '2015-05-03 11:15:46', '云南省临沧市耿马傣族佤族自治县', '1', '4.2.2.530926', '1', '4', '耿马傣族佤族自治县', '26', 'GMDZWZZZX', null, '003053009026', null);
INSERT INTO `pa_bmzd` VALUES ('092E4BF587054552A56FA87BEF73D733', '2015-05-03 11:15:46', '河南省许昌市魏都区', '1', '4.2.2.411002', '1', '4', '魏都区', '2', 'WDQ', null, '003041010002', null);
INSERT INTO `pa_bmzd` VALUES ('0945ACA6BC864074A8911DED24164E73', '2015-05-03 11:15:46', '浙江省嘉兴市秀洲区', '1', '4.2.2.330411', '1', '4', '秀洲区', '11', 'XZQ', null, '003033004011', null);
INSERT INTO `pa_bmzd` VALUES ('0949E75A5D15405182FA340D2CFC29E3', '2015-05-03 11:15:46', '河南省驻马店市驿城区', '1', '4.2.2.411702', '1', '4', '驿城区', '2', 'YCQ', null, '003041017002', null);
INSERT INTO `pa_bmzd` VALUES ('095EB25CACC84E26BADD954B47262112', '2015-05-03 11:15:46', '重庆市市辖区江津区', '1', '4.2.2.500316', '1', '4', '江津区', '16', 'JJQ', null, '003050001016', null);
INSERT INTO `pa_bmzd` VALUES ('0960F83241DE4D48B5F3F011B164ADCA', '2015-05-03 11:15:46', '浙江省温州市平阳县', '1', '4.2.2.330326', '1', '4', '平阳县', '26', 'PYX', null, '003033003026', null);
INSERT INTO `pa_bmzd` VALUES ('0965B0E0AD8848FCB97472CDB773DE14', '2015-05-03 11:15:46', '安徽省宿州市砀山县', '1', '4.2.2.341321', '1', '4', '砀山县', '21', 'DSX', null, '003034013021', null);
INSERT INTO `pa_bmzd` VALUES ('0970874279EE4B5F9B9D6EBC5631715B', '2015-05-03 11:15:46', '内蒙古自治区呼和浩特市托克托县', '1', '4.2.2.150122', '1', '4', '托克托县', '22', 'TKTX', null, '003015001022', null);
INSERT INTO `pa_bmzd` VALUES ('0979E8C825E143A4AB8CFAB833FBB821', '2015-05-03 11:15:46', '河南省周口市', '1', '4.2.2.411600', '0', '3', '周口市', '16', 'ZKS', null, '003041016', null);
INSERT INTO `pa_bmzd` VALUES ('097C87B3377E4347B54385FC978EB14A', '2015-05-03 11:15:46', '广东省湛江市赤坎区', '1', '4.2.2.440802', '1', '4', '赤坎区', '2', 'CKQ', null, '003044008002', null);
INSERT INTO `pa_bmzd` VALUES ('098189328B3B4A8C9C1166410785040D', '2015-05-03 11:15:46', '河北省邯郸市广平县', '1', '4.2.2.130432', '1', '4', '广平县', '32', 'GPX', null, '003013004032', null);
INSERT INTO `pa_bmzd` VALUES ('09926B85391541B1B736B6F65D92E112', '2015-05-03 11:15:46', '宁夏回族自治区银川市贺兰县', '1', '4.2.2.640122', '1', '4', '贺兰县', '22', 'HLX', null, '003064001022', null);
INSERT INTO `pa_bmzd` VALUES ('09A2ECCB9ED840798EAD5D3BBA032883', '2015-05-03 11:15:46', '广东省韶关市始兴县', '1', '4.2.2.440222', '1', '4', '始兴县', '22', 'SXX', null, '003044002022', null);
INSERT INTO `pa_bmzd` VALUES ('09A8A8AE38714F43A07BE005A7A196E1', '2015-05-03 11:15:46', '河南省郑州市登封市', '1', '4.2.2.410185', '1', '4', '登封市', '85', 'DFS', null, '003041001085', null);
INSERT INTO `pa_bmzd` VALUES ('09B857746D8740EDBD9A3DF0E2507C51', '2015-05-03 11:15:46', '湖南省永州市冷水滩区', '1', '4.2.2.431103', '1', '4', '冷水滩区', '3', 'LSTQ', null, '003043011003', null);
INSERT INTO `pa_bmzd` VALUES ('09D118F2BC04456B9C4378EC00CDE648', '2015-05-03 11:15:46', '山东省临沂市兰山区', '1', '4.2.2.371302', '1', '4', '兰山区', '2', 'LSQ', null, '003037013002', null);
INSERT INTO `pa_bmzd` VALUES ('09D60B9E8DB0495D9F8B6E5086B3846A', '2015-05-03 11:15:46', '四川省雅安市名山县', '1', '4.2.2.511821', '1', '4', '名山县', '21', 'MSX', null, '003051018021', null);
INSERT INTO `pa_bmzd` VALUES ('09DEB75D1A144C5284503520534C5C28', '2015-05-03 11:15:46', '山西省临汾市翼城县', '1', '4.2.2.141022', '1', '4', '翼城县', '22', 'YCX', null, '003014010022', null);
INSERT INTO `pa_bmzd` VALUES ('09E5080F70754890B40E9CFBCF6D42B3', '2015-05-03 11:15:46', '四川省凉山彝族自治州西昌市', '1', '4.2.2.513401', '1', '4', '西昌市', '1', 'XCS', null, '003051034001', null);
INSERT INTO `pa_bmzd` VALUES ('09FFAAE65F5748D5B4E79F638D410819', '2015-05-03 11:15:46', '西藏自治区阿里地区革吉县', '1', '4.2.2.542525', '1', '4', '革吉县', '25', 'GJX', null, '003054025025', null);
INSERT INTO `pa_bmzd` VALUES ('0A06B21B8ED84B8C942224CDBD1BA26A', '2015-05-03 11:15:46', '广西壮族自治区梧州市蒙山县', '1', '4.2.2.450423', '1', '4', '蒙山县', '23', 'MSX', null, '003045004023', null);
INSERT INTO `pa_bmzd` VALUES ('0A30F475AA9343B2872E693DEA2982F7', '2015-05-03 11:15:46', '四川省阿坝藏族羌族自治州理县', '1', '4.2.2.513222', '1', '4', '理县', '22', 'LX', null, '003051032022', null);
INSERT INTO `pa_bmzd` VALUES ('0A3103DEEDA4405CB4711C3B3CCCA788', '2015-05-03 11:15:46', '江西省南昌市西湖区', '1', '4.2.2.360103', '1', '4', '西湖区', '3', 'XHQ', null, '003036001003', null);
INSERT INTO `pa_bmzd` VALUES ('0A32644E218348D68C647FBA27A91870', '2015-05-03 11:15:46', '山东省青岛市李沧区', '1', '4.2.2.370213', '1', '4', '李沧区', '13', 'LCQ', null, '003037002013', null);
INSERT INTO `pa_bmzd` VALUES ('0A5B44EA8B2F4DD399635D8976B9D751', '2015-05-03 11:15:46', '上海市市辖区嘉定区', '1', '4.2.2.310114', '1', '4', '嘉定区', '14', 'JDQ', null, '003031001014', null);
INSERT INTO `pa_bmzd` VALUES ('0A6051693E654B82B000692CCEF0F375', '2015-05-03 11:15:46', '浙江省温州市鹿城区', '1', '4.2.2.330302', '1', '4', '鹿城区', '2', 'LCQ', null, '003033003002', null);
INSERT INTO `pa_bmzd` VALUES ('0A65E61B0F2544B9A0FC6E3A8DED8B69', '2015-05-03 11:15:46', '四川省眉山市彭山县', '1', '4.2.2.511422', '1', '4', '彭山县', '22', 'PSX', null, '003051014022', null);
INSERT INTO `pa_bmzd` VALUES ('0A6AD56576334D078F5A56A1B2FE918C', '2015-05-03 11:15:46', '湖南省邵阳市邵东县', '1', '4.2.2.430521', '1', '4', '邵东县', '21', 'SDX', null, '003043005021', null);
INSERT INTO `pa_bmzd` VALUES ('0A7ABAD233534276B9FDC23F3ACA7725', '2015-05-03 11:15:46', '西藏自治区昌都地区洛隆县', '1', '4.2.2.542132', '1', '4', '洛隆县', '32', 'LLX', null, '003054021032', null);
INSERT INTO `pa_bmzd` VALUES ('0A97F80AAA9A490DB837B9F144D921BB', '2015-05-03 11:15:46', '广西壮族自治区河池市东兰县', '1', '4.2.2.451224', '1', '4', '东兰县', '24', 'DLX', null, '003045012024', null);
INSERT INTO `pa_bmzd` VALUES ('0AA3A0034ABD4CC69CD839760A8853B7', '2015-05-03 11:15:46', '山东省烟台市栖霞市', '1', '4.2.2.370686', '1', '4', '栖霞市', '86', 'XXS', null, '003037006086', null);
INSERT INTO `pa_bmzd` VALUES ('0AB8C9B9E7D446CC95AE2FF70B9F29A8', '2015-05-03 11:15:46', '安徽省马鞍山市', '1', '4.2.2.340500', '0', '3', '马鞍山市', '5', 'MASS', null, '003034005', null);
INSERT INTO `pa_bmzd` VALUES ('0AD24FEFAB094766938F848B9A45649B', '2015-05-03 11:15:46', '辽宁省本溪市桓仁满族自治县', '1', '4.2.2.210522', '1', '4', '桓仁满族自治县', '22', 'HRMZZZX', null, '003021005022', null);
INSERT INTO `pa_bmzd` VALUES ('0AD5EC037FD64376AE990C10C234A130', '2015-05-03 11:15:46', '贵州省黔南布依族苗族自治州独山县', '1', '4.2.2.522726', '1', '4', '独山县', '26', 'DSX', null, '003052027026', null);
INSERT INTO `pa_bmzd` VALUES ('0ADDE50279F84C3E9B7A83E9A6ED0948', '2015-05-03 11:15:46', '福建省漳州市市辖区', '1', '4.2.2.350601', '1', '4', '市辖区', '1', 'SXQ', null, '003035006001', null);
INSERT INTO `pa_bmzd` VALUES ('0AF4D46D29AF4A12BDD896F30F9FBFD7', '2015-05-03 11:15:46', '黑龙江省七台河市', '1', '4.2.2.230900', '0', '3', '七台河市', '9', 'QTHS', null, '003023009', null);
INSERT INTO `pa_bmzd` VALUES ('0B010EA903064879A6DD62202791E692', '2015-05-03 11:15:46', '广东省河源市东源县', '1', '4.2.2.441625', '1', '4', '东源县', '25', 'DYX', null, '003044016025', null);
INSERT INTO `pa_bmzd` VALUES ('0B14643DB8AE4DA7B87169A3CDD25C6E', '2015-05-03 11:15:46', '广西壮族自治区百色市德保县', '1', '4.2.2.451024', '1', '4', '德保县', '24', 'DBX', null, '003045010024', null);
INSERT INTO `pa_bmzd` VALUES ('0B1FC948209A40AD9663A9309D3DAB7D', '2015-05-03 11:15:46', '河南省信阳市潢川县', '1', '4.2.2.411526', '1', '4', '潢川县', '26', 'HCX', null, '003041015026', null);
INSERT INTO `pa_bmzd` VALUES ('0B261B7F342245298DA8FE5FF07E7960', '2015-05-03 11:15:46', '天津市县', '1', '4.2.2.120200', '0', '3', '县', '2', 'X', null, '003012002', null);
INSERT INTO `pa_bmzd` VALUES ('0B2E7CCA14B64EC1B6BBBA923DA17739', '2015-05-03 11:15:46', '新疆维吾尔自治区塔城地区裕民县', '1', '4.2.2.654225', '1', '4', '裕民县', '25', 'YMX', null, '003065042025', null);
INSERT INTO `pa_bmzd` VALUES ('0B66B81A3CC347A6BBAE5802A62D2E0E', '2015-05-03 11:15:46', '湖北省孝感市大悟县', '1', '4.2.2.420922', '1', '4', '大悟县', '22', 'DWX', null, '003042009022', null);
INSERT INTO `pa_bmzd` VALUES ('0B82B5CA30244F55A82CFD0B5A0762FC', '2015-05-03 11:15:46', '陕西省咸阳市乾县', '1', '4.2.2.610424', '1', '4', '乾县', '24', 'QX', null, '003061004024', null);
INSERT INTO `pa_bmzd` VALUES ('0B8FB52419184179B7822385B9AD02B3', '2015-05-03 11:15:46', '西藏自治区日喀则地区昂仁县', '1', '4.2.2.542327', '1', '4', '昂仁县', '27', 'ARX', null, '003054023027', null);
INSERT INTO `pa_bmzd` VALUES ('0B92ECA390DA4D089F05FBB3A0F0A62C', '2015-05-03 11:15:46', '河北省邯郸市馆陶县', '1', '4.2.2.130433', '1', '4', '馆陶县', '33', 'GYX', null, '003013004033', null);
INSERT INTO `pa_bmzd` VALUES ('0B969C4CA07B4052ADFB43E920E66C49', '2015-05-03 11:15:46', '广东省佛山市顺德区', '1', '4.2.2.440606', '1', '4', '顺德区', '6', 'SDQ', null, '003044006006', null);
INSERT INTO `pa_bmzd` VALUES ('0B9DDBEB555E4E378B259EF0CB1EB09E', '2015-05-03 11:15:46', '云南省普洱市宁洱哈尼族彝族自治县', '1', '4.2.2.530821', '1', '4', '宁洱哈尼族彝族自治县', '21', 'NEHNZYZZZX', null, '003053008021', null);
INSERT INTO `pa_bmzd` VALUES ('0B9ED1833ED04B5A9FB91B6E9E0582BB', '2015-05-03 11:15:46', '山东省济宁市', '1', '4.2.2.370800', '0', '3', '济宁市', '8', 'JNS', null, '003037008', null);
INSERT INTO `pa_bmzd` VALUES ('0BCCB75B0F64421B8F1EC07D87DF9228', '2015-05-03 11:15:46', '福建省三明市泰宁县', '1', '4.2.2.350429', '1', '4', '泰宁县', '29', 'TNX', null, '003035004029', null);
INSERT INTO `pa_bmzd` VALUES ('0BE9B06D4858486DBC4964780C8E4AEE', '2015-05-03 11:15:46', '河北省廊坊市', '1', '4.2.2.131000', '0', '3', '廊坊市', '10', 'LFS', null, '003013010', null);
INSERT INTO `pa_bmzd` VALUES ('0BEB3601A5D746FEAEF1C4FC25444330', '2015-05-03 11:15:46', '广东省梅州市', '1', '4.2.2.441400', '0', '3', '梅州市', '14', 'MZS', null, '003044014', null);
INSERT INTO `pa_bmzd` VALUES ('0C15EA11BDCB4476BD238F1E2B78C0F7', '2015-05-03 11:15:46', '甘肃省酒泉市市辖区', '1', '4.2.2.620901', '1', '4', '市辖区', '1', 'SXQ', null, '003062009001', null);
INSERT INTO `pa_bmzd` VALUES ('0C3932D5300F4C84A97FB881333B2972', '2015-05-03 11:15:46', '新疆维吾尔自治区自治区直辖县级行政区划图木舒克市', '1', '4.2.2.659003', '1', '4', '图木舒克市', '3', 'TMSKS', null, '003065090003', null);
INSERT INTO `pa_bmzd` VALUES ('0C4AB04B0D464F74B895D012FA488CC9', '2015-05-03 11:15:46', '江苏省南通市', '1', '4.2.2.320600', '0', '3', '南通市', '6', 'NTS', null, '003032006', null);
INSERT INTO `pa_bmzd` VALUES ('0C62B3F5E5A64416B52BEAB9C95053D8', '2015-05-03 11:15:46', '江苏省泰州市靖江市', '1', '4.2.2.321282', '1', '4', '靖江市', '82', 'JJS', null, '003032012082', null);
INSERT INTO `pa_bmzd` VALUES ('0C8256A72B5943D791D3C75F74AF08D7', '2015-05-03 11:15:46', '陕西省榆林市吴堡县', '1', '4.2.2.610829', '1', '4', '吴堡县', '29', 'WPX', null, '003061008029', null);
INSERT INTO `pa_bmzd` VALUES ('0C84F13957634BBDAA2F030C46F648AA', '2015-05-03 11:15:46', '山东省济宁市曲阜市', '1', '4.2.2.370881', '1', '4', '曲阜市', '81', 'QFS', null, '003037008081', null);
INSERT INTO `pa_bmzd` VALUES ('0C9298770D504E9B9E157803EED5A83B', '2015-05-03 11:15:46', '安徽省池州市贵池区', '1', '4.2.2.341702', '1', '4', '贵池区', '2', 'GCQ', null, '003034017002', null);
INSERT INTO `pa_bmzd` VALUES ('0C980E5F78234090A57AA0D104895F07', '2015-05-03 11:15:46', '河南省周口市沈丘县', '1', '4.2.2.411624', '1', '4', '沈丘县', '24', 'SQX', null, '003041016024', null);
INSERT INTO `pa_bmzd` VALUES ('0C999496C18B417AB9E8FEA0BD8DD1BC', '2015-05-03 11:15:46', '福建省龙岩市连城县', '1', '4.2.2.350825', '1', '4', '连城县', '25', 'LCX', null, '003035008025', null);
INSERT INTO `pa_bmzd` VALUES ('0CAC48918006425EA33981175650B608', '2015-05-03 11:15:46', '陕西省铜川市印台区', '1', '4.2.2.610203', '1', '4', '印台区', '3', 'YTQ', null, '003061002003', null);
INSERT INTO `pa_bmzd` VALUES ('0CE0B482CB0B436A941964903FDF52CC', '2015-05-03 11:15:46', '福建省福州市连江县', '1', '4.2.2.350122', '1', '4', '连江县', '22', 'LJX', null, '003035001022', null);
INSERT INTO `pa_bmzd` VALUES ('0CE240D86AB046CA8765551B7431B59F', '2015-05-03 11:15:46', '湖北省随州市', '1', '4.2.2.421300', '0', '3', '随州市', '13', 'SZS', null, '003042013', null);
INSERT INTO `pa_bmzd` VALUES ('0CFCBDF041904738BE901A4A2B26ADC8', '2015-05-03 11:15:46', '安徽省宿州市埇桥区', '1', '4.2.2.341302', '1', '4', '埇桥区', '2', 'YQQ', null, '003034013002', null);
INSERT INTO `pa_bmzd` VALUES ('0D02422DC0CC43E291D088295A5D146F', '2015-05-03 11:15:46', '河南省鹤壁市浚县', '1', '4.2.2.410621', '1', '4', '浚县', '21', 'XX', null, '003041006021', null);
INSERT INTO `pa_bmzd` VALUES ('0D0B7D394C5643C4B7171C9448B4BB10', '2015-05-03 11:15:46', '北京市市辖区昌平区', '1', '4.2.2.110114', '1', '4', '昌平区', '14', 'CPQ', null, '003011001014', null);
INSERT INTO `pa_bmzd` VALUES ('0D1278D7923844E6B462E9340CBFD664', '2015-05-03 11:15:46', '甘肃省临夏回族自治州康乐县', '1', '4.2.2.622922', '1', '4', '康乐县', '22', 'KYX', null, '003062029022', null);
INSERT INTO `pa_bmzd` VALUES ('0D1C0A0EFE3D4817BEB2B752E035D4CC', '2015-05-03 11:15:46', '宁夏回族自治区中卫市海原县', '1', '4.2.2.640522', '1', '4', '海原县', '22', 'HYX', null, '003064005022', null);
INSERT INTO `pa_bmzd` VALUES ('0D236EE6EFE34236ADFD30E66C7F57CC', '2015-05-03 11:15:46', '广东省珠海市', '1', '4.2.2.440400', '0', '3', '珠海市', '4', 'ZHS', null, '003044004', null);
INSERT INTO `pa_bmzd` VALUES ('0D2C36F3BCBF460181939438E22E07B2', '2015-05-03 11:15:46', '黑龙江省齐齐哈尔市碾子山区', '1', '4.2.2.230207', '1', '4', '碾子山区', '7', 'NZSQ', null, '003023002007', null);
INSERT INTO `pa_bmzd` VALUES ('0D589A9695F040A2A04DB7305155F666', '2015-05-03 11:15:46', '吉林省', '1', '4.2.2.220000', '0', '2', '吉林省', '22', 'JLS', null, '003022', null);
INSERT INTO `pa_bmzd` VALUES ('0D635A45C2214C0CB7A4E7E69336F693', '2015-05-03 11:15:46', '河南省平顶山市', '1', '4.2.2.410400', '0', '3', '平顶山市', '4', 'PDSS', null, '003041004', null);
INSERT INTO `pa_bmzd` VALUES ('0D76C1CA8F6F4088BABC55311F5A9C8E', '2015-05-03 11:15:46', '广东省肇庆市怀集县', '1', '4.2.2.441224', '1', '4', '怀集县', '24', 'HJX', null, '003044012024', null);
INSERT INTO `pa_bmzd` VALUES ('0D9B29B5492D4AB49BC23FC9E2CC048A', '2015-05-03 11:15:46', '天津市市辖区东丽区', '1', '4.2.2.120110', '1', '4', '东丽区', '10', 'DLQ', null, '003012001010', null);
INSERT INTO `pa_bmzd` VALUES ('0DAA050CDF8042A3901D5A20680152F0', '2015-05-03 11:15:46', '安徽省宣城市郎溪县', '1', '4.2.2.341821', '1', '4', '郎溪县', '21', 'LXX', null, '003034018021', null);
INSERT INTO `pa_bmzd` VALUES ('0DC85E11D841496CBFC8DB12FE5D0BA7', '2015-05-03 11:15:46', '四川省成都市新津县', '1', '4.2.2.510132', '1', '4', '新津县', '32', 'XJX', null, '003051001032', null);
INSERT INTO `pa_bmzd` VALUES ('0DD09D05A20443E2A80EEB2AD19C5CC4', '2015-05-03 11:15:46', '四川省眉山市青神县', '1', '4.2.2.511425', '1', '4', '青神县', '25', 'QSX', null, '003051014025', null);
INSERT INTO `pa_bmzd` VALUES ('0DFC04A909894E808637DCE29B26313E', '2015-05-03 11:15:46', '河北省秦皇岛市海港区', '1', '4.2.2.130302', '1', '4', '海港区', '2', 'HGQ', null, '003013003002', null);
INSERT INTO `pa_bmzd` VALUES ('0E007FAB784E48F39F26552BDA6D6E2E', '2015-05-03 11:15:46', '河北省秦皇岛市山海关区', '1', '4.2.2.130303', '1', '4', '山海关区', '3', 'SHGQ', null, '003013003003', null);
INSERT INTO `pa_bmzd` VALUES ('0E248D7BBE5D4404BAA7D5F968F215FB', '2015-05-03 11:15:46', '湖南省常德市市辖区', '1', '4.2.2.430701', '1', '4', '市辖区', '1', 'SXQ', null, '003043007001', null);
INSERT INTO `pa_bmzd` VALUES ('0E31A38E4B6547D492BC876E2DE444DF', '2015-05-03 11:15:46', '内蒙古自治区呼伦贝尔市满洲里市', '1', '4.2.2.150781', '1', '4', '满洲里市', '81', 'MZLS', null, '003015007081', null);
INSERT INTO `pa_bmzd` VALUES ('0E3C54D8415E460C8F3450B49689CC7B', '2015-05-03 11:15:46', '黑龙江省双鸭山市', '1', '4.2.2.230500', '0', '3', '双鸭山市', '5', 'SYSS', null, '003023005', null);
INSERT INTO `pa_bmzd` VALUES ('0E66B9CEAF4F4B7CB6E01268A141C63F', '2015-05-03 11:15:46', '山西省晋中市榆社县', '1', '4.2.2.140721', '1', '4', '榆社县', '21', 'YSX', null, '003014007021', null);
INSERT INTO `pa_bmzd` VALUES ('0E69D0238F8E46E995FD7C7876D8098C', '2015-05-03 11:15:46', '四川省宜宾市翠屏区', '1', '4.2.2.511502', '1', '4', '翠屏区', '2', 'CPQ', null, '003051015002', null);
INSERT INTO `pa_bmzd` VALUES ('0E73D033C0CA4E4DAEDB7344D2C1900B', '2015-05-03 11:15:46', '山西省临汾市尧都区', '1', '4.2.2.141002', '1', '4', '尧都区', '2', 'YDQ', null, '003014010002', null);
INSERT INTO `pa_bmzd` VALUES ('0E78F561EC084E6EBC6610F1B15D2238', '2015-05-03 11:15:46', '江苏省徐州市', '1', '4.2.2.320300', '0', '3', '徐州市', '3', 'XZS', null, '003032003', null);
INSERT INTO `pa_bmzd` VALUES ('0E8F16010EA14668BCCC86353E276947', '2015-05-03 11:15:46', '广东省湛江市遂溪县', '1', '4.2.2.440823', '1', '4', '遂溪县', '23', 'SXX', null, '003044008023', null);
INSERT INTO `pa_bmzd` VALUES ('0E8FF2E984734E678C550B960719A429', '2015-05-03 11:15:46', '甘肃省定西市临洮县', '1', '4.2.2.621124', '1', '4', '临洮县', '24', 'LTX', null, '003062011024', null);
INSERT INTO `pa_bmzd` VALUES ('0E937B6F0E784F8EA50F9685EDEFA3A7', '2015-05-03 11:15:46', '河北省邢台市邢台县', '1', '4.2.2.130521', '1', '4', '邢台县', '21', 'XTX', null, '003013005021', null);
INSERT INTO `pa_bmzd` VALUES ('0EF050763A2D49FA9B2CF3B25593D3E2', '2015-05-03 11:15:46', '云南省保山市龙陵县', '1', '4.2.2.530523', '1', '4', '龙陵县', '23', 'LLX', null, '003053005023', null);
INSERT INTO `pa_bmzd` VALUES ('0EF1935D5BED4CC1A1B9DCEB3A8E3494', '2015-05-03 11:15:46', '陕西省西安市蓝田县', '1', '4.2.2.610122', '1', '4', '蓝田县', '22', 'LTX', null, '003061001022', null);
INSERT INTO `pa_bmzd` VALUES ('0F0031CFC5E24190818BA8523BF53B4E', '2015-05-03 11:15:46', '福建省宁德市周宁县', '1', '4.2.2.350925', '1', '4', '周宁县', '25', 'ZNX', null, '003035009025', null);
INSERT INTO `pa_bmzd` VALUES ('0F00CF0C75CB4901906AF58B0F390338', '2015-05-03 11:15:46', '云南省玉溪市江川县', '1', '4.2.2.530421', '1', '4', '江川县', '21', 'JCX', null, '003053004021', null);
INSERT INTO `pa_bmzd` VALUES ('0F134A3A72194CF5BD53CEFEFC0FC65F', '2015-05-03 11:15:46', '河南省新乡市卫辉市', '1', '4.2.2.410781', '1', '4', '卫辉市', '81', 'WHS', null, '003041007081', null);
INSERT INTO `pa_bmzd` VALUES ('0F1DD64418DB4E3BA75E78CD378F8E23', '2015-05-03 11:15:46', '湖南省湘潭市市辖区', '1', '4.2.2.430301', '1', '4', '市辖区', '1', 'SXQ', null, '003043003001', null);
INSERT INTO `pa_bmzd` VALUES ('0F218053055D4D64BD090F3F57CB4BEC', '2015-05-03 11:15:46', '山东省潍坊市奎文区', '1', '4.2.2.370705', '1', '4', '奎文区', '5', 'KWQ', null, '003037007005', null);
INSERT INTO `pa_bmzd` VALUES ('0F2C271455D1484B882647A9E9B84EC7', '2015-05-03 11:15:46', '陕西省榆林市佳县', '1', '4.2.2.610828', '1', '4', '佳县', '28', 'JX', null, '003061008028', null);
INSERT INTO `pa_bmzd` VALUES ('0F3A4050640844FCA6F7B3DE0FF53E42', '2015-05-03 11:15:46', '辽宁省营口市', '1', '4.2.2.210800', '0', '3', '营口市', '8', 'YKS', null, '003021008', null);
INSERT INTO `pa_bmzd` VALUES ('0F40723C431D4EBCACBFFE59E9FE5191', '2015-05-03 11:15:46', '西藏自治区拉萨市堆龙德庆县', '1', '4.2.2.540125', '1', '4', '堆龙德庆县', '25', 'ZLDQX', null, '003054001025', null);
INSERT INTO `pa_bmzd` VALUES ('0F5F63ED7CBD4936B8EC580E1CEC4EA8', '2015-05-03 11:15:46', '重庆市县武隆县', '1', '4.2.2.500232', '1', '4', '武隆县', '32', 'WLX', null, '003050002032', null);
INSERT INTO `pa_bmzd` VALUES ('0F6AB5CD1B154334BF30B4BDE670542F', '2015-05-03 11:15:46', '上海市', '1', '4.2.2.310000', '0', '2', '上海市', '31', 'SHS', null, '003031', null);
INSERT INTO `pa_bmzd` VALUES ('0F988993459D4D25BBBD31CE27B8CDB6', '2015-05-03 11:15:46', '辽宁省大连市中山区', '1', '4.2.2.210202', '1', '4', '中山区', '2', 'ZSQ', null, '003021002002', null);
INSERT INTO `pa_bmzd` VALUES ('0FAA364D5FBA4297A36C8A75929092D6', '2015-05-03 11:15:46', '湖南省怀化市芷江侗族自治县', '1', '4.2.2.431228', '1', '4', '芷江侗族自治县', '28', 'ZJTZZZX', null, '003043012028', null);
INSERT INTO `pa_bmzd` VALUES ('0FAD66EF1D974E408AAEAA61939DCCE0', '2015-05-03 11:15:46', '宁夏回族自治区固原市市辖区', '1', '4.2.2.640401', '1', '4', '市辖区', '1', 'SXQ', null, '003064004001', null);
INSERT INTO `pa_bmzd` VALUES ('0FB07B76304B453695AD455F72B7BF5E', '2015-05-03 11:15:46', '吉林省白山市市辖区', '1', '4.2.2.220601', '1', '4', '市辖区', '1', 'SXQ', null, '003022006001', null);
INSERT INTO `pa_bmzd` VALUES ('0FBFB1B54B254E2E81F2CDF3E5C6E1B3', '2015-05-03 11:15:46', '江西省吉安市新干县', '1', '4.2.2.360824', '1', '4', '新干县', '24', 'XGX', null, '003036008024', null);
INSERT INTO `pa_bmzd` VALUES ('0FC9291E77B3429FAAEF1E91E511142B', '2015-05-03 11:15:46', '辽宁省丹东市振兴区', '1', '4.2.2.210603', '1', '4', '振兴区', '3', 'ZXQ', null, '003021006003', null);
INSERT INTO `pa_bmzd` VALUES ('0FCDCA5C134D4382AC25F83DC678F291', '2015-05-03 11:15:46', '山东省济宁市市中区', '1', '4.2.2.370802', '1', '4', '市中区', '2', 'SZQ', null, '003037008002', null);
INSERT INTO `pa_bmzd` VALUES ('0FEEA230BC6542D0AEECCAC80754165C', '2015-05-03 11:15:46', '山东省日照市市辖区', '1', '4.2.2.371101', '1', '4', '市辖区', '1', 'SXQ', null, '003037011001', null);
INSERT INTO `pa_bmzd` VALUES ('0FFDDE8D83B7440D9F17604A0FB7DA55', '2015-05-03 11:15:46', '贵州省贵阳市花溪区', '1', '4.2.2.520111', '1', '4', '花溪区', '11', 'HXQ', null, '003052001011', null);
INSERT INTO `pa_bmzd` VALUES ('10111867463C49F29588E2CF5852176D', '2015-05-03 11:15:46', '江西省赣州市石城县', '1', '4.2.2.360735', '1', '4', '石城县', '35', 'SCX', null, '003036007035', null);
INSERT INTO `pa_bmzd` VALUES ('101396F089AB49E78B90FB3F54FAB894', '2015-05-03 11:15:46', '广东省韶关市曲江区', '1', '4.2.2.440205', '1', '4', '曲江区', '5', 'QJQ', null, '003044002005', null);
INSERT INTO `pa_bmzd` VALUES ('10146490CC724217AD639A5D6C6642E7', '2015-05-03 11:15:46', '山东省德州市临邑县', '1', '4.2.2.371424', '1', '4', '临邑县', '24', 'LYX', null, '003037014024', null);
INSERT INTO `pa_bmzd` VALUES ('1045EDD43A3C45F1A1D0E035360AF06C', '2015-05-03 11:15:46', '安徽省滁州市凤阳县', '1', '4.2.2.341126', '1', '4', '凤阳县', '26', 'FYX', null, '003034011026', null);
INSERT INTO `pa_bmzd` VALUES ('104889ED8FE44ED9A280A3F7FA8B2A69', '2015-05-03 11:15:46', '湖北省武汉市江汉区', '1', '4.2.2.420103', '1', '4', '江汉区', '3', 'JHQ', null, '003042001003', null);
INSERT INTO `pa_bmzd` VALUES ('108537E27717447687FE7B8340EDDF00', '2015-05-03 11:15:46', '河南省漯河市舞阳县', '1', '4.2.2.411121', '1', '4', '舞阳县', '21', 'WYX', null, '003041011021', null);
INSERT INTO `pa_bmzd` VALUES ('1086561210414BC58C787FE01D00132A', '2015-05-03 11:15:46', '吉林省松原市扶余县', '1', '4.2.2.220724', '1', '4', '扶余县', '24', 'FYX', null, '003022007024', null);
INSERT INTO `pa_bmzd` VALUES ('1087028C4AD2478286438155AA276262', '2015-05-03 11:15:46', '浙江省丽水市', '1', '4.2.2.331100', '0', '3', '丽水市', '11', 'LSS', null, '003033011', null);
INSERT INTO `pa_bmzd` VALUES ('1087728A5D00417A97551725FF582C7C', '2015-05-03 11:15:46', '湖北省荆州市荆州区', '1', '4.2.2.421003', '1', '4', '荆州区', '3', 'JZQ', null, '003042010003', null);
INSERT INTO `pa_bmzd` VALUES ('108AB9873F64471890E9601D81BEF097', '2015-05-03 11:15:46', '贵州省黔东南苗族侗族自治州', '1', '4.2.2.522600', '0', '3', '黔东南苗族侗族自治州', '26', 'QDNMZTZZZZ', null, '003052026', null);
INSERT INTO `pa_bmzd` VALUES ('10B5EBEE03E14C6D91284CF27D4F6E23', '2015-05-03 11:15:46', '海南省海口市', '1', '4.2.2.460100', '0', '3', '海口市', '1', 'HKS', null, '003046001', null);
INSERT INTO `pa_bmzd` VALUES ('10DC2AB1CD444BAB8D0A93545F9CEA47', '2015-05-03 11:15:46', '河南省省直辖县级行政区划济源市', '1', '4.2.2.419001', '1', '4', '济源市', '1', 'JYS', null, '003041090001', null);
INSERT INTO `pa_bmzd` VALUES ('10F442A396AE499EBD854FE059F8FAB1', '2015-05-03 11:15:46', '陕西省延安市宝塔区', '1', '4.2.2.610602', '1', '4', '宝塔区', '2', 'BTQ', null, '003061006002', null);
INSERT INTO `pa_bmzd` VALUES ('1105988BC30D4A91894345506B99CFB4', '2015-05-03 11:15:46', '贵州省黔西南布依族苗族自治州安龙县', '1', '4.2.2.522328', '1', '4', '安龙县', '28', 'ALX', null, '003052023028', null);
INSERT INTO `pa_bmzd` VALUES ('11287851C1164219967E04E17C989B26', '2015-05-03 11:15:46', '广西壮族自治区百色市右江区', '1', '4.2.2.451002', '1', '4', '右江区', '2', 'YJQ', null, '003045010002', null);
INSERT INTO `pa_bmzd` VALUES ('113EF7D9CBC04674AC782748EA075942', '2015-05-03 11:15:46', '海南省省直辖县级行政区划琼海市', '1', '4.2.2.469002', '1', '4', '琼海市', '2', 'QHS', null, '003046090002', null);
INSERT INTO `pa_bmzd` VALUES ('1147EDCB555A45289F5DBEAB6ACCE4DE', '2015-05-03 11:15:46', '山东省烟台市招远市', '1', '4.2.2.370685', '1', '4', '招远市', '85', 'ZYS', null, '003037006085', null);
INSERT INTO `pa_bmzd` VALUES ('114A62BFA35E4BBC87F3D42F2B05A24D', '2015-05-03 11:15:46', '黑龙江省齐齐哈尔市拜泉县', '1', '4.2.2.230231', '1', '4', '拜泉县', '31', 'BQX', null, '003023002031', null);
INSERT INTO `pa_bmzd` VALUES ('11541FDE47664D519C052C15357574B3', '2015-05-03 11:15:46', '陕西省汉中市镇巴县', '1', '4.2.2.610728', '1', '4', '镇巴县', '28', 'ZBX', null, '003061007028', null);
INSERT INTO `pa_bmzd` VALUES ('11586409D0F944C38075DADA58F6AD2C', '2015-05-03 11:15:46', '黑龙江省伊春市上甘岭区', '1', '4.2.2.230716', '1', '4', '上甘岭区', '16', 'SGLQ', null, '003023007016', null);
INSERT INTO `pa_bmzd` VALUES ('116A95A20BC04B2586D826B1478BE4B4', '2015-05-03 11:15:46', '吉林省白山市临江市', '1', '4.2.2.220681', '1', '4', '临江市', '81', 'LJS', null, '003022006081', null);
INSERT INTO `pa_bmzd` VALUES ('117E3D2D35F6410189F5D9421F470AD1', '2015-05-03 11:15:46', '贵州省黔南布依族苗族自治州惠水县', '1', '4.2.2.522731', '1', '4', '惠水县', '31', 'HSX', null, '003052027031', null);
INSERT INTO `pa_bmzd` VALUES ('1196F315854A4279894914C226CD840C', '2015-05-03 11:15:46', '山西省晋中市市辖区', '1', '4.2.2.140701', '1', '4', '市辖区', '1', 'SXQ', null, '003014007001', null);
INSERT INTO `pa_bmzd` VALUES ('119C9D77E72047629CC52C376CF3AD7E', '2015-05-03 11:15:46', '广西壮族自治区桂林市全州县', '1', '4.2.2.450324', '1', '4', '全州县', '24', 'QZX', null, '003045003024', null);
INSERT INTO `pa_bmzd` VALUES ('119DAE827C4442A1A56BB1ADC7CA0000', '2015-05-03 11:15:46', '贵州省遵义市市辖区', '1', '4.2.2.520301', '1', '4', '市辖区', '1', 'SXQ', null, '003052003001', null);
INSERT INTO `pa_bmzd` VALUES ('11A1C3CF4AD5406A945EC0E02C759D5D', '2015-05-03 11:15:46', '山东省德州市夏津县', '1', '4.2.2.371427', '1', '4', '夏津县', '27', 'XJX', null, '003037014027', null);
INSERT INTO `pa_bmzd` VALUES ('11A337F841784373B863965F72EF886B', '2015-05-03 11:15:46', '河北省邯郸市武安市', '1', '4.2.2.130481', '1', '4', '武安市', '81', 'WAS', null, '003013004081', null);
INSERT INTO `pa_bmzd` VALUES ('11A9366DF2934EFC8539990336A9EF50', '2015-05-03 11:15:46', '辽宁省', '1', '4.2.2.210000', '0', '2', '辽宁省', '21', 'LNS', null, '003021', null);
INSERT INTO `pa_bmzd` VALUES ('11CC43AD24604B6DA0934FEB40C3DA29', '2015-05-03 11:15:46', '河北省沧州市献县', '1', '4.2.2.130929', '1', '4', '献县', '29', 'XX', null, '003013009029', null);
INSERT INTO `pa_bmzd` VALUES ('11CEE80E19EC4052B13F57FA4DD39512', '2015-05-03 11:15:46', '甘肃省庆阳市市辖区', '1', '4.2.2.621001', '1', '4', '市辖区', '1', 'SXQ', null, '003062010001', null);
INSERT INTO `pa_bmzd` VALUES ('11ED35548BF7447E8366DD301E57A401', '2015-05-03 11:15:46', '河北省廊坊市市辖区', '1', '4.2.2.131001', '1', '4', '市辖区', '1', 'SXQ', null, '003013010001', null);
INSERT INTO `pa_bmzd` VALUES ('1201FAF03ED14E33B8882255E41C2E5C', '2015-05-03 11:15:46', '云南省普洱市思茅区', '1', '4.2.2.530802', '1', '4', '思茅区', '2', 'SMQ', null, '003053008002', null);
INSERT INTO `pa_bmzd` VALUES ('1203541FAC704812A35DF8E36915C741', '2015-05-03 11:15:46', '安徽省马鞍山市含山县', '1', '4.2.2.340505', '1', '4', '含山县', '22', 'HSX', null, '003034005022', null);
INSERT INTO `pa_bmzd` VALUES ('12076E59D4F349E8A6D9921DB16DB99A', '2015-05-03 11:15:46', '辽宁省鞍山市铁西区', '1', '4.2.2.210303', '1', '4', '铁西区', '3', 'TXQ', null, '003021003003', null);
INSERT INTO `pa_bmzd` VALUES ('120D317CCEC3486E82787FB7EFCE735D', '2015-05-03 11:15:46', '山东省临沂市沂水县', '1', '4.2.2.371323', '1', '4', '沂水县', '23', 'YSX', null, '003037013023', null);
INSERT INTO `pa_bmzd` VALUES ('123A06CC156D4844B6EDA234543E48AD', '2015-05-03 11:15:46', '四川省凉山彝族自治州冕宁县', '1', '4.2.2.513433', '1', '4', '冕宁县', '33', 'MNX', null, '003051034033', null);
INSERT INTO `pa_bmzd` VALUES ('1277ABC015BA4B158B72004ECBB658DB', '2015-05-03 11:15:46', '河南省周口市郸城县', '1', '4.2.2.411625', '1', '4', '郸城县', '25', 'DCX', null, '003041016025', null);
INSERT INTO `pa_bmzd` VALUES ('128B6F5D9A7941A59D290FBA263E4BAC', '2015-05-03 11:15:46', '四川省成都市青白江区', '1', '4.2.2.510113', '1', '4', '青白江区', '13', 'QBJQ', null, '003051001013', null);
INSERT INTO `pa_bmzd` VALUES ('12C8C0DF27AF46FDA7FF663569BE0F73', '2015-05-03 11:15:47', '江苏省镇江市句容市', '1', '4.2.2.321183', '1', '4', '句容市', '83', 'JRS', null, '003032011083', null);
INSERT INTO `pa_bmzd` VALUES ('12E188C2435443519B7AE4DCEB987B8A', '2015-05-03 11:15:47', '辽宁省朝阳市喀喇沁左翼蒙古族自治县', '1', '4.2.2.211324', '1', '4', '喀喇沁左翼蒙古族自治县', '24', 'KLQZYMGZZZX', null, '003021013024', null);
INSERT INTO `pa_bmzd` VALUES ('12E7FE72FB6F4B1AAA0CB74236601B83', '2015-05-03 11:15:47', '河北省邯郸市永年县', '1', '4.2.2.130429', '1', '4', '永年县', '29', 'YNX', null, '003013004029', null);
INSERT INTO `pa_bmzd` VALUES ('12E86D1DDD934D28B483A934A70915E5', '2015-05-03 11:15:47', '山西省临汾市安泽县', '1', '4.2.2.141026', '1', '4', '安泽县', '26', 'AZX', null, '003014010026', null);
INSERT INTO `pa_bmzd` VALUES ('131E7BD7708C4D78950AFBFE75F11830', '2015-05-03 11:15:47', '湖南省岳阳市汨罗市', '1', '4.2.2.430681', '1', '4', '汨罗市', '81', 'MLS', null, '003043006081', null);
INSERT INTO `pa_bmzd` VALUES ('132490D1DE4D4BDC8D812ACFA6D95FA2', '2015-05-03 11:15:47', '河南省许昌市市辖区', '1', '4.2.2.411001', '1', '4', '市辖区', '1', 'SXQ', null, '003041010001', null);
INSERT INTO `pa_bmzd` VALUES ('1341DB8ED95D4E5FBE7091A0109712B7', '2015-05-03 11:15:47', '安徽省蚌埠市固镇县', '1', '4.2.2.340323', '1', '4', '固镇县', '23', 'GZX', null, '003034003023', null);
INSERT INTO `pa_bmzd` VALUES ('1343C3BB9DBB47AAB5EB0C90D7D6AE66', '2015-05-03 11:15:47', '江苏省南京市建邺区', '1', '4.2.2.320105', '1', '4', '建邺区', '5', 'JYQ', null, '003032001005', null);
INSERT INTO `pa_bmzd` VALUES ('134CD7F22DE64E4AA581F729D9943FF7', '2015-05-03 11:15:47', '黑龙江省齐齐哈尔市龙江县', '1', '4.2.2.230221', '1', '4', '龙江县', '21', 'LJX', null, '003023002021', null);
INSERT INTO `pa_bmzd` VALUES ('1355AA1D271C4E75A04B046E55DA5514', '2015-05-03 11:15:47', '山东省威海市荣成市', '1', '4.2.2.371082', '1', '4', '荣成市', '82', 'RCS', null, '003037010082', null);
INSERT INTO `pa_bmzd` VALUES ('1362CF03818C43EE8987CE9DAB6B2D06', '2015-05-03 11:15:47', '山东省青岛市即墨市', '1', '4.2.2.370282', '1', '4', '即墨市', '82', 'JMS', null, '003037002082', null);
INSERT INTO `pa_bmzd` VALUES ('136FAA29D2A944A596787715B979A350', '2015-05-03 11:15:47', '贵州省六盘水市钟山区', '1', '4.2.2.520201', '1', '4', '钟山区', '1', 'ZSQ', null, '003052002001', null);
INSERT INTO `pa_bmzd` VALUES ('13711156C5764EEBB5B5715F455A2A79', '2015-05-03 11:15:47', '广西壮族自治区北海市银海区', '1', '4.2.2.450503', '1', '4', '银海区', '3', 'YHQ', null, '003045005003', null);
INSERT INTO `pa_bmzd` VALUES ('1376AA8DDB57415F9209A2BD23423DD2', '2015-05-03 11:15:47', '西藏自治区拉萨市曲水县', '1', '4.2.2.540124', '1', '4', '曲水县', '24', 'QSX', null, '003054001024', null);
INSERT INTO `pa_bmzd` VALUES ('139354CDC4FB4BD1A3A690A9688B7561', '2015-05-03 11:15:47', '江西省宜春市奉新县', '1', '4.2.2.360921', '1', '4', '奉新县', '21', 'FXX', null, '003036009021', null);
INSERT INTO `pa_bmzd` VALUES ('13995EF964FC4D30B7866F3776DD2844', '2015-05-03 11:15:47', '西藏自治区昌都地区类乌齐县', '1', '4.2.2.542124', '1', '4', '类乌齐县', '24', 'LWQX', null, '003054021024', null);
INSERT INTO `pa_bmzd` VALUES ('1399D03FEEEA4775904BF29EE42F6EFF', '2015-05-03 11:15:47', '广东省中山市', '1', '4.2.2.442000', '1', '3', '中山市', '20', 'ZSS', null, '003044020', null);
INSERT INTO `pa_bmzd` VALUES ('13D28477773F418EAEDE2B559B578FDA', '2015-05-03 11:15:47', '湖南省永州市双牌县', '1', '4.2.2.431123', '1', '4', '双牌县', '23', 'SPX', null, '003043011023', null);
INSERT INTO `pa_bmzd` VALUES ('13D733023E3744AEAC111159DB32F71D', '2015-05-03 11:15:47', '陕西省安康市镇坪县', '1', '4.2.2.610927', '1', '4', '镇坪县', '27', 'ZPX', null, '003061009027', null);
INSERT INTO `pa_bmzd` VALUES ('13EB79F4438443B3B8AED09BDE4D2DC4', '2015-05-03 11:15:47', '山东省青岛市市辖区', '1', '4.2.2.370201', '1', '4', '市辖区', '1', 'SXQ', null, '003037002001', null);
INSERT INTO `pa_bmzd` VALUES ('13ED5146DE314AAA957932A5D93F6A93', '2015-05-03 11:15:47', '河南省濮阳市南乐县', '1', '4.2.2.410923', '1', '4', '南乐县', '23', 'NYX', null, '003041009023', null);
INSERT INTO `pa_bmzd` VALUES ('13FA5B57D60143018D7303293C9696C5', '2015-05-03 11:15:47', '安徽省马鞍山市金家庄区', '1', '4.2.2.340502', '1', '4', '金家庄区', '2', 'JJZQ', null, '003034005002', null);
INSERT INTO `pa_bmzd` VALUES ('13FC897D01B64DC1945A296EADB0AB42', '2015-05-03 11:15:47', '安徽省黄山市黟县', '1', '4.2.2.341023', '1', '4', '黟县', '23', 'YX', null, '003034010023', null);
INSERT INTO `pa_bmzd` VALUES ('141DD7A474384E94B117C5920C4D6311', '2015-05-03 11:15:47', '辽宁省铁岭市铁岭县', '1', '4.2.2.211221', '1', '4', '铁岭县', '21', 'TLX', null, '003021012021', null);
INSERT INTO `pa_bmzd` VALUES ('14252198BCFF40AEB3383C04A92B5691', '2015-05-03 11:15:47', '山东省济宁市梁山县', '1', '4.2.2.370832', '1', '4', '梁山县', '32', 'LSX', null, '003037008032', null);
INSERT INTO `pa_bmzd` VALUES ('14256377463F4A7FBA7D321A5CED39CF', '2015-05-03 11:15:47', '四川省宜宾市', '1', '4.2.2.511500', '0', '3', '宜宾市', '15', 'YBS', null, '003051015', null);
INSERT INTO `pa_bmzd` VALUES ('1433CA6AB50542488E4293A87388BE21', '2015-05-03 11:15:47', '福建省南平市延平区', '1', '4.2.2.350702', '1', '4', '延平区', '2', 'YPQ', null, '003035007002', null);
INSERT INTO `pa_bmzd` VALUES ('14546ADBA60243B2AE529293E25B0A33', '2015-05-03 11:15:47', '福建省泉州市惠安县', '1', '4.2.2.350521', '1', '4', '惠安县', '21', 'HAX', null, '003035005021', null);
INSERT INTO `pa_bmzd` VALUES ('1459AF076B5043B7A29AE50754481E59', '2015-05-03 11:15:47', '黑龙江省伊春市嘉荫县', '1', '4.2.2.230722', '1', '4', '嘉荫县', '22', 'JYX', null, '003023007022', null);
INSERT INTO `pa_bmzd` VALUES ('1462F46149E2447A83C47D3763257AA6', '2015-05-03 11:15:47', '四川省成都市崇州市', '1', '4.2.2.510184', '1', '4', '崇州市', '84', 'CZS', null, '003051001084', null);
INSERT INTO `pa_bmzd` VALUES ('1464382F195B4E5B8902B8AE3614DAC7', '2015-05-03 11:15:47', '浙江省嘉兴市', '1', '4.2.2.330400', '0', '3', '嘉兴市', '4', 'JXS', null, '003033004', null);
INSERT INTO `pa_bmzd` VALUES ('148FB7B213294EBCB46967B8C93F95DA', '2015-05-03 11:15:47', '甘肃省庆阳市庆城县', '1', '4.2.2.621021', '1', '4', '庆城县', '21', 'QCX', null, '003062010021', null);
INSERT INTO `pa_bmzd` VALUES ('14922B2EE8144428A98A8047F876303C', '2015-05-03 11:15:47', '江苏省扬州市仪征市', '1', '4.2.2.321081', '1', '4', '仪征市', '81', 'YZS', null, '003032010081', null);
INSERT INTO `pa_bmzd` VALUES ('14BC5A44AC6E449094D721A3E9C38D06', '2015-05-03 11:15:47', '江苏省南京市浦口区', '1', '4.2.2.320111', '1', '4', '浦口区', '11', 'PKQ', null, '003032001011', null);
INSERT INTO `pa_bmzd` VALUES ('14C7EFD00E7C46FCB4598BC9E294E54E', '2015-05-03 11:15:47', '西藏自治区日喀则地区康马县', '1', '4.2.2.542331', '1', '4', '康马县', '31', 'KMX', null, '003054023031', null);
INSERT INTO `pa_bmzd` VALUES ('14DD681198774BEC834E55AE38CB8E9E', '2015-05-03 11:15:47', '四川省乐山市', '1', '4.2.2.511100', '0', '3', '乐山市', '11', 'YSS', null, '003051011', null);
INSERT INTO `pa_bmzd` VALUES ('14E5816D9D8A497FA94F1335A28D2A7B', '2015-05-03 11:15:47', '黑龙江省哈尔滨市道里区', '1', '4.2.2.230102', '1', '4', '道里区', '2', 'DLQ', null, '003023001002', null);
INSERT INTO `pa_bmzd` VALUES ('14EFFCA0474A4D7C81ED616264E445C7', '2015-05-03 11:15:47', '甘肃省嘉峪关市', '1', '4.2.2.620200', '0', '3', '嘉峪关市', '2', 'JYGS', null, '003062002', null);
INSERT INTO `pa_bmzd` VALUES ('14F91EAE86964481B754DBCAE720B777', '2015-05-03 11:15:47', '甘肃省武威市凉州区', '1', '4.2.2.620602', '1', '4', '凉州区', '2', 'LZQ', null, '003062006002', null);
INSERT INTO `pa_bmzd` VALUES ('150FB9FCA56341599BF7D07BF782DC55', '2015-05-03 11:15:47', '安徽省亳州市市辖区', '1', '4.2.2.341601', '1', '4', '市辖区', '1', 'SXQ', null, '003034016001', null);
INSERT INTO `pa_bmzd` VALUES ('1528D368FC3642A5B776ABF5AD72828D', '2015-05-03 11:15:47', '黑龙江省伊春市翠峦区', '1', '4.2.2.230706', '1', '4', '翠峦区', '6', 'CLQ', null, '003023007006', null);
INSERT INTO `pa_bmzd` VALUES ('154169C1A2D44EA59FC9F1F7E0E426C6', '2015-05-03 11:15:47', '山西省临汾市永和县', '1', '4.2.2.141032', '1', '4', '永和县', '32', 'YHX', null, '003014010032', null);
INSERT INTO `pa_bmzd` VALUES ('15507EFE09284E26A7B177D7C4F72DEE', '2015-05-03 11:15:47', '宁夏回族自治区中卫市', '1', '4.2.2.640500', '0', '3', '中卫市', '5', 'ZWS', null, '003064005', null);
INSERT INTO `pa_bmzd` VALUES ('159A9F09B52A434BBD68F80402D88650', '2015-05-03 11:15:47', '江西省九江市都昌县', '1', '4.2.2.360428', '1', '4', '都昌县', '28', 'DCX', null, '003036004028', null);
INSERT INTO `pa_bmzd` VALUES ('159DCBA6519C41609872E66E038FE052', '2015-05-03 11:15:47', '江西省新余市', '1', '4.2.2.360500', '0', '3', '新余市', '5', 'XYS', null, '003036005', null);
INSERT INTO `pa_bmzd` VALUES ('15AA8FB960454DC3905BC7DCCFB52FDC', '2015-05-03 11:15:47', '黑龙江省佳木斯市桦南县', '1', '4.2.2.230822', '1', '4', '桦南县', '22', 'HNX', null, '003023008022', null);
INSERT INTO `pa_bmzd` VALUES ('15AF9BF2F34B4FE7A8A07E353B266B16', '2015-05-03 11:15:47', '江西省萍乡市芦溪县', '1', '4.2.2.360323', '1', '4', '芦溪县', '23', 'LXX', null, '003036003023', null);
INSERT INTO `pa_bmzd` VALUES ('15B7DEFDF9184AAA915DA6949D7A2CB4', '2015-05-03 11:15:47', '四川省德阳市', '1', '4.2.2.510600', '0', '3', '德阳市', '6', 'DYS', null, '003051006', null);
INSERT INTO `pa_bmzd` VALUES ('15B9B0579C0248B4940A66147050519E', '2015-05-03 11:15:47', '河南省郑州市惠济区', '1', '4.2.2.410108', '1', '4', '惠济区', '8', 'HJQ', null, '003041001008', null);
INSERT INTO `pa_bmzd` VALUES ('15EE7DB6D42B409D860EE88562F5A443', '2015-05-03 11:15:47', '青海省海东地区循化撒拉族自治县', '1', '4.2.2.632128', '1', '4', '循化撒拉族自治县', '28', 'XHSLZZZX', null, '003063021028', null);
INSERT INTO `pa_bmzd` VALUES ('161B888D4D8944C6AFB6F0F74FD80492', '2015-05-03 11:15:47', '江西省抚州市市辖区', '1', '4.2.2.361001', '1', '4', '市辖区', '1', 'SXQ', null, '003036010001', null);
INSERT INTO `pa_bmzd` VALUES ('162B4D5B20364A088534343460E65C32', '2015-05-03 11:15:47', '吉林省白山市抚松县', '1', '4.2.2.220621', '1', '4', '抚松县', '21', 'FSX', null, '003022006021', null);
INSERT INTO `pa_bmzd` VALUES ('164EF8D6E1BA4BDCAA701B00538B4D0C', '2015-05-03 11:15:47', '江西省赣州市龙南县', '1', '4.2.2.360727', '1', '4', '龙南县', '27', 'LNX', null, '003036007027', null);
INSERT INTO `pa_bmzd` VALUES ('1653A675745F41E4AB8061D10850137B', '2015-05-03 11:15:47', '贵州省铜仁市德江县', '1', '4.2.2.522227', '1', '4', '德江县', '26', 'DJX', null, '003052006026', null);
INSERT INTO `pa_bmzd` VALUES ('16AA89FEF3DC42C480344B7A292FAC61', '2015-05-03 11:15:47', '广东省清远市连山壮族瑶族自治县', '1', '4.2.2.441825', '1', '4', '连山壮族瑶族自治县', '25', 'LSZZYZZZX', null, '003044018025', null);
INSERT INTO `pa_bmzd` VALUES ('16B146AA5A8B4340B326E07D447BE2F2', '2015-05-03 11:15:47', '湖南省郴州市汝城县', '1', '4.2.2.431026', '1', '4', '汝城县', '26', 'RCX', null, '003043010026', null);
INSERT INTO `pa_bmzd` VALUES ('16BAE96AD4DB4D878688CC895E542454', '2015-05-03 11:15:47', '云南省曲靖市市辖区', '1', '4.2.2.530301', '1', '4', '市辖区', '1', 'SXQ', null, '003053003001', null);
INSERT INTO `pa_bmzd` VALUES ('16F59176D1864920ABF606AEB39E9756', '2015-05-03 11:15:47', '云南省怒江傈僳族自治州泸水县', '1', '4.2.2.533321', '1', '4', '泸水县', '21', 'LSX', null, '003053033021', null);
INSERT INTO `pa_bmzd` VALUES ('1705C9DE376441B49AF5F00F7C885B3C', '2015-05-03 11:15:47', '青海省海东地区乐都县', '1', '4.2.2.632123', '1', '4', '乐都县', '23', 'YDX', null, '003063021023', null);
INSERT INTO `pa_bmzd` VALUES ('1725EAEA0875420F8CC7FE0C259331CA', '2015-05-03 11:15:47', '甘肃省武威市市辖区', '1', '4.2.2.620601', '1', '4', '市辖区', '1', 'SXQ', null, '003062006001', null);
INSERT INTO `pa_bmzd` VALUES ('17273B64697E4B9591B917525D3526D9', '2015-05-03 11:15:47', '江西省南昌市进贤县', '1', '4.2.2.360124', '1', '4', '进贤县', '24', 'JXX', null, '003036001024', null);
INSERT INTO `pa_bmzd` VALUES ('1740DC92A2D24D98A472FF6C96EAF706', '2015-05-03 11:15:47', '广西壮族自治区贵港市港南区', '1', '4.2.2.450803', '1', '4', '港南区', '3', 'GNQ', null, '003045008003', null);
INSERT INTO `pa_bmzd` VALUES ('174E294E3FD2433885A91B75B10A7F40', '2015-05-03 11:15:47', '湖南省怀化市', '1', '4.2.2.431200', '0', '3', '怀化市', '12', 'HHS', null, '003043012', null);
INSERT INTO `pa_bmzd` VALUES ('176A5C2B225D4504BA4A448F6E0972CC', '2015-05-03 11:15:47', '山西省大同市南郊区', '1', '4.2.2.140211', '1', '4', '南郊区', '11', 'NJQ', null, '003014002011', null);
INSERT INTO `pa_bmzd` VALUES ('17938E33DFCF44EE9E0D0A975AC217F4', '2015-05-03 11:15:47', '广东省阳江市江城区', '1', '4.2.2.441702', '1', '4', '江城区', '2', 'JCQ', null, '003044017002', null);
INSERT INTO `pa_bmzd` VALUES ('1793B50E334D48E58A735767FC6E5E31', '2015-05-03 11:15:47', '福建省三明市宁化县', '1', '4.2.2.350424', '1', '4', '宁化县', '24', 'NHX', null, '003035004024', null);
INSERT INTO `pa_bmzd` VALUES ('17A52FE1734948A1BA61FA9AFE49816D', '2015-05-03 11:15:47', '新疆维吾尔自治区喀什地区伽师县', '1', '4.2.2.653129', '1', '4', '伽师县', '29', 'QSX', null, '003065031029', null);
INSERT INTO `pa_bmzd` VALUES ('17A98ABCD81B46E18126C1484DBCBCB0', '2015-05-03 11:15:47', '江西省宜春市', '1', '4.2.2.360900', '0', '3', '宜春市', '9', 'YCS', null, '003036009', null);
INSERT INTO `pa_bmzd` VALUES ('17B2D40CD9F648728F0A33E0505BF8B8', '2015-05-03 11:15:47', '福建省漳州市龙文区', '1', '4.2.2.350603', '1', '4', '龙文区', '3', 'LWQ', null, '003035006003', null);
INSERT INTO `pa_bmzd` VALUES ('17B9E899DFD64E62B5C3E46B779EB49A', '2015-05-03 11:15:47', '浙江省金华市永康市', '1', '4.2.2.330784', '1', '4', '永康市', '84', 'YKS', null, '003033007084', null);
INSERT INTO `pa_bmzd` VALUES ('17C9ADD32C4E4FA4B9144B022867931B', '2015-05-03 11:15:47', '贵州省毕节市金沙县', '1', '4.2.2.522424', '1', '4', '金沙县', '23', 'JSX', null, '003052005023', null);
INSERT INTO `pa_bmzd` VALUES ('17D9F40C415740968713D78DE7E88C21', '2015-05-03 11:15:47', '黑龙江省哈尔滨市木兰县', '1', '4.2.2.230127', '1', '4', '木兰县', '27', 'MLX', null, '003023001027', null);
INSERT INTO `pa_bmzd` VALUES ('17ED71BC8A634E27A08FD35C44A4D3AE', '2015-05-03 11:15:47', '湖北省宜昌市猇亭区', '1', '4.2.2.420505', '1', '4', '猇亭区', '5', 'XTQ', null, '003042005005', null);
INSERT INTO `pa_bmzd` VALUES ('17F221E6123C47C78D7FC64D684A4086', '2015-05-03 11:15:47', '广西壮族自治区百色市平果县', '1', '4.2.2.451023', '1', '4', '平果县', '23', 'PGX', null, '003045010023', null);
INSERT INTO `pa_bmzd` VALUES ('1800442554B64479AB0BE73887CE1C1C', '2015-05-03 11:15:47', '河北省保定市雄县', '1', '4.2.2.130638', '1', '4', '雄县', '38', 'XX', null, '003013006038', null);
INSERT INTO `pa_bmzd` VALUES ('181E1EDCFB6D435986A1BA4CD2A17BB0', '2015-05-03 11:15:47', '福建省龙岩市永定县', '1', '4.2.2.350822', '1', '4', '永定县', '22', 'YDX', null, '003035008022', null);
INSERT INTO `pa_bmzd` VALUES ('184469DED12B4864847F74716E2EE7DB', '2015-05-03 11:15:47', '山东省菏泽市定陶县', '1', '4.2.2.371727', '1', '4', '定陶县', '27', 'DYX', null, '003037017027', null);
INSERT INTO `pa_bmzd` VALUES ('187493D5F72E4E7096D7B33FE5F161E3', '2015-05-03 11:15:47', '江西省赣州市赣县', '1', '4.2.2.360721', '1', '4', '赣县', '21', 'GX', null, '003036007021', null);
INSERT INTO `pa_bmzd` VALUES ('187D6DEA2AC148108AC2610EC13ABB8F', '2015-05-03 11:15:47', '四川省泸州市叙永县', '1', '4.2.2.510524', '1', '4', '叙永县', '24', 'XYX', null, '003051005024', null);
INSERT INTO `pa_bmzd` VALUES ('188ADA31CCEA424CA1EDBACE0AB9991B', '2015-05-03 11:15:47', '西藏自治区山南地区浪卡子县', '1', '4.2.2.542233', '1', '4', '浪卡子县', '33', 'LQZX', null, '003054022033', null);
INSERT INTO `pa_bmzd` VALUES ('18C3C5F7F48542C4BF45F71DCADC3928', '2015-05-03 11:15:47', '云南省昆明市富民县', '1', '4.2.2.530124', '1', '4', '富民县', '24', 'FMX', null, '003053001024', null);
INSERT INTO `pa_bmzd` VALUES ('18C8CAB7AFA54E36B1BD61719EE76B88', '2015-05-03 11:15:47', '山西省运城市稷山县', '1', '4.2.2.140824', '1', '4', '稷山县', '24', 'JSX', null, '003014008024', null);
INSERT INTO `pa_bmzd` VALUES ('18D5ADB2964A4694A79657D853520D2C', '2015-05-03 11:15:47', '山东省泰安市新泰市', '1', '4.2.2.370982', '1', '4', '新泰市', '82', 'XTS', null, '003037009082', null);
INSERT INTO `pa_bmzd` VALUES ('18DF93113FB8420F8CFC01C137440ED5', '2015-05-03 11:15:47', '山东省济宁市金乡县', '1', '4.2.2.370828', '1', '4', '金乡县', '28', 'JXX', null, '003037008028', null);
INSERT INTO `pa_bmzd` VALUES ('18F1C0B35C1E4A1B94010B188735EA23', '2015-05-03 11:15:47', '河南省濮阳市市辖区', '1', '4.2.2.410901', '1', '4', '市辖区', '1', 'SXQ', null, '003041009001', null);
INSERT INTO `pa_bmzd` VALUES ('18F517491CDB421CBD660CC0F0AD7966', '2015-05-03 11:15:47', '山西省吕梁市文水县', '1', '4.2.2.141121', '1', '4', '文水县', '21', 'WSX', null, '003014011021', null);
INSERT INTO `pa_bmzd` VALUES ('19248F74873D4EFAAA23E53F9F20D981', '2015-05-03 11:15:47', '陕西省安康市岚皋县', '1', '4.2.2.610925', '1', '4', '岚皋县', '25', 'LGX', null, '003061009025', null);
INSERT INTO `pa_bmzd` VALUES ('195A08E501E04CE298F68E07BABB5202', '2015-05-03 11:15:47', '云南省楚雄彝族自治州姚安县', '1', '4.2.2.532325', '1', '4', '姚安县', '25', 'YAX', null, '003053023025', null);
INSERT INTO `pa_bmzd` VALUES ('195B6D00DBF24BBCA316242CF8E18F3C', '2015-05-03 11:15:47', '河北省石家庄市平山县', '1', '4.2.2.130131', '1', '4', '平山县', '31', 'PSX', null, '003013001031', null);
INSERT INTO `pa_bmzd` VALUES ('196D3C5044B643849B454376FC94464F', '2015-05-03 11:15:47', '黑龙江省伊春市乌马河区', '1', '4.2.2.230711', '1', '4', '乌马河区', '11', 'WMHQ', null, '003023007011', null);
INSERT INTO `pa_bmzd` VALUES ('1978221DDBE84F10B16606CDF077BA30', '2015-05-03 11:15:47', '江苏省盐城市阜宁县', '1', '4.2.2.320923', '1', '4', '阜宁县', '23', 'FNX', null, '003032009023', null);
INSERT INTO `pa_bmzd` VALUES ('197EC31C79A74DE3878E685FA9DA889D', '2015-05-03 11:15:47', '四川省阿坝藏族羌族自治州壤塘县', '1', '4.2.2.513230', '1', '4', '壤塘县', '30', 'RTX', null, '003051032030', null);
INSERT INTO `pa_bmzd` VALUES ('198BE461981B401BB0E66F9D56E97720', '2015-05-03 11:15:47', '广西壮族自治区贺州市', '1', '4.2.2.451100', '0', '3', '贺州市', '11', 'HZS', null, '003045011', null);
INSERT INTO `pa_bmzd` VALUES ('19923A427BD948B1BBA9B8B465A8AA52', '2015-05-03 11:15:47', '辽宁省盘锦市大洼县', '1', '4.2.2.211121', '1', '4', '大洼县', '21', 'DWX', null, '003021011021', null);
INSERT INTO `pa_bmzd` VALUES ('19B95422C21B4A1DB88C769CEC8DB50A', '2015-05-03 11:15:47', '云南省普洱市景东彝族自治县', '1', '4.2.2.530823', '1', '4', '景东彝族自治县', '23', 'JDYZZZX', null, '003053008023', null);
INSERT INTO `pa_bmzd` VALUES ('19C2B36BAAA04A76A13068FB11D76FF5', '2015-05-03 11:15:47', '陕西省延安市子长县', '1', '4.2.2.610623', '1', '4', '子长县', '23', 'ZZX', null, '003061006023', null);
INSERT INTO `pa_bmzd` VALUES ('19D1C24780F14622AD74E07EDBA399A0', '2015-05-03 11:15:47', '湖南省郴州市永兴县', '1', '4.2.2.431023', '1', '4', '永兴县', '23', 'YXX', null, '003043010023', null);
INSERT INTO `pa_bmzd` VALUES ('1A03E85B0466484EA5116630A7AB7A13', '2015-05-03 11:15:47', '浙江省杭州市江干区', '1', '4.2.2.330104', '1', '4', '江干区', '4', 'JGQ', null, '003033001004', null);
INSERT INTO `pa_bmzd` VALUES ('1A2C5A7B7DDF43E081250A10CC7BC379', '2015-05-03 11:15:47', '贵州省遵义市习水县', '1', '4.2.2.520330', '1', '4', '习水县', '30', 'XSX', null, '003052003030', null);
INSERT INTO `pa_bmzd` VALUES ('1A473916B95C43CD9569E76AFB505100', '2015-05-03 11:15:47', '山西省大同市阳高县', '1', '4.2.2.140221', '1', '4', '阳高县', '21', 'YGX', null, '003014002021', null);
INSERT INTO `pa_bmzd` VALUES ('1A50E00D58F740DBAE48A831138E0365', '2015-05-03 11:15:47', '四川省绵阳市游仙区', '1', '4.2.2.510704', '1', '4', '游仙区', '4', 'YXQ', null, '003051007004', null);
INSERT INTO `pa_bmzd` VALUES ('1A5A44F189054EE98D2F71494F1802AB', '2015-05-03 11:15:47', '四川省内江市', '1', '4.2.2.511000', '0', '3', '内江市', '10', 'NJS', null, '003051010', null);
INSERT INTO `pa_bmzd` VALUES ('1A5BC97FA12445AE8AD81DE6AAAD8C8B', '2015-05-03 11:15:47', '辽宁省锦州市黑山县', '1', '4.2.2.210726', '1', '4', '黑山县', '26', 'HSX', null, '003021007026', null);
INSERT INTO `pa_bmzd` VALUES ('1A7E8F239BED470FBE3F394C758E9308', '2015-05-03 11:15:47', '河南省平顶山市鲁山县', '1', '4.2.2.410423', '1', '4', '鲁山县', '23', 'LSX', null, '003041004023', null);
INSERT INTO `pa_bmzd` VALUES ('1A83CEB1DCAF49EEB43E069C01B56808', '2015-05-03 11:15:47', '甘肃省天水市清水县', '1', '4.2.2.620521', '1', '4', '清水县', '21', 'QSX', null, '003062005021', null);
INSERT INTO `pa_bmzd` VALUES ('1A86FB24D3094F11B178AD9620C29F7D', '2015-05-03 11:15:47', '湖北省宜昌市点军区', '1', '4.2.2.420504', '1', '4', '点军区', '4', 'DJQ', null, '003042005004', null);
INSERT INTO `pa_bmzd` VALUES ('1A95A76793D146DEB399999280D61A11', '2015-05-03 11:15:47', '浙江省嘉兴市嘉善县', '1', '4.2.2.330421', '1', '4', '嘉善县', '21', 'JSX', null, '003033004021', null);
INSERT INTO `pa_bmzd` VALUES ('1AAB7677ED6E4C1C8C35E72C2936E368', '2015-05-03 11:15:47', '吉林省吉林市龙潭区', '1', '4.2.2.220203', '1', '4', '龙潭区', '3', 'LTQ', null, '003022002003', null);
INSERT INTO `pa_bmzd` VALUES ('1AACB9B2235E4B379ACA1B855267DE0E', '2015-05-03 11:15:47', '山东省青岛市', '1', '4.2.2.370200', '0', '3', '青岛市', '2', 'QDS', null, '003037002', null);
INSERT INTO `pa_bmzd` VALUES ('1AC68E6B9B9743CE877D1E91B9C42C1F', '2015-05-03 11:15:47', '湖南省湘潭市', '1', '4.2.2.430300', '0', '3', '湘潭市', '3', 'XTS', null, '003043003', null);
INSERT INTO `pa_bmzd` VALUES ('1AC74FC8AB814645920D60A155BF6D42', '2015-05-03 11:15:47', '内蒙古自治区包头市固阳县', '1', '4.2.2.150222', '1', '4', '固阳县', '22', 'GYX', null, '003015002022', null);
INSERT INTO `pa_bmzd` VALUES ('1ACA83E22476489E80BD67B71B505574', '2015-05-03 11:15:47', '湖南省益阳市南县', '1', '4.2.2.430921', '1', '4', '南县', '21', 'NX', null, '003043009021', null);
INSERT INTO `pa_bmzd` VALUES ('1AF81D445CB74B92A13743B735CEBA1A', '2015-05-03 11:15:47', '甘肃省兰州市皋兰县', '1', '4.2.2.620122', '1', '4', '皋兰县', '22', 'GLX', null, '003062001022', null);
INSERT INTO `pa_bmzd` VALUES ('1B1AB7C450E346F6A6FC53FC9F50294A', '2015-05-03 11:15:47', '福建省三明市将乐县', '1', '4.2.2.350428', '1', '4', '将乐县', '28', 'QYX', null, '003035004028', null);
INSERT INTO `pa_bmzd` VALUES ('1B381420FF22432980221E7B4E858663', '2015-05-03 11:15:47', '吉林省延边朝鲜族自治州龙井市', '1', '4.2.2.222405', '1', '4', '龙井市', '5', 'LJS', null, '003022024005', null);
INSERT INTO `pa_bmzd` VALUES ('1B396199A13448E4A9EFEE49AE157AA8', '2015-05-03 11:15:47', '广东省韶关市浈江区', '1', '4.2.2.440204', '1', '4', '浈江区', '4', 'ZJQ', null, '003044002004', null);
INSERT INTO `pa_bmzd` VALUES ('1B3F9EEAA0384B02A8F81E505B637011', '2015-05-03 11:15:47', '贵州省贵阳市息烽县', '1', '4.2.2.520122', '1', '4', '息烽县', '22', 'XFX', null, '003052001022', null);
INSERT INTO `pa_bmzd` VALUES ('1B589B414F7B40719E0FEA28A607467F', '2015-05-03 11:15:47', '河北省唐山市迁西县', '1', '4.2.2.130227', '1', '4', '迁西县', '27', 'QXX', null, '003013002027', null);
INSERT INTO `pa_bmzd` VALUES ('1B63C18F00A2478A95C2BE43BD16367E', '2015-05-03 11:15:47', '广西壮族自治区柳州市城中区', '1', '4.2.2.450202', '1', '4', '城中区', '2', 'CZQ', null, '003045002002', null);
INSERT INTO `pa_bmzd` VALUES ('1B8469A5B31541A29C616EF643C12A3D', '2015-05-03 11:15:47', '山东省枣庄市滕州市', '1', '4.2.2.370481', '1', '4', '滕州市', '81', 'TZS', null, '003037004081', null);
INSERT INTO `pa_bmzd` VALUES ('1B885E7D4F114951843DCCE6077663A3', '2015-05-03 11:15:47', '北京市市辖区顺义区', '1', '4.2.2.110113', '1', '4', '顺义区', '13', 'SYQ', null, '003011001013', null);
INSERT INTO `pa_bmzd` VALUES ('1B8C75B16FA34FC3A8A8661D3D0B90E0', '2015-05-03 11:15:47', '江苏省盐城市市辖区', '1', '4.2.2.320901', '1', '4', '市辖区', '1', 'SXQ', null, '003032009001', null);
INSERT INTO `pa_bmzd` VALUES ('1B9A45BC7C824869AC6BF987A6293C3C', '2015-05-03 11:15:47', '湖南省永州市东安县', '1', '4.2.2.431122', '1', '4', '东安县', '22', 'DAX', null, '003043011022', null);
INSERT INTO `pa_bmzd` VALUES ('1BACDDC722BD41CAA8319CBFBD2B54FC', '2015-05-03 11:15:47', '江西省南昌市安义县', '1', '4.2.2.360123', '1', '4', '安义县', '23', 'AYX', null, '003036001023', null);
INSERT INTO `pa_bmzd` VALUES ('1BB533F0358C404995CC1BD17A3488D9', '2015-05-03 11:15:47', '山东省济宁市兖州市', '1', '4.2.2.370882', '1', '4', '兖州市', '82', 'YZS', null, '003037008082', null);
INSERT INTO `pa_bmzd` VALUES ('1BC9CF913A404BC7B3AD7F6E559E1322', '2015-05-03 11:15:47', '贵州省铜仁市市辖区', '1', '4.2.2.522201', '1', '4', '市辖区', '1', 'SXQ', null, '003052006001', null);
INSERT INTO `pa_bmzd` VALUES ('1BFEB0DDE5A142D1B4A32B0F8A4FFB74', '2015-05-03 11:15:47', '新疆维吾尔自治区喀什地区叶城县', '1', '4.2.2.653126', '1', '4', '叶城县', '26', 'YCX', null, '003065031026', null);
INSERT INTO `pa_bmzd` VALUES ('1C058248A4D34A5A8694D382BB9FC372', '2015-05-03 11:15:47', '浙江省', '1', '4.2.2.330000', '0', '2', '浙江省', '33', 'ZJS', null, '003033', null);
INSERT INTO `pa_bmzd` VALUES ('1C123EDA6AF44B63B3E8EFABEC0D312C', '2015-05-03 11:15:47', '内蒙古自治区呼和浩特市玉泉区', '1', '4.2.2.150104', '1', '4', '玉泉区', '4', 'YQQ', null, '003015001004', null);
INSERT INTO `pa_bmzd` VALUES ('1C19D05A7BD8486787E54C9D8EABD63F', '2015-05-03 11:15:47', '广西壮族自治区南宁市上林县', '1', '4.2.2.450125', '1', '4', '上林县', '25', 'SLX', null, '003045001025', null);
INSERT INTO `pa_bmzd` VALUES ('1C21A2A3FC2944B5ACB5EE59BDFB9F42', '2015-05-03 11:15:47', '江苏省南京市市辖区', '1', '4.2.2.320101', '1', '4', '市辖区', '1', 'SXQ', null, '003032001001', null);
INSERT INTO `pa_bmzd` VALUES ('1C24E65E82D54BB490C2F0B34555C177', '2015-05-03 11:15:47', '山东省临沂市蒙阴县', '1', '4.2.2.371328', '1', '4', '蒙阴县', '28', 'MYX', null, '003037013028', null);
INSERT INTO `pa_bmzd` VALUES ('1C28134BBFFC46A7A62097BACB2E4AB9', '2015-05-03 11:15:47', '青海省玉树藏族自治州囊谦县', '1', '4.2.2.632725', '1', '4', '囊谦县', '25', 'NQX', null, '003063027025', null);
INSERT INTO `pa_bmzd` VALUES ('1C3F8CF8E1604BA7858D328E22438EAE', '2015-05-03 11:15:47', '福建省宁德市', '1', '4.2.2.350900', '0', '3', '宁德市', '9', 'NDS', null, '003035009', null);
INSERT INTO `pa_bmzd` VALUES ('1C42A880286941E6AA1E5284656F227F', '2015-05-03 11:15:47', '广西壮族自治区南宁市兴宁区', '1', '4.2.2.450102', '1', '4', '兴宁区', '2', 'XNQ', null, '003045001002', null);
INSERT INTO `pa_bmzd` VALUES ('1C503C8A102B404F890481CEEAA175F6', '2015-05-03 11:15:47', '广西壮族自治区百色市西林县', '1', '4.2.2.451030', '1', '4', '西林县', '30', 'XLX', null, '003045010030', null);
INSERT INTO `pa_bmzd` VALUES ('1CAC9BC917A84E1EB64F20CD60DC50BF', '2015-05-03 11:15:47', '山西省大同市天镇县', '1', '4.2.2.140222', '1', '4', '天镇县', '22', 'TZX', null, '003014002022', null);
INSERT INTO `pa_bmzd` VALUES ('1CAE7FFE71D542A389F6F4FDE5E4873D', '2015-05-03 11:15:47', '吉林省吉林市桦甸市', '1', '4.2.2.220282', '1', '4', '桦甸市', '82', 'HDS', null, '003022002082', null);
INSERT INTO `pa_bmzd` VALUES ('1CB5F97A033F4D55848F477D6C4671E8', '2015-05-03 11:15:47', '浙江省宁波市江东区', '1', '4.2.2.330204', '1', '4', '江东区', '4', 'JDQ', null, '003033002004', null);
INSERT INTO `pa_bmzd` VALUES ('1CD0406B404D4CB785361D262E781488', '2015-05-03 11:15:47', '陕西省商洛市商南县', '1', '4.2.2.611023', '1', '4', '商南县', '23', 'SNX', null, '003061010023', null);
INSERT INTO `pa_bmzd` VALUES ('1CE24AF9A80D4A23A9CAC731D6BD819A', '2015-05-03 11:15:47', '河南省开封市鼓楼区', '1', '4.2.2.410204', '1', '4', '鼓楼区', '4', 'GLQ', null, '003041002004', null);
INSERT INTO `pa_bmzd` VALUES ('1CE394C4C0344709A78045333E1AA853', '2015-05-03 11:15:47', '四川省甘孜藏族自治州道孚县', '1', '4.2.2.513326', '1', '4', '道孚县', '26', 'DFX', null, '003051033026', null);
INSERT INTO `pa_bmzd` VALUES ('1CE3DB15068040249BF24B6F21EF9D69', '2015-05-03 11:15:47', '广西壮族自治区桂林市叠彩区', '1', '4.2.2.450303', '1', '4', '叠彩区', '3', 'DCQ', null, '003045003003', null);
INSERT INTO `pa_bmzd` VALUES ('1CF1BCD33EEC4C3B95651507C17069CE', '2015-05-03 11:15:47', '河南省安阳市安阳县', '1', '4.2.2.410522', '1', '4', '安阳县', '22', 'AYX', null, '003041005022', null);
INSERT INTO `pa_bmzd` VALUES ('1CF2A72B2E2F4DB2A3AF9C127236A381', '2015-05-03 11:15:47', '陕西省咸阳市杨陵区', '1', '4.2.2.610403', '1', '4', '杨陵区', '3', 'YLQ', null, '003061004003', null);
INSERT INTO `pa_bmzd` VALUES ('1CF878BE8976444FA60954F0DDD73E9C', '2015-05-03 11:15:47', '甘肃省白银市靖远县', '1', '4.2.2.620421', '1', '4', '靖远县', '21', 'JYX', null, '003062004021', null);
INSERT INTO `pa_bmzd` VALUES ('1D29B0EE4E5E4A1DA065088B094830D4', '2015-05-03 11:15:47', '安徽省马鞍山市雨山区', '1', '4.2.2.340504', '1', '4', '雨山区', '4', 'YSQ', null, '003034005004', null);
INSERT INTO `pa_bmzd` VALUES ('1D33C503F91648E2B930C992DD590E37', '2015-05-03 11:15:47', '四川省攀枝花市', '1', '4.2.2.510400', '0', '3', '攀枝花市', '4', 'PZHS', null, '003051004', null);
INSERT INTO `pa_bmzd` VALUES ('1D38A81E2C9D4D6DBA45A70AE0CBF2F6', '2015-05-03 11:15:47', '辽宁省沈阳市', '1', '4.2.2.210100', '0', '3', '沈阳市', '1', 'SYS', null, '003021001', null);
INSERT INTO `pa_bmzd` VALUES ('1D5E5E75F2564DD7B03D917E0DD57085', '2015-05-03 11:15:47', '辽宁省抚顺市望花区', '1', '4.2.2.210404', '1', '4', '望花区', '4', 'WHQ', null, '003021004004', null);
INSERT INTO `pa_bmzd` VALUES ('1D7950CFD9024C869742CF219F8C6E6A', '2015-05-03 11:15:47', '黑龙江省佳木斯市富锦市', '1', '4.2.2.230882', '1', '4', '富锦市', '82', 'FJS', null, '003023008082', null);
INSERT INTO `pa_bmzd` VALUES ('1D7AEA879327406AB4017576D938AF6C', '2015-05-03 11:15:47', '黑龙江省牡丹江市穆棱市', '1', '4.2.2.231085', '1', '4', '穆棱市', '85', 'MLS', null, '003023010085', null);
INSERT INTO `pa_bmzd` VALUES ('1D8A8A3E3C8F40E58BDCF847048832E0', '2015-05-03 11:15:47', '湖南省益阳市沅江市', '1', '4.2.2.430981', '1', '4', '沅江市', '81', 'YJS', null, '003043009081', null);
INSERT INTO `pa_bmzd` VALUES ('1D8C08A6DFC4483C924A31B58179FC57', '2015-05-03 11:15:47', '广东省江门市新会区', '1', '4.2.2.440705', '1', '4', '新会区', '5', 'XKQ', null, '003044007005', null);
INSERT INTO `pa_bmzd` VALUES ('1DBAC3BE144C476D8E13D9E674216525', '2015-05-03 11:15:47', '山东省烟台市蓬莱市', '1', '4.2.2.370684', '1', '4', '蓬莱市', '84', 'PLS', null, '003037006084', null);
INSERT INTO `pa_bmzd` VALUES ('1DC027B5AD12451A866507CCBC8FF469', '2015-05-03 11:15:47', '辽宁省辽阳市宏伟区', '1', '4.2.2.211004', '1', '4', '宏伟区', '4', 'HWQ', null, '003021010004', null);
INSERT INTO `pa_bmzd` VALUES ('1DD27886D91E41FB8EB205B991F04C62', '2015-05-03 11:15:47', '广西壮族自治区河池市天峨县', '1', '4.2.2.451222', '1', '4', '天峨县', '22', 'TEX', null, '003045012022', null);
INSERT INTO `pa_bmzd` VALUES ('1DFDAF7A385845C3A6FB5CDAD6B8E648', '2015-05-03 11:15:47', '湖北省孝感市汉川市', '1', '4.2.2.420984', '1', '4', '汉川市', '84', 'HCS', null, '003042009084', null);
INSERT INTO `pa_bmzd` VALUES ('1E051961194040B5A0FBAB25E52AD5BB', '2015-05-03 11:15:47', '河北省衡水市景县', '1', '4.2.2.131127', '1', '4', '景县', '27', 'JX', null, '003013011027', null);
INSERT INTO `pa_bmzd` VALUES ('1E1EEE1DFF1B4688A06A88F7B72726DF', '2015-05-03 11:15:47', '山东省潍坊市寒亭区', '1', '4.2.2.370703', '1', '4', '寒亭区', '3', 'HTQ', null, '003037007003', null);
INSERT INTO `pa_bmzd` VALUES ('1E3E008BFE1D4537BA77F5F837A051D0', '2015-05-03 11:15:47', '新疆维吾尔自治区', '1', '4.2.2.650000', '0', '2', '新疆维吾尔自治区', '65', 'XJWWEZZQ', null, '003065', null);
INSERT INTO `pa_bmzd` VALUES ('1E6E28CCB82F491987C04B9B0D3F04FA', '2015-05-03 11:15:47', '吉林省延边朝鲜族自治州敦化市', '1', '4.2.2.222403', '1', '4', '敦化市', '3', 'DHS', null, '003022024003', null);
INSERT INTO `pa_bmzd` VALUES ('1E80CBCDEF754CFE922F67047FCF7E54', '2015-05-03 11:15:47', '福建省泉州市市辖区', '1', '4.2.2.350501', '1', '4', '市辖区', '1', 'SXQ', null, '003035005001', null);
INSERT INTO `pa_bmzd` VALUES ('1E8677E3970845B59D80B4FC36E346AE', '2015-05-03 11:15:47', '青海省', '1', '4.2.2.630000', '0', '2', '青海省', '63', 'QHS', null, '003063', null);
INSERT INTO `pa_bmzd` VALUES ('1E8B457711ED4C59B5AEFE57F5402933', '2015-05-03 11:15:47', '海南省海口市龙华区', '1', '4.2.2.460106', '1', '4', '龙华区', '6', 'LHQ', null, '003046001006', null);
INSERT INTO `pa_bmzd` VALUES ('1EAFF03B7570403ABB68CA97D0DFAA08', '2015-05-03 11:15:47', '黑龙江省双鸭山市集贤县', '1', '4.2.2.230521', '1', '4', '集贤县', '21', 'JXX', null, '003023005021', null);
INSERT INTO `pa_bmzd` VALUES ('1EB8F7B264004E229B2AD6371DCE1BB3', '2015-05-03 11:15:47', '福建省福州市马尾区', '1', '4.2.2.350105', '1', '4', '马尾区', '5', 'MYQ', null, '003035001005', null);
INSERT INTO `pa_bmzd` VALUES ('1EBDEC2D2B064A469ED5A8A256ACDCBF', '2015-05-03 11:15:47', '湖南省永州市宁远县', '1', '4.2.2.431126', '1', '4', '宁远县', '26', 'NYX', null, '003043011026', null);
INSERT INTO `pa_bmzd` VALUES ('1EC27BA65C6F414694C4A0F0B6BFB089', '2015-05-03 11:15:47', '山西省晋城市泽州县', '1', '4.2.2.140525', '1', '4', '泽州县', '25', 'ZZX', null, '003014005025', null);
INSERT INTO `pa_bmzd` VALUES ('1ED52CB3BEDD4BEFB80535FE69D26271', '2015-05-03 11:15:47', '新疆维吾尔自治区哈密地区哈密市', '1', '4.2.2.652201', '1', '4', '哈密市', '1', 'HMS', null, '003065022001', null);
INSERT INTO `pa_bmzd` VALUES ('1EDE893C857F44D5B0035BCAAC343EE6', '2015-05-03 11:15:47', '黑龙江省鸡西市恒山区', '1', '4.2.2.230303', '1', '4', '恒山区', '3', 'HSQ', null, '003023003003', null);
INSERT INTO `pa_bmzd` VALUES ('1F016B606207431F9B36BBE49BE3FEB3', '2015-05-03 11:15:47', '重庆市市辖区大足区', '1', '4.2.2.500225', '1', '4', '大足区', '11', 'DZQ', null, '003050001011', null);
INSERT INTO `pa_bmzd` VALUES ('1F061EAD434944BE8A17CB5A587129BA', '2015-05-03 11:15:47', '福建省漳州市华安县', '1', '4.2.2.350629', '1', '4', '华安县', '29', 'HAX', null, '003035006029', null);
INSERT INTO `pa_bmzd` VALUES ('1F2920AA0F2244B3A94A6BD8E2CCDC15', '2015-05-03 11:15:47', '陕西省榆林市子洲县', '1', '4.2.2.610831', '1', '4', '子洲县', '31', 'ZZX', null, '003061008031', null);
INSERT INTO `pa_bmzd` VALUES ('1F2A880C675A4BACBB3B4049105A9986', '2015-05-03 11:15:47', '宁夏回族自治区石嘴山市惠农区', '1', '4.2.2.640205', '1', '4', '惠农区', '5', 'HNQ', null, '003064002005', null);
INSERT INTO `pa_bmzd` VALUES ('1F4A4BFB0965482F81B7AF0FB1E4F332', '2015-05-03 11:15:47', '四川省德阳市绵竹市', '1', '4.2.2.510683', '1', '4', '绵竹市', '83', 'MZS', null, '003051006083', null);
INSERT INTO `pa_bmzd` VALUES ('1F5B3B144FFE43FD87AD0FD68839B494', '2015-05-03 11:15:47', '吉林省吉林市丰满区', '1', '4.2.2.220211', '1', '4', '丰满区', '11', 'FMQ', null, '003022002011', null);
INSERT INTO `pa_bmzd` VALUES ('1F5B99140967431A87AA1B0E8D418D63', '2015-05-03 11:15:47', '重庆市县垫江县', '1', '4.2.2.500231', '1', '4', '垫江县', '31', 'DJX', null, '003050002031', null);
INSERT INTO `pa_bmzd` VALUES ('1F7E1195A3BB4CEAA7D9118AE3E783CF', '2015-05-03 11:15:47', '安徽省淮北市濉溪县', '1', '4.2.2.340621', '1', '4', '濉溪县', '21', 'SXX', null, '003034006021', null);
INSERT INTO `pa_bmzd` VALUES ('1F968F21CC19498B81EC81666D5AE5A9', '2015-05-03 11:15:47', '青海省玉树藏族自治州治多县', '1', '4.2.2.632724', '1', '4', '治多县', '24', 'ZDX', null, '003063027024', null);
INSERT INTO `pa_bmzd` VALUES ('1FBD04FAD8474B22BB13DF3359B83711', '2015-05-03 11:15:47', '四川省自贡市大安区', '1', '4.2.2.510304', '1', '4', '大安区', '4', 'DAQ', null, '003051003004', null);
INSERT INTO `pa_bmzd` VALUES ('1FC3189C68974FD2B77C4501FD472AA6', '2015-05-03 11:15:47', '河南省信阳市罗山县', '1', '4.2.2.411521', '1', '4', '罗山县', '21', 'LSX', null, '003041015021', null);
INSERT INTO `pa_bmzd` VALUES ('1FF16E72F37E4CC7B00C2F6C966EE7F9', '2015-05-03 11:15:47', '广西壮族自治区崇左市市辖区', '1', '4.2.2.451401', '1', '4', '市辖区', '1', 'SXQ', null, '003045014001', null);
INSERT INTO `pa_bmzd` VALUES ('1FFA69A4FE404995B8B6A70E68FEC1BE', '2015-05-03 11:15:47', '上海市市辖区徐汇区', '1', '4.2.2.310104', '1', '4', '徐汇区', '4', 'XHQ', null, '003031001004', null);
INSERT INTO `pa_bmzd` VALUES ('202E77462BF042BF830E4CFD5F7A34A6', '2015-05-03 11:15:47', '河南省焦作市中站区', '1', '4.2.2.410803', '1', '4', '中站区', '3', 'ZZQ', null, '003041008003', null);
INSERT INTO `pa_bmzd` VALUES ('2031BE907DCE430F9D0B18FFF50312B8', '2015-05-03 11:15:47', '青海省果洛藏族自治州玛多县', '1', '4.2.2.632626', '1', '4', '玛多县', '26', 'MDX', null, '003063026026', null);
INSERT INTO `pa_bmzd` VALUES ('20440988CEDF4A68B408457BB7A48B74', '2015-05-03 11:15:47', '山东省临沂市', '1', '4.2.2.371300', '0', '3', '临沂市', '13', 'LYS', null, '003037013', null);
INSERT INTO `pa_bmzd` VALUES ('204B8909B58A43D585E37840B3EDF623', '2015-05-03 11:15:47', '广西壮族自治区柳州市柳江县', '1', '4.2.2.450221', '1', '4', '柳江县', '21', 'LJX', null, '003045002021', null);
INSERT INTO `pa_bmzd` VALUES ('207A1E327A0D48B6A71C74939F3A8FD3', '2015-05-03 11:15:47', '甘肃省定西市漳县', '1', '4.2.2.621125', '1', '4', '漳县', '25', 'ZX', null, '003062011025', null);
INSERT INTO `pa_bmzd` VALUES ('209091FAF3054AA2A2DE7388FC64FA6A', '2015-05-03 11:15:47', '广西壮族自治区玉林市玉州区', '1', '4.2.2.450902', '1', '4', '玉州区', '2', 'YZQ', null, '003045009002', null);
INSERT INTO `pa_bmzd` VALUES ('20A674EBEA9D473282EDAADF54385B43', '2015-05-03 11:15:47', '山东省枣庄市台儿庄区', '1', '4.2.2.370405', '1', '4', '台儿庄区', '5', 'TEZQ', null, '003037004005', null);
INSERT INTO `pa_bmzd` VALUES ('20B1BF4585CF448BBD5CB5209682AA67', '2015-05-03 11:15:47', '河南省鹤壁市淇县', '1', '4.2.2.410622', '1', '4', '淇县', '22', 'QX', null, '003041006022', null);
INSERT INTO `pa_bmzd` VALUES ('20D7E4BDE719487989953286F35315C3', '2015-05-03 11:15:47', '黑龙江省黑河市五大连池市', '1', '4.2.2.231182', '1', '4', '五大连池市', '82', 'WDLCS', null, '003023011082', null);
INSERT INTO `pa_bmzd` VALUES ('20E8CB53B9D840BD8D4B43C01D3B0276', '2015-05-03 11:15:47', '陕西省咸阳市市辖区', '1', '4.2.2.610401', '1', '4', '市辖区', '1', 'SXQ', null, '003061004001', null);
INSERT INTO `pa_bmzd` VALUES ('20E9657F44C543A492FE053695E5C4AF', '2015-05-03 11:15:47', '黑龙江省双鸭山市市辖区', '1', '4.2.2.230501', '1', '4', '市辖区', '1', 'SXQ', null, '003023005001', null);
INSERT INTO `pa_bmzd` VALUES ('20FC5077411B41ECB36374FAC652D231', '2015-05-03 11:15:47', '内蒙古自治区呼和浩特市武川县', '1', '4.2.2.150125', '1', '4', '武川县', '25', 'WCX', null, '003015001025', null);
INSERT INTO `pa_bmzd` VALUES ('20FF274B37014BDF9E2C9E1EB205F5FC', '2015-05-03 11:15:47', '浙江省嘉兴市桐乡市', '1', '4.2.2.330483', '1', '4', '桐乡市', '83', 'TXS', null, '003033004083', null);
INSERT INTO `pa_bmzd` VALUES ('20FFB455044644A1AE5CDEA43820C2EB', '2015-05-03 11:15:47', '云南省怒江傈僳族自治州福贡县', '1', '4.2.2.533323', '1', '4', '福贡县', '23', 'FGX', null, '003053033023', null);
INSERT INTO `pa_bmzd` VALUES ('215544E7E2F641A1B46993063F4C1F91', '2015-05-03 11:15:47', '湖北省襄阳市宜城市', '1', '4.2.2.420684', '1', '4', '宜城市', '84', 'YCS', null, '003042006084', null);
INSERT INTO `pa_bmzd` VALUES ('215E5A4B81084AEE9206163C3CD81F43', '2015-05-03 11:15:47', '河北省保定市涞源县', '1', '4.2.2.130630', '1', '4', '涞源县', '30', 'LYX', null, '003013006030', null);
INSERT INTO `pa_bmzd` VALUES ('216EF6CD665048069FB2C2C6499A89F3', '2015-05-03 11:15:47', '浙江省温州市文成县', '1', '4.2.2.330328', '1', '4', '文成县', '28', 'WCX', null, '003033003028', null);
INSERT INTO `pa_bmzd` VALUES ('24DC7387D5574F9EBF620DA4504B9B88', '2015-05-03 11:15:47', '内蒙古自治区锡林郭勒盟正镶白旗', '1', '4.2.2.152529', '1', '4', '正镶白旗', '29', 'ZXBQ', null, '003015025029', null);
INSERT INTO `pa_bmzd` VALUES ('25028331F2F54231A71977A027899891', '2015-05-03 11:15:47', '福建省南平市松溪县', '1', '4.2.2.350724', '1', '4', '松溪县', '24', 'SXX', null, '003035007024', null);
INSERT INTO `pa_bmzd` VALUES ('25098964D97644EF9BD27F6E0C0F73C4', '2015-05-03 11:15:47', '贵州省黔西南布依族苗族自治州望谟县', '1', '4.2.2.522326', '1', '4', '望谟县', '26', 'WMX', null, '003052023026', null);
INSERT INTO `pa_bmzd` VALUES ('2509D269A4B8470DB6D20A98B9C33DC9', '2015-05-03 11:15:47', '西藏自治区林芝地区米林县', '1', '4.2.2.542623', '1', '4', '米林县', '23', 'MLX', null, '003054026023', null);
INSERT INTO `pa_bmzd` VALUES ('254E8D63B2D94E14AAA69D0EADED8408', '2015-05-03 11:15:47', '辽宁省大连市庄河市', '1', '4.2.2.210283', '1', '4', '庄河市', '83', 'ZHS', null, '003021002083', null);
INSERT INTO `pa_bmzd` VALUES ('2551C42302E0412D88C848661733AD35', '2015-05-03 11:15:47', '河南省南阳市社旗县', '1', '4.2.2.411327', '1', '4', '社旗县', '27', 'SQX', null, '003041013027', null);
INSERT INTO `pa_bmzd` VALUES ('2552E3A93B0543ABA4D96F949FB46560', '2015-05-03 11:15:47', '海南省省直辖县级行政区划', '1', '4.2.2.469000', '0', '3', '省直辖县级行政区划', '90', 'SZXXJXZQH', null, '003046090', null);
INSERT INTO `pa_bmzd` VALUES ('255D5D299D6144099E1416D3DFD23FEC', '2015-05-03 11:15:47', '河南省焦作市解放区', '1', '4.2.2.410802', '1', '4', '解放区', '2', 'JFQ', null, '003041008002', null);
INSERT INTO `pa_bmzd` VALUES ('25614934131942B689E7B6966AFF9EE7', '2015-05-03 11:15:47', '黑龙江省鸡西市虎林市', '1', '4.2.2.230381', '1', '4', '虎林市', '81', 'HLS', null, '003023003081', null);
INSERT INTO `pa_bmzd` VALUES ('256BA728058844D888C06CAB9FF9BE3F', '2015-05-03 11:15:47', '湖南省永州市江华瑶族自治县', '1', '4.2.2.431129', '1', '4', '江华瑶族自治县', '29', 'JHYZZZX', null, '003043011029', null);
INSERT INTO `pa_bmzd` VALUES ('2587F7AFEE55423A9AFD63C8542CDC8B', '2015-05-03 11:15:47', '江西省吉安市万安县', '1', '4.2.2.360828', '1', '4', '万安县', '28', 'WAX', null, '003036008028', null);
INSERT INTO `pa_bmzd` VALUES ('259F89DCD7EB4CEA85ED9491210FFF62', '2015-05-03 11:15:47', '湖北省省直辖县级行政区划', '1', '4.2.2.429000', '0', '3', '省直辖县级行政区划', '90', 'SZXXJXZQH', null, '003042090', null);
INSERT INTO `pa_bmzd` VALUES ('25BD92C1FE174F1A94191DA5530B73DF', '2015-05-03 11:15:47', '广西壮族自治区百色市凌云县', '1', '4.2.2.451027', '1', '4', '凌云县', '27', 'LYX', null, '003045010027', null);
INSERT INTO `pa_bmzd` VALUES ('25D187D4C8DD479D8F80DB89B3C45938', '2015-05-03 11:15:47', '湖北省宜昌市枝江市', '1', '4.2.2.420583', '1', '4', '枝江市', '83', 'ZJS', null, '003042005083', null);
INSERT INTO `pa_bmzd` VALUES ('25D6F239D6D1483FAEF9B04A337B7B5D', '2015-05-03 11:15:47', '江西省赣州市会昌县', '1', '4.2.2.360733', '1', '4', '会昌县', '33', 'KCX', null, '003036007033', null);
INSERT INTO `pa_bmzd` VALUES ('25E69EB843A14D7D88963859FD0CE8F3', '2015-05-03 11:15:47', '云南省红河哈尼族彝族自治州开远市', '1', '4.2.2.532502', '1', '4', '开远市', '2', 'KYS', null, '003053025002', null);
INSERT INTO `pa_bmzd` VALUES ('25E76D397A4F4440951A3BA165C892C8', '2015-05-03 11:15:47', '黑龙江省哈尔滨市呼兰区', '1', '4.2.2.230111', '1', '4', '呼兰区', '11', 'HLQ', null, '003023001011', null);
INSERT INTO `pa_bmzd` VALUES ('25EA1AEF7F444C7B8B1AE41E92AD41BC', '2015-05-03 11:15:47', '甘肃省酒泉市肃北蒙古族自治县', '1', '4.2.2.620923', '1', '4', '肃北蒙古族自治县', '23', 'SBMGZZZX', null, '003062009023', null);
INSERT INTO `pa_bmzd` VALUES ('25F116096CD448B68A26B9615CD1C49E', '2015-05-03 11:15:47', '吉林省长春市九台市', '1', '4.2.2.220181', '1', '4', '九台市', '81', 'JTS', null, '003022001081', null);
INSERT INTO `pa_bmzd` VALUES ('2608342E1D804F9581C2959BC497A4C0', '2015-05-03 11:15:47', '山西省长治市壶关县', '1', '4.2.2.140427', '1', '4', '壶关县', '27', 'HGX', null, '003014004027', null);
INSERT INTO `pa_bmzd` VALUES ('261113FF3AF84CDA95C6DED4944B4CCA', '2015-05-03 11:15:47', '甘肃省武威市古浪县', '1', '4.2.2.620622', '1', '4', '古浪县', '22', 'GLX', null, '003062006022', null);
INSERT INTO `pa_bmzd` VALUES ('2618C7B029034C2A9745ADD10B43115E', '2015-05-03 11:15:47', '湖北省宜昌市秭归县', '1', '4.2.2.420527', '1', '4', '秭归县', '27', 'ZGX', null, '003042005027', null);
INSERT INTO `pa_bmzd` VALUES ('26192A39AB1147BB82816BAF58B09F43', '2015-05-03 11:15:47', '云南省德宏傣族景颇族自治州瑞丽市', '1', '4.2.2.533102', '1', '4', '瑞丽市', '2', 'RLS', null, '003053031002', null);
INSERT INTO `pa_bmzd` VALUES ('2621A2A61C24455690CFC9AF7607819C', '2015-05-03 11:15:47', '陕西省西安市户县', '1', '4.2.2.610125', '1', '4', '户县', '25', 'HX', null, '003061001025', null);
INSERT INTO `pa_bmzd` VALUES ('2651D4CB49E048B799D2ADF5043FFF5A', '2015-05-03 11:15:47', '广西壮族自治区百色市靖西县', '1', '4.2.2.451025', '1', '4', '靖西县', '25', 'JXX', null, '003045010025', null);
INSERT INTO `pa_bmzd` VALUES ('26569FC566B448E788B4E4ED17D5E25E', '2015-05-03 11:15:47', '安徽省滁州市定远县', '1', '4.2.2.341125', '1', '4', '定远县', '25', 'DYX', null, '003034011025', null);
INSERT INTO `pa_bmzd` VALUES ('26C30845ED4C46E6A5FFAA611F8EA51C', '2015-05-03 11:15:47', '浙江省湖州市市辖区', '1', '4.2.2.330501', '1', '4', '市辖区', '1', 'SXQ', null, '003033005001', null);
INSERT INTO `pa_bmzd` VALUES ('26C48AC01CE44377A53533D33438A517', '2015-05-03 11:15:47', '广东省茂名市化州市', '1', '4.2.2.440982', '1', '4', '化州市', '82', 'HZS', null, '003044009082', null);
INSERT INTO `pa_bmzd` VALUES ('26D0BAC86CE54FD3B823FEE72C23EE3C', '2015-05-03 11:15:47', '河南省平顶山市叶县', '1', '4.2.2.410422', '1', '4', '叶县', '22', 'YX', null, '003041004022', null);
INSERT INTO `pa_bmzd` VALUES ('26D1302979464456ABB96E8724318FE2', '2015-05-03 11:15:47', '山西省晋中市左权县', '1', '4.2.2.140722', '1', '4', '左权县', '22', 'ZQX', null, '003014007022', null);
INSERT INTO `pa_bmzd` VALUES ('26D976AAAB274BC59B3B53D4E58EA828', '2015-05-03 11:15:47', '辽宁省丹东市凤城市', '1', '4.2.2.210682', '1', '4', '凤城市', '82', 'FCS', null, '003021006082', null);
INSERT INTO `pa_bmzd` VALUES ('26DFD5A7C7A04DD09EFC5F03FCE422B4', '2015-05-03 11:15:47', '山东省烟台市芝罘区', '1', '4.2.2.370602', '1', '4', '芝罘区', '2', 'ZFQ', null, '003037006002', null);
INSERT INTO `pa_bmzd` VALUES ('26E9AFEB297A4B86A0D90BA11521D899', '2015-05-03 11:15:47', '河北省保定市阜平县', '1', '4.2.2.130624', '1', '4', '阜平县', '24', 'FPX', null, '003013006024', null);
INSERT INTO `pa_bmzd` VALUES ('26EE3F9F1285456C9DDFDD4A066F75BA', '2015-05-03 11:15:47', '青海省玉树藏族自治州玉树县', '1', '4.2.2.632721', '1', '4', '玉树县', '21', 'YSX', null, '003063027021', null);
INSERT INTO `pa_bmzd` VALUES ('27053823C62042E382C17D5925CC2AE3', '2015-05-03 11:15:47', '河北省保定市定州市', '1', '4.2.2.130682', '1', '4', '定州市', '82', 'DZS', null, '003013006082', null);
INSERT INTO `pa_bmzd` VALUES ('270B913A1F7649CBB74628985D09CABB', '2015-05-03 11:15:47', '陕西省渭南市', '1', '4.2.2.610500', '0', '3', '渭南市', '5', 'WNS', null, '003061005', null);
INSERT INTO `pa_bmzd` VALUES ('270EF6EC006347CA8499CE7B35C3279E', '2015-05-03 11:15:47', '陕西省榆林市横山县', '1', '4.2.2.610823', '1', '4', '横山县', '23', 'HSX', null, '003061008023', null);
INSERT INTO `pa_bmzd` VALUES ('27191950B53440ECB321470AADE295D3', '2015-05-03 11:15:47', '安徽省亳州市谯城区', '1', '4.2.2.341602', '1', '4', '谯城区', '2', 'QCQ', null, '003034016002', null);
INSERT INTO `pa_bmzd` VALUES ('271B76685F864C54948187C8923BB582', '2015-05-03 11:15:47', '江苏省无锡市宜兴市', '1', '4.2.2.320282', '1', '4', '宜兴市', '82', 'YXS', null, '003032002082', null);
INSERT INTO `pa_bmzd` VALUES ('2725DA060EA84CCDB37B2044DEB75618', '2015-05-03 11:15:47', '辽宁省阜新市新邱区', '1', '4.2.2.210903', '1', '4', '新邱区', '3', 'XQQ', null, '003021009003', null);
INSERT INTO `pa_bmzd` VALUES ('272775C04B404E3BA5126CE8225D675F', '2015-05-03 11:15:47', '陕西省延安市延川县', '1', '4.2.2.610622', '1', '4', '延川县', '22', 'YCX', null, '003061006022', null);
INSERT INTO `pa_bmzd` VALUES ('273D780385D34FBCB5A8F85ED1EDC025', '2015-05-03 11:15:47', '湖北省孝感市云梦县', '1', '4.2.2.420923', '1', '4', '云梦县', '23', 'YMX', null, '003042009023', null);
INSERT INTO `pa_bmzd` VALUES ('2771BAE7797F496AA6D21FAD396DC753', '2015-05-03 11:15:47', '云南省西双版纳傣族自治州景洪市', '1', '4.2.2.532801', '1', '4', '景洪市', '1', 'JHS', null, '003053028001', null);
INSERT INTO `pa_bmzd` VALUES ('277CF443EF1E4997A984AC3935270493', '2015-05-03 11:15:47', '广西壮族自治区柳州市鱼峰区', '1', '4.2.2.450203', '1', '4', '鱼峰区', '3', 'YFQ', null, '003045002003', null);
INSERT INTO `pa_bmzd` VALUES ('27AA1B5FBE7E455E8DD8BB2ECD15381D', '2015-05-03 11:15:47', '安徽省滁州市南谯区', '1', '4.2.2.341103', '1', '4', '南谯区', '3', 'NQQ', null, '003034011003', null);
INSERT INTO `pa_bmzd` VALUES ('27B4199F312649759632460557F94231', '2015-05-03 11:15:47', '辽宁省葫芦岛市连山区', '1', '4.2.2.211402', '1', '4', '连山区', '2', 'LSQ', null, '003021014002', null);
INSERT INTO `pa_bmzd` VALUES ('27C0E2F395274B44B6DAF106463F04BF', '2015-05-03 11:15:47', '湖北省黄冈市团风县', '1', '4.2.2.421121', '1', '4', '团风县', '21', 'TFX', null, '003042011021', null);
INSERT INTO `pa_bmzd` VALUES ('27C559D17C744FFE9E940D4F73A1DFEC', '2015-05-03 11:15:47', '甘肃省甘南藏族自治州碌曲县', '1', '4.2.2.623026', '1', '4', '碌曲县', '26', 'LQX', null, '003062030026', null);
INSERT INTO `pa_bmzd` VALUES ('27CF2B8517C44774B3782BB953C5722C', '2015-05-03 11:15:47', '甘肃省平凉市市辖区', '1', '4.2.2.620801', '1', '4', '市辖区', '1', 'SXQ', null, '003062008001', null);
INSERT INTO `pa_bmzd` VALUES ('27DD8FB658454786A45CB59E6127F48F', '2015-05-03 11:15:47', '浙江省杭州市拱墅区', '1', '4.2.2.330105', '1', '4', '拱墅区', '5', 'GSQ', null, '003033001005', null);
INSERT INTO `pa_bmzd` VALUES ('283E7E8013F440C2B5764A206E3AA323', '2015-05-03 11:15:47', '陕西省咸阳市泾阳县', '1', '4.2.2.610423', '1', '4', '泾阳县', '23', 'JYX', null, '003061004023', null);
INSERT INTO `pa_bmzd` VALUES ('2840BADA46BF4C13AB37D0AF68884E7F', '2015-05-03 11:15:47', '河北省邯郸市大名县', '1', '4.2.2.130425', '1', '4', '大名县', '25', 'DMX', null, '003013004025', null);
INSERT INTO `pa_bmzd` VALUES ('285CF75DDABA479FA8F612B0A245E44C', '2015-05-03 11:15:47', '河北省保定市高碑店市', '1', '4.2.2.130684', '1', '4', '高碑店市', '84', 'GBDS', null, '003013006084', null);
INSERT INTO `pa_bmzd` VALUES ('2876111A4ADE4A328DBB9938D25CAC99', '2015-05-03 11:15:47', '广东省深圳市南山区', '1', '4.2.2.440305', '1', '4', '南山区', '5', 'NSQ', null, '003044003005', null);
INSERT INTO `pa_bmzd` VALUES ('287F66EFBFFE4A258ACCB4FCD06197FB', '2015-05-03 11:15:47', '福建省宁德市福鼎市', '1', '4.2.2.350982', '1', '4', '福鼎市', '82', 'FDS', null, '003035009082', null);
INSERT INTO `pa_bmzd` VALUES ('288CBEE5B19341868BA4DC6A8D637E44', '2015-05-03 11:15:47', '山东省东营市利津县', '1', '4.2.2.370522', '1', '4', '利津县', '22', 'LJX', null, '003037005022', null);
INSERT INTO `pa_bmzd` VALUES ('289E07ECD1D545A6864D870E00063081', '2015-05-03 11:15:47', '西藏自治区日喀则地区聂拉木县', '1', '4.2.2.542336', '1', '4', '聂拉木县', '36', 'NLMX', null, '003054023036', null);
INSERT INTO `pa_bmzd` VALUES ('28C924D63AC44745908E624DE72408B6', '2015-05-03 11:15:47', '新疆维吾尔自治区阿克苏地区沙雅县', '1', '4.2.2.652924', '1', '4', '沙雅县', '24', 'SYX', null, '003065029024', null);
INSERT INTO `pa_bmzd` VALUES ('28CC07D145114523AD6F0FB4CD8E99FC', '2015-05-03 11:15:47', '湖北省武汉市', '1', '4.2.2.420100', '0', '3', '武汉市', '1', 'WHS', null, '003042001', null);
INSERT INTO `pa_bmzd` VALUES ('28CD34F68741461992EEF7BC14BA6AB1', '2015-05-03 11:15:47', '贵州省黔东南苗族侗族自治州剑河县', '1', '4.2.2.522629', '1', '4', '剑河县', '29', 'JHX', null, '003052026029', null);
INSERT INTO `pa_bmzd` VALUES ('28CEBA44D15B45DD80B14FA5FDD8DE12', '2015-05-03 11:15:47', '内蒙古自治区呼和浩特市土默特左旗', '1', '4.2.2.150121', '1', '4', '土默特左旗', '21', 'TMTZQ', null, '003015001021', null);
INSERT INTO `pa_bmzd` VALUES ('28D1F49CB52D4C96A95DAC857D1458C2', '2015-05-03 11:15:47', '黑龙江省齐齐哈尔市讷河市', '1', '4.2.2.230281', '1', '4', '讷河市', '81', 'NHS', null, '003023002081', null);
INSERT INTO `pa_bmzd` VALUES ('28E29B0C8532434E845EA0FFEE6A24DA', '2015-05-03 11:15:47', '福建省三明市沙县', '1', '4.2.2.350427', '1', '4', '沙县', '27', 'SX', null, '003035004027', null);
INSERT INTO `pa_bmzd` VALUES ('29056BD0CC4C429C9CD485D7556AF178', '2015-05-03 11:15:47', '甘肃省平凉市灵台县', '1', '4.2.2.620822', '1', '4', '灵台县', '22', 'LTX', null, '003062008022', null);
INSERT INTO `pa_bmzd` VALUES ('290AC856A0974AD2A40D29DD5B89E0BA', '2015-05-03 11:15:47', '江苏省苏州市昆山市', '1', '4.2.2.320583', '1', '4', '昆山市', '83', 'KSS', null, '003032005083', null);
INSERT INTO `pa_bmzd` VALUES ('290E688E24BB489398BE42E01C7993BD', '2015-05-03 11:15:47', '广西壮族自治区柳州市柳北区', '1', '4.2.2.450205', '1', '4', '柳北区', '5', 'LBQ', null, '003045002005', null);
INSERT INTO `pa_bmzd` VALUES ('290F34D3BC594E9D9473EAEC725B1196', '2015-05-03 11:15:47', '四川省广安市邻水县', '1', '4.2.2.511623', '1', '4', '邻水县', '23', 'LSX', null, '003051016023', null);
INSERT INTO `pa_bmzd` VALUES ('292C63F1705446C793253E43DB5BDE3F', '2015-05-03 11:15:47', '山东省聊城市东阿县', '1', '4.2.2.371524', '1', '4', '东阿县', '24', 'DAX', null, '003037015024', null);
INSERT INTO `pa_bmzd` VALUES ('292E5617A5B84AADB603E99AEE3C1BEF', '2015-05-03 11:15:47', '安徽省蚌埠市禹会区', '1', '4.2.2.340304', '1', '4', '禹会区', '4', 'YKQ', null, '003034003004', null);
INSERT INTO `pa_bmzd` VALUES ('294132DD4C6142B380BD0D11D251E92B', '2015-05-03 11:15:47', '福建省福州市晋安区', '1', '4.2.2.350111', '1', '4', '晋安区', '11', 'JAQ', null, '003035001011', null);
INSERT INTO `pa_bmzd` VALUES ('2943219E77744BF69763FC7FA46EF206', '2015-05-03 11:15:47', '吉林省长春市宽城区', '1', '4.2.2.220103', '1', '4', '宽城区', '3', 'KCQ', null, '003022001003', null);
INSERT INTO `pa_bmzd` VALUES ('29646C651B7045BAA2B34010FE6D2327', '2015-05-03 11:15:47', '浙江省衢州市常山县', '1', '4.2.2.330822', '1', '4', '常山县', '22', 'CSX', null, '003033008022', null);
INSERT INTO `pa_bmzd` VALUES ('296E6E05F8C141C9ADE4D1500BFD6A68', '2015-05-03 11:15:47', '上海市县崇明县', '1', '4.2.2.310230', '1', '4', '崇明县', '30', 'CMX', null, '003031002030', null);
INSERT INTO `pa_bmzd` VALUES ('29A49D6EE27C4C538E5981D7C1365345', '2015-05-03 11:15:47', '四川省巴中市', '1', '4.2.2.511900', '0', '3', '巴中市', '19', 'BZS', null, '003051019', null);
INSERT INTO `pa_bmzd` VALUES ('29B0AF3AD01C48B189FF3576533CC0B0', '2015-05-03 11:15:47', '甘肃省天水市', '1', '4.2.2.620500', '0', '3', '天水市', '5', 'TSS', null, '003062005', null);
INSERT INTO `pa_bmzd` VALUES ('29BE19EBA00E46C7B48C38EF15668144', '2015-05-03 11:15:47', '江西省宜春市上高县', '1', '4.2.2.360923', '1', '4', '上高县', '23', 'SGX', null, '003036009023', null);
INSERT INTO `pa_bmzd` VALUES ('29DC91B401B041A6A547CDF3D3B056A1', '2015-05-03 11:15:47', '宁夏回族自治区吴忠市', '1', '4.2.2.640300', '0', '3', '吴忠市', '3', 'WZS', null, '003064003', null);
INSERT INTO `pa_bmzd` VALUES ('29E4304959004392940936DC0BD7FF76', '2015-05-03 11:15:47', '安徽省亳州市涡阳县', '1', '4.2.2.341621', '1', '4', '涡阳县', '21', 'WYX', null, '003034016021', null);
INSERT INTO `pa_bmzd` VALUES ('29EEF261C1C14BC8B12019BA4AFBD195', '2015-05-03 11:15:47', '湖北省黄冈市黄州区', '1', '4.2.2.421102', '1', '4', '黄州区', '2', 'HZQ', null, '003042011002', null);
INSERT INTO `pa_bmzd` VALUES ('29F35A07D8BE4C13B1C81F85A8B6B1BF', '2015-05-03 11:15:47', '新疆维吾尔自治区克拉玛依市市辖区', '1', '4.2.2.650201', '1', '4', '市辖区', '1', 'SXQ', null, '003065002001', null);
INSERT INTO `pa_bmzd` VALUES ('29F46F281EBE4E96B931A97EDD511536', '2015-05-03 11:15:47', '江西省吉安市泰和县', '1', '4.2.2.360826', '1', '4', '泰和县', '26', 'THX', null, '003036008026', null);
INSERT INTO `pa_bmzd` VALUES ('29FB13E336C045D78A00EDD0B2E4DDB8', '2015-05-03 11:15:47', '广东省湛江市霞山区', '1', '4.2.2.440803', '1', '4', '霞山区', '3', 'XSQ', null, '003044008003', null);
INSERT INTO `pa_bmzd` VALUES ('2A040CE1AE834B9F964708434B988349', '2015-05-03 11:15:47', '云南省昆明市市辖区', '1', '4.2.2.530101', '1', '4', '市辖区', '1', 'SXQ', null, '003053001001', null);
INSERT INTO `pa_bmzd` VALUES ('2A1B0849A37A4700A91B122ECDB78F54', '2015-05-03 11:15:47', '山西省晋中市灵石县', '1', '4.2.2.140729', '1', '4', '灵石县', '29', 'LSX', null, '003014007029', null);
INSERT INTO `pa_bmzd` VALUES ('2A32609FD0544A51AEA405CE070783EA', '2015-05-03 11:15:47', '黑龙江省黑河市北安市', '1', '4.2.2.231181', '1', '4', '北安市', '81', 'BAS', null, '003023011081', null);
INSERT INTO `pa_bmzd` VALUES ('2A397E4E55474C03A85480B81BDCBB2C', '2015-05-03 11:15:47', '陕西省西安市新城区', '1', '4.2.2.610102', '1', '4', '新城区', '2', 'XCQ', null, '003061001002', null);
INSERT INTO `pa_bmzd` VALUES ('2A78FCBF2C30446C96B5049A8425005C', '2015-05-03 11:15:47', '黑龙江省大庆市让胡路区', '1', '4.2.2.230604', '1', '4', '让胡路区', '4', 'RHLQ', null, '003023006004', null);
INSERT INTO `pa_bmzd` VALUES ('2A8F4F9DE4CD48BC8157C35BF264A725', '2015-05-03 11:15:47', '内蒙古自治区锡林郭勒盟太仆寺旗', '1', '4.2.2.152527', '1', '4', '太仆寺旗', '27', 'TPSQ', null, '003015025027', null);
INSERT INTO `pa_bmzd` VALUES ('2AB25F8B909D4EB7A95A24A4C55E7B07', '2015-05-03 11:15:47', '广东省广州市市辖区', '1', '4.2.2.440101', '1', '4', '市辖区', '1', 'SXQ', null, '003044001001', null);
INSERT INTO `pa_bmzd` VALUES ('2AB46D3418434C88939D38E935530168', '2015-05-03 11:15:47', '新疆维吾尔自治区巴音郭楞蒙古自治州博湖县', '1', '4.2.2.652829', '1', '4', '博湖县', '29', 'BHX', null, '003065028029', null);
INSERT INTO `pa_bmzd` VALUES ('2AB74ABFD82849D599C5E8D7524AB87C', '2015-05-03 11:15:47', '内蒙古自治区乌海市乌达区', '1', '4.2.2.150304', '1', '4', '乌达区', '4', 'WDQ', null, '003015003004', null);
INSERT INTO `pa_bmzd` VALUES ('2AC14DBB59F5456BA3C3756C4B0A6A04', '2015-05-03 11:15:47', '四川省乐山市沙湾区', '1', '4.2.2.511111', '1', '4', '沙湾区', '11', 'SWQ', null, '003051011011', null);
INSERT INTO `pa_bmzd` VALUES ('2ACF91171FFD4E8889DA0113EDF64B0B', '2015-05-03 11:15:47', '江苏省常州市', '1', '4.2.2.320400', '0', '3', '常州市', '4', 'CZS', null, '003032004', null);
INSERT INTO `pa_bmzd` VALUES ('2AD81449AFA54EF8B7610FBA90A44B7E', '2015-05-03 11:15:47', '广西壮族自治区北海市海城区', '1', '4.2.2.450502', '1', '4', '海城区', '2', 'HCQ', null, '003045005002', null);
INSERT INTO `pa_bmzd` VALUES ('2AD9C79548944A97809968F50D959146', '2015-05-03 11:15:47', '山西省吕梁市离石区', '1', '4.2.2.141102', '1', '4', '离石区', '2', 'LSQ', null, '003014011002', null);
INSERT INTO `pa_bmzd` VALUES ('2AE562D086DD4DB0A005CB728E41EE9E', '2015-05-03 11:15:47', '陕西省渭南市市辖区', '1', '4.2.2.610501', '1', '4', '市辖区', '1', 'SXQ', null, '003061005001', null);
INSERT INTO `pa_bmzd` VALUES ('2B0475ACFEB84EB483465C80D45ADB0D', '2015-05-03 11:15:47', '西藏自治区林芝地区朗县', '1', '4.2.2.542627', '1', '4', '朗县', '27', 'LX', null, '003054026027', null);
INSERT INTO `pa_bmzd` VALUES ('2B0C95C3439A45FCAC6013DB8B97EED9', '2015-05-03 11:15:47', '河南省信阳市浉河区', '1', '4.2.2.411502', '1', '4', '浉河区', '2', 'SHQ', null, '003041015002', null);
INSERT INTO `pa_bmzd` VALUES ('2B19C2B5EA6848D691355A6B441A2FEB', '2015-05-03 11:15:47', '河南省鹤壁市', '1', '4.2.2.410600', '0', '3', '鹤壁市', '6', 'HBS', null, '003041006', null);
INSERT INTO `pa_bmzd` VALUES ('2B1F464FA79C438A9643D6205451A4ED', '2015-05-03 11:15:47', '广西壮族自治区桂林市雁山区', '1', '4.2.2.450311', '1', '4', '雁山区', '11', 'YSQ', null, '003045003011', null);
INSERT INTO `pa_bmzd` VALUES ('2B20A290CCF147F2886CBFE99AC4F699', '2015-05-03 11:15:47', '云南省大理白族自治州巍山彝族回族自治县', '1', '4.2.2.532927', '1', '4', '巍山彝族回族自治县', '27', 'WSYZHZZZX', null, '003053029027', null);
INSERT INTO `pa_bmzd` VALUES ('2B28CF17067A4569A690743079E4227E', '2015-05-03 11:15:47', '辽宁省锦州市凌河区', '1', '4.2.2.210703', '1', '4', '凌河区', '3', 'LHQ', null, '003021007003', null);
INSERT INTO `pa_bmzd` VALUES ('2B2C71B9F41D4927B9D82A21DE161F0B', '2015-05-03 11:15:47', '吉林省四平市公主岭市', '1', '4.2.2.220381', '1', '4', '公主岭市', '81', 'GZLS', null, '003022003081', null);
INSERT INTO `pa_bmzd` VALUES ('2B371FDA31814BE89F7E3F00AB1832FF', '2015-05-03 11:15:47', '江苏省徐州市泉山区', '1', '4.2.2.320311', '1', '4', '泉山区', '11', 'QSQ', null, '003032003011', null);
INSERT INTO `pa_bmzd` VALUES ('2B3D28399BAA4D979A419DAE8186704F', '2015-05-03 11:15:47', '河南省洛阳市嵩县', '1', '4.2.2.410325', '1', '4', '嵩县', '25', 'SX', null, '003041003025', null);
INSERT INTO `pa_bmzd` VALUES ('2B3E0371C91E429EA19170F38B724BAF', '2015-05-03 11:15:47', '山东省滨州市惠民县', '1', '4.2.2.371621', '1', '4', '惠民县', '21', 'HMX', null, '003037016021', null);
INSERT INTO `pa_bmzd` VALUES ('2B3FBE2C5C8F4CA1BDD2D292CC30DF96', '2015-05-03 11:15:47', '江西省上饶市广丰县', '1', '4.2.2.361122', '1', '4', '广丰县', '22', 'GFX', null, '003036011022', null);
INSERT INTO `pa_bmzd` VALUES ('2B5237A36E524B5883E673CC79B069EE', '2015-05-03 11:15:47', '内蒙古自治区锡林郭勒盟', '1', '4.2.2.152500', '0', '3', '锡林郭勒盟', '25', 'XLGLM', null, '003015025', null);
INSERT INTO `pa_bmzd` VALUES ('2B57EE2B7105406ABFDCC5D6F46D36D0', '2015-05-03 11:15:47', '内蒙古自治区乌兰察布市集宁区', '1', '4.2.2.150902', '1', '4', '集宁区', '2', 'JNQ', null, '003015009002', null);
INSERT INTO `pa_bmzd` VALUES ('2B701167DACF4B128EA24495E712E142', '2015-05-03 11:15:47', '湖北省宜昌市宜都市', '1', '4.2.2.420581', '1', '4', '宜都市', '81', 'YDS', null, '003042005081', null);
INSERT INTO `pa_bmzd` VALUES ('2B80938EE8FD42B7AF1D3F062A50F532', '2015-05-03 11:15:47', '辽宁省铁岭市调兵山市', '1', '4.2.2.211281', '1', '4', '调兵山市', '81', 'TBSS', null, '003021012081', null);
INSERT INTO `pa_bmzd` VALUES ('2B8870DEC4C346609C9168999F0DD78D', '2015-05-03 11:15:47', '黑龙江省伊春市市辖区', '1', '4.2.2.230701', '1', '4', '市辖区', '1', 'SXQ', null, '003023007001', null);
INSERT INTO `pa_bmzd` VALUES ('2B914DE87CFC43F8B8CA2E7406D7E7C3', '2015-05-03 11:15:47', '四川省绵阳市江油市', '1', '4.2.2.510781', '1', '4', '江油市', '81', 'JYS', null, '003051007081', null);
INSERT INTO `pa_bmzd` VALUES ('2B9347271BFE4908B9214103D3C1128F', '2015-05-03 11:15:47', '广西壮族自治区来宾市兴宾区', '1', '4.2.2.451302', '1', '4', '兴宾区', '2', 'XBQ', null, '003045013002', null);
INSERT INTO `pa_bmzd` VALUES ('2BE8B29113F34B20BDDD67CAFA300F42', '2015-05-03 11:15:47', '宁夏回族自治区中卫市市辖区', '1', '4.2.2.640501', '1', '4', '市辖区', '1', 'SXQ', null, '003064005001', null);
INSERT INTO `pa_bmzd` VALUES ('2C01785B51D4414890BF4A738523FA0F', '2015-05-03 11:15:47', '内蒙古自治区兴安盟扎赉特旗', '1', '4.2.2.152223', '1', '4', '扎赉特旗', '23', 'ZLTQ', null, '003015022023', null);
INSERT INTO `pa_bmzd` VALUES ('2C09C891E8EF48A68E3955C3E6D42C03', '2015-05-03 11:15:47', '四川省甘孜藏族自治州德格县', '1', '4.2.2.513330', '1', '4', '德格县', '30', 'DGX', null, '003051033030', null);
INSERT INTO `pa_bmzd` VALUES ('2C2FB7138D51406BB60C1E191288085F', '2015-05-03 11:15:47', '广西壮族自治区南宁市武鸣县', '1', '4.2.2.450122', '1', '4', '武鸣县', '22', 'WMX', null, '003045001022', null);
INSERT INTO `pa_bmzd` VALUES ('2C469EC9E2DB4111B9F5F9B7CCE64FF2', '2015-05-03 11:15:47', '江西省', '1', '4.2.2.360000', '0', '2', '江西省', '36', 'JXS', null, '003036', null);
INSERT INTO `pa_bmzd` VALUES ('2C50303982DB418CBB9ADA9ED433C72F', '2015-05-03 11:15:47', '湖南省郴州市嘉禾县', '1', '4.2.2.431024', '1', '4', '嘉禾县', '24', 'JHX', null, '003043010024', null);
INSERT INTO `pa_bmzd` VALUES ('2C5C2C7091F44A7C9E0E0D5F6A56ED71', '2015-05-03 11:15:47', '西藏自治区林芝地区林芝县', '1', '4.2.2.542621', '1', '4', '林芝县', '21', 'LZX', null, '003054026021', null);
INSERT INTO `pa_bmzd` VALUES ('2C5C817515974DC4A7EC4178F0E3123F', '2015-05-03 11:15:47', '北京市市辖区西城区', '1', '4.2.2.110102', '1', '4', '西城区', '2', 'XCQ', null, '003011001002', null);
INSERT INTO `pa_bmzd` VALUES ('2C6E25FAD41D4AF68184A2CEC6BD6F90', '2015-05-03 11:15:47', '贵州省黔东南苗族侗族自治州麻江县', '1', '4.2.2.522635', '1', '4', '麻江县', '35', 'MJX', null, '003052026035', null);
INSERT INTO `pa_bmzd` VALUES ('2C8312518D8F438BAAE2FA0C81482C6A', '2015-05-03 11:15:47', '贵州省黔西南布依族苗族自治州', '1', '4.2.2.522300', '0', '3', '黔西南布依族苗族自治州', '23', 'QXNBYZMZZZZ', null, '003052023', null);
INSERT INTO `pa_bmzd` VALUES ('2C9791DFD8D24E8EB7925AF98A6A0E05', '2015-05-03 11:15:47', '甘肃省甘南藏族自治州舟曲县', '1', '4.2.2.623023', '1', '4', '舟曲县', '23', 'ZQX', null, '003062030023', null);
INSERT INTO `pa_bmzd` VALUES ('2C97ECD56A14488EA2DB7551EFBB1E15', '2015-05-03 11:15:47', '青海省海东地区', '1', '4.2.2.632100', '0', '3', '海东地区', '21', 'HDDQ', null, '003063021', null);
INSERT INTO `pa_bmzd` VALUES ('2CCB62EA371446758D863DC50AF2C127', '2015-05-03 11:15:47', '江苏省泰州市海陵区', '1', '4.2.2.321202', '1', '4', '海陵区', '2', 'HLQ', null, '003032012002', null);
INSERT INTO `pa_bmzd` VALUES ('2CE3D804B3914676A27ABC159145C36D', '2015-05-03 11:15:47', '贵州省遵义市仁怀市', '1', '4.2.2.520382', '1', '4', '仁怀市', '82', 'RHS', null, '003052003082', null);
INSERT INTO `pa_bmzd` VALUES ('2CF86AB059ED46E2ACA68D03F07CB894', '2015-05-03 11:15:47', '湖北省孝感市', '1', '4.2.2.420900', '0', '3', '孝感市', '9', 'XGS', null, '003042009', null);
INSERT INTO `pa_bmzd` VALUES ('2D006B90FD5B40ADB2079D3C70834631', '2015-05-03 11:15:47', '广西壮族自治区南宁市', '1', '4.2.2.450100', '0', '3', '南宁市', '1', 'NNS', null, '003045001', null);
INSERT INTO `pa_bmzd` VALUES ('2D0294DBE9874294AA3F6621CF1144C7', '2015-05-03 11:15:47', '甘肃省兰州市城关区', '1', '4.2.2.620102', '1', '4', '城关区', '2', 'CGQ', null, '003062001002', null);
INSERT INTO `pa_bmzd` VALUES ('2D02BEC2CF7D4475A11BE47439689038', '2015-05-03 11:15:47', '云南省丽江市宁蒗彝族自治县', '1', '4.2.2.530724', '1', '4', '宁蒗彝族自治县', '24', 'NLYZZZX', null, '003053007024', null);
INSERT INTO `pa_bmzd` VALUES ('2D0FD2A228704D29806383AF4BD6E0E7', '2015-05-03 11:15:47', '山东省莱芜市钢城区', '1', '4.2.2.371203', '1', '4', '钢城区', '3', 'GCQ', null, '003037012003', null);
INSERT INTO `pa_bmzd` VALUES ('2D27C9A0F5EC4695B3BCA0FEFCC6020D', '2015-05-03 11:15:47', '上海市市辖区宝山区', '1', '4.2.2.310113', '1', '4', '宝山区', '13', 'BSQ', null, '003031001013', null);
INSERT INTO `pa_bmzd` VALUES ('2D310558DA7F40C8AD360F49969A831C', '2015-05-03 11:15:47', '四川省广元市朝天区', '1', '4.2.2.510812', '1', '4', '朝天区', '12', 'ZTQ', null, '003051008012', null);
INSERT INTO `pa_bmzd` VALUES ('2D4E61044502421181A32F7F743C46A2', '2015-05-03 11:15:47', '黑龙江省黑河市嫩江县', '1', '4.2.2.231121', '1', '4', '嫩江县', '21', 'NJX', null, '003023011021', null);
INSERT INTO `pa_bmzd` VALUES ('2D55FA91A778490AA8E45A9CA9EB9B8D', '2015-05-03 11:15:47', '河南省洛阳市洛宁县', '1', '4.2.2.410328', '1', '4', '洛宁县', '28', 'LNX', null, '003041003028', null);
INSERT INTO `pa_bmzd` VALUES ('2D60AC637C9F49B994213CF6F92BC819', '2015-05-03 11:15:47', '海南省省直辖县级行政区划文昌市', '1', '4.2.2.469005', '1', '4', '文昌市', '5', 'WCS', null, '003046090005', null);
INSERT INTO `pa_bmzd` VALUES ('2D681C5653614440ABF4610C4C454B4E', '2015-05-03 11:15:47', '河北省秦皇岛市', '1', '4.2.2.130300', '0', '3', '秦皇岛市', '3', 'QHDS', null, '003013003', null);
INSERT INTO `pa_bmzd` VALUES ('2D6D68C059084E68A5F31152740E2BA2', '2015-05-03 11:15:47', '河南省新乡市市辖区', '1', '4.2.2.410701', '1', '4', '市辖区', '1', 'SXQ', null, '003041007001', null);
INSERT INTO `pa_bmzd` VALUES ('2D6E7612AA4A45B8A4C36FEED6DB9D82', '2015-05-03 11:15:47', '吉林省吉林市永吉县', '1', '4.2.2.220221', '1', '4', '永吉县', '21', 'YJX', null, '003022002021', null);
INSERT INTO `pa_bmzd` VALUES ('2D76252D27C348E39344985FD34F2213', '2015-05-03 11:15:47', '辽宁省本溪市明山区', '1', '4.2.2.210504', '1', '4', '明山区', '4', 'MSQ', null, '003021005004', null);
INSERT INTO `pa_bmzd` VALUES ('2D9705E9DE254B41A8FD337BCB17D476', '2015-05-03 11:15:47', '海南省省直辖县级行政区划西沙群岛', '1', '4.2.2.469037', '1', '4', '西沙群岛', '31', 'XSQD', null, '003046090031', null);
INSERT INTO `pa_bmzd` VALUES ('2DA16C3860CD47CBA512A0CB512751C2', '2015-05-03 11:15:47', '海南省省直辖县级行政区划屯昌县', '1', '4.2.2.469026', '1', '4', '屯昌县', '22', 'ZCX', null, '003046090022', null);
INSERT INTO `pa_bmzd` VALUES ('2DA2061DF56F47FEB87296D9E099032B', '2015-05-03 11:15:47', '广西壮族自治区防城港市防城区', '1', '4.2.2.450603', '1', '4', '防城区', '3', 'FCQ', null, '003045006003', null);
INSERT INTO `pa_bmzd` VALUES ('2DBF27917F1C4BCA9507819CDEFEE382', '2015-05-03 11:15:47', '甘肃省甘南藏族自治州临潭县', '1', '4.2.2.623021', '1', '4', '临潭县', '21', 'LTX', null, '003062030021', null);
INSERT INTO `pa_bmzd` VALUES ('2DCBD081C32843B1B752A60E9B279007', '2015-05-03 11:15:47', '山东省济南市济阳县', '1', '4.2.2.370125', '1', '4', '济阳县', '25', 'JYX', null, '003037001025', null);
INSERT INTO `pa_bmzd` VALUES ('2DCFDEB50F1C400A85914AC847CB9C65', '2015-05-03 11:15:47', '新疆维吾尔自治区昌吉回族自治州奇台县', '1', '4.2.2.652325', '1', '4', '奇台县', '25', 'QTX', null, '003065023025', null);
INSERT INTO `pa_bmzd` VALUES ('2DF2D50900434DE9AB6A89CE72B2B19C', '2015-05-03 11:15:47', '四川省乐山市马边彝族自治县', '1', '4.2.2.511133', '1', '4', '马边彝族自治县', '33', 'MBYZZZX', null, '003051011033', null);
INSERT INTO `pa_bmzd` VALUES ('2DFBDD5FDB174969BC899681C22A6F8F', '2015-05-03 11:15:47', '湖南省怀化市中方县', '1', '4.2.2.431221', '1', '4', '中方县', '21', 'ZFX', null, '003043012021', null);
INSERT INTO `pa_bmzd` VALUES ('2DFEB9098BA548BAA8B4F77FD0583BC2', '2015-05-03 11:15:47', '陕西省宝鸡市陈仓区', '1', '4.2.2.610304', '1', '4', '陈仓区', '4', 'CCQ', null, '003061003004', null);
INSERT INTO `pa_bmzd` VALUES ('2E0A31FE10924BE4B9FED1A8FF387E3F', '2015-05-03 11:15:47', '山东省泰安市岱岳区', '1', '4.2.2.370903', '1', '4', '岱岳区', '11', 'DYQ', null, '003037009011', null);
INSERT INTO `pa_bmzd` VALUES ('2E17E749FD55476AA26CDEA7C9E733E8', '2015-05-03 11:15:47', '贵州省黔东南苗族侗族自治州凯里市', '1', '4.2.2.522601', '1', '4', '凯里市', '1', 'KLS', null, '003052026001', null);
INSERT INTO `pa_bmzd` VALUES ('2E4BF83BF1E94097BB328035EFC1F258', '2015-05-03 11:15:47', '广西壮族自治区北海市', '1', '4.2.2.450500', '0', '3', '北海市', '5', 'BHS', null, '003045005', null);
INSERT INTO `pa_bmzd` VALUES ('2E6194C2DF83446EAC092E5FCFCC8397', '2015-05-03 11:15:47', '山西省大同市大同县', '1', '4.2.2.140227', '1', '4', '大同县', '27', 'DTX', null, '003014002027', null);
INSERT INTO `pa_bmzd` VALUES ('2E747F1A3E3E4328A6C890BAE0D7CCB1', '2015-05-03 11:15:47', '广东省广州市增城市', '1', '4.2.2.440183', '1', '4', '增城市', '83', 'ZCS', null, '003044001083', null);
INSERT INTO `pa_bmzd` VALUES ('2E75232839134693B42D3A4C166BE07A', '2015-05-03 11:15:47', '陕西省延安市吴起县', '1', '4.2.2.610626', '1', '4', '吴起县', '26', 'WQX', null, '003061006026', null);
INSERT INTO `pa_bmzd` VALUES ('2E85A97A399142B388043F30DECCE656', '2015-05-03 11:15:47', '山西省晋中市太谷县', '1', '4.2.2.140726', '1', '4', '太谷县', '26', 'TYX', null, '003014007026', null);
INSERT INTO `pa_bmzd` VALUES ('2E85C1693533485181AE76D6CA8C52B6', '2015-05-03 11:15:47', '青海省果洛藏族自治州甘德县', '1', '4.2.2.632623', '1', '4', '甘德县', '23', 'GDX', null, '003063026023', null);
INSERT INTO `pa_bmzd` VALUES ('2E9665AC3B31412293DD5773F4D52A8A', '2015-05-03 11:15:47', '河南省商丘市夏邑县', '1', '4.2.2.411426', '1', '4', '夏邑县', '26', 'XYX', null, '003041014026', null);
INSERT INTO `pa_bmzd` VALUES ('2EAF110862694B1283CBF1EEE0CCDEB0', '2015-05-03 11:15:47', '广东省江门市市辖区', '1', '4.2.2.440701', '1', '4', '市辖区', '1', 'SXQ', null, '003044007001', null);
INSERT INTO `pa_bmzd` VALUES ('2ECDBD7A3AAE4546B43E911304D1A5FE', '2015-05-03 11:15:47', '广东省韶关市市辖区', '1', '4.2.2.440201', '1', '4', '市辖区', '1', 'SXQ', null, '003044002001', null);
INSERT INTO `pa_bmzd` VALUES ('2EE6F221CC84411CAB5AF0346CDAADA3', '2015-05-03 11:15:47', '云南省曲靖市马龙县', '1', '4.2.2.530321', '1', '4', '马龙县', '21', 'MLX', null, '003053003021', null);
INSERT INTO `pa_bmzd` VALUES ('2EF6B051C028416DBB30BC2D36AFEA57', '2015-05-03 11:15:47', '河南省许昌市长葛市', '1', '4.2.2.411082', '1', '4', '长葛市', '82', 'ZGS', null, '003041010082', null);
INSERT INTO `pa_bmzd` VALUES ('2EFDB37096774A2A89A655244E8B399B', '2015-05-03 11:15:47', '湖南省岳阳市云溪区', '1', '4.2.2.430603', '1', '4', '云溪区', '3', 'YXQ', null, '003043006003', null);
INSERT INTO `pa_bmzd` VALUES ('2F05B541D90149368735BED929B23A8E', '2015-05-03 11:15:47', '江西省抚州市临川区', '1', '4.2.2.361002', '1', '4', '临川区', '2', 'LCQ', null, '003036010002', null);
INSERT INTO `pa_bmzd` VALUES ('2F29485925CB4510AEB8588331A900AD', '2015-05-03 11:15:47', '福建省莆田市仙游县', '1', '4.2.2.350322', '1', '4', '仙游县', '22', 'XYX', null, '003035003022', null);
INSERT INTO `pa_bmzd` VALUES ('2F29E305B4834E308DFBB13EC178B3CD', '2015-05-03 11:15:47', '天津市市辖区红桥区', '1', '4.2.2.120106', '1', '4', '红桥区', '6', 'HQQ', null, '003012001006', null);
INSERT INTO `pa_bmzd` VALUES ('2F46D25E9C6E4E3E817942CBE7630269', '2015-05-03 11:15:47', '河南省新乡市牧野区', '1', '4.2.2.410711', '1', '4', '牧野区', '11', 'MYQ', null, '003041007011', null);
INSERT INTO `pa_bmzd` VALUES ('2F4B3929B3FB4B67BDF09EA602EB41BF', '2015-05-03 11:15:47', '安徽省池州市', '1', '4.2.2.341700', '0', '3', '池州市', '17', 'CZS', null, '003034017', null);
INSERT INTO `pa_bmzd` VALUES ('2F4DD72F981D4C0083C9CA3FBFF5BB59', '2015-05-03 11:15:47', '广东省梅州市五华县', '1', '4.2.2.441424', '1', '4', '五华县', '24', 'WHX', null, '003044014024', null);
INSERT INTO `pa_bmzd` VALUES ('2F4F197565BF4BF982BB975DD8402B16', '2015-05-03 11:15:47', '山东省德州市', '1', '4.2.2.371400', '0', '3', '德州市', '14', 'DZS', null, '003037014', null);
INSERT INTO `pa_bmzd` VALUES ('2FA7D50435B94C9C83611132A8F3D7CD', '2015-05-03 11:15:47', '甘肃省天水市秦州区', '1', '4.2.2.620502', '1', '4', '秦州区', '2', 'QZQ', null, '003062005002', null);
INSERT INTO `pa_bmzd` VALUES ('2FA7F6736AF74971A03121977BD05FAF', '2015-05-03 11:15:47', '西藏自治区林芝地区察隅县', '1', '4.2.2.542626', '1', '4', '察隅县', '26', 'CYX', null, '003054026026', null);
INSERT INTO `pa_bmzd` VALUES ('2FAB2CC727D447BD8B5C3D1E4C0F5EC2', '2015-05-03 11:15:47', '甘肃省庆阳市合水县', '1', '4.2.2.621024', '1', '4', '合水县', '24', 'HSX', null, '003062010024', null);
INSERT INTO `pa_bmzd` VALUES ('2FB2619AB0BB466BBD159831260C4859', '2015-05-03 11:15:47', '吉林省延边朝鲜族自治州安图县', '1', '4.2.2.222426', '1', '4', '安图县', '26', 'ATX', null, '003022024026', null);
INSERT INTO `pa_bmzd` VALUES ('2FC6440B2C7949939AB2DF698E61F7EC', '2015-05-03 11:15:47', '四川省眉山市洪雅县', '1', '4.2.2.511423', '1', '4', '洪雅县', '23', 'HYX', null, '003051014023', null);
INSERT INTO `pa_bmzd` VALUES ('2FD494E25DA04AECBF3BC6CC82C83F19', '2015-05-03 11:15:47', '山西省吕梁市汾阳市', '1', '4.2.2.141182', '1', '4', '汾阳市', '82', 'FYS', null, '003014011082', null);
INSERT INTO `pa_bmzd` VALUES ('3009D0B1E22C42B7AE242A80D3EC4EDE', '2015-05-03 11:15:47', '湖南省邵阳市双清区', '1', '4.2.2.430502', '1', '4', '双清区', '2', 'SQQ', null, '003043005002', null);
INSERT INTO `pa_bmzd` VALUES ('301669A1F75645449028728F2EDE913C', '2015-05-03 11:15:47', '云南省玉溪市新平彝族傣族自治县', '1', '4.2.2.530427', '1', '4', '新平彝族傣族自治县', '27', 'XPYZDZZZX', null, '003053004027', null);
INSERT INTO `pa_bmzd` VALUES ('301B096E9DBC4AA2A6D19C7B473B31F6', '2015-05-03 11:15:47', '广西壮族自治区钦州市浦北县', '1', '4.2.2.450722', '1', '4', '浦北县', '22', 'PBX', null, '003045007022', null);
INSERT INTO `pa_bmzd` VALUES ('30321992F7D64EEDB507F204E0AF6816', '2015-05-03 11:15:47', '江苏省宿迁市', '1', '4.2.2.321300', '0', '3', '宿迁市', '13', 'SQS', null, '003032013', null);
INSERT INTO `pa_bmzd` VALUES ('303D1729EA19442A91B9D8A56DFDBBE0', '2015-05-03 11:15:47', '贵州省遵义市余庆县', '1', '4.2.2.520329', '1', '4', '余庆县', '29', 'YQX', null, '003052003029', null);
INSERT INTO `pa_bmzd` VALUES ('304FDA02832B4FB99D0533A923A0352B', '2015-05-03 11:15:47', '河南省郑州市二七区', '1', '4.2.2.410103', '1', '4', '二七区', '3', 'EQQ', null, '003041001003', null);
INSERT INTO `pa_bmzd` VALUES ('305595FBD40743278BB2D77F6262FB83', '2015-05-03 11:15:47', '福建省漳州市南靖县', '1', '4.2.2.350627', '1', '4', '南靖县', '27', 'NJX', null, '003035006027', null);
INSERT INTO `pa_bmzd` VALUES ('3058E4CD940544D8B99A689775108E72', '2015-05-03 11:15:47', '江西省新余市渝水区', '1', '4.2.2.360502', '1', '4', '渝水区', '2', 'YSQ', null, '003036005002', null);
INSERT INTO `pa_bmzd` VALUES ('306B35FBAFEB4742A7E6E7F60E24CCE1', '2015-05-03 11:15:47', '宁夏回族自治区吴忠市市辖区', '1', '4.2.2.640301', '1', '4', '市辖区', '1', 'SXQ', null, '003064003001', null);
INSERT INTO `pa_bmzd` VALUES ('307E9FF912AE4FBB98853A01476C2BF8', '2015-05-03 11:15:47', '山西省长治市襄垣县', '1', '4.2.2.140423', '1', '4', '襄垣县', '23', 'XYX', null, '003014004023', null);
INSERT INTO `pa_bmzd` VALUES ('3082373A911848DB9AE68999B2D3554A', '2015-05-03 11:15:47', '宁夏回族自治区银川市金凤区', '1', '4.2.2.640106', '1', '4', '金凤区', '6', 'JFQ', null, '003064001006', null);
INSERT INTO `pa_bmzd` VALUES ('30834E8E7670476AA5767CFA520FC5DD', '2015-05-03 11:15:47', '湖南省邵阳市北塔区', '1', '4.2.2.430511', '1', '4', '北塔区', '11', 'BTQ', null, '003043005011', null);
INSERT INTO `pa_bmzd` VALUES ('309E393DEC3C42E4A6FB8696478D4A23', '2015-05-03 11:15:47', '湖南省湘西土家族苗族自治州泸溪县', '1', '4.2.2.433122', '1', '4', '泸溪县', '22', 'LXX', null, '003043031022', null);
INSERT INTO `pa_bmzd` VALUES ('30B723F583F04A70B911011D796ACAE9', '2015-05-03 11:15:47', '河南省安阳市殷都区', '1', '4.2.2.410505', '1', '4', '殷都区', '5', 'YDQ', null, '003041005005', null);
INSERT INTO `pa_bmzd` VALUES ('30C7DF74AC524EE4A11455B8FC6A299C', '2015-05-03 11:15:47', '新疆维吾尔自治区自治区直辖县级行政区划石河子市', '1', '4.2.2.659001', '1', '4', '石河子市', '1', 'SHZS', null, '003065090001', null);
INSERT INTO `pa_bmzd` VALUES ('30F41607C08649BF8BD4F1E65AEEAE6E', '2015-05-03 11:15:47', '新疆维吾尔自治区乌鲁木齐市天山区', '1', '4.2.2.650102', '1', '4', '天山区', '2', 'TSQ', null, '003065001002', null);
INSERT INTO `pa_bmzd` VALUES ('30FB91A2268644E7BBA4697C6419337B', '2015-05-03 11:15:47', '四川省宜宾市长宁县', '1', '4.2.2.511524', '1', '4', '长宁县', '24', 'ZNX', null, '003051015024', null);
INSERT INTO `pa_bmzd` VALUES ('310C47F8AE16451F8D149A7505B20F31', '2015-05-03 11:15:47', '湖北省武汉市汉阳区', '1', '4.2.2.420105', '1', '4', '汉阳区', '5', 'HYQ', null, '003042001005', null);
INSERT INTO `pa_bmzd` VALUES ('31116ABE6F6A47468962A23EC4F478BC', '2015-05-03 11:15:47', '江西省南昌市南昌县', '1', '4.2.2.360121', '1', '4', '南昌县', '21', 'NCX', null, '003036001021', null);
INSERT INTO `pa_bmzd` VALUES ('312E19DA9D4E4678AAE9AAA3DA3194CE', '2015-05-03 11:15:47', '河北省邢台市内丘县', '1', '4.2.2.130523', '1', '4', '内丘县', '23', 'NQX', null, '003013005023', null);
INSERT INTO `pa_bmzd` VALUES ('315721A7A0444F2DAD325C8FF1DD8542', '2015-05-03 11:15:47', '广东省湛江市坡头区', '1', '4.2.2.440804', '1', '4', '坡头区', '4', 'PTQ', null, '003044008004', null);
INSERT INTO `pa_bmzd` VALUES ('315CEF04156F488F84ACA97CD050ED10', '2015-05-03 11:15:47', '湖南省湘潭市雨湖区', '1', '4.2.2.430302', '1', '4', '雨湖区', '2', 'YHQ', null, '003043003002', null);
INSERT INTO `pa_bmzd` VALUES ('316F6109BAB445B1B718852AFE6953DF', '2015-05-03 11:15:47', '河南省洛阳市西工区', '1', '4.2.2.410303', '1', '4', '西工区', '3', 'XGQ', null, '003041003003', null);
INSERT INTO `pa_bmzd` VALUES ('3179D8AADDE84315BE6E3BDDAEC13489', '2015-05-03 11:15:47', '湖南省永州市道县', '1', '4.2.2.431124', '1', '4', '道县', '24', 'DX', null, '003043011024', null);
INSERT INTO `pa_bmzd` VALUES ('31817E5301874F05901027B246771A99', '2015-05-03 11:15:47', '陕西省西安市', '1', '4.2.2.610100', '0', '3', '西安市', '1', 'XAS', null, '003061001', null);
INSERT INTO `pa_bmzd` VALUES ('3192F29D6C6647E183DF504E1C1E8C1E', '2015-05-03 11:15:47', '吉林省白山市八道江区', '1', '4.2.2.220602', '1', '4', '八道江区', '2', 'BDJQ', null, '003022006002', null);
INSERT INTO `pa_bmzd` VALUES ('31B3A140FC8A4FFBA61AD4E6F8077EF0', '2015-05-03 11:15:47', '河北省张家口市宣化县', '1', '4.2.2.130721', '1', '4', '宣化县', '21', 'XHX', null, '003013007021', null);
INSERT INTO `pa_bmzd` VALUES ('31BCD2F985444A53ABF3A6ACCE7C63B7', '2015-05-03 11:15:47', '河北省石家庄市桥西区', '1', '4.2.2.130104', '1', '4', '桥西区', '4', 'QXQ', null, '003013001004', null);
INSERT INTO `pa_bmzd` VALUES ('31C641EB42984E288E05799F6EF22913', '2015-05-03 11:15:47', '广东省惠州市龙门县', '1', '4.2.2.441324', '1', '4', '龙门县', '24', 'LMX', null, '003044013024', null);
INSERT INTO `pa_bmzd` VALUES ('31F164F1A656433FBD967EBA7714D8DD', '2015-05-03 11:15:47', '山东省泰安市东平县', '1', '4.2.2.370923', '1', '4', '东平县', '23', 'DPX', null, '003037009023', null);
INSERT INTO `pa_bmzd` VALUES ('31F46224EFEB486E90F3DAB2F86753E9', '2015-05-03 11:15:47', '广西壮族自治区柳州市融安县', '1', '4.2.2.450224', '1', '4', '融安县', '24', 'RAX', null, '003045002024', null);
INSERT INTO `pa_bmzd` VALUES ('320AA520E2F848048B5EAAA91B236399', '2015-05-03 11:15:47', '四川省巴中市南江县', '1', '4.2.2.511922', '1', '4', '南江县', '22', 'NJX', null, '003051019022', null);
INSERT INTO `pa_bmzd` VALUES ('3213BD81FF4D4F4C8152D4A0DAE00B6B', '2015-05-03 11:15:47', '内蒙古自治区赤峰市红山区', '1', '4.2.2.150402', '1', '4', '红山区', '2', 'HSQ', null, '003015004002', null);
INSERT INTO `pa_bmzd` VALUES ('32202C864C05499288D29FD61717AF86', '2015-05-03 11:15:47', '浙江省湖州市', '1', '4.2.2.330500', '0', '3', '湖州市', '5', 'HZS', null, '003033005', null);
INSERT INTO `pa_bmzd` VALUES ('3237BA7540474FE88DDB9CA8C854CB1E', '2015-05-03 11:15:47', '四川省乐山市沐川县', '1', '4.2.2.511129', '1', '4', '沐川县', '29', 'MCX', null, '003051011029', null);
INSERT INTO `pa_bmzd` VALUES ('32634F50422A4AC4887C5C6D4384E31F', '2015-05-03 11:15:47', '贵州省毕节市威宁彝族回族苗族自治县', '1', '4.2.2.522427', '1', '4', '威宁彝族回族苗族自治县', '26', 'WNYZHZMZZZX', null, '003052005026', null);
INSERT INTO `pa_bmzd` VALUES ('3280B3D4A6864832B33A88E96AAD2FC1', '2015-05-03 11:15:47', '吉林省松原市宁江区', '1', '4.2.2.220702', '1', '4', '宁江区', '2', 'NJQ', null, '003022007002', null);
INSERT INTO `pa_bmzd` VALUES ('32E886F3312342F69E9E37C09DD0B117', '2015-05-03 11:15:47', '云南省楚雄彝族自治州双柏县', '1', '4.2.2.532322', '1', '4', '双柏县', '22', 'SBX', null, '003053023022', null);
INSERT INTO `pa_bmzd` VALUES ('32F6FE2296C74EE3934FE1016F983CB5', '2015-05-03 11:15:47', '四川省阿坝藏族羌族自治州小金县', '1', '4.2.2.513227', '1', '4', '小金县', '27', 'XJX', null, '003051032027', null);
INSERT INTO `pa_bmzd` VALUES ('3309D01C1D9A426884B74CCA49E36C55', '2015-05-03 11:15:47', '四川省内江市威远县', '1', '4.2.2.511024', '1', '4', '威远县', '24', 'WYX', null, '003051010024', null);
INSERT INTO `pa_bmzd` VALUES ('330E97BF0DEF446991767DA02AD95DB3', '2015-05-03 11:15:47', '四川省成都市成华区', '1', '4.2.2.510108', '1', '4', '成华区', '8', 'CHQ', null, '003051001008', null);
INSERT INTO `pa_bmzd` VALUES ('336825E4CBF74EE1A13EE9091FC5951F', '2015-05-03 11:15:47', '内蒙古自治区巴彦淖尔市磴口县', '1', '4.2.2.150822', '1', '4', '磴口县', '22', 'DKX', null, '003015008022', null);
INSERT INTO `pa_bmzd` VALUES ('339870FCFBB1413D80AF6186D7880F75', '2015-05-03 11:15:47', '四川省宜宾市兴文县', '1', '4.2.2.511528', '1', '4', '兴文县', '28', 'XWX', null, '003051015028', null);
INSERT INTO `pa_bmzd` VALUES ('33ADA70159C146D79EDE7F0CF2D79F4D', '2015-05-03 11:15:47', '青海省西宁市城北区', '1', '4.2.2.630105', '1', '4', '城北区', '5', 'CBQ', null, '003063001005', null);
INSERT INTO `pa_bmzd` VALUES ('33B67BEDF7494EF5BDCFF9C03FF3B6AD', '2015-05-03 11:15:47', '云南省保山市隆阳区', '1', '4.2.2.530502', '1', '4', '隆阳区', '2', 'LYQ', null, '003053005002', null);
INSERT INTO `pa_bmzd` VALUES ('33B724401E434B3CB23EDC4034DC351F', '2015-05-03 11:15:47', '山西省晋城市城区', '1', '4.2.2.140502', '1', '4', '城区', '2', 'CQ', null, '003014005002', null);
INSERT INTO `pa_bmzd` VALUES ('33BCCD6798E44B518E7DF0A432722B06', '2015-05-03 11:15:47', '云南省昭通市鲁甸县', '1', '4.2.2.530621', '1', '4', '鲁甸县', '21', 'LDX', null, '003053006021', null);
INSERT INTO `pa_bmzd` VALUES ('33C5250731EA4521B5830A045B9F76A0', '2015-05-03 11:15:47', '江苏省淮安市金湖县', '1', '4.2.2.320831', '1', '4', '金湖县', '31', 'JHX', null, '003032008031', null);
INSERT INTO `pa_bmzd` VALUES ('33D945DD66DC43FDA97A9216A6332C2B', '2015-05-03 11:15:47', '四川省乐山市市中区', '1', '4.2.2.511102', '1', '4', '市中区', '2', 'SZQ', null, '003051011002', null);
INSERT INTO `pa_bmzd` VALUES ('33FD629F8919467B95A8A6C7ABAA298B', '2015-05-03 11:15:47', '甘肃省兰州市', '1', '4.2.2.620100', '0', '3', '兰州市', '1', 'LZS', null, '003062001', null);
INSERT INTO `pa_bmzd` VALUES ('341713D3A4D74DDD9BA14A2C91B4967C', '2015-05-03 11:15:47', '河南省新乡市', '1', '4.2.2.410700', '0', '3', '新乡市', '7', 'XXS', null, '003041007', null);
INSERT INTO `pa_bmzd` VALUES ('341F079F3C41409E83235BCDF4A08BBD', '2015-05-03 11:15:47', '浙江省温州市永嘉县', '1', '4.2.2.330324', '1', '4', '永嘉县', '24', 'YJX', null, '003033003024', null);
INSERT INTO `pa_bmzd` VALUES ('34308D41997B4077BE3411A6213D6543', '2015-05-03 11:15:47', '云南省临沧市', '1', '4.2.2.530900', '0', '3', '临沧市', '9', 'LCS', null, '003053009', null);
INSERT INTO `pa_bmzd` VALUES ('34367108129C4C47A54C3B8FD545576C', '2015-05-03 11:15:47', '贵州省黔东南苗族侗族自治州三穗县', '1', '4.2.2.522624', '1', '4', '三穗县', '24', 'SSX', null, '003052026024', null);
INSERT INTO `pa_bmzd` VALUES ('34453DCEB6C948589D5652FE24FF3BD1', '2015-05-03 11:15:47', '云南省丽江市古城区', '1', '4.2.2.530702', '1', '4', '古城区', '2', 'GCQ', null, '003053007002', null);
INSERT INTO `pa_bmzd` VALUES ('345A08286ACE4C6A8087E040D182DAC9', '2015-05-03 11:15:47', '广西壮族自治区百色市', '1', '4.2.2.451000', '0', '3', '百色市', '10', 'BSS', null, '003045010', null);
INSERT INTO `pa_bmzd` VALUES ('345AA9D3FFE24F2BA3E21F8FA075D0D6', '2015-05-03 11:15:47', '广西壮族自治区玉林市兴业县', '1', '4.2.2.450924', '1', '4', '兴业县', '24', 'XYX', null, '003045009024', null);
INSERT INTO `pa_bmzd` VALUES ('345ABC88D68343EA95E55687FA6E29E6', '2015-05-03 11:15:47', '河南省郑州市管城回族区', '1', '4.2.2.410104', '1', '4', '管城回族区', '4', 'GCHZQ', null, '003041001004', null);
INSERT INTO `pa_bmzd` VALUES ('3460439F40F04E22BE4FB7588D447AB4', '2015-05-03 11:15:47', '河南省郑州市中牟县', '1', '4.2.2.410122', '1', '4', '中牟县', '22', 'ZMX', null, '003041001022', null);
INSERT INTO `pa_bmzd` VALUES ('3463E029DA16429FB7E899FEC4BAC08F', '2015-05-03 11:15:47', '江苏省无锡市滨湖区', '1', '4.2.2.320211', '1', '4', '滨湖区', '11', 'BHQ', null, '003032002011', null);
INSERT INTO `pa_bmzd` VALUES ('347892E67F6B4797B29A6A0A4FFC1C81', '2015-05-03 11:15:47', '内蒙古自治区', '1', '4.2.2.150000', '0', '2', '内蒙古自治区', '15', 'NMGZZQ', null, '003015', null);
INSERT INTO `pa_bmzd` VALUES ('3481F540644848DB86EAE16AF977422B', '2015-05-03 11:15:47', '黑龙江省绥化市安达市', '1', '4.2.2.231281', '1', '4', '安达市', '81', 'ADS', null, '003023012081', null);
INSERT INTO `pa_bmzd` VALUES ('34835C6C4AE9473DBD808B07DC4BF92C', '2015-05-03 11:15:47', '广西壮族自治区崇左市天等县', '1', '4.2.2.451425', '1', '4', '天等县', '25', 'TDX', null, '003045014025', null);
INSERT INTO `pa_bmzd` VALUES ('348D048634874B27A40711CE5B15B07D', '2015-05-03 11:15:47', '江苏省盐城市建湖县', '1', '4.2.2.320925', '1', '4', '建湖县', '25', 'JHX', null, '003032009025', null);
INSERT INTO `pa_bmzd` VALUES ('3495406B8F154E858C0CE9B28AD75FAF', '2015-05-03 11:15:47', '四川省甘孜藏族自治州色达县', '1', '4.2.2.513333', '1', '4', '色达县', '33', 'SDX', null, '003051033033', null);
INSERT INTO `pa_bmzd` VALUES ('34966EE2CD4A4B9D92A58AA57CAF8CD2', '2015-05-03 11:15:47', '重庆市市辖区沙坪坝区', '1', '4.2.2.500106', '1', '4', '沙坪坝区', '6', 'SPBQ', null, '003050001006', null);
INSERT INTO `pa_bmzd` VALUES ('349BAAB7185642569D83788FD97CFDC7', '2015-05-03 11:15:47', '安徽省蚌埠市市辖区', '1', '4.2.2.340301', '1', '4', '市辖区', '1', 'SXQ', null, '003034003001', null);
INSERT INTO `pa_bmzd` VALUES ('34A2FE49EE97448082136455849C814F', '2015-05-03 11:15:47', '陕西省安康市平利县', '1', '4.2.2.610926', '1', '4', '平利县', '26', 'PLX', null, '003061009026', null);
INSERT INTO `pa_bmzd` VALUES ('34AC4AB0B7CC4146A2ABAA7B942D416C', '2015-05-03 11:15:47', '河北省石家庄市晋州市', '1', '4.2.2.130183', '1', '4', '晋州市', '83', 'JZS', null, '003013001083', null);
INSERT INTO `pa_bmzd` VALUES ('34B9A5E22398450399AA740840B89AE1', '2015-05-03 11:15:47', '河北省石家庄市无极县', '1', '4.2.2.130130', '1', '4', '无极县', '30', 'WJX', null, '003013001030', null);
INSERT INTO `pa_bmzd` VALUES ('34C07BE41C904B59956F0AC407123384', '2015-05-03 11:15:47', '甘肃省甘南藏族自治州合作市', '1', '4.2.2.623001', '1', '4', '合作市', '1', 'HZS', null, '003062030001', null);
INSERT INTO `pa_bmzd` VALUES ('34C43464900C443A87076DFC5DDFE3AD', '2015-05-03 11:15:47', '贵州省黔东南苗族侗族自治州施秉县', '1', '4.2.2.522623', '1', '4', '施秉县', '23', 'SBX', null, '003052026023', null);
INSERT INTO `pa_bmzd` VALUES ('34D8D2D406F44E7995B99227A5BA132A', '2015-05-03 11:15:47', '河南省郑州市', '1', '4.2.2.410100', '0', '3', '郑州市', '1', 'ZZS', null, '003041001', null);
INSERT INTO `pa_bmzd` VALUES ('34F2BB1493DB43E9A0945FA1139EF795', '2015-05-03 11:15:47', '安徽省六安市霍山县', '1', '4.2.2.341525', '1', '4', '霍山县', '25', 'HSX', null, '003034015025', null);
INSERT INTO `pa_bmzd` VALUES ('34F4F725E47E4C5F97BD4141671BBE3D', '2015-05-03 11:15:47', '河北省保定市易县', '1', '4.2.2.130633', '1', '4', '易县', '33', 'YX', null, '003013006033', null);
INSERT INTO `pa_bmzd` VALUES ('34FCC76F2BA245D3A0CCBB7D542AAC1F', '2015-05-03 11:15:47', '内蒙古自治区呼伦贝尔市莫力达瓦达斡尔族自治旗', '1', '4.2.2.150722', '1', '4', '莫力达瓦达斡尔族自治旗', '22', 'MLDWDWEZZZQ', null, '003015007022', null);
INSERT INTO `pa_bmzd` VALUES ('34FD2032A6B8445198553C2A8A1F9127', '2015-05-03 11:15:47', '湖南省邵阳市新邵县', '1', '4.2.2.430522', '1', '4', '新邵县', '22', 'XSX', null, '003043005022', null);
INSERT INTO `pa_bmzd` VALUES ('3502498EC5C2404ABC0D2E931B5E9815', '2015-05-03 11:15:47', '青海省西宁市', '1', '4.2.2.630100', '0', '3', '西宁市', '1', 'XNS', null, '003063001', null);
INSERT INTO `pa_bmzd` VALUES ('350774C0AF26473E8247E33187C08261', '2015-05-03 11:15:47', '山东省日照市岚山区', '1', '4.2.2.371103', '1', '4', '岚山区', '3', 'LSQ', null, '003037011003', null);
INSERT INTO `pa_bmzd` VALUES ('35123942E78C4E609C95A8CBE9B05894', '2015-05-03 11:15:47', '云南省临沧市市辖区', '1', '4.2.2.530901', '1', '4', '市辖区', '1', 'SXQ', null, '003053009001', null);
INSERT INTO `pa_bmzd` VALUES ('3513CAE77A28414F96B578911E785D53', '2015-05-03 11:15:47', '甘肃省武威市', '1', '4.2.2.620600', '0', '3', '武威市', '6', 'WWS', null, '003062006', null);
INSERT INTO `pa_bmzd` VALUES ('351962332BC1481CA3ABAB66EBE487A4', '2015-05-03 11:15:47', '四川省乐山市市辖区', '1', '4.2.2.511101', '1', '4', '市辖区', '1', 'SXQ', null, '003051011001', null);
INSERT INTO `pa_bmzd` VALUES ('354F0AD1D1A34ED888DAFBEA2DDBBBE0', '2015-05-03 11:15:47', '辽宁省锦州市凌海市', '1', '4.2.2.210781', '1', '4', '凌海市', '81', 'LHS', null, '003021007081', null);
INSERT INTO `pa_bmzd` VALUES ('355B2BFAA8154363A7C1177DAE862EE5', '2015-05-03 11:15:47', '广东省江门市恩平市', '1', '4.2.2.440785', '1', '4', '恩平市', '85', 'EPS', null, '003044007085', null);
INSERT INTO `pa_bmzd` VALUES ('3566FA230BAE4AF08950E6823B34DD4E', '2015-05-03 11:15:47', '浙江省金华市东阳市', '1', '4.2.2.330783', '1', '4', '东阳市', '83', 'DYS', null, '003033007083', null);
INSERT INTO `pa_bmzd` VALUES ('35738B9E805B4D268587D77AF70041BA', '2015-05-03 11:15:47', '四川省绵阳市涪城区', '1', '4.2.2.510703', '1', '4', '涪城区', '3', 'FCQ', null, '003051007003', null);
INSERT INTO `pa_bmzd` VALUES ('359550643E3C49B3A7864FD935728586', '2015-05-03 11:15:47', '新疆维吾尔自治区克孜勒苏柯尔克孜自治州乌恰县', '1', '4.2.2.653024', '1', '4', '乌恰县', '24', 'WQX', null, '003065030024', null);
INSERT INTO `pa_bmzd` VALUES ('35A278F3AC0943778F1F15F91F978CD6', '2015-05-03 11:15:47', '河北省邯郸市', '1', '4.2.2.130400', '0', '3', '邯郸市', '4', 'HDS', null, '003013004', null);
INSERT INTO `pa_bmzd` VALUES ('35B64F05D50B4ABF8C9728DC4C81A839', '2015-05-03 11:15:47', '广东省江门市江海区', '1', '4.2.2.440704', '1', '4', '江海区', '4', 'JHQ', null, '003044007004', null);
INSERT INTO `pa_bmzd` VALUES ('35B8B0328BEE47199FE0A3559E2DA28E', '2015-05-03 11:15:47', '广西壮族自治区梧州市', '1', '4.2.2.450400', '0', '3', '梧州市', '4', 'WZS', null, '003045004', null);
INSERT INTO `pa_bmzd` VALUES ('35C54C03A962489D929F16EB472610E4', '2015-05-03 11:15:47', '安徽省淮北市', '1', '4.2.2.340600', '0', '3', '淮北市', '6', 'HBS', null, '003034006', null);
INSERT INTO `pa_bmzd` VALUES ('35D54C239BB74F65ADDC8FC60CF58B37', '2015-05-03 11:15:47', '内蒙古自治区呼伦贝尔市鄂温克族自治旗', '1', '4.2.2.150724', '1', '4', '鄂温克族自治旗', '24', 'EWKZZZQ', null, '003015007024', null);
INSERT INTO `pa_bmzd` VALUES ('35D8D3CB36CC45A18777EC6B8EA5F9C7', '2015-05-03 11:15:47', '湖北省孝感市市辖区', '1', '4.2.2.420901', '1', '4', '市辖区', '1', 'SXQ', null, '003042009001', null);
INSERT INTO `pa_bmzd` VALUES ('35D9F6E2A80B4B46AFEB9188B1940800', '2015-05-03 11:15:47', '安徽省阜阳市颍泉区', '1', '4.2.2.341204', '1', '4', '颍泉区', '4', 'YQQ', null, '003034012004', null);
INSERT INTO `pa_bmzd` VALUES ('35DE010E90D44D4A9ABE85BF3A09C40D', '2015-05-03 11:15:47', '湖北省荆州市', '1', '4.2.2.421000', '0', '3', '荆州市', '10', 'JZS', null, '003042010', null);
INSERT INTO `pa_bmzd` VALUES ('35E40A51511B4BD3B9DAF053CE718C01', '2015-05-03 11:15:47', '云南省昭通市', '1', '4.2.2.530600', '0', '3', '昭通市', '6', 'ZTS', null, '003053006', null);
INSERT INTO `pa_bmzd` VALUES ('36037BF88A1C498CA8F09DF48AB9AF05', '2015-05-03 11:15:47', '河南省焦作市修武县', '1', '4.2.2.410821', '1', '4', '修武县', '21', 'XWX', null, '003041008021', null);
INSERT INTO `pa_bmzd` VALUES ('360DF38ECA224F31B5CED60127A5668C', '2015-05-03 11:15:47', '云南省红河哈尼族彝族自治州', '1', '4.2.2.532500', '0', '3', '红河哈尼族彝族自治州', '25', 'HHHNZYZZZZ', null, '003053025', null);
INSERT INTO `pa_bmzd` VALUES ('36197E246C264DA5AC4029E32350CE14', '2015-05-03 11:15:47', '河南省驻马店市平舆县', '1', '4.2.2.411723', '1', '4', '平舆县', '23', 'PYX', null, '003041017023', null);
INSERT INTO `pa_bmzd` VALUES ('361FDB5DC024476AA656920DBD92477E', '2015-05-03 11:15:47', '河南省安阳市滑县', '1', '4.2.2.410526', '1', '4', '滑县', '26', 'HX', null, '003041005026', null);
INSERT INTO `pa_bmzd` VALUES ('362D78995D8E4E4F8F112C1692641A3B', '2015-05-03 11:15:47', '西藏自治区昌都地区丁青县', '1', '4.2.2.542125', '1', '4', '丁青县', '25', 'DQX', null, '003054021025', null);
INSERT INTO `pa_bmzd` VALUES ('3636B0FA38AF4713A6FBA97BE3454C65', '2015-05-03 11:15:47', '天津市市辖区和平区', '1', '4.2.2.120101', '1', '4', '和平区', '1', 'HPQ', null, '003012001001', null);
INSERT INTO `pa_bmzd` VALUES ('36389C67166C428DAF7D1675FCF37568', '2015-05-03 11:15:47', '四川省凉山彝族自治州金阳县', '1', '4.2.2.513430', '1', '4', '金阳县', '30', 'JYX', null, '003051034030', null);
INSERT INTO `pa_bmzd` VALUES ('3655B29CD0F04332894520EBF661834B', '2015-05-03 11:15:47', '黑龙江省大兴安岭地区', '1', '4.2.2.232700', '0', '3', '大兴安岭地区', '27', 'DXALDQ', null, '003023027', null);
INSERT INTO `pa_bmzd` VALUES ('3679040A7B8F4A3BB41482C60F9B5A60', '2015-05-03 11:15:47', '西藏自治区', '1', '4.2.2.540000', '0', '2', '西藏自治区', '54', 'XZZZQ', null, '003054', null);
INSERT INTO `pa_bmzd` VALUES ('369000C9022C44C1B7EBEA14DABAC23D', '2015-05-03 11:15:47', '西藏自治区日喀则地区定结县', '1', '4.2.2.542332', '1', '4', '定结县', '32', 'DJX', null, '003054023032', null);
INSERT INTO `pa_bmzd` VALUES ('36A5F477C0794F40ACA5994F97B9E001', '2015-05-03 11:15:47', '河北省石家庄市新华区', '1', '4.2.2.130105', '1', '4', '新华区', '5', 'XHQ', null, '003013001005', null);
INSERT INTO `pa_bmzd` VALUES ('36AEC20CA7B94B9090C4C1C1E301A24C', '2015-05-03 11:15:47', '陕西省西安市雁塔区', '1', '4.2.2.610113', '1', '4', '雁塔区', '13', 'YTQ', null, '003061001013', null);
INSERT INTO `pa_bmzd` VALUES ('36C2C273993847498EB89C8995AC4303', '2015-05-03 11:15:47', '新疆维吾尔自治区阿勒泰地区', '1', '4.2.2.654300', '0', '3', '阿勒泰地区', '43', 'ALTDQ', null, '003065043', null);
INSERT INTO `pa_bmzd` VALUES ('36C91781935142D8AED210D3207C6B94', '2015-05-03 11:15:47', '吉林省松原市市辖区', '1', '4.2.2.220701', '1', '4', '市辖区', '1', 'SXQ', null, '003022007001', null);
INSERT INTO `pa_bmzd` VALUES ('36D344739B354FC8A6D938F520CF8212', '2015-05-03 11:15:47', '辽宁省葫芦岛市', '1', '4.2.2.211400', '0', '3', '葫芦岛市', '14', 'HLDS', null, '003021014', null);
INSERT INTO `pa_bmzd` VALUES ('36D7E6C7F5B04467B04BF8CC6BD34559', '2015-05-03 11:15:47', '上海市市辖区杨浦区', '1', '4.2.2.310110', '1', '4', '杨浦区', '10', 'YPQ', null, '003031001010', null);
INSERT INTO `pa_bmzd` VALUES ('36E5AFA54CEB4A0BA1C530DCE4E439A2', '2015-05-03 11:15:47', '吉林省四平市伊通满族自治县', '1', '4.2.2.220323', '1', '4', '伊通满族自治县', '23', 'YTMZZZX', null, '003022003023', null);
INSERT INTO `pa_bmzd` VALUES ('36E794D8F4B54E189BA6CCA563AB54C2', '2015-05-03 11:15:47', '河北省沧州市孟村回族自治县', '1', '4.2.2.130930', '1', '4', '孟村回族自治县', '30', 'MCHZZZX', null, '003013009030', null);
INSERT INTO `pa_bmzd` VALUES ('3718B6E1A06345A68C641F3F2D13AF62', '2015-05-03 11:15:47', '浙江省宁波市北仑区', '1', '4.2.2.330206', '1', '4', '北仑区', '6', 'BLQ', null, '003033002006', null);
INSERT INTO `pa_bmzd` VALUES ('3721495F7F4B4F8FBC50AC48C62705B1', '2015-05-03 11:15:47', '广西壮族自治区桂林市市辖区', '1', '4.2.2.450301', '1', '4', '市辖区', '1', 'SXQ', null, '003045003001', null);
INSERT INTO `pa_bmzd` VALUES ('374E4BE383074BB0B49A6C85CAA90F98', '2015-05-03 11:15:47', '四川省成都市龙泉驿区', '1', '4.2.2.510112', '1', '4', '龙泉驿区', '12', 'LQYQ', null, '003051001012', null);
INSERT INTO `pa_bmzd` VALUES ('3755FBF3D8624C4BB85F1DF92FAD802D', '2015-05-03 11:15:47', '内蒙古自治区通辽市奈曼旗', '1', '4.2.2.150525', '1', '4', '奈曼旗', '25', 'NMQ', null, '003015005025', null);
INSERT INTO `pa_bmzd` VALUES ('37698181FD534A25BB19BF6B7539EC5F', '2015-05-03 11:15:47', '浙江省金华市义乌市', '1', '4.2.2.330782', '1', '4', '义乌市', '82', 'YWS', null, '003033007082', null);
INSERT INTO `pa_bmzd` VALUES ('376C1D9BC90A4A8AB7EAD68266CB8476', '2015-05-03 11:15:47', '湖南省常德市石门县', '1', '4.2.2.430726', '1', '4', '石门县', '26', 'SMX', null, '003043007026', null);
INSERT INTO `pa_bmzd` VALUES ('377906C5898746E09A2B8433AD7715CA', '2015-05-03 11:15:47', '重庆市县开县', '1', '4.2.2.500234', '1', '4', '开县', '34', 'KX', null, '003050002034', null);
INSERT INTO `pa_bmzd` VALUES ('377F7F8A91DE42A1A09916F386DC4C39', '2015-05-03 11:15:47', '甘肃省定西市陇西县', '1', '4.2.2.621122', '1', '4', '陇西县', '22', 'LXX', null, '003062011022', null);
INSERT INTO `pa_bmzd` VALUES ('3781351EC052435F84A1E7C6074BC093', '2015-05-03 11:15:47', '山东省济宁市任城区', '1', '4.2.2.370811', '1', '4', '任城区', '11', 'RCQ', null, '003037008011', null);
INSERT INTO `pa_bmzd` VALUES ('378F3B368C374848B11E5E2135A98008', '2015-05-03 11:15:47', '甘肃省酒泉市阿克塞哈萨克族自治县', '1', '4.2.2.620924', '1', '4', '阿克塞哈萨克族自治县', '24', 'AKSHSKZZZX', null, '003062009024', null);
INSERT INTO `pa_bmzd` VALUES ('3790E606D11943CE8F79D5A053A4C840', '2015-05-03 11:15:47', '河北省秦皇岛市青龙满族自治县', '1', '4.2.2.130321', '1', '4', '青龙满族自治县', '21', 'QLMZZZX', null, '003013003021', null);
INSERT INTO `pa_bmzd` VALUES ('37A4397C62694252A52DBA69CEC32919', '2015-05-03 11:15:47', '河南省平顶山市市辖区', '1', '4.2.2.410401', '1', '4', '市辖区', '1', 'SXQ', null, '003041004001', null);
INSERT INTO `pa_bmzd` VALUES ('37B1CD66595F4EE4AD23CE44EB988679', '2015-05-03 11:15:47', '湖北省武汉市汉南区', '1', '4.2.2.420113', '1', '4', '汉南区', '13', 'HNQ', null, '003042001013', null);
INSERT INTO `pa_bmzd` VALUES ('37C5041C0BCB42038A7D811B176BF48B', '2015-05-03 11:15:47', '福建省南平市武夷山市', '1', '4.2.2.350782', '1', '4', '武夷山市', '82', 'WYSS', null, '003035007082', null);
INSERT INTO `pa_bmzd` VALUES ('37E79939BF1D4B8E97F0C0499F1B57E1', '2015-05-03 11:15:47', '黑龙江省绥化市', '1', '4.2.2.231200', '0', '3', '绥化市', '12', 'SHS', null, '003023012', null);
INSERT INTO `pa_bmzd` VALUES ('38006792A6F34DB78BBC0D2611341231', '2015-05-03 11:15:47', '西藏自治区日喀则地区仲巴县', '1', '4.2.2.542333', '1', '4', '仲巴县', '33', 'ZBX', null, '003054023033', null);
INSERT INTO `pa_bmzd` VALUES ('381DDC9910CE40D4B919281633CA58E2', '2015-05-03 11:15:47', '广东省佛山市三水区', '1', '4.2.2.440607', '1', '4', '三水区', '7', 'SSQ', null, '003044006007', null);
INSERT INTO `pa_bmzd` VALUES ('3822EB18AEBE4114BFD6A18270AE8B6A', '2015-05-03 11:15:47', '吉林省吉林市', '1', '4.2.2.220200', '0', '3', '吉林市', '2', 'JLS', null, '003022002', null);
INSERT INTO `pa_bmzd` VALUES ('382AF191D5634B4ABE57C4F0B076E3CC', '2015-05-03 11:15:47', '广东省清远市佛冈县', '1', '4.2.2.441821', '1', '4', '佛冈县', '21', 'BGX', null, '003044018021', null);
INSERT INTO `pa_bmzd` VALUES ('384A5FD13BC44D7D8ABEB32795ADC46E', '2015-05-03 11:15:47', '云南省曲靖市富源县', '1', '4.2.2.530325', '1', '4', '富源县', '25', 'FYX', null, '003053003025', null);
INSERT INTO `pa_bmzd` VALUES ('38516E9CEC1A461DB15F4D7126C82C75', '2015-05-03 11:15:47', '河南省洛阳市涧西区', '1', '4.2.2.410305', '1', '4', '涧西区', '5', 'JXQ', null, '003041003005', null);
INSERT INTO `pa_bmzd` VALUES ('38734199CD8C4916AF2A748B45A7F615', '2015-05-03 11:15:47', '山西省运城市盐湖区', '1', '4.2.2.140802', '1', '4', '盐湖区', '2', 'YHQ', null, '003014008002', null);
INSERT INTO `pa_bmzd` VALUES ('387649B0199A4343910024F2771244DF', '2015-05-03 11:15:47', '浙江省绍兴市市辖区', '1', '4.2.2.330601', '1', '4', '市辖区', '1', 'SXQ', null, '003033006001', null);
INSERT INTO `pa_bmzd` VALUES ('389739FF5A84401C8C86456DF6048DD8', '2015-05-03 11:15:47', '陕西省延安市市辖区', '1', '4.2.2.610601', '1', '4', '市辖区', '1', 'SXQ', null, '003061006001', null);
INSERT INTO `pa_bmzd` VALUES ('38A318D728CC4C1C926415332D48DFD1', '2015-05-03 11:15:47', '广东省广州市从化市', '1', '4.2.2.440184', '1', '4', '从化市', '84', 'CHS', null, '003044001084', null);
INSERT INTO `pa_bmzd` VALUES ('38B07DBD9BFD435B9000D94215547FB3', '2015-05-03 11:15:47', '广东省佛山市市辖区', '1', '4.2.2.440601', '1', '4', '市辖区', '1', 'SXQ', null, '003044006001', null);
INSERT INTO `pa_bmzd` VALUES ('38D0FC5A1A4F465CA309C08F0AC7E534', '2015-05-03 11:15:47', '河南省许昌市', '1', '4.2.2.411000', '0', '3', '许昌市', '10', 'XCS', null, '003041010', null);
INSERT INTO `pa_bmzd` VALUES ('38D129E8F4E9483BA47DBF9696ADC99E', '2015-05-03 11:15:47', '安徽省黄山市歙县', '1', '4.2.2.341021', '1', '4', '歙县', '21', 'XX', null, '003034010021', null);
INSERT INTO `pa_bmzd` VALUES ('38F571AAD9A14298A8C7ED0B8C8A1696', '2015-05-03 11:15:47', '河南省焦作市武陟县', '1', '4.2.2.410823', '1', '4', '武陟县', '23', 'WZX', null, '003041008023', null);
INSERT INTO `pa_bmzd` VALUES ('39040532DF6746CD93026D90F34F92D1', '2015-05-03 11:15:47', '广东省云浮市罗定市', '1', '4.2.2.445381', '1', '4', '罗定市', '81', 'LDS', null, '003044053081', null);
INSERT INTO `pa_bmzd` VALUES ('391AF4AE4A8E4BC997027AB58172D799', '2015-05-03 11:15:47', '新疆维吾尔自治区乌鲁木齐市新市区', '1', '4.2.2.650104', '1', '4', '新市区', '4', 'XSQ', null, '003065001004', null);
INSERT INTO `pa_bmzd` VALUES ('39279ABA9BB743B9BA8A9A53C00FF3CE', '2015-05-03 11:15:47', '安徽省池州市东至县', '1', '4.2.2.341721', '1', '4', '东至县', '21', 'DZX', null, '003034017021', null);
INSERT INTO `pa_bmzd` VALUES ('39677FDDB853479396732C2EDA1B31B4', '2015-05-03 11:15:47', '湖南省永州市蓝山县', '1', '4.2.2.431127', '1', '4', '蓝山县', '27', 'LSX', null, '003043011027', null);
INSERT INTO `pa_bmzd` VALUES ('39728D86D1E34C7E91D334919A7B225D', '2015-05-03 11:15:47', '江苏省无锡市崇安区', '1', '4.2.2.320202', '1', '4', '崇安区', '2', 'CAQ', null, '003032002002', null);
INSERT INTO `pa_bmzd` VALUES ('39873CE3A79340BE8DF4517BA48DD8A0', '2015-05-03 11:15:47', '山西省', '1', '4.2.2.140000', '0', '2', '山西省', '14', 'SXS', null, '003014', null);
INSERT INTO `pa_bmzd` VALUES ('39901E4C2B5D4B6BB9323FBE361887C1', '2015-05-03 11:15:47', '黑龙江省佳木斯市抚远县', '1', '4.2.2.230833', '1', '4', '抚远县', '33', 'FYX', null, '003023008033', null);
INSERT INTO `pa_bmzd` VALUES ('39903204E48F4F7DAAB23B92251D4136', '2015-05-03 11:15:47', '江苏省扬州市市辖区', '1', '4.2.2.321001', '1', '4', '市辖区', '1', 'SXQ', null, '003032010001', null);
INSERT INTO `pa_bmzd` VALUES ('3999D800FB9C47D4822DFEA20B5CCE3D', '2015-05-03 11:15:47', '安徽省阜阳市市辖区', '1', '4.2.2.341201', '1', '4', '市辖区', '1', 'SXQ', null, '003034012001', null);
INSERT INTO `pa_bmzd` VALUES ('39A06872DD994BB8AFC1ADD7A4C0428C', '2015-05-03 11:15:47', '陕西省渭南市潼关县', '1', '4.2.2.610522', '1', '4', '潼关县', '22', 'TGX', null, '003061005022', null);
INSERT INTO `pa_bmzd` VALUES ('39A8AD5732AE48FAAC4AA43CC595ECCA', '2015-05-03 11:15:47', '江西省吉安市井冈山市', '1', '4.2.2.360881', '1', '4', '井冈山市', '81', 'JGSS', null, '003036008081', null);
INSERT INTO `pa_bmzd` VALUES ('39FB4B5AFC2E4903827911780788B250', '2015-05-03 11:15:47', '云南省丽江市玉龙纳西族自治县', '1', '4.2.2.530721', '1', '4', '玉龙纳西族自治县', '21', 'YLNXZZZX', null, '003053007021', null);
INSERT INTO `pa_bmzd` VALUES ('3A1113D0E6854845A938B53329B43007', '2015-05-03 11:15:47', '辽宁省营口市老边区', '1', '4.2.2.210811', '1', '4', '老边区', '11', 'LBQ', null, '003021008011', null);
INSERT INTO `pa_bmzd` VALUES ('3A17AA43785D400690092512196D5BC8', '2015-05-03 11:15:47', '四川省成都市武侯区', '1', '4.2.2.510107', '1', '4', '武侯区', '7', 'WHQ', null, '003051001007', null);
INSERT INTO `pa_bmzd` VALUES ('3A33292A03644798BB1BCA7F94751D9C', '2015-05-03 11:15:47', '江西省吉安市永丰县', '1', '4.2.2.360825', '1', '4', '永丰县', '25', 'YFX', null, '003036008025', null);
INSERT INTO `pa_bmzd` VALUES ('3A4A654D05AE4E4B8DB92D4D1520E2A8', '2015-05-03 11:15:47', '甘肃省甘南藏族自治州夏河县', '1', '4.2.2.623027', '1', '4', '夏河县', '27', 'XHX', null, '003062030027', null);
INSERT INTO `pa_bmzd` VALUES ('3A531DE990494A3584794F28A69665C8', '2015-05-03 11:15:47', '黑龙江省佳木斯市桦川县', '1', '4.2.2.230826', '1', '4', '桦川县', '26', 'HCX', null, '003023008026', null);
INSERT INTO `pa_bmzd` VALUES ('3A56ECC5DA6E44CDA76C2BC43F0CCA66', '2015-05-03 11:15:47', '河北省邢台市沙河市', '1', '4.2.2.130582', '1', '4', '沙河市', '82', 'SHS', null, '003013005082', null);
INSERT INTO `pa_bmzd` VALUES ('3ACCA396977349BEAD588E5663A2ACA1', '2015-05-03 11:15:47', '湖南省永州市零陵区', '1', '4.2.2.431102', '1', '4', '零陵区', '2', 'LLQ', null, '003043011002', null);
INSERT INTO `pa_bmzd` VALUES ('3AD0DBE5F36E453ABB463E4D6521A0D5', '2015-05-03 11:15:47', '山西省临汾市', '1', '4.2.2.141000', '0', '3', '临汾市', '10', 'LFS', null, '003014010', null);
INSERT INTO `pa_bmzd` VALUES ('3AE6E5B54DD340919CF670980D82FEAE', '2015-05-03 11:15:47', '黑龙江省哈尔滨市五常市', '1', '4.2.2.230184', '1', '4', '五常市', '84', 'WCS', null, '003023001084', null);
INSERT INTO `pa_bmzd` VALUES ('3AE6F0C31FFF4CA599AD16D2F4545B28', '2015-05-03 11:15:47', '新疆维吾尔自治区自治区直辖县级行政区划', '1', '4.2.2.659000', '0', '3', '自治区直辖县级行政区划', '90', 'ZZQZXXJXZQH', null, '003065090', null);
INSERT INTO `pa_bmzd` VALUES ('3AE7721259C14671AB04256B771AD219', '2015-05-03 11:15:47', '浙江省台州市温岭市', '1', '4.2.2.331081', '1', '4', '温岭市', '81', 'WLS', null, '003033010081', null);
INSERT INTO `pa_bmzd` VALUES ('3AE9A767816448E19E785C8739C09E86', '2015-05-03 11:15:47', '贵州省毕节市大方县', '1', '4.2.2.522422', '1', '4', '大方县', '21', 'DFX', null, '003052005021', null);
INSERT INTO `pa_bmzd` VALUES ('3B266A279CB64681B11C8034D13858AB', '2015-05-03 11:15:47', '新疆维吾尔自治区巴音郭楞蒙古自治州焉耆回族自治县', '1', '4.2.2.652826', '1', '4', '焉耆回族自治县', '26', 'YQHZZZX', null, '003065028026', null);
INSERT INTO `pa_bmzd` VALUES ('3B391A5F7729410EB1E23B8BEB0B7367', '2015-05-03 11:15:47', '四川省凉山彝族自治州会东县', '1', '4.2.2.513426', '1', '4', '会东县', '26', 'KDX', null, '003051034026', null);
INSERT INTO `pa_bmzd` VALUES ('3B47B0D365E44860BF5ECCE8E8C60638', '2015-05-03 11:15:47', '新疆维吾尔自治区巴音郭楞蒙古自治州若羌县', '1', '4.2.2.652824', '1', '4', '若羌县', '24', 'RQX', null, '003065028024', null);
INSERT INTO `pa_bmzd` VALUES ('3B4843B5C4F44AD5B78168748DE7FEFB', '2015-05-03 11:15:47', '湖南省长沙市浏阳市', '1', '4.2.2.430181', '1', '4', '浏阳市', '81', 'LYS', null, '003043001081', null);
INSERT INTO `pa_bmzd` VALUES ('3B6765E1C06243B5B6BB0D67891BE9FA', '2015-05-03 11:15:47', '河南省焦作市温县', '1', '4.2.2.410825', '1', '4', '温县', '25', 'WX', null, '003041008025', null);
INSERT INTO `pa_bmzd` VALUES ('3B6B5D2BA8364FB18EC5E9BE0F8653CF', '2015-05-03 11:15:47', '陕西省宝鸡市麟游县', '1', '4.2.2.610329', '1', '4', '麟游县', '29', 'LYX', null, '003061003029', null);
INSERT INTO `pa_bmzd` VALUES ('3B6E105D9C40454EB4C86B3FD83F5EA7', '2015-05-03 11:15:47', '贵州省六盘水市', '1', '4.2.2.520200', '0', '3', '六盘水市', '2', 'LPSS', null, '003052002', null);
INSERT INTO `pa_bmzd` VALUES ('3B7163F6FFFF4A5BA01212FCD6733B3E', '2015-05-03 11:15:47', '贵州省黔南布依族苗族自治州都匀市', '1', '4.2.2.522701', '1', '4', '都匀市', '1', 'DYS', null, '003052027001', null);
INSERT INTO `pa_bmzd` VALUES ('3B94D5B3ED164D7DACED5377B1FB085C', '2015-05-03 11:15:47', '湖南省益阳市安化县', '1', '4.2.2.430923', '1', '4', '安化县', '23', 'AHX', null, '003043009023', null);
INSERT INTO `pa_bmzd` VALUES ('3B980D408C104F40A9AE080B0F7C2B2C', '2015-05-03 11:15:47', '新疆维吾尔自治区昌吉回族自治州', '1', '4.2.2.652300', '0', '3', '昌吉回族自治州', '23', 'CJHZZZZ', null, '003065023', null);
INSERT INTO `pa_bmzd` VALUES ('3BA0A5785A614D4F8D9295EE4A3B701F', '2015-05-03 11:15:47', '安徽省蚌埠市', '1', '4.2.2.340300', '0', '3', '蚌埠市', '3', 'BBS', null, '003034003', null);
INSERT INTO `pa_bmzd` VALUES ('3BA213FFCAE2458AB151456E28378EFB', '2015-05-03 11:15:47', '山东省临沂市沂南县', '1', '4.2.2.371321', '1', '4', '沂南县', '21', 'YNX', null, '003037013021', null);
INSERT INTO `pa_bmzd` VALUES ('3BA883A5D06647CBBC9D14B8A2FCD2AC', '2015-05-03 11:15:47', '陕西省渭南市蒲城县', '1', '4.2.2.610526', '1', '4', '蒲城县', '26', 'PCX', null, '003061005026', null);
INSERT INTO `pa_bmzd` VALUES ('3BAE02DF4EB948E383B3F242F8C4C2B6', '2015-05-03 11:15:47', '广西壮族自治区贵港市', '1', '4.2.2.450800', '0', '3', '贵港市', '8', 'GGS', null, '003045008', null);
INSERT INTO `pa_bmzd` VALUES ('3BB4F64B5EFA4CEC9D79B03A9274C23A', '2015-05-03 11:15:47', '黑龙江省齐齐哈尔市富拉尔基区', '1', '4.2.2.230206', '1', '4', '富拉尔基区', '6', 'FLEJQ', null, '003023002006', null);
INSERT INTO `pa_bmzd` VALUES ('3BCA7687D0CF473C9A97254E7EE6655A', '2015-05-03 11:15:47', '湖南省株洲市天元区', '1', '4.2.2.430211', '1', '4', '天元区', '11', 'TYQ', null, '003043002011', null);
INSERT INTO `pa_bmzd` VALUES ('3BCC006334614F29851C097CF5CF0A76', '2015-05-03 11:15:47', '甘肃省甘南藏族自治州迭部县', '1', '4.2.2.623024', '1', '4', '迭部县', '24', 'DBX', null, '003062030024', null);
INSERT INTO `pa_bmzd` VALUES ('3BE218050A164BB99395A45370E172F4', '2015-05-03 11:15:47', '河北省邯郸市市辖区', '1', '4.2.2.130401', '1', '4', '市辖区', '1', 'SXQ', null, '003013004001', null);
INSERT INTO `pa_bmzd` VALUES ('3C0D0F77B10E468DB93712B1F10BFFA2', '2015-05-03 11:15:47', '湖南省常德市', '1', '4.2.2.430700', '0', '3', '常德市', '7', 'CDS', null, '003043007', null);
INSERT INTO `pa_bmzd` VALUES ('3C2E39547FF34C098B97D0EC7FC3EF78', '2015-05-03 11:15:47', '广西壮族自治区河池市巴马瑶族自治县', '1', '4.2.2.451227', '1', '4', '巴马瑶族自治县', '27', 'BMYZZZX', null, '003045012027', null);
INSERT INTO `pa_bmzd` VALUES ('3C3612C889FB43F0BE971CEEF02B8BFA', '2015-05-03 11:15:47', '新疆维吾尔自治区伊犁哈萨克自治州', '1', '4.2.2.654000', '0', '3', '伊犁哈萨克自治州', '40', 'YLHSKZZZ', null, '003065040', null);
INSERT INTO `pa_bmzd` VALUES ('3C527E720C2340F4B62D53EADC778921', '2015-05-03 11:15:47', '山东省德州市平原县', '1', '4.2.2.371426', '1', '4', '平原县', '26', 'PYX', null, '003037014026', null);
INSERT INTO `pa_bmzd` VALUES ('3C5509B61F664EBB80DCA2DC4A05C896', '2015-05-03 11:15:47', '江苏省泰州市泰兴市', '1', '4.2.2.321283', '1', '4', '泰兴市', '83', 'TXS', null, '003032012083', null);
INSERT INTO `pa_bmzd` VALUES ('3C5EB06170944EFAA3AB85729EE55162', '2015-05-03 11:15:47', '新疆维吾尔自治区巴音郭楞蒙古自治州尉犁县', '1', '4.2.2.652823', '1', '4', '尉犁县', '23', 'YLX', null, '003065028023', null);
INSERT INTO `pa_bmzd` VALUES ('3C5F37906E9B4358AA9B9556C4F5A485', '2015-05-03 11:15:47', '湖南省湘潭市岳塘区', '1', '4.2.2.430304', '1', '4', '岳塘区', '4', 'YTQ', null, '003043003004', null);
INSERT INTO `pa_bmzd` VALUES ('3C660414AFDE4BD79585BC8176F8BE30', '2015-05-03 11:15:47', '江西省南昌市湾里区', '1', '4.2.2.360105', '1', '4', '湾里区', '5', 'WLQ', null, '003036001005', null);
INSERT INTO `pa_bmzd` VALUES ('3C779F569C1540F78E75FCBA6F99970D', '2015-05-03 11:15:47', '河南省商丘市', '1', '4.2.2.411400', '0', '3', '商丘市', '14', 'SQS', null, '003041014', null);
INSERT INTO `pa_bmzd` VALUES ('3C7DBC27C1114298AFD084330D1FE82E', '2015-05-03 11:15:47', '黑龙江省佳木斯市前进区', '1', '4.2.2.230804', '1', '4', '前进区', '4', 'QJQ', null, '003023008004', null);
INSERT INTO `pa_bmzd` VALUES ('3C81ADBEEDD440E8BCD3981735F88A0B', '2015-05-03 11:15:47', '广西壮族自治区来宾市金秀瑶族自治县', '1', '4.2.2.451324', '1', '4', '金秀瑶族自治县', '24', 'JXYZZZX', null, '003045013024', null);
INSERT INTO `pa_bmzd` VALUES ('3C89108BD628484D85F0224CD537CDFD', '2015-05-03 11:15:47', '重庆市县梁平县', '1', '4.2.2.500228', '1', '4', '梁平县', '28', 'LPX', null, '003050002028', null);
INSERT INTO `pa_bmzd` VALUES ('3CA114B502D941A5B88473CEF0CDEC9C', '2015-05-03 11:15:47', '山东省临沂市平邑县', '1', '4.2.2.371326', '1', '4', '平邑县', '26', 'PYX', null, '003037013026', null);
INSERT INTO `pa_bmzd` VALUES ('3CA363404FC5488A83D19FE3A02C9CCC', '2015-05-03 11:15:47', '西藏自治区山南地区乃东县', '1', '4.2.2.542221', '1', '4', '乃东县', '21', 'NDX', null, '003054022021', null);
INSERT INTO `pa_bmzd` VALUES ('3CA42867A3C5496294A60B06C0C1E85E', '2015-05-03 11:15:47', '贵州省贵阳市小河区', '1', '4.2.2.520114', '1', '4', '小河区', '14', 'XHQ', null, '003052001014', null);
INSERT INTO `pa_bmzd` VALUES ('3CA745CAF95C4DDBB01CA0CEE9129210', '2015-05-03 11:15:47', '广东省肇庆市市辖区', '1', '4.2.2.441201', '1', '4', '市辖区', '1', 'SXQ', null, '003044012001', null);
INSERT INTO `pa_bmzd` VALUES ('3CB185BF74CD41058AA6BE09BC27E58F', '2015-05-03 11:15:47', '江西省抚州市广昌县', '1', '4.2.2.361030', '1', '4', '广昌县', '30', 'GCX', null, '003036010030', null);
INSERT INTO `pa_bmzd` VALUES ('3CB1F00D91FD450DBA32A60265C7E670', '2015-05-03 11:15:47', '江西省抚州市黎川县', '1', '4.2.2.361022', '1', '4', '黎川县', '22', 'LCX', null, '003036010022', null);
INSERT INTO `pa_bmzd` VALUES ('3CB859B919424F0D88DEF28F06AAB6F3', '2015-05-03 11:15:47', '吉林省辽源市', '1', '4.2.2.220400', '0', '3', '辽源市', '4', 'LYS', null, '003022004', null);
INSERT INTO `pa_bmzd` VALUES ('3D0883974A3B465791A5476AF62A89AE', '2015-05-03 11:15:47', '江西省南昌市市辖区', '1', '4.2.2.360101', '1', '4', '市辖区', '1', 'SXQ', null, '003036001001', null);
INSERT INTO `pa_bmzd` VALUES ('3D22DA4CC1394B0AA6B323FD606F1F8A', '2015-05-03 11:15:47', '海南省省直辖县级行政区划儋州市', '1', '4.2.2.469003', '1', '4', '儋州市', '3', 'DZS', null, '003046090003', null);
INSERT INTO `pa_bmzd` VALUES ('3D2B157EBEA0493FAEF5CD75D2B3EFAB', '2015-05-03 11:15:47', '海南省', '1', '4.2.2.460000', '0', '2', '海南省', '46', 'HNS', null, '003046', null);
INSERT INTO `pa_bmzd` VALUES ('3D378A08379B44CEAD5D042CC02E4A56', '2015-05-03 11:15:47', '河南省南阳市西峡县', '1', '4.2.2.411323', '1', '4', '西峡县', '23', 'XXX', null, '003041013023', null);
INSERT INTO `pa_bmzd` VALUES ('3D3D818E4D5C4D94BDBCDCC8204F14BF', '2015-05-03 11:15:47', '海南省海口市琼山区', '1', '4.2.2.460107', '1', '4', '琼山区', '7', 'QSQ', null, '003046001007', null);
INSERT INTO `pa_bmzd` VALUES ('3D419473E418472E861CA610267FD64D', '2015-05-03 11:15:47', '安徽省合肥市瑶海区', '1', '4.2.2.340102', '1', '4', '瑶海区', '2', 'YHQ', null, '003034001002', null);
INSERT INTO `pa_bmzd` VALUES ('3D47B1425F9B4B4DBABD3098F664D364', '2015-05-03 11:15:47', '湖南省衡阳市耒阳市', '1', '4.2.2.430481', '1', '4', '耒阳市', '81', 'LYS', null, '003043004081', null);
INSERT INTO `pa_bmzd` VALUES ('3D4CD4325D314280AF588CF9156C5C9A', '2015-05-03 11:15:47', '湖南省郴州市桂阳县', '1', '4.2.2.431021', '1', '4', '桂阳县', '21', 'GYX', null, '003043010021', null);
INSERT INTO `pa_bmzd` VALUES ('3D53DC5B7FBE45C3A5326787ECAB53D2', '2015-05-03 11:15:47', '宁夏回族自治区吴忠市青铜峡市', '1', '4.2.2.640381', '1', '4', '青铜峡市', '81', 'QTXS', null, '003064003081', null);
INSERT INTO `pa_bmzd` VALUES ('3D6AFBD8148F48A1B00ECF61F1562CCB', '2015-05-03 11:15:47', '贵州省贵阳市开阳县', '1', '4.2.2.520121', '1', '4', '开阳县', '21', 'KYX', null, '003052001021', null);
INSERT INTO `pa_bmzd` VALUES ('3D98B433B9414342A03B2E2319E46586', '2015-05-03 11:15:47', '内蒙古自治区阿拉善盟额济纳旗', '1', '4.2.2.152923', '1', '4', '额济纳旗', '23', 'EJNQ', null, '003015029023', null);
INSERT INTO `pa_bmzd` VALUES ('3DA15EB8604847A0BBE7BFC2FAEFAFB0', '2015-05-03 11:15:47', '四川省广安市市辖区', '1', '4.2.2.511601', '1', '4', '市辖区', '1', 'SXQ', null, '003051016001', null);
INSERT INTO `pa_bmzd` VALUES ('3DC19437C4DD4FC6939255354DA8BF1A', '2015-05-03 11:15:47', '吉林省白山市靖宇县', '1', '4.2.2.220622', '1', '4', '靖宇县', '22', 'JYX', null, '003022006022', null);
INSERT INTO `pa_bmzd` VALUES ('3DCE314ADF924839A500C4B52A8A68CC', '2015-05-03 11:15:47', '山西省吕梁市方山县', '1', '4.2.2.141128', '1', '4', '方山县', '28', 'FSX', null, '003014011028', null);
INSERT INTO `pa_bmzd` VALUES ('3DFDF8B2BC9A43D9BB9F49090F66B262', '2015-05-03 11:15:47', '贵州省毕节市', '1', '4.2.2.522400', '0', '3', '毕节市', '5', 'BJS', null, '003052005', null);
INSERT INTO `pa_bmzd` VALUES ('3E0D2615A5DA49719F5765363B092FA9', '2015-05-03 11:15:47', '辽宁省大连市普兰店市', '1', '4.2.2.210282', '1', '4', '普兰店市', '82', 'PLDS', null, '003021002082', null);
INSERT INTO `pa_bmzd` VALUES ('3E0EB97AD11B4F29884E05ECC4D6AA63', '2015-05-03 11:15:47', '陕西省宝鸡市市辖区', '1', '4.2.2.610301', '1', '4', '市辖区', '1', 'SXQ', null, '003061003001', null);
INSERT INTO `pa_bmzd` VALUES ('3E381018DC994DCCB7B53D0E0CA802D7', '2015-05-03 11:15:47', '江苏省南京市白下区', '1', '4.2.2.320103', '1', '4', '白下区', '3', 'BXQ', null, '003032001003', null);
INSERT INTO `pa_bmzd` VALUES ('3E48B34062214021B0773652B64D04A1', '2015-05-03 11:15:47', '新疆维吾尔自治区伊犁哈萨克自治州霍城县', '1', '4.2.2.654023', '1', '4', '霍城县', '23', 'HCX', null, '003065040023', null);
INSERT INTO `pa_bmzd` VALUES ('3E6C310844D345B9ADDB2AF2170DC937', '2015-05-03 11:15:47', '浙江省杭州市', '1', '4.2.2.330100', '0', '3', '杭州市', '1', 'HZS', null, '003033001', null);
INSERT INTO `pa_bmzd` VALUES ('3E6F663F57304B8EAB1BF3A02680BFE0', '2015-05-03 11:15:47', '山东省临沂市莒南县', '1', '4.2.2.371327', '1', '4', '莒南县', '27', 'JNX', null, '003037013027', null);
INSERT INTO `pa_bmzd` VALUES ('3E8617672EFA4F8FA9699FBB57308FB5', '2015-05-03 11:15:47', '黑龙江省佳木斯市同江市', '1', '4.2.2.230881', '1', '4', '同江市', '81', 'TJS', null, '003023008081', null);
INSERT INTO `pa_bmzd` VALUES ('3EA384CE8825475B93E0418871E04000', '2015-05-03 11:15:47', '四川省广安市', '1', '4.2.2.511600', '0', '3', '广安市', '16', 'GAS', null, '003051016', null);
INSERT INTO `pa_bmzd` VALUES ('3EB30041B0B74860864047014ECAFECE', '2015-05-03 11:15:47', '四川省宜宾市南溪区', '1', '4.2.2.511522', '1', '4', '南溪区', '3', 'NXQ', null, '003051015003', null);
INSERT INTO `pa_bmzd` VALUES ('3EB75391C6C54233881889B7629D5CE2', '2015-05-03 11:15:47', '内蒙古自治区兴安盟阿尔山市', '1', '4.2.2.152202', '1', '4', '阿尔山市', '2', 'AESS', null, '003015022002', null);
INSERT INTO `pa_bmzd` VALUES ('3EBE1D2B32CD41C1955742B2A874E7B1', '2015-05-03 11:15:47', '云南省大理白族自治州南涧彝族自治县', '1', '4.2.2.532926', '1', '4', '南涧彝族自治县', '26', 'NJYZZZX', null, '003053029026', null);
INSERT INTO `pa_bmzd` VALUES ('3ED6D1D0A07C49B5A001F5DD922A94B5', '2015-05-03 11:15:47', '黑龙江省哈尔滨市道外区', '1', '4.2.2.230104', '1', '4', '道外区', '4', 'DWQ', null, '003023001004', null);
INSERT INTO `pa_bmzd` VALUES ('3EDC0CA90AA2477DA29B0D65E712B2B0', '2015-05-03 11:15:47', '西藏自治区山南地区琼结县', '1', '4.2.2.542225', '1', '4', '琼结县', '25', 'QJX', null, '003054022025', null);
INSERT INTO `pa_bmzd` VALUES ('3EE629664CB34A71B055D9858F00BA68', '2015-05-03 11:15:47', '广东省潮州市', '1', '4.2.2.445100', '0', '3', '潮州市', '51', 'CZS', null, '003044051', null);
INSERT INTO `pa_bmzd` VALUES ('3EFDCFB1FEA74D78A9E716BD1F1C24C4', '2015-05-03 11:15:47', '新疆维吾尔自治区阿勒泰地区哈巴河县', '1', '4.2.2.654324', '1', '4', '哈巴河县', '24', 'HBHX', null, '003065043024', null);
INSERT INTO `pa_bmzd` VALUES ('3F139297FBCC423B8BB1DCC0D532502C', '2015-05-03 11:15:47', '新疆维吾尔自治区伊犁哈萨克自治州奎屯市', '1', '4.2.2.654003', '1', '4', '奎屯市', '3', 'KZS', null, '003065040003', null);
INSERT INTO `pa_bmzd` VALUES ('3F1A08BBE7914AB9A90826CB33C9355A', '2015-05-03 11:15:47', '江苏省常州市钟楼区', '1', '4.2.2.320404', '1', '4', '钟楼区', '4', 'ZLQ', null, '003032004004', null);
INSERT INTO `pa_bmzd` VALUES ('3F2785B3AE764E318437E2FD2CEE3801', '2015-05-03 11:15:47', '吉林省辽源市龙山区', '1', '4.2.2.220402', '1', '4', '龙山区', '2', 'LSQ', null, '003022004002', null);
INSERT INTO `pa_bmzd` VALUES ('3F3AA6D2EE92497EB694CBD099BD893C', '2015-05-03 11:15:47', '云南省昆明市', '1', '4.2.2.530100', '0', '3', '昆明市', '1', 'KMS', null, '003053001', null);
INSERT INTO `pa_bmzd` VALUES ('3F5944B6D9874B248EA96EC6CF65DAE6', '2015-05-03 11:15:47', '山西省晋中市', '1', '4.2.2.140700', '0', '3', '晋中市', '7', 'JZS', null, '003014007', null);
INSERT INTO `pa_bmzd` VALUES ('3F8038517D354E6084176E0B513CB250', '2015-05-03 11:15:47', '陕西省宝鸡市渭滨区', '1', '4.2.2.610302', '1', '4', '渭滨区', '2', 'WBQ', null, '003061003002', null);
INSERT INTO `pa_bmzd` VALUES ('3F833E025B514D5D8CD160BB692C3E43', '2015-05-03 11:15:47', '吉林省长春市市辖区', '1', '4.2.2.220101', '1', '4', '市辖区', '1', 'SXQ', null, '003022001001', null);
INSERT INTO `pa_bmzd` VALUES ('3F9AE8629FD14CAD9A633A14C8C660DF', '2015-05-03 11:15:47', '四川省资阳市简阳市', '1', '4.2.2.512081', '1', '4', '简阳市', '81', 'JYS', null, '003051020081', null);
INSERT INTO `pa_bmzd` VALUES ('3FA25D7129794DC0A431F6365F9F15E4', '2015-05-03 11:15:47', '江西省九江市湖口县', '1', '4.2.2.360429', '1', '4', '湖口县', '29', 'HKX', null, '003036004029', null);
INSERT INTO `pa_bmzd` VALUES ('3FA96721AF7649B080E546F99B1C20EB', '2015-05-03 11:15:47', '湖南省怀化市沅陵县', '1', '4.2.2.431222', '1', '4', '沅陵县', '22', 'YLX', null, '003043012022', null);
INSERT INTO `pa_bmzd` VALUES ('3FCBE49DC8594E82947CB19FB5FC83AF', '2015-05-03 11:15:47', '黑龙江省鸡西市麻山区', '1', '4.2.2.230307', '1', '4', '麻山区', '7', 'MSQ', null, '003023003007', null);
INSERT INTO `pa_bmzd` VALUES ('3FDF33DD03F94F01A203A100DA65C5D8', '2015-05-03 11:15:47', '辽宁省朝阳市龙城区', '1', '4.2.2.211303', '1', '4', '龙城区', '3', 'LCQ', null, '003021013003', null);
INSERT INTO `pa_bmzd` VALUES ('3FE10F1678AC418FB6FCA74E78E53059', '2015-05-03 11:15:47', '河南省安阳市内黄县', '1', '4.2.2.410527', '1', '4', '内黄县', '27', 'NHX', null, '003041005027', null);
INSERT INTO `pa_bmzd` VALUES ('3FEABD5F597F474F8C54CF50FD89183D', '2015-05-03 11:15:47', '新疆维吾尔自治区喀什地区泽普县', '1', '4.2.2.653124', '1', '4', '泽普县', '24', 'ZPX', null, '003065031024', null);
INSERT INTO `pa_bmzd` VALUES ('3FEBCF642ED44FAFBA36C003E55FBC83', '2015-05-03 11:15:47', '广东省深圳市盐田区', '1', '4.2.2.440308', '1', '4', '盐田区', '8', 'YTQ', null, '003044003008', null);
INSERT INTO `pa_bmzd` VALUES ('4004D5C2F9024D11B4F61F65A45B4DA5', '2015-05-03 11:15:47', '西藏自治区阿里地区', '1', '4.2.2.542500', '0', '3', '阿里地区', '25', 'ALDQ', null, '003054025', null);
INSERT INTO `pa_bmzd` VALUES ('4018BA1D34D5443ABEDFDAF27889F329', '2015-05-03 11:15:47', '福建省福州市台江区', '1', '4.2.2.350103', '1', '4', '台江区', '3', 'TJQ', null, '003035001003', null);
INSERT INTO `pa_bmzd` VALUES ('4021361AE87848C48F628B3C00F3E1D3', '2015-05-03 11:15:47', '海南省省直辖县级行政区划昌江黎族自治县', '1', '4.2.2.469031', '1', '4', '昌江黎族自治县', '26', 'CJLZZZX', null, '003046090026', null);
INSERT INTO `pa_bmzd` VALUES ('402200073a4eb103013a4ee945250002', '2012-10-11 16:20:41', null, '1', '4.2.2', '0', '1', '中华人民共和国行政区划', '3', 'ZHRMGHGXZQH', null, '003', '0');
INSERT INTO `pa_bmzd` VALUES ('402200073a4eb103013a4f017c290003', '2012-10-11 16:47:08', '台湾省', '1', '4.2.2.710000', '1', '2', '台湾省', '71', 'TWS', null, '003066', '0');
INSERT INTO `pa_bmzd` VALUES ('402200073a4eb103013a4f01ab640004', '2012-10-11 16:47:20', '香港特别行政区', '1', '4.2.2.810000', '1', '2', '香港特别行政区', '81', 'XGTBXZQ', null, '003067', '0');
INSERT INTO `pa_bmzd` VALUES ('402200073a4eb103013a4f01ece60005', '2012-10-11 16:47:37', '澳门特别行政区', '1', '4.2.2.820000', '1', '2', '澳门特别行政区', '82', 'AMTBXZQ', null, '003068', '0');
INSERT INTO `pa_bmzd` VALUES ('4023D5DBD4D947E087C1EAFDCCA435B3', '2015-05-03 11:15:47', '广东省深圳市龙岗区', '1', '4.2.2.440307', '1', '4', '龙岗区', '7', 'LGQ', null, '003044003007', null);
INSERT INTO `pa_bmzd` VALUES ('4038A9402B344E4A81F947E660AB2617', '2015-05-03 11:15:47', '吉林省白山市', '1', '4.2.2.220600', '0', '3', '白山市', '6', 'BSS', null, '003022006', null);
INSERT INTO `pa_bmzd` VALUES ('404BBF64B2B442519F9E49547D06A036', '2015-05-03 11:15:47', '福建省福州市闽侯县', '1', '4.2.2.350121', '1', '4', '闽侯县', '21', 'MHX', null, '003035001021', null);
INSERT INTO `pa_bmzd` VALUES ('40579EDF77624D84A6F86439A964923E', '2015-05-03 11:15:47', '黑龙江省伊春市红星区', '1', '4.2.2.230715', '1', '4', '红星区', '15', 'HXQ', null, '003023007015', null);
INSERT INTO `pa_bmzd` VALUES ('405B64C6E41F4935AAE1F3682FCDD302', '2015-05-03 11:15:47', '陕西省咸阳市彬县', '1', '4.2.2.610427', '1', '4', '彬县', '27', 'BX', null, '003061004027', null);
INSERT INTO `pa_bmzd` VALUES ('4088B5730F7A48599DF142F01BFA5770', '2015-05-03 11:15:47', '四川省成都市新都区', '1', '4.2.2.510114', '1', '4', '新都区', '14', 'XDQ', null, '003051001014', null);
INSERT INTO `pa_bmzd` VALUES ('40939738513449C9BCE1A548161911BA', '2015-05-03 11:15:47', '四川省甘孜藏族自治州稻城县', '1', '4.2.2.513337', '1', '4', '稻城县', '37', 'DCX', null, '003051033037', null);
INSERT INTO `pa_bmzd` VALUES ('40A1E5E8E5E749839B525F5888E2F80E', '2015-05-03 11:15:47', '山西省临汾市乡宁县', '1', '4.2.2.141029', '1', '4', '乡宁县', '29', 'XNX', null, '003014010029', null);
INSERT INTO `pa_bmzd` VALUES ('40BF4D7EC7E14DDABC6EF43165A1A26D', '2015-05-03 11:15:47', '吉林省白城市', '1', '4.2.2.220800', '0', '3', '白城市', '8', 'BCS', null, '003022008', null);
INSERT INTO `pa_bmzd` VALUES ('40C33D63DF3A4CD0A46693A23320832B', '2015-05-03 11:15:47', '江苏省南京市雨花台区', '1', '4.2.2.320114', '1', '4', '雨花台区', '14', 'YHTQ', null, '003032001014', null);
INSERT INTO `pa_bmzd` VALUES ('40DE50F15120480AB0A558FD3DB9F0CC', '2015-05-03 11:15:47', '山西省阳泉市市辖区', '1', '4.2.2.140301', '1', '4', '市辖区', '1', 'SXQ', null, '003014003001', null);
INSERT INTO `pa_bmzd` VALUES ('412F8046506C4B8B83116C1EA4F2951C', '2015-05-03 11:15:47', '云南省曲靖市', '1', '4.2.2.530300', '0', '3', '曲靖市', '3', 'QJS', null, '003053003', null);
INSERT INTO `pa_bmzd` VALUES ('416209FF4C9045C8ABB4015430299015', '2015-05-03 11:15:47', '贵州省黔西南布依族苗族自治州兴仁县', '1', '4.2.2.522322', '1', '4', '兴仁县', '22', 'XRX', null, '003052023022', null);
INSERT INTO `pa_bmzd` VALUES ('4179E676CC0B467899B51010BB2B6A89', '2015-05-03 11:15:47', '广西壮族自治区崇左市江洲区', '1', '4.2.2.451402', '1', '4', '江洲区', '2', 'JZQ', null, '003045014002', null);
INSERT INTO `pa_bmzd` VALUES ('41819A73ABFE42FE93E889ABEA1589B5', '2015-05-03 11:15:47', '浙江省绍兴市诸暨市', '1', '4.2.2.330681', '1', '4', '诸暨市', '81', 'ZJS', null, '003033006081', null);
INSERT INTO `pa_bmzd` VALUES ('41A35708A33B4FFD828C153273CBD5D0', '2015-05-03 11:15:47', '山东省临沂市苍山县', '1', '4.2.2.371324', '1', '4', '苍山县', '24', 'CSX', null, '003037013024', null);
INSERT INTO `pa_bmzd` VALUES ('41D671CAAB1A421D8F3B1D8D4A7960D1', '2015-05-03 11:15:47', '内蒙古自治区赤峰市元宝山区', '1', '4.2.2.150403', '1', '4', '元宝山区', '3', 'YBSQ', null, '003015004003', null);
INSERT INTO `pa_bmzd` VALUES ('41E337E75D454A59BD2F8BFC3D70A7AB', '2015-05-03 11:15:47', '江西省上饶市市辖区', '1', '4.2.2.361101', '1', '4', '市辖区', '1', 'SXQ', null, '003036011001', null);
INSERT INTO `pa_bmzd` VALUES ('41F203EA9AC0457DAE011801FB18D29A', '2015-05-03 11:15:47', '海南省省直辖县级行政区划定安县', '1', '4.2.2.469025', '1', '4', '定安县', '21', 'DAX', null, '003046090021', null);
INSERT INTO `pa_bmzd` VALUES ('41F3141C3DDC49E3995D4B859FB67C37', '2015-05-03 11:15:47', '四川省南充市阆中市', '1', '4.2.2.511381', '1', '4', '阆中市', '81', 'LZS', null, '003051013081', null);
INSERT INTO `pa_bmzd` VALUES ('41F6A4AB143B4D6D8E17C299DD2CD13B', '2015-05-03 11:15:47', '云南省红河哈尼族彝族自治州蒙自市', '1', '4.2.2.532522', '1', '4', '蒙自市', '3', 'MZS', null, '003053025003', null);
INSERT INTO `pa_bmzd` VALUES ('42048F2D9A714960B67D0ABCF994D57F', '2015-05-03 11:15:47', '湖北省荆门市京山县', '1', '4.2.2.420821', '1', '4', '京山县', '21', 'JSX', null, '003042008021', null);
INSERT INTO `pa_bmzd` VALUES ('4215AFB81F014113B8277957CEE5FEDD', '2015-05-03 11:15:47', '湖北省孝感市孝南区', '1', '4.2.2.420902', '1', '4', '孝南区', '2', 'XNQ', null, '003042009002', null);
INSERT INTO `pa_bmzd` VALUES ('423360167328437B8E8CAEC98A457C77', '2015-05-03 11:15:47', '河南省新乡市长垣县', '1', '4.2.2.410728', '1', '4', '长垣县', '28', 'ZYX', null, '003041007028', null);
INSERT INTO `pa_bmzd` VALUES ('423CFDFC79874BC3861670201CEC3721', '2015-05-03 11:15:47', '内蒙古自治区呼和浩特市市辖区', '1', '4.2.2.150101', '1', '4', '市辖区', '1', 'SXQ', null, '003015001001', null);
INSERT INTO `pa_bmzd` VALUES ('424F739FC4D348E8854B0850D2092377', '2015-05-03 11:15:47', '宁夏回族自治区银川市灵武市', '1', '4.2.2.640181', '1', '4', '灵武市', '81', 'LWS', null, '003064001081', null);
INSERT INTO `pa_bmzd` VALUES ('425C0EF205A54E54BC93A86BFC392EF1', '2015-05-03 11:15:47', '山东省莱芜市市辖区', '1', '4.2.2.371201', '1', '4', '市辖区', '1', 'SXQ', null, '003037012001', null);
INSERT INTO `pa_bmzd` VALUES ('425E1629E57845A78918679C1A6D6A9B', '2015-05-03 11:15:47', '贵州省毕节市织金县', '1', '4.2.2.522425', '1', '4', '织金县', '24', 'ZJX', null, '003052005024', null);
INSERT INTO `pa_bmzd` VALUES ('426D7CE6829245C2BB04EFFCF7BA253E', '2015-05-03 11:15:47', '山东省潍坊市昌乐县', '1', '4.2.2.370725', '1', '4', '昌乐县', '25', 'CYX', null, '003037007025', null);
INSERT INTO `pa_bmzd` VALUES ('429B6D6230E843FA969A680C932663C3', '2015-05-03 11:15:47', '山东省济南市历下区', '1', '4.2.2.370102', '1', '4', '历下区', '2', 'LXQ', null, '003037001002', null);
INSERT INTO `pa_bmzd` VALUES ('429F8E5E69C34471B90BD3D4DEB7A01F', '2015-05-03 11:15:47', '广东省汕尾市陆河县', '1', '4.2.2.441523', '1', '4', '陆河县', '23', 'LHX', null, '003044015023', null);
INSERT INTO `pa_bmzd` VALUES ('42B8993DC25B47C38709563868C92E7C', '2015-05-03 11:15:47', '河南省驻马店市新蔡县', '1', '4.2.2.411729', '1', '4', '新蔡县', '29', 'XCX', null, '003041017029', null);
INSERT INTO `pa_bmzd` VALUES ('42C22E5DFD5445618EAE044FAF2F6289', '2015-05-03 11:15:47', '内蒙古自治区呼和浩特市回民区', '1', '4.2.2.150103', '1', '4', '回民区', '3', 'HMQ', null, '003015001003', null);
INSERT INTO `pa_bmzd` VALUES ('430F8D9F71C34AD6942F7EF18E633905', '2015-05-03 11:15:47', '河北省张家口市宣化区', '1', '4.2.2.130705', '1', '4', '宣化区', '5', 'XHQ', null, '003013007005', null);
INSERT INTO `pa_bmzd` VALUES ('431BA4873FA54F33B3AB2F5DB52A2E95', '2015-05-03 11:15:47', '湖南省常德市临澧县', '1', '4.2.2.430724', '1', '4', '临澧县', '24', 'LLX', null, '003043007024', null);
INSERT INTO `pa_bmzd` VALUES ('431BE6E4E167448791DD4C13110F57EB', '2015-05-03 11:15:47', '河南省驻马店市泌阳县', '1', '4.2.2.411726', '1', '4', '泌阳县', '26', 'MYX', null, '003041017026', null);
INSERT INTO `pa_bmzd` VALUES ('432C4BAA96A94A5CA4CC375E52BF12E8', '2015-05-03 11:15:47', '四川省广元市', '1', '4.2.2.510800', '0', '3', '广元市', '8', 'GYS', null, '003051008', null);
INSERT INTO `pa_bmzd` VALUES ('432E8D57F990458B86F23FA0D7CF6855', '2015-05-03 11:15:47', '河南省商丘市永城市', '1', '4.2.2.411481', '1', '4', '永城市', '81', 'YCS', null, '003041014081', null);
INSERT INTO `pa_bmzd` VALUES ('4351B15ABB9C4F8DA46537CAC300E731', '2015-05-03 11:15:47', '贵州省安顺市紫云苗族布依族自治县', '1', '4.2.2.520425', '1', '4', '紫云苗族布依族自治县', '25', 'ZYMZBYZZZX', null, '003052004025', null);
INSERT INTO `pa_bmzd` VALUES ('43897734A9B347F5BC018DB520AAE2BF', '2015-05-03 11:15:47', '云南省昆明市禄劝彝族苗族自治县', '1', '4.2.2.530128', '1', '4', '禄劝彝族苗族自治县', '28', 'LQYZMZZZX', null, '003053001028', null);
INSERT INTO `pa_bmzd` VALUES ('43927A981B6848A58F2EE7A33B7CA648', '2015-05-03 11:15:47', '广西壮族自治区桂林市平乐县', '1', '4.2.2.450330', '1', '4', '平乐县', '30', 'PYX', null, '003045003030', null);
INSERT INTO `pa_bmzd` VALUES ('43983CE258494AE28D48B1372F4F330E', '2015-05-03 11:15:47', '湖北省十堰市市辖区', '1', '4.2.2.420301', '1', '4', '市辖区', '1', 'SXQ', null, '003042003001', null);
INSERT INTO `pa_bmzd` VALUES ('4399751D27E34C1CAAD1B67EBFD94A10', '2015-05-03 11:15:47', '江西省九江市浔阳区', '1', '4.2.2.360403', '1', '4', '浔阳区', '3', 'XYQ', null, '003036004003', null);
INSERT INTO `pa_bmzd` VALUES ('43DB0B0FD9E04D8F97197C2F940EC6B2', '2015-05-03 11:15:47', '海南省海口市市辖区', '1', '4.2.2.460101', '1', '4', '市辖区', '1', 'SXQ', null, '003046001001', null);
INSERT INTO `pa_bmzd` VALUES ('43FF54F35BE344038021D76611E351A3', '2015-05-03 11:15:47', '湖南省邵阳市市辖区', '1', '4.2.2.430501', '1', '4', '市辖区', '1', 'SXQ', null, '003043005001', null);
INSERT INTO `pa_bmzd` VALUES ('4433C006323A4409B353BEFEB2D03EC6', '2015-05-03 11:15:47', '浙江省金华市婺城区', '1', '4.2.2.330702', '1', '4', '婺城区', '2', 'WCQ', null, '003033007002', null);
INSERT INTO `pa_bmzd` VALUES ('443CE165EF2248A4BA7C5D4E6CDECF0E', '2015-05-03 11:15:47', '河北省邢台市威县', '1', '4.2.2.130533', '1', '4', '威县', '33', 'WX', null, '003013005033', null);
INSERT INTO `pa_bmzd` VALUES ('446A30A99C004F118BA0ECD26EE62038', '2015-05-03 11:15:47', '广东省河源市连平县', '1', '4.2.2.441623', '1', '4', '连平县', '23', 'LPX', null, '003044016023', null);
INSERT INTO `pa_bmzd` VALUES ('4474C36E3D034041A567D6210C74CADF', '2015-05-03 11:15:47', '广东省潮州市潮安县', '1', '4.2.2.445121', '1', '4', '潮安县', '21', 'CAX', null, '003044051021', null);

-- ----------------------------
-- Table structure for process
-- ----------------------------
DROP TABLE IF EXISTS `process`;
CREATE TABLE `process` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `processName` varchar(255) DEFAULT NULL,
  `startDT` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `endDT` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `state` int(11) DEFAULT '0',
  `docId` int(11) DEFAULT '0',
  `arriveDT` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `applyUserId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of process
-- ----------------------------
INSERT INTO `process` VALUES ('6', 'admin-报销单-2015-05-04', '2015-05-04 22:41:39', null, '4', '12', '2015-05-05 00:33:31', '7');
INSERT INTO `process` VALUES ('9', 'admin申请报销', '2015-05-06 23:16:44', null, '2', '15', '2015-05-06 23:23:12', '1');

-- ----------------------------
-- Table structure for process_history
-- ----------------------------
DROP TABLE IF EXISTS `process_history`;
CREATE TABLE `process_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `operateDT` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `operateDetail` varchar(255) DEFAULT NULL,
  `process_id` int(11) NOT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_process` (`process_id`),
  CONSTRAINT `fk_process` FOREIGN KEY (`process_id`) REFERENCES `process` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of process_history
-- ----------------------------
INSERT INTO `process_history` VALUES ('5', '1', '2015-05-04 00:03:32', 'admin 于 2015-05-04申请报销单成功,下一步执行人为蒯季', '6', null);
INSERT INTO `process_history` VALUES ('6', '18', '2015-05-05 00:19:20', '会计：蒯季审批通过,下一步执行人为:钟敬礼', '6', null);
INSERT INTO `process_history` VALUES ('7', '18', '2015-05-05 00:23:42', '会计：蒯季审批通过,下一步执行人为:钟敬礼', '6', null);
INSERT INTO `process_history` VALUES ('8', '18', '2015-05-05 00:31:05', '会计：蒯季审批通过,下一步执行人为:钟敬礼', '6', null);
INSERT INTO `process_history` VALUES ('9', '16', '2015-05-05 00:33:07', '总经理：钟敬礼审批通过,下一步执行人为:楚娜', '6', null);
INSERT INTO `process_history` VALUES ('10', '17', '2015-05-05 00:33:31', '出纳：楚娜出纳成功!报销流程结束', '6', null);
INSERT INTO `process_history` VALUES ('13', '1', '2015-05-06 23:16:44', 'admin 于 2015-05-06申请报销单成功,下一步执行人为蒯季', '9', null);
INSERT INTO `process_history` VALUES ('14', '18', '2015-05-06 23:23:12', '会计：蒯季审批通过,下一步执行人为:钟敬礼', '9', null);

-- ----------------------------
-- Table structure for projectappropriateaccount
-- ----------------------------
DROP TABLE IF EXISTS `projectappropriateaccount`;
CREATE TABLE `projectappropriateaccount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectAreg_id` int(11) NOT NULL,
  `times` int(11) NOT NULL,
  `toAccountFee` double DEFAULT NULL,
  `toAccountDT` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `applyFee` double DEFAULT NULL,
  `applyDT` timestamp NULL DEFAULT NULL,
  `actualFee` double DEFAULT NULL,
  `actualDT` timestamp NULL DEFAULT NULL,
  `payee` varchar(50) DEFAULT NULL,
  `bank` varchar(150) DEFAULT NULL,
  `accountNum` varchar(50) DEFAULT NULL,
  `remark1` varchar(255) DEFAULT NULL,
  `remark2` varchar(255) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of projectappropriateaccount
-- ----------------------------

-- ----------------------------
-- Table structure for projectappropriatereg
-- ----------------------------
DROP TABLE IF EXISTS `projectappropriatereg`;
CREATE TABLE `projectappropriatereg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectName` varchar(150) DEFAULT NULL,
  `payee` varchar(50) DEFAULT NULL,
  `bank` varchar(150) DEFAULT NULL,
  `accountNum` varchar(150) DEFAULT NULL,
  `contactName` varchar(50) DEFAULT NULL,
  `contactTel` varchar(50) DEFAULT NULL,
  `contactIdCard` varchar(50) DEFAULT NULL,
  `managerFeeRate` double DEFAULT NULL,
  `managerFee` double DEFAULT NULL,
  `bidPrice` double DEFAULT NULL,
  `bidDT` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `contractDuration` double DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of projectappropriatereg
-- ----------------------------
INSERT INTO `projectappropriatereg` VALUES ('1', '111', '1', '1', '1', '1', '1', '1', '25', '1', '1', '2015-05-13 00:00:00', null, '1', '0');

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
-- Table structure for reimbursement
-- ----------------------------
DROP TABLE IF EXISTS `reimbursement`;
CREATE TABLE `reimbursement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `startDT` timestamp NULL DEFAULT NULL,
  `endDT` timestamp NULL DEFAULT NULL,
  `place_id` int(128) DEFAULT NULL,
  `workDetail` varchar(255) DEFAULT NULL,
  `costDetail` varchar(255) DEFAULT NULL,
  `trafficFee` double(255,2) DEFAULT NULL,
  `mealFee` double(255,2) DEFAULT NULL,
  `officeFee` double(255,2) DEFAULT NULL,
  `receiveFee` double(255,2) DEFAULT NULL,
  `badgeFee` double(255,2) DEFAULT NULL,
  `communicationFee` double(255,2) DEFAULT NULL,
  `trainFee` double(255,2) DEFAULT NULL,
  `otherFee` double(255,2) DEFAULT NULL,
  `process_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reimbursement
-- ----------------------------
INSERT INTO `reimbursement` VALUES ('12', '2015-05-08 00:00:00', '2015-05-28 00:00:00', '55', 'fdas', 'fasfdsaf', null, null, null, null, null, null, null, null, '6');
INSERT INTO `reimbursement` VALUES ('15', '2015-05-27 00:00:00', '2015-05-19 00:00:00', '56', '111', '111', '1.00', null, null, null, '1.00', null, null, null, '9');

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
  `lvs` int(11) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_dictionary
-- ----------------------------
INSERT INTO `sys_dictionary` VALUES ('1', 'super', '管理员', '2', '0', '0', '0', null, null);
INSERT INTO `sys_dictionary` VALUES ('55', 'common', '普通用户', '2', '0', '0', '1', null, null);
INSERT INTO `sys_dictionary` VALUES ('10', '001', '系统集成商', '4', '1', '0', '1', null, null);
INSERT INTO `sys_dictionary` VALUES ('13', '002', '运维服务商', '4', '0', '0', '1', null, null);
INSERT INTO `sys_dictionary` VALUES ('14', '003', '软件开发厂商', '4', '3', '0', '1', null, null);
INSERT INTO `sys_dictionary` VALUES ('15', '1', '软件故障', '5', '1', '0', '1', null, null);
INSERT INTO `sys_dictionary` VALUES ('16', '2', '硬件故障', '5', '2', '0', '1', null, null);
INSERT INTO `sys_dictionary` VALUES ('17', '1101', '系统崩溃', '6', '1', '0', '1', null, null);
INSERT INTO `sys_dictionary` VALUES ('18', '1102', '软件崩溃', '6', '2', '0', '1', null, null);
INSERT INTO `sys_dictionary` VALUES ('19', '1103', '功能故障', '6', '3', '0', '1', null, null);
INSERT INTO `sys_dictionary` VALUES ('20', '1104', '数据维护', '6', '4', '0', '1', null, null);
INSERT INTO `sys_dictionary` VALUES ('21', '1105', '功能变更', '6', '5', '0', '1', null, null);
INSERT INTO `sys_dictionary` VALUES ('22', '1106', '设备接入', '6', '6', '0', '1', null, null);
INSERT INTO `sys_dictionary` VALUES ('23', '100001', '未开始', '7', '1', '0', '1', null, null);
INSERT INTO `sys_dictionary` VALUES ('24', '100002', '正在进行', '7', '2', '0', '1', null, null);
INSERT INTO `sys_dictionary` VALUES ('25', '100003', '已完成', '7', '3', '0', '1', null, null);
INSERT INTO `sys_dictionary` VALUES ('26', '100004', '未完成', '7', '4', '0', '1', null, null);
INSERT INTO `sys_dictionary` VALUES ('27', '0001', 'java项目', '8', '0', '0', '1', null, null);
INSERT INTO `sys_dictionary` VALUES ('28', '0002', 'C#项目', '8', '1', '0', '1', null, null);
INSERT INTO `sys_dictionary` VALUES ('29', 'glzd', '管理制度', '12', '0', '0', '1', null, null);
INSERT INTO `sys_dictionary` VALUES ('30', 'zsglk', '知识管理库', '12', '1', '0', '1', null, null);
INSERT INTO `sys_dictionary` VALUES ('31', 'tzgg', '通知公告', '12', '2', '0', '1', null, null);
INSERT INTO `sys_dictionary` VALUES ('32', 'tzgg', '通知公告', '11', '0', '0', '1', null, null);
INSERT INTO `sys_dictionary` VALUES ('33', 'glzd', '管理制度', '11', '1', '0', '1', null, null);
INSERT INTO `sys_dictionary` VALUES ('34', 'htgl', '合同管理', '11', '3', '0', '1', null, null);
INSERT INTO `sys_dictionary` VALUES ('35', 'rjgl', '软件管理', '11', '4', '0', '1', null, null);
INSERT INTO `sys_dictionary` VALUES ('36', 'xmgl', '项目管理', '11', '5', '0', '1', null, null);
INSERT INTO `sys_dictionary` VALUES ('37', 'zskgl', '知识库管理', '11', '6', '0', '1', null, null);
INSERT INTO `sys_dictionary` VALUES ('38', 'daytype', '日维护', '10', '0', '0', '1', null, null);
INSERT INTO `sys_dictionary` VALUES ('39', 'weektype', '周维护', '10', '1', '0', '1', null, null);
INSERT INTO `sys_dictionary` VALUES ('40', 'monthtype', '月维护', '10', '2', '0', '1', null, null);
INSERT INTO `sys_dictionary` VALUES ('41', 'quartertype', '季维护', '10', '3', '0', '1', null, null);
INSERT INTO `sys_dictionary` VALUES ('42', 'yeartype', '年维护', '10', '4', '0', '1', null, null);
INSERT INTO `sys_dictionary` VALUES ('43', 'sbjr', '设备接入', '10', '5', '0', '1', null, null);
INSERT INTO `sys_dictionary` VALUES ('44', 'jsbz', '技术保障', '10', '5', '0', '1', null, null);
INSERT INTO `sys_dictionary` VALUES ('58', '003034', '安徽省', '14', '1', '0', '1', '2', '安徽省');
INSERT INTO `sys_dictionary` VALUES ('47', 'rcwh', '日常维护', '11', '7', '0', '1', null, null);
INSERT INTO `sys_dictionary` VALUES ('48', '004', '设备厂商', '4', '2', '0', '1', null, null);
INSERT INTO `sys_dictionary` VALUES ('49', 'xdfw', '巡点服务', '11', '8', '0', '1', null, null);
INSERT INTO `sys_dictionary` VALUES ('50', 'sgl', '水果类', '13', '0', '0', '1', null, null);
INSERT INTO `sys_dictionary` VALUES ('51', 'ml', '米类', '13', '1', '0', '1', null, null);
INSERT INTO `sys_dictionary` VALUES ('52', 'tlmfl', '调料面粉类', '13', '2', '0', '1', null, null);
INSERT INTO `sys_dictionary` VALUES ('53', 'qdl', '禽蛋类', '13', '3', '0', '1', null, null);
INSERT INTO `sys_dictionary` VALUES ('54', 'ghl', '干货类', '13', '4', '0', '1', null, null);
INSERT INTO `sys_dictionary` VALUES ('57', '003', '中华人民共和国', '14', '0', '0', '1', '1', '中华人民共和国');
INSERT INTO `sys_dictionary` VALUES ('59', '003041', '河南省', '14', '2', '0', '1', '2', '河南省');
INSERT INTO `sys_dictionary` VALUES ('60', '003034004 ', '淮南市 ', '14', '3', '0', '1', '3', '安徽省淮南市 ');
INSERT INTO `sys_dictionary` VALUES ('61', '003034013', '宿州市', '14', '4', '0', '1', '3', '安徽省宿州市');
INSERT INTO `sys_dictionary` VALUES ('62', '003034018', '宣城市', '14', '0', '0', '1', '3', '安徽省宣城市');
INSERT INTO `sys_dictionary` VALUES ('63', ' 003034001', '合肥市', '14', '0', '0', '1', '3', '安徽省合肥市');
INSERT INTO `sys_dictionary` VALUES ('64', '003041014', '商丘市', '14', '1', '0', '1', '3', '河南省商丘市');
INSERT INTO `sys_dictionary` VALUES ('65', '003034001022', '肥东县', '14', '0', '0', '1', '4', '安徽省合肥市肥东县');
INSERT INTO `sys_dictionary` VALUES ('66', '003034001004', '蜀山区', '14', '0', '0', '1', '4', '安徽省合肥市蜀山区');
INSERT INTO `sys_dictionary` VALUES ('67', '003041014003', '睢阳区', '14', '0', '0', '1', '4', '河南省商丘市睢阳区');
INSERT INTO `sys_dictionary` VALUES ('68', '003041014024', '柘城县', '14', '0', '0', '1', '3', '河南省商丘市柘城县');
INSERT INTO `sys_dictionary` VALUES ('69', 'qqq', 'qqq', '64', '0', '0', '1', '0', 'qqq');

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
) ENGINE=MyISAM AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;

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
INSERT INTO `sys_dictionarytype` VALUES ('14', '003', '行政区划', '0', '中国行政区划', null);
INSERT INTO `sys_dictionarytype` VALUES ('15', '003001', '北京市', '0', null, '14');
INSERT INTO `sys_dictionarytype` VALUES ('16', '003034', '安徽省', '1', '', '14');
INSERT INTO `sys_dictionarytype` VALUES ('18', '003034004', '淮南市', '0', '安徽省淮南市', '16');
INSERT INTO `sys_dictionarytype` VALUES ('17', '003041', '河南省', '2', null, '14');
INSERT INTO `sys_dictionarytype` VALUES ('19', '003034013', '宿州市', '1', '安徽省宿州市', '16');
INSERT INTO `sys_dictionarytype` VALUES ('20', '003034018', '宣城市', '2', '安徽省宣城市', '16');
INSERT INTO `sys_dictionarytype` VALUES ('21', '003034007', '铜陵市', '4', '安徽省铜陵市', '16');
INSERT INTO `sys_dictionarytype` VALUES ('22', '003034016', '亳州市', '5', '安徽省亳州市', '16');
INSERT INTO `sys_dictionarytype` VALUES ('23', '003034002', '芜湖市', '6', '安徽省芜湖市', '16');
INSERT INTO `sys_dictionarytype` VALUES ('24', '003034012', '阜阳市', '7', '安徽省阜阳市', '16');
INSERT INTO `sys_dictionarytype` VALUES ('25', '003034015', '六安市', '8', '安徽省六安市', '16');
INSERT INTO `sys_dictionarytype` VALUES ('26', '003034008', '安庆市', '9', '安徽省安庆市', '16');
INSERT INTO `sys_dictionarytype` VALUES ('27', '003034001', '合肥市', '10', '安徽省合肥市', '16');
INSERT INTO `sys_dictionarytype` VALUES ('28', '003034010', '黄山市', '11', '安徽省黄山市', '16');
INSERT INTO `sys_dictionarytype` VALUES ('29', '003034011', '滁州市', '12', '安徽省滁州市', '16');
INSERT INTO `sys_dictionarytype` VALUES ('30', '003034005', '马鞍山市', '13', '安徽省马鞍山市', '16');
INSERT INTO `sys_dictionarytype` VALUES ('31', '003034017', '池州市', '14', '安徽省池州市', '16');
INSERT INTO `sys_dictionarytype` VALUES ('32', '003034006', '淮北市', '15', '安徽省淮北市', '16');
INSERT INTO `sys_dictionarytype` VALUES ('33', '003034003', '蚌埠市', '16', '安徽省蚌埠市', '16');
INSERT INTO `sys_dictionarytype` VALUES ('34', '003041011', '漯河市', '3', '河南省漯河市', '17');
INSERT INTO `sys_dictionarytype` VALUES ('35', '003041008', '焦作市', '0', '河南省焦作市', '17');
INSERT INTO `sys_dictionarytype` VALUES ('36', '003041017', '驻马店市', '1', '河南省驻马店市', '17');
INSERT INTO `sys_dictionarytype` VALUES ('37', '003041003', '洛阳市', '2', '河南省洛阳市', '17');
INSERT INTO `sys_dictionarytype` VALUES ('38', '003041002', '开封市', '4', '河南省开封市', '17');
INSERT INTO `sys_dictionarytype` VALUES ('39', '003041015', '信阳市', '5', '河南省信阳市', '17');
INSERT INTO `sys_dictionarytype` VALUES ('40', '003041013', '南阳市', '6', '河南省南阳市', '17');
INSERT INTO `sys_dictionarytype` VALUES ('41', '003041005', '安阳市', '7', '河南省安阳市', '17');
INSERT INTO `sys_dictionarytype` VALUES ('42', '003041012', '三门峡市', '8', '河南省三门峡市', '17');
INSERT INTO `sys_dictionarytype` VALUES ('43', '003041090', '省直辖县级行政区划', '9', '河南省省直辖县级行政区划', '17');
INSERT INTO `sys_dictionarytype` VALUES ('44', '003041009', '濮阳市', '10', '河南省濮阳市', '17');
INSERT INTO `sys_dictionarytype` VALUES ('45', '003041016', '周口市', '11', '河南省周口市', '17');
INSERT INTO `sys_dictionarytype` VALUES ('46', '003041004', '平顶山市', '12', '河南省平顶山市', '17');
INSERT INTO `sys_dictionarytype` VALUES ('47', '003041006', '鹤壁市', '13', '河南省鹤壁市', '17');
INSERT INTO `sys_dictionarytype` VALUES ('48', '003041007', '新乡市', '14', '河南省新乡市', '17');
INSERT INTO `sys_dictionarytype` VALUES ('49', '003041001', '郑州市', '15', '河南省郑州市', '17');
INSERT INTO `sys_dictionarytype` VALUES ('50', '003041010', '许昌市', '16', '河南省许昌市', '17');
INSERT INTO `sys_dictionarytype` VALUES ('51', '003041014', '商丘市', '17', '河南省商丘市', '17');
INSERT INTO `sys_dictionarytype` VALUES ('52', '003034001022', '肥东县', '4', '安徽省合肥市肥东县', '27');
INSERT INTO `sys_dictionarytype` VALUES ('53', '003034001001', '市辖区', '4', '安徽省合肥市市辖区', '27');
INSERT INTO `sys_dictionarytype` VALUES ('54', '003034001021', '长丰县', '4', '安徽省合肥市长丰县', '27');
INSERT INTO `sys_dictionarytype` VALUES ('55', '003034001004', '蜀山区', '4', '安徽省合肥市蜀山区', '27');
INSERT INTO `sys_dictionarytype` VALUES ('56', '003034001011', '包河区', '4', null, '27');
INSERT INTO `sys_dictionarytype` VALUES ('57', '003034001023', '肥西县', '4', '安徽省合肥市肥西县', '27');
INSERT INTO `sys_dictionarytype` VALUES ('58', '003034001003', '庐阳区', '4', '安徽省合肥市庐阳区', '27');
INSERT INTO `sys_dictionarytype` VALUES ('59', '003034001081', '巢湖市', '4', '安徽省巢湖市', '27');
INSERT INTO `sys_dictionarytype` VALUES ('60', '003034001024', '庐江县', '4', '安徽省合肥市庐江县', '27');
INSERT INTO `sys_dictionarytype` VALUES ('61', '003034001082', '经开区', '4', '安徽省合肥市经开区', '27');
INSERT INTO `sys_dictionarytype` VALUES ('62', '003034001002', '瑶海区', '4', '安徽省合肥市瑶海区', '27');
INSERT INTO `sys_dictionarytype` VALUES ('64', '22222', 'qqq222', '4', null, null);
INSERT INTO `sys_dictionarytype` VALUES ('65', 'qqqq1', '111', '0', null, '64');
INSERT INTO `sys_dictionarytype` VALUES ('66', 'test', 'test', '0', null, '64');
INSERT INTO `sys_dictionarytype` VALUES ('67', 'test3', 'test', '0', null, '64');
INSERT INTO `sys_dictionarytype` VALUES ('68', 'ewrw', 'sfdsf', '0', null, '64');
INSERT INTO `sys_dictionarytype` VALUES ('69', '333', '333', '0', null, '64');
INSERT INTO `sys_dictionarytype` VALUES ('70', '444', '444', '0', null, '64');

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
) ENGINE=MyISAM AUTO_INCREMENT=385 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('367', '1', '2015-05-05 22:12:47', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('368', '1', '2015-05-05 22:27:02', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('369', '1', '2015-05-05 22:50:12', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('370', '1', '2015-05-05 23:25:16', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('371', '1', '2015-05-05 23:46:06', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('372', '1', '2015-05-06 21:06:46', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('373', '1', '2015-05-06 21:37:38', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('374', '1', '2015-05-06 22:13:18', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('375', '1', '2015-05-06 22:53:47', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('376', '1', '2015-05-06 22:56:50', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('377', '7', '2015-05-06 23:22:39', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('378', '18', '2015-05-06 23:23:01', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('379', '1', '2015-05-06 23:24:14', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('380', '1', '2015-05-07 00:08:56', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('381', '1', '2015-05-07 00:16:30', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('382', '1', '2015-05-08 00:12:03', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('383', '1', '2015-05-08 00:18:15', '127.0.0.1');
INSERT INTO `sys_log` VALUES ('384', '1', '2015-05-08 00:27:33', '127.0.0.1');

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
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_organization
-- ----------------------------
INSERT INTO `sys_organization` VALUES ('1', '工程部', '合肥', '0101', 'icon_company', '8', '1', '2015-05-02 10:13:56');
INSERT INTO `sys_organization` VALUES ('6', '财务部', '合肥', '0102', 'icon_company', '8', '2', '2015-05-02 10:07:17');
INSERT INTO `sys_organization` VALUES ('8', '总经理', '', '01', 'icon_company', null, '0', '2015-05-02 10:06:44');

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
) ENGINE=MyISAM AUTO_INCREMENT=253 DEFAULT CHARSET=utf8;

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
INSERT INTO `sys_resource` VALUES ('244', '搜索', '/reimbursement/search', '', '', '238', '5', '0', '1', '2015-05-03 00:17:35');
INSERT INTO `sys_resource` VALUES ('245', '审批', '/reimbursement/complete', '', '', '238', '6', '0', '1', '2015-05-03 00:19:20');
INSERT INTO `sys_resource` VALUES ('246', '工程款拨付登记', '/projectAppropriateReg/manager', '', 'icon_resource', '236', '0', '0', '0', '2015-05-08 00:13:49');
INSERT INTO `sys_resource` VALUES ('68', '日常维护', '', '', 'icon_rms_maintanance_daily', null, '2', '0', '0', '2002-01-02 09:01:43');
INSERT INTO `sys_resource` VALUES ('69', '巡点服务', '/pointInspect/manager', '', 'icon_rms_service_inspection', '68', '2', '0', '0', '2002-01-02 09:05:01');
INSERT INTO `sys_resource` VALUES ('70', '合同管理', '/contract/manager', '', 'icon_rms_manger_contract', '32', '3', '0', '0', '2002-01-05 01:06:11');
INSERT INTO `sys_resource` VALUES ('76', '信息中心', '', '', 'icon_rms_msg_center', null, '1', '0', '0', '2002-01-05 08:17:45');
INSERT INTO `sys_resource` VALUES ('241', '删除', '/reimbursement/delete', '', '', '238', '2', '0', '1', '2015-05-03 00:15:55');
INSERT INTO `sys_resource` VALUES ('78', '任务派单', '/task/manager', '', 'icon_rms_tasklist', '68', '1', '0', '0', '2002-01-05 08:20:05');
INSERT INTO `sys_resource` VALUES ('79', '维护档案', '/task/historyManager', '', 'icon_rms_record_maintenance', '68', '3', '0', '0', '2002-01-05 08:39:49');
INSERT INTO `sys_resource` VALUES ('80', '任务计划', '/taskSchedule/manager', '', 'icon_rms_taskplan', '68', '4', '0', '0', '2002-01-05 08:44:27');
INSERT INTO `sys_resource` VALUES ('81', '结算管理', '/task/banlanceManager', '', 'icon_rms_manger_balance', '68', '5', '0', '0', '2002-01-05 08:45:04');
INSERT INTO `sys_resource` VALUES ('242', '编辑', '/reimbursement/edit', '', '', '238', '3', '0', '1', '2015-05-03 00:16:20');
INSERT INTO `sys_resource` VALUES ('84', '通知公告', '/notice/manager', '', 'icon_rms_notification', '76', '2', '0', '0', '2002-01-06 01:01:37');
INSERT INTO `sys_resource` VALUES ('85', '管理制度', '/managersys/manager', '', 'icon_rms_manger_system', '76', '0', '0', '0', '2002-01-06 01:02:14');
INSERT INTO `sys_resource` VALUES ('243', '查看', '/reimbursement/detail', '', '', '238', '4', '0', '1', '2015-05-03 00:17:14');
INSERT INTO `sys_resource` VALUES ('87', '知识库管理', '/knowledge/manager', '', 'icon_rms_manger_knowledge', '76', '0', '0', '0', '2002-01-06 01:04:31');
INSERT INTO `sys_resource` VALUES ('88', '报表管理', '', '', 'icon_rms_report_manger', null, '9', '0', '0', '2002-01-06 01:05:48');
INSERT INTO `sys_resource` VALUES ('248', 'add', '/projectAppropriateReg/add', '', '', '246', '1', '0', '1', '2015-05-08 00:15:52');
INSERT INTO `sys_resource` VALUES ('247', 'grid', '/projectAppropriateReg/dataGrid', '', '', '246', '0', '0', '1', '2015-05-08 00:15:00');
INSERT INTO `sys_resource` VALUES ('91', '维护记录报表', '/report/taskRecordManager', '', 'icon_rms_report_repair', '88', '3', '0', '0', '2002-01-06 01:07:07');
INSERT INTO `sys_resource` VALUES ('239', '添加', '/reimbursement/add', '', '', '238', '1', '0', '1', '2015-05-03 00:15:17');
INSERT INTO `sys_resource` VALUES ('240', '列表', '/reimbursement/dataGrid', '', '', '238', '0', '0', '1', '2015-05-03 00:15:05');
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
INSERT INTO `sys_resource` VALUES ('238', '报销管理', '/reimbursement/manager', '', 'icon_resource', '237', '0', '0', '0', '2015-05-02 23:52:17');
INSERT INTO `sys_resource` VALUES ('249', 'delete', '/projectAppropriateReg/delete', '', '', '246', '2', '0', '1', '2015-05-08 00:16:21');
INSERT INTO `sys_resource` VALUES ('250', 'edit', '/projectAppropriateReg/edit', '', '', '246', '3', '0', '1', '2015-05-08 00:16:48');
INSERT INTO `sys_resource` VALUES ('251', 'detail', '/projectAppropriateReg/detail', '', '', '246', '4', '0', '1', '2015-05-08 00:17:21');
INSERT INTO `sys_resource` VALUES ('252', 'search', '/projectAppropriateReg/search', '', '', '246', '5', '0', '1', '2015-05-08 00:17:51');

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
  `code` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '超级管理员', '0', '超级管理员，拥有全部权限', '0', 'role_super');
INSERT INTO `sys_role` VALUES ('4', '普通用户', '1', '普通用户', '1', 'role_common1');
INSERT INTO `sys_role` VALUES ('8', '出纳师', '3', '财务部出纳', '1', 'role_cashier');
INSERT INTO `sys_role` VALUES ('10', '会计师', '4', '财务部会计', '1', 'role_account');
INSERT INTO `sys_role` VALUES ('11', '总经理', '2', '总经理', '1', 'role_top_manger');
INSERT INTO `sys_role` VALUES ('21', '普通员工', '5', '普通员工', '1', 'role_common');
INSERT INTO `sys_role` VALUES ('20', 'test', '6', '', '1', 'role_test');

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
INSERT INTO `sys_role_resource` VALUES ('1', '68');
INSERT INTO `sys_role_resource` VALUES ('1', '69');
INSERT INTO `sys_role_resource` VALUES ('1', '70');
INSERT INTO `sys_role_resource` VALUES ('1', '76');
INSERT INTO `sys_role_resource` VALUES ('1', '78');
INSERT INTO `sys_role_resource` VALUES ('1', '79');
INSERT INTO `sys_role_resource` VALUES ('1', '80');
INSERT INTO `sys_role_resource` VALUES ('1', '81');
INSERT INTO `sys_role_resource` VALUES ('1', '84');
INSERT INTO `sys_role_resource` VALUES ('1', '85');
INSERT INTO `sys_role_resource` VALUES ('1', '87');
INSERT INTO `sys_role_resource` VALUES ('1', '88');
INSERT INTO `sys_role_resource` VALUES ('1', '91');
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
INSERT INTO `sys_role_resource` VALUES ('1', '234');
INSERT INTO `sys_role_resource` VALUES ('1', '235');
INSERT INTO `sys_role_resource` VALUES ('1', '236');
INSERT INTO `sys_role_resource` VALUES ('1', '237');
INSERT INTO `sys_role_resource` VALUES ('1', '238');
INSERT INTO `sys_role_resource` VALUES ('1', '239');
INSERT INTO `sys_role_resource` VALUES ('1', '240');
INSERT INTO `sys_role_resource` VALUES ('1', '241');
INSERT INTO `sys_role_resource` VALUES ('1', '242');
INSERT INTO `sys_role_resource` VALUES ('1', '243');
INSERT INTO `sys_role_resource` VALUES ('1', '244');
INSERT INTO `sys_role_resource` VALUES ('1', '245');
INSERT INTO `sys_role_resource` VALUES ('1', '246');
INSERT INTO `sys_role_resource` VALUES ('1', '247');
INSERT INTO `sys_role_resource` VALUES ('1', '248');
INSERT INTO `sys_role_resource` VALUES ('1', '249');
INSERT INTO `sys_role_resource` VALUES ('1', '250');
INSERT INTO `sys_role_resource` VALUES ('1', '251');
INSERT INTO `sys_role_resource` VALUES ('1', '252');
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
INSERT INTO `sys_role_resource` VALUES ('8', '1');
INSERT INTO `sys_role_resource` VALUES ('8', '68');
INSERT INTO `sys_role_resource` VALUES ('8', '69');
INSERT INTO `sys_role_resource` VALUES ('8', '76');
INSERT INTO `sys_role_resource` VALUES ('8', '78');
INSERT INTO `sys_role_resource` VALUES ('8', '79');
INSERT INTO `sys_role_resource` VALUES ('8', '81');
INSERT INTO `sys_role_resource` VALUES ('8', '84');
INSERT INTO `sys_role_resource` VALUES ('8', '85');
INSERT INTO `sys_role_resource` VALUES ('8', '87');
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
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', 'admin', '21232f297a57a5a743894a0e4a801fc3', '0', '18', '1', '0', '0', '1', '2012-06-04 01:00:00', null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('7', 'bx1', '鲍孝', 'c4ca4238a0b923820dcc509a6f75849b', '0', '25', '55', '1', '0', '1', '2015-05-06 23:22:31', null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('16', 'zjl', '钟敬礼', 'c4ca4238a0b923820dcc509a6f75849b', '0', null, '55', '1', '0', '8', '2015-05-05 00:31:56', '', '', '', '', '');
INSERT INTO `sys_user` VALUES ('17', 'cn', '楚娜', 'c4ca4238a0b923820dcc509a6f75849b', '1', null, '55', '1', '0', '6', '2015-05-02 10:43:06', '', '', '', '', '');
INSERT INTO `sys_user` VALUES ('18', 'kj', '蒯季', 'c4ca4238a0b923820dcc509a6f75849b', '0', null, '55', '1', '0', '6', '2015-05-02 10:44:41', '', '', '', '', '');
INSERT INTO `sys_user` VALUES ('19', 'sa', 'sa', 'c4ca4238a0b923820dcc509a6f75849b', '0', null, '1', '1', '0', '8', '2015-05-02 10:47:27', '', '', '', '', '');

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
INSERT INTO `sys_user_role` VALUES ('7', '21');
INSERT INTO `sys_user_role` VALUES ('16', '11');
INSERT INTO `sys_user_role` VALUES ('17', '8');
INSERT INTO `sys_user_role` VALUES ('18', '10');
INSERT INTO `sys_user_role` VALUES ('19', '20');

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
