<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
%>
<link href="<%=path%>/static/css/www/safety.css" rel="stylesheet">
<link href="<%=path%>/static/css/bootstrap.min.css" rel="stylesheet">
<%--top--%>
<div class="account-right-nav">
    <div class="sub-a-nav">
        <a>安全中心</a>
    </div>
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
                        <a href="javaScript:void(0);" class="on">已绑定</a>
                    </div>
                </li>
            </c:otherwise>
        </c:choose>

        <%--登入密码--%>
            <li>
                <div class="safe-list-1">
                    <p class="icon icon-true" id="cellPwd-icon2">密码</p>
                </div>
                <div class="safe-list-2" id="upwd">******</div>
                <div class="safe-list-3">
                    <a href="javaScript:void(0);" id="changePwd">修改</a>
                </div>
            </li>
    </ul>
</div>

<%--邮箱注册模态框--%>
<%@include file="userModel.jsp" %>

<%--js--%>
<%@include file="../common/js/js_jquery.jsp" %>
<%@include file="../common/js/js_boostrap.jsp" %>
<%@include file="../common/js/js_form.jsp" %>
<%@include file="../common/js/js_data_dict.jsp" %>
<%@include file="../common/js/js_sweetalert.jsp" %>
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
            $("#phone").append("*******" + "${sessionScope.user.phone}".substring(7,11));
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

    //修改手机号
    $("#changePhone").click(function () {
        $("#verifyPhoneModal").modal("show");
        $("#code").val("");
    });

    $("#phoneCode").click(function () {
        getPhone(${sessionScope.user.phone});
    })



    //验证手机号
    function vrifyPhone() {
        var code = $("#code").val();
        if(code == null || code == ""){
            swtAlert.request_fail("验证码不能为空")
        }else{
            $.post("/user/verify_phone",
                {
                    phone:${sessionScope.user.phone},
                    code:code
                },
                function (data) {
                    if(data.message === "验证成功"){
                        swtAlert.request_success(data.messgae);
                        $("#verifyPhoneModal").modal("hide");
                        $("#updatePhoneModal").modal("show");
                    }else{
                        swtAlert.request_fail(data.message);
                    }
                },"json"
            );
        }

    }

    //修改手机号--验证新手机号码
    $("#phoneCode1").click(function () {
        var newPhone = $("#newPhone").val();
        if(verifyNewPhone(newPhone)){
            $.post("/user/no_register_verify_phone",
                {
                    phone:newPhone
                },
                function (data) {
                    if(data.message === "验证码已发送，请注意查收"){
                        swtAlert.request_success(data.message);
                    }else{
                        swtAlert.request_fail(data.message);
                    }
                }
            );
        }
    })

    function updatePhone() {
        var newPhone = $("#newPhone").val();
        var code = $("#codePhone").val();
        if(code == null || code == ""){
            swtAlert.request_fail("验证码不能为空")
        }else if(verifyNewPhone(newPhone)) {
            $.post("/user/no_register_verify_phone",
                {
                    phone:newPhone,
                    code:code
                },
                function (data) {
                    if(data.message === "验证成功"){
                        $.ajax({
                            type: 'post',
                            url: '/user/update_user',
                            dataType : 'json',
                            data: $("#updatePhoneForm").serialize(),
                            success:  function (data) {
                                swtAlert.request_success(data.message);
                                $("#updatePhoneModal").modal("hide");
                                window.location.reload();
                            },
                            error: function(data) {
                                swtAlert.request_fail("修改失败");
                            }
                        });
                    }else{
                        swtAlert.request_fail(data.message);
                    }
                }
            );
        }
    }
    
    function verifyNewPhone(newPhone) {

        if(newPhone == null || newPhone == ""){
            swtAlert.request_fail("手机号不能为空");
            return false;
        }else if(!(/^1(3|4|5|7|8)\d{9}$/.test(newPhone))){
            swtAlert.request_fail("手机格式错误");
            return false;
        }else if("${sessionScope.user.phone}" === newPhone){
            swtAlert.request_fail("不能与原手机号一致");
            return false;
        }else{
            return true;
        }
    }

    //获取已经注册的手机号的验证码
    function getPhone(phone) {
        $.post("/user/verify_phone",
            {
                phone:phone
            },
            function (data) {
                if(data.message == "验证码已发送，请注意查收"){
                    swtAlert.request_success(data.messgae);
                }else{
                    swtAlert.request_fail(data.message);
                }
            },"json"
        );
    }



    //绑定邮箱
    $("#changeEmail").click(function () {
        $("#updateTeacherModal").modal("show");
        return $("#addEmailForm").validate({
            onfocusout: function(element){
                $(element).valid();
            },
            debug:false,
            onkeyup:false,
            rules:{
                'email':{
                    required: true,
                    isEmail: true,
                    remote: {
                        type:"get",
                        url:"/user/is_have_email",
                        data:{
                            email:function(){
                                return $("#email").val();
                            }
                        }
                    }
                }
            },
            messages:{
                'email': {
                    remote: dataDict.form.existEmail
                }
            }
        });
    });

    function addEmail() {
        if ($('#addEmailForm').valid() === false) return;
        $.post("/user/add_email",
            $('#addEmailForm').serialize(),
            function (data) {
                swtAlert.request_success(data.messgae)
                $("#updateTeacherModal").modal("hide");
                window.location.reload();
            },"json"
        );
    }

    //身份认证
    $("#changeRname").click(function () {
        $("#updateRnameModal").modal("show");
        return $("#userForm").validate({
            onfocusout: function(element){
                $(element).valid();
            },
            debug:false,
            onkeyup:false,
            rules:{
                'rname':{
                    required: true
                },
                'idno':{
                    required: true,
                    isIdCardNo:true
                }
            },
            messages:{

            }
        });
    });

    function updateRame() {
        if ($('#userForm').valid() === false) return;
        $.ajax({
            type: 'post',
            url: '/user/update_user',
            dataType : 'json',
            data: $("#userForm").serialize(),
            success:  function (data) {
                if(data.message === "修改成功"){
                    swtAlert.request_success(data.message);
                    $("#updateRnameModal").modal("hide");
                    window.location.reload();
                }
            },
            error: function(data) {
                swtAlert.request_fail("修改失败");
            }
        });
    }

    $("#changePwd").click(function () {
        $("#updatePwdModal").modal("show");
    });

    //修改密码
    function updatePwd() {
        var oldPwd = $("#oldPwd").val();
        var newPwd = $("#newPwd").val();
        var copPwd = $("#copPwd").val();
        if(oldPwd == newPwd){
            swtAlert.request_fail("新密码不能与原始密码一致");
        }else if(newPwd.length < 6){
            swtAlert.request_fail("密码长度至少六位");
        }else if(newPwd != copPwd){
            swtAlert.request_fail("确认密码错误");
        }else{
            $.ajax({
                type: 'post',
                url: '/user/update_user',
                dataType : 'json',
                data: {
                    uid:${sessionScope.user.uid},
                    upwd:newPwd,
                    old:oldPwd
                },
                success:  function (data) {
                    if(data.message === "修改成功"){
                        swtAlert.request_success("密码修改成功，请重新登入");
                        window.top.location.href = "<%=path%>/user/login_page";
                    }else{
                        swtAlert.request_fail(data.message);
                    }
                },
                error: function(data) {
                    swtAlert.request_fail("修改密码失败");
                }
            });
        }
    }
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
    


</script>

