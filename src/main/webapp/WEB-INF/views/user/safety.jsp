<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
%>
<link href="<%=path%>/static/css/www/safety.css" rel="stylesheet">
<%--top--%>
<div class="account-right-nav">
    <div class="sub-a-nav">
        <a>安全中心</a>
    </div>
    <em></em>
</div>
<%--进度条--%>
<div class="safe-top">
    <p class="safe-t-text">您的资料完善度</p>
    <p class="safe-t-line">
        <em></em>
    </p>
    <p class="safe-t-r" id="em"></p>
</div>
<%--信息--%>
<div class="safe-content">
    <ul class="safe-list">

        <%--手机号码--%>
        <li>
            <div class="safe-list-1">
                <p class="icon icon-true" id="cellPhone-icon">手&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;机</p>
            </div>
            <div class="safe-list-2" id="cellPhone-text"></div>
            <div class="safe-list-3">
                <a href="javaScript:void(0);" id="cellPhone" class="on">已绑定</a>
                <a href="javaScript:void(0);" id="changePhone">修改</a>
            </div>
        </li>

        <%--邮箱--%>
        <c:choose>
            <c:when test="${sessionScope.user.email == null || sessionScope.user.email == ''}">
                <li>
                    <div class="safe-list-1">
                        <p class="icon icon-wrong" id="cellEmail-icon1">邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱</p>
                    </div>
                    <div class="safe-list-2">获取最新的投资讯息和账户信息变动通知</div>
                    <div class="safe-list-3">
                        <a href="javaScript:void(0);" id="changeEmail">点击绑定</a>
                    </div>
                </li>
            </c:when>
            <c:otherwise>
                <li>
                    <div class="safe-list-1">
                        <p class="icon icon-true" id="cellEmail-icon2">邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱</p>
                    </div>
                    <div class="safe-list-2" id="email"></div>
                    <div class="safe-list-3">
                        <a href="javaScript:void(0);" class="on">已经绑定</a>
                    </div>
                </li>
            </c:otherwise>
        </c:choose>

        <%--身份证--%>
        <c:choose>
            <c:when test="${sessionScope.user.rname == null || sessionScope.user.rname == ''}">
                <li>
                    <div class="safe-list-1">
                        <p class="icon icon-wrong" id="cellRname-icon1">身份认证</p>
                    </div>
                    <div class="safe-list-2">一旦实名认证通过将不能修改</div>
                    <div class="safe-list-3">
                        <a href="javaScript:void(0);" id="changeRname">去绑定</a>
                    </div>
                </li>
            </c:when>
            <c:otherwise>
                <li>
                    <div class="safe-list-1">
                        <p class="icon icon-true" id="cellRname-icon2">身份认证</p>
                    </div>
                    <div class="safe-list-2" id="rname"></div>
                    <div class="safe-list-3">
                        <a href="javaScript:void(0);" class="on">已经绑定</a>
                    </div>
                </li>
            </c:otherwise>
        </c:choose>

        <%--登入密码--%>
            <li>
                <div class="safe-list-1">
                    <p class="icon icon-true" id="cellPwd-icon2">身份认证</p>
                </div>
                <div class="safe-list-2" id="upwd">******</div>
                <div class="safe-list-3">
                    <a href="javaScript:void(0);">修改</a>
                </div>
            </li>
    </ul>
</div>

<%--绑定邮箱--%>
<div class="popup bind-email" style="display: block">
    <p class="title left">绑定邮箱</p>
    <a class="close icon icon-close" href="javaScript:void(0);"></a>
    <div class="popup-from">
        <div class="label cl">
            <label>添加邮箱</label>
            <input type="text" id="addEmail" maxlength="30" placeholder="输入您的邮箱地址" />
        </div>
        <button type="button" class="btn" id="email-submin">添加邮箱</button>
    </div>
</div>

<script type="text/javascript" src="<%=path%>/static/js/jquery.min.js"></script>
<script>
    $(function () {
        var phone = "${sessionScope.user.phone}";
        var email = "${sessionScope.user.email}";
        var rname = "${sessionScope.user.rname}";
        var idno = "${sessionScope.user.idno}";
        var em = 0;
        //手机号码
        if(true){
            $("#cellPhone-text").append("*******" + "${sessionScope.user.phone}".substring(7,11));
            em += 30;
        }
        //邮箱
        if(!(email == null || email == "")){
            var emailStu = "";
            for(var i = 0, len = email.length - 4;i < len; i++){
                emailStu = "*" + emailStu;
            }
            $("#email").append(email.substring(0,4) + emailStu);
            em += 35;
        }
        //身份认证
        if(!(rname == null || rname == "")){
            var emailStu = "";
            $("#rname").append("*" + rname.substring(1,rname.length)+" "+idno.substring(0,10) + "****" + idno.substring(14,18));
            em += 35;
        }
        //进度条
        Em(em);
    })

    //进度条
    function Em(num) {
        if(num == 30){
            $("#em").html("低");
        }else if(num == 65) {
            $("#em").html("中")
        }else{
            $("#em").html("高");
        }
        $(".safe-t-line em").css("width",num+"%");
    }

    //邮箱绑定
    $("#changeEmail").click(function () {
        $('.bind-email').fadeIn();
    });

    $('.bind-email .close').click(function(){
        $('.bind-email').hide();
        utils.Dialog();
    });
</script>

