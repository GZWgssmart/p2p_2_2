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

<!-- nav -->
<%@include file="../../user/top.jsp" %>
<%@include file="../../user/head.jsp"%>

<div class="about cl">
    <div class="about-left">
        <div class="about-left-nav">
            <div id="animateDiv" class="animateDiv">
                <ul id="animateUl" class="sub-nav">
                    <li class="xxpl" class="active">
                        <a href="javaScript:void(0);" onClick="animate1()"
                           class="icon-about about-xxpl">信息披露</a>
                    </li>
                </ul>
            </div>
            <ul class="sub-nav">
                <!-- about_list -->
                <%@include file="../include/page/include_about_list.jsp"%>
            </ul>
        </div>
    </div>
    <!-- begin -->
    <div class="about-right">

    </div>
</div>

<div id="ajaxFooter"></div>
<%@include file="../../common/js/js_jquery.jsp" %>
<script type="text/javascript" src="<%=path%>/static/js/index/public.js"></script>

<%@include file="../include/js/js_about_load.jsp"%>
<script>

    function gsdt() {
        $(".about-right").load("/index/gsdt");
    }

    function  ptgg() {
        $(".about-right").load("/index/ptgg");
    }

    function ptyy() {
        //平台运营
        $(".about-right").load("/user/ydate");
    }

    function gdbj() {
        //股东背景
        $(".about-right").load("/index/gdbj");
    }

    function gsjj() {
        $(".about-right").load("/index/gsjj");
    }

    function ptzz() {
        $(".about-right").load("/index/ptzz");
    }

    function tdgw() {
        $(".about-right").load("/index/tdgw");
    }

    function zxns() {
        $(".about-right").load("/index/zxns");
    }

    function csjgxx() {
        $(".about-right").load("/index/cyjgxx");
    }

    function jkxmxx() {
        $(".about-right").load("/index/jkxmxx");
    }

    function lxwm() {
        $(".about-right").load("/index/lxwm");
    }

    var isClick = false;
    function animate1() {
        isClick = !isClick;
        if (isClick) {
            $("#animateDiv").animate({height:"175px"},500);
            $("#animateUl").empty();
            $("#animateUl").html(
                '<li class="xxpl"><a href="javaScript:void(0);" onClick="animate1()" class="icon-about about-xxpl">信息披露</a></li>'
                +'<li class="csjg"><a href="javaScript:void(0);" class="icon-about about-cyjg" onclick="csjgxx();">从业机构信息</a></li>'
                +'<li class="ptyy"><a href="javaScript:void(0);" onclick="ptyy();" class="icon-about about-ptyy">平台运营信息</a></li>'
                +'<li class="jkxm"><a href="javaScript:void(0);" class="icon-about about-jkxm" onclick="jkxmxx();">借款项目信息</a></li>');
            $('.csjg').show();
            $('.ptyy').show();
            $('.jkxm').show();
        }
        else {
            $("#animateDiv").animate({height:"45px"},500);
            setTimeout(function() {
                $('.csjg').hide();
                $('.ptyy').hide();
                $('.jkxm').hide();
            },500)
            location.hash='gdbj';
        }
    }

</script>
<jsp:include page="../../common/index/foot.jsp"></jsp:include>
</body>
</html>