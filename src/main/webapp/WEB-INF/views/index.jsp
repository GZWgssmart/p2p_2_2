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
    <%@include file="./common/manage/index_head.jsp" %>
    <link rel="stylesheet" href="<%=path %>/static/css/index/public.css">
    <link rel="stylesheet" href="<%=path %>/static/css/index/index.css">
</head>
<%--<link rel="icon" href="resources/front/v01/src/images/logo_title.jpg" type="image/x-icon" />--%>
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
<div class="nav">
    <div class="wrap cl">
        <div class="logo"><img src="<%=path %>/static/picture/logo.png" alt="普金资本"></div>
        <div class="nav-bar">
            <ul>
                <li><a href="javaScript:void(0);" id="myHome">我的账户</a></li>
                <li><a href="<%=path %>/huser/">信息披露 </a></li>
                <li><a href="<%=path %>/index/security">安全保障</a></li>
                <li>
                    <a href="investlist.html">投资理财</a>
                    <div class="sub-nav">
                        <a href="investlist.html#006">恒金保</a>
                        <a href="investlist.html#004">普金保</a>
                        <a href="investlist.html#003">多金宝</a>
                        <a href="investlist.html#005">新手标</a>
                        <a href="creditorlist.html">债权转让</a>
                        <p class="left"></p>
                        <p class="right"></p>
                    </div>
                </li>
                <li><a href="https://www.pujinziben.com/">首页</a></li>
            </ul>
        </div>
    </div>
</div>
<!-- banner -->

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
            <img src="<%=path %>/static/picture/banner_010.jpg" style="height: 340px;width: 100%"  alt="First slide">
        </div>
        <div class="item">
            <img src="<%=path %>/static/picture/banner_009.jpg" style="height: 340px;width: 100%" alt="Second slide">
        </div>
        <div class="item">
            <img src="<%=path %>/static/picture/banner_001.jpg" style="height: 340px;width: 100%" alt="Third slide">
        </div>
        <div class="item">
            <img src="<%=path %>/static/picture/banner_002.jpg" style="height: 340px;width: 100%" alt="Four slide">
        </div>
    </div>
    <!-- 轮播（Carousel）导航 -->
    <a class="carousel-control left" href="#myCarousel"
       data-slide="prev">&lsaquo;</a>
    <a class="carousel-control right" href="#myCarousel"
       data-slide="next">&rsaquo;</a>
</div>

<!-- news -->
<div class="news">
    <div class="wrap">
        <div class="news-list icon icon-news">
            <ul id="news-list">
            </ul>
        </div>
        <div class="bang-list">
            <a href="board.html" target="_blank" class="icon icon-bang">投资、推荐排行榜</a>
        </div>
    </div>
</div>
<!-- statis -->
<div class="statis">
    <div class="wrap">
        <div class="statis-main">
            <ul class="statis-top cl">
                <li class="first"><p>普金资本高收益网络借贷信息中介平台</p></li>
                <li class="center"><p>累计投资金额：<span id="investAmount"></span><span class="small">元</span></p></li>
                <!--<li class="center"><p>累计赚取收益：<span id="hasInterest">0</span><span class="small">元</span></p></li>-->
                <li class="last"><p>累计注册投资人：<span id="userTotal"></span><span class="small">人</span></p></li>
            </ul>
            <div class="explian cl">
                <a href="about.html" class="first">
                    <p class="icon icon-ex1"></p>
                    <div class="text">
                        <h3>实力雄厚</h3>
                        <p>国资背景，抱柱之信</p>
                        <p>赣州城投旗下参股企业</p>
                    </div>
                </a>
                <a href="safety.html" class="center">
                    <p class="icon icon-ex2"></p>
                    <div class="text">
                        <h3>安全稳健</h3>
                        <p>专注城投供应链金融服务</p>
                        <p>银行级风控措施+大数据</p>
                    </div>
                </a>
                <a href="#" class="last">
                    <p class="icon icon-ex3"></p>
                    <div class="text">
                        <h3>新手福利</h3>
                        <p>新用户投资即获红包</p>
                        <p>推荐用户投资得红包</p>
                    </div>
                </a>
            </div>
        </div>
    </div>
