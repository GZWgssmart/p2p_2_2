<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>Title</title>
    <link href="<%=path%>/static/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=path%>/static/ztree/css/zTreeStyle/zTreeStyle.css" type="text/css">
    <%@include file="../common/css/css_sweetalert.jsp" %>
    <%@include file="../common/css/css_bootstrap-table.jsp" %>
    <style>
        #tkmoney-error{
            color: red;
        }
    </style>
</head>
<body>

    <div>
        <div id="toolbar">
            <button class="btn btn-primary" onclick="openAddModel()">添加</button>
            <button onclick="deleteTicket()" class="btn btn-primary">删除</button><br/>
            <form class="form-inline" id="serachForm">
                <div class="form-inline" role="form">
                    <div class="form-group">
                        <span>类型</span>
                        <select name ="type" class="form-control">
                            <option value="2">平台发布</option>
                            <option value="1">邀请好友</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <span>价值</span>
                        <input name="tkmoney" class="form-control w70" type="text" >
                    </div>
                    <div class="form-group">
                        <span>失效时间</span>
                        <input id="serachTktime" name="tktime" class="form-control w70" type="date" >
                    </div>
                    <div class="form-group">
                        <span>创建时间</span>
                        <input id="createTime" name="createTime" class="form-control w70" type="date" >
                    </div>
                    <a herf="javascript:void(0)" onclick="serach()" class="btn btn-primary">搜索</a>
                </div>
            </form>
        </div>
        <table id="allTicket"
               data-toggle="table"
               data-show-columns="false"
               data-height="460"
               data-toolbar="#toolbar"
               data-click-to-select="true"
               data-show-refresh="true"
               data-cookie="true"
               data-cookie-id-table="saveId"
               data-pagination="true"
               data-search="false"
               data-url="<%=path%>/ticket/pager_criteria"
               data-side-pagination="server">
            <thead>
            <tr>
                <th data-checkbox="true"></th>
                <th data-field="type" data-formatter=formatType>类型</th>
                <th data-field="tkmoney" data-formatter=formatMoney>价值</th>
                <th data-field="tktime" data-formatter=formatDate>失效时间</th>
                <th data-field="createTime" data-formatter=formatDate>创建时间</th>
            </tr>
            </thead>

        </table>


    </div>

    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title" id="myModalLabel">用户详情</h4>
                </div>
                <div class="modal-body">
                    <div>
                        <form class="form-horizontal"  id="addTicket">
                            <div class="form-group">
                                <div class="col-sm-2 control-label">价值</div>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control"  name="tkmoney" id="tkmoney"
                                           placeholder="价值"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-2 control-label">失效时间</div>
                                <div class="col-sm-10">
                                    <input type="date" class="form-control" name="tktime" id="tktime" placeholder="失效时间"/>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" onclick="addTicket()">添加</button>
                </div>
            </div>
        </div>
    </div>



</body>
<!-- 全局js -->
<script src="<%=path%>/static/js/jquery.min.js"></script>
<script src="<%=path%>/static/js/bootstrap.min.js"></script>
<script src="<%=path%>/static/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
<script src="<%=path%>/static/js/plugins/bootstrap-table/bootstrap-table-mobile.min.js"></script>
<script src="<%=path%>/static/js/our/site_bootstrap_table.js"></script>
<script src="<%=path%>/static/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
<%@include file="../common/js/js_form.jsp" %>
<%@include file="../common/js/js_sweetalert.jsp" %>
<%@include file="../common/js/js_boostrap_table.jsp"%>
<script type="text/javascript" src="<%=path%>/static/ztree/js/jquery.ztree.core.js"></script>
<script type="text/javascript" src="<%=path%>/static/ztree/js/jquery.ztree.excheck.js"></script>
<script type="text/javascript" src="<%=path%>/static/ztree/js/jquery.ztree.exedit.js"></script>
<script>
    $(function () {
        setTable.setBootstrapTable('allTicket');
    });

    $(function () {
        return $('#serachForm').validate({
            onfocusout: function (element) {
                $(element).valid();
            },
            debug: false,
            onkeyup: false,
            rules: {
                'tkmoney': {
                    required: false,
                    isFloat: true
                },
            },
            messages: {
                'tktime':"请选择失效时间"
            }
        });
    })

    var contextPath = "";



    function serach() {
        if($('#serachForm').valid()){
            var a = $('#serachTktime').val();
            var b= $('#createTime').val();
            if(a != null && b != null){
                if(b < a){
                    setTable.doSearch("serachForm","allTicket","/ticket/pager_criteria");
                }else{
                    swal("失效时间必须大于创建时间","","warning");
                }
            }else {
                setTable.doSearch("serachForm","allTicket","/ticket/pager_criteria");
            }
        }
    }

    function openAddModel() {
        $(':text').val("");
        $('#tktime').val("");
        $('#myModal').modal();
        return $('#addTicket').validate({
            onfocusout: function (element) {
                $(element).valid();
            },
            debug: false,
            onkeyup: false,
            rules: {
                'tkmoney': {
                    required: true,
                    isFloat: true
                },
                'tktime': {
                    required: true,

                },
            },
            messages: {
                'tktime':"请选择失效时间"
            }
        });
    }
    
    function deleteTicket() {
        var select = $("#allTicket").bootstrapTable('getSelections');
        if (select.length > 0) {
            var ticketIds = "";
            for (i = 0; i < select.length; i++) {
                ticketIds = ticketIds + select[i].umid + ',';
            }
            $.post(contextPath + "/ticket/deletes",
                {"ticketIds": ticketIds},
                function (data) {
                    if (data.result == 'success') {
                        $("#allTicket").bootstrapTable('refresh');
                        swal(data.message, "", "success");
                    } else {
                        swal(data.message, "", "error");
                    }
                }, "json"
            );
        } else {
            swal("请选择数据", "", "warning");
        }
    }

    function addTicket() {
        if($('#addTicket').valid()){
            $.post("/ticket/add_by_admin",
                $("#addTicket").serialize(),
                function (data) {
                    if (data.result === 'success') {
                        swal(data.message, "", "success");
                        $('#allTicket').bootstrapTable("refresh");
                        $('#myModal').modal('hide');
                    } else {
                        swal(data.message, "", "error");
                    }
                }
            );
        }
    }
    
    function formatType(value) {
        if(value === 1){
            return "邀请好友";
        }else if(value === 2){
            return "平台发布";
        }

    }
    
    function formatMoney(value) {
        return "￥"+value+".00";
    }

    function formatDate(value) {
        if (value == undefined || value == null || value == '') {
            return "";
        } else {
            var date = new Date(value);
            var year = date.getFullYear().toString();
            var month = (date.getMonth() + 1);
            var day = date.getDate().toString();
            var hour = date.getHours().toString();
            var minutes = date.getMinutes().toString();
            var seconds = date.getSeconds().toString();
            if (month < 10) {
                month = "0" + month;
            }
            if (day < 10) {
                day = "0" + day;
            }
            if (hour < 10) {
                hour = "0" + hour;
            }
            if (minutes < 10) {
                minutes = "0" + minutes;
            }
            if (seconds < 10) {
                seconds = "0" + seconds;
            }
            return year + "-" + month + "-" + day + " " + hour + ":" + minutes + ":" + seconds;
        }
    }
</script>
</html>
