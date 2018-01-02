<%--
  Created by IntelliJ IDEA.
  User: 123456
  Date: 2017/12/24
  Time: 19:34
  To change this template use File | Settings | File Templates.
--%>
<%
    String path = request.getContextPath();
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改登入密码</title>
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
                <form id="form">

                    <input id="phone" type="hidden" value="${requestScope.phone}">
                    <div class="from">
                        <label for="newPwd" class="icon icon-pwd"></label>
                        <input type="password" name="" id="newPwd" autocomplete="new-password" placeholder="输入新密码" maxlength="18" >
                    </div>
                    <div class="from">
                        <label for="verifyPwd" class="icon icon-pwd"></label>
                        <input type="password" name="" id="verifyPwd" autocomplete="new-password" placeholder="确认新密码" maxlength="18">
                    </div>
                    <button class="btn" id="btn" type="button">提交</button>
                </form>
            </div>
        </div>
    </div>

    <%--<p>通过手机号码修改密码</p>
    <form id="form">
    <input id="phone" type="hidden" value="${requestScope.phone}"><br />
    <input id="newPwd" type="password" placeholder="请输入新密码" /><br />
    <input id="verifyPwd" type="password" placeholder="请再次密码" /><br />
    <input id="btn" type="button" value="确认修改">
    </form>--%>
    <div class="login-footer" style="margin-top:30px;">
        <p>版权所有 © 普金资本运营（赣州）有限公司 All rights reserved 备案确认书：赣ICP备16004010号</p>
    </div>
</body>
<script type="text/javascript" src="<%=path%>/static/js/jquery.min.js"></script>
<script>
    $("#btn").click(function () {
        var newPwd = $("#newPwd").val();
        var verifyPwd = $("#verifyPwd").val();
        if(newPwd == null || newPwd == ""){
            $('.error-msg').text("新密码不能为空").addClass('show');
        }else if(verifyPwd == null || verifyPwd == ""){
            $('.error-msg').text("确认密码不能为空").addClass('show');
        }else if(newPwd.length < 6 || verifyPwd < 6){
            $('.error-msg').text("新密码或确认密码长度不能小于6位").addClass('show');
        }else if(verifyPwd != newPwd){
            $('.error-msg').text("新密码和确认密码不一致").addClass('show');
        }else{
            var phone = $("#phone").val();
            $('.error-msg').removeClass('show')
           $.ajax({
                type: 'post',
                url: '/user/updatePwd',
                dataType : 'json',
                data: {
                    phone:phone,
                    upwd:newPwd
                },
                success:  function (data) {
                    $('.error-msg').text(data.message).addClass('show').append("<a href='/user/login_page' style='color: blue'>前往登入</a>");
                    $("#btn").attr("disabled",true);
                },
                error: function(data) {
                    $('.error-msg').text("修改失败").addClass('show');
                }
            });
        }
    });
</script>
</html>
