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
</head>
<link rel="icon" href="<%=path%>/static/images/www/logo_title.jpg" type="image/x-icon" />
<body>
    <div class="login-top cl">
        <p class="welcome">欢迎登录</p>
        <p>没有账户，<a href="<%=path%>/user/register_page">免费注册</a></p>
    </div>
    <form id="loginForm">
        <input id="phone" name="phone" id="phone" type="text" placeholder="输入手机号/邮箱"/>
        <input id="upwd" name="upwd" id="upwd" type="password" placeholder="请输入密码" />
        <input id="btn" type="button" value="登入" />
    </form>
</body>
<script type="text/javascript" src="<%=path%>/static/js/jquery.min.js"></script>
<script>

    $("#btn").click(function () {
        var phone = $("#phone").val();
        var upwd = $("#upwd").val();
        if(/^1(3|4|5|7|8)\d{9}$/.test(phone)){
            //判断为电话号码
            $("#phone").attr("name","phone");
            loginFormSubmit();
        }else if (/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/.test(phone)){
            //判断为邮箱
            $("#phone").attr("name","email");
            loginFormSubmit();
        }else{
            alert("格式错误");
        }
    });
    
    function loginFormSubmit() {
        $.post("/user/login",
            $("#loginForm").serialize(),
            function (data) {
                alelt(1);
            },"json"

        );
    }
</script>
</html>