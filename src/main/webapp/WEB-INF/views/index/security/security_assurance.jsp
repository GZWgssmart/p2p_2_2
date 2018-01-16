<%--
  Created by IntelliJ IDEA.
  User: ID.LQF
  Date: 2017/12/21
  Time: 15:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>普金资本-安全可靠专注于供应链金融的国资背景P2P理财平台</title>
    <link rel="icon" href="<%=path%>/static/images/logo_title.jpg">
    <link rel="stylesheet" href="<%=path %>/static/css/index/public.css">
    <link rel="stylesheet" href="<%=path %>/static/css/index/index.css">
</head>
<script type="text/javascript">
    function IsPC() {
        var userAgentInfo = navigator.userAgent;
        var Agents = ["Android", "iPhone",
            "SymbianOS", "Windows Phone",
            "iPad", "iPod"];
        var flag = true;
        for (var v = 0; v < Agents.length; v++) {
            if (userAgentInfo.indexOf(Agents[v]) > 0) {
                flag = false;
                break;
            }
        }
        return flag;
    }

    if(IsPC()!=true){
        window.location.href="front/indexInit.do";
    }
</script>
<body>
<!--[if lt IE 8]>
<div class="show-danger">您正在使用 <strong>过时的</strong> 浏览器. 是时候 <a href="http://browsehappy.com/">更换一个更好的浏览器</a> 来提升用户体验.</div>
<![endif]-->
<!-- top -->
<div class="top" id="top">
</div>
<!-- nav -->
<%@include file="../../common/index/head_page.jsp"%><!-- banner -->

<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- 轮播（Carousel）指标 -->
    <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
        <li data-target="#myCarousel" data-slide-to="3"></li>
    </ol>
    <!-- 轮播（Carousel）项目 -->
    <div class="carousel-inner">
        <div class="item active">
            <img src="<%=path %>/static/images/xdp/safty.jpg" style="height: 340px;width: 100%"  alt="First slide">
        </div>
    </div>
    <!-- 轮播（Carousel）导航 -->
    <a class="carousel-control left" href="#myCarousel"
       data-slide="prev">&lsaquo;</a>
    <a class="carousel-control right" href="#myCarousel"
       data-slide="next">&rsaquo;</a>
</div>

