<%--
  Created by IntelliJ IDEA.
  User: ID.LQF
  Date: 2017/12/21
  Time: 15:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>普金资本-安全可靠专注于供应链金融的国资背景P2P理财平台</title>
    <%@include file="./common/manage/index_head.jsp" %>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=path %>/static/css/index/public.css">
    <link rel="stylesheet" href="<%=path %>/static/css/index/index.css">
</head>
<script type="text/javascript">
    function IsPC() {
        var userAgentInfo = navigator.userAgent;
        var Agents = ["Android", "iPhone",
            "SymbianOS", "Windows Phone",
            "iPad", "iPod"];
        var flag = true;
        for (var v = 0; v < Agents.length; v++) {
            if (userAgentInfo.indexOf(Agents[v]) > 0) {
                flag = false;
                break;
            }
        }
        return flag;
    }

    if (IsPC() != true) {
        window.location.href = "front/indexInit.do";
    }
</script>
<body ng-app="myApp" ng-controller="myCtrl">
<!-- top -->
<!--[if lt IE 8]>
<div class="show-danger">您正在使用 <strong>过时的</strong> 浏览器. 是时候 <a href="http://browsehappy.com/">更换一个更好的浏览器</a> 来提升用户体验.
</div>
<!-- nav -->
<%@include file="user/top.jsp" %>
<%@include file="common/index/head_page.jsp" %><!-- banner -->

<%--<div class="container">--%>
<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- 轮播（Carousel）指标 -->
    <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
        <li data-target="#myCarousel" data-slide-to="3"></li>
    </ol>
    <!-- 轮播（Carousel）项目 -->
    <div class="carousel-inner">

        <div class="item active">
            <a href="<%=path %>/{{ homeImgs[0].imghref }}">
                <img src="{{homeImgs[0].imgpath}}" style="height: 340px;width: 100%" alt="First slide">
            </a>
        </div>
        <div class="item">
            <a href="<%=path %>/{{ homeImgs[1].imghref }}">
                <img src="{{homeImgs[1].imgpath}}" style="height: 340px;width: 100%" alt="Second slide">
            </a>
        </div>
        <div class="item">
            <a href="<%=path %>/{{ homeImgs[2].imghref }}">
                <img src="{{homeImgs[2].imgpath}}" style="height: 340px;width: 100%" alt="Third slide">
            </a>
        </div>
        <div class="item">
            <a href="<%=path %>/{{ homeImgs[3].imghref }}">
                <img src="{{homeImgs[3].imgpath}}" style="height: 340px;width: 100%" alt="Four slide">
            </a>
        </div>
    </div>
    <!-- 轮播（Carousel）导航 -->
    <a class="carousel-control left" href="#myCarousel"
       data-slide="prev">&lsaquo;</a>
    <a class="carousel-control right" href="#myCarousel"
       data-slide="next">&rsaquo;</a>
</div>
<%--</div>--%>
<!-- news -->
<div class="news">
    <div class="wrap">
        <div class="bang-list">
            <a href="board.html" target="_blank" class="icon icon-bang">投资、推荐排行榜</a>
        </div>
    </div>
</div>
<!-- statis -->
<div class="statis">
    <div class="wrap">
        <div class="statis-main" style="width: 1200px;">
            <ul class="statis-top cl">
                <li class="first"><p>普金资本高收益网络借贷信息中介平台</p></li>
                <li class="center"><p>累计投资金额：<span id="investAmount">{{money.allMoney | number:2 }}</span><span class="small">元</span></p></li>
                <li class="last"><p>累计注册投资人：<span id="userTotal">{{user.count}}</span><span class="small">人</span></p></li>
            </ul>
            <div class="explian cl">
                <a href="#" class="first">
                    <p class="icon icon-ex1"></p>
                    <div class="text">
                        <h3>实力雄厚</h3>
                        <p>国资背景，抱柱之信</p>
                        <p>赣州城投旗下参股企业</p>
                    </div>
                </a>
                <a href="<%=path %>/index/security" class="center">
                    <p class="icon icon-ex2" style="float: left;"></p>
                    <div class="text" style="width: 155px;">
                        <h3>安全稳健</h3>
                        <p>专注城投供应链金融服务</p>
                        <p>银行级风控措施+大数据</p>
                    </div>
                </a>
                <a href="<%=path %>/" class="last">
                    <p class="icon icon-ex3"></p>
                    <div class="text">
                        <h3>新手福利</h3>
                        <p>新用户投资即获红包</p>
                        <p>推荐用户投资得红包</p>
                    </div>
                </a>
            </div>
        </div>
    </div>
