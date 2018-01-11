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
    <form id="checkok-search-form" class="form-inline">
        <select name="state" onchange="allCheckok.submitForm.search(this);" class="form-control">
            <option value="-1">选择状态</option>
            <option value="1">融资中</option>
            <option value="5">融资失败</option>
            <option value="4">还款中</option>
            <option value="6">还款成功</option>
        </select>
        <a href="javascript:void(0);" class="btn btn-primary" onclick="allCheckok.look.hkbList();">还款列表</a>
    </form>
</div>
<table id="borrow-checkok-list" class="table table-hover"
       data-single-select="true"
       data-url="<%=path%>/borrowapply/list_checkok">
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
        <th data-field="state" data-formatter="allCheckok.formatter.formatState">状态</th>
    </tr>
    </thead>
</table>

<%@include file="include_hk_list.jsp"%>

<%@include file="../../../common/js/js_jquery.jsp" %>
<%@include file="../../../common/js/js_boostrap.jsp" %>
<%@include file="../../../common/js/js_boostrap_table.jsp" %>
<%@include file="../../../common/js/js_sweetalert.jsp" %>
<%@include file="../../../common/js/js_data_dict.jsp" %>
<%@include file="../../../common/js/js_encrypt_md5.jsp" %>

<script src="<%=path%>/static/js/our/user/lmh/all_borrow_checkok.js"></script>

<script>
    $(function () {
        setTable.setBootstrapTable('borrow-checkok-list');
    });
</script>

</body>
</html>
