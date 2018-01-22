<%--
  Created by IntelliJ IDEA.
  User: mh
  Date: 2017/10/18
  Time: 22:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>Title</title>
    <%@include file="../../common/css/css_bootstrap.jsp" %>
    <%@include file="../../common/css/css_bootstrap-table.jsp" %>
    <%@include file="../../common/css/css_sweetalert.jsp" %>
</head>
<body>
<body class="gray-bg">
<div class="tool-bar" id="tool-bar">
    <button class="btn btn-primary" onclick="addDxmodelButton();">添加</button>
    <button onclick="updateDxmodelButton();" class="btn btn-default">修改</button>
</div>
<table id="allDxmodel" class="table table-hover"
       data-url="<%=path%>/dxmodel/pager_criteria">
    <thead>
    <tr>
        <th data-checkbox="true"></th>
        <th data-field="dxid" data-visible="false">id</th>
        <th data-field="content">短信模版</th>
    </tr>
    </thead>
</table>
<%@include file="DxmodelModel.jsp" %>

<%@include file="../../common/js/js_jquery.jsp" %>
<%@include file="../../common/js/js_boostrap.jsp" %>
<%@include file="../../common/js/js_boostrap_table.jsp" %>
<%@include file="../../common/js/js_select2.jsp" %>
<%@include file="../../common/js/js_sweetalert.jsp" %>
<%@include file="../../common/js/js_form.jsp" %>
<%@include file="../../common/js/js_data_dict.jsp" %>

</body>
<script>
    $(function () {
        setTable.setBootstrapTable('dxmodel-list');
    });
</script>
<script>
    $(function () {
        setTable.setBootstrapTable('allDxmodel');
    });

    function addDxmodelButton() {
        $("#addDxmodel").modal("show");
        return $("#addDxmodelForm").validate({
            onfocusout: function (element) {
                $(element).valid();
            },
            debug: false,
            onkeyup: false,
            rules: {
                'content': {
                    required: true
                }
            }
        });
    }

    function addDxmodel() {
        if ($('#addDxmodelForm').valid() === false) return;
        $.post("/dxmodel/save",
            $("#addDxmodelForm").serialize(),
            function (data) {
                if (data.message === "保存成功！") {
                    swtAlert.request_success("保存成功");
                    $("#addDxmodel").modal("hide");
                    $("#allDxmodel").bootstrapTable("refresh");
                } else {
                    swtAlert.request_fail(data.message);
                }
            }, "json"
        );
    }

    function changeOne(tableId) {
        var row = $("#" + tableId).bootstrapTable('getSelections');
        if (row.length == 1) {
            return row[0];
        } else {
            swtAlert.request_fail_no_timer("请选择一行数据");
            return false;
        }
    }

    function updateDxmodelButton() {
        var row = changeOne("allDxmodel");
        if (row == false) {
            return;
        }
        $("#updateDxmodel").modal("show");
        $("#content").val(row.content);
        $("#dxid").val(row.dxid);
        return $("#updateDxmodelForm").validate({
            onfocusout: function (element) {
                $(element).valid();
            },
            debug: false,
            onkeyup: false,
            rules: {
                'content': {
                    required: true
                }
            }
        });
    }

    function updateDxmodel() {
        if ($('#updateDxmodelForm').valid() === false) return;
        $.post("/dxmodel/update",
            $("#updateDxmodelForm").serialize(),
            function (data) {
                if (data.message == "更新成功") {
                    swtAlert.request_success(data.message);
                    $("#updateDxmodel").modal("hide");
                    $("#allDxmodel").bootstrapTable("refresh");
                } else {
                    swtAlert.request_fail(data.message);
                }
            }, "json"
        );
    }

    function updateState(state) {
        var row = changeOne("allDxmodel");
        if (row == false) {
            return;
        }
        if ((state == "激活" && row.state == 1) || (state == "冻结" && row.state == 0)) {
            swtAlert.request_fail_no_timer("已是" + state + "状态");
        } else {
            $.post("/dxmodel/updateState",
                {
                    dxid: row.dxid,
                    state: state
                }, function (data) {
                    if (data.message === "更新成功") {
                        swtAlert.request_success(state + "成功");
                        $("#allDxmodel").bootstrapTable("refresh");
                    }
                }, "json"
            );
        }
    }
</script>
</body>
</html>
