<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: xdp
  Date: 2018/1/11
  Time: 9:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String lxwmPath = request.getContextPath();%>
<html>
<head>
    <title>关于我们-普金资本-为用户提供详尽安全可靠的投资理财信息，网络贷款、融资服务</title>
    <link rel="stylesheet" href="<%=lxwmPath%>/static/css/index/public.css">
    <link rel="stylesheet" href="<%=lxwmPath%>/static/css/index/about.css">
    <link rel="icon" href="<%=lxwmPath%>/static/images/logo_title.jpg">
    <link rel="stylesheet" href="<%=lxwmPath%>/static/css/index/public.css">
    <link rel="stylesheet" href="<%=lxwmPath%>/static/css/index/about.css">
    <link rel="icon" href="<%=lxwmPath%>/static/images/logo_title.jpg">
    <style type="text/css">
        body, html {
            width: 100%;
            height: 100%;
            margin: 0;
            font-family: "微软雅黑";
        }

        #allmap {
            height: 300px;
            width: 100%;
        }
    </style>
    <script type="text/javascript"
            src="http://api.map.baidu.com/api?v=2.0&ak=SMzETm9LifHwplyUPOI9YVl96CiPvY9B"></script>
</head>
<!-- nav -->
<body ng-app="myApp" ng-controller="myCtrl">

<%@include file="../../../user/top.jsp" %>
<%@include file="../../../common/index/head_page.jsp" %>

<div class="about cl">
    <div class="about-left">
        <div class="about-left-nav">
            <div id="animateDiv" class="animateDiv">
                <ul id="animateUl" class="sub-nav">
                    <li class="xxpl" class="active"><a href="javaScript:void(0);"
                    onClick="animate1()" class="icon-about about-xxpl">信息披露</a></li>
                </ul>
            </div>
            <ul class="sub-nav">
                <!-- about_list -->
                <%@include file="../../include/page/include_about_list.jsp" %>
            </ul>
        </div>
    </div>

    <div class="about-right">
            <div class="about-right-nav">
                <div class="sub-a-nav">
                    <a href="javascript:void(0);" class="active" id="">联系我们</a>
                </div>
                <em class="em-line"></em>
            </div>

            <!--联系我们-->
            <div class="about-content">
                <div id="zxns" class="content">
                    <!--百度地图-->
                    <div id="allmap"></div>
                    <!--联系我们-->
                    <div class="content-lxwm">
                        <div>
                            <p class="top">联系方式</p>
                            <div class="bottom">
                                <p class="left one"></p>
                                <p class="b-r">
                                    公司地址：赣州市长征大道1号中航城国际大厦10F<br>
                                    公司电话： 0797-2190888<br>
                                    邮政编码：341000
                                </p>
                            </div>
                        </div>
                        <div class="right">
                            <p class="top">客服服务</p>
                            <div class="bottom">
                                <p class="left two"></p>
                                <p class="b-r">
                                    客服电话： 400-606-2079<br>
                                    客服邮件：fuying.zhang@pujinziben.com<br>
                                    服务时间： 周一至周六08:30-17:30
                                </p>
                            </div>
                        </div>
                        <div>
                            <p class="top">商务合作</p>
                            <div class="bottom">
                                <p class="left three"></p>
                                <p class="b-r" style="padding-top:16px;">
                                    E-mail：yong.wen@pujinziben.com<br>
                                    联系人：温先生
                                </p>
                            </div>
                        </div>
                        <div class="right">
                            <p class="top">关注我们</p>
                            <div class="bottom">
                                <p class="left four"></p>
                                <p class="b-r two"><img src="<%=lxwmPath %>/static/images/xdp/lxwm_erwei.png"></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

    </div>
</div>


    <script src="<%=lxwmPath %>/static/js/jquery.min.js"></script>
    <%@include file="../../include/js/js_about_load.jsp" %>

    <script type="text/javascript">
        // 百度地图API功能
        var map = new BMap.Map("allmap");    // 创建Map实例
        map.centerAndZoom(new BMap.Point(113.54, 24.29), 11);  // 初始化地图,设置中心点坐标和地图级别
        //添加地图类型控件
        map.addControl(new BMap.MapTypeControl({
            mapTypes: [
                BMAP_NORMAL_MAP,
                BMAP_HYBRID_MAP
            ]
        }));
        map.setCurrentCity("赣州");          // 设置地图显示的城市 此项是必须设置的
        map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放
    </script>

<jsp:include page="../../../common/index/foot.jsp"></jsp:include>
</body>
</html>