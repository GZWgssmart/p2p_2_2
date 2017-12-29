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
<body>
<%--<div class="tool-bar" id="tool-bar">
    <button class="btn btn-primary" data-toggle="modal" data-target="#saveDynamicModal" >查看详情</button>
    <a href="<%=path%>/role/add_role_page" class="btn btn-default">添加角色
    </a>
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
<table id="allRole" class="table table-hover"
       data-url="<%=path%>/role/list_pager">
    <thead>
    <tr>
        <th data-checkbox="true"></th>
        <th data-field="rname" >角色名称</th>
        <th data-field="content">备注</th>
        <th data-field="createTime"  data-formatter=formatDate>创建时间</th>
    </tr>
    </thead>
</table>--%>
<div>
    <h4>所有员工</h4>
    <div id="toolbar">
        <button id="seeButton" class="btn btn-primary" onclick="seeDetail()">查看详情</button>
        <button class="btn btn-primary" onclick="empSaleCount()">查看员工销售量</button>
        <button id="getButton" class="btn btn-primary" onclick="show1()">修改</button>
        <button id="enableButton" class="btn btn-primary" onclick="enable()">激活</button>
        <button id="fireButton" class="btn btn-warning" onclick="fire()">冻结</button>

    </div>
    <table id="table1"
           data-toggle="table"
           data-show-columns="false"
           data-height="460"
           data-toolbar="#toolbar"
           data-click-to-select="true"
           data-cookie="true"
           data-cookie-id-table="saveId"
           data-pagination="true"
           data-search="false"
           data-url="<%=path%>/role/list_pager";
           data-side-pagination="server">
        <thead>
        <tr>
            <th data-checkbox="true"></th>
            <th data-field="rname" >角色名称</th>
            <th data-field="content">备注</th>
            <th data-field="createTime"  data-formatter=formatDate>创建时间</th>
        </tr>
        </thead>

    </table>
</div>

</body>
<!-- 全局js -->
<script src="<%=path%>/static/js/jquery.min.js"></script>
<script src="<%=path%>/static/js/bootstrap.min.js"></script>
<script src="<%=path%>/static/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
<script src="<%=path%>/static/js/plugins/bootstrap-table/bootstrap-table-mobile.min.js"></script>
<script src="<%=path%>/static/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
<script src="<%=path%>/static/js/our/site_bootstrap_table.js"></script>
<script>
    $(function () {
        setTable.setBootstrapTable('allRole');
    });

    function formatDate(value) {
        if (value == undefined || value == null || value == '') {
            return "";
        } else {
            var date = new Date(value);
            var year = date.getFullYear().toString();
            var month = (date.getMonth() + 1);
            var day = date.getDate().toString();
            var hour = date.getHours().toString();
            var minutes = date.getMinutes().toString();
            var seconds = date.getSeconds().toString();
            if (month < 10) {
                month = "0" + month;
            }
            if (day < 10) {
                day = "0" + day;
            }
            if (hour < 10) {
                hour = "0" + hour;
            }
            if (minutes < 10) {
                minutes = "0" + minutes;
            }
            if (seconds < 10) {
                seconds = "0" + seconds;
            }
            return year + "-" + month + "-" + day + " " + hour + ":" + minutes + ":" + seconds;
        }
</script>
</html>
