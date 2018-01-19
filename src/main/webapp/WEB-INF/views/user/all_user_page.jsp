<%--
  Created by IntelliJ IDEA.
  User: qiu
  Date: 2018/1/18
  Time: 14:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>所有用户</title>
    <link href="<%=path%>/static/css/bootstrap.min.css" rel="stylesheet">
    <%@include file="../common/css/css_sweetalert.jsp" %>
    <%@include file="../common/css/css_bootstrap-table.jsp" %>
</head>
<body>
<div>
    <h4 >所有用户</h4>
    <div id="toolbar">
        <button id="seeButton" class="btn btn-primary" onclick="seeDetail()">查看认证详情</button>
    </div>
    <table id="allUser"
           data-toggle="table"
           data-show-columns="false"
           data-height="460"
           data-toolbar="#toolbar"
           data-click-to-select="true"
           data-show-refresh="true"
           data-cookie="true"
           data-cookie-id-table="saveId"
           data-pagination="true"
           data-search="false"
           data-url="<%=path%>/user/pager_user"
           data-side-pagination="server">
        <thead>
        <tr>
            <th data-radio="true"></th>
            <th data-field="uname" data-formatter=formatNull>用户名</th>
            <th data-field="phone">手机</th>
            <th data-field="rname" data-formatter=formatNull>真实姓名</th>
            <th data-field="email" data-formatter=formatNull>邮箱</th>
            <th data-field="sex" data-formatter=formatNull>性别</th>
            <th data-field="isVip" data-formatter=formatVip>是否为vip</th>
            <th data-field="registerTime" data-formatter=formatDate>注册时间</th>
        </tr>
        </thead>

    </table>

    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title" id="myModalLabel">认证详情</h4>
                </div>
                <div class="modal-body">
                    <div>
                        <form class="form-horizontal" id="rzDetail">
                            <div class="form-group">
                                <div class="col-sm-2 control-label">学历</div>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="xl" id="xl" readonly/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-2 control-label">婚否</div>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="ism" id="ism"  readonly/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-2 control-label">毕业院校</div>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="bschool" id="bschool" readonly/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-2 control-label">居住地</div>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="addr" id="addr"  readonly/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-2 control-label">工作</div>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="work" id="work"  readonly/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-2 control-label">年龄</div>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="age" id="age"  readonly/>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                </div>
            </div>
        </div>
    </div>

</div>

<script src="<%=path%>/static/js/jquery.min.js"></script>
<script src="<%=path%>/static/js/bootstrap.min.js"></script>
<script src="<%=path%>/static/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
<script src="<%=path%>/static/js/plugins/bootstrap-table/bootstrap-table-mobile.min.js"></script>
<script src="<%=path%>/static/js/our/site_bootstrap_table.js"></script>
<script src="<%=path%>/static/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
<%@include file="../common/js/js_form.jsp" %>
<%@include file="../common/js/js_sweetalert.jsp" %>
<script>

    function seeDetail() {
        var select = $("#allUser").bootstrapTable('getSelections');
        if(select.length == 1){
            if(select[0].isVip == 1){
                $.post('/user/get_rz_detail/' + select[0].uid,
                    null,
                    function (data) {
                        $('#myModal').modal();
                        $('#rzDetail').form('load', data);
                    }, 'json');
            }else{
                swal("请选择一个vip用户","","warning")
            }
        }else{
            swal("请选择一个用户","","warning")
        }

    }

    function formatVip(value) {
        if(value == 1){
            return "是";
        }else {
            return "否";
        }
    }

    function formatNull(value) {
        if(value == null){
            return ""
        }

        return value;
    }
    function formatDate(value) {
        if (value == undefined || value == null || value == '') {
            return "";
        } else {
            var date = new Date(value);
            var year = date.getFullYear().toString();
            var month = (date.getMonth() + 1);
            var day = date.getDate().toString();
            var hour = date.getHours().toString();
            var minutes = date.getMinutes().toString();
            var seconds = date.getSeconds().toString();
            if (month < 10) {
                month = "0" + month;
            }
            if (day < 10) {
                day = "0" + day;
            }
            if (hour < 10) {
                hour = "0" + hour;
            }
            if (minutes < 10) {
                minutes = "0" + minutes;
            }
            if (seconds < 10) {
                seconds = "0" + seconds;
            }
            return year + "-" + month + "-" + day + " " + hour + ":" + minutes + ":" + seconds;
        }
    }
</script>
</body>
</html>
