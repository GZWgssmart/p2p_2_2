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
            <form id="searchForm" class="form-inline">
                <select name="type" onchange="search(this);" class="form-control">
                    <option value="-1">选择状态</option>
                    <option value="0">充值</option>
                    <option value="1">提现</option>
                    <option value="2">投资</option>
                    <option value="3">收款</option>
                    <option value="4">还款</option>
                </select>
            </form>
        </div>
        <table id="allUserMoneyLog"
               data-toggle="table"
               data-show-columns="false"
               data-height="460"
               data-toolbar="#toolbar"
               data-click-to-select="true"
               data-show-refresh="true"
               data-pagination="true"
               data-search="false"
               data-url="<%=path%>/moneyLog/list_criteria_by_user"
               data-side-pagination="server">
            <thead>
            <tr>
                <th data-field="type" data-formatter=formatType>类型</th>
                <th data-field="inMoney" data-formatter=formatMoney>收入金额</th>
                <th data-field="outMoney" data-formatter=formatMoney>支出金额</th>
                <th data-field="date" data-formatter=formatDate>时间</th>
            </tr>
            </thead>

        </table>


    </div>



</body>
<!-- 全局js -->
<%@include file="../common/js/js_jquery.jsp" %>
<%@include file="../common/js/js_boostrap.jsp" %>
<%@include file="../common/js/js_boostrap_table.jsp" %>
<%@include file="../common/js/js_form.jsp" %>
<%@include file="../common/js/js_sweetalert.jsp" %>
<script>
    $(function () {
        setTable.setBootstrapTable('allUserMoneyLog');
    });

    var contextPath = "";


    function formatType(value) {
        if(value == 0){
            return "充值"
        }else if(value == 1){
            return "提现";
        }else if(value == 2){
            return "投资";
        }else if(value == 3){
            return "收款";
        }else if(value == 4){
            return "还款";
        }

    }

    function formatMoney(value) {
        if(value == null){
            return "";
        }
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

    function search (select) {
        if (select.value === '-1') {
            setTable.postRefresh('allUserMoneyLog');
        } else {
            setTable.doSearch("searchForm",
                'allUserMoneyLog',
                contextPath + '/moneyLog/list_criteria_by_user');
        }
    }
</script>
</html>
