<%--
  Created by IntelliJ IDEA.
  User: ID.LQF
  Date: 2018/1/16
  Time: 10:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String mtbdPath = request.getContextPath();
%>
<html>
<head>
    <title>媒体报道</title>
    <link rel="stylesheet" href="<%=mtbdPath %>/static/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=mtbdPath %>/static/css/index/public.css">
    <link rel="stylesheet" href="<%=mtbdPath %>/static/css/index/about.css">
    <link rel="icon" href="<%=mtbdPath %>/static/images/logo_title.jpg">
</head>
<body ng-app="myApp" ng-controller="myCtrl">

<%@include file="../../../user/top.jsp" %>
<%@include file="../../../common/index/head_page.jsp"%>

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
                <a href="<%=mtbdPath %>/index/gsdt" class="" id="gsdt">公司动态</a>
                <a href="javascript:void(0);" class="active" id="xyxw">媒体报道</a>
            </div>
        </div>

        <div class="about-content">
            <div id="ptgg">
                <ul class="news-list listData">
                    <li class="interval" ng-repeat="media in mebdPage">
                        <div class="children0">
                            <img class="news-img" src="<%=mtbdPath %>{{media.pic}}" width="200" height="120">
                            <div class="news-content">
                                <a href="news.html?id=<%=mtbdPath %>" class="news-title">{{media.title}}</a>
                                <p class="news-about">{{media.title}}......</p>
                                <p class="news-time">{{media.date | date:'yyyy-MM-dd hh-mm-ss'}}</p>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>

        <!--分页-->

        <div class="row">
            <div class="col-sm-7">
                <nav aria-label="Page navigation" class="pull-right">
                    <ul class="pagination">
                        <li ng-click="top()"><a>上一页</a></li>
                        <li><a class="page" ng-show="count1>=5 " ng-click="page(count1-4)">{{count1-4}}</a></li>
                        <li><a class="page" ng-show="count1>=4 " ng-click="page(count1-3)">{{count1-3}}</a></li>
                        <li><a class="page" ng-show="count1>=3 " ng-click="page(count1-2)">{{count1-2}}</a></li>
                        <li><a class="page" ng-show="count1>=2 " ng-click="page(count1-1)">{{count1-1}}</a></li>
                        <li class="active"><a class="page" ng-show="count1>0" ng-click="page(count1)" title="{{count1}}">{{count1}}</a>
                        </li>
                        <li><a class="page" ng-show="count1>0 && totalPage-1>= count1"
                               ng-click="page(count1+1)">{{count1+1}}</a></li>
                        <li><a class="page" ng-show="count1>0 && (totalPage-2) >= count1"
                               ng-click="page(count1+2)">{{count1+2}}</a></li>
                        <li><a class="page" ng-show="count1<3 && (totalPage-3) >= count1"
                               ng-click="page(count1+3)">{{count1+3}}</a></li>
                        <li><a class="page" ng-show="count1<2 && (totalPage-4) >= count1"
                               ng-click="page(count1+4)">{{count1+4}}</a></li>
                        <li ng-click="down()"><a>下一页</a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</div>

<jsp:include page="../../../common/index/foot.jsp"></jsp:include>

<script src="<%=mtbdPath %>/static/js/angular/angular.min.js"></script>
<script src="<%=mtbdPath %>/static/js/bootstrap.min.js"></script>
<script src="<%=mtbdPath %>/static/js/jquery.min.js"></script>
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
            $scope.totalPage = 0;
            $scope.pageSize = 10;
            $scope.total = 0;
            $scope.count1 = 1;
            extracted($scope.count1);

            function extracted(x) {
                $http({
                    method: 'post',
                    url: "/media/pager_media",
                    data: {"pageNo": x,"pageSize":10}
            }).then(function successCallback(response) {
                    $scope.mebdPage = response.data.rows;   //查询的所有结果
                    $scope.total = response.data.total;     //总结果数
                    $scope.totalPage = response.data.totalPage;  //总页数
                    $scope.count1 = response.data.pageNo;   //当前页数
                }, function errorCallback(response) {
                });
            }

            //分页算法
            $scope.page = function (x) {//点击页号事件
                if ($scope.count1 == x) {
                    return;
                }
                extracted(x);
            };
            $scope.down = function () {//下一页
                if ($scope.count1 == $scope.totalPage) {
                    return;
                }
                extracted($scope.count1 + 1);
            };
            $scope.top = function () {//上一页
                if ($scope.count1 == 1) {
                    return;
                }
                extracted($scope.count1 - 1);
            };

        });
    }(jQuery));
</script>

</body>
</html>
