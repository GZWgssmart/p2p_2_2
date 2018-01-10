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
            <div class="item-icon icon-compensatoryNumber"></div>
            <div class="itemText">累计代偿笔数（笔）</div>
            <div class="itemSJ" id="compensatoryNumber">0</div>
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
        <div class="item">
            <div class="item-icon icon-overtimeNumber"></div>
            <div class="itemText">逾期90天以上笔数（笔）</div>
            <div class="itemSJ" id="overtimeNumber">0</div>
        </div>
        <div class="item">
            <div class="item-icon icon-overtimeMoney"></div>
            <div class="itemText">逾期90天以上金额（元）</div>
            <div class="itemSJ" id="overtimeMoney">0.00</div>
        </div>
    </div>
    <div class="btnDiv btnDiv-P">平台用户数据</div>
    <div class="sjList sjList-2">
        <div class="item-yh">
            <i class="icon-userTotal"></i>
            <div class="itemText">注册用户数（人）</div>
            <div class="itemSJ color-b" id="userTotal">11,225</div>
        </div>
        <div class="item-yh">
            <i class="icon-investorCount"></i>
            <div class="itemText">累计出借人数量（人）</div>
            <div class="itemSJ color-g" id="investorCount">439</div>
        </div>
        <div class="item-yh">
            <i class="icon-borrowerCount"></i>
            <div class="itemText">累计借款人数量（人）</div>
            <div class="itemSJ color-y" id="borrowerCount">35</div>
        </div>
        <div class="item-yh">
            <i class="icon-avgUserInvest"></i>
            <div class="itemText">人均累计投资金额（元）</div>
            <div class="itemSJ color-b" id="avgUserInvest">78,218.47</div>
        </div>
        <div class="item-yh">
            <i class="icon-avgInvest"></i>
            <div class="itemText">笔均投资额（元）</div>
            <div class="itemSJ color-g" id="avgInvest">17,537.24</div>
        </div>
        <div class="item-yh">
            <i class="icon-investorNew"></i>
            <div class="itemText">当期出借人数量（人）</div>
            <div class="itemSJ color-y" id="investorNew">140</div>
        </div>
        <div class="item-yh">
            <i class="icon-borrowerNew"></i>
            <div class="itemText">当期借款人数量（人）</div>
            <div class="itemSJ color-b" id="borrowerNew">20</div>
        </div>
        <div class="item-yh">
            <i class="icon-AssociationNumber"></i>
            <div class="itemText">关联关系借款笔数（笔）</div>
            <div class="itemSJ color-g" id="AssociationNumber">0</div>
        </div>
        <div class="item-yh">
            <i class="icon-AssociationSum"></i>
            <div class="itemText">关联关系借款余额（元）</div>
            <div class="itemSJ color-y" id="AssociationSum">0.00</div>
        </div>
        <div class="item-yh">
            <i class="icon-borrowerPer"></i>
            <div class="itemText">前十大借款代还金额占比（%）</div>
            <div class="itemSJ color-b" id="borrowerPer">41.96</div>
        </div>
        <div class="item-yh">
            <i class="icon-bigBorrowerPer"></i>
            <div class="itemText">最大借款代还金额占比（%）</div>
            <div class="itemSJ color-g" id="bigBorrowerPer">7.00</div>
        </div>
    </div>
</div>

<div class="about-content" id="yybgDiv" style="display: none;">
    <div class="tableDiv">
        <div class="credit-right" id="right" style="margin-left:20px;">
                <div class="credit-pic" onclick="alert('1231231');">
                    <img src="resources/front/v01/src/images/about/ptzz_06_big.jpg" width="260" height="330">
                    <span style="width: 260px; height: 330px; display: none;">
                        <span>开户许可证</span>
                    </span>
                </div>
            </div>
        </div>
    </div>
<script>

    $("#sssj").click(function () {
        $(this).attr("class", "active");
        $(".em-line").css("left", "0px");
        $("#sssjDiv").show();
        $("#yybgDiv").hide();
    });

    $("#yybg").click(function () {
        $(this).attr("class", "active");
        $(".em-line").css("left", "120px");
        $("#sssjDiv").hide();
        $("#yybgDiv").show();
    });

    $(function () {
        $.post("/ydate/year",
            function (data) {
                //$("#right").html("");
                for(var i = 0,len = data.length;i < len;i++){
                    $("#right").append("<div class='credit-pic' onclick=''>"+
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