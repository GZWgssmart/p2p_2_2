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
    <title>登录-普金资本—安全可靠专注于供应链金融的国资背景P2P理财平台</title>
    <link rel="stylesheet" href="<%=path%>/static/css/index/public.css">
    <link rel="stylesheet" href="<%=path%>/static/css/index/login.css">
</head>

<body>

<div class="nav-out">
    <div class="wrap cl">
        <div class="logo"><a href="/"><img src="<%=path%>/static/picture/logo.png" alt="普金资本"></a></div>
        <p class="index"><a href="/" class="icon icon-home">普金资本首页</a></p>
    </div>
</div>
<div class="login-content">
    <div class="wrap">
        <div class="login-box">
            <div class="login-top cl">
                <p class="welcome">欢迎登录</p>
            </div>
            <p id="errorP" class="error-msg icon icon-error"></p>
            <form id="loginForm">
                <div class="from">
                    <label for="phone" class="icon icon-user"></label>
                    <input id="phone" name="name" id="phone" type="text" autocomplete="off" placeholder="输入手机号/邮箱"/>
                </div>
                <div class="from">
                    <label for="upwd" class="icon icon-pwd"></label>
                    <input id="upwd" name="password" id="upwd" type="password" autocomplete="new-password" placeholder="请输入密码" />
                </div>
                <div class="from">
                    <div class="pull-box">
                        <div class="pull-bg" style="width: 0px;"></div>
                        <div class="pull-default">请按住滑块，拖动到最右边</div>
                        <div class="pull-btn"></div>
                    </div>
                </div>
                <button id="btn" class="btn" type="button">登录</button>
            </form>

        </div>
    </div>
</div>
<div class="login-footer">
    <p>版权所有 © 普金资本运营（赣州）有限公司 All rights reserved 备案确认书：赣ICP备16004010号</p>
</div>
</body>
<script type="text/javascript" src="<%=path%>/static/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/index/login.js"></script>
<script>

    $("#btn").click(function () {
        var phone = $("#phone").val();
        var upwd = $("#upwd").val();
        if(phone == null || phone == ''){
            $('.error-msg').text("请输入账号").addClass('show');
        }else if(upwd == null || upwd == ''){
            $('.error-msg').text("请输入密码").addClass('show');
        }else if(/^1(3|4|5|7|8)\d{9}$/.test(phone)){
            //判断为手机号码
            $("#phone").attr("name","phone");
            loginFormSubmit();
        }else if (/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/.test(phone)){
            //判断为邮箱
            $('.error-msg').removeClass('show');
            $("#phone").attr("name","email");
            loginFormSubmit();
        }else{
            $('.error-msg').text("账号格式错误").addClass('show');
        }
        if(!pullTest){
            $('.error-msg').text("请拖动验证码到正确位置").addClass('show');
            return;
        };
    });

    
    function loginFormSubmit() {
        $.post("/huser/login",
            $("#loginForm").serialize(),
            function (data) {
               if(data.message === "登录成功！"){
                   window.location.href = "/huser/home_page";
               }else{
                   $('.error-msg').text(data.message).addClass('show');
               }
            },"json"
        );
    }


</script>
</html>