<div class="safety">
    <div class="item-one">
        <div class="item-title">
            <p>01 项目保障</p>
        </div>
        <div class="item-content">
            <p class="title">所有普金资本上线项目，必须经过五级过滤！</p>
            <img class="img" src="<%=path %>/static/images/xdp/item1.png">
        </div>
    </div>
    <div class="item-two">
        <div class="wrap">
            <div class="item-title">
                <p class="title">02 项目保障</p>
            </div>
            <div class="item-content">
                <p class="text">供应链金融：基于城投集团供应链上下游的采购贸易，为采购方或项目方提供融资，融资方以应收账款质押、保证金担保、第三方机构担保等形式为借款提供担保</p>
                <div class="center">
                    <div class="part1">
                        <div class="left"></div>
                        <div class="right">
                            <p class="top">国资</p>
                            <p class="bottom">作为一家国资参股互联网金融平台，依托城投集团在本土的优势地位及多年的行业沉淀，通过业务及第三方的市场信息交互对接，对借款项目方的信息流、资金流、现金流拥有更全面的掌握，能够建立包含多个关键指标的风险预警机制，从而具备提高风控效果的实质价值。</p>
                        </div>
                    </div>
                    <div class="part2">
                        <div class="left"></div>
                        <div class="right">
                            <p class="top">金融</p>
                            <p class="bottom">借助赣州盛汇资产管理公司产业投资、资产收处风控体系，以严谨专业的风控模型，通过严密的审核流程和严格的审核标准，对借款项目进行层层把关。</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="item-three">
        <div class="item-title">
            <p>03 风控流程</p>
        </div>
        <div class="item-content">
            <img class="img" src="<%=path %>/static/images/xdp/item3.png">
        </div>
    </div>
    <div class="item-four">
        <div class="wrap">
            <div class="item-title">
                <p class="title">04 资金保障</p>
            </div>
            <div class="item-content">
                <p class="text">普金资本作为金融信息服务平台，绝不触碰投资人的资金！</p>
                <div class="center">
                    <div class="part1">
                        <div class="left"></div>
                        <div class="right">
                            <p class="top">汇付天下（第三方支付托管）</p>
                            <p class="bottom">普金资本作为纯中介性质的互联网金融平台，绝不触碰投资人的资金。为了保证投资资金与平台完全隔离，普金资本与汇付天下合作，实现合规化资金托管，确保您的资金来去清晰、来去自由。</p>
                        </div>
                    </div>
                    <div class="part2">
                        <div class="left"></div>
                        <div class="right">
                            <p class="top">身份认证体系</p>
                            <p class="bottom">普金资本建立手机认证、实名认证、银行卡认证等全方位认证体系，资金只能转出到本人实名认证及绑定的银行账户。</p>
                        </div>
                    </div>
                    <div class="part3">
                        <div class="left"></div>
                        <div class="right">
                            <p class="top">资金账户查询</p>
                            <p class="bottom">投资人可实时查看资金账户的详情。</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="item-five">
        <div class="item-title">
            <p>05 技术保障</p>
        </div>
        <div class="item-content">
            <div class="part1">
                <div class="left"></div>
                <div class="right">
                    <p class="top">网络安全</p>
                    <p class="bottom">投资人可实时查看资金账户的详情。</p>
                </div>
            </div>
            <div class="part2">
                <div class="left"></div>
                <div class="right">
                    <p class="top">数据安全</p>
                    <p class="bottom">使用阿里云服务，实时同步系统在云端的容灾备份点，每份数据具有多个副本，对于SQL注入攻击采用了严格的防范措施，确保用户信息的安全性和完整性。</p>
                </div>
            </div>
            <div class="part3">
                <div class="left"></div>
                <div class="right">
                    <p class="top">加密验证</p>
                    <p class="bottom">数据库采用多重备份及恢复机制，提供专业的数据优化。防止数据被恶意修改，系统自动验证备份数据的可用性、完整性，确保系统历史数据的永久保存和绝对安全。</p>
                </div>
            </div>
            <div class="part4">
                <div class="left"></div>
                <div class="right">
                    <p class="top">内控管理</p>
                    <p class="bottom">已有完善的内部管理机制和加密系统，从而确保工作人员不能在任何场合和任何时间下擅自披露、修改、删除系统的相关数据。严格遵守国家相关的法律法规，对用户的隐私信息进行保护。未经用户的同意，我们不会向任何第三方公司、组织和个人披露用户的个人信息、账户信息以及交易信息（法律法规另有规定除外）。</p>
                </div>
            </div>
        </div>
    </div>
    <div class="item-six">
        <div class="wrap">
            <div class="item-title">
                <p class="title">06 法律保障</p>
            </div>
            <div class="item-content">
                <p class="text">普金资本是依法设立的网络借贷中介平台，为借贷双方提供信息撮合服务，属民间借贷范畴，受合同法、民法通则等法律法规及最高人民法院相关司法解释规范。</p>
                <div class="center">
                    <div class="part1">
                        <div class="left"></div>
                        <div class="right">
                            <p class="top">相关法律法规</p>
                            <p class="bottom">· 关于网络借贷合法性<br>· 关于投资人及借款人双方民间借贷的合法性<br>· 关于普金资本提供撮合服务的合法性<br>· 关于电子合同的有效性<br>· 普金资本法律顾问</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>


<!--右侧悬浮-->
<div class="mod-sidebar">
    <ul>
        <li><a target="_blank" href="tencent://message/?uin=1332666988&amp;Site=&amp;Menu=yes" class="sidebar-qq"></a></li>
        <li><a href="javascript:;" class="sidebar-wx"></a></li>
        <li><a href="http://pujinziben.com/calculator.html" class="sidebar-cl"></a></li>
        <li><a href="javascript:;" class="wenquan" title="填写即送5元代金券"></a></li>
        <li><a href="javascript:;" class="sidebar-top"></a></li>
    </ul>
</div>



