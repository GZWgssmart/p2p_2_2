<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>Title</title>
    <link href="<%=path%>/static/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=path%>/static/ztree/css/zTreeStyle/zTreeStyle.css" type="text/css">
    <%@include file="../common/css/css_sweetalert.jsp" %>
    <%@include file="../common/css/css_bootstrap-table.jsp" %>
</head>
<body>
<div class="container">
    <div  style="margin-top: 30px;">
        <form class="form-horizontal" id="add_role">
            <div class="form-group">
                <div class="col-sm-2 control-label">角色名称</div>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="rname" placeholder="角色名称"/>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-2 control-label">备注</div>
                <div class="col-sm-10">
                    <input type="text" class="form-control"name="content" placeholder="备注"/>
                </div>
            </div>
            <div class="form-inline clearfix" style="margin-top:30px;margin-left:26px;">
                <div class="form-group col-md-6">
                    <strong class="col-sm-5 control-label">功能权限</strong>
                    <div class="col-sm-10 col-lg-offset-3">
                        <ul id="jurTree" class="ztree"></ul>
                    </div>
                </div>
            </div>
            <div class="form-group" style="margin-top: 10px">
                <div class="col-sm-2 control-label"></div>
                <input type="button" class="btn btn-primary" onclick="addRole()" value="确定"/>
                &nbsp;&nbsp;<a type="button" class="btn btn-warning" a href="javascript:history.go(-1)">返回</a>
            </div>
        </form>
    </div>

</div>
</body>
<!-- 全局js -->
<%@include file="../common/js/js_sweetalert.jsp" %>
<script src="<%=path%>/static/js/bootstrap.min.js"></script>
<script src="<%=path%>/static/js/our/site_bootstrap_table.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path%>/static/ztree/js/jquery.ztree.core.js"></script>
<script type="text/javascript" src="<%=path%>/static/ztree/js/jquery.ztree.excheck.js"></script>
<script type="text/javascript" src="<%=path%>/static/ztree/js/jquery.ztree.exedit.js"></script>
<%@include file="../common/js/js_form.jsp" %>
<script type="text/javascript" src="<%=path%>/static/js/our/role/qrl/add_role_page.js"></script>
</html>
