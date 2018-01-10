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
    <button onclick="pagerBorrow.formValidate.save_borrowapply();"
            class="btn btn-primary">新增借款
    </button>
    <button onclick="pagerBorrow.formValidate.update_borrowapply();"
            class="btn btn-primary">修改基本信息
    </button>
    <button onclick="pagerBorrow.formValidate.save_borrowapply_detail();"
            class="btn btn-success">填写详情
    </button>
    <button onclick="pagerBorrow.formValidate.update_borrow_detail();"
            class="btn btn-success">修改详情
    </button>
</div>
<table id="borrow-checkok-list" class="table table-hover"
       data-single-select="true"
       data-url="<%=path%>/borrowapply/pager_criteria?uid=${sessionScope.user.uid}">
    <thead>
    <tr>
        <th data-checkbox="true"></th>
        <th data-field="rname">申请人</th>
        <th data-field="money">金额（元）</th>
        <th data-field="bzname">标种类型</th>
        <th data-field="lxname">借款类型</th>
        <th data-field="term">期限（月）</th>
        <th data-field="applyTime" data-formatter="setTable.formatDate">申请时间</th>
        <th data-field="deadline" data-formatter="setTable.formatDate">投标截止时间</th>
        <th data-field="state" data-formatter="pagerBorrow.formatState">状态</th>
        <th data-field="excuse">审核理由</th>
        <th data-field="checkTime" data-formatter="setTable.formatDate">审核时间</th>
    </tr>
    </thead>
</table>


<%@include file="../../../common/js/js_jquery.jsp" %>
<%@include file="../../../common/js/js_boostrap.jsp" %>
<%@include file="../../../common/js/js_boostrap_table.jsp" %>
<%@include file="../../../common/js/js_sweetalert.jsp" %>
<%@include file="../../../common/js/js_form.jsp" %>
<%@include file="../../../common/js/js_data_dict.jsp" %>

<script>
    $(function () {
        setTable.setBootstrapTable('borrow-checkok-list');
    });
</script>

</body>
</html>
