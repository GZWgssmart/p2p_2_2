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
<%@include file="../../user/top.jsp"%>
<%@include file="../../common/index/head_page.jsp"%>
<!-- nav -->

<div class="calculator">
    <div class="calculator-top">
        <h3>收益计算器</h3>
        <form id="calculForm">
            <ul class="calculator-from">
                <li>
                    <p class="top">投资金额（元）</p>
                    <p class="bottom">
                        <input type="text" maxlength="10" class="input-text" name="money" id="money"/>
                    </p>
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
                        <option value="4">一次还清</option>
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
            <p><span class="big">计算结果</span>（ 还款/收到总利息：<span class="color" id="abc">0.00</span>元&nbsp;&nbsp; 还款/收到本息总额：<span class="color" id="allPay">0.00</span>元）</p>
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
<input type="hidden" value="${requestScope.claculateMoney.money}" id="money1">
<input type="hidden" value="${requestScope.claculateMoney.nprofit}" id="nprofit1">
<input type="hidden" value="${requestScope.claculateMoney.term}" id="term1">
<input type="hidden" value="${requestScope.claculateMoney.bzid}" id="bzid1">
<%@include file="../../common/index/foot_page.jsp" %>
<%@include file="../../common/js/js_jquery.jsp"%>
<script type="text/javascript" src="<%=path%>/static/js/index/qrl/jquery.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/index/qrl/public.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/index/qrl/calculator.js"></script>
</body>
</html>
