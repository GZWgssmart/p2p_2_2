<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <%@include file="common/index/head.jsp" %>
    <title>用户登录</title>
</head>
<body class="container">

<div class="panel panel-default">
    <div class="panel-head text-center">
        <h2>用户登录</h2>
    </div>
    <div class="panel-body">
        <form id="user-login-form" class="form-horizontal">
            <div class="form-group">
                <label for="input-phone" class="col-sm-2 control-label">手机</label>
                <div class="col-sm-10">
                    <input name="phone" type="text" class="form-control" id="input-phone" placeholder="请输入手机号">
                </div>
            </div>
            <div class="form-group">
                <label for="inputPassword3" class="col-sm-2 control-label">密码</label>
                <div class="col-sm-10">
                    <input name="pwd" type="password" class="form-control" id="inputPassword3" placeholder="请输入密码">
                </div>
            </div>
            <div class="form-group">
                <label for="input-code" class="col-sm-2 control-label">验证码</label>
                <div class="col-sm-10">
                    <input name="code" type="text" class="form-control" id="input-code" placeholder="请输入图片验证码">
                    <img class="img-responsive" src="<%=path%>/checkCode/" onclick="this.src='<%=path%>/checkCode?aParam=' + Math.random()" alt=""/>
                </div>
            </div>
            
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-3">
                    <a href="javascript:void(0);" onclick="submitForm.login(contextPath+'/user/login', 'user-login-form', contextPath+'/user/home')" class="btn btn-success">登录</a>
                </div>
                <div class="col-sm-5">
                    <button type="reset" class="btn btn-default">取消</button>
                </div>
            </div>
        </form>
    </div>
</div>

<%@include file="common/js/js_jquery.jsp" %>
<%@include file="common/js/js_boostrap.jsp" %>
<%@include file="common/js/js_sweetalert.jsp" %>
<%@include file="common/js/js_form.jsp" %>

</body>
</html>