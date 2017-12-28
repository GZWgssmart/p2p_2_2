CREATE DATABASE IF NOT EXISTS d_ssm_pujinziben DEFAULT CHARSET utf8 COLLATE utf8_general_ci;

USE d_ssm_pujinziben;

/**
decimal(7, 2) 改为 decimal(10, 2)
首页信息表重构 只剩id、图片、链接， 二维码和电话直接显示在首页.
log_czz、 log_money, log_tx 分别改为 cz_log、money_log、 tx_log
 */

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`(
  uid INT PRIMARY KEY AUTO_INCREMENT COMMENT '主键',
  uname VARCHAR(50) COMMENT '用户名',
  upwd VARCHAR(100) COMMENT '登录密码',
  phone CHAR(11) UNIQUE COMMENT'手机号',
  zpwd VARCHAR(100) COMMENT '支付密码',
  idtype VARCHAR(50) COMMENT '证件类型',
  idno VARCHAR(100) COMMENT '证件号',
  email VARCHAR(100) COMMENT '邮箱',
  rname VARCHAR(200) COMMENT '真实姓名',
  tid INT COMMENT '推荐人id',
  face VARCHAR(500) COMMENT '头像',
  sex VARCHAR(4) COMMENT '性别',
  is_vip INT COMMENT '0：不是VIP，1：是VIP' DEFAULT 0
)ENGINE = InnoDB DEFAULT CHARSET = utf8 AUTO_INCREMENT = 100000 COMMENT '前台用户表';

DROP TABLE IF EXISTS rzvip;
CREATE TABLE rzvip(
  rid INT PRIMARY KEY AUTO_INCREMENT COMMENT '主键',
  uid INT COMMENT '用户id',
  xl VARCHAR(20) COMMENT '学历',
  ism VARCHAR(10) COMMENT '婚否',
  bschool VARCHAR(50) COMMENT '毕业院校',
  addr VARCHAR(200) COMMENT '居住地',
  work VARCHAR(200) COMMENT '现工作',
  age INT COMMENT '年龄'
)ENGINE = InnoDB DEFAULT  CHARSET = utf8 COMMENT '认证表';

DROP TABLE IF EXISTS borrowapply;
CREATE TABLE borrowapply(
  baid INT PRIMARY KEY AUTO_INCREMENT COMMENT '主键',
  rname VARCHAR(50) COMMENT '真实姓名',
  money DECIMAL(10, 2) COMMENT '申请金额',
  uid INT COMMENT '借款人id',
  bzid INT COMMENT '标种，先息后本，等额本金，等额本息',
  time DATETIME COMMENT '申请时间',
  state INT COMMENT '审核状态，0不通过，1通过，2审核中，3未填写借款详情' DEFAULT 3,
  type INT COMMENT '借款类型，多金宝。。。',
  term INT COMMENT '借款期限',
  deadline DATETIME COMMENT '截止时间'
)ENGINE = InnoDB DEFAULT  CHARSET = utf8 COMMENT '申请借款表';

DROP TABLE IF EXISTS borrowdetail;
CREATE TABLE borrowdetail(
  bdid INT PRIMARY KEY AUTO_INCREMENT COMMENT '主键',
  fpic CHAR(18) COMMENT '法人身份证',
  ypic VARCHAR(255) COMMENT '营业执照副本',
  qpic VARCHAR(255) COMMENT '企业银行账号',
  tpic VARCHAR(500) COMMENT '其他资料',
  mpurpose VARCHAR(500) COMMENT '资金用途',
  hksource VARCHAR(500) COMMENT '还款来源',
  suggest VARCHAR(500) COMMENT '借款人介绍',
  xmdescrip TEXT COMMENT '项目描述',
  guarantee VARCHAR(500) COMMENT '保障措施',
  money DECIMAL(10, 2) COMMENT '金额',
  nprofit DECIMAL(3, 2) COMMENT '年化收益',
  way VARCHAR(255) COMMENT '收益方式',
  cpname VARCHAR(255) COMMENT '产品名称',
  baid INT COMMENT '关联的借款id'
)ENGINE = InnoDB DEFAULT  CHARSET = utf8 COMMENT '借款详情表';

DROP TABLE IF EXISTS sway;
CREATE TABLE sway(
  sid INT PRIMARY KEY AUTO_INCREMENT COMMENT '主键',
  way VARCHAR(255) COMMENT '方式',
  fw VARCHAR(500) COMMENT '算法',
  state INT COMMENT '状态, 0不可用， 1可用' DEFAULT 1
)ENGINE = InnoDB DEFAULT  CHARSET = utf8 COMMENT '还款方式表';

DROP TABLE IF EXISTS shborrow;
CREATE TABLE shborrow (
  shid INT PRIMARY KEY AUTO_INCREMENT COMMENT '主键',
  huid INT COMMENT '审核人id',
  isok INT COMMENT '审核状态，0不通过，1通过，2审核中，3未填写借款详情' DEFAULT 3,
  excuse VARCHAR(200) COMMENT '审核理由',
  `date` DATETIME COMMENT '时间',
  baid INT COMMENT '借款id'
)ENGINE = InnoDB DEFAULT  CHARSET = utf8 COMMENT '借款审核表';

DROP TABLE IF EXISTS tzb;
CREATE TABLE tzb(
  sid INT PRIMARY KEY AUTO_INCREMENT COMMENT '主键',
  uid INT COMMENT '用户id（借出钱）',
  juid INT COMMENT '借款人id（申请借钱）',
  money DECIMAL(10, 2) COMMENT '投资金额',
  time DATETIME COMMENT '投资时间',
  nprofit DECIMAL(3, 2) COMMENT '利率',
  cpname VARCHAR(255) COMMENT '产品名',
  baid INT COMMENT '借款id'
)ENGINE = InnoDB DEFAULT  CHARSET = utf8 COMMENT '投资表';

DROP TABLE IF EXISTS skb;
CREATE TABLE skb(
  skid INT PRIMARY KEY AUTO_INCREMENT COMMENT '主键',
  uid INT COMMENT '用户id（借出钱）',
  juid INT COMMENT '借款人id（申请借钱）',
  ybx DECIMAL(10, 2) COMMENT '应收本息',
  rbx DECIMAL(10, 2) COMMENT '已收本息',
  ylx DECIMAL(10, 2) COMMENT '应收利息',
  rlx DECIMAL(10, 2) COMMENT '已收利息',
  ybj DECIMAL(10, 2) COMMENT '应收本金',
  rbj DECIMAL(10, 2) COMMENT '已收本金',
  rnum INT COMMENT '已还期数',
  tnum INT COMMENT '总期数',
  `date` DATETIME COMMENT '日期',
  baid INT COMMENT '借款id'
)ENGINE = InnoDB DEFAULT  CHARSET = utf8 COMMENT '收款表';

DROP TABLE IF EXISTS hkb;
CREATE TABLE hkb(
  skid INT PRIMARY KEY AUTO_INCREMENT COMMENT '主键',
  uid INT COMMENT '借款人id（申请借钱）',
  rname VARCHAR(200) COMMENT '真实姓名',
  cpname VARCHAR(255) COMMENT '产品名称',
  rnum INT COMMENT '已还期数',
  tnum INT COMMENT '总期数',
  ytime DATETIME COMMENT '应还时间',
  rtime DATETIME COMMENT '实际还款时间',
  bzname VARCHAR(255) COMMENT '标种',
  ybx DECIMAL(10, 2) COMMENT '应还本息',
  rbx DECIMAL(10, 2) COMMENT '已还本息',
  ylx DECIMAL(10, 2) COMMENT '应还利息',
  rlx DECIMAL(10, 2) COMMENT '已还利息',
  ybj DECIMAL(10, 2) COMMENT '应还本金',
  rbj DECIMAL(10, 2) COMMENT '已还本金',
  yfx DECIMAL(10, 2) COMMENT '应还罚息',
  rfx DECIMAL(10, 2) COMMENT '已还罚息',
  yucount INT COMMENT '逾期次数',
  state INT COMMENT '还款状态',
  baid INT COMMENT '借款id',
  yustartime DATETIME COMMENT '逾期执行时间',
  huid INT COMMENT '贷后负责人id'
)ENGINE = InnoDB DEFAULT  CHARSET = utf8 COMMENT '还款表';

DROP TABLE IF EXISTS huser;
CREATE TABLE huser(
  huid INT PRIMARY KEY AUTO_INCREMENT COMMENT '主键',
  rname VARCHAR(200) COMMENT '真实姓名',
  sex VARCHAR(4) COMMENT '性别',
  phone CHAR(11) UNIQUE COMMENT'手机号',
  huname VARCHAR(50) COMMENT '用户名',
  oid INT COMMENT '所属组id',
  oname VARCHAR(200) COMMENT '所属组名',
  email VARCHAR(100) COMMENT '邮箱'
)ENGINE = InnoDB DEFAULT  CHARSET = utf8 COMMENT '后台用户表';

DROP TABLE IF EXISTS bz;
CREATE TABLE bz(
  bzid INT PRIMARY KEY AUTO_INCREMENT COMMENT '主键',
  bzname VARCHAR(200) COMMENT '名称',
  state INT COMMENT '状态，0不可用，1可用' DEFAULT 1
)ENGINE = InnoDB DEFAULT  CHARSET = utf8 COMMENT '标种表';

INSERT INTO bz (bzname, state) VALUES ('多金宝', 1), ('普金宝', 1), ('恒金宝', 1);

DROP TABLE IF EXISTS jklx;
CREATE TABLE jklx(
  lxid INT PRIMARY KEY AUTO_INCREMENT COMMENT '主键',
  lxname VARCHAR(200) COMMENT '名称',
  state INT COMMENT '状态，0不可用，1可用' DEFAULT 1
)ENGINE = InnoDB DEFAULT  CHARSET = utf8 COMMENT '借款类型表';

INSERT INTO jklx(lxname) VALUES ('净值标'), ('抵押标'), ('流转标'), ('信用标'), ('担保标');

DROP TABLE IF EXISTS jur;
CREATE TABLE jur(
  jid INT PRIMARY KEY AUTO_INCREMENT COMMENT '主键',
  jurl VARCHAR(1000) COMMENT '权限url',
  content VARCHAR(500) COMMENT '内容'
)ENGINE = InnoDB DEFAULT  CHARSET = utf8 COMMENT '权限表';

DROP TABLE IF EXISTS role;
CREATE TABLE role (
  jid INT PRIMARY KEY AUTO_INCREMENT COMMENT '主键',
  rname VARCHAR(200) COMMENT '角色名',
  content VARCHAR(500) COMMENT '描述'
)ENGINE = InnoDB DEFAULT  CHARSET = utf8 COMMENT '角色表';

DROP TABLE IF EXISTS rolejur;
CREATE TABLE rolejur (
  rjid INT PRIMARY KEY AUTO_INCREMENT COMMENT '主键',
  rid INT COMMENT '角色id',
  jid INT COMMENT '权限id'
)ENGINE = InnoDB DEFAULT  CHARSET = utf8 COMMENT '角色权限表';

DROP TABLE IF EXISTS roleuser;
CREATE TABLE roleuser (
  ruid INT PRIMARY KEY AUTO_INCREMENT COMMENT '主键',
  rid INT COMMENT '角色id',
  huid INT COMMENT '后台用户id'
)ENGINE = InnoDB DEFAULT  CHARSET = utf8 COMMENT '用户角色表';

DROP TABLE IF EXISTS `dynamic`;
CREATE TABLE `dynamic` (
  dyid INT PRIMARY KEY AUTO_INCREMENT COMMENT '主键',
  title VARCHAR(200) COMMENT '标题',
  `date` DATETIME COMMENT '时间',
  content TEXT COMMENT '内容',
  pic VARCHAR(500) COMMENT '封面图片'
)ENGINE = InnoDB DEFAULT  CHARSET = utf8 COMMENT '公司动态表';

DROP TABLE IF EXISTS usermoney;
CREATE TABLE usermoney (
  umid INT PRIMARY KEY AUTO_INCREMENT COMMENT '主键',
  zymoney DECIMAL(10, 2) COMMENT '总资产',
  kymoney DECIMAL(10, 2) COMMENT '可用余额',
  symoney DECIMAL(10, 2) COMMENT '收益总额',
  tzmoney DECIMAL(10, 2) COMMENT '投资总额',
  djmoney DECIMAL(10, 2) COMMENT '冻结总额',
  dsmoney DECIMAL(10, 2) COMMENT '待收总额',
  jlmoney DECIMAL(10, 2) COMMENT '奖励总额'
)ENGINE = InnoDB DEFAULT  CHARSET = utf8 COMMENT '用户资金表';

DROP TABLE IF EXISTS reward;
CREATE TABLE reward (
  umid INT PRIMARY KEY AUTO_INCREMENT COMMENT '主键',
  uid INT COMMENT '投资人id',
  tmoney DECIMAL(10, 2) COMMENT '投资总额',
  money DECIMAL(10, 2) COMMENT  '奖励金额',
  state VARCHAR(20) COMMENT '奖励发放状态',
  `date` DATETIME COMMENT '奖励发放时间'
)ENGINE = InnoDB DEFAULT  CHARSET = utf8 COMMENT '投资总额奖励表';

DROP TABLE IF EXISTS ticket;
CREATE TABLE ticket (
  umid INT PRIMARY KEY AUTO_INCREMENT COMMENT '主键',
  type INT COMMENT '类型',
  tkmoney DECIMAL(10, 2) COMMENT '价值',
  tktime DATETIME COMMENT '有效时间'
)ENGINE = InnoDB DEFAULT  CHARSET = utf8 COMMENT '优惠券表';

DROP TABLE IF EXISTS bankcard;
CREATE TABLE bankcard (
  bcid INT PRIMARY KEY AUTO_INCREMENT COMMENT '主键',
  uid INT COMMENT '用户id',
  cardno VARCHAR(20) COMMENT '卡号',
  rname VARCHAR(200) COMMENT '姓名',
  idno CHAR(18) COMMENT '身份证',
  type VARCHAR(50) COMMENT '所属银行',
  state INT COMMENT '状态，0冻结，1可用' DEFAULT 1,
  `date` DATETIME COMMENT '绑卡时间'
)ENGINE = InnoDB DEFAULT  CHARSET = utf8 COMMENT '银行卡表';

DROP TABLE IF EXISTS home_img;
CREATE TABLE home_img (
  hid INT PRIMARY KEY AUTO_INCREMENT COMMENT '主键',
  imgPath VARCHAR(500) COMMENT '轮播图路径',
  imgHref VARCHAR(500) COMMENT '轮播图链接'
)ENGINE = InnoDB DEFAULT  CHARSET = utf8 COMMENT '首页图片表';

DROP TABLE IF EXISTS friend;
CREATE TABLE friend (
  fid INT PRIMARY KEY AUTO_INCREMENT COMMENT '主键',
  imgPath VARCHAR(500) COMMENT '图片路径',
  imgHref VARCHAR(500) COMMENT '图片链接',
  imgAlert VARCHAR(50) COMMENT '图片描述'
)ENGINE = InnoDB DEFAULT  CHARSET = utf8 COMMENT '合作伙伴表';

DROP TABLE IF EXISTS notice;
CREATE TABLE notice (
  nid INT PRIMARY KEY AUTO_INCREMENT COMMENT '主键',
  content TEXT COMMENT '内容',
  title VARCHAR(200) COMMENT '标题',
  `date` DATETIME COMMENT '时间'
)ENGINE = InnoDB DEFAULT  CHARSET = utf8 COMMENT '最新公告表';

DROP TABLE IF EXISTS ydate;
CREATE TABLE ydate (
  yid INT PRIMARY KEY AUTO_INCREMENT COMMENT '主键',
  `date` DATETIME COMMENT '生成时间',
  tmoney DECIMAL(10, 2) COMMENT '交易总额',
  mmoney DECIMAL(10, 2) COMMENT '月交易总额',
  tuser INT COMMENT '总用户数',
  muser INT COMMENT '月注册数',
  ttzno INT COMMENT '总投资人数',
  mtzno INT COMMENT '月投资人数',
  tdkno INT COMMENT '总贷款人数',
  mdkno INT COMMENT '月贷款人数',
  tdkbno INT COMMENT '总贷款笔数',
  mdkbno INT COMMENT '月贷款笔数'
)ENGINE = InnoDB DEFAULT  CHARSET = utf8 COMMENT '运营数据表';

DROP TABLE IF EXISTS media;
CREATE TABLE media (
  mid INT PRIMARY KEY AUTO_INCREMENT COMMENT '主键',
  title VARCHAR(200) COMMENT '标题',
  content TEXT COMMENT '内容',
  pic VARCHAR(500) COMMENT '封面图片',
  `date` DATETIME COMMENT '时间',
  url VARCHAR(500) COMMENT 'url地址'
)ENGINE = InnoDB DEFAULT  CHARSET = utf8 COMMENT '媒体报道表';

DROP TABLE IF EXISTS `option`;
CREATE TABLE `option` (
  opid INT PRIMARY KEY AUTO_INCREMENT COMMENT '主键',
  phone CHAR(11) COMMENT '手机号码',
  content TEXT COMMENT '内容',
  `date` DATETIME COMMENT '时间'
)ENGINE = InnoDB DEFAULT  CHARSET = utf8 COMMENT '用户反馈表';

DROP TABLE IF EXISTS letter;
CREATE TABLE letter (
  lid INT PRIMARY KEY AUTO_INCREMENT COMMENT '主键',
  title VARCHAR(200) COMMENT '标题',
  content TEXT COMMENT '内容',
  `date` DATETIME COMMENT '日期',
  state INT COMMENT '状态，0不可用，1可用' DEFAULT 1
)ENGINE = InnoDB DEFAULT  CHARSET = utf8 COMMENT '站内信表';

DROP TABLE IF EXISTS user_letter;
CREATE TABLE user_letter(
  luid INT PRIMARY KEY AUTO_INCREMENT COMMENT '主键',
  uid INT COMMENT '用户id',
  lid INT COMMENT '站内信id',
  state INT COMMENT '状态，0删除，1已读，2未读' DEFAULT 2
)ENGINE = InnoDB DEFAULT  CHARSET = utf8 COMMENT '用户站内信关联表';

DROP TABLE IF EXISTS dxmodel;
CREATE TABLE dxmodel (
  dxid INT PRIMARY KEY AUTO_INCREMENT COMMENT '主键',
  content TEXT COMMENT '内容'
)ENGINE = InnoDB DEFAULT  CHARSET = utf8 COMMENT '短信模板表';

DROP TABLE IF EXISTS cz_log;
CREATE TABLE cz_log (
  czid INT PRIMARY KEY AUTO_INCREMENT COMMENT '主键',
  uid INT COMMENT '用户id',
  bankcard VARCHAR(20) COMMENT '卡号',
  banktype VARCHAR(50) COMMENT '所属银行',
  money DECIMAL(10, 2) COMMENT '金额',
  `date` DATETIME COMMENT '时间',
  state INT COMMENT '状态，0不可用，1可用' DEFAULT 1
)ENGINE = InnoDB DEFAULT  CHARSET = utf8 COMMENT '充值记录表';

DROP TABLE IF EXISTS money_log;
CREATE TABLE money_log (
  mid INT PRIMARY KEY AUTO_INCREMENT COMMENT '主键',
  uid INT COMMENT '用户id',
  type INT COMMENT '类型，0充值、1提现、2回款、3系统金额（公司奖励..）',
  `in` DECIMAL(10, 2) COMMENT '收入',
  `out` DECIMAL(10, 2) COMMENT '支出',
  `date` DATETIME COMMENT '时间'
)ENGINE = InnoDB DEFAULT  CHARSET = utf8 COMMENT '资金流向表';

DROP TABLE IF EXISTS recommend;
CREATE TABLE recommend (
  rid INT PRIMARY KEY AUTO_INCREMENT COMMENT '主键',
  tid INT COMMENT '推荐人id(已经注册)',
  tname VARCHAR(100) COMMENT '推荐人姓名',
  uid INT COMMENT '被推荐人id（准备注册）',
  rname VARCHAR(100) COMMENT '被推荐人姓名',
  `date` DATETIME COMMENT '时间'
)ENGINE = InnoDB DEFAULT  CHARSET = utf8 COMMENT '推荐管理表';

DROP TABLE IF EXISTS tx_log;
CREATE TABLE tx_log (
  tid INT PRIMARY KEY AUTO_INCREMENT COMMENT '主键',
  uid INT COMMENT '用户id',
  bankcard VARCHAR(20) COMMENT '卡号',
  banktype VARCHAR(50) COMMENT '所属银行',
  money DECIMAL(10, 2) COMMENT '金额',
  `date` DATETIME COMMENT '时间',
  state INT COMMENT '0不通过、1通过、2审核中' DEFAULT 2
)ENGINE = InnoDB DEFAULT CHARSET = utf8 COMMENT '提现记录表';

DROP TABLE IF EXISTS reward_setting;
CREATE TABLE reward_setting (
  rwid INT PRIMARY KEY AUTO_INCREMENT COMMENT '主键',
  minmoney DECIMAL(10, 2) COMMENT '最小金额',
  maxmoney DECIMAL(10, 2) COMMENT '最大金额',
  percent DOUBLE COMMENT '奖励百分比'
)ENGINE = InnoDB DEFAULT  CHARSET = utf8 COMMENT '投资奖励设置表';

DROP TABLE IF EXISTS user_ticket;
CREATE TABLE user_ticket (
  rwid INT PRIMARY KEY AUTO_INCREMENT COMMENT '主键',
  uid INT COMMENT '用户id',
  kid INT COMMENT '优惠券id',
  tktime DATETIME COMMENT '领券时间'
)ENGINE = InnoDB DEFAULT  CHARSET = utf8 COMMENT '领券表';

DROP TABLE IF EXISTS rzvip_check;
CREATE TABLE rzvip_check (
  rcid INT PRIMARY KEY AUTO_INCREMENT COMMENT '主键',
  uid INT COMMENT '用户id',
  huid INT COMMENT '审核人id',
  isok INT COMMENT '0不通过、1通过、2审核中' DEFAULT 2,
  excuse VARCHAR(200) COMMENT '审核理由',
  `date` DATETIME COMMENT '时间'
)ENGINE = InnoDB DEFAULT  CHARSET = utf8 COMMENT '认证审核表';

DROP TABLE IF EXISTS tx_check;
CREATE TABLE tx_check (
  rcid INT PRIMARY KEY AUTO_INCREMENT COMMENT '主键',
  txid INT COMMENT '提现id',
  huid INT COMMENT '审核人id',
  isok INT COMMENT '0不通过、1通过、2审核中' DEFAULT 2,
  excuse VARCHAR(200) COMMENT '审核理由',
  `date` DATETIME COMMENT '时间'
)ENGINE = InnoDB DEFAULT  CHARSET = utf8 COMMENT '提现审核表';