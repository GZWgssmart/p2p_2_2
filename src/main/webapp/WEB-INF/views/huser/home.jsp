<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String path = request.getContextPath();
%>
<html>

<head>
    <title>管理员后台</title>
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
                                   src="<%=path %>/static/picture/logo1.jpg"/></span>
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <span class="clear">
                               <span class="block m-t-xs"><strong class="font-bold"></strong></span>
                                <span class="text-muted text-xs block">${sessionScope.huser.huname}<b class="caret"></b></span>
                                </span>
                        </a>
                        <ul class="dropdown-menu animated fadeInRight m-t-xs">
                            <li><a href="<%=path %>/">返回首页</a></li>
                            <li><a href="javascript:void(0);" onclick="seeDetail()">我的信息</a></li>
                            <li><a href="javascript:void(0);" onclick="openChangePassword()">修改密码</a></li>
                        </ul>
                    </div>
                    <div class="logo-element">
                    </div>
                </li>

                <li>
                    <a href="#">
                        <i class="fa fa fa-bar-chart-o"></i>
                        <span class="nav-label">平台设置</span>
                        <span class="fa arrow"></span>
                    </a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a class="J_menuItem" href="<%=path%>/huser/all_reward_setting_page" data-index="0">奖励设置</a>
                        </li>
                        <%--<li>
                            <a class="J_menuItem" href="<%=path%>/huser/all_sway_page">还款方式</a>
                        </li>--%>
                        <li>
                            <a class="J_menuItem" href="<%=path%>/huser/all_bz_page">还款方式</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="<%=path%>/huser/all_dxmodel_page">短信模版</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="<%=path%>/huser/all_jklx_page">标种</a>
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
                            <a class="J_menuItem" href="<%=path %>/huser/all_letter_page">站内信</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="<%=path %>/huser/notice_pager">公告</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="<%=path %>/huser/friend_pager">合作伙伴</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="<%=path%>/huser/all_dynamic_page">公司动态</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="<%=path%>/huser/all_media_page">媒体报道</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="<%=path%>/huser/all_homeimg_page">首页图片</a>
                        </li>
                    </ul>
                </li>

                <li>
                    <a href="#">
                        <i class="fa fa-google-plus"></i>
                        <span class="nav-label">运营数据</span>
                        <span class="fa arrow"></span>
                    </a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a class="J_menuItem" href="<%=path%>/huser/all_ydata_page">数据总揽</a>
                        </li>
                    </ul>
                </li>

                <li>
                    <a href="#">
                        <i class="fa fa fa-bar-chart-o"></i>
                        <span class="nav-label">借款管理</span>
                        <span class="fa arrow"></span>
                    </a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a class="J_menuItem" href="<%=path%>/huser/all_shborrow_page">未审核</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="<%=path%>/huser/all_okborrow_page">已审核</a>
                        </li>
                    </ul>
                </li>

                <li>
                    <a href="#">
                        <i class="fa fa-home"></i>
                        <span class="nav-label">现金流水</span>
                        <span class="fa arrow"></span>
                    </a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a class="J_menuItem" href="<%=path%>/huser/all_tx_check_page">提现审核</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="<%=path%>/huser/all_tx_log_page">提现记录</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="<%=path%>/huser/all_invest_page">投资记录</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="<%=path%>/huser/all_moneylog_page">资金流向</a>
                        </li>
                    </ul>
                </li>

                <li>
                    <a href="#">
                        <i class="fa fa-desktop"></i>
                        <span class="nav-label">用户管理</span>
                        <span class="fa arrow"></span>
                    </a>
                    <ul class="nav nav-second-level">
                        <shiro:hasRole name="superadmin">
                            <li>
                                <a class="J_menuItem" href="<%=path%>/huser/all_huser_page">所有员工</a>
                            </li>
                        </shiro:hasRole>
                        <li>
                            <a class="J_menuItem" href="<%=path%>/user/all_user_page">普通用户</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="<%=path%>/huser/check_vip">审核VIP</a>
                        </li>
                    </ul>
                </li>

                <shiro:hasRole name="superadmin">
                    <li>
                        <a href="#">
                            <i class="fa fa-picture-o"></i>
                            <span class="nav-label">角色权限</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a class="J_menuItem" href="<%=path%>/role/all_role_page">所有角色</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="<%=path%>/jur/all_jur_page">所有权限</a>
                            </li>
                        </ul>
                    </li>
                </shiro:hasRole>

                <li>
                    <a href="#">
                        <i class="fa fa-users"></i>
                        <span class="nav-label">推荐管理</span>
                        <span class="fa arrow"></span>
                    </a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a class="J_menuItem" href="<%=path%>/huser/all_recommend_page">所有推荐</a>
                        </li>
                    </ul>
                </li>

            </ul>
        </div>
    </nav>

    <!-- Modal -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">我的信息</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" id="myMessage">
                        <input id="huid" name="huid" type="hidden" value="${sessionScope.huser.huid}">
                        <div class="form-group">
                            <div class="col-sm-2 control-label">用户名</div>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="huname" id="huname"
                                       placeholder="用户名" readonly/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-2 control-label">邮箱</div>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="email" id="email" placeholder="邮箱"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-2 control-label">手机</div>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="phone" id="phone" placeholder="手机"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-2 control-label">姓名</div>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="rname" id="rname" placeholder="姓名"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-2 control-label">性别</div>
                            <div class="col-sm-10">
                                <label class="radio-inline">
                                    <input style="margin-top: 3px;" type="radio" name="sex" id="men" value="男" checked> 男
                                </label>
                                <label class="radio-inline">
                                    <input style="margin-top: 3px;" type="radio" name="sex" id="women" value="女"> 女
                                </label>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" onclick="update()">保存</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="myPasswordModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">修改密码</h4>
                </div>
                <div class="modal-body">
                    <p id="errorP" class="error-msg" style="color: red;font-size: 15px;"></p>
                    <form class="form-horizontal" id="myPassword">
                        <input  name="huid" type="hidden" value="${sessionScope.huser.huid}">
                        <div class="form-group">
                            <div class="col-sm-2 control-label">原密码</div>
                            <div class="col-sm-10">
                                <input type="password" class="form-control" id="password" name="password" placeholder="请输入原密码"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-2 control-label">新密码</div>
                            <div class="col-sm-10">
                                <input type="password" class="form-control" id="newPassword" name="newPassword"  placeholder="请输入新密码"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-2 control-label">确认密码</div>
                            <div class="col-sm-10">
                                <input type="password" class="form-control" id="conPassword" name="conPassword"  placeholder="请再次输入新密码"/>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" onclick="changePassword()">保存</button>
                </div>
            </div>
        </div>
    </div>

    <!--左侧导航结束-->

    <!--右侧部分开始-->
    <%@include file="../common/manage/index_right_part_huser.jsp" %>
    <!--右侧部分结束-->

    <!--右侧边栏开始-->
    <%@include file="../common/manage/index_right_sidebar.jsp" %>
    <!--右侧边栏结束-->
