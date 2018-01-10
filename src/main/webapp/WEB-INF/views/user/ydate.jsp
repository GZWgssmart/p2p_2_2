<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path1 = request.getContextPath();
%>
<div class="about-right-nav">
    <div class="sub-a-nav">
        <a href="javascript:void(0);" class="active" id="sssj">实时数据</a>
        <a href="javascript:void(0);" id="yybg" class="">运营报告</a>
    </div>
    <em class="em-line" style="left: 0px;"></em>
</div>

<div class="about-content" id="sssjDiv" style="display: block;">
    <div class="btnDiv">
        撮合交易总额（元）
    </div>
    <div class="moneyDiv">
        <div class="item_Div">3</div>
        <div class="marginLeft"></div>
        <div class="item_Div">4</div>
        <div class="marginLeft">,</div>
        <div class="item_Div">3</div>
        <div class="marginLeft"></div>
        <div class="item_Div">3</div>
        <div class="marginLeft"></div>
        <div class="item_Div">7</div>
        <div class="marginLeft">,</div>
        <div class="item_Div">9</div>
        <div class="marginLeft"></div>
        <div class="item_Div">0</div>
        <div class="marginLeft"></div>
        <div class="item_Div">7</div>
        <div class="marginLeft">.</div>
        <div class="item_Div">0</div>
        <div class="marginLeft"></div>
        <div class="item_Div">0</div>
        <div class="marginLeft"></div>
    </div>
    <div class="btnDiv">平台数据总览</div>
    <div class="sjList sjList-1">
        <div class="item">
            <div class="item-icon icon-dealNumber"></div>
            <div class="itemText">交易笔数（笔）</div>
            <div class="itemSJ" id="dealNumber">1,958</div>
        </div>
        <div class="item">
            <div class="item-icon icon-repayAmount"></div>
            <div class="itemText">已还本金（元）</div>
            <div class="itemSJ" id="repayAmount">22,401,677.26</div>
        </div>
        <div class="item">
            <div class="item-icon icon-unRepayAmount"></div>
            <div class="itemText">待还本金（元）</div>
            <div class="itemSJ" id="unRepayAmount">11,370,632.00</div>
        </div>
        <div class="item">
            <div class="item-icon icon-unRepayNumber"></div>
            <div class="itemText">待还笔数（笔）</div>
            <div class="itemSJ" id="unRepayNumber">27</div>
        </div>
        <div class="item">
            <div class="item-icon icon-hasInteres"></div>
            <div class="itemText">为用户创造的收益（元）</div>
            <div class="itemSJ" id="hasInterest">621,769.00</div>
        </div>
        <div class="item">
            <div class="item-icon icon-compensatoryMoney"></div>
            <div class="itemText">累计代偿金额（元）</div>
            <div class="itemSJ" id="compensatoryMoney">0.00</div>
        </div>
        <div class="item">
            <div class="item-icon icon-overdueMoney"></div>
            <div class="itemText">逾期金额（元）</div>
            <div class="itemSJ" id="overdueMoney">12.26</div>
        </div>
        <div class="item">
            <div class="item-icon icon-overdueNumber"></div>
            <div class="itemText">逾期笔数（笔）</div>
            <div class="itemSJ" id="overdueNumber">3</div>
        </div>
    </div>
    <div class="btnDiv btnDiv-P">平台用户数据</div>

</div>

