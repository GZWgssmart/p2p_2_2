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
                                   src="<%=path%>${sessionScope.user.face}" style="width: 80px;height: 80px;"/></span>
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <span class="clear">
                                <span class="text-muted text-xs block">${sessionScope.user.uname}<b class="caret"></b></span>
                                </span>
                        </a>
                        <ul class="dropdown-menu animated fadeInRight m-t-xs">
                            <li><a href="<%=path %>/">返回首页</a></li>
                            <li><a href="<%=path%>/user/logout">退出</a></li>
                        </ul>
                    </div>
                    <div class="logo-element">${sessionScope.user.uname}信息管理
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
                            <a class="J_menuItem" href="<%=path%>/user/user_message">基本信息</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="<%=path%>/tx_log/all_withdrawal_page">提现记录</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="<%=path%>/moneyLog/user_money_log_page">资金流向记录</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="<%=path%>/user/all_bankcard">银行卡</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="<%=path%>/user/safety">安全设置</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="<%=path%>/user/checkVip" >VIP</a>
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
