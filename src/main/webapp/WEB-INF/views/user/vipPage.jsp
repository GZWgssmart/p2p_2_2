<%--
  Created by IntelliJ IDEA.
  User: 123456
  Date: 2018/1/19
  Time: 20:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="<%=path %>/static/css/bootstrap.min.css">
    <style>
        /*使表单的错误提示变为红色*/
        form .form-group div label.error {
            color:red;
        }
    </style>
</head>
<body>
<div class="container" style="text-align: center;margin-top: 60px;">
    <input type="hidden" id="rid">
    <input type="hidden" id="rcid">
    <span id="vipState" style="font-size: 22px;"></span>
    <form id="vipForm" class="form-horizontal">
        <input type="hidden" name="uid" value="${sessionScope.user.uid}"/>
        <div class="form-group">
            <label for="xl" class="col-sm-2 control-label">学历：</label>
            <div class="col-sm-8">
            <input type="text" name="xl" id="xl" class="form-control" >
            </div>
        </div>
        <div class="form-group">
            <label for="ism" class="col-sm-2 control-label"> 婚否：</label>
            <div class="col-sm-2" style="margin-left: -35px;">
                <div class="checkbox" id="ism">
                    <label><input name="ism" type="radio" value="是">是</label>
                    <label><input name="ism" type="radio" value="否">否</label>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label for="bschool" class="col-sm-2 control-label"> 毕业院校：</label>
            <div class="col-sm-8">
            <input name="bschool" id="bschool"class="form-control" >
            </div>
        </div>
        <div class="form-group">
            <label for="addr" class="col-sm-2 control-label">居住地：</label>
            <div class="col-sm-8">
                <input name="addr" id="addr" class="form-control" >
            </div>
        </div>

        <div class="form-group">
            <label for="work" class="col-sm-2 control-label">现工作：</label>
            <div class="col-sm-8">
                <input name="work" id="work" class="form-control" >
            </div>
        </div>

        <div class="form-group">
            <label for="age" class="col-sm-2 control-label">  年龄：</label>
            <div class="col-sm-8">
            <input  name="age" id="age"class="form-control" >
            </div>
        </div>
        <div id="btnDiv">
            <button style="display: none" type="button" class="btn" id="btn">提交</button>
            <button style="display: none" type="button" class="btn" id="btnCheck">重新申请</button>
        </div>
    </form>
</div>
</body>
<script type="text/javascript" src="<%=path%>/static/js/jquery.min.js"></script>
<%@include file="../common/js/js_sweetalert.jsp" %>
<script src="https://cdn.bootcss.com/jquery-validate/1.17.0/jquery.validate.min.js"></script>
<script src="<%=path%>/static/js/our/site_jquery_validate.js"></script>
<script src="https://cdn.bootcss.com/jquery-validate/1.17.0/localization/messages_zh.min.js"></script>
<script>
    $(function () {
        var isVip = "";
        $.post("/user/get_user",
            {
                uid:${sessionScope.user.uid}
            },
            function (data) {
                isVip = data.isVip+"";
                if(isVip == "1"){
                    //是vip
                    $.post("/user/isvip",
                        {
                            uid:${sessionScope.user.uid}
                        },
                        function (data) {
                            //$("#id").attr("disabled","disabled");
                            //$("#id").removeAttr("disabled");
                            $("#vipState").text("vip用户");
                            $("#vipForm input").attr("disabled","disabled");
                            $("#xl").val(data.xl);
                            $(':radio[name="ism"]').text(data.ism).attr("checked",true);
                            $("#bschool").val(data.bschool);
                            $("#addr").val(data.addr);
                            $("#work").val(data.work);
                            $("#age").val(data.age);
                        },"json"
                    );
                }else{
                    //不是vip
//          //返回数据为空   未提交审核    不为空则正在审核
                    $.post("/user/isvip",
                        {
                            uid:${sessionScope.user.uid}
                        },
                        function (data) {
                            if(data.rid == null){
                                //不是vip 且未提交审核
                                $("#vipForm input").removeAttr("disabled");
                                $("#vipState").text("申请成为vip");
                                $("#btn").show();

                            }else{
                                $("#rid").val(data.rid);
                                //不是vip 但已经提交vip申请
                                $("#vipForm input").attr("disabled","disabled");
                                $("#xl").val(data.xl);
                                $(':radio[name="ism"]').text(data.ism).attr("checked",true);
                                $("#bschool").val(data.bschool);
                                $("#addr").val(data.addr);
                                $("#work").val(data.work);
                                $("#age").val(data.age);
                                $("#btn").hide();
                                //查询审核状态
                                $.post("/rzvip/get_rzvip_by_uid",
                                    {
                                        uid:${sessionScope.user.uid}
                                    },
                                    function (data) {
                                        $("#rcid").val(data.rcid);
                                        if(data.isok == "2"){
                                            $("#vipState").text("审核中");
                                        }else if(data.isok == "0" && data.rcid != null){
                                            $("#vipState").text("审核未通过:"+data.excuse);
                                            $("#btnCheck").show();
                                        }
                                    },"json"
                                );
                            }

                        },"json"
                    );
                }
            },"json"
        )
    });

    $("#btn").click(function () {
        if ($('#vipForm').valid() === false) return;
        $.post("/user/add_check",
            $("#vipForm").serialize(),
            function (data) {
                if(data.message == "保存成功！"){
                    swtAlert.request_success(data.message);
                    setTimeout("location.reload()", 1500);
                }else{
                    swtAlert.request_fail(data.message);
                }
            },"json"
        );
    });

    $("#btnCheck").click(function () {
        $.post("/user/remove_check",
            {
                rid:$("#rid").val(),
                rcid:$("#rcid").val()
            },
            function (data) {
                if(data.message == "删除成功！"){
                    location.reload();
                }else{
                    swtAlert.request_fail(data.message);
                }
            },"json"
        );
    });

    $("#vipForm").validate({
        onfocusout: function(element){
            $(element).valid();
        },
        debug:false,
        onkeyup:false,
        rules:{
            'xl':{
                required: true
            },
            'bschool':{
                required: true
            },
            'addr':{
                required: true
            },
            'work':{
                required: true
            },
            'age':{
                required: true,
                isNumberGtZero:true
            }
        }
    });
</script>
</html>
