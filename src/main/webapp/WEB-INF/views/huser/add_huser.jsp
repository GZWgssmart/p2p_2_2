<%--
  Created by IntelliJ IDEA.
  User: qiu
  Date: 2018/1/2
  Time: 10:47
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
    <link rel="stylesheet" href="<%=path%>/static/ztree/css/demo.css" type="text/css">
    <link rel="stylesheet" href="<%=path%>/static/ztree/css/zTreeStyle/zTreeStyle.css" type="text/css">
    <%@include file="../common/css/css_sweetalert.jsp"%>
</head>
<body>
<div class="container">
<div  style="margin-top: 30px;">
    <form class="form-horizontal" id="addHuser">
        <div class="form-group">
            <div class="col-sm-2 control-label">用户名</div>
            <div class="col-sm-10">
                <input type="text" class="form-control" name="huname" placeholder="用户名"/>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-2 control-label">邮箱</div>
            <div class="col-sm-10">
                <input type="text" class="form-control"  name="email" placeholder="邮箱"/>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-2 control-label">手机</div>
            <div class="col-sm-10">
                <input type="text" class="form-control"  name="phone" placeholder="手机"/>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-2 control-label">姓名</div>
            <div class="col-sm-10">
                <input type="text" class="form-control" name="rname" placeholder="姓名"/>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-2 control-label">性别</div>
            <div class="col-sm-10">
                <label class="radio-inline">
                    <input type="radio" name="sex" id="inlineRadio1" value="男" checked> 男
                </label>
                <label class="radio-inline">
                    <input type="radio" name="sex" id="inlineRadio2" value="女"> 女
                </label>
            </div>
        </div>
        <div class="form-inline clearfix" style="margin-top:30px;margin-left:26px;">
            <div class="form-group col-md-6">
                <strong class="col-sm-5 control-label">功能权限</strong>
                <div class="col-sm-10 col-lg-offset-3">
                    <ul id="roleTree" class="ztree"></ul>
                </div>
            </div>
        </div>
        <div class="form-group" style="margin-top: 10px">
            <div class="col-sm-2 control-label"></div>
            <input type="button" class="btn btn-primary" onclick="addHuser()" value="确定"/>
            &nbsp;&nbsp;<a type="button" class="btn btn-warning" a href="javascript:history.go(-1)">返回</a>
        </div>
    </form>
</div>
</div>
<%@include file="../common/js/js_sweetalert.jsp"%>
<script src="<%=path%>/static/js/bootstrap.min.js"></script>
<script src="<%=path%>/static/js/our/site_bootstrap_table.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path%>/static/ztree/js/jquery.ztree.core.js"></script>
<script type="text/javascript" src="<%=path%>/static/ztree/js/jquery.ztree.excheck.js"></script>
<script type="text/javascript" src="<%=path%>/static/ztree/js/jquery.ztree.exedit.js"></script>
<script>
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
                rootPId : -1
            }
        },
        callback:{
            onAsyncSuccess:expandAll
        },
        async : {
            enable : true,  // 采用异步方式获取所有节点数据,默认false
            url : "/role/list_treeVO"
        }
    };

    function expandAll() {
        var treeObj = $.fn.zTree.getZTreeObj("roleTree");
        treeObj.expandAll(true);
    }

    $(document).ready(function(){
        $.fn.zTree.init($("#roleTree"), setting);
    });


    function addHuser() {
        var treeObj = $.fn.zTree.getZTreeObj("roleTree");
        var nodes1 = treeObj.getCheckedNodes(true);
        var roleIds = "";
        for(i = 0; i<nodes1.length; i++){
            roleIds = roleIds + nodes1[i].id + ",";
        }

        $.post("" + "/huser/add?roleIds="+roleIds,
            $("#addHuser").serialize(),
            function (data) {
                if (data.result === 'success') {
                    swal(data.message,"","success");
                    $(":text").val("");
                    var treeObj = $.fn.zTree.getZTreeObj("roleTree");
                    treeObj.checkAllNodes(false);
                } else {
                    swal(data.message,"","error");
                }
            }
        );
    }
</script>
</body>
</html>