<div class="about-content" id="monthDiv" style="display: none;">
    <div class="btnDiv" id="month">

    </div>
    <div class="moneyDiv">
        <div class="item_Div" id="money7">0</div>
        <div class="marginLeft"></div>
        <div class="item_Div" id="money6">0</div>
        <div class="marginLeft">,</div>
        <div class="item_Div" id="money5">0</div>
        <div class="marginLeft"></div>
        <div class="item_Div" id="money4">0</div>
        <div class="marginLeft"></div>
        <div class="item_Div" id="money3">0</div>
        <div class="marginLeft">,</div>
        <div class="item_Div" id="money2">0</div>
        <div class="marginLeft"></div>
        <div class="item_Div" id="money1">0</div>
        <div class="marginLeft"></div>
        <div class="item_Div" id="money0">0</div>
        <div class="marginLeft">.</div>
        <div class="item_Div" id="money-1">0</div>
        <div class="marginLeft"></div>
        <div class="item_Div" id="money-2">0</div>
        <div class="marginLeft"></div>
    </div>

    <div class="btnDiv">当月数据总览</div>
    <div class="sjList sjList-1">
        <div class="item">
            <div class="item-icon icon-dealNumber"></div>
            <div class="itemText">月交易总额（元）</div>
            <div class="itemSJ" id="mmoney">0</div>
        </div>
        <div class="item">
            <div class="item-icon icon-repayAmount"></div>
            <div class="itemText">总注册数（人）</div>
            <div class="itemSJ" id="tuser">0</div>
        </div>
        <div class="item">
            <div class="item-icon icon-unRepayAmount"></div>
            <div class="itemText">当月注册数（人）</div>
            <div class="itemSJ" id="muser">0</div>
        </div>
        <div class="item">
            <div class="item-icon icon-unRepayNumber"></div>
            <div class="itemText">总投资人数（人）</div>
            <div class="itemSJ" id="ttzno">0</div>
        </div>
        <div class="item">
            <div class="item-icon icon-hasInteres"></div>
            <div class="itemText">月投资人数（人）</div>
            <div class="itemSJ" id="mtzno">0</div>
        </div>
        <div class="item">
            <div class="item-icon icon-compensatoryMoney"></div>
            <div class="itemText">总贷款人数（人）</div>
            <div class="itemSJ" id="tdkno">0</div>
        </div>
        <div class="item">
            <div class="item-icon icon-compensatoryNumber"></div>
            <div class="itemText">月贷款人数（人）</div>
            <div class="itemSJ" id="mdkno">0</div>
        </div>
        <div class="item">
            <div class="item-icon icon-overdueMoney"></div>
            <div class="itemText">总贷款笔数（笔）</div>
            <div class="itemSJ" id="tdkbno">0</div>
        </div>
        <div class="item">
            <div class="item-icon icon-overdueNumber"></div>
            <div class="itemText">月贷款笔数（笔）</div>
            <div class="itemSJ" id="mdkbno">0</div>
        </div>

    </div>
    <div class="btnDiv btnDiv-P" onclick="back()" style="margin-top:-160px;line-height: 42px;background-color: #1815f5;">返回</div>
</div>

<div class="about-content" id="yybgDiv" style="display: none;">
    <div class="tableDiv">
        <div class="credit-right" id="right" style="margin-left:20px;">

            </div>
        </div>
    </div>
<script>

    $("#sssj").click(function () {
        $(this).attr("class", "active");
        $(".em-line").css("left", "0px");
        $("#sssjDiv").show();
        $("#yybgDiv").hide();
        $("#monthDiv").hide();
    });

    $("#yybg").click(function () {
        $(this).attr("class", "active");
        $(".em-line").css("left", "120px");
        $("#yybgDiv").show();
        $("#sssjDiv").hide();
        $("#monthDiv").hide();
    });

    function monthYdate(id,time) {
        $("#yybgDiv").hide();
        $("#monthDiv").show();
        $("#month").append(time+"交易总额");
        $.post("/ydate/month/"+id,
            function (data) {
                var stu = (data.tmoney+"").split(".");
                var j = 0;
                //初始化
                for(var i = 0; i < 8;i++){
                    $("#money"+i).html("").html(0);
                }
                $("#money-1").html("").append(0);
                $("#money-2").html("").append(0);
                $("#mmoney").html("").append(0);
                $("#tuser").html("").append(0);
                $("#muser").html("").append(0);
                $("#ttzno").html("").append(0);
                $("#mtzno").html("").append(0);
                $("#tdkno").html("").append(0);
                $("#mdkno").html("").append(0);
                $("#tdkbno").html("").append(0);
                $("#mdkbno").html("").append(0);

                //赋值
                for(var i = stu[0].length - 1, len = 0;i >= len; i--){
                    $("#money"+j).html("").append(stu[0][i]);
                    j++;
                }
                if(stu[1] != null){
                    //小数部分
                    $("#money-1").html("").append(stu[1][0]);
                    $("#money-2").html("").append(stu[1][1]);
                }

                $("#mmoney").html("").append(data.mmoney);
                $("#tuser").html("").append(data.tuser);
                $("#muser").html("").append(data.muser);
                $("#ttzno").html("").append(data.ttzno);
                $("#mtzno").html("").append(data.mtzno);
                $("#tdkno").html("").append(data.tdkno);
                $("#mdkno").html("").append(data.mdkno);
                $("#tdkbno").html("").append(data.tdkbno);
                $("#mdkbno").html("").append(data.mdkbno);

            },'json'
        );
    }

    function back() {
        $("#yybgDiv").show();
        $("#monthDiv").hide();
    }

 $(function () {
        $.post("/ydate/year",
            function (data) {
                $("#right").html("");
                for(var i = 0,len = data.length;i < len;i++){
                    $("#right").append("<div class='credit-pic' onclick='monthYdate(\""+data[i].yid+"\",\""+data[i].stringDate+"\")'>"+
                        "<img src='/static/images/about/20180103141607653.jpg' width='260' height='330'/>"+
                        "<span style='width: 260px; height: 330px; display: none;'>"+
                        "<span>"+data[i].stringDate+"</span>"+
                        "</span>"+
                        "</div>");
                }

                $('.credit-pic').hover(function () {
                    $(this).children('span').hide().fadeIn(500);
                }, function () {
                    $(this).children('span').hide().fadeOut(500);
                });
            },
            "json");

    });

</script>