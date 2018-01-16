<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%--
  Created by IntelliJ IDEA.
  User: qiu
  Date: 2018/1/14
  Time: 20:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>我要投资-普金资本-安全可靠专注于供应链金融的国资背景P2P理财平台</title>
    <meta name="keywords" content="投资理财产品，小额投资理财，投资理财公司，个人理财、供应链金融产品，三方存管">
    <meta name="description" content="普金资本是目前国内知名的拥有国资背景的资理财公司，为投资理财用户提供多样的投资理财产品。投资额度小，短期投资周转快，高收益的安全理财尽在普金资本。">
    <link rel="stylesheet" href="<%=path%>/static/css/index/qrl/public.css">
    <link rel="stylesheet" href="<%=path%>/static/css/index/qrl/index.css">
    <link rel="icon" href="https://www.pujinziben.com/resources/front/v01/src/images/logo_title.jpg" type="image/x-icon">
</head>
<body>
<!--[if lt IE 8]>
<div class="show-danger">您正在使用 <strong>过时的</strong> 浏览器. 是时候 <a href="http://browsehappy.com/">更换一个更好的浏览器</a> 来提升用户体验.</div>
<![endif]-->
<!-- top -->
<div class="top" id="top">
    <!-- top -->
    <div class="wrap">
        <div class="top-left icon icon-phone">
            <span>客服热线：</span>400-606-2079 <span>（8:30～17:30）</span>
        </div>
        <div class="top-right cl">
            <ul class="top-list">
                <li class="first"><a href="https://www.pujinziben.com/regist.html" class="icon icon-person">注册领红包</a></li>
                <li><a href="https://www.pujinziben.com/account.html#tuijian" class="icon icon-inv">邀请有礼</a></li>
                <li><a href="https://www.pujinziben.com/about.html#gdbj">关于我们</a></li>
                <li><a href="https://www.pujinziben.com/help.html">帮助中心</a></li>
                <li></li>
                <li id="userName"><a href="https://www.pujinziben.com/login.html">登录</a></li>
                <li><a href="javascript:;" class="icon icon-app" id="app">APP下载</a></li>
            </ul>
            <div id="qrCodeDiv" style="display: none;">
                <div class="CodeDiv">
                    <img src="<%=path%>/static/images/index/qrl/qrCode_ios.png">
                    <p>IOS下载</p>
                </div>
                <div class="CodeDiv">
                    <img src="<%=path%>/static/images/index/qrl/qrCode_android.png">
                    <p>Android下载</p>
                </div>
            </div>
        </div>
    </div>

</div>
<!-- nav -->
<div class="nav">
    <div class="wrap cl">
        <div class="logo"><a href="https://www.pujinziben.com/"><img src="<%=path%>/static/images/index/qrl/logo.png" alt="普金资本"></a></div>
        <div class="nav-bar">
            <ul>
                <li class="icon icon-acc"><a href="https://www.pujinziben.com/login.html">我的账户</a></li>
                <!-- <li><a href="javascript:void(0);">信息披露</a></li> -->
                <li><a href="https://www.pujinziben.com/about.html">信息披露</a></li>
                <!-- <li><a href="javascript:void(0);" onclick="newPointer()">新手指导</a></li> -->
                <li><a href="https://www.pujinziben.com/safety.html">安全保障</a></li>
                <li class="active">
                    <a href="https://www.pujinziben.com/investlist.html">投资理财</a>
                    <div class="sub-nav">
                        <a href="https://www.pujinziben.com/investlist.html#006">恒金保</a>
                        <a href="https://www.pujinziben.com/investlist.html#004">普金保</a>
                        <a href="https://www.pujinziben.com/investlist.html#003">多金宝</a>
                        <a href="https://www.pujinziben.com/investlist.html#005">新手标</a>
                        <a href="https://www.pujinziben.com/creditorlist.html">债权转让</a>
                        <p class="left"></p>
                        <p class="right"></p>
                    </div>
                </li>
                <li><a href="https://www.pujinziben.com/">首页</a></li>
            </ul>
        </div>
    </div>
