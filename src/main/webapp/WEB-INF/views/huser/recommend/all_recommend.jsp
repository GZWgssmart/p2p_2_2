<%--
  Created by IntelliJ IDEA.
  User: ID.LQF
  Date: 2017/12/25
  Time: 9:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>推荐管理</title>
    <%@include file="../../common/css/css_bootstrap.jsp" %>
    <%@include file="../../common/css/css_bootstrap-table.jsp" %>
    <%@include file="../../common/css/css_sweetalert.jsp" %>
    <%@include file="../../common/css/css_fileinput.jsp" %>
    <link href="<%=path %>/static/css/our/huser/lqf/recommend.css" rel="stylesheet">
</head>
<body>

<div class="tool-bar" id="tool-bar">
    <form class="form-horizontal" role="form" id="checkForm" enctype="multipart/form-data">
        <div class="form-group" style="width: auto">
            <label style="margin-left: 30px;">
                <input type="date" id="startTime" name="startTime" class="form-control">
            </label>
            <label>至</label>
            <label>
                <input type="date" id="endTime" name="endTime" class="form-control">
            </label>
            <label>
                <button type="button" class="btn btn-primary" onclick="search();">搜索</button>
            </label>
        </div>
    </form>
</div>
<table id="recommend-list" class="table table-hover"
       data-url="<%=path%>/recommend/pager_criteria">
    <thead>
    <tr>
        <th data-checkbox="true"></th>
        <th data-field="tid">推荐人id</th>
        <th data-field="tname">推荐人姓名</th>
        <th data-field="uid">被推荐人id</th>
        <th data-field="rname">被推荐人姓名</th>
        <th data-field="date" data-formatter="setTable.formatDate">推荐时间</th>
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

<script src="<%=path%>/static/js/our/huser/lqf/pager_huser_recommend.js"></script>
<script>
    $(function () {
        setTable.setBootstrapTable('recommend-list');
    });
</script>
</body>
</html>
