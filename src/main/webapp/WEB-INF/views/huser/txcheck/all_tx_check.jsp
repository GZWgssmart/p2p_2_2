<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <form id="okborrow-search-form" class="form-inline">
        
        <a href="javascript:void(0);" onclick="txCheck.submit.checkOk();"
                class="btn btn-primary">审核通过
        </a>
        <a href="javascript:void(0);" onclick="txCheck.open.checkNo();"
                class="btn btn-success">审核不通过
        </a>
    </form>
</div>
<table id="txCheck-list" class="table table-hover"
       data-single-select="true"
       data-url="<%=path%>/tx_check/pager_criteria">
    <thead>
    <tr>
        <th data-checkbox="true"></th>
        <th data-field="uName">申请人</th>
        <th data-field="hName">审核人</th>
        <th data-field="money">提现金额（元）</th>
        <th data-field="bankcard">提现卡号</th>
        <th data-field="banktype">所属银行</th>
        <th data-field="date" data-formatter="setTable.formatDate">申请时间</th>
        <th data-field="state" data-formatter="txCheck.fmt.fmtState">审核状态</th>
    </tr>
    </thead>
</table>

<div class="modal fade bs-example-modal-lg" id="save-excuse-modal" tabindex="-1" role="dialog"
     aria-labelledby="myLargeModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">提现审核</h4>
            </div>
            <div class="modal-body">
                <form id="save-excuse-form" class="form-horizontal">
                    <div class="form-group">
                        <label for="excuse-input" class="col-sm-2 control-label">审核理由</label>
                        <div class="col-sm-10">
                            <input name="excuse" class="form-control" id="excuse-input" placeholder="输入您的审核理由！">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <input type="reset" class="btn btn-default" value="重置"/>
                        <a href="javascript:void(0);" onclick="txCheck.submit.checkNo();"
                           class="btn btn-primary">确认</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<%@include file="../../common/js/js_jquery.jsp" %>
<%@include file="../../common/js/js_boostrap.jsp" %>
<%@include file="../../common/js/js_boostrap_table.jsp" %>
<%@include file="../../common/js/js_sweetalert.jsp" %>
<%@include file="../../common/js/js_form.jsp" %>
<%@include file="../../common/js/js_data_dict.jsp" %>

<script src="<%=path%>/static/js/our/huser/lmh/tx_check.js"></script>
<script>

    $(function () {
        setTable.setBootstrapTable('txCheck-list');
    });

    //如果点击了提现不通过
    function openAddExcuseView() {
        //判断是否选中数据
        var rows = setTable.isSingleSelected('txLog-list');
        if (rows.state === 2) {
            //if(rows) 如果选中了就会进入if判断
            if (rows) {
                //打开模态款
                $("#updateTeacherModal").modal("show");//hide关
                var row = setTable.isSingleSelected("txLog-list");
                //在保存提现理由是需要保存提现记录的ID，这里设置隐藏输入框的值以便后台获取。
                $("#tid").val(row.tid);
            }
        } else {
            //弹出确认框
            swal({
                title: '提现审核只能操作一次！',
                type: 'warning',
                showCancelButton: true
            }).then(function (isConfirm) {
                //点击确定后做什么。。。。。。。。
                if (isConfirm.value) {

                }
            });
        }

    }

    //点击提现审核通过后进入后台
    function txCheckSuccess() {
        var rows = setTable.isSingleSelected('txLog-list');
        var tid = rows.tid;
        var uid = rows.uid;
        var money = rows.money;
        if (rows.state == 2) {
            if (rows) {
                swal({
                    title: '你确定提现审核通过？',
                    text: dataDict.manage.noCancelMsg,
                    type: 'warning',
                    showCancelButton: true
                }).then(function (isConfirm) {
                    if (isConfirm.value) {
                        $.post("<%=path%>/txCheck/TxCheckSuccess",
                            {
                                tid: tid, uid: uid, money: money
                            },
                            function (data) {
                                if (data.result === "success") {
                                    swtAlert.request_success("审核通过！");
                                    $("#txLog-list").bootstrapTable("refresh");
                                }
                            }, "json");
                    }
                });
            }
        } else {
            swal({
                title: '提现审核只能操作一次！',
                type: 'warning',
                showCancelButton: true
            }).then(function (isConfirm) {
                if (isConfirm.value) {

                }
            });
        }

    }

    //点击提交提现理由后进入后台
    function TxCheckNoSuccess() {
        $.post("<%=path%>/txCheck/TxCheckNoSuccess",
            $("#addEmailForm").serialize(),
            function (data) {
                if (data.result === "success") {
                    //弹出自动关闭的提示框
                    swtAlert.request_success("提交审核理由成功！");
                    $("#updateTeacherModal").modal("hide");//hide关
                    $("#txLog-list").bootstrapTable("refresh");
                }
            }, "json");
    }
</script>

</body>
</html>
