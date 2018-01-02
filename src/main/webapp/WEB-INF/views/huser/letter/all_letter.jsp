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
    <title>站内信</title>
    <%@include file="../../common/css/css_bootstrap.jsp" %>
    <%@include file="../../common/css/css_bootstrap-table.jsp" %>
    <%@include file="../../common/css/css_sweetalert.jsp" %>
</head>
<body>

<div class="tool-bar" id="tool-bar">
    <button onclick="pagerUserLetter.removeRows();"
            class="btn btn-danger">删除
    </button>
    <button class="btn btn-primary" data-toggle="modal"
            data-target="#saveLetterModal" onclick="showForm();">添加</button>
    <button onclick="pagerUserLetter.unreadRows()"
            class="btn btn-warning">修改
    </button>
</div>
<table id="letter-list" class="table table-hover"
       data-url="<%=path%>/letter/all_pager_criteria">
    <thead>
    <tr>
        <th data-checkbox="true"></th>
        <th data-field="title" data-formatter="pagerUserLetter.formatTitle">标题</th>
        <th data-field="content">内容</th>
    </tr>
    </thead>
</table>

<!--跳转到在线编辑器页面-->
<%@include file="include_save_letter.jsp"%>

<%@include file="../../common/js/js_jquery.jsp" %>
<%@include file="../../common/js/js_boostrap.jsp" %>
<%@include file="../../common/js/js_boostrap_table.jsp" %>
<%@include file="../../common/js/js_sweetalert.jsp" %>
<%@include file="../../common/js/js_form.jsp" %>
<%@include file="../../common/js/js_data_dict.jsp" %>
<script>
    $(function () {
        setTable.setBootstrapTable('letter-list');
    });
</script>

<script src="<%=path%>/static/js/our/jquery-form.js"></script>
<script src="<%=path%>/static/js/our/user/lmh/pager_user_letter.js"></script>
</body>
</html>