</div>

<%@include file="../common/manage/index_js.jsp" %>
<%@include file="../common/js/js_sweetalert.jsp" %>
<%@include file="../common/js/js_form.jsp" %>
</body>
<script>
    function seeDetail() {
        $(":text").val("");
        $('#myModal').modal();

        $.post("" + "/huser/get_by_id",
            {"huserId":$('#huid').val()},
            function (data) {
                $('#rname').val(data.rname);
                $('#huname').val(data.huname);
                $('#phone').val(data.phone);
                $('#email').val(data.email);
                var sex = data.sex;
                if (sex === '男') {
                    $('#men').prop('checked', true);
                } else if (sex === '女') {
                    $('#men').prop('checked', false);
                    $('#women').prop('checked', true);
                }
            }
        );

        return $('#myMessage').validate({
            debug: false,
            onkeyup: false,
            rules: {
                'huname': {
                    required: true
                },
                'email': {
                    required: true,
                    isEmail: true
                },
                'phone': {
                    required: true,
                    isMobile: true
                },
                'rname': {
                    required: true,
                    isName: true
                },
            },
            messages: {}
        });
    }

    function update() {
        if($('#myMessage').valid()){
            $.post("" + "/huser/update",
                $("#myMessage").serialize(),
                function (data) {
                    if (data.result === 'success') {
                        $('#myModal').modal('hide');
                        swal(data.message, "", "success");
                    } else {
                        swal(data.message, "", "error");
                    }
                }
            );
        }

    }

    function changePassword() {
        if($('#newPassword').val() === $('#conPassword').val()){
            if($('#myPassword').valid()){
                $.post("" + "/huser/change_password",
                    $("#myPassword").serialize(),
                    function (data) {
                        if (data.result === 'success') {
                            $('#myPasswordModal').modal('hide');
                            swal(data.message, "", "success");
                        } else {
                            $('.error-msg').text(data.message).addClass('show');
                        }
                    }
                );
            }
        }else {
            $('.error-msg').text("新密码和确认密码不一致").addClass('show');
        }

    }

    function openChangePassword() {
        $(":password").val("");
        $('#myPasswordModal').modal();
        $('.error-msg').text("");
        $('.error-msg').hide();
        return $('#myPassword').validate({
            onfocusout: function (element) {
                $(element).valid();
            },
            debug: false,
            onkeyup: false,
            rules: {
                'password': {
                    required: true
                },
                'newPassword': {
                    required: true
                },
                'conPassword': {
                    required: true
                },

            },
            messages: {}
        });
    }
</script>
</html>
