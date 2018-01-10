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
    <title>公司动态页面</title>
    <%@include file="../../common/css/css_bootstrap.jsp" %>
    <%@include file="../../common/css/css_bootstrap-table.jsp" %>
    <%@include file="../../common/css/css_sweetalert.jsp" %>
    <%@include file="../../common/css/css_fileinput.jsp" %>
</head>
<body>

<div class="tool-bar" id="tool-bar">
    <button class="btn btn-primary" data-toggle="modal" data-target="#saveFriendModal" onclick="showForm();">添加合作公司</button>
    <button class="btn btn-default" data-toggle="modal" onclick="pagerHuserFriend.updateFriend();">修改合作公司</button>
</div>
<table id="friend-list" class="table table-hover"
       data-url="<%=path%>/friend/pager_criteria">
    <thead>
    <tr>
        <th data-checkbox="true"></th>
        <th data-field="imghref">合作公司链接</th>
        <th data-field="imgpath" data-formatter="setTable.formatImg">图片</th>
        <th data-field="imgalert">图片描述</th>
    </tr>
    </thead>
</table>

<%@include file="include_save_friend.jsp"%>
<%@include file="include_update_friend.jsp"%>

<%@include file="../../common/js/js_jquery.jsp" %>
<%@include file="../../common/js/js_boostrap.jsp" %>
<%@include file="../../common/js/js_boostrap_table.jsp" %>
<%@include file="../../common/js/js_select2.jsp" %>
<%@include file="../../common/js/js_sweetalert.jsp" %>
<%@include file="../../common/js/js_form.jsp" %>
<%@include file="../../common/js/js_data_dict.jsp" %>
<%@include file="../../common/js/js_fileinput.jsp" %>

<script src="<%=path %>/static/ueditor/ueditor.config.js"></script>
<script src="<%=path %>/static/ueditor/ueditor.all.js"></script>
<script src="<%=path%>/static/js/our/huser/xdp/pager_huser_friend.js"></script>
<script>
    $(function () {
        setTable.setBootstrapTable('friend-list');
    });

    $("#pic").fileinput({
        'allowedFileExtensions' : ['jpg', 'png','gif'],
        showUpload: false //是否显示上传按钮
    });

    $("#pic1").fileinput({
        'allowedFileExtensions' : ['jpg', 'png','gif'],
        showUpload: false, //是否显示上传按钮
    });

</script>
</body>
</html>
