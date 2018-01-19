<%--
  Created by IntelliJ IDEA.
  User: 123456
  Date: 2018/1/11
  Time: 20:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>我要投资-普金资本-安全可靠专注于供应链金融的国资背景P2P理财平台</title>
    <meta name="keywords" content="投资理财产品，小额投资理财，投资理财公司，个人理财、供应链金融产品，三方存管" />
    <meta name="description" content="普金资本是目前国内知名的拥有国资背景的资理财公司，为投资理财用户提供多样的投资理财产品。投资额度小，短期投资周转快，高收益的安全理财尽在普金资本。" />
    <link rel="stylesheet" href="<%=path%>/static/css/index/public.css">
    <link rel="stylesheet" href="<%=path%>/static/css/index/index.css">
</head>
<body>
<%@include file="../../user/top.jsp"%>
<%@include file="../../common/index/head_page.jsp" %>
<form id="condition">
    <input type="hidden" name="xmqx1" id="xmqx1" />
    <input type="hidden" name="xmqx2" id="xmqx2" />
    <input type="hidden" name="nysy1" id="nysy1" />
    <input type="hidden" name="nysy2" id="nysy2" />
    <input type="hidden" name="xmlx1" id="xmlx1" />
    <input type="hidden" name="pageNum" id="pageNum" value="1" />
</form>
<!-- invest list -->
<div class="invest-list">
    <div class="wrap">
        <div class="invest-top">
            <div class="invest-top-left">
                <div class="invest-top-list">
                    <p>项目期限：</p>
                    <ul id="xmqx">
                        <li class="active"><a>全部</a></li>
                        <li><a>1-3个月</a></li>
                        <li><a>3-6个月</a></li>
                        <li><a>6-9个月</a></li>
                        <li><a>大于9个月</a></li>
                    </ul>
                </div>
                <div class="invest-top-list">
                    <p>年化收益：</p>
                    <ul id="nysy">
                        <li class="active"><a>全部</a></li>
                        <li><a><=10%</a></li>
                        <li><a>10%-15%</a></li>
                        <li><a>15%-25%</a></li>
                    </ul>
                </div>
                <div class="invest-top-list">
                    <p>项目类型：</p>
                    <ul id="xmlx">

                    </ul>
                </div>
            </div>
            <div class="invest-top-right">
                <div class="invest-top-list">
                    <div class="textmiddle">借款标题</div>
                        <form id="searchForm">
                            <input type="text" name="search" class="text" id="claimm-can-title"/>
                        </form>
                    <button type="button" class="search" onclick="getListData($('#searchForm').serialize());" id="claimm-can-Search">搜索</button>
                </div>
            </div>
        </div>
        <div class="invest-list-bottom">
            <ul class="invest-row listData" id="listAllDate">
            </ul>
            <ul id="pageNumButton" class="paging cl" style="width: 500px; margin: 30px auto 0px auto;">
                <li><button type='button' class='pre' style="margin-left: 100px;">上一页</button></li>
                <li><button class='active' id='nowButton' type='button'>1</button></li>
                <li><button type='button' class='next'>下一页</button></li>
                <li><button type='button' class='next disabled' id="next"></button></li>
            </ul>
        </div>
    </div>