</div>
<!-- product -->
<div class="product wrap">
    <!-- 新手指标 -->
    <div class="product-n" id="newUser" style="height: 210px;">
        <div class="product-new">
            <div class="title cl"><img alt="" src="<%=path %>/static/picture/product-new-icon2.png"></div>
            <ul class="product-new-main cl">
                <li class="rate cl">
                    <p><span id="ty-rate">{{newpeople[0].nprofit}}</span>%</p>
                    <span>预期年化收益率</span>
                </li>
                <li class="date">
                    <div class="date-item">
                        <div class="line icon icon-progress">
                            <p>募集进度：</p>
                            <p class="progress"><em></em></p>
                            <p class="progress-text"><span id="xs-schedules"></span>{{newpeople[0].jdmoney}}</p>
                        </div>
                        <p class="icon" style="background: none; margin-top: -22px;"></p>
                        <p class="icon icon-doll">项目金额：<span id="xs-doll"></span>{{newpeople[0].money | number:2 }}万元</p>
                        <p class="icon" style="background: none; margin-top: -22px;"></p>
                        <p class="icon icon-time">投资期限：<span id="ty-date"></span>{{newpeople[0].term}}个月</p>
                    </div>
                </li>
                <li>
                    <div class="button">
                        <button type="button" id="ty-btn">立即投资</button>
                    </div>
                </li>
            </ul>
        </div>
    </div>
    <!-- 恒金保 -->
    <div class="product-h" id="pj_hengjin">
        <div class="product-h-l">
            <img src="<%=path %>/static/picture/product_01.png" alt="恒金保">
            <a href="<%=path %>/index/product" class="top"></a>
            <a href="investlist.html#006" class="bottom"></a>
        </div>

        <div class="product-h-m">
            <ul class="product-list">
                <li>
                    <div class="product-content">
                        <div class="top">
                            <p class="product-title">
                                <a href="invest.html?id=414">{{hengjinbao[0].cpname}}</a>
                            </p>
                            <p class="p-rate">
                                <span>{{hengjinbao[0].nprofit}}</span>
                                <span class="small">%</span>
                            </p>
                            <span class="p-rate-text">预期年化收益率</span>
                        </div>
                        <div class="bottom">
                            <div class="line icon icon-progress">
                                <p>募集进度：</p>
                                <p class="progress">
                                    <em style="width:{{hengjinbao[0].jdmoney}}"></em>
                                </p>
                                <p class="progress-text">{{hengjinbao[0].jdmoney}}</p>
                            </div>
                            <p class="icon" style="background: none; margin-top: -22px;"></p>
                            <p class="icon icon-doll">项目金额：{{hengjinbao[0].money | number:2 }}万元</p>
                            <p class="icon" style="background: none; margin-top: -22px;"></p>
                            <p class="icon icon-time">投资期限：{{hengjinbao[0].term}}个月</p>
                        </div>
                        <div class="submit">
                            <button type="button" class="submit" onclick="toInvest(414,2)">立即投标</button>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="product-content">
                        <div class="top">
                            <p class="product-title">
                                <a href="invest.html?id=391">{{hengjinbao[1].cpname}}</a>
                            </p>
                            <p class="p-rate">
                                <span>{{hengjinbao[1].nprofit}}</span>
                                <span class="small">%</span>
                            </p>
                            <span class="p-rate-text">预期年化收益率</span>
                        </div>
                        <div class="bottom">
                            <div class="line icon icon-progress">
                                <p>募集进度：</p>
                                <p class="progress">
                                    <em style="width:{{hengjinbao[1].jdmoney}}"></em>
                                </p>
                                <p class="progress-text">{{hengjinbao[1].jdmoney}}</p>
                            </div>
                            <p class="icon" style="background: none; margin-top: -22px;"></p>
                            <p class="icon icon-doll">项目金额：{{hengjinbao[1].money | number:2 }}万元</p>
                            <p class="icon" style="background: none; margin-top: -22px;"></p>
                            <p class="icon icon-time">投资期限：{{hengjinbao[1].term}}个月</p>
                        </div>
                        <div class="submit">
                            <button type="button" class="submit disabled" onclick="toInvest(391,4)">还款中</button>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="product-content">
                        <div class="top">
                            <p class="product-title">
                                <a href="invest.html?id=386">{{hengjinbao[2].cpname}}</a>
                            </p>
                            <p class="p-rate">
                                <span>{{hengjinbao[2].nprofit}}</span>
                                <span class="small">%</span>
                            </p>
                            <span class="p-rate-text">预期年化收益率</span>
                        </div>
                        <div class="bottom">
                            <div class="line icon icon-progress">
                                <p>募集进度：</p>
                                <p class="progress">
                                    <em style="width:{{hengjinbao[2].jdmoney}}"></em>
                                </p>
                                <p class="progress-text">{{hengjinbao[2].jdmoney}}</p>
                            </div>
                            <p class="icon" style="background: none; margin-top: -22px;"></p>
                            <p class="icon icon-doll">项目金额：{{hengjinbao[2].money | number:2 }}万元</p>
                            <p class="icon" style="background: none; margin-top: -22px;"></p>
                            <p class="icon icon-time">投资期限：{{hengjinbao[2].term}}个月</p>
                        </div>
                        <div class="submit">
                            <button type="button" class="submit disabled" onclick="toInvest(386,4)">还款中</button>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </div>

    <!-- 普金保 -->
    <div class="product-h" id="pj_pujin">
        <div class="product-h-l">
            <img src="<%=path %>/static/picture/product_02.png" alt="多金保">
            <a href="<%=path %>/index/product" class="top"></a>
            <a href="investlist.html#004" class="bottom"></a>
        </div>
        <div class="product-h-m">
            <ul class="product-list">
                <li>
                    <div class="product-content">
                        <div class="top">
                            <p class="product-title">
                                <a href="invest.html?id=414">{{pujinbao[0].cpname}}</a>
                            </p>
                            <p class="p-rate">
                                <span>{{pujinbao[0].nprofit}}</span>
                                <span class="small">%</span>
                            </p>
                            <span class="p-rate-text">预期年化收益率</span>
                        </div>
                        <div class="bottom">
                            <div class="line icon icon-progress">
                                <p>募集进度：</p>
                                <p class="progress">
                                    <em style="width:{{pujinbao[0].jdmoney}}"></em>
                                </p>
                                <p class="progress-text">{{pujinbao[0].jdmoney}}</p>
                            </div>
                            <p class="icon" style="background: none; margin-top: -22px;"></p>
                            <p class="icon icon-doll">项目金额：{{pujinbao[0].money | number:2 }}万元</p>
                            <p class="icon" style="background: none; margin-top: -22px;"></p>
                            <p class="icon icon-time">投资期限：{{pujinbao[0].term}}个月</p>
                        </div>
                        <div class="submit">
                            <button type="button" class="submit" onclick="toInvest(414,2)">立即投标</button>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="product-content">
                        <div class="top">
                            <p class="product-title">
                                <a href="invest.html?id=391">{{pujinbao[1].cpname}}</a>
                            </p>
                            <p class="p-rate">
                                <span>{{pujinbao[1].nprofit}}</span>
                                <span class="small">%</span>
                            </p>
                            <span class="p-rate-text">预期年化收益率</span>
                        </div>
                        <div class="bottom">
                            <div class="line icon icon-progress">
                                <p>募集进度：</p>
                                <p class="progress">
                                    <em style="width:{{pujinbao[1].jdmoney}}"></em>
                                </p>
                                <p class="progress-text">{{pujinbao[1].jdmoney}}</p>
                            </div>
                            <p class="icon" style="background: none; margin-top: -22px;"></p>
                            <p class="icon icon-doll">项目金额：{{pujinbao[1].money | number:2 }}万元</p>
                            <p class="icon" style="background: none; margin-top: -22px;"></p>
                            <p class="icon icon-time">投资期限：{{pujinbao[1].term}}个月</p>
                        </div>
                        <div class="submit">
                            <button type="button" class="submit disabled" onclick="toInvest(391,4)">还款中</button>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="product-content">
                        <div class="top">
                            <p class="product-title">
                                <a href="invest.html?id=386">{{pujinbao[2].cpname}}</a>
                            </p>
                            <p class="p-rate">
                                <span>{{pujinbao[2].nprofit}}</span>
                                <span class="small">%</span>
                            </p>
                            <span class="p-rate-text">预期年化收益率</span>
                        </div>
                        <div class="bottom">
                            <div class="line icon icon-progress">
                                <p>募集进度：</p>
                                <p class="progress">
                                    <em style="width:{{pujinbao[2].jdmoney}}"></em>
                                </p>
                                <p class="progress-text">{{pujinbao[2].jdmoney}}</p>
                            </div>
                            <p class="icon" style="background: none; margin-top: -22px;"></p>
                            <p class="icon icon-doll">项目金额：{{pujinbao[2].money | number:2 }}万元</p>
                            <p class="icon" style="background: none; margin-top: -22px;"></p>
                            <p class="icon icon-time">投资期限：{{pujinbao[2].term}}个月</p>
                        </div>
                        <div class="submit">
                            <button type="button" class="submit disabled" onclick="toInvest(386,4)">还款中</button>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </div>
    <!-- 多金宝 -->
    <div class="product-h" id="pj_duojin">
        <div class="product-h-l">
            <img src="<%=path %>/static/picture/product_03.png" alt="多金宝">
            <a href="<%=path %>/index/product" class="top"></a>
            <a href="investlist.html#003" class="bottom"></a>
        </div>
        <div class="product-h-m">
            <ul class="product-list" id="product-h">
                <li>
                    <div class="product-content">
                        <div class="top">
                            <p class="product-title">
                                <a href="invest.html?id=414">{{duojinbao[0].cpname}}</a>
                            </p>
                            <p class="p-rate">
                                <span>{{duojinbao[0].nprofit}}</span>
                                <span class="small">%</span>
                            </p>
                            <span class="p-rate-text">预期年化收益率</span>
                        </div>
                        <div class="bottom">
                            <div class="line icon icon-progress">
                                <p>募集进度：</p>
                                <p class="progress">
                                    <em style="width:{{duojinbao[0].jdmoney}}"></em>
                                </p>
                                <p class="progress-text">{{duojinbao[0].jdmoney}}</p>
                            </div>
                                <p class="icon" style="background: none; margin-top: -22px;"></p>
                                <p class="icon icon-doll">项目金额：{{duojinbao[0].money | number:2 }}万元</p>
                                <p class="icon" style="background: none; margin-top: -22px;"></p>
                                <p class="icon icon-time">投资期限：{{duojinbao[0].term}}个月</p>
                        </div>
                        <div class="submit">
                            <button type="button" class="submit" onclick="toInvest(414,2)">立即投标</button>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="product-content">
                        <div class="top">
                            <p class="product-title">
                                <a href="invest.html?id=391">{{duojinbao[1].cpname}}</a>
                            </p>
                            <p class="p-rate">
                                <span>{{duojinbao[1].nprofit}}</span>
                                <span class="small">%</span>
                            </p>
                            <span class="p-rate-text">预期年化收益率</span>
                        </div>
                        <div class="bottom">
                            <div class="line icon icon-progress">
                                <p>募集进度：</p>
                                <p class="progress">
                                    <em style="width:{{duojinbao[1].jdmoney}}"></em>
                                </p>
                                <p class="progress-text">{{duojinbao[1].jdmoney}}</p>
                            </div>
                            <p class="icon" style="background: none; margin-top: -22px;"></p>
                            <p class="icon icon-doll">项目金额：{{duojinbao[1].money | number:2 }}万元</p>
                            <p class="icon" style="background: none; margin-top: -22px;"></p>
                            <p class="icon icon-time">投资期限：{{duojinbao[1].term}}个月</p>
                        </div>
                        <div class="submit">
                            <button type="button" class="submit disabled" onclick="toInvest(391,4)">还款中</button>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="product-content">
                        <div class="top">
                            <p class="product-title">
                                <a href="invest.html?id=386">{{duojinbao[2].cpname}}</a>
                            </p>
                            <p class="p-rate">
                                <span>{{duojinbao[2].nprofit}}</span>
                                <span class="small">%</span>
                            </p>
                            <span class="p-rate-text">预期年化收益率</span>
                        </div>
                        <div class="bottom">
                            <div class="line icon icon-progress">
                                <p>募集进度：</p>
                                <p class="progress">
                                    <em style="width:{{duojinbao[2].jdmoney}}"></em>
                                </p>
                                <p class="progress-text">{{duojinbao[2].jdmoney}}</p>
                            </div>
                            <p class="icon" style="background: none; margin-top: -22px;"></p>
                            <p class="icon icon-doll">项目金额：{{duojinbao[2].money | number:2 }}万元</p>
                            <p class="icon" style="background: none; margin-top: -22px;"></p>
                            <p class="icon icon-time">投资期限：{{duojinbao[2].term}}个月</p>
                        </div>
                        <div class="submit">
                            <button type="button" class="submit disabled" onclick="toInvest(386,4)">还款中</button>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</div>