</div>
<div class="subject">
    <div class="subject-submit">
        <div class="subject-submit-l" style="display: block;">
            <div class="subject-submit-title">
                <p id="borrowWayName">恒金保</p>
                <h3 id="borrowTitle">YC2017TD00012</h3>
            </div>
            <div class="subject-submit-detail">
                <div class="subject-submit-rate">
                    <p>预期年化收益</p>
                    <p class="text color"><span class="color" id="rate">9+1</span>%</p>
                </div>
                <div class="subject-submit-date">
                    <p>项目期限</p>
                    <p class="text" id="date"><span>6</span>个月</p>
                </div>
                <div class="subject-submit-amt">
                    <p class="title_amt">募集总金额</p>
                    <p class="text"><span id="amt">132,254.00</span>元</p>
                </div>
            </div>
            <div class="subject-submit-bottom">
                <div class="subject-submit-b-l">
                    <p>还款方式：<span id="paymentMode">按月付息，到期还本</span></p>
                    <p>最小投标金额：<span id="minTenderedSum">100.00元</span></p>
                </div>
                <div class="subject-submit-b-l">
                    <p>总投标数：<span id="investNum">4</span></p>
                    <p>最大投标金额：<span id="maxTenderedSum">无限制</span></p>
                </div>
                <div class="subject-submit-b-r">
                    <div class="line">
                        <p>投资进度：</p><p class="progress"><em style="width: 56.77%;"></em></p><p class="progress-text">56.77%</p>
                    </div>
                    <p>可投标时间：<span id="publishTime">2018-01-08 15:00:00</span></p>
                </div>
            </div>
        </div>
        <div class="subject-submit-r" style="display: block;">
            <div class="subject-s-r-u">
                <a href="javascript:;" class="subject-login">登录</a>
            </div>
            <div class="subject-s-r-c">
                <p>可用余额：<span id="canUseSum">登录后可显示余额</span></p>
                <p class="rate">预期收益：<span class="color" id="reckon">0.05</span></p>
            </div>
            <div class="subject-s-r-c">
                <p>剩余可投：<span id="investAmount">57,168.53元</span></p>
                <p class="rate active" id="increaseP" style="display: none;">加息收益：<span class="color" id="increase">0.00</span></p>
            </div>
            <div class="input">
                <input type="text" placeholder="请输入投资金额" id="amount" onkeyup="reckon()" onblur="focusblur(this)">
                <button type="button" id="pushAll">全投</button>
            </div>
            <div class="quan">

                <a href="https://www.pujinziben.com/calculator.html?repayWay=3&amp;showRate=9+1&amp;time=6" class="icon icon-cal" id="calculator">详细收益明细</a>
            </div>
            <button class="btn" id="investBtn" type="button">立即投标</button>
        </div>
    </div>
