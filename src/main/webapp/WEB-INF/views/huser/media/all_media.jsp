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
    <title>媒体报道</title>
    <%@include file="../../common/css/css_bootstrap.jsp" %>
    <%@include file="../../common/css/css_bootstrap-table.jsp" %>
    <%@include file="../../common/css/css_sweetalert.jsp" %>
    <%@include file="../../common/css/css_sileinput.jsp" %>
</head>
<body>

<div class="tool-bar" id="tool-bar">
    <button class="btn btn-primary" data-toggle="modal" onclick="pagerHuserMedia.lookContent();">查看内容</button>
    <button class="btn btn-primary" data-toggle="modal" data-target="#saveMediaModal" onclick="showForm();">添加</button>
    <button class="btn btn-default" data-toggle="modal" onclick="pagerHuserMedia.updateMedia();">修改</button>
</div>
<table id="media-list" class="table table-hover"
       data-url="<%=path%>/media/pager_criteria">
    <thead>
    <tr>
        <th data-checkbox="true"></th>
        <th data-field="title">标题</th>
        <th data-field="pic" data-formatter="setTable.formatImg">封面图片</th>
        <th data-field="date" data-formatter="setTable.formatDate">报道时间</th>
        <th data-field="url">地址</th>
    </tr>
    </thead>
</table>

<%@include file="include_watch_media_content.jsp"%>
<%@include file="include_save_media.jsp"%>
<%@include file="include_update_media.jsp"%>

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
<script src="<%=path%>/static/js/our/huser/lqf/pager_huser_media.js"></script>
<script>
    $(function () {
        setTable.setBootstrapTable('media-list');
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
