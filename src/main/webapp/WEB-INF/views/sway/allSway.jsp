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
    <button class="btn btn-primary"onclick="addSwayButton();">添加</button>
    <button onclick="" class="btn btn-default">修改</button>
</div>
<table id="allSway" class="table table-hover"
       data-url="<%=path%>/sway/all_sway">
    <thead>
        <tr>
            <th data-checkbox="true"></th>
            <th data-field="sid"  data-visible="false">id</th>
            <th data-field="way">还款方式</th>
            <th data-field="fw">算法</th>
            <th data-field="state" data-formatter="stateFormatter">状态</th>
        </tr>
    </thead>
</table>
<%@include file="../sway/SwayModel.jsp" %>
</body>
<!-- 全局js -->
<script src="<%=path%>/static/js/jquery.min.js"></script>
<script src="<%=path%>/static/js/bootstrap.min.js"></script>
<script src="<%=path%>/static/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
<script src="<%=path%>/static/js/plugins/bootstrap-table/bootstrap-table-mobile.min.js"></script>
<script src="<%=path%>/static/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
<script src="<%=path%>/static/js/our/site_bootstrap_table.js"></script>
<%@include file="../common/js/js_form.jsp" %>
<%@include file="../common/js/js_data_dict.jsp" %>
<%@include file="../common/js/js_sweetalert.jsp" %>
<script>
    $(function () {
        setTable.setBootstrapTable('allSway');
    });

    function  stateFormatter(value) {
        if(value == 0){
            return "不可用";
        }else if(value == 1){
            return "可用";
        }
    }
    
    function addSwayButton() {
        $("#addSway").modal("show");
        return $("#addSwayForm").validate({
            onfocusout: function(element){
                $(element).valid();
            },
            debug:false,
            onkeyup:false,
            rules:{
                'sway':{
                    required: true
                },
                'fw':{
                    required: true
                }
            }
        });
    }
    
    function addSway() {
        if ($('#addSwayForm').valid() === false) return;
        $.post("/sway/save",
            $("#addSwayForm").serialize(),
            function (data) {
                alert(data.message);
             }, "json"
        );
    }
</script>
</html>
