<%--
  Created by IntelliJ IDEA.
  User: ID.LQF
  Date: 2018/1/19
  Time: 11:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>资金流向</title>
    <%@include file="../../common/css/css_bootstrap.jsp" %>
    <%@include file="../../common/css/css_bootstrap-table.jsp" %>
    <%@include file="../../common/css/css_sweetalert.jsp" %>
    <%@include file="../../common/css/css_fileinput.jsp" %>
</head>
<body>
<div class="tool-bar" id="tool-bar">
    <form class="form-horizontal" role="form" id="checkForm" enctype="multipart/form-data">
        <div class="form-group" style="width: auto">
            <label style="margin-left: 30px;">
                <input type="date" id="startTime" name="startTime" class="form-control">
            </label>
            <label>至</label>
            <label>
                <input type="date" id="endTime" name="endTime" class="form-control">
            </label>
            <label>
                <button type="button" class="btn btn-primary" onclick="search();">搜索</button>
            </label>
        </div>
    </form>
</div>
<table id="money-log-list" class="table table-hover"
       data-url="<%=path%>/money_log/pager_criteria">
    <thead>
    <tr>
        <th data-checkbox="true"></th>
        <th data-field="uid">用户id</th>
        <th data-field="type" data-formatter="checkType.formatType">流动类型</th>
        <th data-field="inMoney">收入</th>
        <th data-field="outMoney">支出</th>
        <th data-field="date" data-formatter="setTable.formatDate">创建时间</th>
    </tr>
    </thead>
</table>

<%@include file="../../common/js/js_jquery.jsp" %>
<%@include file="../../common/js/js_boostrap.jsp" %>
<%@include file="../../common/js/js_boostrap_table.jsp" %>
<%@include file="../../common/js/js_select2.jsp" %>
<%@include file="../../common/js/js_sweetalert.jsp" %>
<%@include file="../../common/js/js_form.jsp" %>
<%@include file="../../common/js/js_data_dict.jsp" %>
<%@include file="../../common/js/js_fileinput.jsp" %>
<script src="<%=path%>/static/js/our/huser/lqf/pager_huser_moneylog.js"></script>
<script>
    $(function () {
        setTable.setBootstrapTable('money-log-list');
    });
</script>
</body>
</html>
