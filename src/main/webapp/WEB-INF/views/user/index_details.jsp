<%--
  Created by IntelliJ IDEA.
  User: xdp
  Date: 2017/12/27
  Time: 14:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%String path = request.getContextPath();%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests">
    <title>普金资本</title>
    <%@include file="../common/manage/index_head.jsp" %>
    <link rel="stylesheet" href="<%=path %>/static/js/index/public.css">
    <link rel="stylesheet" href="<%=path %>/static/js/index/about.css">
</head>
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
                <li><a href="#">我的账户</a></li>
                <li><a href="#">信息披露 </a></li>
                <li><a href="#">安全保障</a></li>
                <li>
                    <a href="#">投资理财</a>
                    <div class="sub-nav">
                        <a href="#">恒金保</a>
                        <a href="#">普金保</a>
                        <a href="#">多金宝</a>
                        <a href="#">新手标</a>
                        <a href="#">债权转让</a>
                        <p class="left"></p>
                        <p class="right"></p>
                    </div>
                </li>
                <li><a href="#">首页</a></li>
            </ul>
        </div>
    </div>
</div>



<div class="about cl">
    <div class="about-left">
        <div class="about-left-nav">
            <div id="animateDiv" class="animateDiv">
                <ul id="animateUl" class="sub-nav">
                    <li class="xxpl"><a href="javaScript:void(0);" onclick="animate1()" class="icon-about about-xxpl">信息披露</a></li>
                </ul>
            </div>
            <ul class="sub-nav">
                <li><div class="hr"></div></li>
                <li id="gd"><a href="javascript:void(0);" class="icon-about about-gudong">股东背景</a></li>
                <li><a href="javascript:void(0);" class="icon-about about-jianjie">公司简介</a></li>
                <li><a href="javascript:void(0);" class="icon-about about-zizhi">平台资质</a></li>
                <li><a href="#javascript:void(0);" class="icon-about about-guanli">管理团队</a></li>
                <li><a href="javascript:void(0);" class="icon-about about-guwen">顾问团队</a></li>
                <li><a href="javascript:void(0);" class="icon-about about-dongtai">公司动态</a></li>
                <li class="active"><a href="javascript:void(0);" class="icon-about about-gonggao">平台公告</a></li>
                <li><a href="javascript:void(0);" class="icon-about about-zhaopin">招贤纳士</a></li>
                <li><a href="javascript:void(0);" class="icon-about about-lianxi">联系我们</a></li>
            </ul>
        </div>
    </div>
    <!-- begin -->
    <div class="about-right">
        <div class="about-right-nav">
            <div class="sub-a-nav">
                <a href="javascript:void(0);" class="active" id="">平台公告</a>
            </div>
            <em class="em-line"></em>
        </div>
    </div>
</div>

    <script type="text/javascript" src="<%=path %>/static/js/index/jquery.js"></script>
    <script type="text/javascript" src="<%=path %>/static/js/index/public.js"></script>
    <!-- 客服QQ -->
    <script charset="utf-8" type="text/javascript" src="<%=path %>/static/js/index/wpa.php"></script>
    <script type="text/javascript" src="<%=path %>/static/js/index/countUp.min.js.下载"></script>
    <script type="text/javascript" src="<%=path %>/static/js/index/about.js"></script>
</body>
</html>
