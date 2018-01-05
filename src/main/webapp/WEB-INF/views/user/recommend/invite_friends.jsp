<%--
  Created by IntelliJ IDEA.
  User: ID.LQF
  Date: 2018/1/4
  Time: 8:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>推荐页面</title>
    <%@include file="../../common/css/css_bootstrap.jsp" %>
</head>
<body>
<div>
    <p>
        <br/>
    </p>
    <p style="text-align: center;">
        <img src="<%=path %>/static/uploads/img/banner_t.png" alt="banner_t.png"/>
    </p>
    <p>
        <br/>
    </p>
    <p>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;尊敬的用户，你的推荐号为：${sessionScope.user.uid }
    </p>
    <p>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size: 14px; color: rgb(127, 127, 127);">活动时间：<span style="font-size: 14px; color: rgb(255, 0, 0);"><strong><span style="font-size: 14px;">2017年12月15日---2018年2月15</span></strong></span></span><br/>
    </p>
    <p>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size: 14px; color: rgb(127, 127, 127);"><span style="font-size: 14px;">活动对象：活动期间新注册用户的推荐人；</span></span>
    </p>
    <p>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size: 14px; color: rgb(127, 127, 127);"><span style="font-size: 14px;">活动说明：1、活动期间邀请好友注册并累计投资满10000元，得50元现金卷奖励；<br/></span></span>
    </p>
    <p>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: rgb(127, 127, 127); font-size: 14px;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 2、活动期间内成功邀请5位以上好友注册投资成功合计满100000，可额外获得500元现金卷奖励，可在<strong><span style="font-size: 14px; color: rgb(255, 0, 0);">【我的账户-我的赠卷】</span></strong>中查</span>
    </p>
    <p>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: rgb(127, 127, 127); font-size: 14px;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 看<span style="font-size: 14px; color: rgb(127, 127, 127);">。</span><br/></span>
    </p>
    <p>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: rgb(127, 127, 127); font-size: 14px;"><span style="font-size: 14px; color: rgb(127, 127, 127);">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;（满足活动条件的用户，在活动结束后的3个工作日内奖励将以现金卷的形式发放至用户账户）<br/></span></span>
    </p>
    <p>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><span style="font-size: 14px; color: rgb(255, 0, 0);">注：<span style="font-size: 14px; color: rgb(127, 127, 127);"></span></span></strong><span style="font-size: 14px; color: rgb(255, 0, 0);"><span style="font-size: 14px; color: rgb(127, 127, 127);">需将自己的邀请链接地址或推荐号发给您的好友，这样您才能成为他的邀请者。</span></span><span style="font-size: 14px; color: rgb(127, 127, 127);"><br/></span>
    </p>
    <p>
        <br/>
    </p>
    <div>
        <form role="form">
            <div class="form-group" style="margin-left: 22px;">
                <label class="col-sm-6">
                    <input type="text" class="form-control col-sm-5" id="foo" value = "localhost:8080/user/register_page?uid=${sessionScope.user.uid}"  style="background:none;" readonly>
                </label>
                <label style="margin-left: 0px;">
                    <input type="button" class = "btn btn-primary" data-clipboard-target = "#foo" value="复制链接">
                </label>
            </div>
        </form>
    </div>
    <p>
        <br/>
    </p>
    <p>
        <br/>
    </p>
</div>
<%@include file="../../common/js/js_jquery.jsp" %>
<%@include file="../../common/js/js_boostrap.jsp" %>
<script src="<%=path%>/static/js/clipboard/clipboard.min.js"></script>
<script>
    new Clipboard('.btn');
</script>
</body>
</html>
