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
                    <li class="xxpl" class="active"><a href="javaScript:void(0);" onClick="animate1()" class="icon-about about-xxpl">信息披露</a></li>
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
</body>
</html>