<!-- news -->
<div class="news-main wrap">

    <div class="news-main-left" style="display: block;width: 760px;">
        <div class="news-main-top">
            <h3 style="height: 52px;padding-top: 13px;">媒体报道</h3>
            <p class="more icon icon-more"><a href="about.html#gsdt?type=1">更多</a></p>
        </div>
        <div class="news-main-content" id="dynamic">
            <ul class="news-main-list">
                <li ng-repeat="media in medias">
                    <a href="news.html?mid={{media.mid}}" target="_blank" class="news-main-content-left">
                        <img src="{{media.pic}}" alt="{{media.title}}" style="width:210px;height:180px;">
                    </a>
                    <a href="news.html?mid={{media.mid}}" target="_blank" class="list-title">{{media.title}}</a>
                    <a href="news.html?mid={{media.mid}}" target="_blank" class="list-main">
                    </a>
                </li>
            </ul>
        </div>
    </div>
    <div class="news-main-right" style="display: block;width: 430px;">
        <div class="news-main-top">
            <h3 style="height: 52px;padding-top: 13px;">最新公告</h3>
            <p class="more icon icon-more"><a href="about.html#ptgg">更多</a></p>
        </div>
        <div class="news-main-content">
            <ul class="news-main-list" id="newsContent">
                <li ng-repeat="notice in notices">
                    <a href="news.html?nid={{notice.nid}}&amp;flag=1" target="_blank">{{notice.title}}</a>
                    <span>{{notice.date | date:'yyyy-MM-dd'}}</span>
                </li>
            </ul>
        </div>
        <div class="news-main-top ptop" style="height: 71px;">
            <h3 style="height: 52px;padding-top: 13px;">公司动态</h3>
            <p class="more icon icon-more"><a href="about.html#gsdt">更多</a></p>
        </div>
        <div class="news-main-content">
            <ul class="news-main-list" id="news-part">
                <li ng-repeat="dynamic in dynamics">
                    <a href="news.html?dyid={{dynamic.dyid}}" target="_blank">{{dynamic.title}}</a>
                    <span>{{dynamic.date | date:'yyyy-MM-dd'}}</span>
                </li>
            </ul>
        </div>
    </div>
