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
    <button class="btn btn-primary" data-toggle="modal" onclick="lookContent();">查看内容</button>
</div>
<table id="checkVip-list" class="table table-hover"
       data-url="<%=path%>/rzvip/pager_criteria">
    <thead>
    <tr>
        <th data-checkbox="true"></th>
        <th data-field="uName">申请人</th>
        <th data-field="huid">审核人</th>
        <th data-field="isok">审核是否通过</th>
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


<script>

    /*lookDetail: function () {
        var row = setTable.isSingleSelected(allShborrow.id.priTab);
        if (row) {
            $.get('/borrowdetail/getByApplyId/' + row.baid,
                function (data) {
                    $('#ypic-img').attr('src', contextPath + data.ypic);
                    $('#look-detail-form').form('load', data);
                }, 'json');
            setTable.showModal('look-detail-modal');
        }
    }*/

    var lookDetail = {
        id: {
            tableId: 'checkVip-list',
            checkForm: 'check-form',
            checkModal: 'look-checkvip-modal'
        },
        lookDetail:function () {
            var row = setTable.isSingleSelected(lookDetail.id.checkVip-list);
            if(row) {
                $.get('user/rz_info/' + row.uid,
                    function (data) {
                        $('excuse').attributes('src',contentPath + data.rnid);
                        $('#look-detail-modal').form('load',data);
                    },'json');
                setTable.showModal('look-detail-modal');
            }
        }
    };

   /* function lookContent() {
        var row = setTable.isSingleSelected('checkVip-list');
        if(row) {
            $('#look-checkvip-modal').modal('show');
            $('#content-body').html(row.content);
        }
    }*/

</script>
</body>
</html>
