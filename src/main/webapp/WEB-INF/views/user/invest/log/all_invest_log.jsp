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
    <title>Title</title>
    <%@include file="../../../common/css/css_bootstrap.jsp" %>
    <%@include file="../../../common/css/css_bootstrap-table.jsp" %>
    <%@include file="../../../common/css/css_sweetalert.jsp" %>
</head>
<body>

<div class="tool-bar" id="tool-bar">
        <a href="javascript:void(0);" class="btn btn-primary" onclick="tzBorrow.look.skbList();">还款列表</a>
</div>
<table id="invest-log-list" class="table table-hover"
       data-single-select="true"
       data-url="<%=path%>/tzb/pager_criteria">
    <thead>
    <tr>
        <th data-checkbox="true"></th>
        <th data-field="cpname" data-formatter="tzLog.fmt.fmtCpname">产品名称</th>
        <th data-field="nprofit">利率(%)</th>
        <th data-field="money">投资金额（元）</th>
        <th data-field="time" data-formatter="setTable.formatDate">投资时间</th>
    </tr>
    </thead>
</table>

<%@include file="../../../common/js/js_jquery.jsp" %>
<%@include file="../../../common/js/js_boostrap.jsp" %>
<%@include file="../../../common/js/js_boostrap_table.jsp" %>
<%@include file="../../../common/js/js_sweetalert.jsp" %>
<%@include file="../../../common/js/js_data_dict.jsp" %>

<script src="<%=path%>/static/js/our/user/lmh/invest_log.js"></script>

<script>
    $(function () {
        setTable.setBootstrapTable('invest-log-list');
    });
</script>

</body>
</html>
