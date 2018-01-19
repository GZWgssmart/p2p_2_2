<%--
  Created by IntelliJ IDEA.
  User: 123456
  Date: 2017/12/21
  Time: 11:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
        String path = request.getContextPath();
%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="<%=path%>/static/css/index/public.css">
    <link rel="stylesheet" href="<%=path%>/static/css/index/login.css">
</head>
<body>
<div class="nav-out">
    <div class="wrap cl">
        <div class="logo"><a href="/"><img src="<%=path%>/static/picture/logo.png" alt="普金资本"></a></div>
        <p class="to-login">已有账号，<a href="<%=path%>/user/login_page">立即登录</a></p>
    </div>
</div>
<form id="resignForm">
    <div class="regist-content">
        <div class="regist-exp">
            <p>普金资本理财资金由汇付天下托管</p>
        </div>
        <div class="regist-box">
            <h3>欢迎注册</h3>
            <p class="error-msg icon icon-error"></p>
            <p class="ok-msg" style="display: none"></p>
            <!-- <div class="from">
                <label for="username" class="icon icon-user"></label>
                <input type="text" name="username" id="username" maxlength="18" autocomplete="new-password" onblur="choseUser(this)" placeholder="输入用户名"/>
            </div> -->

            <div class="from">
                <label for="phone" class="icon icon-mobile"></label>
                <input id="phone" name="phone" type="text" placeholder="请输入手机号码" />
            </div>
            <div class="from">
                <label for="upwd" class="icon icon-pwd"></label>
                <input id="upwd" name="upwd" type="password" placeholder="请输入密码" />
            </div>
            <div class="from from-msg">
                <label for="msgcode" class="icon icon-msg"></label>
                <input type="text" name="pcode" id="msgcode" maxlength="6" placeholder="输入短信验证码"/>
                <div class="msg-btn">
                    <button type="button" id="getMsgCode">获取验证码</button>
                </div>
            </div>

            <div class="from-text">
                <p class="code icon icon-bottom" id="tidbtn">推荐码(选填)</p>
            </div>
            <div class="from from-ext" id="tid" style="display:none;">
                <label for="useCode" class="icon icon-ext"></label>
                <input type="text" name="tid" id="useCode" placeholder="输入邀请码"/>
            </div>
            <input type="button" class="btn" id="btn" value="注册" ></input>
            <div class="agree"><input id="radio" type="radio">我已阅读并同意《<a href="javascript:AgreeMent(0);">普金资本服务协议</a>》和《<a href="javascript:AgreeMent(1);">风险提示书</a>》</div>
        </div>
    </div>

</form>

<div id="popup-captcha"></div>
<div class="popup AgreeMent">
    <p class="title left">普金资本服务协议</p>
    <a href="javascript:void(0);" class="close icon icon-close"></a>
    <div class="popup-area">

    </div>
</div>
<div class="login-footer">
    <p>版权所有 © 普金资本运营（赣州）有限公司 All rights reserved 备案确认书：赣ICP备16004010号</p>
</div>
</body>
<script type="text/javascript" src="<%=path%>/static/js/jquery.min.js"></script>
<%@include file="../common/js/js_boostrap.jsp" %>
<%@include file="../common/js/js_sweetalert.jsp" %>
<script>

    $(function () {
        if(!(${requestScope.uid == null || requestScope.uid == ""})){
            var tuid = ${requestScope.uid}+"";
            $("#useCode").val(tuid);
        }

    });
    $("#btn").click(function () {
        $('.ok-msg').hide();
        //手机号码
        var phone = $("#phone").val();
        var pwd = $("#upwd").val();
        var code = $("#msgcode").val()
        if(!(/^1(3|4|5|7|8)\d{9}$/.test(phone))) {
            $('.ok-msg').hide();
            $('.error-msg').text("手机号码格式错误").addClass('show');
        }else if (pwd == null || pwd == ''){
            $('.ok-msg').hide();
            $('.error-msg').text("请输入密码").addClass('show');
        }else if(pwd.length < 6){
            $('.ok-msg').hide();
            $('.error-msg').text("密码不少于6位").addClass('show');
        }else if(code == null || code == ""){
            $('.ok-msg').hide();
            $('.error-msg').text("手机验证码不能为空").addClass('show');
        }else if (!$("#radio").is(':checked')) {
            $('.ok-msg').hide();
            $('.error-msg').text("请勾选服务协议").addClass('show');
        }else {
            $.post("/user/register",
                $("#resignForm").serialize(),
                function (data) {
                    if(data.message === "注册成功！"){
                        $('.error-msg').removeClass('show');
                        $('.ok-msg').text(data.message).show();
                        window.location.href = "/user/login_page";

                    }else{
                        $('.ok-msg').hide();
                        $('.error-msg').text(data.message).addClass('show');
                    }
                },'json'
            );
        }
    });

    $("#tidbtn").click(function () {
        $("#tid").toggle();
    });

    $("#getMsgCode").click(function () {
        var phone = $("#phone").val();
        if(!(/^1(3|4|5|7|8)\d{9}$/.test(phone))) {
            $('.ok-msg').hide();
            $('.error-msg').text("手机号码格式错误").addClass('show');
        }else{
            $.post("/user/get_phone_code",
                {
                    phone:phone
                },
                function (data) {
                    if(data.message === "验证码已发送，请注意查收"){
                        $('.error-msg').removeClass('show');
                        $('.ok-msg').text(data.message).show();
                    }
                },"json"
            );
        }
    });
</script>
</html>
