<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>提现记录</title>
    <%@include file="../../common/css/css_bootstrap.jsp" %>
    <%@include file="../../common/css/css_bootstrap-table.jsp" %>
    <%@include file="../../common/css/css_sweetalert.jsp" %>
</head>
<body>
<div class="tool-bar" id="tool-bar">
    <form id="txlog-search-form" class="form-inline">
            申请时间
            <input type="date" id="startTime" name="startTime" class="form-control">
            至
            <input type="date" id="endTime" name="endTime" class="form-control">
            <a onclick="txLog.submit.search();" href="javascript:void(0);" class="btn btn-primary">搜索</a>
    </form>
</div>
<table id="txLog-list" class="table table-hover"
       data-single-select="true"
       data-url="<%=path%>/tx_log/pager_criteria">
    <thead>
    <tr>
        <th data-checkbox="true"></th>
        <th data-field="uName">申请人</th>
        <th data-field="hName">审核人</th>
        <th data-field="money">提现金额（元）</th>
        <th data-field="bankcard">提现卡号</th>
        <th data-field="banktype">所属银行</th>
        <th data-field="applyTime" data-formatter="setTable.formatDate">申请时间</th>
        <th data-field="checkTime" data-formatter="setTable.formatDate">审核时间</th>
    </tr>
    </thead>
</table>

<%@include file="../../common/js/js_jquery.jsp" %>
<%@include file="../../common/js/js_boostrap.jsp" %>
<%@include file="../../common/js/js_boostrap_table.jsp" %>
<%@include file="../../common/js/js_sweetalert.jsp" %>
<%@include file="../../common/js/js_data_dict.jsp" %>

<script src="<%=path%>/static/js/our/huser/lmh/tx_log.js"></script>
<script>

    $(function () {
        setTable.setBootstrapTable('txLog-list');
    });
</script>

</body>
</html>
