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
    <%@include file="../common/css/css_bootstrap.jsp" %>
    <%@include file="../common/css/css_bootstrap-table.jsp" %>
    <%@include file="../common/css/css_sweetalert.jsp" %>
    <%@include file="../common/css/css_sileinput.jsp" %>
</head>
<body>

<div class="tool-bar" id="tool-bar">
    <button class="btn btn-primary" data-toggle="modal" onclick="pagerHuserDynamic.lookContent();">查看内容</button>
    <button class="btn btn-primary" data-toggle="modal" data-target="#saveDynamicModal" onclick="showForm();">添加</button>
    <button class="btn btn-default" data-toggle="modal" onclick="pagerHuserDynamic.updateDynamic();">修改</button>
</div>
<table id="dynamic-list" class="table table-hover"
       data-url="<%=path%>/dynamic/list_dynamic">
    <thead>
    <tr>
        <th data-checkbox="true"></th>
        <th data-field="title">标题</th>
        <th data-field="pic" data-formatter="setTable.formatImg">封面图片</th>
        <th data-field="date" data-formatter="setTable.formatDate">创建时间</th>
    </tr>
    </thead>
</table>

<%@include file="dynamic/include_watch_dynamic_content.jsp"%>
<%@include file="dynamic/include_save_dynamic.jsp"%>
<%@include file="dynamic/include_update_dynamic.jsp"%>

<%@include file="../common/js/js_jquery.jsp" %>
<%@include file="../common/js/js_boostrap.jsp" %>
<%@include file="../common/js/js_boostrap_table.jsp" %>
<%@include file="../common/js/js_select2.jsp" %>
<%@include file="../common/js/js_sweetalert.jsp" %>
<%@include file="../common/js/js_form.jsp" %>
<%@include file="../common/js/js_data_dict.jsp" %>
<%@include file="../common/js/js_fileinput.jsp" %>

<script src="<%=path %>/static/ueditor/ueditor.config.js"></script>
<script src="<%=path %>/static/ueditor/ueditor.all.js"></script>
<script src="<%=path%>/static/js/our/huser/lqf/pager_huser_dynamic.js"></script>
<script>
    $(function () {
        setTable.setBootstrapTable('dynamic-list');
    });

    $("#pic").fileinput({
        'allowedFileExtensions' : ['jpg', 'png','gif'],
        showUpload: false //是否显示上传按钮
    });

</script>
</body>
</html>
