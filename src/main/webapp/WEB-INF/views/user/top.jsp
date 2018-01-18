<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 7025
  Date: 2017/12/21
  Time: 14:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String topPath = request.getContextPath();
%>
<style>
    .apps{
        display: none;
    }
</style>
<div class="top" id="top">
    <div class="wrap">
        <div class="top-left icon icon-phone">
            <span>客服热线：</span>400-606-2079 <span>（8:30～17:30）</span>
        </div>
        <div class="top-right cl">
            <ul class="top-list" id="navigation">
                <c:choose>
                    <c:when test="${user != null}">
                        <li class="first"><a onclick="outUser();">退出</a></li>
                    </c:when>
                    <c:otherwise>
                        <li class="first"><a href="<%=topPath %>/user/register_page">注册领红包</a></li>
                    </c:otherwise>
                </c:choose>
                <li><a href="<%=topPath %>/user/home_page" class="icon icon-inv">邀请有礼</a></li>
                <li><a href="<%=topPath %>/index/about">关于我们</a></li>
                <li><a href="<%=topPath %>/index/about">帮助中心</a></li>
                <li><a href="<%=topPath%>/page/user/userBankCard" class="pay">充值</a></li>
                <c:choose>
                    <c:when test="${user != null}">
                        <li id="userName"><a href="<%=topPath %>/user/home_page" class="user">${user.phone}</a></li>
                    </c:when>
                    <c:otherwise>
                        <li class="userName"><a href="<%=topPath %>/user/login_page">登录</a></li>
                    </c:otherwise>
                </c:choose>
                <li class="no"><a href="javascript:;" class="icon icon-app" id="app">APP下载</a></li>
            </ul>
            <div id="qrCodeDiv" class="apps">
                <div class="CodeDiv">
                    <img src="<%=topPath%>/static/images/qrCode_ios.png">
                    <p>IOS下载</p>
                </div>
                <div class="CodeDiv">
                    <img src="<%=topPath%>/static/images/qrCode_android.png">
                    <p>Android下载</p>
                </div>
            </div>
        </div>
    </div>
</div>