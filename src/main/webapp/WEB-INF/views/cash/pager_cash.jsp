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
    <button onclick="cashValidate.searchValid('save-teacher-basic');"
            class="btn btn-primary" data-toggle="modal" data-target="#saveTeacherModal">添加
    </button>
    <button onclick="setTable.removeRows('/teacher/removeRows', 'cashList');"
            class="btn btn-danger">删除
    </button>
    <button onclick="setTable.openUpdateModal('cashList', 'update-teacher-basic', 'teacher', 'updateTeacherModal')"
            class="btn btn-default">修改
    </button>
    <button onclick="teacherTable.distributeClazz('cashList', 'clazzTeacherList', 'clazzTeacherModal')"
            class="btn btn-success">分配班级
    </button>
    <br/>
    <form id="cash-search-form" class="form-inline">
        <div class="form-group">
            <input style="height: 30px" name="customer" placeholder="请输入客户姓名" type="text" id="search-customer-input"
                   class="form-control form-inline"/>
        </div>
        <div class="form-group">
            <input style="height: 30px" name="money" placeholder="请输入最大金额" type="text" id="search-money-input"
                   class="form-control form-inline"/>
        </div>
            <select name="pid" id="cashTypeParent" class="cashTypeParent form-inline" style="width: 30%"></select>
            <select name="cashType" class="cashType form-control form-inline" style="width: 30%"></select>
            <select name="payType" class="payType form-control form-inline" style="width: 30%"></select>
        <div class="forom-group">
        </div>
        <div class="form-group">
            <a href="javascript:void(0);"
               onclick="setTable.doSearch('cash-search-form', 'cashList', contextPath + '/cash/list_cash')"
               class="btn btn-primary">搜索</a>
        </div>
    </form>
</div>
<table id="cashList" class="table table-hover"
       data-url="<%=path%>/cash/list_cash">
    <thead>
    <tr>
        <th data-checkbox="true"></th>
        <th data-field="money">资金</th>
        <th data-field="cashType">资金类型</th>
        <th data-field="payType">支付类型</th>
        <th data-field="customer">客户姓名</th>
        <th data-field="cashTime" data-formatter="setTable.formatDate">交易时间</th>
        <th data-field="createdTime" data-formatter="setTable.formatDate">创建时间</th>
    </tr>
    </thead>
</table>

<%@include file="../common/js/js_jquery.jsp" %>
<%@include file="../common/js/js_boostrap.jsp" %>
<%@include file="../common/js/js_boostrap_table.jsp" %>
<%@include file="../common/js/js_select2.jsp" %>
<%@include file="../common/js/js_sweetalert.jsp" %>
<%@include file="../common/js/js_form.jsp" %>
<%@include file="../common/js/js_data_dict.jsp" %>

<script src="<%=path%>/static/js/cash/pager_cash.js"></script>
<script>
    $(function () {
        setTable.setBootstrapTable('cashList');
        pagerCash.select2.loadCashType();
    });
</script>
</body>
</html>
