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
    <link href="<%=path%>/static/css/fileinput.css" rel="stylesheet">
    <%@include file="../common/css/css_bootstrap.jsp" %>
    <%@include file="../common/css/css_bootstrap-table.jsp" %>
    <%@include file="../common/css/css_sweetalert.jsp" %>
</head>
<body>

<div class="tool-bar" id="tool-bar">
    <button class="btn btn-primary" data-toggle="modal" data-target="#saveDynamicModal" onclick="showForm();">添加</button>
    <button onclick="setTable.openUpdateModal('cashList', 'update-teacher-basic', 'teacher', 'updateTeacherModal')"
            class="btn btn-default">修改
    </button>
    <br/>
    <%--<form id="cash-search-form" class="form-inline">
        <div class="form-group">
            <input style="height: 30px" name="customer" placeholder="标题" type="text" id="search-customer-input"
                   class="form-control form-inline"/>
        </div>
        <div class="form-group">
            <input style="height: 30px" name="money" placeholder="时间" type="text" id="search-money-input"
                   class="form-control form-inline"/>
        </div>
        <div class="form-group">
            <a href="javascript:void(0);"
               onclick="setTable.doSearch('cash-search-form', 'cashList', contextPath + '/cash/list_cash')"
               class="btn btn-primary">搜索</a>
        </div>
    </form>--%>
</div>
<table id="dynamicList" class="table table-hover"
       data-url="<%=path%>/dynamic/list_dynamic">
    <thead>
    <tr>
        <th data-checkbox="true"></th>
        <th data-field="title">标题</th>
        <%--<th data-field="content">内容</th>--%>
        <th data-field="pic" data-formatter="setTable.formatImg">封面图片</th>
        <th data-field="date" data-formatter="setTable.formatDate">创建时间</th>
    </tr>
    </thead>
</table>

<%@include file="../dynamic/include_save_dynamic.jsp"%>

<%@include file="../common/js/js_jquery.jsp" %>
<%@include file="../common/js/js_boostrap.jsp" %>
<%@include file="../common/js/js_boostrap_table.jsp" %>
<%@include file="../common/js/js_select2.jsp" %>
<%@include file="../common/js/js_sweetalert.jsp" %>
<%@include file="../common/js/js_form.jsp" %>
<%@include file="../common/js/js_data_dict.jsp" %>

<script src="<%=path%>/static/js/fileinput.js"></script>
<script src="<%=path%>/static/js/fileinput_locale_zh.js"></script>
<script src="<%=path%>/static/js/our/jquery-form.js"></script>
<script>
    $(function () {
        setTable.setBootstrapTable('dynamicList');
    });

    $("#pic").fileinput({
        'allowedFileExtensions' : ['jpg', 'png','gif'],
        showUpload: false, //是否显示上传按钮
    });

</script>
</body>
</html>
