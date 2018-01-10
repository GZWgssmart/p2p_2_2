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
</head>
<body>

    <div>
        <h4 >所有用户</h4>
        <div id="toolbar">
            <a class="btn btn-primary" style="text-decoration:none" href="<%=path%>/huser/add_huser_page">添加</a>
            <button id="seeButton" class="btn btn-primary" onclick="seeDetail()">查看详情</button>
            <button onclick="deleteHuser()" class="btn btn-primary">删除</button>
        </div>
        <table id="allHuser"
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
               data-url="<%=path%>/huser/list_pager"
               data-side-pagination="server">
            <thead>
            <tr>
                <th data-checkbox="true"></th>
                <th data-field="huname">用户名</th>
                <th data-field="rname">真实姓名</th>
                <th data-field="email">邮箱</th>
                <th data-field="phone">手机</th>
                <th data-field="sex">性别</th>
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
                        <form class="form-horizontal" id="addHuser">
                            <input id="huid" name="huid" type="hidden">
                            <div class="form-group">
                                <div class="col-sm-2 control-label">用户名</div>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="huname" id="huname"
                                           placeholder="用户名"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-2 control-label">邮箱</div>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="email" id="email" placeholder="邮箱"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-2 control-label">手机</div>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="phone" id="phone" placeholder="手机"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-2 control-label">姓名</div>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="rname" id="rname" placeholder="姓名"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-2 control-label">性别</div>
                                <div class="col-sm-10">
                                    <label class="radio-inline">
                                        <input type="radio" name="sex" id="men" value="男" checked> 男
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="sex" id="women" value="女"> 女
                                    </label>
                                </div>
                            </div>
                            <div class="form-inline clearfix" style="margin-top:30px;margin-left:26px;">
                                <div class="form-group col-md-6">
                                    <strong class="col-sm-5 control-label">拥有角色</strong>
                                    <div class="col-sm-10 col-lg-offset-3">
                                        <ul id="roleTree" class="ztree"></ul>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" onclick="updateHuser()">保存</button>
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
<script type="text/javascript" src="<%=path%>/static/ztree/js/jquery.ztree.core.js"></script>
<script type="text/javascript" src="<%=path%>/static/ztree/js/jquery.ztree.excheck.js"></script>
<script type="text/javascript" src="<%=path%>/static/ztree/js/jquery.ztree.exedit.js"></script>
<script>
    $(function () {
        setTable.setBootstrapTable('allHuser');
    });

    var contextPath = "";

    function deleteHuser() {
        var select = $("#allHuser").bootstrapTable('getSelections');
        if (select.length > 0) {
            var huserIds = "";
            for (i = 0; i < select.length; i++) {
                huserIds = huserIds + select[i].huid + ',';
            }
            $.post(contextPath + "/huser/deletes",
                {"huserIds": huserIds},
                function (data) {
                    if (data.result == 'success') {
                        $("#allHuser").bootstrapTable('refresh');
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

    function seeDetail() {
        var select = $("#allHuser").bootstrapTable('getSelections');
        if (select.length === 1) {
            var huserId = select[0].huid;
            $(":text").val("");
            $("#huid").val("");
            $('#myModal').modal();

            $('#huid').val(select[0].huid);
            $('#rname').val(select[0].rname);
            $('#huname').val(select[0].huname);
            $('#phone').val(select[0].phone);
            $('#email').val(select[0].email);
            if (select[0].sex === '男') {
                $('#men').prop('checked', true);
            } else if (select[0].sex === '女') {
                $('#men').prop('checked', false);
                $('#women').prop('checked', true);
            }

            var setting = {
                check: {
                    enable: true,
                    chkStyle: "checkbox",
                    chkboxType: {"Y": "ps", "N": "ps"}
                },
                data: {
                    simpleData: {
                        enable: true,
                        idKey: "id",       // 结点的id,对应到Json中的id
                        rootPId: -1
                    }
                },
                callback: {
                    onAsyncSuccess: expandAll
                },
                async: {
                    enable: true,  // 采用异步方式获取所有节点数据,默认false
                    url: "/role/list_treeVO?huserId=" + huserId
                }
            };

            function expandAll() {
                var treeObj = $.fn.zTree.getZTreeObj("roleTree");
                treeObj.expandAll(true);
            }

            $(document).ready(function () {
                $.fn.zTree.init($("#roleTree"), setting);
            });


        } else {
            swal("请选择一行数据", "", "warning");
        }

        return $('#addHuser').validate({
            onfocusout: function (element) {
                $(element).valid();
            },
            debug: false,
            onkeyup: false,
            rules: {
                'huname': {
                    required: true
                },
                'email': {
                    required: true,
                    isEmail: true
                },
                'phone': {
                    required: true,
                    isMobile: true
                },
                'rname': {
                    required: true,
                    isName: true
                },
            },
            messages: {}
        });
    }

    function updateHuser() {
        if ($('#addHuser').valid()) {
            var treeObj = $.fn.zTree.getZTreeObj("roleTree");
            var nodes1 = treeObj.getCheckedNodes(true);
            var roleIds = "";
            for (i = 0; i < nodes1.length; i++) {
                roleIds = roleIds + nodes1[i].id + ",";
            }

            $.post("" + "/huser/update?roleIds=" + roleIds,
                $("#addHuser").serialize(),
                function (data) {
                    if (data.result === 'success') {
                        swal(data.message, "", "success");
                        $('#allHuser').bootstrapTable("refresh");
                        $('#myModal').modal('hide');
                    } else {
                        swal(data.message, "", "error");
                    }
                }
            );
        }
    }
</script>
</html>
