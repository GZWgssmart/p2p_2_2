<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path  = request.getContextPath();
%>
<html>
<head>
    <title>Title</title>
    <link href="<%=path%>/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=path%>/static/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=path%>/static/ztree/css/demo.css" type="text/css">
    <link rel="stylesheet" href="<%=path%>/static/ztree/css/zTreeStyle/zTreeStyle.css" type="text/css">
    <%@include file="../common/css/css_sweetalert.jsp" %>
</head>
<body>
<div>
    <h4>所有角色</h4>
    <div id="toolbar">
        <a  class="btn btn-primary" style="text-decoration:none" href="<%=path%>/role/add_role_page">添加角色</a>
        <button id="seeButton" class="btn btn-primary" onclick="seeDetail()">查看详情</button>
        <button class="btn btn-primary" onclick="deleteRole()">删除</button>
    </div>
    <table id="allRole"
           data-toggle="table"
           data-show-columns="false"
           data-height="460"
           data-toolbar="#toolbar"
           data-click-to-select="true"
           data-cookie="true"
           data-cookie-id-table="saveId"
           data-pagination="true"
           data-search="false"
           data-url="<%=path%>/role/list_pager"
           data-side-pagination="server">
        <thead>
        <tr>
            <th data-checkbox="true"></th>
            <th data-field="rname" >角色名称</th>
            <th data-field="content">备注</th>
            <th data-field="createTime"  data-formatter=formatDate>创建时间</th>
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
                    <form class="form-horizontal" id="addRole">
                        <input id="jid" name="jid" type="hidden">
                        <div class="form-group">
                            <div class="col-sm-2 control-label">角色名称</div>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="rname" name="rname" placeholder="角色名称"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-2 control-label">备注</div>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="content" name="content" placeholder="备注"/>
                            </div>
                        </div>
                        <div class="form-inline clearfix" style="margin-top:30px;margin-left:26px;">
                            <div class="form-group col-md-6">
                                <strong class="col-sm-5 control-label">功能权限</strong>
                                <div class="col-sm-10 col-lg-offset-3">
                                    <ul id="jurTree" class="ztree"></ul>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="updateRole()">保存</button>
            </div>
        </div>
    </div>
</div>

</body>
<%@include file="../common/js/js_sweetalert.jsp" %>
<script src="<%=path%>/static/js/jquery.min.js"></script>
<script src="<%=path%>/static/js/bootstrap.min.js"></script>
<script src="<%=path%>/static/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
<script src="<%=path%>/static/js/our/site_bootstrap_table.js"></script>
<script src="<%=path%>/static/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
<script type="text/javascript" src="<%=path%>/static/ztree/js/jquery.ztree.core.js"></script>
<script type="text/javascript" src="<%=path%>/static/ztree/js/jquery.ztree.excheck.js"></script>
<script type="text/javascript" src="<%=path%>/static/ztree/js/jquery.ztree.exedit.js"></script>

<script>
    $(function () {
        setTable.setBootstrapTable('allRole');
    });
    var contextPath = '';



    function seeDetail() {
        var select= $("#allRole").bootstrapTable('getSelections');
        if(select.length === 1){
            var roleId = select[0].jid;
            $(":text").val("");
            $(":hidden").val("");
            $('#myModal').modal();
            $('#rname').val(select[0].rname);
            $('#content').val(select[0].content);
            $('#jid').val(select[0].jid);
            var setting = {
                check: {
                    enable: true,
                    chkStyle: "checkbox",
                    chkboxType: { "Y": "ps", "N": "ps" }
                },
                data: {
                    simpleData: {
                        enable: true,
                        idKey : "id",       // 结点的id,对应到Json中的id
                        pIdKey : "parentId",// 结点的pId,对应到Json中的parentId
                        rootPId : -1
                    }
                },
                callback:{
                    onAsyncSuccess:expandAll
                },
                async : {
                    enable : true,  // 采用异步方式获取所有节点数据,默认false
                    url : "/jur/list_treeVO?roleId="+roleId
                }
            };

            function expandAll() {
                var treeObj = $.fn.zTree.getZTreeObj("jurTree");
                treeObj.expandAll(true);
            }

            $(document).ready(function(){
                $.fn.zTree.init($("#jurTree"), setting);
            });

        }else{
            swal("请选择一行数据","","warning");
        }
    }

    function updateRole() {
        var treeObj = $.fn.zTree.getZTreeObj("jurTree");
        var nodes1 = treeObj.getCheckedNodes(true);
        var jurIds = "";
        for(i = 0; i<nodes1.length; i++){
            jurIds = jurIds + nodes1[i].id + ",";
        }

        $.post("" + "/role/update?jurIds="+jurIds,
            $("#addRole").serialize(),
            function (data) {
                if (data.result === 'success') {
                    swal(data.message,"","success");
                    $('#allRole').bootstrapTable("refresh");
                    $('#myModal').modal('hide');

                } else {
                    swal(data.message,"","error");
                }
            }
        );
    }

    function deleteRole() {
        var select= $("#allRole").bootstrapTable('getSelections');
        if(select.length > 0){
            var roleIds = "";
            for(i = 0; i < select.length; i++){
               roleIds = roleIds + select[i].jid +',';
            }
            $.post(contextPath + "/role/deletes",
                {"roleIds":roleIds},
                function (data) {
                    if (data.result == 'success') {
                        $("#allRole").bootstrapTable('refresh');
                        swal(data.message,"","success");
                    } else {
                        swal(data.message,"","error");
                    }
                }, "json"
            );
        }else{
            swal("请选择数据","","warning");
        }
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
