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
            <a href="javascript:void(0);"
               onclick="setTable.doSearch('cash-search-form', 'cashList', contextPath + '/cash/list_cash')"
               class="btn btn-primary">搜索</a>
        </div>
    </form>
</div>
<table id="borrowapplyList" class="table table-hover"
       data-url="<%=path%>/borrowapply/list_borrowapply?uid=${sessionScope.user.uid}">
    <thead>
    <tr>
        <th data-checkbox="true"></th>
        <th data-field="rname">真实姓名</th>
        <th data-field="money">资金</th>
        <th data-field="bzid">标种类型</th>
        <th data-field="type">借款类型</th>
        <th data-field="term">借款期限</th>
        <th data-field="state">状态</th>
        <th data-field="time" data-formatter="setTable.formatDate">申请时间</th>
        <th data-field="deadline" data-formatter="setTable.formatDate">截止时间</th>
    </tr>
    </thead>
</table>

<%@include file="../common/js/js_jquery.jsp" %>
<%@include file="../common/js/js_boostrap.jsp" %>
<%@include file="../common/js/js_boostrap_table.jsp" %>
<%@include file="../common/js/js_sweetalert.jsp" %>
<%@include file="../common/js/js_form.jsp" %>
<%@include file="../common/js/js_data_dict.jsp" %>

<script>
    $(function () {
        setTable.setBootstrapTable('borrowapplyList');
    });
</script>
</body>
</html>
