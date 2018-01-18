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
<table id="allTzRecord"
       data-toggle="table"
       data-show-columns="false"
       data-height="460"
       data-click-to-select="true"
       data-show-refresh="true"
       data-cookie="true"
       data-cookie-id-table="saveId"
       data-pagination="true"
       data-search="false"
       data-url="<%=path%>/tzb/list_pager"
       data-side-pagination="server">
    <thead>
    <tr>
        <th data-field="tzUid" data-visible="false">投资人id</th>
        <th data-field="tzName" data-formatter="NullString">投资人姓名</th>
        <th data-field="juUid" data-visible="false">借款人id</th>
        <th data-field="JuName" data-formatter="NullString">借款人姓名</th>
        <th data-field="tmoney">投资金额</th>
        <th data-field="baid" data-visible="false">借款id</th>
        <th data-field="cpname">产品名称</th>
        <th data-field="time" data-formatter="changeDateFormat">投资时间</th>
    </tr>
    </thead>

</table>
</body>
<script src="<%=path%>/static/js/jquery.min.js"></script>
<script src="<%=path%>/static/js/bootstrap.min.js"></script>
<script src="<%=path%>/static/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
<script src="<%=path%>/static/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
<script>

    function NullString(value) {
        if(value == null || value == ""){
            return "该用户未认证";
        }else {
            return value;
        }
    }

    function changeDateFormat(cellval) {
        if (cellval != null) {
            var date = new Date(cellval);
            var month = date.getMonth() + 1 < 10 ? "0" + (date.getMonth() + 1) : date.getMonth() + 1;
            var currentDate = date.getDate() < 10 ? "0" + date.getDate() : date.getDate();
            var hours = date.getHours() < 10 ? "0" + date.getHours() : date.getHours();
            var minutes = date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes();
            var seconds = date.getSeconds() < 10 ? "0" + date.getSeconds() : date.getSeconds();
            return date.getFullYear() + "-" + month + "-" + currentDate +" "+hours+":"+minutes+":"+seconds;
        }
    }

</script>
</html>
