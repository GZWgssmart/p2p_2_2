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
        <input id="phone" name="user.phone" type="text" placeholder="请输入手机号码" />
        <input id="upwd" name="user.upwd" type="password" placeholder="请输入密码" />
        <input id="tzm" name="user.tzm" type="text" placeholder="请输入推荐码" />
        <input id="radio" type="radio">
        <input id="btn" type="button" value="注册" />
    </form>
</body>
<script type="text/javascript" src="<%=path%>/static/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/www/md5.js"></script>
<script>
    $("#btn").click(function () {
        //手机号码
        var phone = $("#phone").val();
        if(!(/^1(3|4|5|7|8)\d{9}$/.test(phone))) {
            alert("手机号码格式错误");
        }else if(!$("#radio").is(':checked')) {
            alert("请勾选服务协议");
        }else {
            $.post("/user/resign",
                $("#resignForm").serialize(),
                function (data) {
                    alert(11);
                },'json'
            );
        }
    });
</script>
</html>
