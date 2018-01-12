<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path  = request.getContextPath();
%>
<html>
<head>
    <title>Title</title>
    <%@include file="../../common/css/css_bootstrap.jsp" %>
    <%@include file="../../common/css/css_bootstrap-table.jsp" %>
    <%@include file="../../common/css/css_sweetalert.jsp" %>
</head>
<body class="gray-bg">
<div class="tool-bar" id="tool-bar">
    <button class="btn btn-primary"onclick="addSwayButton();">添加</button>
    <button onclick="updateSwayButton();" class="btn btn-default">修改</button>
    <button onclick="remove();" class="btn btn-danger">删除</button>
    <button onclick="updateState('激活');" class="btn btn-default">激活</button>
    <button onclick="updateState('冻结');" class="btn btn-default">冻结</button>
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
<%@include file="SwayModel.jsp" %>
</body>
<!-- 全局js -->
<script src="<%=path%>/static/js/jquery.min.js"></script>
<script src="<%=path%>/static/js/bootstrap.min.js"></script>
<script src="<%=path%>/static/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
<script src="<%=path%>/static/js/plugins/bootstrap-table/bootstrap-table-mobile.min.js"></script>
<script src="<%=path%>/static/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
<script src="<%=path%>/static/js/our/site_bootstrap_table.js"></script>
<%@include file="../../common/js/js_form.jsp" %>
<%@include file="../../common/js/js_data_dict.jsp" %>
<%@include file="../../common/js/js_sweetalert.jsp" %>
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
                if(data.message === "保存成功！"){
                    swtAlert.request_success("保存成功");
                    $("#addSway").modal("hide");
                    $("#allSway").bootstrapTable("refresh");
                }else{
                    swtAlert.request_fail(data.message);
                }
             }, "json"
        );
    }

    function changeOne(tableId) {
        var row = $("#"+tableId).bootstrapTable('getSelections');
        if(row.length == 1){
            return row[0];
        }else{
            swtAlert.request_fail_no_timer("请选择一行数据");
            return false;
        }
    }

    function updateSwayButton() {
        var row = changeOne("allSway");
        if(row == false){
            return;
        }
        $("#updateSway").modal("show");
        $("#way").val(row.way);
        $("#fw").val(row.fw);
        $("#sid").val(row.sid);
        return $("#updateSwayForm").validate({
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

    function updateSway() {
        if ($('#updateSwayForm').valid() === false) return;
        $.post("/sway/update",
            $("#updateSwayForm").serialize(),
            function (data) {
                if(data.message == "更新成功"){
                    swtAlert.request_success(data.message);
                    $("#updateSway").modal("hide");
                    $("#allSway").bootstrapTable("refresh");
                }else{
                    swtAlert.request_fail(data.message);
                }
            },"json"
        );
    }

    function remove() {
        var row = $("#allSway").bootstrapTable('getSelections');
        if(row.length == 0){
            swtAlert.request_fail_no_timer("请选择数据");
        }else{
            var ids = [];
            for(var i =0, len = row.length;i < len;i++){
                ids.push(row[i].sid);
            }
            $.ajax({
                type: 'post',
                url: '/sway/remove',
                dataType : 'json',
                data: {
                    "ids":ids.join()
                },
                success:  function (data){
                    swtAlert.request_success(data.message);
                    $("#allSway").bootstrapTable('refresh');
                },
                error:function () {
                    swtAlert.request_fail("删除失败")
                }
            });
        }
    }
    function updateState(state) {
        var row = changeOne("allSway");
        if(row == false){
            return;
        }
        if((state == "激活" && row.state == 1) || (state == "冻结" && row.state == 0)){
            swtAlert.request_fail_no_timer("已是"+state+"状态");
        }else{
            $.post("/sway/updateState",
                {
                    sid:row.sid,
                    state:state
                },function (data) {
                    if(data.message === "更新成功"){
                        swtAlert.request_success(state+"成功");
                        $("#allSway").bootstrapTable("refresh");
                    }
                },"json"
            );
        }
    }
</script>
</html>
