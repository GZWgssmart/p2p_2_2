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
    <button onclick="openAddBankcardView()" class="btn btn-primary">添加银行卡</button>
</div>

<table id="txLog-list" class="table table-hover"
       data-url="<%=path%>/bankcard/allBankcard">
    <thead>
        <tr>
            <th data-field="type">所属银行</th>
            <th data-field="cardno">银行卡号</th>
            <th data-field="rname">真实姓名</th>
            <th data-field="idno">身份证号</th>
            <th data-field="date" data-formatter="setTable.formatDate">绑卡时间</th>
        </tr>
    </thead>
</table>

<div class="modal fade bs-example-modal-lg" id="updateTeacherModal" tabindex="-1" role="dialog"
     aria-labelledby="myLargeModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">绑定银行卡</h4>
            </div>
            <div class="modal-body">
                <form id="addEmailForm" class="form-horizontal">
                    <div class="form-group">
                        <label for="excuse" class="col-sm-2 control-label">银行卡号</label>
                        <div class="col-sm-10">
                            <input name="cardno" class="form-control" id="cardno" placeholder="输入您的银行卡号！">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="excuse" class="col-sm-2 control-label">所属银行</label>
                        <div class="col-sm-10">
                            <input name="type" class="form-control" id="type" placeholder="输入您的所属银行！">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="excuse" class="col-sm-2 control-label">真实姓名</label>
                        <div class="col-sm-10">
                            <input name="rname" class="form-control" id="rname" value="${sessionScope.user.rname}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="excuse" class="col-sm-2 control-label">身份证号</label>
                        <div class="col-sm-10">
                            <input name="idno" class="form-control" id="idno" value="${sessionScope.user.idno}">
                        </div>
                    </div>

                    <div class="modal-footer">
                        <input type="reset" class="btn btn-default" value="重置"/>
                        <a href="javascript:void(0);" onclick="binDingBankcard()"
                           class="btn btn-primary">绑定</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<%@include file="../../common/js/js_jquery.jsp" %>
<%@include file="../../common/js/js_boostrap.jsp" %>
<%@include file="../../common/js/js_boostrap_table.jsp" %>
<%@include file="../../common/js/js_select2.jsp" %>
<%@include file="../../common/js/js_sweetalert.jsp" %>
<%@include file="../../common/js/js_form.jsp" %>
<%@include file="../../common/js/js_data_dict.jsp" %>

<script src="<%=path%>/static/js/our/user/lmh/pager_borrowapply.js"></script>
<script>

    $(function () {
        setTable.setBootstrapTable('txLog-list');
    });


    function openAddBankcardView() {
        $("#updateTeacherModal").modal("show");//hide关
    }



    //点击提交提现理由后进入后台
    function binDingBankcard() {
        $.post("<%=path%>/bankcard/addBankcard",
            $("#addEmailForm").serialize(),
            function (data) {
                if(data.result === "success"){
                    //弹出自动关闭的提示框
                    swtAlert.request_success("绑定银行卡成功！");
                    $("#updateTeacherModal").modal("hide");//hide关
                    $("#txLog-list").bootstrapTable("refresh");
                }
            },"json");
    }

</script>

</body>
</html>
