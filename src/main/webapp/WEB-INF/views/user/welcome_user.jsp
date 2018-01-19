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

    <%@include file="../common/css/css_sweetalert.jsp" %>
    <%@include file="../common/css/css_bootstrap.jsp" %>
    <%@include file="../common/css/css_bootstrap-table.jsp" %>
</head>
<body>
<div class="container">
    <div class="panel panel-default">
        <div class="panel-heading text-center">
            <h2>资金总揽</h2>
        </div>
        <div class="panel-body">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>总资产</th>
                    <th>可用余额</th>
                    <th>收益总额</th>
                    <th>投资总额</th>
                    <th>冻结金额</th>
                    <th>待收总额</th>
                    <th>奖励总额</th>
                </tr>
                </thead>
                <tbody>
                    <tr>
                        <td id="zymoney"></td>
                        <td id="kymoney"></td>
                        <td id="symoney"></td>
                        <td id="tzmoney"></td>
                        <td id="djmoney"></td>
                        <td id="dsmoney"></td>
                        <td id="jlmoney"></td>
                    </tr>
                </tbody>
            </table>
            <div class="form-inline">
                <a href="javascript:void(0);" onclick="wecUsr.open.czModal();" class="col-sm-offset-3 btn btn-primary">充值</a>
                <a href="javascript:void(0);" onclick="wecUsr.open.txModal();"  class="col-sm-offset-3 btn btn-success">提现</a>
            </div>
        </div>
    </div>
</div>
<%@include file="welcome/include_cz.jsp"%>
<%@include file="welcome/include_tx.jsp"%>

<%@include file="../common/js/js_jquery.jsp" %>
<%@include file="../common/js/js_sweetalert.jsp" %>
<%@include file="../common/js/js_boostrap.jsp" %>
<%@include file="../common/js/js_boostrap_table.jsp" %>
<script src="<%=path%>/static/js/our/user/lmh/welcome_user.js"></script>
<script>
    $(function () {
        wecUsr.static.userId = ${sessionScope.user.uid};
        wecUsr.getMoneyData(wecUsr.static.userId);//获取资金数据
        wecUsr.getBindData(wecUsr.static.userId);//获取银行卡数据
    })
</script>
</body>
</html>
