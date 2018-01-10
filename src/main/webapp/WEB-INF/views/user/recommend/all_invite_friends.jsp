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
    <title>推荐列表</title>
    <%@include file="../../common/css/css_bootstrap.jsp" %>
    <%@include file="../../common/css/css_bootstrap-table.jsp" %>
    <%@include file="../../common/css/css_sweetalert.jsp" %>
    <%@include file="../../common/css/css_fileinput.jsp" %>
    <link href="<%=path %>/static/css/our/huser/lqf/recommend.css" rel="stylesheet">
</head>
<body>

<div class="tool-bar" id="tool-bar">
    <form class="form-horizontal" role="form" id="friendsForm" enctype="multipart/form-data">
        <div class="form-group" style="width: auto">
            <label style="margin-left: 30px;">
                <input type="date" id="startTime1" name="startTime" class="form-control">
            </label>
            <label>至</label>
            <label>
                <input type="date" id="endTime1" name="endTime" class="form-control">
            </label>
            <label>
                <button type="button" class="btn btn-primary" onclick="searchFriends(${sessionScope.user.uid});">搜索</button>
            </label>
        </div>
    </form>
</div>
<table id="friends-list" class="table table-hover"
       data-url="<%=path%>/recommend/pager_friends?uid=${sessionScope.user.uid}">
    <thead>
    <tr>
        <th data-checkbox="true"></th>
        <th data-field="uid">推荐好友的id</th>
        <th data-field="rname">推荐好友的名字</th>
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
        setTable.setBootstrapTable('friends-list');
    });
</script>
</body>
</html>
