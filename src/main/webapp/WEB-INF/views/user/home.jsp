<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>

<html>
<head>
    <title>我的账户—普金资本-安全可靠专注于供应链金融的国资背景P2P理财平台</title>
    <meta name="keywords" content="普金资本，P2P汽车、房产融资，借贷，理财计划，投资理财" />
    <meta name="description" content="普金资本是目前中国P2P投资融资行业中最快速、最安全的网上理财平台，为借贷和民间投资用户提供安全、高效的理财服务。" />
    <link rel="stylesheet" href="<%=path%>/static/css/www/public.css">
    <link rel="stylesheet" href="<%=path%>/static/css/www/account.css">
    <link rel="stylesheet" href="<%=path%>/static/css/www/datepicker.css">
    <link rel="stylesheet" href="<%=path%>/static/css/www/login.css">
</head>
<input type="hidden" id="user" value="${sessionScope.user.uid}">
<div class="top" id="top">
</div>
<!-- nav -->
<div class="nav">
    <div class="wrap cl">
        <div class="logo"><a href="https://www.pujinziben.com/"><img src="<%=path%>/static/images/www/logo.png" alt="普金资本"></a></div>
        <div class="nav-bar">
            <ul>
                <li class="icon icon-acc"><a href="javascript:void(0);">我的账户</a></li>
                <!-- <li><a href="javascript:void(0);">信息披露</a></li> -->
                <li><a href="about.html">信息披露</a></li>
                <!-- <li><a href="javascript:void(0);" onclick="newPointer()">新手指导</a></li> -->
                <li><a href="safety.html">安全保障</a></li>
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
<div class="account cl">
    <div class="account-left">
        <div class="account-left-nav">
            <div class="navbar icon icon-account">我的账户</div>
            <ul class="sub-nav">
                <li class=""><a href="#account">账户总览</a></li>
                <li><a href="#ipay">充值</a></li>
                <li><a href="#cash">提现</a></li>
                <li>
                    <a href="#">
                        <i class="fa fa-home"></i>
                        <span class="nav-label">借款管理</span>
                        <span class="fa arrow"></span>
                    </a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a class="J_menuItem" onclick="checkVip();" data-index="0">所有借款</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="<%=path%>/user/all_borrow_money_page">所有借款（无需VIP）</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="index_v3.html">安全退出</a>
                        </li>
                    </ul>

                <li><a id="myCoupon" href="#taste">我的赠券<i id="couponCount"></i></a></li>

                <li><a href="#fund">资金记录</a></li>
            </ul>
            <div class="navbar icon icon-self">我的管理</div>
            <ul class="sub-nav">
                <li><a href="#invest">投资管理</a></li>
                <li><a href="#claimm">债权管理</a></li>
                <li><a href="#claimb">债权购买</a></li>
                <li><a href="#loan">借款管理</a></li>
            </ul>
            <div class="navbar icon icon-settings">账户设置</div>
            <ul class="sub-nav">
                <li><a href="#bank">我的银行卡</a></li>
                <li><a id="safety" href="javaScript:void(0);">安全设置</a></li>
                <li><a href="#msg">消息中心</a></li>
            </ul>
        </div>
        <a href="#tuijian" class="tuijian"><img src="<%=path%>/static/images/index/tuijian.png"/></a>
    </div>
    <!-- begin -->
    <div class="account-right">

    </div>
    <!-- end -->
</div>
<script type="text/javascript" src="<%=path%>/static/js/jquery.min.js"></script>
<%@include file="../common/manage/index_js.jsp" %>
<%@include file="../common/js/js_sweetalert.jsp" %>
<script src="<%=path%>/static/js/our/user/lmh/home_check_vip.js"></script>
</body>
<script>
    $(function(){
        if($("#user").val() == null || $("#user").val() == ""){
            alert("您未登陆,请登入");
            window.location.href = "/user/login_page";
        }
    });

    $("#safety").click(function () {
        $(".account-right").load("/user/safety");
    });
</script>
</html>