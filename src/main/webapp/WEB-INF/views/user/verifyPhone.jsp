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
    <title>Title</title>
</head>
<body>
    <form id="verifyForm">
        <input id="phone" name="phone" placeholder="请输入电话号码" />
        <input id="code" name="code" placeholder="请输入手机验证码" />
        <a id="getCode" href="javaScript:void(0);">获取手机验证码</a>
        <input id="btn" type="button" value="验证" />
    </form>
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
            $.post("/user/verify_phone",
                {
                    phone:phone
                },function (data) {
                    alert(data.message);
                },"json"
            );
        }else{
            alert("手机号格式错误");
        }

    });

    $("#btn").click(function () {
        var phone = $("#phone").val();
        var code = $("#code").val();
        if(!(/^1(3|4|5|7|8)\d{9}$/).test(phone)){
            alert("手机号格式错误");
        }else if(code == null || code == ''){
            alert("验证码不能为空");
        }else{
            $.post("/user/verify_phone",
                {
                    phone:phone,
                    code:code
                },function (data) {
                    if(data.message === "验证成功"){
                        alert(data.message);
                        window.location.href = "/user/update_pwd_page/"+phone;
                    }else{
                        alert(data.message);
                    }
                },"json"
            );
        }
    });
</script>
</html>
