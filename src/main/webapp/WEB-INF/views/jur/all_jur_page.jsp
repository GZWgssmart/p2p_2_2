<%--
  Created by IntelliJ IDEA.
  User: qiu
  Date: 2018/1/4
  Time: 16:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>Title</title>
    <link href="<%=path%>/static/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=path%>/static/ztree/css/zTreeStyle/zTreeStyle.css" type="text/css">
    <%@include file="../common/css/css_sweetalert.jsp"%>
    <%@include file="../common/css/css_bootstrap-table.jsp" %>
</head>
<body>
<div>
    <div>
        <h4>所有权限</h4>
        <div id="toolbar">
            <button  class="btn btn-primary" onclick="openAddJur()" >添加权限</button>
            <button class="btn btn-primary" onclick="deleteJur()">删除</button>
        </div>
        <table id="allJur"
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
               data-url="<%=path%>/jur/list_pager"
               data-side-pagination="server">
            <thead>
            <tr>
                <th data-checkbox="true"></th>
                <th data-field="name" >名称</th>
                <th data-field="url" data-formatter=nullToString>url</th>
                <th data-field="perms" data-formatter=nullToString>授权</th>
            </tr>
            </thead>

        </table>
    </div>

    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">角色详情</h4>
                </div>
                <div class="modal-body">
                    <div >
                        <form class="form-horizontal" id="addJur">
                            <div class="form-group">
                                <div class="col-sm-2 control-label">权限名称</div>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="rname" name="name" placeholder="权限名称"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-2 control-label">url</div>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="url" name="url" placeholder="url"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-2 control-label">授权</div>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="perms" name="perms" placeholder="授权 如 user:list"/>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" onclick="addJur()">保存</button>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="<%=path%>/static/js/jquery.min.js"></script>
<script src="<%=path%>/static/js/bootstrap.min.js"></script>
<script src="<%=path%>/static/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
<script src="<%=path%>/static/js/our/site_bootstrap_table.js"></script>
<script src="<%=path%>/static/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
<%@include file="../common/js/js_sweetalert.jsp" %>
<%@include file="../common/js/js_form.jsp" %>
<script type="text/javascript" src="<%=path%>/static/ztree/js/jquery.ztree.core.js"></script>
<script type="text/javascript" src="<%=path%>/static/ztree/js/jquery.ztree.excheck.js"></script>
<script type="text/javascript" src="<%=path%>/static/ztree/js/jquery.ztree.exedit.js"></script>
<script>

    $(function () {
        return $('#addJur').validate({
            onfocusout: function(element){
                $(element).valid();
            },
            debug:false,
            onkeyup:false,
            rules:{
                'name':{
                    required: true,
                },
                'url':{
                    required: true,
                },
                'perms':{
                    required: true,
                }
            },
            messages:{
            }
        });
    })
    function nullToString(value){
        if(value != null){
            return value;
        }else{
            return "";
        }
    }


    function openAddJur() {
        $("#myModal").modal('show');
    }

    function addJur() {
        if($('#addJur').valid()){
            $.post("/jur/add",
                $('#addJur').serialize(),
                function (data) {
                    if (data.result === 'success') {
                        swal(data.message,"","success");
                        $('#allJur').bootstrapTable("refresh");
                        $("#myModal").modal('hide');
                    } else {
                        swal(data.message,"","error");
                    }
                }
            );
        }
    }


    function deleteJur() {
        var select= $("#allJur").bootstrapTable('getSelections');
        if(select.length > 0){
            var jurIds = "";
            for(i = 0; i<select.length; i++){
                jurIds = jurIds + select[i].id + ",";
            }
            $.post("/jur/deletes",
                {"jurIds":jurIds},
                function (data) {
                    if (data.result === 'success') {
                        swal(data.message,"","success");
                        $('#allJur').bootstrapTable("refresh");
                    } else {
                        swal(data.message,"","error");
                    }
                }
            );
        }else{
            swal("请选择一行数据","","warning");
        }
    }
</script>
</body>
</html>
