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
    <link rel="icon" href="<%=path%>/static/images/logo_title.jpg">
</head>
<script src="<%=path%>/static/js/angular/angular.min.js"></script>
<body ng-app="myApp" ng-controller="myCtrl">
<div class="about-right-nav">
    <div class="sub-a-nav">
        <a href="javascript:void(0);" class="active" id="">平台公告</a>
    </div>
    <em class="em-line"></em>
</div>
<div class="about-content">
    <div id="ptgg">
        <ul class="notice-list listData">
            <li class="interval" ng-repeat="notice in notice">
                <div class="children0">
                    <a href="<%=path %>/index/notice_info/{{notice.nid}}" target="_blank" class="title">
                        {{notice.content}}</a><span class="time">{{notice.date | date:'yyyy-MM-dd HH:mm:ss'}}</span></div>
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

<script src="<%=path%>/static/js/jquery.min.js"></script>
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
                url: "/notice/pager_all_criteria",
                data:{offset:offset,limit:limit}
            }).then(function successCallback(response) {
                $scope.notice = response.data.rows;// 数据
                $scope.page = response.data.offset;// 偏移量
                $scope.total = response.data.total;// 总页数
            }, function errorCallback(response) {
            });
        });
    }(jQuery));
</script>

</body>
</html>