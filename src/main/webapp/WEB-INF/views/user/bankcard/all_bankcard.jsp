<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>提现审核</title>
    <%@include file="../../common/css/css_bootstrap.jsp" %>
    <%@include file="../../common/css/css_bootstrap-table.jsp" %>
    <%@include file="../../common/css/css_sweetalert.jsp" %>
</head>
<body>
<div class="tool-bar" id="tool-bar">
    <button onclick="bkCd.open.saveModal();" class="btn btn-primary">添加</button>
    <button onclick="bkCd.open.updateModal();" class="btn btn-primary">修改</button>
</div>

<table id="bankcard-list" class="table table-hover"
       data-single-select="true"
       data-url="<%=path%>/bankcard/pager_criteria">
    <thead>
        <tr>
            <th data-checkbox="true"></th>
            <th data-field="type">所属银行</th>
            <th data-field="cardno">银行卡号</th>
            <th data-field="rname">真实姓名</th>
            <th data-field="idno">身份证号</th>
            <th data-field="date" data-formatter="setTable.formatDate">绑卡时间</th>
        </tr>
    </thead>
</table>

<jsp:include page="include_save_bankcard.jsp"/>
<jsp:include page="include_update_bankcard.jsp"/>

<%@include file="../../common/js/js_jquery.jsp" %>
<%@include file="../../common/js/js_boostrap.jsp" %>
<%@include file="../../common/js/js_boostrap_table.jsp" %>
<%@include file="../../common/js/js_select2.jsp" %>
<%@include file="../../common/js/js_sweetalert.jsp" %>
<%@include file="../../common/js/js_form.jsp" %>
<%@include file="../../common/js/js_data_dict.jsp" %>

<script src="<%=path%>/static/js/our/user/lmh/bankcard.js"></script>

<script>
    $(function () {
        setTable.setBootstrapTable('bankcard-list');
    });
</script>

</body>
</html>