</div>
<div id="ajaxFooter"></div>
</body>
<script type="text/javascript" src="<%=path%>/static/js/jquery.min.js"></script>
<%@include file="../../common/js/js_sweetalert.jsp" %>
<script>
    $("#xmqx li").click(function () {
        $("#xmqx li").removeClass("active");
        $(this).addClass("active");
        var name = $(this).text();
        if(name == "全部"){
            $("#xmqx1").val("");
            $("#xmqx2").val("");
        }else if(name == "1-3个月"){
            $("#xmqx1").val("1");
            $("#xmqx2").val("3");
        }else if(name == "3-6个月"){
            $("#xmqx1").val("3");
            $("#xmqx2").val("6");
        }else if(name == "6-9个月"){
            $("#xmqx1").val("6");
            $("#xmqx2").val("9");
        }else{
            $("#xmqx1").val("9");
            $("#xmqx2").val("");
        }
        $("#pageNum").val("1");
        getListData($("#condition").serialize());
    });

    $("#nysy li").click(function () {
        $("#nysy li").removeClass("active");
        $(this).addClass("active");
        var name = $(this).text();
        if(name == "全部"){
            $("#nysy1").val("");
            $("#nysy2").val("");
        }else if (name == "<=10%"){
            $("#nysy1").val("");
            $("#nysy2").val("10");
        }else if(name == "10%-15%"){
            $("#nysy1").val("10");
            $("#nysy2").val("15");
        }else{
            $("#nysy1").val("15");
            $("#nysy2").val("20");
        }
        $("#pageNum").val("1");
        getListData($("#condition").serialize());
    });


    $(function () {
        $.post("/bz/all_bz",
            function (data) {
                if(data.length != 0){
                    if(!(${requestScope.bz == null || requestScope.bz == ""})){//http://localhost:8080/index/invest?bz=

                        $("#xmlx").html("<li><a>全部</a></li>");
                        for(var i = 0, len = data.length;i < len;i++){
                            if(data[i] == ${requestScope.bz} + "") {
                                $("#xmlx").append("<li class='active'><a>" + data[i] + "</a></li>");
                                $("#xmlx1").val(data[i]);
                            }else{
                                $("#xmlx").append("<li><a>"+data[i]+"</a></li>");
                            }
                        }
                    }else{//http://localhost:8080/index/invest
                        $("#xmlx").html("<li class='active'><a>全部</a></li>");
                        for(var i = 0, len = data.length;i < len;i++){
                            $("#xmlx").append("<li><a>"+data[i]+"</a></li>");
                        }
                    }
                }
                $("#xmlx li").bind("click",xmlxBind());
                getListData($("#condition").serialize());
            },"json"
        );
        //获取分页总页数

    });

    function xmlxBind() {
        $("#xmlx li").click(function () {
            if($(this).text() == "全部"){
                $("#xmlx1").val("");
            }else{
                $("#xmlx1").val($(this).text());
            }
            $("#pageNum").val("1");
            getListData($("#condition").serialize());
        });
    }

    function getListData(data) {
        $.post("/borrowapply/pager_criteria_byinvest",
            data,
            function (data) {
                var len = data.length;
                $("#listAllDate").html("");
                if(len == 0){
                    $("#listAllDate").append("<li class='none' style='line-height: 150px;'>没有符合条件的内容！</li>");
                }else{
                    //初始化数据
                    for(var i = 0;i < len;i++){
                        $("#listAllDate").append("<li>"+
                            "<div class='invest-title cl'>"+
                            "<p>"+data[i].lxname+"</p>"+
                            "<h3 onclick='aaaa(\""+data[i].baid+"\")'>"+data[i].cpname+"</h3>"+
                            "</div>"+
                            "<div class='invest-content cl'>"+
                            "<ul>"+
                            "<li class='row1'>"+
                            "<p class='row-top'>预期年化收益率</p>"+
                            "<p class='row-bottom color'>"+data[i].nprofit+"<span>%</span></p>"+
                            "</li>"+
                            "<li class='row2'>"+
                            "<p class='row-top'>项目期限</p>"+
                            "<p class='row-bottom'>"+data[i].term+"个月</p>"+
                            "</li>"+
                            "<li class='row3'>"+
                            "<p class='row-top'>还款方式</p>"+
                            "<p class='row-bottom'>"+data[i].bzname+"</p>"+
                            "</li>"+
                            "<li class='row4'>"+
                            "<p class='row-top'>可投金额 / 募集总额</p>"+
                            "<p class='row-bottom'>"+data[i].elseMoney+"元 / "+data[i].money+"元</p>"+
                            "</li>"+
                            "<li class='row5'>"+
                            "<div class='line'>"+
                            "<p class='progress fl'><em style='width: "+data[i].jindu+"%;'></em></p>"+
                            "<p class='progress-text'>"+data[i].jindu+"%</p>"+
                            "</div><p class='row-top'>募集进度</p>"+
                            "</li>"+
                            "<li onclick='aaaa(\""+data[i].baid+"\")' class='row6' id='row6"+i+"'>"+
                            "<button type='button' class='btn '>立即投标</button>"+
                            "</li>"+
                            "</ul></div></li>");

                        if(data[i].state == 4){
                            $("#row6"+i+" button").addClass("disabled").text("还款中");
                        }
                    }
                }
                //初始化分页按钮 总页数
               /* $("#next").text("共"+Math.ceil(len / 10)+"页");
                $("#pageNumButton li").bind("click",aaaa(Math.ceil(len / 10)));*/
            },"json"
        );
        //总页数
        $.post("/borrowapply/count_criteria_byinvest",
            data,
            function (data) {
                $("#next").text("共"+Math.ceil(data / 10)+"页");
            },"json"
        );
    }

        $("#pageNumButton li").click(function () {
            //点击的值
            var buttonText = $(this).text();
            //当前页
            var now = $("#pageNum").val();
            //总页数
            var num = $("#next").text().charAt(1);
            //点击上一页
            if(buttonText == "上一页"){
                if(now == "1"){
                    swa("已经是第一页","","warning");
                    return
                }else{
                    $("#nowButton").text(Number(now) - 1);
                    $("#pageNum").val(Number(now) - 1);
                    getListData($("#condition").serialize());
                }
            }else if(buttonText == "下一页"){
                if(Number(now) >= num){
                    swal("已经是最后一页","","warning");
                    return;
                }else{
                    $("#pageNum").val(Number(now)+1);
                    $("#nowButton").text(Number(now)+1);
                    getListData($("#condition").serialize());
                }
            }
        });

    function aaaa(id) {
        window.location.href = "<%=path%>/borrowdetail/detail_page/"+id;
    }
</script>
</html>