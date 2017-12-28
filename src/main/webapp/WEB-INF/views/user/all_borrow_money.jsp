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
    <%@include file="../common/css/css_bootstrap.jsp" %>
    <%@include file="../common/css/css_bootstrap-table.jsp" %>
    <%@include file="../common/css/css_sweetalert.jsp" %>
</head>
<body>

<div class="tool-bar" id="tool-bar">
    <button onclick="pagerBorrow.formValidate.save_borrowapply('save-borrowapply-modal', 'save-borrowapply-form');"
            class="btn btn-primary" data-toggle="modal" data-target="#saveTeacherModal">新增借款
    </button>
</div>
<table id="borrowapply-list" class="table table-hover"
       data-url="<%=path%>/borrowapply/list_criteria?uid=${sessionScope.user.uid}">
    <thead>
    <tr>
        <th data-checkbox="true"></th>
        <th data-field="rname">申请人</th>
        <th data-field="money">金额（元）</th>
        <th data-field="bzname">标种类型</th>
        <th data-field="lxname">借款类型</th>
        <th data-field="term">借款期限（月）</th>
        <th data-field="state" data-formatter="pagerBorrow.formatState">审核状态</th>
        <th data-field="excuse">审核理由</th>
        <th data-field="checkTime" data-formatter="setTable.formatDate">审核时间</th>
        <th data-field="applyTime" data-formatter="setTable.formatDate">申请时间</th>
        <th data-field="deadline" data-formatter="setTable.formatDate">投标截止时间</th>
    </tr>
    </thead>
</table>

<%@include file="include_save_borrowapply.jsp" %>

<%@include file="../common/js/js_jquery.jsp" %>
<%@include file="../common/js/js_boostrap.jsp" %>
<%@include file="../common/js/js_boostrap_table.jsp" %>
<%@include file="../common/js/js_select2.jsp" %>
<%@include file="../common/js/js_sweetalert.jsp" %>
<%@include file="../common/js/js_form.jsp" %>
<%@include file="../common/js/js_data_dict.jsp" %>

<script src="<%=path%>/static/js/our/user/lmh/pager_borrowapply.js"></script>
<script>
    $(function () {
        setTable.setBootstrapTable('borrowapply-list');
        pagerBorrow.select2.loadBzType();//加载 标种下拉框的数据
        pagerBorrow.select2.loadJkType(); //加载 借款类型下拉框的数据
    });
</script>

</body>
</html>
