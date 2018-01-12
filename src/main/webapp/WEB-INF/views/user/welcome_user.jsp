<%--
  Created by IntelliJ IDEA.
  User: mh
  Date: 2017/11/30
  Time: 14:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>Title</title>

    <link rel="stylesheet" href="<%=path %>/static/css/our/huser/xdp/public.css">
    <link rel="stylesheet" href="<%=path %>/static/css/our/huser/xdp/account.css">
    <link rel="stylesheet" href="<%=path %>/static/css/our/huser/xdp/datepicker.css">
    <link rel="stylesheet" href="<%=path %>/static/css/our/huser/xdp/login.css">
    <%--<link rel="icon" href="<%=path%>/static/images/logo_title.jpg">--%>

</head>
<body>
<div class="account-right">
    <%--<div class="account-right-nav">
        <div class="sub-a-nav">
            <a href="javascript:void(0);" class="all-a active">账户总览</a>
            <a href="javascript:void(0);" class="slb-a">生利宝</a>
        </div>
        <em class="em-line"></em>
    </div>--%>
    <div class="account-content" style="display: block;">
        <div class="all-view">
            <div class="center-view">
                <div class="center-header">
                    <img src="<%=path %>/static/css/our/huser/xdp/header.png" width="120" height="120">
                </div>
                <div class="center-self">
                    <p class="name">18870798915</p>
                    <p class="safety">安全等级： <span id="safeLevel">中</span></p>
                    <p class="center-icon">
                        <a href="https://www.pujinziben.com/account.html#safe" class="icon icon-c-phone"></a>
                        <a href="https://www.pujinziben.com/account.html#safe" class="icon icon-c-mail"></a>
                    </p>
                    <p id="registpay"><a href="javascript:;">登录汇付</a></p>
                    <p id="reset"></p>
                </div>
                <div class="center-user">
                    <p class="amt color"><span id="usableSum">0.00</span>元</p>
                    <p class="text"><i></i>可用余额</p>
                    <p class="link">
                        <a href="https://www.pujinziben.com/account.html#ipay" class="active">充值</a>
                        <a href="https://www.pujinziben.com/account.html#cash">提现</a>
                    </p>
                </div>
                <div class="center-profit">
                    <p class="amt"><span id="earnSum">0.00</span>元</p>
                    <p class="text">收益总额</p>
                    <p class="luckynum"><i id="DetailsIcon"></i><a class="luckyLink"
                                                                   href="https://www.pujinziben.com/activity/lucky.html"
                                                                   target="_blank">抽奖次数<b id="luckynum">0</b>次</a></p>
                    <p class="icon icon-quan">代金券 <b id="voucher">0</b> 张，现金券 <b id="cashMap">0</b> 张</p>
                    <div class="luckyDetails">
                        <h1>如何获得抽奖机会</h1>
                        <p>活动期间：单笔投资满1000元，可获得1次抽奖机会，单笔投资满2000元，可获得2次抽奖机会;以此类推(债权转让标除外)。</p>
                    </div>
                </div>
            </div>
            <div class="center-main">
                <div class="canvas">
                    <div id="myChart" style="width:350px;height:350px;" data-highcharts-chart="0">
                        <div class="highcharts-container" id="highcharts-0"
                             style="position: relative; overflow: hidden; width: 350px; height: 350px; text-align: left; line-height: normal; z-index: 0; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);">
                            <svg version="1.1"
                                 style="font-family:&quot;Lucida Grande&quot;, &quot;Lucida Sans Unicode&quot;, Arial, Helvetica, sans-serif;font-size:12px;"
                                 xmlns="http://www.w3.org/2000/svg" width="350" height="350">
                                <desc>Created with Highcharts 4.0.3</desc>
                                <defs>
                                    <clippath id="highcharts-1">
                                        <rect x="0" y="0" width="330" height="325"></rect>
                                    </clippath>
                                </defs>
                                <rect x="0" y="0" width="350" height="350" strokeWidth="0" fill="#FFFFFF"
                                      class=" highcharts-background"></rect>
                                <g class="highcharts-series-group" zIndex="3">
                                    <g class="highcharts-series highcharts-tracker" visibility="visible" zIndex="0.1"
                                       transform="translate(10,10) scale(1 1)" style="cursor:pointer;">
                                        <path fill="#8d7ef2"
                                              d="M 164.96893983643648 10.000003163061535 A 152.5 152.5 0 0 1 164.8164398805463 10.000110473211976 L 164.8542051182372 41.3750877447069 A 121.125 121.125 0 0 0 164.9753300832024 41.375002512300526 Z"
                                              stroke="#FFFFFF" stroke-width="1" stroke-linejoin="round"
                                              transform="translate(0,0)"></path>
                                        <path fill="#f8d280"
                                              d="M 164.96893983643648 10.000003163061535 A 152.5 152.5 0 0 1 164.8164398805463 10.000110473211976 L 164.8542051182372 41.3750877447069 A 121.125 121.125 0 0 0 164.9753300832024 41.375002512300526 Z"
                                              stroke="#FFFFFF" stroke-width="1" stroke-linejoin="round"
                                              transform="translate(0,0)"></path>
                                        <path fill="#6dbfff"
                                              d="M 164.96893983643648 10.000003163061535 A 152.5 152.5 0 0 1 164.8164398805463 10.000110473211976 L 164.8542051182372 41.3750877447069 A 121.125 121.125 0 0 0 164.9753300832024 41.375002512300526 Z"
                                              stroke="#FFFFFF" stroke-width="1" stroke-linejoin="round"
                                              transform="translate(0,0)"></path>
                                        <path fill="#fb9898"
                                              d="M 164.96893983643648 10.000003163061535 A 152.5 152.5 0 0 1 164.8164398805463 10.000110473211976 L 164.8542051182372 41.3750877447069 A 121.125 121.125 0 0 0 164.9753300832024 41.375002512300526 Z"
                                              stroke="#FFFFFF" stroke-width="1" stroke-linejoin="round"
                                              transform="translate(0,0)"></path>
                                        <path fill="#86da70"
                                              d="M 164.96893983643648 10.000003163061535 A 152.5 152.5 0 0 1 164.8164398805463 10.000110473211976 L 164.8542051182372 41.3750877447069 A 121.125 121.125 0 0 0 164.9753300832024 41.375002512300526 Z"
                                              stroke="#FFFFFF" stroke-width="1" stroke-linejoin="round"
                                              transform="translate(0,0)"></path>
                                    </g>
                                    <g class="highcharts-markers" visibility="visible" zIndex="0.1"
                                       transform="translate(10,10) scale(1 1)"></g>
                                </g>
                                <g class="highcharts-legend" zIndex="7">
                                    <g zIndex="1">
                                        <g></g>
                                    </g>
                                </g>
                                <g class="highcharts-tooltip" zIndex="8"
                                   style="cursor:default;padding:0;white-space:nowrap;" transform="translate(0,-9999)">
                                    <path fill="none"
                                          d="M 3 0 L 13 0 C 16 0 16 0 16 3 L 16 13 C 16 16 16 16 13 16 L 3 16 C 0 16 0 16 0 13 L 0 3 C 0 0 0 0 3 0"
                                          isShadow="true" stroke="black" stroke-opacity="0.049999999999999996"
                                          stroke-width="5" transform="translate(1, 1)"></path>
                                    <path fill="none"
                                          d="M 3 0 L 13 0 C 16 0 16 0 16 3 L 16 13 C 16 16 16 16 13 16 L 3 16 C 0 16 0 16 0 13 L 0 3 C 0 0 0 0 3 0"
                                          isShadow="true" stroke="black" stroke-opacity="0.09999999999999999"
                                          stroke-width="3" transform="translate(1, 1)"></path>
                                    <path fill="none"
                                          d="M 3 0 L 13 0 C 16 0 16 0 16 3 L 16 13 C 16 16 16 16 13 16 L 3 16 C 0 16 0 16 0 13 L 0 3 C 0 0 0 0 3 0"
                                          isShadow="true" stroke="black" stroke-opacity="0.15" stroke-width="1"
                                          transform="translate(1, 1)"></path>
                                    <path fill="rgba(249, 249, 249, .85)"
                                          d="M 3 0 L 13 0 C 16 0 16 0 16 3 L 16 13 C 16 16 16 16 13 16 L 3 16 C 0 16 0 16 0 13 L 0 3 C 0 0 0 0 3 0"></path>
                                    <text x="8" zIndex="1" style="font-size:12px;color:#333333;fill:#333333;"
                                          y="21"></text>
                                </g>
                            </svg>
                        </div>
                    </div>
                    <div class="center-total">
                        <p id="allTotal">0.00</p>
                        <p class="text">总资产</p>
                    </div>
                </div>
                <div class="center-data">
                    <p><i class="color color1"></i>投资总额：<span id="investSum">0.00</span></p>

                    <p><i class="color color2"></i>冻结金额：<span id="freezeAmount">0.00</span></p>

                    <p><i class="color color3"></i>待收总额：<span id="forPaySum">0.00</span></p>

                    <p><i class="color color4"></i>奖励金额：<span id="otherEarnAmount">0.00</span></p>
                </div>
            </div>
        </div>
        <div id="huifuHtml"></div>
        <!-- 生利宝管理   -->
        <div class="slb-view" style="display: none;">
            <div class="slb-all">
                <div class="slb-left">
                    <p><span id="slbSum">0.00</span>元</p>
                    <h1>总金额</h1>
                    <a href="javascript:slbaoTrading();">转入/转出</a>
                </div>
                <ul class="slb-right">
                    <li>
                        <h2><span id="annuRate">0.000</span>%</h2>
                        <p>最近7日年化收益率</p>
                    </li>
                    <li>
                        <h2><span id="prdRate">0.000</span>%</h2>
                        <p>最新收益率</p>
                    </li>
                    <li>
                        <h2><span id="totalProfit">0.00</span>元</h2>
                        <p>生利宝历史累计收益</p>
                    </li>

                </ul>
            </div>
            <div class="slb-govern">
                <div class="sub-a-nav">
                    <a href="javascript:void(0);" class="active slb-to" id="to">转入</a>
                    <a href="javascript:void(0);" class="slb-go" id="go">转出</a>
                    <a href="javascript:void(0);" class="slb-sy" id="earn">收益</a>
                    <em class="em-list"></em>
                    <div class="account-form cl">
                        <input type="text" class="date icon icon-date" id="startDate">
                        <p class="text">至</p>
                        <input type="text" class="date icon icon-date" id="endDate">
                        <button type="button" class="search" id="slbSearch">搜索</button>
                    </div>
                </div>
                <div class="govern-list list-a">
                    <ul class="govern-list-box list-box">
                        <li class="title">
                            <div class="children0">日期</div>
                            <div class="children1">金额（元）</div>
                            <div class="children2">生利宝余额（元）</div>
                            <div class="children3">订单号</div>
                            <div class="children4">信息</div>
                        </li>
                    </ul>
                    <ul class="govern-list-box listData">

                    </ul>
                    <ul class="paging" style="width:340px;margin:30px auto 0;">

                    </ul>
                </div>
                <div class="govern-list list-c">
                    <ul class="govern-list-box list-box">
                        <li class="title">
                            <div class="children0">日期</div>
                            <div class="children1">金额（元）</div>
                            <div class="children2">生利宝余额（元）</div>
                            <div class="children3">信息</div>
                        </li>
                    </ul>
                    <ul class="govern-list-box listData">

                    </ul>
                    <ul class="paging">

                    </ul>
                </div>
            </div>
        </div>

    </div>
    <div class="popup regist-box">
        <p class="title left">注册汇付天下</p>
        <a href="javascript:void(0);" class="close icon icon-close"></a>
        <div class="popup-from">
            <button type="button" class="btn" id="person-submit">个人用户注册</button>
            <button type="button" class="btn" id="single-submit">企业用户注册</button>
        </div>
    </div>
</div>
</body>

<script type="text/javascript" src="<%=path %>/static/js/our/xdp/jsp/jquery.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/our/xdp/jsp/chart.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/our/xdp/jsp/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/our/xdp/jsp/public.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/our/xdp/jsp/account.js"></script>
<!-- 客服QQ -->

</html>
