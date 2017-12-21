<%--
  Created by IntelliJ IDEA.
  User: 123456
  Date: 2017/12/21
  Time: 10:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>登录</title>
    <link rel="stylesheet" href="<%=path%>/static/css/www/public.css">
    <link rel="stylesheet" href="<%=path%>/static/css/www/login.css">
</head>
<link rel="icon" href="<%=path%>/static/images/www/logo_title.jpg" type="image/x-icon" />
<body>
<div class="nav-out">
    <div class="wrap cl">
        <div class="logo"><a href="https://www.pujinziben.com/"><img src="<%=path%>/static/images/www/logo.png" alt="普金资本"></a></div>
        <p class="index"><a href="https://www.pujinziben.com/" class="icon icon-home">普金资本首页</a></p>
    </div>
</div>
<div class="login-content">
    <div class="wrap">
        <div class="login-box">
            <div class="login-top cl">
                <p class="welcome">欢迎登录</p>
                <p>没有账户，<a href="<%=path%>/user/resignView">免费注册</a></p>
            </div>
            <p class="error-msg icon icon-error"></p>
            <div class="from">
                <label for="username" class="icon icon-user"></label>
                <input type="text" name="username" id="username" autocomplete="off" placeholder="输入手机号/邮箱"/>
            </div>
            <div class="from">
                <label for="password" class="icon icon-pwd"></label>
                <input type="password" name=""  id="password" autocomplete="new-password" placeholder="输入登录密码"/>
            </div>
            <div class="from">
                <div class="pull-box">
                    <div class="pull-bg" style="width: 0px;"></div>
                    <div class="pull-default">请按住滑块，拖动到最右边</div>
                    <div class="pull-btn"></div>
                </div>
            </div>
            <button class="btn"  type="button">登录</button>
            <div class="forget">
                <a href="recoverpwd.html">忘记密码</a>
            </div>
        </div>
    </div>
</div>
<div class="login-footer">
    <p>版权所有 © 普金资本运营（赣州）有限公司 All rights reserved 备案确认书：赣ICP备16004010号</p>
</div>
</body>
</html>