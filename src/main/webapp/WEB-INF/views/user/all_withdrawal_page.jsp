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

    <div>
        <div id="toolbar">
        </div>
        <table id="allWithdrawal"
               data-toggle="table"
               data-show-columns="false"
               data-height="460"
               data-toolbar="#toolbar"
               data-click-to-select="true"
               data-show-refresh="true"
               data-cookie="true"
               data-cookie-id-table="saveId"
               data-pagination="true"
               data-search="false"
               data-url="<%=path%>/tx_log/list_withdrawal"
               data-side-pagination="server">
            <thead>
            <tr>
                <th data-radio="true"></th>
                <th data-field="money" data-formatter=formatMoney>金额</th>
                <th data-field="bankcard">卡号</th>
                <th data-field="banktype">所属银行</th>
                <th data-field="state" data-formatter=formatState>审核状态</th>
                <th data-field="excuse" data-formatter=formatNull>审核理由</th>
                <th data-field="date" data-formatter=formatDate>申请时间</th>
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
<script src="<%=path%>/static/js/our/site_bootstrap_table.js"></script>
<script src="<%=path%>/static/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
<%@include file="../common/js/js_form.jsp" %>
<%@include file="../common/js/js_sweetalert.jsp" %>
<script type="text/javascript" src="<%=path%>/static/ztree/js/jquery.ztree.core.js"></script>
<script type="text/javascript" src="<%=path%>/static/ztree/js/jquery.ztree.excheck.js"></script>
<script type="text/javascript" src="<%=path%>/static/ztree/js/jquery.ztree.exedit.js"></script>
<script>
    $(function () {
        setTable.setBootstrapTable('allHuser');
    });

    var contextPath = "";

    function formatNull(value) {
        if(value == null){
            return "";
        }
        return value;
    }

    function formatState(value) {
        if(value == 0){
            return "不通过"
        }else if(value == 1){
            return "审核通过";
        }else{
            return "审核中";
        }

    }

    function formatMoney(value) {
        return value +".00";
    }

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
    }
</script>
</html>
