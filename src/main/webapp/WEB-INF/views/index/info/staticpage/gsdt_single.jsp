<%--
  Created by IntelliJ IDEA.
  User: ID.LQF
  Date: 2018/1/17
  Time: 10:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>单个公司动态的内容</title>
    <link rel="stylesheet" href="<%=path%>/static/css/index/public.css">
    <link rel="stylesheet" href="<%=path%>/static/css/index/about.css">
    <link rel="icon" href="<%=path%>/static/images/logo_title.jpg">
</head>
<body ng-app="myApp" ng-controller="myCtrl">
<%@include file="../../../user/top.jsp" %>
<%@include file="../../../common/index/head_page.jsp"%>

<div class="news cl">
    <div class="news-contents" style="display: block;">
        <h3 id="news-title">{{dynamci.title}}</h3>

        <div class="news-contents-top">
            <a class="links news-links fl" href="javascript:;" title="原文链接" style="display: none;"></a>
            <a class="links news-share fl bds_more bdsharebuttonbox" href="javascript:;" data-cmd="more"></a>
            <a class="links news-weixin fl" href="javascript:;">分享到微信邀请好友</a>
            <a class="news-back fr" href="<%=path %>/index/gsdt">返回列表</a>
            <p class="news-time fr">{{dynamci.date | date:'yyyy-MM-dd HH:mm:ss'}}</p>
        </div>
        <div class="news-contents-bottom" id="content">
            <p class="MsoNormal" align="left" style="color:#333333;">
                <p ng-bind-html="myText"></p>
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
    var dynamicId = ${requestScope.dyid};
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
                url: "/dynamic/single_dynamic",
                data:{dyid:dynamicId}
            }).then(function successCallback(response) {
                $scope.dynamci = response.data;// 数据
                $scope.myText = $scope.dynamci.content;
            }, function errorCallback(response) {

            });
        });
    }(jQuery));
</script>

</body>
</html>
