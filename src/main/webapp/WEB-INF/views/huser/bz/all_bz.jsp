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
    <button class="btn btn-primary" onclick="addBzButton();">添加</button>
    <button onclick="updateBzButton();" class="btn btn-default">修改</button>
    <button onclick="remove();" class="btn btn-danger">删除</button>
    <button onclick="updateState('激活');" class="btn btn-default">激活</button>
    <button onclick="updateState('冻结');" class="btn btn-default">冻结</button>
</div>
<table id="allBz" class="table table-hover"
       data-url="<%=path%>/bz/pager_criteria">
    <thead>
    <tr>
        <th data-checkbox="true"></th>
        <th data-field="bzid" data-visible="false">id</th>
        <th data-field="bzname">标种名称</th>
        <th data-field="state" data-formatter="stateFormatter">状态</th>
    </tr>
    </thead>
</table>
<%@include file="BzModel.jsp" %>

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
        setTable.setBootstrapTable('bz-list');
    });
</script>
<script>
    $(function () {
        setTable.setBootstrapTable('allBz');
    });

    function stateFormatter(value) {
        if (value == 0) {
            return "不可用";
        } else if (value == 1) {
            return "可用";
        }
    }

    function addBzButton() {
        $("#addBz").modal("show");
        return $("#addBzForm").validate({
            onfocusout: function (element) {
                $(element).valid();
            },
            debug: false,
            onkeyup: false,
            rules: {
                'bzname': {
                    required: true
                }
            }
        });
    }

    function addBz() {
        if ($('#addBzForm').valid() === false) return;
        $.post("/bz/save",
            $("#addBzForm").serialize(),
            function (data) {
                if (data.message === "保存成功！") {
                    swtAlert.request_success("保存成功");
                    $("#addBz").modal("hide");
                    $("#allBz").bootstrapTable("refresh");
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

    function updateBzButton() {
        var row = changeOne("allBz");
        if (row == false) {
            return;
        }
        $("#updateBz").modal("show");
        $("#bzname").val(row.bzname);
        $("#bzid").val(row.bzid);
        return $("#updateBzForm").validate({
            onfocusout: function (element) {
                $(element).valid();
            },
            debug: false,
            onkeyup: false,
            rules: {
                'bzname': {
                    required: true
                }
            }
        });
    }

    function updateBz() {
        if ($('#updateBzForm').valid() === false) return;
        $.post("/bz/update",
            $("#updateBzForm").serialize(),
            function (data) {
                if (data.message == "更新成功") {
                    swtAlert.request_success(data.message);
                    $("#updateBz").modal("hide");
                    $("#allBz").bootstrapTable("refresh");
                } else {
                    swtAlert.request_fail(data.message);
                }
            }, "json"
        );
    }

    function remove() {
        var row = $("#allBz").bootstrapTable('getSelections');
        if (row.length == 0) {
            swtAlert.request_fail_no_timer("请选择数据");
        } else {
            var ids = [];
            for (var i = 0, len = row.length; i < len; i++) {
                ids.push(row[i].sid);
            }
            $.ajax({
                type: 'post',
                url: '/bz/remove',
                dataType: 'json',
                data: {
                    "ids": ids.join()
                },
                success: function (data) {
                    swtAlert.success(data.message);
                    var row = $("#allBz").bootstrapTable('getSelections');
                },
                error: function () {
                    swtAlert.request_fail("删除失败")
                }
            });
        }
    }
    function updateState(state) {
        var row = changeOne("allBz");
        if (row == false) {
            return;
        }
        if ((state == "激活" && row.state == 1) || (state == "冻结" && row.state == 0)) {
            swtAlert.request_fail_no_timer("已是" + state + "状态");
        } else {
            $.post("/bz/updateState",
                {
                    sid: row.sid,
                    state: state
                }, function (data) {
                    if (data.message === "更新成功") {
                        swtAlert.request_success(state + "成功");
                        $("#allBz").bootstrapTable("refresh");
                    }
                }, "json"
            );
        }
    }
</script>
</body>
</html>