</div>
<div class="sub-about">
    <div class="sub-a-nav">
        <a href="javascript:void(0);" class="active" onclick="getDetail(this)">项目详情</a>
        <a href="javascript:void(0);" onclick="getFile(this)" id="getFile">相关文件</a>
        <a href="javascript:void(0);" onclick="getPlan(this)" class="plan" id="getPlan">还款计划</a>
        <a href="javascript:void(0);" onclick="getInvest(this)" id="getInvest">投资记录</a>
        <a href="javascript:void(0);" onclick="dangger(this)">风险提示</a>
    </div>
    <em class="em-line"></em>
    <div class="sub-a-box" id="project" style="display: block;">
        <div class="detail cl">
            <p class="title">产品名称：</p><p class="content" id="projectTitle">YC2017TD00012</p>
        </div>
        <div class="detail cl">
            <p class="title">募集资金：</p><p class="content" id="projectAmount">132,254.00元</p>
        </div>
        <div class="detail cl">
            <p class="title">预期年化收益：</p><p class="content" id="projectRate">10%</p>
        </div>
        <div class="detail cl">
            <p class="title">起息日期：</p><p class="content">满标计息</p>
        </div>
        <div class="detail cl">
            <p class="title">资金用途：</p><p class="content" id="moneyPurposes">资金周转</p>
        </div>
        <div class="detail cl">
            <p class="title">收益方式：</p><p class="content" id="projectType">按月付息，到期还本</p>
        </div>
        <!-- <div class="detail cl">
            <p class="title">截止日期：</p><p class="content"></p>
        </div> -->
        <div class="detail cl">
            <p class="title">还款来源：</p><p class="content" id="retsource">电子商业承兑汇票到期资金</p>
        </div>
        <div class="detail cl">
            <p class="title">借款人介绍：</p><p class="content" id="projectIntro">原债权方赣州某广告传媒有限公司，主要从事地产营销、演艺策划、明星经纪、媒体传播、国内外时尚品牌发布会、会展及论坛举办、高级婚宴、高端私人酒会、公益慈善等，公司注册资本300万元。承接恒创有限公司全资子公司赣州恒创置业有限公司项目广告设计、制作安装、媒体传播等。原债权方将恒创置业所开具商业承兑汇票转让给某保理公司，恒创置业集团信用状况良好，资产实力充裕。本项目本次融资金额为132254元，融资期6个月。</p>
        </div>
        <div class="detail cl">
            <p class="title">项目描述：</p><p class="content" id="projectDetail">本期投资标的为某保理公司转让出的编号为YC2017TD00012的保理服务合同对应的商业承兑汇票债权，原债权借款人为赣州某广告传媒有限公司。承兑机构为赣州恒创置业有限公司。</p>
        </div>
        <div class="detail cl">
            <p class="title">保障措施：</p><p class="content" id="safeMeasures">1、项目到期由某保理公司回购<br>
            2、恒创置业有限公司无限连带责任保证<br>
            3、赣州某广告传媒有限公司承担回购及连带担保责任<br></p>
        </div>
    </div>
    <div class="sub-a-box files" id="files">
        <p class="icon icon-danger files-title">普金资本将以客观、公正的原则，最大程度地核实借入者信息的真实性，但不保证审核信息100%真实。如果借入者长期逾期，其提供的信息将被公布。</p>
        <ul class="files-box">
        </ul>
    </div>
    <div class="sub-a-box plan" id="plan">
        <ul class="">
            <li class="title"><div class="children0">序号</div><div class="children1">计划还款日期</div><div class="children2">实际还款日期</div><div class="children3">已还本息</div><div class="children4">待还本息</div><div class="children5">已付罚息</div><div class="children6">待还罚息</div><div class="children7">状态</div></li>
        </ul>
        <ul class="listData">
        </ul>
    </div>
    <div class="sub-a-box invest" id="invest">
        <ul class="">
            <li class="title"><div class="children0">投资人</div><div class="children1">金额</div><div class="children2">投资时间</div><div class="children3">投资方式</div></li>
        </ul>
        <ul class="listData">
        </ul>
        <ul class="paging"></ul>
    </div>
    <div class="sub-a-box dangger" id="tips">
        <p class="icon icon-danger tips-title"><b>普金资本郑重提示：</b>用户应自行对交易风险进行全面了解、充分认识、谨慎决策，用户应对其决策承担全部责任并承担全部风险。如用户通过普金资本平
            台进行下一步操作，即表示已经认真阅读本提示书并完全了解与接受。</p>
        <div class="content">
            <p class="title">一、政策风险</p>
            <p>因国家宏观政策和相关法律法规发生变化，可能引起价格方面的异常波动，用户可能因此遭受损失。</p>
            <p class="title">二、信用风险</p>
            <p> 普金资本不对本金和收益提供任何保证或承诺。若平台项目发生逾期还款，由平台合作机构保理公司或担保公司在 30 个工作日内进行债权回购。合作机构在发生
                最不利情况下（可能但并不一定发生），项目进入司法程序，可能不利于用户实现项目的预期收益甚至本金遭受损失。</p>
            <p class="title">三、信息传递风险</p>
            <p>普金资本将按协议约定进行信息披露，用户应充分关注并及时主动查询交易信息，如未及时查询，或由于通讯故障、系统故障以及其他不可抗力等因素的影响使得
                无法及时了解交易信息，由此产生责任和风险应由用户承担。</p>
            <p class="title">四、不可抗力及意外事件风险</p>
            <p>包括但不限于自然灾害、金融市场危机、战争、黑客攻击、病毒感染等不能预见、不能避免、不能克服的不可抗力事件，对于由于不可抗力及意外事件风险导致的
                任何损失，客户须自行承担。</p>
            <p class="title">五、流动性风险</p>
            <p>用户提以债权转让方式通过普金资本平台进行转让的，普金资本不对债权转让完成的时间以及债权转让能否全部成功实现做出任何承诺，债权未成功转让的，用户
                面临资金不能变现、丧失其他投资机会的风险。</p>
            <p class="icon icon-danger"><span>特别提示：</span>本风险提示书不能穷尽全部风险及市场的全部情形。</p>
        </div>

    </div>
