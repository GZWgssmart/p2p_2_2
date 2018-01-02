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
    <%@include file="../../common/css/css_bootstrap.jsp" %>
    <%@include file="../../common/css/css_bootstrap-table.jsp" %>
    <%@include file="../../common/css/css_sweetalert.jsp" %>
    <%@include file="../../common/css/css_sileinput.jsp" %>
</head>
<body>

<div class="tool-bar" id="tool-bar">
    <button onclick="pagerBorrow.formValidate.save_borrowapply();"
            class="btn btn-primary">通过审核
    </button>
    <button onclick="pagerBorrow.formValidate.update_borrowapply();"
            class="btn btn-primary">拒绝通过
    </button>
</div>
<table id="shborrow-list" class="table table-hover"
       data-url="<%=path%>/shborrow/pager_criteria">
    <thead>
    <tr>
        <th data-checkbox="true"></th>
        <th data-field="rname">申请人</th>
        <th data-field="money">金额（元）</th>
        <th data-field="term">借款期限（月）</th>
        <th data-field="isok" data-formatter="allShborrow.formatter.formatIsok">审核状态</th>
        <th data-field="excuse">审核理由</th>
        <th data-field="date" data-formatter="setTable.formatDate">审核时间</th>
        <th data-field="applyTime" data-formatter="setTable.formatDate">申请时间</th>
        <th data-field="deadline" data-formatter="setTable.formatDate">投标截止时间</th>
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

<script src="<%=path%>/static/js/our/huser/lmh/all_shborrow.js"></script>

<script>
    $(function () {
        setTable.setBootstrapTable('shborrow-list');
        pagerBorrow.select2.loadBzType();//加载 标种下拉框的数据
        pagerBorrow.select2.loadJkType(); //加载 借款类型下拉框的数据
    });
</script>

</body>
</html>
