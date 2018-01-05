<%--
  Created by IntelliJ IDEA.
  User: mh
  Date: 2017/10/18
  Time: 22:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>投资奖励</title>
    <%@include file="../../common/css/css_bootstrap.jsp" %>
    <%@include file="../../common/css/css_bootstrap-table.jsp" %>
    <%@include file="../../common/css/css_sweetalert.jsp" %>
</head>
<body>

<div class="tool-bar" id="tool-bar">
    <button class="btn btn-primary" data-toggle="modal"
            data-target="#saveRewardSettingModal" onclick="showForm();">添加奖励</button>
    <button class="btn btn-default" data-toggle="modal"
            onclick="pagerHuserRewardSetting.updateRewardSetting();">修改奖励</button>
</div>
<table id="rewardSetting-list" class="table table-hover"
       data-url="<%=path%>/rewardSetting/pager_criteria">
    <thead>
    <tr>
        <th data-checkbox="true"></th>
        <th data-field="minmoney">最小金额</th>
        <th data-field="maxmoney">最大金额</th>
        <th data-field="percent">奖励百分比</th>
    </tr>
    </thead>
</table>

<%@include file="include_save_rewardSetting.jsp"%>

<%@include file="../../common/js/js_jquery.jsp" %>
<%@include file="../../common/js/js_boostrap.jsp" %>
<%@include file="../../common/js/js_boostrap_table.jsp" %>
<%@include file="../../common/js/js_sweetalert.jsp" %>
<%@include file="../../common/js/js_form.jsp" %>
<%@include file="../../common/js/js_data_dict.jsp" %>
<script src="<%=path%>/static/js/our/huser/xdp/pager_huser_rewardSetting.js"></script>
<script>
    $(function () {
        setTable.setBootstrapTable('rewardSetting-list');
        jQuery.validator.addMethod('checkMoney', function (value, element) {
            return this.optional(element) || ($('#minmoney').val() < $('#maxmoney').val());
        }, '最小金额必须小于最大金额');
    });
</script>

</body>
</html>