</div>
<div class="files-more">
    <p class="title">其他资料</p>
    <a href="javascript:void(0);" class="close icon icon-close"></a>
    <ul class="files-more-list">

    </ul>
</div>
<div class="popup hasPWD">
    <p class="title left">输入投标密码</p>
    <a href="javascript:void(0);" class="close icon icon-close"></a>
    <div class="popup-from">
        <div class="label cl">
            <label>投标密码</label><input type="password" id="password" maxlength="30" placeholder="请输入投标密码">
        </div>
        <button type="button" class="btn" id="haspwd-submit">立即投标</button>
    </div>
</div>
<div class="popup AgreeMent">
    <p class="title left">普金资本服务协议</p>
    <a href="javascript:void(0);" class="close icon icon-close"></a>
    <div class="popup-area">

    </div>
</div>
<div id="ajaxFooter">


    <div class="mod-sidebar">
        <ul>
            <li><a target="_blank" href="tencent://message/?uin=1332666988&amp;Site=&amp;Menu=yes" class="sidebar-qq"></a></li>
            <li><a href="javascript:;" class="sidebar-wx"></a></li>
            <li><a href="https://www.pujinziben.com/calculator.html" class="sidebar-cl"></a></li>
            <li><a href="javascript:;" class="wenquan" title="填写即送5元代金券"></a></li>
            <li><a href="javascript:;" class="sidebar-top"></a></li>
        </ul>
    </div>
    <!-- concat -->
    <div class="index-concat">
        <div class="wrap cl">
            <div class="index-concat-left">
                <img src="<%=path%>/static/images/index/qrl/index_erweima.png" alt="扫码关注普金资本">
            </div>
            <div class="index-concat-channel">
                <p class="about_cel_no">admin@pujinziben.com</p>
            </div>
            <div class="index-concat-link cl"><a href="javascript:void(0);" class="title">友情链接</a><a target="_blank" href="http://www.p2peye.com/">网贷天眼</a><a target="_blank" href="http://www.wdtianxia.com/">网贷天下</a><a target="_blank" href="http://bank.pingan.com/">中国平安银行</a><a target="_blank" href="http://www.ccb.com/cn/home/indexv3.html">中国建设银行</a><a target="_blank" href="http://www.wangdaidongfang.com/">网贷东方</a><a target="_blank" href="http://www.p2p001.com/">第一网贷</a></div>
        </div>
    </div>
    <div class="footer">
        <div class="wrap">
            <p class="text">
                版权所有 © 普金资本运营（赣州）有限公司 All rights reserved <br>
                备案确认书：<a href="http://www.miitbeian.gov.cn/publish/query/indexFirst.action" target="_blank" class="beian">赣ICP备16004010号</a><a href="http://new.cnzz.com/v1/login.php?siteid=1260871948" target="_blank">  <img src="<%=path%>/static/images/index/qrl/CNZZ.png" alt=""></a>&nbsp;&nbsp;&nbsp;&nbsp;<a target="_blank" href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=36070202000195" style="display:inline-block;text-decoration:none;height:20px;line-height:20px;" class="beian"><img src="<%=path%>/static/images/index/qrl/beian.png" style="float:left;">赣公网安备 36070202000195号</a>

            </p>
            <div class="footer-list" style="width:650px;text-align:center">
                <a id="___szfw_logo___" href="https://credit.szfw.org/CX05252017016185201512.html" target="_blank"><img src="<%=path%>/static/images/index/qrl/foot2.png" border="0"></a>
                <!-- <a href="https://credit.cecdc.com/CX20160720023638001698.html"><img src="resources/front/v01/src/images/ft_link_01.png" alt=""></a> -->
                <a href="https://www.yunaq.com/analytics/login/?site=pujinziben.com" target="_blank"><img src="<%=path%>/static/images/index/qrl/ft_link_02.png" alt=""></a>
                <a href="http://si.trustutn.org/info?sn=685170725000594426611&amp;certType=4" target="_blank"><img width="110px" height="40px" src="<%=path%>/static/images/index/qrl/p2p_bottom_large_img.jpg" alt=""></a>
                <!-- 				<a href="http://webscan.360.cn/index/checkwebsite/url/www.pujinziben.com"><img width="110px" height="40px" border="0" src="http://img.webscan.360.cn/status/pai/hash/745ef449cbf0f6a74791f73d57aa7ac2"/></a> -->
                <a href="https://v.pinpaibao.com.cn/authenticate/cert/?site=www.pujinziben.com&amp;at=business" target="_blank">
                    <img src="<%=path%>/static/images/index/qrl/ft_link_04.png" alt="">
                </a>
                <a target="_blank" href="http://ec.eqixin.com/?sn=QX3712005910061483682343"><img width="112px" height="34px" src="<%=path%>/static/images/index/qrl/foot1.png"></a>
            </div>
        </div>
    </div>
    <div class="popup wechart-box">
        <p class="title left">关注普金资本微信公众号</p>
        <a href="javascript:void(0);" class="close icon icon-close"></a>
        <div class="popup-from">
            <img class="wechart" src="<%=path%>/static/images/index/qrl/wechart.jpg">
        </div>
    </div>
