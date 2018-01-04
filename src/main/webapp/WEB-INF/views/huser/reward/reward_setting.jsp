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
    <title>投资奖励</title>
    <%@include file="../../common/css/css_bootstrap.jsp" %>
    <%@include file="../../common/css/css_bootstrap-table.jsp" %>
    <%@include file="../../common/css/css_sweetalert.jsp" %>
</head>
<body>

<div class="tool-bar" id="tool-bar">
    <button class="btn btn-primary" data-toggle="modal"
            data-target="#saveLetterModal" onclick="showForm();">添加奖励</button>
    <button class="btn btn-default" data-toggle="modal"
            onclick="pagerHuserLetter.updateLetter();">修改奖励</button>
</div>
<table id="letter-list" class="table table-hover"
       data-url="<%=path%>/rewardSetting/pager_criteria">
    <thead>
    <tr>
        <th data-checkbox="true"></th>
        <th data-field="title" data-formatter="pagerUserLetter.formatTitle">最大金额</th>
        <th data-field="title" data-formatter="pagerUserLetter.formatTitle">最小金额</th>
        <th data-field="content">奖励百分比</th>
    </tr>
    </thead>
</table>

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
<script src="<%=path%>/static/js/our/huser/xdp/pager_huser_letter.js"></script>
</body>
</html>