<!--版权-->
<div class="index-concat">
    <div class="wrap cl">
        <div class="index-concat-left">
            <img src="<%=path %>/static/images/xdp/index_erweima.png" alt="扫码关注普金资本">
        </div>
        <div class="index-concat-phone">
            <p>财富热线</p>
            <h3>400-606-2079</h3>
        </div>
        <div class="index-concat-channel">
            <p class="about_cel_text">
                <a target="_blank" href="http://weibo.com/pujinziben" class="about_wb"></a>
                <a href="javascript:void(0);" class="about_wx line_02">
						<span class="line_l_h">
							<span class="line_l_sj"></span>
							<span class="line_l_text">关注普金资本公众号</span>
							<span class="line_l_pic"></span>
						</span>
                </a>
                <a target="_blank" href="tencent://message/?uin=2311960484&amp;Site=&amp;Menu=yes" class="about_qq"></a>
                <a href="javascript:void(0);" class="about_wx about_rr">
						<span class="line_l_j">
							<span class="line_l_sj"></span>
							<span class="line_l_texts">400-606-2079</span>
						</span>
                </a>
            </p>
            <p class="about_cel_no">admin@pujinziben.com</p>
        </div>
            <div class="index-concat-link cl">
                <a href="javascript:;" class="title">友情链接</a>
                <a target="_blank" href="http://www.p2peye.com/">网贷天眼</a>
                <a target="_blank" href="http://www.wdtianxia.com/">网贷天下</a>
                <a target="_blank" href="http://bank.pingan.com/">中国平安银行</a>
                <a target="_blank" href="http://www.ccb.com/cn/home/indexv3.html">中国建设银行</a>
                <a target="_blank" href="http://www.wangdaidongfang.com/">网贷东方</a>
                <a target="_blank" href="http://www.p2p001.com/">第一网贷</a>
            </div>
        </div>
    </div>
</div>
<div class="footer">
    <div class="wrap">
        <p class="text">
            版权所有 © 普金资本运营（赣州）有限公司 All rights reserved <br>
            备案确认书：<a href="http://www.miitbeian.gov.cn/publish/query/indexFirst.action" target="_blank" class="beian">赣ICP备16004010号</a>
            <a href="http://new.cnzz.com/v1/login.php?siteid=1260871948" target="_blank">
                <img src="<%=path %>/static/images/xdp/CNZZ.png" alt="">
            </a>&nbsp;&nbsp;&nbsp;&nbsp;<a target="_blank"
            href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=36070202000195"
            style="display:inline-block;text-decoration:none;height:20px;line-height:20px;" class="beian">
            <img src="<%=path %>/static/images/xdp/beian.png" style="float:left;">赣公网安备 36070202000195号</a>
        </p>
        <div class="footer-list" style="width:650px;text-align:center">
            <a id="___szfw_logo___" href="https://credit.szfw.org/CX05252017016185201512.html" target="_blank">
                <img src="<%=path %>/static/images/xdp/foot2.png" border="0"></a>
            <a href="https://www.yunaq.com/analytics/login/?site=pujinziben.com" target="_blank">
                <img src="<%=path %>/static/images/xdp/ft_link_02.png" alt=""></a>
            <a href="http://si.trustutn.org/info?sn=685170725000594426611&amp;certType=4" target="_blank">
                <img width="110px" height="40px" src="<%=path %>/static/images/xdp/p2p_bottom_large_img.jpg" alt=""></a>
            <a href="https://v.pinpaibao.com.cn/authenticate/cert/?site=www.pujinziben.com&amp;at=business" target="_blank">
                <img src="<%=path %>/static/images/xdp/ft_link_04.png" alt=""></a>
            <a target="_blank" href="http://ec.eqixin.com/?sn=QX3712005910061483682343">
                <img width="112px" height="34px" src="<%=path %>/static/images/xdp/foot1.png"></a>
        </div>
    </div>
</div>
<div class="popup wechart-box">
    <p class="title left">关注普金资本微信公众号</p>
    <a href="javascript:void(0);" class="close icon icon-close"></a>
    <div class="popup-from">
        <img class="wechart" src="<%=path %>/static/images/xdp/wechart.jpg">
    </div>
</div>

<script type="text/javascript" src="<%=path %>/static/js/index/jquery.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/index/public.js"></script>
<script type="text/javascript">
    $(function(){
        utils.initPage();
    })
</script>

</body>
</html>