</div>

<!-- 合作伙伴 -->
<div class="index-link">
    <div class="wrap" style="height: 160px;">
        <div class="link-title">
            合作伙伴
        </div>
        <div class="link-list">
            <marquee direction="left" behavior="alternate" loop="-1" height="80" scrollamount="5" hspace="10"  vspace="10" onMouseOut="this.start()" onMouseOver="this.stop()">
            <div class="link-list-box" style="width: 1800px;">
                <ul class="cl">
                    <li ng-repeat="friend in friends">
                        <a target="_blank" href="{{friend.imghref}}" title="{{friend.imgalert}}">
                            <img src="{{friend.imgpath}}" alt="{{friend.imgalert}}" style="width: 260px;height: 58px;">
                        </a>
                    </li>
                </ul>
            </div>
            </marquee>
        </div>
    </div>
</div>

<jsp:include page="common/index/foot.jsp"></jsp:include>

<script src="<%=path%>/static/js/angular/angular.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/index/public.js"></script>
<!-- 客服QQ -->
<script type="text/javascript" src="<%=path %>/static/js/index/countup.min.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/index/index.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/index/jquery.js"></script>
<script type="text/javascript">
    (function ($) {
        var app = angular.module("myApp", []);
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
            //轮播图
            $http({
                method: 'POST',
                url: "/homeImg/list_homeimg"
            }).then(function successCallback(response) {
                $scope.homeImgs = response.data;
            }, function errorCallback(response) {
            });

            //查询出注册总人数
            $http({
                method: 'POST',
                url: "/tzb/get_money"
            }).then(function successCallback(response) {
                $scope.money = response.data;
            }, function errorCallback(response) {
            });

            //查询出注册总人数
            $http({
                method: 'POST',
                url: "/user/count"
            }).then(function successCallback(response) {
                $scope.user = response.data;
            }, function errorCallback(response) {
            });

            //新手专享
            $http({
                method: 'get',
                params:{type:4},
                url: "/borrowapply/list_borrow"
            }).then(function successCallback(response) {
                $scope.newpeople = response.data;
            }, function errorCallback(response) {
            });

            //恒金宝
            $http({
                method: 'get',
                params:{type:3},
                url: "/borrowapply/list_borrow"
            }).then(function successCallback(response) {
                $scope.hengjinbao = response.data;
            }, function errorCallback(response) {
            });

            //普金宝
            $http({
                method: 'get',
                params:{type:2},
                url: "/borrowapply/list_borrow"
            }).then(function successCallback(response) {
                $scope.pujinbao = response.data;
            }, function errorCallback(response) {
            });

            //多金宝
            $http({
                method: 'get',
                params:{type:1},
                url: "/borrowapply/list_borrow"
            }).then(function successCallback(response) {
                $scope.duojinbao = response.data;
            }, function errorCallback(response) {
            });

            //媒体报道
            $http({
                method: 'POST',
                url: "/media/list_media"
            }).then(function successCallback(response) {
                $scope.medias = response.data;
            }, function errorCallback(response) {
            });

            //最新公告
            $http({
                method: 'POST',
                url: "/notice/list_notice"
            }).then(function successCallback(response) {
                $scope.notices = response.data;
            }, function errorCallback(response) {
            });

            //公司动态
            $http({
                method: 'POST',
                url: "/dynamic/list_dynamic"
            }).then(function successCallback(response) {
                $scope.dynamics = response.data;
            }, function errorCallback(response) {
            });

            //合作伙伴
            $http({
                method: 'POST',
                url: "/friend/list_friend"
            }).then(function successCallback(response) {
                $scope.friends = response.data;
            }, function errorCallback(response) {
            });

        });
    }(jQuery));
</script>
</body>
</html>
