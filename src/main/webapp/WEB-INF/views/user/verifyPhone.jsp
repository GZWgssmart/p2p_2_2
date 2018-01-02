<%--
  Created by IntelliJ IDEA.
  User: 123456
  Date: 2017/12/22
  Time: 14:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>验证手机</title>
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

    <div class="registpay-content">
        <div class="recover-box regist-box">
            <h3>手机找回登入密码</h3>
            <p class="error-msg icon icon-error"></p>
            <div class="step step-one">
                <form id="verifyForm">
                    <div class="from">
                        <label for="phone" class="icon icon-mobile"></label>
                        <input type="text" name="phone" id="phone" maxlength="11" placeholder="输入注册时使用的手机号码"/>
                    </div>
                    <div class="from from-msg">
                        <label for="code" class="icon icon-msg"></label>
                        <input type="text" name="code" id="code" maxlength="6" placeholder="输入短信验证码"/>
                        <div class="msg-btn">
                            <button type="button" id="getCode">获取验证码</button>
                        </div>
                    </div>
                    <button class="btn" type="button" id="btn">验证</button>
                </form>
            </div>
        </div>
    </div>

    <div class="login-footer" style="margin-top:30px;">
        <p>版权所有 © 普金资本运营（赣州）有限公司 All rights reserved 备案确认书：赣ICP备16004010号</p>
    </div>
</body>
<script type="text/javascript" src="<%=path%>/static/js/jquery.min.js"></script>
<script>
    $(function () {
        if(${requestScope.userPhone != null}){
            $("#phone").val(${requestScope.userPhone});
        }
    });
    
    $("#getCode").click(function () {
        var phone = $("#phone").val();
        if(/^1(3|4|5|7|8)\d{9}$/.test(phone)){
            $('.error-msg').removeClass('show');
            $.post("/user/verify_phone",
                {
                    phone:phone
                },function (data) {
                    $('.error-msg').text(data.message).addClass('show');
                },"json"
            );
        }else{
            $('.error-msg').text("手机号格式错误").addClass('show');
        }

    });

    $("#btn").click(function () {
        var phone = $("#phone").val();
        var code = $("#code").val();
        if(!(/^1(3|4|5|7|8)\d{9}$/).test(phone)){
            $('.error-msg').text("手机号码格式错误").addClass('show');
        }else if(code == null || code == ''){
            $('.error-msg').text("验证码不能为空").addClass('show');
        }else{
            $('.error-msg').removeClass('show');
            $.post("/user/verify_phone",
                {
                    phone:phone,
                    code:code
                },function (data) {
                    if(data.message === "验证成功"){
                        $('.error-msg').text(data.message).addClass('show');
                        window.location.href = "/user/update_pwd_page/"+phone;
                    }else{
                        $('.error-msg').text(data.message).addClass('show');
                    }
                },"json"
            );
        }
    });
</script>
</html>
