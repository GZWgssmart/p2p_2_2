<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path  = request.getContextPath();
%>
<html>
<head>
    <title>Title</title>
    <link href="<%=path%>/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=path%>/static/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
</head>
<body class="gray-bg">
<div class="tool-bar" id="tool-bar">
    <button class="btn btn-primary" data-toggle="modal" data-target="#saveDynamicModal" onclick="">添加动态发布员</button>
    <button onclick="" class="btn btn-default">添加审核员
    </button>
    <br/>
    <form id="cash-search-form" class="form-inline">
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
    </form>
</div>
<table id="allAdmin" class="table table-hover"
       data-url="<%=path%>/huser/all_admin">
    <thead>
    <tr>
        <th data-checkbox="true"></th>
        <th data-field="hid"  data-visible="false">用户id</th>
        <th data-field="rname">真实姓名</th>
        <th data-field="sex">性别</th>
        <th data-field="email">邮箱</th>
        <th data-field="roleRname">角色</th>
    </tr>
    </thead>
</table>

</body>
<!-- 全局js -->
<script src="<%=path%>/static/js/jquery.min.js"></script>
<script src="<%=path%>/static/js/bootstrap.min.js"></script>
<script src="<%=path%>/static/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
<script src="<%=path%>/static/js/plugins/bootstrap-table/bootstrap-table-mobile.min.js"></script>
<script src="<%=path%>/static/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
<%--<script src="<%=path%>/static/js/our/huser/allAdmin.js"></script>--%>
<script src="<%=path%>/static/js/our/site_bootstrap_table.js"></script>
<script>
    $(function () {
        setTable.setBootstrapTable('allAdmin');
    });
</script>
</html>
