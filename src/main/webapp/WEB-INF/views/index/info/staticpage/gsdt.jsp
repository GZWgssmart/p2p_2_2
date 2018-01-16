<%--
  Created by IntelliJ IDEA.
  User: xdp
  Date: 2018/1/11
  Time: 9:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String ptggPath = request.getContextPath();%>
<html>
<head>
    <title>关于我们-普金资本-为用户提供详尽安全可靠的投资理财信息，网络贷款、融资服务</title>
    <link rel="stylesheet" href="<%=ptggPath%>/static/css/index/public.css">
    <link rel="stylesheet" href="<%=ptggPath%>/static/css/index/about.css">
    <link rel="icon" href="<%=ptggPath%>/static/images/logo_title.jpg">
</head>
<!-- nav -->
<body ng-app="myApp" ng-controller="myCtrl">

<%@include file="../../../user/head.jsp" %>
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
                <a href="javascript:void(0);" class="active" id="gsdt">公司动态</a>
                <a href="javascript:void(0);" class="" id="xyxw">媒体报道</a>
            </div>
            <em class="em-line" style="left: 0px;"></em>
        </div>

        <div class="about-content">
            <div id="ptgg">
                <ul class="news-list listData">
                    <li class="interval" ng-repeat="dynamic in dynamics">
                        <div class="children0">
                            <!--获取到图片-->
                            <img class="news-img" width="200" height="120"
                                 src="<%=ptggPath %>{{dynamic.pic}}">
                            <div class="news-content">
                                <!--获取到标题-->
                                <a href="<%=ptggPath %>" class="news-title"
                                   width="200" height="120">{{dynamic.title}}
                                </a>
                                <!--获取到时间-->
                                <p class="news-time">
                                    {{dynamic.date | date:'yyyy-MM-dd HH:mm:ss'}}
                                </p>
                            </div>
                        </div>
                    </li>
                </ul>
                <!--分页-->

            </div>
        </div>
    </div>
</div>

<script src="<%=ptggPath%>/static/js/angular/angular.min.js"></script>
<script src="<%=ptggPath%>/static/js/jquery.min.js"></script>
<%@include file="../../include/js/js_about_load.jsp" %>
<script type="text/javascript">
    (function ($) {
        var app = angular.module('myApp', []);
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
            var offset = 1;
            var limit = 10;
            $http({
                method: 'POST',
                url: "/dynamic/pager_criteria",
                data: {offset: offset, limit: limit}
            }).then(function successCallback(response) {
                $scope.dynamics = response.data.rows;// 数据
                $scope.page = response.data.offset;// 偏移量
                $scope.total = response.data.total;// 总页数
            }, function errorCallback(response) {
            });
        });
    }(jQuery));
</script>
<jsp:include page="../../../common/index/foot.jsp"></jsp:include>
</body>
</html>