<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>

<head>
    <title>首页</title>
    <%@include file="../common/manage/index_head.jsp" %>
</head>

<body class="fixed-sidebar full-height-layout gray-bg" style="overflow:hidden">
<div id="wrapper">
    <!--左侧导航开始-->
    <nav class="navbar-default navbar-static-side" role="navigation">
        <div class="nav-close"><i class="fa fa-times-circle"></i>
        </div>
        <div class="sidebar-collapse">
            <ul class="nav" id="side-menu">
                <li class="nav-header">
                    <div class="dropdown profile-element">
                        <span><img alt="image" class="img-circle"
                                   src="<%=path%>/static/images/profile_small.jpg"/></span>
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <span class="clear">
                               <span class="block m-t-xs"><strong class="font-bold">昵称</strong></span>
                                <span class="text-muted text-xs block">${sessionScope.user.rname}<b class="caret"></b></span>
                                </span>
                        </a>
                    </div>
                    <div class="logo-element">XXX信息管理
                    </div>
                </li>

                <li>
                    <a href="#">
                        <i class="fa fa-desktop"></i>
                        <span class="nav-label">我的账户</span>
                        <span class="fa arrow"></span>
                    </a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a class="J_menuItem" href="<%=path%>/clazz/clazzsPage">基本信息</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="<%=path%>/clazz/clazzsPage">账户充值</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="<%=path%>/user/withdrawal">提现</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="<%=path%>/user/all_bankcard">银行卡</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="<%=path%>/user/safety">安全设置</a>
                        </li>
                    </ul>
                </li>

                <li>
                    <a href="#">
                        <i class="fa fa-home"></i>
                        <span class="nav-label">借款管理</span>
                        <span class="fa arrow"></span>
                    </a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a class="J_menuItem" onclick="checkVip();" data-index="0">所有借款</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="<%=path%>/user/all_borrow_money_page">未发布借款</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="<%=path%>/user/all_borrow_checkok_page">已发布借款</a>
                        </li>
                    </ul>

                </li>

                <li>
                    <a href="#">
                        <i class="fa fa fa-bar-chart-o"></i>
                        <span class="nav-label">投资管理</span>
                        <span class="fa arrow"></span>
                    </a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a class="J_menuItem" href="<%=path%>/user/all_invest_borrow_page">已投借款</a>
                            <a class="J_menuItem" href="<%=path%>/user/all_invest_log_page">投资记录</a>
                        </li>
                    </ul>
                </li>

                <li>
                    <a href="#">
                        <i class="fa fa-table"></i>
                        <span class="nav-label">平台信息</span>
                        <span class="fa arrow"></span>
                    </a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a class="J_menuItem" href="<%=path%>/user/all_letter_page">消息中心</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="<%=path%>/user/all_notice_page">最新公告</a>
                        </li>
                    </ul>
                </li>

                <li>
                    <a href="#">
                        <i class="fa fa-users"></i>
                        <span class="nav-label">好友推荐</span>
                        <span class="fa arrow"></span>
                    </a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a class="J_menuItem" href="<%=path%>/recommend/invite_friends">好友推荐</a>
                            <a class="J_menuItem" href="<%=path%>/recommend/list_invite_friends">推荐列表</a>
                        </li>
                    </ul>
                </li>

            </ul>
        </div>
    </nav>
    <!--左侧导航结束-->

    <!--右侧部分开始-->
    <%@include file="../common/manage/index_right_part_user.jsp" %>
    <!--右侧部分结束-->

    <!--右侧边栏开始-->
    <%@include file="../common/manage/index_right_sidebar.jsp" %>
    <!--右侧边栏结束-->
</div>

<%@include file="../common/manage/index_js.jsp" %>
<%@include file="../common/js/js_sweetalert.jsp" %>
<script src="<%=path%>/static/js/our/user/lmh/home_check_vip.js"></script>
</body>
<script>
    $(function () {
        if(${sessionScope.user.uid == null}){
            swtAlert.request_fail_no_timer("未登入,请先登入");
            window.location.href = "/user/login_page";
        }
    })
</script>
</html>
