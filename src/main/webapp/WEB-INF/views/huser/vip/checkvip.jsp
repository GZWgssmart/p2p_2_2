<%--
  Created by IntelliJ IDEA.
  User: xdp
  Date: 2018/1/18
  Time: 10:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%String path = request.getContextPath();%>
<html>
<head>
    <title>审核VIP</title>
    <%@include file="../../common/css/css_bootstrap.jsp" %>
    <%@include file="../../common/css/css_bootstrap-table.jsp" %>
    <%@include file="../../common/css/css_sweetalert.jsp" %>
    <%@include file="include_checkVip.jsp" %>
    <%@include file="include_user_look_detail.jsp"%>
</head>
<body>
<div class="tool-bar" id="tool-bar">
    <a class="btn btn-primary" href="javascript:void(0);" onclick="lookCheckDetail.lookDetail();">查看内容</a>
    <a class="btn btn-success" href="javascript:void(0);" onclick="lookCheckDetail.checkPass();">审核通过</a>
    <a class="btn btn-danger" href="javascript:void(0);" onclick="lookCheckDetail.checkNoPass();">拒绝通过</a>
    <a class="btn btn-warning" href="javascript:void(0);" onclick="lookCheckDetail.lookDetail();">搜索</a>
</div>
<table id="checkVip-list" class="table table-hover"
       data-url="<%=path%>/rzvip/pager_criteria">
    <thead>
    <tr>
        <th data-checkbox="true"></th>
        <th data-field="uName">申请人</th>
        <th data-field="huid">审核人</th>
        <th data-field="isok"  data-formatter="txCheck.fmt.fmtState">审核是否通过</th>
        <th data-field="excuse">审核理由</th>
        <th data-field="date" data-formatter="setTable.formatDate">审核时间</th>
    </tr>
    </thead>
</table>

<%@include file="../../common/js/js_jquery.jsp" %>
<%@include file="../../common/js/js_boostrap.jsp" %>
<%@include file="../../common/js/js_boostrap_table.jsp" %>
<%@include file="../../common/js/js_sweetalert.jsp" %>
<%@include file="../../common/js/js_form.jsp" %>
<%@include file="../../common/js/js_data_dict.jsp" %>
<script>
    $(function () {
        setTable.setBootstrapTable('checkVip-list');
    });
</script>
<script src="<%=path%>/static/js/our/jquery-form.js"></script>
<script src="<%=path%>/static/js/our/huser/lmh/tx_check.js"></script>

<script>

    var lookCheckDetail = {
        lookDetail:function () {
            var row = setTable.isSingleSelected('checkVip-list');
            if(row) {
                $.get('/user/rz_info/' + row.uid,
                    function (data) {
                        $('#face').attr('src', contextPath + data.rnid);
                        $('#look-detail-form').form('load',data);
                    },'json');
                setTable.showModal('look-detail-modal');
            }
        },
        //审核不通过
        checkNoPass:function(){
            var row = setTable.isSingleSelected('checkVip-list');
            if(row) {
                var jsonData = {
                    'rcid': row.rcid,
                    'txid': row.txid,
                    'isok': 0,
                    'excuse': excuse
                };
                $.post(contentPath + '/rzvip/check',
                    jsonData,
                    function(date) {
                        if(date.result === 'success') {
                            swtAlert.request_success(date.message);
                            setTable.postRefresh('checkVip-list');
                            setTable.hideModal('look-checkvip-modal')
                        }else {
                            swtAlert.request_fail(date.message);
                        }
                    }
                );
            }
        },
        //审核通过
        checkPass:function () {
            var row = setTable.isSingleSelected('checkVip-list');
            if(row) {
                if(row.state === 2) {
                    var jasonData = {
                        'rcnid' : row.rcid,
                        'uid' : row.huid,
                        'isok' : 1,
                        'execute' : ''
                    };
                    swal({
                        title : dataDict.manage.checkConfirm,
                        text : dataDict.manage.noCancelMsg,
                        type : 'waring',
                        showCancelButton : true
                    }).then(function (check) {
                        if(check.value) {
                            $.post(contextPath + '/rzvip/check',
                                jasonData,
                                function (date) {
                                    if(date.result === 'success') {
                                        swtAlert.request_success(data.message);
                                        setTable.postRefresh('checkVip-list');
                                    }else {
                                        swtAlert.request_fail(date.message);
                                    }
                                },'json'
                            );
                        }
                    });
                } else {
                    swtAlert.warnNoTimer("请选择一条数据进行操作");
                }
            }
        }

    };

</script>
</body>
</html>
