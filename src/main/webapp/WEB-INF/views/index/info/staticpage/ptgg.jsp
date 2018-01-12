<%--
  Created by IntelliJ IDEA.
  User: xdp
  Date: 2018/1/11
  Time: 9:06
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
<script src="<%=path%>/static/js/angular/angular.min.js"></script>
<body  ng-app="myApp" ng-controller="myCtrl">
<div class="about-right-nav">
    <div class="sub-a-nav">
        <a href="javascript:void(0);" class="active" id="">平台公告</a>
    </div>
    <em class="em-line"></em>
</div>
<div class="about-content">
    <div id="ptgg">
        <ul class="notice-list listData">
            <li class="interval">
                <div class="children0">
                    <a href="<%=path %>/index/notice_info/{{notice[0].nid}}" target="_blank" class="title">
                        {{notice[0].content}}</a><span class="time">{{notice[0].date}}</span></div>
            </li>
            <li>
                <div class="children0">
                    <a href="<%=path %>/index/notice_info/{{notice[1].nid}}" target="_blank" class="title">
                        {{notice[1].content}}</a><span class="time">{{notice[1].date}}</span>
                </div>
            </li>
            <li class="interval">
                <div class="children0">
                    <a href="<%=path %>/index/notice_info/{{notice[2].nid}}" target="_blank" class="title">
                        {{notice[2].content}}</a><span class="time">{{notice[2].date}}</span>
                </div>
            </li>
            <li>
                <div class="children0">
                    <a href="<%=path %>/index/notice_info/{{notice[3].nid}}" target="_blank" class="title">
                        {{notice[3].content}}</a><span class="time">{{notice[3].date}}</span>
                </div>
            </li>
            <li class="interval">
                <div class="children0">
                    <a href="<%=path %>/index/notice_info/{{notice[4].nid}}" target="_blank" class="title">
                         {{notice[4].content}}</a><span class="time">{{notice[4].date}}</span>
                </div>
            </li>
            <li>
                <div class="children0">
                    <a href="<%=path %>/index/notice_info/{{notice[5].nid}}" target="_blank" class="title">
                        {{notice[5].content}}</a><span class="time">{{notice[5].date}}</span>
                </div>
            </li>
            <li class="interval">
                <div class="children0">
                    <a href="<%=path %>/index/notice_info/{{notice[6].nid}}" target="_blank" class="title">
                        {{notice[6].content}}</a><span class="time">{{notice[6].date}}</span>
                </div>
            </li>
            <li>
                <div class="children0">
                    <a href="<%=path %>/index/notice_info/{{notice[7].nid}}" target="_blank" class="title">
                        {{notice[7].content}}</a><span class="time">{{notice[7].date}}</span>
                </div>
            </li>
            <li class="interval">
                <div class="children0">
                    <a href="<%=path %>/index/notice_info/{{notice[8].nid}}" target="_blank" class="title">
                        {{notice[8].content}}</a><span class="time">{{notice[8].date}}</span>
                </div>
            </li>
            <li>
                <div class="children0">
                    <a href="<%=path %>/index/notice_info/{{notice[9].nid}}" target="_blank" class="title">
                        {{notice[9].content}}</a><span class="time">{{notice[9].date}}</span>
                </div>
            </li>
        </ul>
        <ul class="paging" style="width: 500px; margin: 30px auto 0px;">
            <li>
                <button type="button" class="pre">上一页</button>
            </li>
            <li class="active">
                <button type="button" data-num="1">1</button>
            </li>
            <li>
                <button type="button" data-num="2">2</button>
            </li>
            <li>
                <button type="button" data-num="3">3</button>
            </li>
            <li>
                <button type="button" data-num="4">4</button>
            </li>
            <li>
                <button type="button" data-num="5">5</button>
            </li>
            <li>
                <button type="button" data-num="6">6</button>
            </li>
            <li><span>...</span></li>
            <li>
                <button type="button" data-num="17">17</button>
            </li>
            <li>
                <button type="button" class="next">下一页</button>
            </li>
        </ul>
    </div>
</div>

<script type="text/javascript">
    (function ($) {
        var app = angular.module('myApp', []);
        app.config(function ($httpProvider) {

            $httpProvider.defaults.transformRequest = function (obj) {
                var str = [];
                for (var p in obj) {
                    str.push(encodeURIComponent(p) + "=" +  encodeURIComponent(obj[p]));
                }
                return str.join("&");
            };

            $httpProvider.defaults.headers.post = {
                'Content-Type': 'application/x-www-form-urlencoded'
            }

        });
        app.controller('myCtrl', function ($scope, $http) {
            //
            $http({
                method: 'POST',
                url: "/notice/pager_all_criteria"
            }).then(function successCallback(response) {
                $scope.notice = response.data;
                alert("1221");
            }, function errorCallback(response) {
            });
        });
    }(jQuery));
</script>

</body>
</html>