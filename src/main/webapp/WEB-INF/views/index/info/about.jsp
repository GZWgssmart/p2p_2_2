<%--
  Created by IntelliJ IDEA.
  User: 123456
  Date: 2018/1/8
  Time: 10:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>关于我们-普金资本-为用户提供详尽安全可靠的投资理财信息，网络贷款、融资服务</title>
    <link rel="stylesheet" href="<%=path%>/static/css/index/public.css">
    <link rel="stylesheet" href="<%=path%>/static/css/index/about.css">
    <link rel="icon" href="<%=path%>/static/images/logo_title.jpg">
</head>
<body>
<div class="top" id="top">
</div>
<!-- nav -->
<%@include file="../../user/head.jsp"%>
<div class="about cl">
    <div class="about-left">
        <div class="about-left-nav">
            <div id="animateDiv" class="animateDiv">
                <ul id="animateUl" class="sub-nav">
                    <li class="xxpl" class="active"><a href="javaScript:void(0);" onClick="animate1()" class="icon-about about-xxpl">信息披露</a></li>
                </ul>
            </div>
            <ul class="sub-nav">
                <li><div class="hr"></div></li>
                <li class="gdbj"><a href="javaScript:void(0);" class="icon-about about-gudong" onclick="gdbj();">股东背景</a></li>
                <li class="gsjj"><a href="javaScript:void(0);" class="icon-about about-jianjie">公司简介</a></li>
                <li class="ptzz"><a href="javaScript:void(0);" class="icon-about about-zizhi">平台资质</a></li>
                <li class="gwtd"><a href="javaScript:void(0);" class="icon-about about-guwen">顾问团队</a></li>
                <li class="gsdt"><a href="javaScript:void(0);" class="icon-about about-dongtai">公司动态</a></li>
                <li class="ptgg"><a href="javaScript:void(0);" class="icon-about about-gonggao">平台公告</a></li>
                <li class="zxns"><a href="javaScript:void(0);" class="icon-about about-zhaopin">招贤纳士</a></li>
                <li class="lswm"><a href="javaScript:void(0);" class="icon-about about-lianxi">联系我们</a></li>
            </ul>
        </div>
    </div>
    <!-- begin -->
    <div class="about-right">

    </div>
    <!-- end -->
</div>
<div id="ajaxFooter"></div>
<script type="text/javascript" src="<%=path%>/static/js/jquery.min.js"></script><%--
<script type="text/javascript" src="<%=path%>/static/js/index/public.js"></script>--%>

<script>

   /* function ptyy() {
        //平台运营
        $(".about-right").load("/user/ydate");
    }*/


    function gdbj() {
        //股东背景
        $(".about-right").load("/index/gdbj");
    }

    var isClick = false;
    function animate1() {
        isClick = !isClick;
        if (isClick) {
            $("#animateDiv").animate({height:"175px"},500);
            $("#animateUl").empty();
            $("#animateUl").html(
                '<li class="xxpl"><a href="javaScript:void(0);" onClick="animate1()" class="icon-about about-xxpl">信息披露</a></li>'
                +'<li class="cyjg"><a href="#cyjg" class="icon-about about-cyjg">从业机构信息</a></li>'
                +'<li class="ptyy"><a href="javaScript:void(0)" onclick="ptyy();" class="icon-about about-ptyy">平台运营信息</a></li>'
                +'<li class="jkxm"><a href="#jkxm" class="icon-about about-jkxm">借款项目信息</a></li>');
            $('.cyjg').show();
            $('.ptyy').show();
            $('.jkxm').show();
        }
        else {
            $("#animateDiv").animate({height:"45px"},500);
            setTimeout(function() {
                $('.cyjg').hide();
                $('.ptyy').hide();
                $('.jkxm').hide();
            },500)
            location.hash='gdbj';
        }
    }


</script>
</body>
</html>
