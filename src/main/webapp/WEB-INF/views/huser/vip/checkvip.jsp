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

</head>
<body>
<div class="tool-bar" id="tool-bar">
    <a class="btn btn-success" href="javascript:void(0);" onclick="checkVip.checkPass();">审核通过</a>
    <a class="btn btn-danger" href="javascript:void(0);" onclick="checkVip.open.checkNo();">拒绝通过</a>
    <a class="btn btn-primary" href="javascript:void(0);" onclick="checkVip.lookDetail();">查看内容</a>
</div>
<table id="checkVip-list" class="table table-hover"
       data-single-select="true"
       data-url="<%=path%>/rzvip/pager_criteria">
    <thead>
    <tr>
        <th data-checkbox="true"></th>
        <th data-field="uName">申请人</th>
        <th data-field="hName">审核人</th>
        <th data-field="isok" data-formatter="checkVip.fmt.fmtState">状态</th>
        <th data-field="excuse">审核理由</th>
        <th data-field="date" data-formatter="setTable.formatDate">审核时间</th>
    </tr>
    </thead>
</table>

<%@include file="include_chen_no.jsp" %>
<%@include file="include_user_look_detail.jsp" %>

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
<script>

    var checkVip = {
        lookDetail: function () {
            var row = setTable.isSingleSelected('checkVip-list');
            if (row) {
                $.get('/user/rz_info/' + row.uid,
                    function (data) {
                        $('#face-img').attr('src', contextPath + data.face);
                        data['registerTime'] = setTable.formatDate(data['registerTime']);
                        $('#look-detail-form').form('load', data);
                    }, 'json');
                setTable.showModal('look-detail-modal');
            }
        },
        //审核不通过
        checkNoPass: function () {
            var row = setTable.isSingleSelected('checkVip-list');
            if (row) {
                var excuseInput = $('#excuse-input');
                var jsonData = {
                    'rcid': row.rcid,
                    'uid': row.uid,
                    'isok': 0,
                    'excuse': excuseInput.val()
                };
                $.post(contextPath + '/rzvip/check',
                    jsonData,
                    function (date) {
                        if (date.result === 'success') {
                            swtAlert.request_success(date.message);
                            setTable.postRefresh('checkVip-list');
                            setTable.hideModal('check-modal');
                            excuseInput.val('');
                        } else {
                            swtAlert.request_fail(date.message);
                        }
                    }
                );

            }
        },
        //审核通过
        checkPass: function () {
            var row = setTable.isSingleSelected('checkVip-list');
            if (row) {
                if (row.isok !== 1) {
                    var jasonData = {
                        'rcid': row.rcid,
                        'uid': row.uid,
                        'isok': 1,
                        'excuse': ''
                    };
                    swal({
                        title: dataDict.manage.checkConfirm,
                        text: dataDict.manage.noCancelMsg,
                        type: 'warning',
                        showCancelButton: true
                    }).then(function (check) {
                        if (check.value) {
                            $.post(contextPath + '/rzvip/check',
                                jasonData,
                                function (data) {
                                    if (data.result === 'success') {
                                        swtAlert.request_success(data.message);
                                        setTable.postRefresh('checkVip-list');
                                    } else {
                                        swtAlert.request_fail(data.message);
                                    }
                                }, 'json');
                        }
                    });
                } else {
                    swtAlert.warnNoTimer("无需再次审核");
                }
            }
        },
        open: {
            checkNo: function () {
                var row = setTable.isSingleSelected('checkVip-list');
                if (row) {
                    if (row.isok === 2) {
                        setTable.showModal('check-modal');
                    } else {
                        swtAlert.warnNoTimer("请选择 审核中 的数据进行操作");
                    }
                }
            }
        },
        fmt: {
            fmtState: function (value) {
                if (value === 0) {
                    return '拒绝通过'
                } else if(value === 1) {
                    return '已通过';
                } else {
                    return '审核中';
                }
            }
        }
    };

</script>
</body>
</html>
