<%--
  Created by IntelliJ IDEA.
  User: 123456
  Date: 2018/1/17
  Time: 20:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>Title</title>
    <link href="<%=path%>/static/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.bootcss.com/bootstrap-table/1.11.1/bootstrap-table.min.css" rel="stylesheet">
</head>
<body>
<table id="allYdate"
       data-toggle="table"
       data-show-columns="false"
       data-height="460"
       data-click-to-select="true"
       data-show-refresh="true"
       data-cookie="true"
       data-cookie-id-table="saveId"
       data-pagination="true"
       data-search="false"
       data-url="<%=path%>/ydate/list_pager"
       data-side-pagination="server">
    <thead>
    <tr>
        <th data-field="yid" data-visible="false">id</th>
        <th data-field="tmoney">交易总额</th>
        <th data-field="mmoney">月交易总额</th>
        <th data-field="tuser">总用户数</th>
        <th data-field="muser">月注册数</th>
        <th data-field="ttzno">总投资人数</th>
        <th data-field="mtzno">月投资人数</th>
        <th data-field="tdkno">总贷款人数</th>
        <th data-field="mdkno">月贷款人数</th>
        <th data-field="tdkbno">总贷款笔数</th>
        <th data-field="mdkbno">月贷款笔数</th>
        <th data-field="date" data-formatter="changeDateFormat">生成时间</th>
    </tr>
    </thead>

</table>
</body>
<script src="<%=path%>/static/js/jquery.min.js"></script>
<script src="<%=path%>/static/js/bootstrap.min.js"></script>
<script src="<%=path%>/static/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
<script src="<%=path%>/static/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
<script>

    function changeDateFormat(cellval) {
        if (cellval != null) {
            var date = new Date(cellval);
            var month = date.getMonth() + 1 < 10 ? "0" + (date.getMonth() + 1) : date.getMonth() + 1;
            var currentDate = date.getDate() < 10 ? "0" + date.getDate() : date.getDate();
            return date.getFullYear() + "-" + month + "-" + currentDate ;
        }
    }

</script>
</html>
