<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String headPath = request.getContextPath();
%>
<div class="nav">
    <div class="wrap cl">
        <div class="logo"><img src="<%=headPath %>/static/picture/logo.png" alt="普金资本"></div>
        <div class="nav-bar">
            <ul>
                <li><a href="javaScript:void(0);" id="myHome">我的账户</a></li>
                <li><a href="<%=headPath %>/index/about">信息披露 </a></li>
                <li><a href="<%=headPath %>/index/security">安全保障</a></li>
                <li>
                    <a href="<%=headPath %>/index/tzlc">投资理财</a>
                    <div class="sub-nav">
                        <a href="investlist.html#006">恒金保</a>
                        <a href="investlist.html#004">普金保</a>
                        <a href="investlist.html#003">多金宝</a>
                        <a href="investlist.html#005">新手标</a>
                        <a href="creditorlist.html">债权转让</a>
                        <p class="left"></p>
                        <p class="right"></p>
                    </div>
                </li>
                <li><a href="<%=headPath %>/">首页</a></li>
            </ul>
        </div>
    </div>
</div>