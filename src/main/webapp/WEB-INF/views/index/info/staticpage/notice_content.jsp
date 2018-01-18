<%--
  Created by IntelliJ IDEA.
  User: xdp
  Date: 2018/1/11
  Time: 9:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String path = request.getContextPath();%>
<html>
<head>
    <title>关于我们-普金资本-为用户提供详尽安全可靠的投资理财信息，网络贷款、融资服务</title>
    <link rel="stylesheet" href="<%=path%>/static/css/index/public.css">
    <link rel="stylesheet" href="<%=path%>/static/css/index/about.css">
    <link rel="icon" href="<%=path%>/static/images/logo_title.jpg">
</head>
<!-- nav -->
<body ng-app="myApp" ng-controller="myCtrl">
<%@include file="../../../user/top.jsp" %>
<%@include file="../../../common/index/head_page.jsp"%>
<div class="news cl">
<div class="news-contents" style="display: block;">
    <h3 id="news-title">{{notice.title}}</h3>
    <div class="news-contents-top">
        <div class="weChart">
            <div class="shareMsg">
                <p>打开微信“扫一扫”，点击右上角“发送给朋友”或“分享到朋友圈”</p>
                <p class="weChartTips">（好友通过您分享的链接成功注册，您就成了他的理财师）</p>
            </div>
            <span class="topTag"></span>
        </div>
        <a class="news-back fr" href="<%=path %>/index/ptgg">返回列表</a>
        <p class="news-time fr" id="notice_time">{{notice.date | date:'yyyy-MM-dd HH:mm:ss'}}</p>
    </div>
    <div class="news-contents-bottom" id="content">
        <p class="MsoNormal" align="left" style="color:#333333;">
            <p ng-bind-html="myText">

            </p>
        </p>

        <p class="MsoNormal" align="right" style="color:#333333;text-align:right;">普金资本运营（赣州）有限公司</p>
    </div>
</div>
</div>

<%@include file="../../../common/index/foot_page.jsp"%>

<script src="<%=path%>/static/js/angular/angular.min.js"></script>
<script src="https://cdn.bootcss.com/angular.js/1.5.0-beta.0/angular-sanitize.min.js"></script>
<script src="<%=path%>/static/js/jquery.min.js"></script>
<script type="text/javascript">
    var noticeId = ${requestScope.nid};
    (function ($) {
        var app = angular.module('myApp', ['ngSanitize']);
        app.config(function ($httpProvider) {

            $httpProvider.defaults.transformRequest = function (obj) {
                var str = [];
                for (var p in obj) {
                    str.push(encodeURIComponent(p) + "=" + encodeURIComponent(obj[p]));
                }
                return str.join("&");
            };

            $httpProvider.defaults.headers.post = {
                'Content-Type': 'application/x-www-form-urlencoded'
            }

        });
        app.controller('myCtrl', function ($scope, $http) {
            $http({
                method: 'POST',
                url: "/notice/detail",
                data:{nid:noticeId}
            }).then(function successCallback(response) {
                $scope.notice = response.data;// 数据
                $scope.myText = $scope.notice.content;
            }, function errorCallback(response) {

            });
        });
    }(jQuery));
</script>
</body>
</html>