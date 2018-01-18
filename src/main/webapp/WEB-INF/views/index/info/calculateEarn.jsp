<%--
  Created by IntelliJ IDEA.
  User: qiu
  Date: 2018/1/17
  Time: 14:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path  = request.getContextPath();
%>
<html>
<head>
    <title>理财工具箱-普金资本-安全可靠专注于供应链金融的国资背景P2P理财平台</title>
    <link rel="stylesheet" href="<%=path%>/static/css/index/qrl/public.css">
    <link rel="stylesheet" href="<%=path%>/static/css/index/qrl/index.css">
</head>
<body>

<%--<%@include file="../../common/index/head.jsp"%>--%>
<!-- nav -->
<div class="nav">
    <div class="wrap cl">
        <div class="logo"><a href="https://www.pujinziben.com/"><img src="picture/logo.png" alt="普金资本"></a></div>
        <div class="nav-bar">
            <ul>
                <li class="icon icon-acc"><a href="account.html">我的账户</a></li>
                <!-- <li><a href="javascript:void(0);">信息披露</a></li> -->
                <li><a href="about.html">信息披露</a></li>
                <!-- <li><a href="javascript:void(0);" onclick="newPointer()">新手指导</a></li> -->
                <li><a href="safety.html">安全保障</a></li>
                <li class="active">
                    <a href="investlist.html">投资理财</a>
                    <div class="sub-nav">
                        <a href="investlist.html#006">恒金保</a>
                        <a href="investlist.html#004">普金保</a>
                        <a href="investlist.html#003">多金宝</a>
                        <a href="investlist.html#005">新手标</a>
                        <a href="creditorlist.html">债权转让</a>
                        <p class="left"></p>
                        <p class="right"></p>
                    </div>
                </li>
                <li><a href="https://www.pujinziben.com/">首页</a></li>
            </ul>
        </div>
    </div>
</div>
<div class="calculator">
    <div class="calculator-top">
        <h3>收益计算器</h3>
        <form id="calculForm">
            <ul class="calculator-from">
                <li>
                    <p class="top">投资金额（元）</p>
                    <p class="bottom"><input type="text" maxlength="10" class="input-text" name="money" id="money"/></p>
                </li>
                <li>
                    <p class="top">年化收益率（%）</p>
                    <p class="bottom"><input type="text" maxlength="5" class="input-text" name="nprofit" id="nprofit"/></p>
                </li>


                <li>
                    <p class="top">还款期限<span id="repayTime">（月）</span></p>
                    <p class="bottom"><input type="text" maxlength="2" class="input-text" name="term" id="term"/>&nbsp;
                </li>
                <li>
                    <p class="top">还款方式</p>
                    <p class="bottom">
                        <select class="input-text" name="bzid" id="bzid"/>
                        <option value="1">先息后本</option>
                        <option value="2">等额本金</option>
                        <option value="3">等额本息</option>
                        <option value="12">一次还清</option>
                        </select>
                    </p>
                </li>
                <li>
                    <p class="top"></p>
                    <p class="bottom">
                        <button type="button" class="btn" onclick="initData();">开始计算</button>
                    </p>
                </li>
            </ul>
        </form>
    </div>
    <div class="calculator-bottom">
        <div class="auth">
            <p><span class="big">计算结果</span>（ 还款/收到本息总额：<span class="color" id="allPay"></span>元）</p>
        </div>
        <ul class="list-box" id="qishu1">
            <li class="title">
                <div class="children0" id="qishu">期数</div>
                <div class="children1">月还本息</div>
                <div class="children2">月还本金</div>
                <div class="children3">月还利息</div>
                <div class="children4">本息余额</div>
            </li>
        </ul>
        <ul class="list-box listData" id="qishu2">

        </ul>
    </div>
</div>
<%--<%@include file="../../common/index/foot.jsp"%>--%>

<script type="text/javascript" src="<%=path%>/static/js/index/qrl/jquery.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/index/qrl/public.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/index/qrl/calculator.js"></script>
<script>

</script>
</body>
</html>
