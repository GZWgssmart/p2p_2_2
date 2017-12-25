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
    <title>Title</title>
</head>
<body>
    <p>通过手机号码修改密码</p>
    <form id="form">
    <input id="phone" type="hidden" value="${requestScope.phone}"><br />
    <input id="newPwd" type="password" placeholder="请输入新密码" /><br />
    <input id="verifyPwd" type="password" placeholder="请再次密码" /><br />
    <input id="btn" type="button" value="确认修改">
    </form>
</body>
<script type="text/javascript" src="<%=path%>/static/js/jquery.min.js"></script>
<script>
    $("#btn").click(function () {
        var newPwd = $("#newPwd").val();
        var verifyPwd = $("#verifyPwd").val();
        if(newPwd == null || newPwd == ""){
            alert("新密码不能为空");
        }else if(verifyPwd == null || verifyPwd == ""){
            alert("确认密码不能为空");
        }else if(newPwd.length < 6 || verifyPwd < 6){
            alert("新密码或确认密码长度不能小于6位");
        }else if(verifyPwd != newPwd){
            alert("新密码和确认密码不一致");
        }else{
            var phone = $("#phone").val();
           $.ajax({
                type: 'post',
                url: '/user/updatePwd',
                dataType : 'json',
                data: {
                    phone:phone,
                    upwd:newPwd
                },
                success:  function (data) {
                    alert(data.message);
                    window.location.href = "/user/login_page";
                },
                error: function(data) {
                    alert("修改失败");
                }
            });
        }
    });
</script>
</html>
