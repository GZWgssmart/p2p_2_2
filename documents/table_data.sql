/*
Navicat MySQL Data Transfer

Source Server         : ssm_pujinziben
Source Server Version : 50717
Source Host           : 192.168.3.124:3306
Source Database       : d_ssm_pujinziben

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-01-12 21:00:33
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bankcard
-- ----------------------------
DROP TABLE IF EXISTS `bankcard`;
CREATE TABLE `bankcard` (
  `bcid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` int(11) DEFAULT NULL COMMENT '用户id',
  `cardno` varchar(20) DEFAULT NULL COMMENT '卡号',
  `rname` varchar(200) DEFAULT NULL COMMENT '姓名',
  `idno` char(18) DEFAULT NULL COMMENT '身份证',
  `type` varchar(50) DEFAULT NULL COMMENT '所属银行',
  `state` int(11) DEFAULT '1' COMMENT '状态，0冻结，1可用',
  `date` datetime DEFAULT NULL COMMENT '绑卡时间',
  PRIMARY KEY (`bcid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='银行卡表';

-- ----------------------------
-- Records of bankcard
-- ----------------------------
INSERT INTO `bankcard` VALUES ('1', '2', null, 'dsfasf', null, '1', null, '2017-12-25 11:29:33');
INSERT INTO `bankcard` VALUES ('2', '100000', '324234234', null, '360724199909088822', '324324', null, '2018-01-09 15:56:45');
INSERT INTO `bankcard` VALUES ('3', '100000', '请问', null, '360724199909088822', '王企鹅群无', null, '2018-01-09 16:00:16');
INSERT INTO `bankcard` VALUES ('5', '100000', '王企鹅群无', '王企鹅', '360724199909088822', '为', null, '2018-01-09 16:03:35');
INSERT INTO `bankcard` VALUES ('6', '100000', '而我却二', '王企鹅', '360724199909088822', '武器二维群二群', null, '2018-01-09 16:40:32');
INSERT INTO `bankcard` VALUES ('7', '100000', '而我却二恶趣味', '王企鹅', '360724199909088822', '武器二维群二群', null, '2018-01-09 16:40:40');
INSERT INTO `bankcard` VALUES ('8', '100000', '而我却二恶趣味', '王企鹅', '360724199909088822', '武器二维群二群', null, '2018-01-09 16:40:43');
INSERT INTO `bankcard` VALUES ('9', '100000', '而我却二恶趣味', '王企鹅', '360724199909088822', '武器二维群二群', null, '2018-01-09 16:40:46');
INSERT INTO `bankcard` VALUES ('10', '100000', '而我却二恶趣味', '王企鹅', '360724199909088822', '武器二维群二群', null, '2018-01-09 16:40:49');
INSERT INTO `bankcard` VALUES ('11', '100000', '而我却二恶趣味', '王企鹅', '360724199909088822', '武器二维群二群', null, '2018-01-09 16:40:53');
INSERT INTO `bankcard` VALUES ('12', '100000', '而我却二恶趣味', '王企鹅', '360724199909088822', '武器二维群二群', null, '2018-01-09 16:40:59');
INSERT INTO `bankcard` VALUES ('13', '100000', '', '67567', '360724199909088822', '54', null, '2018-01-12 11:12:30');

-- ----------------------------
-- Table structure for borrowapply
-- ----------------------------
DROP TABLE IF EXISTS `borrowapply`;
CREATE TABLE `borrowapply` (
  `baid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `rname` varchar(50) DEFAULT NULL COMMENT '真实姓名',
  `money` decimal(10,2) DEFAULT NULL COMMENT '申请金额',
  `uid` int(11) DEFAULT NULL COMMENT '借款人id',
  `bzid` int(11) DEFAULT NULL COMMENT '标种，先息后本，等额本金，等额本息',
  `time` datetime DEFAULT NULL COMMENT '申请时间',
  `state` int(11) DEFAULT '3' COMMENT '审核状态，0不通过，1通过，2审核中，3未填写借款详情, 4融资完成， 5融资失败（流标），6还款成功',
  `type` int(11) DEFAULT NULL COMMENT '借款类型，多金宝。。。',
  `term` int(11) DEFAULT NULL COMMENT '借款期限',
  `deadline` datetime DEFAULT NULL COMMENT '截止时间',
  `symoney` decimal(10,2) DEFAULT NULL COMMENT '剩余可投余额',
  PRIMARY KEY (`baid`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='申请借款表';

-- ----------------------------
-- Records of borrowapply
-- ----------------------------
INSERT INTO `borrowapply` VALUES ('1', '我们', '100000.00', '100000', '1', '2017-12-28 14:04:33', '3', '1', '6', '2018-06-25 12:43:44', '100000.00');
INSERT INTO `borrowapply` VALUES ('2', '我们', '100000.00', '100000', '1', '2017-12-28 14:04:34', '0', '1', '3', '2017-12-27 14:19:53', '100000.00');
INSERT INTO `borrowapply` VALUES ('3', '我们', '100000.00', '100000', '1', '2017-12-28 14:04:08', '1', '2', '9', '2017-12-27 14:19:56', '100000.00');
INSERT INTO `borrowapply` VALUES ('4', '我们', '100000.00', '100000', '3', '2017-12-28 14:04:10', '1', '4', '9', '2017-12-27 14:19:55', '100000.00');
INSERT INTO `borrowapply` VALUES ('5', '我们', '666666.00', '100000', '1', '2017-12-28 14:04:12', '1', '3', '6', '2018-04-12 00:00:00', '10000.00');
INSERT INTO `borrowapply` VALUES ('11', 'name', '400000.00', '100000', '2', '2017-12-28 16:17:14', '1', '3', '9', '2018-03-03 00:00:00', '400000.00');
INSERT INTO `borrowapply` VALUES ('12', 'asd', '100000.00', '100001', '1', '2018-01-02 08:59:45', '3', '3', '3', '2222-12-05 00:00:00', '100000.00');
INSERT INTO `borrowapply` VALUES ('13', 'QWE', '200000.00', '100001', '1', '2018-01-02 14:06:39', '3', '1', '3', '2018-01-12 00:00:00', '200000.00');
INSERT INTO `borrowapply` VALUES ('16', 'asd', '250000.00', '100001', '2', '2018-01-03 10:37:02', '3', '2', '3', '2018-01-09 00:00:00', '250000.00');
INSERT INTO `borrowapply` VALUES ('17', 'ads', '300000.00', '100001', '2', '2018-01-03 10:38:39', '3', '2', '3', '2018-01-20 00:00:00', '300000.00');
INSERT INTO `borrowapply` VALUES ('18', 'asd', '500000.00', '100001', '2', '2018-01-03 10:41:41', '4', '1', '3', '2018-01-20 00:00:00', '0.00');

-- ----------------------------
-- Table structure for borrowdetail
-- ----------------------------
DROP TABLE IF EXISTS `borrowdetail`;
CREATE TABLE `borrowdetail` (
  `bdid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `fpic` char(18) DEFAULT NULL COMMENT '法人身份证',
  `ypic` varchar(255) DEFAULT NULL COMMENT '营业执照副本',
  `qpic` varchar(255) DEFAULT NULL COMMENT '企业银行账号',
  `tpic` varchar(500) DEFAULT NULL COMMENT '其他资料',
  `mpurpose` varchar(500) DEFAULT NULL COMMENT '资金用途',
  `hksource` varchar(500) DEFAULT NULL COMMENT '还款来源',
  `suggest` varchar(500) DEFAULT NULL COMMENT '借款人介绍',
  `xmdescrip` text COMMENT '项目描述',
  `guarantee` varchar(500) DEFAULT NULL COMMENT '保障措施',
  `money` decimal(10,2) DEFAULT NULL COMMENT '金额',
  `nprofit` decimal(3,2) DEFAULT NULL COMMENT '年化收益',
  `way` varchar(255) DEFAULT NULL COMMENT '收益方式',
  `cpname` varchar(255) DEFAULT NULL COMMENT '产品名称',
  `baid` int(11) DEFAULT NULL COMMENT '关联的借款id',
  PRIMARY KEY (`bdid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='借款详情表';

-- ----------------------------
-- Records of borrowdetail
-- ----------------------------
INSERT INTO `borrowdetail` VALUES ('3', '361724199912313259', '/static/uploads/img/wallpaper_a37179.jpg', '1234567890123456780', null, '修改——完成SSM项目', '修改——项目上线后的收入', '修改——项目组成员', '修改——SSM项目', '修改——王总担保', '350000.00', '9.00', '修改——广告收入', 'DJB1514874513719', '11');
INSERT INTO `borrowdetail` VALUES ('4', '360724201801031439', '/static/uploads/img/wallpaper_a219901.jpg', '9876543210123456789', null, '新SSM项目', '新SSM项目收入', '新SSM项目', '新SSM项目', '无', '100000.00', '8.00', '广告', 'PJB1514961532166', '2');
INSERT INTO `borrowdetail` VALUES ('5', '360724201801090831', '/static/uploads/img/wallpaper_a219901.jpg', '1234567899876543222', null, '项目开发', '有', '自己', '当前项目', '有', '500000.00', '8.00', '有', 'PJB1515457882799', '18');
INSERT INTO `borrowdetail` VALUES ('7', '360724199712297043', '/static/uploads/img/201704281028507815.png', '1234567812345678111', null, 'w', 'w', 'w', 'w', 'w', '100000.00', '9.00', 'w', 'PJB1515746799817', '3');
INSERT INTO `borrowdetail` VALUES ('8', '360724191212297043', '/static/uploads/img/201707181720447073.jpg', '1234556712345678111', null, 'w', 'w', 'w', 'w', 'w', '100000.00', '9.00', 'w', 'SXB1515747145446', '4');
INSERT INTO `borrowdetail` VALUES ('9', '360724191212297043', '/static/uploads/img/ptzz_05.jpg', '1222256712345678111', null, 'y', 'y', 'y', 'yy', 'y', '666666.00', '9.00', 'y', 'HJB1515747320149', '5');

-- ----------------------------
-- Table structure for bz
-- ----------------------------
DROP TABLE IF EXISTS `bz`;
CREATE TABLE `bz` (
  `bzid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `bzname` varchar(200) DEFAULT NULL COMMENT '名称',
  `state` int(11) DEFAULT '1' COMMENT '状态，0不可用，1可用',
  PRIMARY KEY (`bzid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='标种表';

-- ----------------------------
-- Records of bz
-- ----------------------------
INSERT INTO `bz` VALUES ('1', '先息后本', '1');
INSERT INTO `bz` VALUES ('2', '等额本金', '1');
INSERT INTO `bz` VALUES ('3', '等额本息', '1');
INSERT INTO `bz` VALUES ('12', '一次还清', '1');

-- ----------------------------
-- Table structure for cz_log
-- ----------------------------
DROP TABLE IF EXISTS `cz_log`;
CREATE TABLE `cz_log` (
  `czid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` int(11) DEFAULT NULL COMMENT '用户id',
  `bankcard` varchar(20) DEFAULT NULL COMMENT '卡号',
  `banktype` varchar(50) DEFAULT NULL COMMENT '所属银行',
  `money` decimal(10,2) DEFAULT NULL COMMENT '金额',
  `date` datetime DEFAULT NULL COMMENT '时间',
  `state` int(11) DEFAULT '1' COMMENT '状态，0不可用，1可用',
  PRIMARY KEY (`czid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='充值记录表';

-- ----------------------------
-- Records of cz_log
-- ----------------------------

-- ----------------------------
-- Table structure for dxmodel
-- ----------------------------
DROP TABLE IF EXISTS `dxmodel`;
CREATE TABLE `dxmodel` (
  `dxid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `content` text COMMENT '内容',
  PRIMARY KEY (`dxid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='短信模板表';

-- ----------------------------
-- Records of dxmodel
-- ----------------------------

-- ----------------------------
-- Table structure for dynamic
-- ----------------------------
DROP TABLE IF EXISTS `dynamic`;
CREATE TABLE `dynamic` (
  `dyid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(200) DEFAULT NULL COMMENT '标题',
  `date` datetime DEFAULT NULL COMMENT '时间',
  `content` text COMMENT '内容',
  `pic` varchar(500) DEFAULT NULL COMMENT '封面图片',
  PRIMARY KEY (`dyid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='公司动态表';

-- ----------------------------
-- Records of dynamic
-- ----------------------------
INSERT INTO `dynamic` VALUES ('1', '最新动态', '2017-12-27 19:32:06', '最新内容', '/static/uploads/img/wallpaper_a37179.jpg');
INSERT INTO `dynamic` VALUES ('2', '领立潮头引关注 知名学者访普金', '2017-12-27 19:49:49', '<h3 style=\"word-wrap: break-word; margin: 0px; padding: 0px; border: 0px; font-size: 18px; height: 50px; text-align: center; line-height: 50px; font-weight: normal; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; white-space: normal;\">领立潮头引关注 知名学者访普金</h3><p><br/></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"word-wrap: break-word; font-family: SimSun; line-height: 2.5;\">&nbsp;&nbsp;&nbsp;&nbsp;2016年8月17日，江西省政府发展研究中心特约研究员、江西财经大学金融学院博士吴伟军先生,中山大学博士、江西理工大学经济管理学院黄春忠先生一行莅临普金资本（赣州）运营有限公司参观调研，普金资本总裁吴鸿热情接待了吴伟军先生一行，双方就互联网金融行业发展及合规化等课题展开广泛交流。</span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"word-wrap: break-word; font-family: SimSun; line-height: 2.5;\"><span style=\"word-wrap: break-word; line-height: 2.5;\">&nbsp; &nbsp; &nbsp;</span></span><span style=\"word-wrap: break-word; font-family: SimSun; line-height: 2.5;\">总裁吴鸿先生对吴伟军先生、黄春忠先生百忙中莅临公司参观调研表示热烈欢迎与感谢。</span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\"><img src=\"http://www.pujinziben.com/attached/image/2016/20160908/201609081557404207.jpg\" width=\"880\" height=\"660\" alt=\"\"/></p><p><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; background-color: rgb(255, 255, 255); line-height: 2.5;\">&nbsp; &nbsp; &nbsp;</span><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(255, 255, 255); font-family: SimSun;\"><span style=\"word-wrap: break-word; line-height: 2.5;\">&nbsp;&nbsp;普金资本作为江西省首家也是赣州唯一一家国资委核准的金融服务平台，具备成熟的产品开发设计能力、严格的风险管理能力、优秀的企业管理能力。在未来的发展道路上，普金资本将会以更为出色的姿态，与社会各界人士一起，打造一个“专业、稳健、诚信、高效”的互联网金融平台。公司一经创立，就成为赣州互联网金融标杆，受到越来越多的业界关注。</span><br/><span style=\"word-wrap: break-word; line-height: 2.5;\">&nbsp; &nbsp; &nbsp;</span><span style=\"word-wrap: break-word; line-height: 2.5;\">吴伟军先生一行认真细致地听取了总裁吴鸿先生对普金资本发展概况、业务模式、风控管理、技术保障、未来发展方向等情况的介绍后，对普金资本拥有的国资系背景、产品开发设计能力、严格的风险管理能力、优秀的企业管理能力表示肯定，并就供应链金融、风险管理、业务模式创新、合规化等课题与公司进行了深入探讨。</span></span><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; background-color: rgb(255, 255, 255);\"></span></p><p style=\"text-align: center;\"><img src=\"http://www.pujinziben.com/attached/image/2016/20160908/201609081557579714.jpg\" width=\"880\" height=\"495\" alt=\"\"/></p><p style=\"text-align: center;\"><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-size: 14px; background-color: rgb(255, 255, 255); font-family: SimSun;\"><p><span style=\"word-wrap: break-word; line-height: 2.5;\">吴鸿总裁</span><span style=\"word-wrap: break-word; line-height: 2.5;\">(</span><span style=\"word-wrap: break-word; line-height: 2.5;\">左一</span><span style=\"word-wrap: break-word; line-height: 2.5;\">)</span><span style=\"word-wrap: break-word; line-height: 2.5;\">、副总经理</span><span style=\"word-wrap: break-word; line-height: 2.5;\">谢美强先生</span><span style=\"word-wrap: break-word; line-height: 2.5;\">(</span><span style=\"word-wrap: break-word; line-height: 2.5;\">右一</span><span style=\"word-wrap: break-word; line-height: 2.5;\">)</span><span style=\"word-wrap: break-word; line-height: 2.5;\">与来访学者吴伟军先生</span><span style=\"word-wrap: break-word; line-height: 2.5;\">(</span><span style=\"word-wrap: break-word; line-height: 2.5;\">左二</span><span style=\"word-wrap: break-word; line-height: 2.5;\">)</span><span style=\"word-wrap: break-word; line-height: 2.5;\">、黄春忠先生</span><span style=\"word-wrap: break-word; line-height: 2.5;\">(</span><span style=\"word-wrap: break-word; line-height: 2.5;\">左三</span><span style=\"word-wrap: break-word; line-height: 2.5;\">)</span><span style=\"word-wrap: break-word; line-height: 2.5;\">合影</span></p></span></p><p><br/></p><p><br/></p><p><br/></p>', '/static/uploads/img/4.png');
INSERT INTO `dynamic` VALUES ('3', '开创互惠共赢好局面', '2017-12-27 20:07:57', '<h3 style=\"word-wrap: break-word; margin: 0px; padding: 0px; border: 0px; font-size: 18px; height: 50px; text-align: center; line-height: 50px; font-weight: normal; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; white-space: normal;\">开创互惠共赢好局面</h3><p><br/></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"word-wrap: break-word; line-height: 2.5;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2016年8月16日，中信商业保理有限公司（下称“中信保理”）万勇副总经理一行莅临普金资本（赣州）运营有限公司参观考察，普金资本董事长姜茗盛、总裁吴鸿热情接待了万总一行，并就合作互惠，共创双赢进行了深入交流，今后的合作方向和内容达成了初步的意向。</span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\"><img src=\"http://www.pujinziben.com/attached/image/2016/20160908/201609081555378335.jpg\" width=\"880\" height=\"660\" alt=\"\"/><span style=\"word-wrap: break-word; line-height: 2.5;\">&nbsp;</span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 28pt;\"><span style=\"word-wrap: break-word; line-height: 2.5;\">&nbsp;&nbsp;&nbsp;&nbsp;洽谈中，万总对普金资本具备的产品开发设计能力、严格的风险管理能力、优秀的企业管理能力表示赞赏。他认为普金资本作为赣州市国资委批复备案的互联网金融平台，拥有国资系背景，完全符合中信保理的对合作机构的要求，此次前来普金资本参观考察为今后的合作打下了基础，不虚此行。</span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\"><img src=\"http://www.pujinziben.com/attached/image/2016/20160908/201609081555534507.jpg\" width=\"880\" height=\"660\" alt=\"\"/><span style=\"word-wrap: break-word; line-height: 2.5;\">&nbsp;</span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 28pt;\"><span style=\"word-wrap: break-word; line-height: 2.5;\">&nbsp;&nbsp;&nbsp;&nbsp;吴鸿总裁在洽谈中表示：普金资本致力于打造</span><span style=\"word-wrap: break-word; line-height: 2.5;\">“专业、稳健、诚信、高效”的互联网金融平台，与中信保理这样的优质的保理机构合作，能够为中信保理提供优质的项目，同时普金资本也能够获得更多的资金来源，可谓是相得益彰。</span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 28pt;\"><span style=\"word-wrap: break-word; line-height: 2.5;\">&nbsp;&nbsp;&nbsp;&nbsp;洽谈中，双方坦诚表示将进一步提升合作层次、丰富合作内容，充分发挥各自优势，携手构建</span><span style=\"word-wrap: break-word; line-height: 2.5;\">“保理业务+</span><span style=\"word-wrap: break-word; line-height: 2.5;\">互联网金融</span><span style=\"word-wrap: break-word; line-height: 2.5;\">”新模式，共同开创互惠共赢新局面。</span></p><p><br/></p>', '/static/uploads/img/14.png');
INSERT INTO `dynamic` VALUES ('4', '【喜报】庆贺普金资本成功当选江西省第二届互联网金融协会副会长单位！', '2017-12-27 20:19:55', '<h3 style=\"word-wrap: break-word; margin: 0px; padding: 0px; border: 0px; font-size: 18px; height: 50px; text-align: center; line-height: 50px; font-weight: normal; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; white-space: normal;\"><br/></h3><h3 style=\"word-wrap: break-word; margin: 0px; padding: 0px; border: 0px; font-size: 18px; height: 50px; text-align: center; line-height: 50px; font-weight: normal; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; white-space: normal;\">【喜报】庆贺普金资本成功当选江西省第二届互联网金融协会副会长单位！</h3><p><br/></p><p class=\"p\" style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; margin-left: 0pt; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-indent: 0pt; white-space: normal; background-color: rgb(255, 255, 255);\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2017<span style=\"word-wrap: break-word;\">年</span><span style=\"word-wrap: break-word;\">10</span><span style=\"word-wrap: break-word;\">月</span><span style=\"word-wrap: break-word;\">13</span><span style=\"word-wrap: break-word;\">日，江西省互联网金融协会第二届第一次会员代表大会在南昌前湖迎宾馆隆重召开。本次会议，通过了第一届理事会工作报告和财务报告，并且选举产生了第二届理事单位。其中，普金资本运营（赣州）有限公司成功当选江西省互联网金融协会第二届副会长单位，与此同时，公司</span><span style=\"word-wrap: break-word;\">CEO</span><span style=\"word-wrap: break-word;\">吴鸿先生成功当选为理事会副会长。</span></p><p class=\"p\" style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; margin-left: 0pt; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-indent: 0pt; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"word-wrap: break-word;\"><br/></span></p><p class=\"p\" style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; margin-left: 0pt; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-indent: 0pt; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"word-wrap: break-word;\"><br/></span></p><p class=\"p\" style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; margin-left: 0pt; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-indent: 0pt; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\"><img src=\"http://www.pujinziben.com/upload/mediareport/2017/10/20171016175221_654.png\" width=\"640\" height=\"480\" alt=\"\"/></p><p class=\"p\" style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; margin-left: 0pt; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-indent: 0pt; white-space: normal; background-color: rgb(255, 255, 255);\"><br/></p><p class=\"p\" style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; margin-left: 0pt; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-indent: 0pt; white-space: normal; background-color: rgb(255, 255, 255);\"><br/></p><p class=\"p\" style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; margin-left: 0pt; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-indent: 0pt; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"word-wrap: break-word;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;此次代表大会总结了江西省互联网金融协会成立以来所做的工作，指出协会的成立，是响应国家互联网金融业健康发展的具体要求，对我省互联网金融业的蓬勃发展和有序推进有着十分重要的作用。</span></p><p class=\"p\" style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; margin-left: 0pt; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-indent: 0pt; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"word-wrap: break-word;\"><br/></span></p><p class=\"p\" style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; margin-left: 0pt; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-indent: 0pt; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"word-wrap: break-word;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;会议总结了全省互联网金融行业的基本情况，指出省内互联网金融行业的发展存在以下特点：第一，在对互联网金融行业的监管上取得了长足的进步，为行业的理性发展奠定了坚实的基础。第二，我省的互联网金融行业规模还有待进一步加大。据相关统计数据，截至</span><span style=\"word-wrap: break-word;\">2017</span><span style=\"word-wrap: break-word;\">年</span><span style=\"word-wrap: break-word;\">8</span><span style=\"word-wrap: break-word;\">月底，全省在运营的网络借贷信息中介机构共有</span><span style=\"word-wrap: break-word;\">31</span><span style=\"word-wrap: break-word;\">家，累计撮合成交量为</span><span style=\"word-wrap: break-word;\">301.23</span><span style=\"word-wrap: break-word;\">亿元，贷款余额为</span><span style=\"word-wrap: break-word;\">30.89</span><span style=\"word-wrap: break-word;\">亿元。第三，我省的互联网金融行业在运行上处于平稳发展的时期，管理风险是可控的。</span></p><p class=\"p\" style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; margin-left: 0pt; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-indent: 0pt; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"word-wrap: break-word;\"><br/></span></p><p class=\"p\" style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; margin-left: 0pt; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-indent: 0pt; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"word-wrap: break-word;\"><br/></span></p><p class=\"p\" style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; margin-left: 0pt; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-indent: 0pt; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\"><img src=\"http://www.pujinziben.com/upload/mediareport/2017/10/20171016175722_113.png\" width=\"640\" height=\"480\" alt=\"\"/></p><p class=\"p\" style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; margin-left: 0pt; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-indent: 0pt; white-space: normal; background-color: rgb(255, 255, 255);\"><br/></p><p class=\"p\" style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; margin-left: 0pt; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-indent: 0pt; white-space: normal; background-color: rgb(255, 255, 255);\"><br/></p><p class=\"p\" style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; margin-left: 0pt; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-indent: 0pt; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"word-wrap: break-word;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;据悉，普金资本运营（赣州）有限公司（以下简称：普金资本）是由赣州城兴投资管理有限公司联合赣州盛汇资产管理有限公司一同设立的互联网金融平台，</span>2016<span style=\"word-wrap: break-word;\">年</span><span style=\"word-wrap: break-word;\">3</span><span style=\"word-wrap: break-word;\">月注册成立于江西赣州。在平台成立之初，就获得了赣州市国资委备案，并且以前所未有的发展态势为赣州的各类企业提供了精准到位的投融资服务。由于普金资本在人才上始终坚持</span><span style=\"word-wrap: break-word;\">“</span><span style=\"word-wrap: break-word;\">以人为本</span><span style=\"word-wrap: break-word;\">”</span><span style=\"word-wrap: break-word;\">的原则，大批金融行业、城建行业、供应链管理行业的人才汇集于此，不但为公司的发展做出了自己的贡献，也为解决客户的资金问题提供了高效的运作方案。</span></p><p class=\"p\" style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; margin-left: 0pt; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-indent: 0pt; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"word-wrap: break-word;\"><br/></span></p><p class=\"p\" style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; margin-left: 0pt; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-indent: 0pt; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\"><img src=\"http://www.pujinziben.com/upload/mediareport/2017/10/20171016175303_594.png\" width=\"640\" height=\"480\" alt=\"\"/></p><p class=\"p\" style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; margin-left: 0pt; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-indent: 0pt; white-space: normal; background-color: rgb(255, 255, 255);\"><br/></p><p class=\"p\" style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; margin-left: 0pt; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-indent: 0pt; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"word-wrap: break-word;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;作为江西省互联网金融协会第二届副会长单位，普金资本致力于打造</span><span style=\"word-wrap: break-word;\">“</span><span style=\"word-wrap: break-word;\">专业、稳健、诚信、高效</span><span style=\"word-wrap: break-word;\">”</span><span style=\"word-wrap: break-word;\">的互联网金融平台，自成立以来就始终坚持严谨规范的理念，积极拥抱国家互金监管政策，始终走在省内互金行业规范平台的前列，用合规和自律的基本底线，不断夯实平台自身的发展实力。未来，普金资本必将继续深化在互联网金融领域的工作，担起江西省互金协会副会长单位职责，与全行业共同努力，推动江西互联网金融业的健康发展。</span></p><p><br/></p><p><br/></p>', '/static/uploads/img/4.png');
INSERT INTO `dynamic` VALUES ('5', '【普金资本】校企联手 探寻合作新契机！', '2018-01-02 08:20:35', '<p><br/></p><h3 style=\"word-wrap: break-word; margin: 0px; padding: 0px; border: 0px; font-size: 18px; height: 50px; text-align: center; line-height: 50px; font-weight: normal; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; white-space: normal;\">【普金资本】校企联手 探寻合作新契机！</h3><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(62, 62, 62); text-indent: 32px; text-align: justify;\"><span style=\"word-wrap: break-word; color: rgb(0, 0, 0); font-size: 12px;\"></span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(62, 62, 62); text-align: justify;\"><span style=\"word-wrap: break-word;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"word-wrap: break-word; color: rgb(0, 0, 0);\">2017年10月14号，普金资本公司与赣南医学院共同签定了《校外创新创业实践基地协议书》。根据协议，双方将充分发挥校企优势，加强学生就业、创业合作，联手培养互联网创新人才。</span></span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(62, 62, 62); text-indent: 32px; text-align: justify;\"><span style=\"word-wrap: break-word; color: rgb(0, 0, 0);\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;普金资本总裁吴鸿先生率领公司高层、联同赣南医学院领导刘宁生院长、<span style=\"word-wrap: break-word;\">副院长</span>陶钧、人文学院管理系主任李钧一同出席了此次合作会议；吴鸿先生在致辞说，普金资本作为赣州知名的金融企业，一直注重基层管理人才的提前储备，近年来不断加大力度联手各高校建立创新型产学研合作人才培养模式，提高学生实践能力与社会适应能力，充分展现了普金资本对校企合作的重视度，未来，普金资本还将加大对人才的投入，为学校、社会提供更多的就业机会。</span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(62, 62, 62); text-indent: 32px; text-align: justify;\"><span style=\"word-wrap: break-word; color: rgb(0, 0, 0); font-size: 12px;\"><br/></span><br/></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; text-align: center; color: rgb(62, 62, 62);\"><img src=\"http://www.pujinziben.com/upload/mediareport/2017/10/20171019175516_148.png\" alt=\"\"/></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(62, 62, 62); text-align: center;\"><span style=\"word-wrap: break-word; color: rgb(136, 136, 136);\"><span style=\"word-wrap: break-word;\"><span style=\"word-wrap: break-word; font-size: 12px;\">普金资本总裁 吴鸿先生致欢迎辞</span></span></span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(62, 62, 62); text-align: center;\"><span style=\"word-wrap: break-word; color: rgb(136, 136, 136);\"><span style=\"word-wrap: break-word;\"><span style=\"word-wrap: break-word; font-size: 12px;\"><br/></span></span></span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(62, 62, 62);\"><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-size: 12px;\">&nbsp; &nbsp; &nbsp; &nbsp;<span style=\"word-wrap: break-word; font-size: 14px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;刘宁生<span style=\"word-wrap: break-word;\">院长上台发表讲话，他</span>说：一直以来，部分高校存在教育理念滞后、重理论轻实践的问题，导致学生在学校的学习内容和实践环节与企业的需求脱节，难以适应纷繁复杂的社会实际。目前，高校亟需强化实践，彻底解决理论与实践脱节、实践平台短缺等问题，促进学生全面发展，提升人力资本素质。通过此次的校企合作，学生们可以在普金资本精心规划的一系列实践中获得参与企业大型金融项目策划、组织及实施的机会，丰富课余文化生活和对金融产品的运营能力。而普金资本也能以直观形式将金融产品的全流程展现在学生眼前，丰富他们的项目实战经验，将为他们今后走上工作岗位打下坚实的基础。</span></span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(62, 62, 62); text-indent: 32px; text-align: justify;\"><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-size: 12px;\"><br/></span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(62, 62, 62); text-indent: 32px;\"><span style=\"word-wrap: break-word; color: rgb(51, 51, 51);\"></span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; text-align: center; color: rgb(62, 62, 62);\"><img src=\"http://www.pujinziben.com/upload/mediareport/2017/10/20171019175535_668.png\" width=\"640\" height=\"480\" alt=\"\"/></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(62, 62, 62); text-align: center;\"><span style=\"word-wrap: break-word;\"><span style=\"word-wrap: break-word; font-size: 12px;\">&nbsp;刘宁生院长发表讲话</span></span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(62, 62, 62); text-align: center;\"><span style=\"word-wrap: break-word;\"><span style=\"word-wrap: break-word; font-size: 12px;\"><br/></span></span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; text-align: center; color: rgb(62, 62, 62); text-indent: 32px;\"><span style=\"word-wrap: break-word;\"><span style=\"word-wrap: break-word; color: rgb(51, 51, 51);\">&nbsp;&nbsp;&nbsp;&nbsp;上午</span><span style=\"word-wrap: break-word; font-family: Arial, sans-serif; color: rgb(51, 51, 51);\">10</span><span style=\"word-wrap: break-word; color: rgb(51, 51, 51);\">点</span><span style=\"word-wrap: break-word; font-family: Arial, sans-serif; color: rgb(51, 51, 51);\">30</span><span style=\"word-wrap: break-word; color: rgb(51, 51, 51);\">分，揭牌仪式正式开始，普金资本总裁吴鸿先生与刘宁生院长共同揭牌，并签订《校外创新创业实践基地协议书》。会议现场一片欢腾，同学们为此次的合作报以热烈的掌声。</span></span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(62, 62, 62); text-indent: 32px; text-align: justify;\"><span style=\"word-wrap: break-word; font-size: 12px; color: rgb(51, 51, 51);\"><br/></span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; text-align: center; color: rgb(62, 62, 62);\"><img src=\"http://www.pujinziben.com/upload/mediareport/2017/10/20171019175550_204.png\" alt=\"\"/></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(62, 62, 62); text-align: center; text-indent: 32px;\"><span style=\"word-wrap: break-word; color: rgb(136, 136, 136); font-size: 12px;\"><span style=\"word-wrap: break-word;\">揭牌仪式、签订协议</span></span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(62, 62, 62);\"><br/></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(62, 62, 62); text-indent: 32px; text-align: justify;\"><span style=\"word-wrap: break-word; color: rgb(51, 51, 51);\">&nbsp;&nbsp;&nbsp;&nbsp;签字仪式后，普金资本专门聘请金融专业讲师给现场师生进行了精彩的讲座，如此迅速进入学习状态，刘院长大加赞赏，鼓励同学们勇于创新创业。</span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(62, 62, 62); text-indent: 32px; text-align: justify;\"><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-size: 12px;\"><br/></span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(62, 62, 62); text-indent: 32px;\"><span style=\"word-wrap: break-word; color: rgb(51, 51, 51);\"></span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; text-align: center; color: rgb(62, 62, 62);\"><img src=\"http://www.pujinziben.com/upload/mediareport/2017/10/20171019175613_929.png\" width=\"640\" height=\"214\" alt=\"\"/></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(62, 62, 62); text-align: center;\"><span style=\"word-wrap: break-word;\">精彩讲座</span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(62, 62, 62);\"><br/></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(62, 62, 62); text-indent: 32px; text-align: justify;\"><span style=\"word-wrap: break-word; color: rgb(51, 51, 51);\">&nbsp;&nbsp;&nbsp;&nbsp;此次校企的合作，普金资本将现有的校企合作项目展现给各高校，打通合作通道，为未来企业运营获得更适用、高效的人才夯实了根基，获得更专业的人才培养的途径和方法，有利于普金资本吸收更多、更新、更好的思想，为普金资本科技创新、企业升级铺路。</span></p><ul style=\"list-style-type: none;\" class=\" list-paddingleft-2\"><li><p><a class=\"sidebar-top\" style=\"word-wrap: break-word; outline: none; cursor: pointer; display: block; height: 50px; background-image: url(&quot;../images/right.png&quot;); background-repeat: no-repeat; background-position: left -200px;\"><br/></a></p></li></ul><p><a class=\"close icon icon-close\" style=\"word-wrap: break-word; outline: none; cursor: pointer; background-image: url(&quot;../images/icon.png&quot;); background-repeat: no-repeat; background-position: left -1504px; width: 60px; height: 60px; position: absolute; top: 0px; right: 0px; transition-duration: 0.5s;\"><br/></a></p><p><br/></p>', '/static/uploads/img/8.jpg');
INSERT INTO `dynamic` VALUES ('6', '普金资本2017年度第一期新员工入职培训圆满结束', '2018-01-02 08:20:39', '<h3 style=\"word-wrap: break-word; margin: 0px; padding: 0px; border: 0px; font-size: 18px; height: 50px; text-align: center; line-height: 50px; font-weight: normal; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; white-space: normal;\">普金资本2017年度第一期新员工入职培训圆满结束</h3><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-align: justify; background-color: rgb(255, 255, 255); line-height: 2.5;\">为帮助新员工更好地了解企业文化，熟悉工作流程并尽快地融入团队，</span><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-align: justify; background-color: rgb(255, 255, 255); line-height: 2.5;\">2017</span><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-align: justify; background-color: rgb(255, 255, 255); line-height: 2.5;\">年</span><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-align: justify; background-color: rgb(255, 255, 255); line-height: 2.5;\">6</span><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-align: justify; background-color: rgb(255, 255, 255); line-height: 2.5;\">月</span><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-align: justify; background-color: rgb(255, 255, 255); line-height: 2.5;\">13</span><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-align: justify; background-color: rgb(255, 255, 255); line-height: 2.5;\">日，普金资本运营（赣州）有限公司</span><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-align: justify; background-color: rgb(255, 255, 255); line-height: 2.5;\">2017</span><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-align: justify; background-color: rgb(255, 255, 255); line-height: 2.5;\">年度第一期新员工入职培训正式拉开帷幕。</span><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-align: justify; background-color: rgb(255, 255, 255); line-height: 2.5;\">来自公司各个岗位的新员工参加了此培训，培训内容包括企业发展历史、战略规划、公司简介、企业文化、管理制度、商务礼仪等，并特邀公司总裁吴鸿</span><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-align: justify; background-color: rgb(255, 255, 255); line-height: 2.5;\">以及各</span><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-align: justify; background-color: rgb(255, 255, 255); line-height: 2.5;\">部门负责人</span><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-align: justify; background-color: rgb(255, 255, 255); line-height: 2.5;\">进行业务讲解</span><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-align: justify; background-color: rgb(255, 255, 255); line-height: 2.5;\">与交流。</span></p><p><br/></p><p><strong style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\">了解企业文化</strong></p><p style=\"text-align: center;\"><strong style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"/static/uploads/img/ueditor/jsp/upload/image/20180105/1515120598934028534.jpg\" title=\"1515120598934028534.jpg\" alt=\"201706211518353577.jpg\"/></strong></p><p style=\"text-align: center;\"><strong style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-align: center; background-color: rgb(255, 255, 255); line-height: 2.5;\"><span style=\"word-wrap: break-word; color: rgb(229, 102, 0);\">总裁吴鸿先生作培训致辞并与</span></span><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-align: center; background-color: rgb(255, 255, 255); line-height: 2.5;\"><span style=\"word-wrap: break-word; color: rgb(229, 102, 0);\">新员工互动交流</span></span></strong></p><p style=\"text-align: center;\"><strong style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-align: center; background-color: rgb(255, 255, 255); line-height: 2.5;\"><span style=\"word-wrap: break-word; color: rgb(229, 102, 0);\"><img src=\"/static/uploads/img/ueditor/jsp/upload/image/20180105/1515120681853064194.jpg\" title=\"1515120681853064194.jpg\" alt=\"201706211519393161.jpg\"/></span></span></strong></p><p style=\"text-align: center;\"><strong style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-align: center; background-color: rgb(255, 255, 255); line-height: 2.5;\"><span style=\"word-wrap: break-word; color: rgb(229, 102, 0);\"><span style=\"color: rgb(229, 102, 0); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-align: center; background-color: rgb(255, 255, 255);\">开讲啦~</span></span></span></strong></p><p><strong style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-align: center; background-color: rgb(255, 255, 255); line-height: 2.5;\"><span style=\"word-wrap: break-word; color: rgb(229, 102, 0);\"><span style=\"color: rgb(229, 102, 0); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-align: center; background-color: rgb(255, 255, 255);\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-align: justify; background-color: rgb(255, 255, 255);\">培训伊始，公司总裁吴鸿先生作了致辞，首先回顾公司的发展历程，详尽阐释了公司的战略规划，展望了公司未来发展的崇高愿景，并寄语全体新员工尽早融入普金，实现个人、企业的共同发展。随后，公司线上运营中心总监古凌先生、基金管理部经理宋发晖先生就公司背景、业务模式、产品类型等内容向大家作了详细介绍，大家以往对公司模糊化的认知也开始渐渐趋于清晰。</span></span></span></span></strong></p><p><strong style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-align: center; background-color: rgb(255, 255, 255); line-height: 2.5;\"><span style=\"word-wrap: break-word; color: rgb(229, 102, 0);\"><span style=\"color: rgb(229, 102, 0); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-align: center; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-align: justify; background-color: rgb(255, 255, 255);\"><br/></span></span></span></span></strong></p><p><strong style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-align: center; background-color: rgb(255, 255, 255); line-height: 2.5;\"><span style=\"word-wrap: break-word; color: rgb(229, 102, 0);\"><span style=\"color: rgb(229, 102, 0); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-align: center; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-align: justify; background-color: rgb(255, 255, 255);\"><strong style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\">学习规章制度</strong></span></span></span></span></strong></p><p style=\"text-align: center;\"><strong style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-align: center; background-color: rgb(255, 255, 255); line-height: 2.5;\"><span style=\"word-wrap: break-word; color: rgb(229, 102, 0);\"><span style=\"color: rgb(229, 102, 0); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-align: center; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-align: justify; background-color: rgb(255, 255, 255);\"><img src=\"/static/uploads/img/ueditor/jsp/upload/image/20180105/1515120773723094648.jpg\" title=\"1515120773723094648.jpg\" alt=\"201706211520428200.jpg\"/></span></span></span></span></strong></p><p style=\"text-align: center;\"><strong style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-align: center; background-color: rgb(255, 255, 255); line-height: 2.5;\"><span style=\"word-wrap: break-word; color: rgb(229, 102, 0);\"><span style=\"color: rgb(229, 102, 0); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-align: center; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-align: justify; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(229, 102, 0); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-align: center; background-color: rgb(255, 255, 255);\">实力讲师轮番上阵，只为奉献满满干货</span></span></span></span></span></strong></p><p style=\"text-align: center;\"><img src=\"/static/uploads/img/ueditor/jsp/upload/image/20180105/1515120859181061337.jpg\" title=\"1515120859181061337.jpg\" alt=\"201706211521073775.jpg\"/></p><p style=\"text-align: center;\"><span style=\"color: rgb(229, 102, 0); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-align: center; background-color: rgb(255, 255, 255);\">学员们专注课程分享</span></p><p><br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-align: justify; background-color: rgb(255, 255, 255);\">“无规矩不成方圆”，一套严谨的管理体系自然是一个公司得以井然有序地运转地必然保障，它与我们的日常工作息息相关。公司行政部主管冯新艳女士、人事部主管朱毅芸女士、团队经理萧海彬先生为大家带来了干货满满的公司基本规章制度、办事流程、职场商务礼仪、有效沟通等综合素质的培训，为新员工更快更好地融入公司，进入工作角色打下了良好的基础。</span></p><p><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-align: justify; background-color: rgb(255, 255, 255);\"><br/></span></p><p><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-align: justify; background-color: rgb(255, 255, 255);\"><strong style=\"word-wrap: break-word; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\">结业测验</strong></span></p><p style=\"text-align: center;\"><img src=\"/static/uploads/img/ueditor/jsp/upload/image/20180105/1515120944111067883.jpg\" title=\"1515120944111067883.jpg\" alt=\"201706211521417906.jpg\"/></p><p style=\"text-align: center;\"><img src=\"/static/uploads/img/ueditor/jsp/upload/image/20180105/1515120978767028089.jpg\" title=\"1515120978767028089.jpg\" alt=\"201706211521513478.jpg\"/></p><p style=\"text-align: center;\"><span style=\"color: rgb(229, 102, 0); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-align: center; background-color: rgb(255, 255, 255);\">学员们专心致志地答题</span></p><p><span style=\"color: rgb(229, 102, 0); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-align: center; background-color: rgb(255, 255, 255);\"></span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\"><span style=\"word-wrap: break-word; line-height: 2.5;\"><span style=\"word-wrap: break-word; line-height: 35px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span><span style=\"word-wrap: break-word; line-height: 2.5;\">经过全方位的系统培训，大家与培训前的自己相比，都有了质的提升。在培训的结尾我们特地设置了一次关于从公司的发展历史、发展规划与愿景、规章制度到沟通技巧、商务礼仪、职业素养等方面的测验，这不仅能够让公司了解培训后的自己，更让大家清楚地认识到自己的提升和不足，方便日后查缺补漏。</span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\"><span style=\"word-wrap: break-word; line-height: 2.5;\">&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;为期一天的入职培训已经圆满落幕了，但它并不代表结束，更多的是代表新的开始。厉兵秣马练内功，蓄势待发新征程。祝福每一位新同事在普金资本能得到很好的发展，普金资本也因这股新鲜、滚烫的血液的注入而变得更加精彩！</span></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify;\"><span style=\"word-wrap: break-word; line-height: 2.5;\"><br/></span></p><p><span style=\"color: rgb(229, 102, 0); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-align: center; background-color: rgb(255, 255, 255);\"><br/></span><br/></p>', '/static/uploads/img/7.jpg');
INSERT INTO `dynamic` VALUES ('7', '热烈祝贺普金资本荣膺普惠金融协会常务副会长单位', '2018-01-02 08:44:46', '<h3 style=\"word-wrap: break-word; margin: 0px; padding: 0px; border: 0px; font-size: 18px; height: 50px; text-align: center; line-height: 50px; font-weight: normal; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; white-space: normal;\">热烈祝贺普金资本荣膺普惠金融协会常务副会长单位</h3><p><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; background-color: rgb(255, 255, 255);\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;7月17日，赣州市普惠金融协会秘书长刘荣龙亲临普金资本，亲自授牌普金资本为赣州市普惠金融协会常务副会长单位，以肯定普金资本自成立以来在赣州地区互联网金融领域的突出表现。</span></p><p><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; background-color: rgb(255, 255, 255);\"><br/></span></p><p style=\"text-align: center;\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; background-color: rgb(255, 255, 255);\"><img src=\"/static/uploads/img/ueditor/jsp/upload/image/20180105/1515120279228082645.jpg\" title=\"1515120279228082645.jpg\" alt=\"201707181721508220.jpg\"/></span></p><p style=\"text-align: center;\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-align: center; background-color: rgb(255, 255, 255);\">普金资本副总裁林立标（左）与市普惠金融协会秘书长刘荣龙（右）合影</span></span></p><p><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-align: center; background-color: rgb(255, 255, 255);\"><br/></span></span></p><p><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-align: center; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; background-color: rgb(255, 255, 255);\">&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;赣州市普惠金融协会是依照国家有关政策法规成立的，由多家小额贷款公司、融资性担保公司、互联网金融企业共同发起组建的行业社团组织，赣州市金融工作局为业务主管单位。协会以开展行业自律、维护行业利益、提供会员服务、促进行业发展为宗旨。遵守国家宪法、法律、法规和经济金融方针政策，认真履行自律、维权、协调、服务职能。强化组织协调和服务水平，优化会员依法合规经营环境，维护会员合法权益，提高普惠金融行业素质，提升行业整体形象，促进普惠金融行业健康发展。</span></span></span></p><p><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-align: center; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; background-color: rgb(255, 255, 255);\"><br/></span></span></span></p><p><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-align: center; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; background-color: rgb(255, 255, 255);\"><br/></span></span></span></p><p><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-align: center; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; background-color: rgb(255, 255, 255);\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;在当日刘荣龙秘书长一行对普金资本的到访中，普金资本副总裁林立标等全程接待陪同，双方就金融创新与监管、公司发展模式、协会运营现状及模式等方面进行了深入的探讨和交流，并在互联网金融发展问题上达成系列共识。此次赣州普惠金融协会实地考察普金资本并授予“常务副会长单位”荣誉，一来反映了赣州苏区对新兴互联网金融发展的重视，同时也充分认可了普金资本在中小企业融资方面的重要作用，给普金资本及平台投资人以莫大信心。</span></span></span></span></p><p><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-align: center; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; background-color: rgb(255, 255, 255);\"><br/></span></span></span></span></p><p style=\"text-align: center;\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-align: center; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; background-color: rgb(255, 255, 255);\"><img src=\"/static/uploads/img/ueditor/jsp/upload/image/20180105/1515120368136071727.jpg\" title=\"1515120368136071727.jpg\" alt=\"201707181722219748.jpg\"/></span></span></span></span></p><p><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-align: center; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; background-color: rgb(255, 255, 255);\"><br/></span></span></span></span></p><p><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-align: center; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; background-color: rgb(255, 255, 255);\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; background-color: rgb(255, 255, 255);\">显然正是由于不断的发展与进步，普金资本才能在广大平台用户的一致好评中，受到越来越多权威金融机构的认可。随着本次加入市普惠金融协会，公司势必将建立更加完备的风控模式，继续肩负起对社会投资者的责任。而依托协会在相关领域的影响力，普金资本不仅逐步发展为一支正规化、专业化的金融行业主力军，更将迈入前所未有的快速发展新阶段！</span></span></span></span></span></p><p><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-align: center; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; background-color: rgb(255, 255, 255);\"><br/><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; background-color: rgb(255, 255, 255);\">&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;未来，普金资本将会更加积极的投身到协会的各项工作当中，努力实现优势互补、合作共赢、协同创新、规范自律，与业界携手共同为赣州地区互联网金融的健康发展，为开创金融信息产业发展的新局面贡献自己的力量。</span></span></span></span></span></p><p><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-align: center; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; background-color: rgb(255, 255, 255);\"><br/></span></span></span></span></span></p><p><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; background-color: rgb(255, 255, 255);\"><br/></span></p>', '/static/uploads/img/2.jpg');
INSERT INTO `dynamic` VALUES ('8', '普金资本与汇付天下、益金所洽谈战略合作', '2018-01-02 15:41:17', '<h3 style=\"word-wrap: break-word; margin: 0px; padding: 0px; border: 0px; font-size: 18px; height: 50px; text-align: center; line-height: 50px; font-weight: normal; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; white-space: normal;\">普金资本与汇付天下、益金所洽谈战略合作</h3><p><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; background-color: rgb(255, 255, 255);\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;7月28日，普金资本常务副总裁季晓春赴汇付天下上海总部考察并洽谈业务合作事宜。当日率先考察了汇付天下总部大楼，随后拜访了汇付天下控股的成都益金所总经理黄华波先生，双方在总结既往合作的基础上对各自经营情况进行了交流，并就今后的战略合作进行了沟通、对业务关键环节进行了明确。</span></p><p style=\"text-align: center;\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; background-color: rgb(255, 255, 255);\"><img src=\"/static/uploads/img/ueditor/jsp/upload/image/20180105/1515119278843030946.jpg\" title=\"1515119278843030946.jpg\" alt=\"7.jpg\" width=\"803\" height=\"602\"/></span></p><p><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; background-color: rgb(255, 255, 255);\"><br/></span></p><p style=\"text-align: center;\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-align: center; background-color: rgb(255, 255, 255);\">汇付天下上海总部</span></span></p><p><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-align: center; background-color: rgb(255, 255, 255);\"><br/></span></span></p><p style=\"text-align: center;\"><img src=\"/static/uploads/img/ueditor/jsp/upload/image/20180105/1515119843177068614.jpg\" title=\"1515119843177068614.jpg\" alt=\"2.jpg\" width=\"805\" height=\"404\"/></p><p style=\"text-align: center;\"><br/></p><p style=\"text-align: center;\"><br/></p><p><span class=\"edui-editor-imagescale-hand0\" style=\"box-sizing: border-box; position: absolute; width: 6px; height: 6px; overflow: hidden; font-size: 0px; display: block; background-color: rgb(60, 157, 208); cursor: nw-resize; top: 0px; margin-top: -4px; left: 0px; margin-left: -4px; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;\"></span><span class=\"edui-editor-imagescale-hand1\" style=\"box-sizing: border-box; position: absolute; width: 6px; height: 6px; overflow: hidden; font-size: 0px; display: block; background-color: rgb(60, 157, 208); cursor: n-resize; top: 0px; margin-top: -4px; left: 139.5px; margin-left: -4px; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;\"></span><span class=\"edui-editor-imagescale-hand0\" style=\"box-sizing: border-box; position: absolute; width: 6px; height: 6px; overflow: hidden; font-size: 0px; display: block; background-color: rgb(60, 157, 208); cursor: nw-resize; top: 0px; margin-top: -4px; left: 0px; margin-left: -4px; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;\"></span><span class=\"edui-editor-imagescale-hand1\" style=\"box-sizing: border-box; position: absolute; width: 6px; height: 6px; overflow: hidden; font-size: 0px; display: block; background-color: rgb(60, 157, 208); cursor: n-resize; top: 0px; margin-top: -4px; left: 195px; margin-left: -4px; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;\"></span><span class=\"edui-editor-imagescale-hand2\" style=\"box-sizing: border-box; position: absolute; width: 6px; height: 6px; overflow: hidden; font-size: 0px; display: block; background-color: rgb(60, 157, 208); cursor: ne-resize; top: 0px; margin-top: -4px; left: 390px; margin-left: -3px; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;\"></span><span class=\"edui-editor-imagescale-hand3\" style=\"box-sizing: border-box; position: absolute; width: 6px; height: 6px; overflow: hidden; font-size: 0px; display: block; background-color: rgb(60, 157, 208); cursor: w-resize; top: 0.5px; margin-top: -4px; left: 0px; margin-left: -4px; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;\"></span></p><p style=\"text-align: center;\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-align: center; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-align: center; background-color: rgb(255, 255, 255);\">所获荣誉资质</span></span></span></p><p><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-align: center; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-align: center; background-color: rgb(255, 255, 255);\"><br/></span></span></span></p><p><br/></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; margin-left: 0cm; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; text-align: center; background: white;\">&nbsp;</p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; margin-left: 0cm; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; text-align: center; background: white;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;益金所定位于打造以固定收益类金融产品交易为主要特色的国内一流交易平台，服务资产证券化，联合融资方、发行方、承销方，共同打造全国固定收益产品流通市场，降低流通成本，依法合规运营，构建严格的风险防范体系，让企业以较低的融资成本获得融资，让投资人在资金安全的前提下获得投资收益。</p><p><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-align: center; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-align: center; background-color: rgb(255, 255, 255);\"><br/></span></span></span></p><p><br/></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; margin-left: 0cm; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; text-align: center; background: white;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;益金所构建了包含融资主体评估、融资需求评估、融资方案评估、财务承受力评估、营收和竞争力评估、基础资产评估六大构面的调研系统，益金所还建立了产品挂牌后的五级风险警示机制，以期尽早发现融资方可能暴露的风险事件，并作适当处置。同时，辅以风险准备金和风险保证金制度，从而最大可能保护投资方的利益。基于风控体系的建设，益金所将努力成为全方位金融服务供应商，除了交易功能之外，益金所还可以给企业提供包括内控和上市辅导的财务顾问服务以及融资方案设计和挂牌的投行服务。</p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; margin-left: 0cm; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; text-align: center; background: white;\">&nbsp;</p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; margin-left: 0cm; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; text-align: center; background: white;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;益金所总经理黄华波指出：益金所与地方政府、央国企、同业金融机构紧密合作，凭借大风控大中台的基础架构优势，不但提供优质资产，也能将手握的这些优质资产，鲜明透彻层层剥解呈现到资本市场上，在资产端与资金端直接搭建起信息沟通的“高速公路”，将这个市场做通、做活、做透，打造一个接地气的金融环境。</p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; margin-left: 0cm; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background: white;\"><br/></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; margin-left: 0cm; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background: white;\"><br/></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; margin-left: 0cm; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background: white; text-align: center;\"><img src=\"/static/uploads/img/ueditor/jsp/upload/image/20180105/1515119522985052164.jpg\" title=\"1515119522985052164.jpg\" alt=\"20.jpg\" width=\"720\" height=\"379\"/></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; margin-left: 0cm; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background: white;\"><br/></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; margin-left: 0cm; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background: white;\"><br/></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; margin-left: 0cm; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; text-align: center; background: white;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;此次洽谈合作，双方都拿出百分之百的诚意，汇付天下将给予普金资本大力支持，共同打造金融科技的创新及支付服务的升级；同时，普金资本与益金所初步的交流，为双方的后续合作奠定了坚实基础，后续将加强互金业务交流，为社会各界客户提供优质、专业的金融产品和服务，推进行业健康发展，开拓互金更广阔的市场。</p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"word-wrap: break-word;\">&nbsp;</span></p><p><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-align: center; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; text-align: center; background-color: rgb(255, 255, 255);\"><br/></span></span></span><br/></p>', '/static/uploads/img/1.jpg');

-- ----------------------------
-- Table structure for friend
-- ----------------------------
DROP TABLE IF EXISTS `friend`;
CREATE TABLE `friend` (
  `fid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `imgPath` varchar(500) DEFAULT NULL COMMENT '图片路径',
  `imgHref` varchar(500) DEFAULT NULL COMMENT '图片链接',
  `imgAlert` varchar(50) DEFAULT NULL COMMENT '图片描述',
  PRIMARY KEY (`fid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='合作伙伴表';

-- ----------------------------
-- Records of friend
-- ----------------------------
INSERT INTO `friend` VALUES ('1', '/static/images/xdp/1.jpg', 'http://www.baidu.com', '百度');
INSERT INTO `friend` VALUES ('2', '/static/images/xdp/2.jpg', 'http://www.alibaba.com', '阿里巴巴');
INSERT INTO `friend` VALUES ('3', '/static/images/xdp/3.jpg', 'http://www.taobao.com', 'taobao');
INSERT INTO `friend` VALUES ('4', '/static/images/xdp/4.jpg', 'http://www.huawei.com', '华为');
INSERT INTO `friend` VALUES ('9', '/static/images/xdp/5.jpg', 'http://www.geshanhuacom', '格桑花');
INSERT INTO `friend` VALUES ('10', '/static/images/xdp/6.jpg', 'http://www.iphone.com', '苹果');

-- ----------------------------
-- Table structure for hkb
-- ----------------------------
DROP TABLE IF EXISTS `hkb`;
CREATE TABLE `hkb` (
  `skid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` int(11) DEFAULT NULL COMMENT '借款人id（申请借钱）',
  `rname` varchar(200) DEFAULT NULL COMMENT '真实姓名',
  `cpname` varchar(255) DEFAULT NULL COMMENT '产品名称',
  `rnum` int(11) DEFAULT NULL COMMENT '已还期数',
  `tnum` int(11) DEFAULT NULL COMMENT '总期数',
  `ytime` datetime DEFAULT NULL COMMENT '应还时间',
  `rtime` datetime DEFAULT NULL COMMENT '实际还款时间',
  `bzname` varchar(255) DEFAULT NULL COMMENT '标种',
  `ybx` decimal(10,2) DEFAULT NULL COMMENT '应还本息',
  `rbx` decimal(10,2) DEFAULT NULL COMMENT '已还本息',
  `ylx` decimal(10,2) DEFAULT NULL COMMENT '应还利息',
  `rlx` decimal(10,2) DEFAULT NULL COMMENT '已还利息',
  `ybj` decimal(10,2) DEFAULT NULL COMMENT '应还本金',
  `rbj` decimal(10,2) DEFAULT NULL COMMENT '已还本金',
  `yfx` decimal(10,2) DEFAULT NULL COMMENT '应还罚息',
  `rfx` decimal(10,2) DEFAULT NULL COMMENT '已还罚息',
  `yucount` int(11) DEFAULT NULL COMMENT '逾期次数',
  `state` int(11) DEFAULT NULL COMMENT '还款状态',
  `baid` int(11) DEFAULT NULL COMMENT '借款id',
  `yustartime` datetime DEFAULT NULL COMMENT '逾期执行时间',
  `huid` int(11) DEFAULT NULL COMMENT '贷后负责人id',
  PRIMARY KEY (`skid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='还款表';

-- ----------------------------
-- Records of hkb
-- ----------------------------
INSERT INTO `hkb` VALUES ('1', '100001', 'asd', 'PJB1515457882799', '1', '3', '2018-02-10 18:08:20', '2018-01-12 18:43:13', '等额本金', '168888.89', '168888.89', '2222.22', '2222.22', '166666.67', '166666.67', '0.00', '0.00', '0', '2', '18', '2018-02-11 18:08:20', '15');
INSERT INTO `hkb` VALUES ('2', '100001', 'asd', 'PJB1515457882799', '0', '3', '2018-03-10 18:08:20', null, '等额本金', '167777.78', '0.00', '1111.11', '0.00', '166666.67', '0.00', '0.00', '0.00', '0', '0', '18', '2018-03-11 18:08:20', '15');
INSERT INTO `hkb` VALUES ('3', '100001', 'asd', 'PJB1515457882799', '0', '3', '2018-04-10 18:08:20', null, '等额本金', '166666.67', '0.00', '0.00', '0.00', '166666.67', '0.00', '0.00', '0.00', '0', '0', '18', '2018-04-11 18:08:20', '15');

-- ----------------------------
-- Table structure for home_img
-- ----------------------------
DROP TABLE IF EXISTS `home_img`;
CREATE TABLE `home_img` (
  `hid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `imgPath` varchar(500) DEFAULT NULL COMMENT '轮播图路径',
  `imgHref` varchar(500) DEFAULT NULL COMMENT '轮播图链接',
  PRIMARY KEY (`hid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='首页图片表';

-- ----------------------------
-- Records of home_img
-- ----------------------------
INSERT INTO `home_img` VALUES ('1', '/static/uploads/img/banner_001.jpg', 'index/security');
INSERT INTO `home_img` VALUES ('2', '/static/uploads/img/banner_002.jpg', 'index/security');
INSERT INTO `home_img` VALUES ('3', '/static/uploads/img/banner_009.jpg', 'index/security');
INSERT INTO `home_img` VALUES ('4', '/static/uploads/img/banner_010.jpg', 'index/security');

-- ----------------------------
-- Table structure for huser
-- ----------------------------
DROP TABLE IF EXISTS `huser`;
CREATE TABLE `huser` (
  `huid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `rname` varchar(200) DEFAULT NULL COMMENT '真实姓名',
  `sex` varchar(4) DEFAULT NULL COMMENT '性别',
  `phone` char(11) DEFAULT NULL COMMENT '手机号',
  `huname` varchar(50) DEFAULT NULL COMMENT '用户名',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `create_time` datetime DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL COMMENT '登录密码',
  PRIMARY KEY (`huid`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COMMENT='后台用户表';

-- ----------------------------
-- Records of huser
-- ----------------------------
INSERT INTO `huser` VALUES ('15', 'our', '女', '18888888888', 'name', 'admin@email.com', '2018-01-09 11:11:23', '4QrcOUm6Wau+VuBX8g+IPg==');
INSERT INTO `huser` VALUES ('46', '李四', '男', '15087654321', 'superamdin', 'admin@gmail.com', '2018-01-09 08:56:30', 'wzNncBURtPYCDsYd7TUgWQ==');
INSERT INTO `huser` VALUES ('47', '张三', '男', '13012345678', 'admin', 'admin@163.com', '2018-01-09 10:37:32', '4QrcOUm6Wau+VuBX8g+IPg==');

-- ----------------------------
-- Table structure for jklx
-- ----------------------------
DROP TABLE IF EXISTS `jklx`;
CREATE TABLE `jklx` (
  `lxid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `lxname` varchar(200) DEFAULT NULL COMMENT '名称',
  `state` int(11) DEFAULT '1' COMMENT '状态，0不可用，1可用',
  PRIMARY KEY (`lxid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='借款类型表';

-- ----------------------------
-- Records of jklx
-- ----------------------------
INSERT INTO `jklx` VALUES ('1', '多金宝', '1');
INSERT INTO `jklx` VALUES ('2', '普金保', '1');
INSERT INTO `jklx` VALUES ('3', '恒金保', '1');
INSERT INTO `jklx` VALUES ('4', '新手标', '1');
INSERT INTO `jklx` VALUES ('5', '老手标', '0');

-- ----------------------------
-- Table structure for jur
-- ----------------------------
DROP TABLE IF EXISTS `jur`;
CREATE TABLE `jur` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COMMENT='权限表';

-- ----------------------------
-- Records of jur
-- ----------------------------
INSERT INTO `jur` VALUES ('39', '添加用户', '/user/add', 'user:add', '2018-01-09 08:49:13');

-- ----------------------------
-- Table structure for letter
-- ----------------------------
DROP TABLE IF EXISTS `letter`;
CREATE TABLE `letter` (
  `lid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(200) DEFAULT NULL COMMENT '标题',
  `content` text COMMENT '内容',
  `date` datetime DEFAULT NULL COMMENT '日期',
  `state` int(11) DEFAULT '1' COMMENT '状态，0不可用，1可用',
  PRIMARY KEY (`lid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='站内信表';

-- ----------------------------
-- Records of letter
-- ----------------------------
INSERT INTO `letter` VALUES ('1', '奖励通知', '恭喜您，中奖100万', '2017-12-22 15:58:38', '1');
INSERT INTO `letter` VALUES ('2', '元旦通知', '元旦三天假', '2017-12-27 10:17:00', '1');
INSERT INTO `letter` VALUES ('3', '圣诞通知', '圣诞礼物', '2017-12-27 10:16:30', '1');
INSERT INTO `letter` VALUES ('4', '春节通知', '春节半个月假', '2017-12-25 07:16:39', '1');
INSERT INTO `letter` VALUES ('5', '元宵通知', '元宵半天', '2017-12-28 08:14:50', '1');
INSERT INTO `letter` VALUES ('7', '站内信最新公告', '<p>站内信通知</p>', '2018-01-02 15:38:59', '1');
INSERT INTO `letter` VALUES ('8', '添加', '<p>站内信通知</p>', '2018-01-02 15:41:33', '1');
INSERT INTO `letter` VALUES ('9', '投标通知', '<p>投资奖励通知</p>', '2018-01-02 15:53:53', '1');
INSERT INTO `letter` VALUES ('10', '投标奖励通知', '<p>投标额度越多，奖励越多</p>', '2018-01-02 16:39:17', '1');
INSERT INTO `letter` VALUES ('11', '游标通知', '<p>您发放的表没有投满，导致游标</p>', '2018-01-02 16:43:29', '1');
INSERT INTO `letter` VALUES ('12', '站内信通知', '<p>站内信通知</p>', '2018-01-02 16:47:47', '1');
INSERT INTO `letter` VALUES ('13', '下标', '<p>下标</p>', '2018-01-02 19:24:20', '1');
INSERT INTO `letter` VALUES ('14', '这是一条站内信', '<p><img src=\"/static/uploads/img/ueditor/jsp/upload/image/20180104/1515034642380034401.jpg\" title=\"1515034642380034401.jpg\" alt=\"1.jpg\"/></p>', '2018-01-04 14:10:16', '1');

-- ----------------------------
-- Table structure for media
-- ----------------------------
DROP TABLE IF EXISTS `media`;
CREATE TABLE `media` (
  `mid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(200) DEFAULT NULL COMMENT '标题',
  `content` text COMMENT '内容',
  `pic` varchar(500) DEFAULT NULL COMMENT '封面图片',
  `date` datetime DEFAULT NULL COMMENT '时间',
  `url` varchar(500) DEFAULT NULL COMMENT 'url地址',
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='媒体报道表';

-- ----------------------------
-- Records of media
-- ----------------------------
INSERT INTO `media` VALUES ('1', '年底投资有风险 选择普金资本安全可靠！', '<h3 style=\"word-wrap: break-word; margin: 0px; padding: 0px; border: 0px; font-size: 18px; height: 50px; text-align: center; line-height: 50px; font-weight: normal; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; white-space: normal;\">年底投资有风险 选择普金资本安全可靠！</h3><p><br/></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;随着近年来中国经济的快速发展，社会财富不断增长，个人金融资产也不断增加，理财的必要性也逐渐体现出来了。同时，年关将至，很多人想乘着年末大赚一笔，不少消费者也会将自己的年终奖金投入到理财当中去，以获得鸡生蛋、蛋生鸡的效应。不过，年底投资还是有风险存在的，投资者一定要擦亮眼睛。</p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><br/></p><p style=\"text-align: center;\"><img src=\"/static/uploads/img/ueditor/jsp/upload/image/20180105/1515122094079026341.jpg\"/></p><p><br/></p><p><a href=\"http://finance.hsw.cn/?rand=obHwfAD1\" target=\"_self\" style=\"word-wrap: break-word; outline: none; text-decoration-line: none; color: rgb(51, 51, 51);\"></a></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">  &nbsp;&nbsp;&nbsp;&nbsp;具体来说，年底投资的风险体现在以下三个方面。第一，投资者选择了不靠谱的投资平台，而这些平台的老板借着年末敛财的时机圈钱跑路了。这对于投资者来说，确实是不小的打击。第二，投资者没有注意到理财产品的时效性，陷入了流动性的陷阱。当投资者把自己手头的钱全部投入到理财平台上之后，万一有急需用钱的情况，投资者就只有抓瞎了。第三，市场上还是存在着很多的金融诈骗案，在年底更值诈骗的高峰期，需要投资者提高警惕，不要轻易上当。综上所述，投资者只有选择有保障的大平台，才有可能取得好的收益。</p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><br/></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">  &nbsp;&nbsp;&nbsp;&nbsp;有人可能会问，有保障的大平台究竟有哪些明显的特征呢？业内人士提醒大家，在选择投资平台时，首先要看投资平台是否有合法的资质，其次要看投资平台的企业实力，最后要看投资平台上的理财产品是否具有较高的安全性和收益性。说到底，如果一个投资平台是在金融监管单位的监督下成立和运行的，企业的注册资金相当雄厚，同时推出的理财产品也是安全可靠、能够带来高收益的，那么，这样的投资平台无疑是可以为投资者选择的。专家还向大家推荐了普金资本运营（赣州）有限公司，为有投资需求的朋友指明了方向。</p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><br/></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\"><img src=\"/static/uploads/img/ueditor/jsp/upload/image/20180105/1515122094166089044.jpg\"/></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><br/></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">  &nbsp;&nbsp;&nbsp;&nbsp;据了解，普金资本运营（赣州）有限公司是由赣州城兴投资管理有限公司联合赣州盛汇资产管理有限公司共同出资设立的互联网金融平台，于2016年3月注册成立于江西赣州。普金资本不但获得了赣州市国资委备案，更是为赣州国有企业、大型集团上下游供应链提供了精准到位的投融资服务。</p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><br/></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">  &nbsp;&nbsp;&nbsp;&nbsp;一直以来，普金资本都在为客户获得稳健高效的收益而努力，一方面，平台引进了来自金融行业、城建行业、供应链管理行业的一批专业人才，为客户的投融资业务提供帮助，另一方面，平台采用五级过滤的方式来确保项目的可靠性和收益性，建立起了完善的风控体系，严格遵循审核标准和审核流程，真正让投资者无后顾之忧。</p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><br/></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\"><img src=\"/static/uploads/img/ueditor/jsp/upload/image/20180105/1515122094208074303.jpg\"/></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><br/></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">  如此看来，在2017年末将至的时候，投资者一定要选择投资有保障的实力大平台，才有可能让自己的收益翻番，笑迎2018年的到来。</p><p><br/></p><p><br/></p><p><br/></p>', '/static/uploads/img/11.jpg', '2018-01-05 11:16:40', '赣州');
INSERT INTO `media` VALUES ('2', '这个双十一，你准备好了没有？', '<h3 style=\"word-wrap: break-word; margin: 0px; padding: 0px; border: 0px; font-size: 18px; height: 50px; text-align: center; line-height: 50px; font-weight: normal; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; white-space: normal;\">这个双十一，你准备好了没有？</h3><p><br/></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\"><img src=\"/static/uploads/img/ueditor/jsp/upload/image/20180105/1515122364416094012.jpg\"/></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><br/></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(93, 93, 93); text-indent: 2em;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 随着双十一的临近，国内的金融投资市场也呈现出一派繁荣景象。不过，时值年底，对于普通的投资者来说，如果没有选择对投资平台，想赚钱盈利的美好愿望就会落空。所以，大多数投资者在选择投资平台时都是慎之又慎，不敢轻易下手。</p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(93, 93, 93); text-indent: 2em;\"><br/></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(93, 93, 93); text-indent: 2em;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;就算这样，还是有不少投资者误入歧途，被那些不靠谱的平台的承诺所吸引，将自己的血汗钱投入到项目当中，结果是可想而知的，不但钱财血本无归，连精神上也受到了巨大的打击。比如退休在家的老刘，就因为上了一个投资平台的当，将5万元资本全部投入到所谓的高盈利项目中去，结果到期后不但没有承诺的高额利润，更是连本钱都拿不回来了。</p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(93, 93, 93); text-indent: 2em;\"><br/></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\"><img src=\"/static/uploads/img/ueditor/jsp/upload/image/20180105/1515122364509062085.jpg\"/></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><br/></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(93, 93, 93); text-indent: 2em;\">&nbsp;&nbsp;&nbsp;&nbsp;面对这样的情形，很多投资者开始思考这样的问题：怎么样才能选择到好的投资平台，让自己的投资行为变得更理性、更有保障呢？其实，要想实现对投资的监管，主要还是要睁大眼睛，选择一个靠谱的金融投资平台。只有这样，才能确保自己的投资行为是理性的，是不会给自己带来负面影响的。特别是对于一些本身对金融不太懂的消费者来说，选择这样的平台，更可以省心省力，让自己在投资行动中如虎添翼，如鱼得水。</p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(93, 93, 93); text-indent: 2em;\"><br/></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(93, 93, 93); text-indent: 2em;\">&nbsp;&nbsp;&nbsp;&nbsp;而以国企参股为特色的普金资本，显然是大家可以信赖的对象。据悉，普金资本是赣州市政府直属、市国资委监管的国有独资企业，不但在资金实力上相当的雄厚，在风险把控方面也做得十分到位。正因为此，自平台对外开放以来，已经有数以千计的投资者和融资者从这个平台中得到了自己想要的效益。</p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(93, 93, 93); text-indent: 2em;\"><br/></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\"><img src=\"/static/uploads/img/ueditor/jsp/upload/image/20180105/1515122364625070352.jpg\"/></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><br/></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><br/></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(93, 93, 93); text-indent: 2em;\">&nbsp;&nbsp;&nbsp;&nbsp;在双十一购物节拉开帷幕之际，普金资本更是为广大投资者带来了一个好消息，11.11普金狂欢节正在紧锣密鼓地进行着。对于所有平台用户来说，只要按照规则参加活动，在11月1日至11月30日之间，都可能获得非常丰厚的奖励回报。比如月累计投资奖、新手客户开门红和邀请好友投资奖励，只要是积极参与活动的朋友，都可以收获更多的精彩。</p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(93, 93, 93); text-indent: 2em;\"><br/></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(93, 93, 93); text-indent: 2em;\">&nbsp;&nbsp;&nbsp;&nbsp;面对如此诱人的奖励，相信你已经动心了吧？的确，现在参加11.11普金狂欢节，非但可以拿到高额的奖励，还可以坐享更多的投资回报，赚钱生利，不再是遥不可及的梦想，财富唾手可得，你还在等什么呢？</p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(93, 93, 93); text-indent: 2em;\"><br/></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><br/></p><p style=\"word-wrap: break-word; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, Verdana, sans-serif, &quot;WenQuanYi Micro Hei&quot;, 宋体; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); color: rgb(255, 255, 255);\">广夏细旃磨厉以须髀里肉生事无大小驷马高门众人拾柴火焰高民淳俗厚剪发杜门风言风语一脚不移一丝一毫隳节败名家传人诵妇姑勃谿讲古论今绝代佳人背前面后头痛额热投袂荷戈招风惹草</p><p><br/></p>', '/static/uploads/img/13.jpg', '2018-01-05 11:20:38', '赣州');

-- ----------------------------
-- Table structure for money_log
-- ----------------------------
DROP TABLE IF EXISTS `money_log`;
CREATE TABLE `money_log` (
  `mid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` int(11) DEFAULT NULL COMMENT '用户id',
  `type` int(11) DEFAULT NULL COMMENT '类型，0充值、1提现、2回款、3系统金额（公司奖励..）',
  `in_money` decimal(10,2) DEFAULT NULL COMMENT '收入',
  `out_money` decimal(10,2) DEFAULT NULL COMMENT '支出',
  `date` datetime DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='资金流向表';

-- ----------------------------
-- Records of money_log
-- ----------------------------
INSERT INTO `money_log` VALUES ('17', '100000', '2', null, '20000.00', '2018-01-10 11:29:07');
INSERT INTO `money_log` VALUES ('18', '100000', '2', null, '20000.00', '2018-01-10 11:43:29');
INSERT INTO `money_log` VALUES ('19', '100000', '2', null, '460000.00', '2018-01-10 18:08:13');
INSERT INTO `money_log` VALUES ('20', '100001', '4', null, '168888.89', '2018-01-12 18:43:13');

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `nid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `content` text COMMENT '内容',
  `title` varchar(200) DEFAULT NULL COMMENT '标题',
  `date` datetime DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='最新公告表';

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES ('1', '最新公告', '最新公告', '2017-12-25 11:27:10');
INSERT INTO `notice` VALUES ('2', '最新数据', '最新数据', '2018-01-03 14:57:18');
INSERT INTO `notice` VALUES ('3', '最新声明', '最新声明', '2018-01-03 14:57:39');
INSERT INTO `notice` VALUES ('4', '最新表示', '最新表示', '2018-01-03 14:58:03');
INSERT INTO `notice` VALUES ('5', '最新法律', '最新法律', '2018-01-04 10:26:40');
INSERT INTO `notice` VALUES ('6', '最新条文', '最新条文', '2018-01-04 10:27:15');
INSERT INTO `notice` VALUES ('7', '最新天气', '最新天气', '2018-01-04 10:27:30');
INSERT INTO `notice` VALUES ('8', '最新气温', '最新气温', '2018-01-04 10:27:42');
INSERT INTO `notice` VALUES ('9', '最新新闻', '最新新闻', '2018-01-04 10:28:04');
INSERT INTO `notice` VALUES ('10', '最新艺人', '最新艺人', '2018-01-04 10:28:26');
INSERT INTO `notice` VALUES ('11', '<p>最新条码<img src=\"/static/uploads/img/ueditor/jsp/upload/image/20180106/1515202778639059679.jpg\" title=\"1515202778639059679.jpg\" alt=\"QQ图片20171228163259.jpg\"/></p>', '最新条码', '2018-01-04 10:28:44');

-- ----------------------------
-- Table structure for option
-- ----------------------------
DROP TABLE IF EXISTS `option`;
CREATE TABLE `option` (
  `opid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `phone` char(11) DEFAULT NULL COMMENT '手机号码',
  `content` text COMMENT '内容',
  `date` datetime DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`opid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户反馈表';

-- ----------------------------
-- Records of option
-- ----------------------------

-- ----------------------------
-- Table structure for recommend
-- ----------------------------
DROP TABLE IF EXISTS `recommend`;
CREATE TABLE `recommend` (
  `rid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tid` int(11) DEFAULT NULL COMMENT '推荐人id(已经注册)',
  `tname` varchar(100) DEFAULT NULL COMMENT '推荐人姓名',
  `uid` int(11) DEFAULT NULL COMMENT '被推荐人id（准备注册）',
  `rname` varchar(100) DEFAULT NULL COMMENT '被推荐人姓名',
  `date` datetime DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='推荐管理表';

-- ----------------------------
-- Records of recommend
-- ----------------------------
INSERT INTO `recommend` VALUES ('1', '100000', '', '100001', '', '2018-01-05 15:12:04');
INSERT INTO `recommend` VALUES ('2', '100001', '', '100004', '', '2018-01-05 15:44:59');
INSERT INTO `recommend` VALUES ('3', '100000', null, '100005', null, '2018-01-07 16:16:00');
INSERT INTO `recommend` VALUES ('4', '100005', null, '100006', null, '2018-01-12 11:11:47');

-- ----------------------------
-- Table structure for reward
-- ----------------------------
DROP TABLE IF EXISTS `reward`;
CREATE TABLE `reward` (
  `umid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` int(11) DEFAULT NULL COMMENT '投资人id',
  `tmoney` decimal(10,2) DEFAULT NULL COMMENT '投资总额',
  `money` decimal(10,2) DEFAULT NULL COMMENT '奖励金额',
  `state` varchar(20) DEFAULT NULL COMMENT '奖励发放状态',
  `date` datetime DEFAULT NULL COMMENT '奖励发放时间',
  PRIMARY KEY (`umid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='投资总额奖励表';

-- ----------------------------
-- Records of reward
-- ----------------------------

-- ----------------------------
-- Table structure for reward_setting
-- ----------------------------
DROP TABLE IF EXISTS `reward_setting`;
CREATE TABLE `reward_setting` (
  `rwid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `minmoney` decimal(10,2) DEFAULT NULL COMMENT '最小金额',
  `maxmoney` decimal(10,2) DEFAULT NULL COMMENT '最大金额',
  `percent` double DEFAULT NULL COMMENT '奖励百分比',
  PRIMARY KEY (`rwid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='投资奖励设置表';

-- ----------------------------
-- Records of reward_setting
-- ----------------------------
INSERT INTO `reward_setting` VALUES ('1', '0.00', '50000.00', '5');
INSERT INTO `reward_setting` VALUES ('2', '50000.00', '100000.00', '3');
INSERT INTO `reward_setting` VALUES ('3', '100000.00', null, '1');
INSERT INTO `reward_setting` VALUES ('5', '10000.00', '20000.00', '2');
INSERT INTO `reward_setting` VALUES ('8', '30000.00', '60000.00', '3');
INSERT INTO `reward_setting` VALUES ('9', '20000.00', '50000.00', '2');
INSERT INTO `reward_setting` VALUES ('10', '1000.00', '50000.00', '5');
INSERT INTO `reward_setting` VALUES ('11', '10000.00', '100000.00', '5');
INSERT INTO `reward_setting` VALUES ('12', '10000.00', '90000.00', '1');
INSERT INTO `reward_setting` VALUES ('13', '2001.00', '6001.00', '61');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `jid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `rname` varchar(200) DEFAULT NULL COMMENT '角色名',
  `content` varchar(500) DEFAULT NULL COMMENT '描述',
  `create_time` datetime DEFAULT NULL COMMENT '创建的时间',
  PRIMARY KEY (`jid`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('25', 'spueradmin', '超级管理员，拥有所有权限', '2018-01-09 08:45:44');
INSERT INTO `role` VALUES ('26', 'admin', '普通管理员', '2018-01-09 10:19:05');

-- ----------------------------
-- Table structure for rolejur
-- ----------------------------
DROP TABLE IF EXISTS `rolejur`;
CREATE TABLE `rolejur` (
  `rjid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `rid` int(11) DEFAULT NULL COMMENT '角色id',
  `jid` int(11) DEFAULT NULL COMMENT '权限id',
  PRIMARY KEY (`rjid`)
) ENGINE=InnoDB AUTO_INCREMENT=596 DEFAULT CHARSET=utf8 COMMENT='角色权限表';

-- ----------------------------
-- Records of rolejur
-- ----------------------------
INSERT INTO `rolejur` VALUES ('595', '26', '39');

-- ----------------------------
-- Table structure for roleuser
-- ----------------------------
DROP TABLE IF EXISTS `roleuser`;
CREATE TABLE `roleuser` (
  `ruid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `rid` int(11) DEFAULT NULL COMMENT '角色id',
  `huid` int(11) DEFAULT NULL COMMENT '后台用户id',
  PRIMARY KEY (`ruid`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8 COMMENT='用户角色表';

-- ----------------------------
-- Records of roleuser
-- ----------------------------
INSERT INTO `roleuser` VALUES ('112', '25', '46');
INSERT INTO `roleuser` VALUES ('113', '26', '47');

-- ----------------------------
-- Table structure for rzvip
-- ----------------------------
DROP TABLE IF EXISTS `rzvip`;
CREATE TABLE `rzvip` (
  `rid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` int(11) DEFAULT NULL COMMENT '用户id',
  `xl` varchar(20) DEFAULT NULL COMMENT '学历',
  `ism` varchar(10) DEFAULT NULL COMMENT '婚否',
  `bschool` varchar(50) DEFAULT NULL COMMENT '毕业院校',
  `addr` varchar(200) DEFAULT NULL COMMENT '居住地',
  `work` varchar(200) DEFAULT NULL COMMENT '现工作',
  `age` int(11) DEFAULT NULL COMMENT '年龄',
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='认证表';

-- ----------------------------
-- Records of rzvip
-- ----------------------------

-- ----------------------------
-- Table structure for rzvip_check
-- ----------------------------
DROP TABLE IF EXISTS `rzvip_check`;
CREATE TABLE `rzvip_check` (
  `rcid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` int(11) DEFAULT NULL COMMENT '用户id',
  `huid` int(11) DEFAULT NULL COMMENT '审核人id',
  `isok` int(11) DEFAULT '2' COMMENT '0不通过、1通过、2审核中',
  `excuse` varchar(200) DEFAULT NULL COMMENT '审核理由',
  `date` datetime DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`rcid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='认证审核表';

-- ----------------------------
-- Records of rzvip_check
-- ----------------------------

-- ----------------------------
-- Table structure for shborrow
-- ----------------------------
DROP TABLE IF EXISTS `shborrow`;
CREATE TABLE `shborrow` (
  `shid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `huid` int(11) DEFAULT NULL COMMENT '审核人id',
  `isok` int(11) DEFAULT '3' COMMENT '审核状态，0不通过，1通过，2审核中，3未填写借款详情',
  `excuse` varchar(200) DEFAULT NULL COMMENT '审核理由',
  `date` datetime DEFAULT NULL COMMENT '时间',
  `baid` int(11) DEFAULT NULL COMMENT '借款id',
  PRIMARY KEY (`shid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='借款审核表';

-- ----------------------------
-- Records of shborrow
-- ----------------------------
INSERT INTO `shborrow` VALUES ('1', null, '3', '', null, '1');
INSERT INTO `shborrow` VALUES ('2', '15', '0', '无理由拒绝', '2018-01-03 14:42:47', '2');
INSERT INTO `shborrow` VALUES ('3', null, '1', '', '2018-01-12 17:57:39', '3');
INSERT INTO `shborrow` VALUES ('4', null, '1', '', '2018-01-12 17:57:33', '4');
INSERT INTO `shborrow` VALUES ('5', null, '1', '', '2018-01-12 17:57:27', '5');
INSERT INTO `shborrow` VALUES ('6', '15', '1', '', '2018-01-05 11:03:14', '11');
INSERT INTO `shborrow` VALUES ('7', null, '3', null, null, '12');
INSERT INTO `shborrow` VALUES ('8', null, '3', null, null, '13');
INSERT INTO `shborrow` VALUES ('11', null, '3', null, null, '16');
INSERT INTO `shborrow` VALUES ('12', null, '3', null, null, '17');
INSERT INTO `shborrow` VALUES ('13', '15', '1', '', '2018-01-09 16:50:03', '18');

-- ----------------------------
-- Table structure for skb
-- ----------------------------
DROP TABLE IF EXISTS `skb`;
CREATE TABLE `skb` (
  `skid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` int(11) DEFAULT NULL COMMENT '用户id（借出钱）',
  `juid` int(11) DEFAULT NULL COMMENT '借款人id（申请借钱）',
  `ybx` decimal(10,2) DEFAULT NULL COMMENT '应收本息',
  `rbx` decimal(10,2) DEFAULT NULL COMMENT '已收本息',
  `ylx` decimal(10,2) DEFAULT NULL COMMENT '应收利息',
  `rlx` decimal(10,2) DEFAULT NULL COMMENT '已收利息',
  `ybj` decimal(10,2) DEFAULT NULL COMMENT '应收本金',
  `rbj` decimal(10,2) DEFAULT NULL COMMENT '已收本金',
  `rnum` int(11) DEFAULT NULL COMMENT '已还期数',
  `tnum` int(11) DEFAULT NULL COMMENT '总期数',
  `date` datetime DEFAULT NULL COMMENT '日期',
  `baid` int(11) DEFAULT NULL COMMENT '借款id',
  PRIMARY KEY (`skid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='收款表';

-- ----------------------------
-- Records of skb
-- ----------------------------

-- ----------------------------
-- Table structure for sway
-- ----------------------------
DROP TABLE IF EXISTS `sway`;
CREATE TABLE `sway` (
  `sid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `way` varchar(255) DEFAULT NULL COMMENT '方式',
  `fw` varchar(500) DEFAULT NULL COMMENT '算法',
  `state` int(11) DEFAULT '1' COMMENT '状态, 0不可用， 1可用',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='还款方式表';

-- ----------------------------
-- Records of sway
-- ----------------------------
INSERT INTO `sway` VALUES ('1', '信用卡', '算法', '1');
INSERT INTO `sway` VALUES ('2', '方式', '算法', '1');
INSERT INTO `sway` VALUES ('3', '信用卡1', '方法1', '1');
INSERT INTO `sway` VALUES ('6', '信用卡2', '算法2', '1');

-- ----------------------------
-- Table structure for ticket
-- ----------------------------
DROP TABLE IF EXISTS `ticket`;
CREATE TABLE `ticket` (
  `umid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type` int(11) DEFAULT NULL COMMENT '类型 1邀请好友、2平台发布',
  `tkmoney` decimal(10,2) DEFAULT NULL COMMENT '价值',
  `tktime` datetime DEFAULT NULL COMMENT '有效时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`umid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='优惠券表';

-- ----------------------------
-- Records of ticket
-- ----------------------------
INSERT INTO `ticket` VALUES ('6', '2', '100.00', '2018-01-31 00:00:00', '2018-01-11 10:41:32');
INSERT INTO `ticket` VALUES ('7', '2', '100.00', '2018-02-08 00:00:00', '2018-01-11 10:53:24');
INSERT INTO `ticket` VALUES ('8', '2', '99.00', '2018-01-19 00:00:00', '2018-01-11 14:50:11');
INSERT INTO `ticket` VALUES ('9', '2', '200.00', '2018-02-14 00:00:00', '2018-01-11 15:45:30');
INSERT INTO `ticket` VALUES ('10', '1', '20.00', '2018-04-12 10:58:51', '2018-01-12 10:58:51');
INSERT INTO `ticket` VALUES ('11', '1', '20.00', '2018-04-12 10:58:52', '2018-01-12 10:58:52');
INSERT INTO `ticket` VALUES ('12', '1', '20.00', '2018-04-12 11:11:47', '2018-01-12 11:11:47');
INSERT INTO `ticket` VALUES ('13', '1', '20.00', '2018-04-12 11:11:47', '2018-01-12 11:11:47');

-- ----------------------------
-- Table structure for tx_check
-- ----------------------------
DROP TABLE IF EXISTS `tx_check`;
CREATE TABLE `tx_check` (
  `rcid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `txid` int(11) DEFAULT NULL COMMENT '提现id',
  `huid` int(11) DEFAULT NULL COMMENT '审核人id',
  `isok` int(11) DEFAULT '2' COMMENT '0不通过、1通过、2审核中',
  `excuse` varchar(200) DEFAULT NULL COMMENT '审核理由',
  `date` datetime DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`rcid`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8 COMMENT='提现审核表';

-- ----------------------------
-- Records of tx_check
-- ----------------------------
INSERT INTO `tx_check` VALUES ('33', '2', '15', null, '二锅头和借口', '2018-01-08 10:54:52');
INSERT INTO `tx_check` VALUES ('34', '2', '15', null, null, '2018-01-08 10:59:05');
INSERT INTO `tx_check` VALUES ('35', '2', '15', null, '提现理由不够充分！', '2018-01-08 10:59:29');
INSERT INTO `tx_check` VALUES ('36', '2', '15', null, null, '2018-01-08 11:24:28');
INSERT INTO `tx_check` VALUES ('37', '2', '15', null, '答复', '2018-01-08 11:25:07');
INSERT INTO `tx_check` VALUES ('38', '2', '15', null, null, '2018-01-08 11:25:32');
INSERT INTO `tx_check` VALUES ('39', '2', '15', null, '答复', '2018-01-08 11:25:42');
INSERT INTO `tx_check` VALUES ('40', '1', '15', null, '答复', '2018-01-08 11:26:54');
INSERT INTO `tx_check` VALUES ('41', '2', '15', null, null, '2018-01-08 11:29:33');
INSERT INTO `tx_check` VALUES ('42', '2', '15', null, '答复', '2018-01-08 11:30:03');
INSERT INTO `tx_check` VALUES ('43', '2', '15', null, null, '2018-01-08 11:33:13');
INSERT INTO `tx_check` VALUES ('44', '1', '15', null, null, '2018-01-08 11:33:40');
INSERT INTO `tx_check` VALUES ('45', '1', '15', null, null, '2018-01-08 11:36:44');
INSERT INTO `tx_check` VALUES ('46', '2', '15', null, null, '2018-01-08 11:40:42');
INSERT INTO `tx_check` VALUES ('47', '2', '15', null, '飞', '2018-01-08 11:40:49');
INSERT INTO `tx_check` VALUES ('48', '2', '15', null, '飞', '2018-01-08 11:40:51');
INSERT INTO `tx_check` VALUES ('49', '1', '15', null, '飞第三方', '2018-01-08 11:41:23');
INSERT INTO `tx_check` VALUES ('50', '1', '15', null, null, '2018-01-08 11:43:47');
INSERT INTO `tx_check` VALUES ('51', '1', '15', null, '鸡口牛后', '2018-01-08 11:43:57');
INSERT INTO `tx_check` VALUES ('52', '2', '15', null, null, '2018-01-08 14:17:00');
INSERT INTO `tx_check` VALUES ('53', null, '15', null, null, '2018-01-08 14:33:58');
INSERT INTO `tx_check` VALUES ('54', null, '15', null, null, '2018-01-08 14:34:02');
INSERT INTO `tx_check` VALUES ('55', null, '15', null, null, '2018-01-08 14:34:10');
INSERT INTO `tx_check` VALUES ('56', '2', '15', null, '二恶', '2018-01-08 14:34:21');
INSERT INTO `tx_check` VALUES ('57', null, '15', null, null, '2018-01-08 14:34:25');
INSERT INTO `tx_check` VALUES ('58', null, '15', null, null, '2018-01-08 14:35:33');
INSERT INTO `tx_check` VALUES ('59', null, '15', null, null, '2018-01-08 14:35:51');
INSERT INTO `tx_check` VALUES ('60', null, '15', null, null, '2018-01-08 14:36:55');
INSERT INTO `tx_check` VALUES ('61', null, '15', null, null, '2018-01-08 14:39:41');
INSERT INTO `tx_check` VALUES ('62', null, '15', null, null, '2018-01-08 14:41:03');
INSERT INTO `tx_check` VALUES ('63', null, '15', null, null, '2018-01-08 14:44:44');
INSERT INTO `tx_check` VALUES ('64', null, '15', null, null, '2018-01-08 14:49:51');
INSERT INTO `tx_check` VALUES ('65', null, '15', null, null, '2018-01-08 14:53:06');
INSERT INTO `tx_check` VALUES ('66', '2', '15', null, null, '2018-01-08 14:55:20');
INSERT INTO `tx_check` VALUES ('67', '2', '15', null, '而的封锁', '2018-01-08 15:25:05');
INSERT INTO `tx_check` VALUES ('68', '2', '15', null, null, '2018-01-08 15:29:55');
INSERT INTO `tx_check` VALUES ('69', '1', '15', null, null, '2018-01-08 15:32:43');
INSERT INTO `tx_check` VALUES ('70', '2', '15', null, null, '2018-01-09 11:38:27');
INSERT INTO `tx_check` VALUES ('71', '2', '15', null, null, '2018-01-09 11:40:53');
INSERT INTO `tx_check` VALUES ('72', '1', '15', null, null, '2018-01-09 11:41:19');
INSERT INTO `tx_check` VALUES ('73', '2', '15', null, null, '2018-01-09 11:45:17');
INSERT INTO `tx_check` VALUES ('74', '1', '15', null, null, '2018-01-09 11:50:09');
INSERT INTO `tx_check` VALUES ('75', '2', '15', null, null, '2018-01-09 11:52:09');
INSERT INTO `tx_check` VALUES ('76', '1', '15', null, null, '2018-01-09 11:53:14');

-- ----------------------------
-- Table structure for tx_log
-- ----------------------------
DROP TABLE IF EXISTS `tx_log`;
CREATE TABLE `tx_log` (
  `tid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` int(11) DEFAULT NULL COMMENT '用户id',
  `bankcard` varchar(20) DEFAULT NULL COMMENT '卡号',
  `banktype` varchar(50) DEFAULT NULL COMMENT '所属银行',
  `money` decimal(10,2) DEFAULT NULL COMMENT '金额',
  `date` datetime DEFAULT NULL COMMENT '时间',
  `state` int(11) DEFAULT '2' COMMENT '0不通过、1通过、2审核中',
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='提现记录表';

-- ----------------------------
-- Records of tx_log
-- ----------------------------
INSERT INTO `tx_log` VALUES ('1', '100000', '6226822013100490873', '农业银行', '10000.00', '2017-12-26 16:40:37', '1');
INSERT INTO `tx_log` VALUES ('2', '100000', '6226822013100490873', '农业银行', '10000.00', '2017-12-27 11:00:57', '1');

-- ----------------------------
-- Table structure for tzb
-- ----------------------------
DROP TABLE IF EXISTS `tzb`;
CREATE TABLE `tzb` (
  `sid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` int(11) DEFAULT NULL COMMENT '用户id（借出钱）',
  `juid` int(11) DEFAULT NULL COMMENT '借款人id（申请借钱）',
  `money` decimal(10,2) DEFAULT NULL COMMENT '投资金额',
  `time` datetime DEFAULT NULL COMMENT '投资时间',
  `nprofit` decimal(3,2) DEFAULT NULL COMMENT '利率',
  `cpname` varchar(255) DEFAULT NULL COMMENT '产品名',
  `baid` int(11) DEFAULT NULL COMMENT '借款id',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='投资表';

-- ----------------------------
-- Records of tzb
-- ----------------------------
INSERT INTO `tzb` VALUES ('18', '100000', '100001', '20000.00', '2018-01-10 11:29:07', '8.00', 'PJB1515457882799', '18');
INSERT INTO `tzb` VALUES ('19', '100000', '100001', '20000.00', '2018-01-10 11:43:29', '8.00', 'PJB1515457882799', '18');
INSERT INTO `tzb` VALUES ('20', '100000', '100001', '460000.00', '2018-01-10 18:08:13', '8.00', 'PJB1515457882799', '18');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uname` varchar(50) DEFAULT NULL COMMENT '用户名',
  `upwd` varchar(100) DEFAULT NULL COMMENT '登录密码',
  `phone` char(11) DEFAULT NULL COMMENT '手机号',
  `zpwd` varchar(100) DEFAULT NULL COMMENT '支付密码',
  `idtype` varchar(50) DEFAULT NULL COMMENT '证件类型',
  `idno` varchar(100) DEFAULT NULL COMMENT '证件号',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `rname` varchar(200) DEFAULT NULL COMMENT '真实姓名',
  `tid` int(11) DEFAULT NULL COMMENT '推荐人id',
  `face` varchar(500) DEFAULT NULL COMMENT '头像',
  `sex` varchar(4) DEFAULT NULL COMMENT '性别',
  `is_vip` int(11) DEFAULT '0' COMMENT '0：不是VIP，1：是VIP',
  `register_time` datetime DEFAULT NULL COMMENT '注册时间',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=100007 DEFAULT CHARSET=utf8 COMMENT='前台用户表';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('100000', 'Save', 'Qpf0SxOVUjUkWySXOZ16kw==', '12345678987', 'Qpf0SxOVUjUkWySXOZ16kw==', '驾驶证', '360724199909088822', 'tabo@tao.com', '前台', null, null, null, '0', '2018-01-09 08:09:46');
INSERT INTO `user` VALUES ('100001', 'We', 'Qpf0SxOVUjUkWySXOZ16kw==', '18888888888', 'Qpf0SxOVUjUkWySXOZ16kw==', '身份证', '360724199909099999', 'email@qq.com', '我们', '100000', '', '男', '0', '2018-01-09 08:09:43');
INSERT INTO `user` VALUES ('100004', 'Update', 'Qpf0SxOVUjUkWySXOZ16kw==', '18870798912', 'Qpf0SxOVUjUkWySXOZ16kw==', '护照', '360724199909088889', 'gitHub@qq.com', '后台', '100001', null, null, '0', '2018-01-09 08:09:45');
INSERT INTO `user` VALUES ('100005', null, '4QrcOUm6Wau+VuBX8g+IPg==', '18279708906', null, null, null, null, '', '100000', null, null, '0', '2018-01-12 10:58:51');
INSERT INTO `user` VALUES ('100006', null, '4QrcOUm6Wau+VuBX8g+IPg==', '17370134039', null, null, null, null, null, '100005', null, null, '0', '2018-01-12 11:11:47');

-- ----------------------------
-- Table structure for usermoney
-- ----------------------------
DROP TABLE IF EXISTS `usermoney`;
CREATE TABLE `usermoney` (
  `umid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` int(11) DEFAULT NULL COMMENT '用户id',
  `zymoney` decimal(10,2) DEFAULT NULL COMMENT '总资产',
  `kymoney` decimal(10,2) DEFAULT NULL COMMENT '可用余额',
  `symoney` decimal(10,2) DEFAULT NULL COMMENT '收益总额',
  `tzmoney` decimal(10,2) DEFAULT NULL COMMENT '投资总额',
  `djmoney` decimal(10,2) DEFAULT NULL COMMENT '冻结总额',
  `dsmoney` decimal(10,2) DEFAULT NULL COMMENT '待收总额',
  `jlmoney` decimal(10,2) DEFAULT NULL COMMENT '奖励总额',
  PRIMARY KEY (`umid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户资金表';

-- ----------------------------
-- Records of usermoney
-- ----------------------------
INSERT INTO `usermoney` VALUES ('1', '100001', '1000000.00', '831111.11', '0.00', '0.00', '0.00', '0.00', '0.00');
INSERT INTO `usermoney` VALUES ('2', '100000', '500000.00', '50.00', '0.00', '500000.00', '0.00', '503333.33', '0.00');
INSERT INTO `usermoney` VALUES ('3', '15', '500000.00', '500000.00', '0.00', '0.00', '0.00', '0.00', '0.00');

-- ----------------------------
-- Table structure for user_letter
-- ----------------------------
DROP TABLE IF EXISTS `user_letter`;
CREATE TABLE `user_letter` (
  `luid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` int(11) DEFAULT NULL COMMENT '用户id',
  `lid` int(11) DEFAULT NULL COMMENT '站内信id',
  `state` int(11) DEFAULT '2' COMMENT '状态，0删除，1已读，2未读',
  PRIMARY KEY (`luid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='用户站内信关联表';

-- ----------------------------
-- Records of user_letter
-- ----------------------------
INSERT INTO `user_letter` VALUES ('1', '100000', '1', '1');
INSERT INTO `user_letter` VALUES ('2', '100000', '2', '1');
INSERT INTO `user_letter` VALUES ('3', '100000', '3', '1');
INSERT INTO `user_letter` VALUES ('4', '100000', '4', '1');
INSERT INTO `user_letter` VALUES ('5', '100000', '5', '1');

-- ----------------------------
-- Table structure for user_ticket
-- ----------------------------
DROP TABLE IF EXISTS `user_ticket`;
CREATE TABLE `user_ticket` (
  `rwid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` int(11) DEFAULT NULL COMMENT '用户id',
  `kid` int(11) DEFAULT NULL COMMENT '优惠券id',
  `tktime` datetime DEFAULT NULL COMMENT '领券时间',
  `state` int(11) DEFAULT NULL COMMENT '状态：0已使用，1已过期，2可用',
  PRIMARY KEY (`rwid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='领券表';

-- ----------------------------
-- Records of user_ticket
-- ----------------------------
INSERT INTO `user_ticket` VALUES ('2', '100005', '10', '2018-01-12 10:58:52', '2');
INSERT INTO `user_ticket` VALUES ('3', '100000', '10', '2018-01-12 10:58:52', '2');
INSERT INTO `user_ticket` VALUES ('4', '100006', '12', '2018-01-12 11:11:47', '2');
INSERT INTO `user_ticket` VALUES ('5', '100005', '12', '2018-01-12 11:11:47', '2');

-- ----------------------------
-- Table structure for ydate
-- ----------------------------
DROP TABLE IF EXISTS `ydate`;
CREATE TABLE `ydate` (
  `yid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `date` datetime DEFAULT NULL COMMENT '生成时间',
  `tmoney` decimal(10,2) DEFAULT NULL COMMENT '交易总额',
  `mmoney` decimal(10,2) DEFAULT NULL COMMENT '月交易总额',
  `tuser` int(11) DEFAULT NULL COMMENT '总用户数',
  `muser` int(11) DEFAULT NULL COMMENT '月注册数',
  `ttzno` int(11) DEFAULT NULL COMMENT '总投资人数',
  `mtzno` int(11) DEFAULT NULL COMMENT '月投资人数',
  `tdkno` int(11) DEFAULT NULL COMMENT '总贷款人数',
  `mdkno` int(11) DEFAULT NULL COMMENT '月贷款人数',
  `tdkbno` int(11) DEFAULT NULL COMMENT '总贷款笔数',
  `mdkbno` int(11) DEFAULT NULL COMMENT '月贷款笔数',
  PRIMARY KEY (`yid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='运营数据表';

-- ----------------------------
-- Records of ydate
-- ----------------------------