</div>
<!-- product -->
<div class="product wrap">
    <div class="product-n" id="newUser">

        <div class="product-new">
            <div class="title cl"><img alt="" src="<%=path %>/static/picture/product-new-icon2.png"></div>
            <ul class="product-new-main cl">
                <li class="rate cl">
                    <p><span id="ty-rate"></span>%</p>
                    <span>预期年化收益率</span>
                </li>
                <li class="date">
                    <div class="date-item">
                        <div class="line icon icon-progress">
                            <p>募集进度：</p>
                            <p class="progress"><em></em></p>
                            <p class="progress-text"><span id="xs-schedules"></span>%</p>
                        </div>
                        <p class="icon icon-doll">项目金额：<span id="xs-doll"></span></p>
                        <p class="icon icon-time">投资期限：<span id="ty-date"></span></p>
                    </div>
                </li>
                <li>
                    <div class="button">
                        <button type="button" id="ty-btn">立即投资</button>
                    </div>
                </li>
            </ul>
        </div>
    </div>
    <!-- 恒金保 -->
    <div class="product-h" id="pj_hengjin">
        <div class="product-h-l">
            <img src="<%=path %>/static/picture/product_01.png" alt="恒金保">
            <a href="product.html#hengjinb" class="top"></a>
            <a href="investlist.html#006" class="bottom"></a>
        </div>
        <div class="product-h-m">
            <ul class="product-list" id="product-h">
            </ul>
        </div>
    </div>
    <!-- 普金保 -->
    <div class="product-h" id="pj_pujin">
        <div class="product-h-l">
            <img src="<%=path %>/static/picture/product_02.png" alt="多金保">
            <a href="product.html#pujinb" class="top"></a>
            <a href="investlist.html#004" class="bottom"></a>
        </div>
        <div class="product-h-m">
            <ul class="product-list"  id="product-p">
            </ul>
        </div>
    </div>
    <!-- 多金宝 -->
    <div class="product-h" id="pj_duojin">
        <div class="product-h-l">
            <img src="<%=path %>/static/picture/product_03.png" alt="多金宝">
            <a href="product.html#duojinb" class="top"></a>
            <a href="investlist.html#003" class="bottom"></a>
        </div>
        <div class="product-h-m">
            <ul class="product-list"  id="product-d">

            </ul>
        </div>
    </div>
    <!--债权转让 -->
    <div class="product-debt clearfix" id="pj_debt">
        <div class="d-titlt">
            <div class="dName fl">债权转让</div>
            <div class="dBtn fr"><a id="debtBtn"href="javascript:;">我要转让</a></div>
        </div>
        <div class="debt-content clearfix">
            <div class="debt-type fl">
                <p>名称</p>
                <p>预期年化收益率</p>
                <p>剩余还款期数</p>
                <p>债权总价值</p>
                <p>转让价格</p>
                <p><a href="creditorlist.html">查看更多</a></p>
            </div>
            <ul class="debt-ul fl clearfix" id="product-debt">

            </ul>
        </div>
    </div>
</div>
<!-- news -->
<div class="news-main wrap">
    <div class="news-main-left">
        <div class="news-main-top">
            <h3>媒体报道</h3>
            <p class="more icon icon-more"><a href="about.html#gsdt?type=1">更多</a></p>
        </div>
        <div class="news-main-content" id="dynamic">
            <ul class="news-main-list">
            </ul>
        </div>
    </div>
    <div class="news-main-right">
        <div class="news-main-top">
            <h3>最新公告</h3>
            <p class="more icon icon-more"><a href="about.html#ptgg">更多</a></p>
        </div>
        <div class="news-main-content">
            <ul class="news-main-list"  id="newsContent">
            </ul>
        </div>
        <div class="news-main-top ptop">
            <h3>公司动态</h3>
            <p class="more icon icon-more"><a href="about.html#gsdt">更多</a></p>
        </div>
        <div class="news-main-content">
            <ul class="news-main-list"  id="news-part">
            </ul>
        </div>
    </div>
</div>
<div class="index-link">
    <div class="wrap">
        <div class="link-title">
            合作伙伴
        </div>
        <div class="link-list">
            <div class="link-list-box">
                <ul class="cl"  id="linkList">
                </ul>
                <ul class="cl"  id="linkList2">
                </ul>
            </div>
        </div>
    </div>
</div>
<div id="ajaxFooter"></div>


<div class="mod-sidebar">
    <ul>
        <li><a target="_blank" href="tencent://message/?uin=1332666988&amp;Site=&amp;Menu=yes" class="sidebar-qq"></a></li>
        <li><a href="javascript:;" class="sidebar-wx"></a></li>
        <li><a href="http://pujinziben.com/calculator.html" class="sidebar-cl"></a></li>
        <li><a href="javascript:;" class="wenquan" title="填写即送5元代金券"></a></li>
        <li><a href="javascript:;" class="sidebar-top"></a></li>
    </ul>
</div>

<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/index/public.js"></script>
<!-- 客服QQ -->
<%--<script charset="utf-8" type="text/javascript" src="<%=path %>/static/js/index/wpa.js"></script>--%>
<script type="text/javascript" src="<%=path %>/static/js/index/countup.min.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/index/index.js"></script>
<script>
    $("#myHome").click(function () {
        if(${sessionScope.user.uid == null}){
            window.location.href = "/user/login_page";
        }else{
            window.location.href = "/user/home_page";
        }
    });
</script>
</body>
</html>
