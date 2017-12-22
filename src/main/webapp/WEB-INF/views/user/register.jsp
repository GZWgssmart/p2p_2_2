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
</head>
<body>
    <form id="resignForm">
        <input id="phone" name="phone" type="text" placeholder="请输入手机号码" /><br />
        <input id="upwd" name="upwd" type="password" placeholder="请输入密码" /><br />
        <a href="javaScript:void(0);" id="tidbtn">推荐码(选填)</a><br />
        <div id="tid" style="display:none;">
            <input name="tid" type="text" placeholder="请输入推荐码" /><br />
        </div>
        <input id="radio" type="radio">同意某某协议<br />
        <input id="btn" type="button" value="注册" />
    </form>
</body>
<script type="text/javascript" src="<%=path%>/static/js/jquery.min.js"></script>
<script>
    $("#btn").click(function () {
        //手机号码
        var phone = $("#phone").val();
        var pwd = $("#upwd").val();
        if(!(/^1(3|4|5|7|8)\d{9}$/.test(phone))) {
            alert("手机号码格式错误");
        }else if (pwd == null || pwd == ''){
            alert("请输入密码");
        }else if(pwd.length < 6){
            alert("密码不少于6位");
        }else if (!$("#radio").is(':checked')) {
            alert("请勾选服务协议");
        }else {
            $.post("/user/register",
                $("#resignForm").serialize(),
                function (data) {
                    alert(data.message);
                    if(data.message === "注册成功！"){
                        window.location.href = "/user/login_page";
                    }
                },'json'
            );
        }
    });

    $("#tidbtn").click(function () {
        $("#tid").toggle();
    });
</script>
</html>
