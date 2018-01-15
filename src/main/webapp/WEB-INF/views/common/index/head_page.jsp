<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="nav">
    <div class="wrap cl">
        <div class="logo"><img src="<%=path %>/static/picture/logo.png" alt="普金资本"></div>
        <div class="nav-bar">
            <ul>
                <li><a href="javaScript:void(0);" id="myHome">我的账户</a></li>
                <li><a href="<%=path %>/user/about">信息披露 </a></li>
                <li><a href="<%=path %>/index/security">安全保障</a></li>
                <li>
                    <a href="/index/invest">投资理财</a>
                    <div class="sub-nav" id="bztop">
                    </div>
                </li>
                <li><a href="<%=path %>/index">首页</a></li>
            </ul>
        </div>
    </div>
</div>
<script type="text/javascript" src="<%=path%>/static/js/jquery.min.js"></script>
<script>
    $(function () {
        $.post("/bz/all_bz",
            function (data) {
                $("#bztop").html("");
                if(data.length != 0){
                    for(var i = 0, len = data.length;i < len;i++){
                        $("#bztop").append("<a href='<%=path%>/index/invest?bz=\""+data[i]+"\"'>"+data[i]+"</a>");
                        $("#bztop").append("<p class='left'></p><p class='right'></p>");
                    }
                }
            },"json"
        );
    });
</script>

