<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ID.LQF
  Date: 2018/1/18
  Time: 11:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>基本信息</title>
    <link rel="stylesheet" href="<%=path %>/static/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=path%>/static/css/fileinput.css">
</head>
<body>
<div class="container">
<form class="form-horizontal " id="updateFrom" enctype='multipart/form-data'>
    <input type="hidden" name="uid" value="${sessionScope.user.uid}">
    <div class="form-group" style="margin-top: 20px;">
        <label class="col-sm-2 control-label">头像：</label>
        <div class="col-sm-7">
            <img class="img-responsive" style="width: 400px;height:300px;" src="<%=path%>${sessionScope.user.face }"/>
        </div>
    </div>
    <div class="form-group" style="margin-top: 20px;">
        <label for="face" class="col-sm-2 control-label">修改头像：</label>
        <div class="col-sm-7">
            <input id="face" name="file" class="file" type="file">
            <input type="hidden" name="face" id="realImg">
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">性别：</label>
        <c:if test='${sessionScope.user.sex == "男"}'>
            <div class="radio col-sm-7">
                <label><input type="radio" name="sex" id="sex1" value="男" checked>男</label>
                <label><input type="radio" name="sex" id="sex2" value="女">女</label>
                <label><input type="radio" name="sex" id="sex3" value="保密">保密</label>
            </div>
        </c:if>
        <c:if test='${sessionScope.user.sex == "女"}'>
            <div class="radio col-sm-7">
                <label><input type="radio" name="sex" id="sex7" value="男">男</label>
                <label><input type="radio" name="sex" id="sex8" value="女" checked>女</label>
                <label><input type="radio" name="sex" id="sex9" value="保密">保密</label>
            </div>
        </c:if>
        <c:if test='${sessionScope.user.sex == "保密"}'>
            <div class="radio col-sm-7">
                <label><input type="radio" name="sex" id="sex4" value="男">男</label>
                <label><input type="radio" name="sex" id="sex5" value="女">女</label>
                <label><input type="radio" name="sex" id="sex6" value="保密" checked>保密</label>
            </div>
        </c:if>
        <c:if test='${sessionScope.user.sex == null}'>
            <div class="radio col-sm-7">
                <label><input type="radio" name="sex" id="sex11" value="男">男</label>
                <label><input type="radio" name="sex" id="sex12" value="女">女</label>
                <label><input type="radio" name="sex" id="sex13" value="保密" checked>保密</label>
            </div>
        </c:if>
    </div>
    <div class="form-group">
        <label for="uname" class="col-sm-2 control-label">昵称：</label>
        <div class="col-sm-7">
            <input type="text" name="uname" class="form-control" id="uname" value="${sessionScope.user.uname }">
        </div>
    </div>

    <div class="form-group" style="margin-top: 40px;">
        <label class="col-sm-3"></label>
        <div class="col-sm-4">
            <input type="button" class="btn btn-default" style="width: 100px;" value="重置" onclick="reset();">
            <input type="button" class="btn btn-primary" style="width: 100px;margin-left: 40px;" value="保存" onclick="update();">
        </div>
    </div>
</form>
</div>
<%@include file="../common/js/js_jquery.jsp" %>
<%@include file="../common/js/js_boostrap.jsp" %>
<%@include file="../common/js/js_fileinput.jsp" %>
<script>
    $("#face").fileinput({
        'allowedFileExtensions' : ['jpg', 'png','gif'],
        showUpload: false //是否显示上传按钮
    });

    function update() {
        var picName = $('#face').val();
        var sex = $('input[name="sex"]:checked').val();
        picName = picName.substr(picName.lastIndexOf('\\') + 1);
        $('#realImg').val(picName);
        $('#updateFrom').ajaxSubmit({
            type: 'POST',
            url:'/user/update_user_message',
            dataType: 'json',
            success: function(data){
                if(data.result === 'success'){
                    window.location.href = contextPath + "/user/user_message";
                } else {
                    swtAlert.request_fail(data.message);
                }
            }
        });
    };
</script>
</body>
</html>
