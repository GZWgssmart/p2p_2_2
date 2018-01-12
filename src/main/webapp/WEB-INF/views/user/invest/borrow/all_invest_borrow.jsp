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
    <form id="tz-borrow-search" class="form-inline">
        <select name="state" onchange="tzBorrow.search.searchPri(this)" class="form-control">
            <option value="-1">选择状态</option>
            <option value="1">融资中</option>
            <option value="5">融资失败</option>
            <option value="4">还款中</option>
            <option value="6">已还完</option>
        </select>
        <a href="javascript:void(0);" class="btn btn-primary" onclick="allCheckok.look.hkbList();">还款列表</a>
    </form>
</div>
<table id="invest-borrow-list" class="table table-hover"
       data-single-select="true"
       data-url="<%=path%>/borrowapply/list_user_invest">
    <thead>
    <tr>
        <th data-checkbox="true"></th>
        <th data-field="cpname">产品名称</th>
        <th data-field="lxname">类型</th>
        <th data-field="nprofit">利率(%)</th>
        <th data-field="term">期限（月）</th>
        <th data-field="bzname">还款方式</th>
        <th data-field="money">申请金额（元）</th>
        <th data-field="state" data-formatter="tzBorrow.fmt.fmtState">状态</th>
    </tr>
    </thead>
</table>

<%@include file="../../../common/js/js_jquery.jsp" %>
<%@include file="../../../common/js/js_boostrap.jsp" %>
<%@include file="../../../common/js/js_boostrap_table.jsp" %>
<%@include file="../../../common/js/js_sweetalert.jsp" %>
<%@include file="../../../common/js/js_data_dict.jsp" %>

<script src="<%=path%>/static/js/our/user/lmh/all_tz_borrow.js"></script>

<script>
    $(function () {
        setTable.setBootstrapTable('invest-borrow-list');
    });
</script>

</body>
</html>