</div>
<script type="text/javascript" src="<%=path%>/static/js/index/qrl/jquery.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/index/qrl/public.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/index/qrl/invest.js"></script>
<div id="SL_balloon_obj" alt="0" style="display: block;"><div id="SL_button" class="SL_ImTranslatorLogo" style="background: url(&quot;chrome-extension://noaijdpnepcgjemiklgfkcfbkokogabh/content/img/util/imtranslator-s.png&quot;); display: none;"></div><div id="SL_shadow_translation_result2" style="display: none;"></div><div id="SL_shadow_translator" style="display: none;"><div id="SL_planshet"><div id="SL_arrow_up" style="background: url(&quot;chrome-extension://noaijdpnepcgjemiklgfkcfbkokogabh/content/img/util/up.png&quot;);"></div><div id="SL_Bproviders"><div class="SL_BL_LABLE_ON" title="Google" id="SL_P0">G</div><div class="SL_BL_LABLE_ON" title="Microsoft" id="SL_P1">M</div><div class="SL_BL_LABLE_ON" title="Translator" id="SL_P2">T</div></div><div id="SL_alert_bbl" style="display: none;"><div id="SLHKclose" style="background: url(&quot;chrome-extension://noaijdpnepcgjemiklgfkcfbkokogabh/content/img/util/delete.png&quot;);"></div><div id="SL_alert_cont"></div></div><div id="SL_TB"><table id="SL_tables" cellspacing="1"><tr><td class="SL_td" width="10%" align="right"><input id="SL_locer" type="checkbox" title="锁定语言"></td><td class="SL_td" width="20%" align="left"><select id="SL_lng_from" style="background: url(&quot;chrome-extension://noaijdpnepcgjemiklgfkcfbkokogabh/content/img/util/select.png&quot;) 100% 0px no-repeat rgb(255, 255, 255);"><option value="auto">检测语言</option><option value="eo">世界语</option><option value="zh-CN">中文简体</option><option value="zh-TW">中文繁体</option><option value="da">丹麦语</option><option value="uk">乌克兰语</option><option value="uz">乌兹别克语</option><option value="ur">乌尔都语</option><option value="hy">亚美尼亚语</option><option value="ig">伊博语</option><option value="ru">俄语</option><option value="bg">保加利亚语</option><option value="si">僧伽罗语</option><option value="hr">克罗地亚语</option><option value="is">冰岛语</option><option value="gl">加利西亚语</option><option value="ca">加泰罗尼亚语</option><option value="hu">匈牙利语</option><option value="zu">南非祖鲁语</option><option value="kn">卡纳达语</option><option value="hi">印地语</option><option value="su">印尼巽他语</option><option value="jw">印尼爪哇语</option><option value="id">印尼语</option><option value="gu">古吉拉特语</option><option value="kk">哈萨克语</option><option value="tr">土耳其语</option><option value="tg">塔吉克语</option><option value="sr">塞尔维亚语</option><option value="st">塞索托语</option><option value="cy">威尔士语</option><option value="bn">孟加拉语</option><option value="ceb">宿务语</option><option value="ne">尼泊尔语</option><option value="eu">巴斯克语</option><option value="af">布尔语(南非荷兰语)</option><option value="iw">希伯来语</option><option value="el">希腊语</option><option value="de">德语</option><option value="it">意大利语</option><option value="yi">意第绪语</option><option value="la">拉丁语</option><option value="lv">拉脱维亚语</option><option value="no">挪威语</option><option value="cs">捷克语</option><option value="sk">斯洛伐克语</option><option value="sl">斯洛文尼亚语</option><option value="sw">斯瓦希里语</option><option value="pa">旁遮普语</option><option value="ja">日语</option><option value="ka">格鲁吉亚语</option><option value="mi">毛利语</option><option value="fr">法语</option><option value="pl">波兰语</option><option value="bs">波斯尼亚语</option><option value="fa">波斯语</option><option value="te">泰卢固语</option><option value="ta">泰米尔语</option><option value="th">泰语</option><option value="ht">海地克里奥尔语</option><option value="ga">爱尔兰语</option><option value="et">爱沙尼亚语</option><option value="sv">瑞典语</option><option value="be">白俄罗斯语</option><option value="lt">立陶宛语</option><option value="so">索马里语</option><option value="yo">约鲁巴语</option><option value="my">缅甸语</option><option value="ro">罗马尼亚语</option><option value="lo">老挝语</option><option value="fi">芬兰语</option><option value="hmn">苗语</option><option value="en">英语</option><option value="nl">荷兰语</option><option value="tl">菲律宾语</option><option value="pt">葡萄牙语</option><option value="mn">蒙古语</option><option value="es">西班牙语</option><option value="ha">豪萨语</option><option value="vi">越南语</option><option value="az">阿塞拜疆语</option><option value="sq">阿尔巴尼亚语</option><option value="ar">阿拉伯语</option><option value="ko">韩语</option><option value="mk">马其顿语</option><option value="mg">马尔加什语</option><option value="mr">马拉地语</option><option value="ml">马拉雅拉姆语</option><option value="ms">马来语</option><option value="mt">马耳他语</option><option value="km">高棉语</option><option value="ny">齐切瓦语</option></select></td><td class="SL_td" width="3" align="center"><div id="SL_switch_b" title="切换语言" style="background: url(&quot;chrome-extension://noaijdpnepcgjemiklgfkcfbkokogabh/content/img/util/switchb.png&quot;);"></div></td><td class="SL_td" width="20%" align="left"><select id="SL_lng_to" style="background: url(&quot;chrome-extension://noaijdpnepcgjemiklgfkcfbkokogabh/content/img/util/select.png&quot;) 100% 0px no-repeat rgb(255, 255, 255);"><option value="eo">世界语</option><option value="zh-CN">中文简体</option><option value="zh-TW">中文繁体</option><option value="da">丹麦语</option><option value="uk">乌克兰语</option><option value="uz">乌兹别克语</option><option value="ur">乌尔都语</option><option value="hy">亚美尼亚语</option><option value="ig">伊博语</option><option value="ru">俄语</option><option value="bg">保加利亚语</option><option value="si">僧伽罗语</option><option value="hr">克罗地亚语</option><option value="is">冰岛语</option><option value="gl">加利西亚语</option><option value="ca">加泰罗尼亚语</option><option value="hu">匈牙利语</option><option value="zu">南非祖鲁语</option><option value="kn">卡纳达语</option><option value="hi">印地语</option><option value="su">印尼巽他语</option><option value="jw">印尼爪哇语</option><option value="id">印尼语</option><option value="gu">古吉拉特语</option><option value="kk">哈萨克语</option><option value="tr">土耳其语</option><option value="tg">塔吉克语</option><option value="sr">塞尔维亚语</option><option value="st">塞索托语</option><option value="cy">威尔士语</option><option value="bn">孟加拉语</option><option value="ceb">宿务语</option><option value="ne">尼泊尔语</option><option value="eu">巴斯克语</option><option value="af">布尔语(南非荷兰语)</option><option value="iw">希伯来语</option><option value="el">希腊语</option><option value="de">德语</option><option value="it">意大利语</option><option value="yi">意第绪语</option><option value="la">拉丁语</option><option value="lv">拉脱维亚语</option><option value="no">挪威语</option><option value="cs">捷克语</option><option value="sk">斯洛伐克语</option><option value="sl">斯洛文尼亚语</option><option value="sw">斯瓦希里语</option><option value="pa">旁遮普语</option><option value="ja">日语</option><option value="ka">格鲁吉亚语</option><option value="mi">毛利语</option><option value="fr">法语</option><option value="pl">波兰语</option><option value="bs">波斯尼亚语</option><option value="fa">波斯语</option><option value="te">泰卢固语</option><option value="ta">泰米尔语</option><option value="th">泰语</option><option value="ht">海地克里奥尔语</option><option value="ga">爱尔兰语</option><option value="et">爱沙尼亚语</option><option value="sv">瑞典语</option><option value="be">白俄罗斯语</option><option value="lt">立陶宛语</option><option value="so">索马里语</option><option value="yo">约鲁巴语</option><option value="my">缅甸语</option><option value="ro">罗马尼亚语</option><option value="lo">老挝语</option><option value="fi">芬兰语</option><option value="hmn">苗语</option><option value="en">英语</option><option value="nl">荷兰语</option><option value="tl">菲律宾语</option><option value="pt">葡萄牙语</option><option value="mn">蒙古语</option><option value="es">西班牙语</option><option value="ha">豪萨语</option><option value="vi">越南语</option><option value="az">阿塞拜疆语</option><option value="sq">阿尔巴尼亚语</option><option value="ar">阿拉伯语</option><option value="ko">韩语</option><option value="mk">马其顿语</option><option value="mg">马尔加什语</option><option value="mr">马拉地语</option><option value="ml">马拉雅拉姆语</option><option value="ms">马来语</option><option value="mt">马耳他语</option><option value="km">高棉语</option><option value="ny">齐切瓦语</option></select></td><td class="SL_td" width="5%" align="center"> </td><td class="SL_td" width="8%" align="center"><div id="SL_TTS_voice" title="聆听翻译" style="background: url(&quot;chrome-extension://noaijdpnepcgjemiklgfkcfbkokogabh/content/img/util/ttsvoice.png&quot;);"></div></td><td class="SL_td" width="8%" align="center"><div id="SL_copy" title="复制译文" class="SL_copy" style="background: url(&quot;chrome-extension://noaijdpnepcgjemiklgfkcfbkokogabh/content/img/util/copy.png&quot;);"></div></td><td class="SL_td" width="8%" align="center"><div id="SL_bbl_font_patch"></div><div id="SL_bbl_font" title="字体大小" class="SL_bbl_font" style="background: url(&quot;chrome-extension://noaijdpnepcgjemiklgfkcfbkokogabh/content/img/util/font.png&quot;);"></div></td><td class="SL_td" width="8%" align="center"><div id="SL_bbl_help" title="帮助" style="background: url(&quot;chrome-extension://noaijdpnepcgjemiklgfkcfbkokogabh/content/img/util/bhelp.png&quot;);"></div></td><td class="SL_td" width="15%" align="right"><div id="SL_pin" class="SL_pin_off" title="固定弹出窗口" style="background: url(&quot;chrome-extension://noaijdpnepcgjemiklgfkcfbkokogabh/content/img/util/pin-on.png&quot;);"></div></td></tr></table></div></div><div id="SL_shadow_translation_result" style="visibility: visible;"></div><div id="SL_loading" class="SL_loading" style="background: url(&quot;chrome-extension://noaijdpnepcgjemiklgfkcfbkokogabh/content/img/util/loading.gif&quot;);"></div><div id="SL_player2"></div><div id="SL_alert100">文本转语音功能仅限200个字符</div><div id="SL_Balloon_options" style="background: url(&quot;chrome-extension://noaijdpnepcgjemiklgfkcfbkokogabh/content/img/util/bg3.png&quot;) rgb(255, 255, 255);"><div id="SL_arrow_down" style="background: url(&quot;chrome-extension://noaijdpnepcgjemiklgfkcfbkokogabh/content/img/util/down.png&quot;);"></div><table id="SL_tbl_opt" width="100%"><tr><td width="5%" align="center"><input id="SL_BBL_locer" type="checkbox" checked="1" title="显示翻译器的按钮 3 秒"></td><td width="5%" align="left"><div id="SL_BBL_IMG" title="显示翻译器的按钮 3 秒" style="background: url(&quot;chrome-extension://noaijdpnepcgjemiklgfkcfbkokogabh/content/img/util/bbl-logo.png&quot;);"></div></td><td width="70%" align="center"><a href="chrome-extension://noaijdpnepcgjemiklgfkcfbkokogabh/content/html/options/options.html?bbl" target="_blank" class="SL_options" title="显示选项">选项</a> : <a href="chrome-extension://noaijdpnepcgjemiklgfkcfbkokogabh/content/html/options/options.html?hist" target="_blank" class="SL_options" title="翻译历史记录">历史</a> : <a href="chrome-extension://noaijdpnepcgjemiklgfkcfbkokogabh/content/html/options/options.html?feed" target="_blank" class="SL_options" title="反馈">反馈</a> : <a href="https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&amp;hosted_button_id=GD9D8CPW8HFA2" target="_blank" class="SL_options" title="作出一点点贡献">Donate</a></td><td width="15%" align="right"><span id="SL_Balloon_Close" title="关闭">关闭</span></td></tr></table></div></div></div>
</body>
</html>
