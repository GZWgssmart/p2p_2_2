<%--
  Created by IntelliJ IDEA.
  User: xdp
  Date: 2018/1/16
  Time: 10:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<div class="invest-list">
<div class="wrap">
    <div class="invest-top">
        <div class="invest-top-left">
            <div class="invest-top-list">
                <p>项目期限：</p>
                <ul class="cl">
                    <li class="active"><a href="http://pujinziben.com/investlist.html#0">全部</a></li>
                    <li><a href="http://pujinziben.com/investlist.html#1">1-3个月</a></li>
                    <li><a href="http://pujinziben.com/investlist.html#2">3-6个月</a></li>
                    <li><a href="http://pujinziben.com/investlist.html#3">6-9个月</a></li>
                    <li><a href="http://pujinziben.com/investlist.html#4">大于9个月</a></li>
                </ul>
            </div>
            <div class="invest-top-list">
                <p>年化收益：</p>
                <ul>
                    <li class="active"><a href="http://pujinziben.com/investlist.html#00">全部</a></li>
                    <li><a href="http://pujinziben.com/investlist.html#01">&lt;=10%</a></li>
                    <li><a href="http://pujinziben.com/investlist.html#02">10%-15%</a></li>
                    <li><a href="http://pujinziben.com/investlist.html#03">15%-25%</a></li>
                </ul>
            </div>
            <div class="invest-top-list">
                <p>项目类型：</p>
                <ul>
                    <li class="active"><a href="http://pujinziben.com/investlist.html#000">全部</a></li>
                    <li><a href="http://pujinziben.com/investlist.html#003">多金宝</a></li>
                    <li><a href="http://pujinziben.com/investlist.html#004">普金保</a></li>
                    <li><a href="http://pujinziben.com/investlist.html#006">恒金保</a></li>
                    <li><a href="http://pujinziben.com/investlist.html#005">新手标</a></li>
                    <li><a href="http://pujinziben.com/creditorlist.html">债权转让</a></li>
                </ul>
            </div>
        </div>
        <div class="invest-top-right">
            <div class="invest-top-list">
                <div class="textmiddle">借款标题</div>
                <input type="text" class="text" id="claimm-can-title">
                <button type="button" class="search" id="claimm-can-Search">搜索</button>
            </div>
        </div>
    </div>
    <div class="invest-list-bottom">
        <ul class="invest-row listData"><li class="interval"><div class="children0"><li><div class="invest-title cl"><p>多金宝</p><h3 onclick="toDetail(415)">PJ2017BZ0046(2)</h3></div><div class="invest-content cl"><ul><li class="row1"><p class="row-top">预期年化收益率</p><p class="row-bottom color">9+1<span>%</span></p></li><li class="row2"><p class="row-top">项目期限</p><p class="row-bottom">3个月</p></li><li class="row3"><p class="row-top">还款方式</p><p class="row-bottom">按月付息，到期还本</p></li><li class="row4"><p class="row-top">可投金额 / 募集总额</p><p class="row-bottom">9.18万元 / 50.00万元</p></li><li class="row5"><div class="line"><p class="progress fl"><em style="width: 81.64%;"></em></p><p class="progress-text">81.64%</p></div><p class="row-top">募集进度</p></li><li class="row6"><button type="button" class="btn " onclick="toInvest(415,2)">立即投标</button></li></ul></div></li></div></li><li><div class="children0"><li><div class="invest-title cl"><p>恒金保</p><h3 onclick="toDetail(414)">YC2017TD00012</h3></div><div class="invest-content cl"><ul><li class="row1"><p class="row-top">预期年化收益率</p><p class="row-bottom color">9+1<span>%</span></p></li><li class="row2"><p class="row-top">项目期限</p><p class="row-bottom">6个月</p></li><li class="row3"><p class="row-top">还款方式</p><p class="row-bottom">按月付息，到期还本</p></li><li class="row4"><p class="row-top">可投金额 / 募集总额</p><p class="row-bottom">7,168.53 元 / 13.23万元</p></li><li class="row5"><div class="line"><p class="progress fl"><em style="width: 94.57%;"></em></p><p class="progress-text">94.57%</p></div><p class="row-top">募集进度</p></li><li class="row6"><button type="button" class="btn " onclick="toInvest(414,2)">立即投标</button></li></ul></div></li></div></li><li class="interval"><div class="children0"><li><div class="invest-title cl"><p>新手标</p><h3 onclick="toDetail(416)">PJ2017JK0016</h3></div><div class="invest-content cl"><ul><li class="row1"><p class="row-top">预期年化收益率</p><p class="row-bottom color">12<span>%</span></p></li><li class="row2"><p class="row-top">项目期限</p><p class="row-bottom">1个月</p></li><li class="row3"><p class="row-top">还款方式</p><p class="row-bottom">按月付息，到期还本</p></li><li class="row4"><p class="row-top">可投金额 / 募集总额</p><p class="row-bottom">0.00 元 / 20.00万元</p></li><li class="row5"><div class="line"><p class="progress fl"><em style="width: 100.00%;"></em></p><p class="progress-text">100.00%</p></div><p class="row-top">募集进度</p></li><li class="row6"><button type="button" class="btn disabled" onclick="toInvest(416,4)">还款中</button></li></ul></div></li></div></li><li><div class="children0"><li><div class="invest-title cl"><p>多金宝</p><h3 onclick="toDetail(413)">PJ2017BZ0047</h3></div><div class="invest-content cl"><ul><li class="row1"><p class="row-top">预期年化收益率</p><p class="row-bottom color">9+1<span>%</span></p></li><li class="row2"><p class="row-top">项目期限</p><p class="row-bottom">3个月</p></li><li class="row3"><p class="row-top">还款方式</p><p class="row-bottom">按月付息，到期还本</p></li><li class="row4"><p class="row-top">可投金额 / 募集总额</p><p class="row-bottom">0.00 元 / 20.00万元</p></li><li class="row5"><div class="line"><p class="progress fl"><em style="width: 100.00%;"></em></p><p class="progress-text">100.00%</p></div><p class="row-top">募集进度</p></li><li class="row6"><button type="button" class="btn disabled" onclick="toInvest(413,4)">还款中</button></li></ul></div></li></div></li><li class="interval"><div class="children0"><li><div class="invest-title cl"><p>多金宝</p><h3 onclick="toDetail(411)">PJ2017BZ0028</h3></div><div class="invest-content cl"><ul><li class="row1"><p class="row-top">预期年化收益率</p><p class="row-bottom color">9+1<span>%</span></p></li><li class="row2"><p class="row-top">项目期限</p><p class="row-bottom">3个月</p></li><li class="row3"><p class="row-top">还款方式</p><p class="row-bottom">按月付息，到期还本</p></li><li class="row4"><p class="row-top">可投金额 / 募集总额</p><p class="row-bottom">0.00 元 / 50.00万元</p></li><li class="row5"><div class="line"><p class="progress fl"><em style="width: 100.00%;"></em></p><p class="progress-text">100.00%</p></div><p class="row-top">募集进度</p></li><li class="row6"><button type="button" class="btn disabled" onclick="toInvest(411,4)">还款中</button></li></ul></div></li></div></li><li><div class="children0"><li><div class="invest-title cl"><p>多金宝</p><h3 onclick="toDetail(410)">PJ2017BZ0051</h3></div><div class="invest-content cl"><ul><li class="row1"><p class="row-top">预期年化收益率</p><p class="row-bottom color">9+1<span>%</span></p></li><li class="row2"><p class="row-top">项目期限</p><p class="row-bottom">3个月</p></li><li class="row3"><p class="row-top">还款方式</p><p class="row-bottom">按月付息，到期还本</p></li><li class="row4"><p class="row-top">可投金额 / 募集总额</p><p class="row-bottom">0.00 元 / 50.00万元</p></li><li class="row5"><div class="line"><p class="progress fl"><em style="width: 100.00%;"></em></p><p class="progress-text">100.00%</p></div><p class="row-top">募集进度</p></li><li class="row6"><button type="button" class="btn disabled" onclick="toInvest(410,4)">还款中</button></li></ul></div></li></div></li><li class="interval"><div class="children0"><li><div class="invest-title cl"><p>多金宝</p><h3 onclick="toDetail(409)">PJ2017BZ0048(1)</h3></div><div class="invest-content cl"><ul><li class="row1"><p class="row-top">预期年化收益率</p><p class="row-bottom color">9+1<span>%</span></p></li><li class="row2"><p class="row-top">项目期限</p><p class="row-bottom">3个月</p></li><li class="row3"><p class="row-top">还款方式</p><p class="row-bottom">按月付息，到期还本</p></li><li class="row4"><p class="row-top">可投金额 / 募集总额</p><p class="row-bottom">0.00 元 / 50.00万元</p></li><li class="row5"><div class="line"><p class="progress fl"><em style="width: 100.00%;"></em></p><p class="progress-text">100.00%</p></div><p class="row-top">募集进度</p></li><li class="row6"><button type="button" class="btn disabled" onclick="toInvest(409,4)">还款中</button></li></ul></div></li></div></li><li><div class="children0"><li><div class="invest-title cl"><p>多金宝</p><h3 onclick="toDetail(408)">PJ2017BZ0040</h3></div><div class="invest-content cl"><ul><li class="row1"><p class="row-top">预期年化收益率</p><p class="row-bottom color">7<span>%</span></p></li><li class="row2"><p class="row-top">项目期限</p><p class="row-bottom">1个月</p></li><li class="row3"><p class="row-top">还款方式</p><p class="row-bottom">按月付息，到期还本</p></li><li class="row4"><p class="row-top">可投金额 / 募集总额</p><p class="row-bottom">0.00 元 / 20.00万元</p></li><li class="row5"><div class="line"><p class="progress fl"><em style="width: 100.00%;"></em></p><p class="progress-text">100.00%</p></div><p class="row-top">募集进度</p></li><li class="row6"><button type="button" class="btn disabled" onclick="toInvest(408,4)">还款中</button></li></ul></div></li></div></li><li class="interval"><div class="children0"><li><div class="invest-title cl"><p>多金宝</p><h3 onclick="toDetail(407)">PJ2017BZ0046(1)</h3></div><div class="invest-content cl"><ul><li class="row1"><p class="row-top">预期年化收益率</p><p class="row-bottom color">9+1<span>%</span></p></li><li class="row2"><p class="row-top">项目期限</p><p class="row-bottom">3个月</p></li><li class="row3"><p class="row-top">还款方式</p><p class="row-bottom">按月付息，到期还本</p></li><li class="row4"><p class="row-top">可投金额 / 募集总额</p><p class="row-bottom">0.00 元 / 50.00万元</p></li><li class="row5"><div class="line"><p class="progress fl"><em style="width: 100.00%;"></em></p><p class="progress-text">100.00%</p></div><p class="row-top">募集进度</p></li><li class="row6"><button type="button" class="btn disabled" onclick="toInvest(407,4)">还款中</button></li></ul></div></li></div></li><li><div class="children0"><li><div class="invest-title cl"><p>多金宝</p><h3 onclick="toDetail(406)">PJ2017BZ0044</h3></div><div class="invest-content cl"><ul><li class="row1"><p class="row-top">预期年化收益率</p><p class="row-bottom color">8+2<span>%</span></p></li><li class="row2"><p class="row-top">项目期限</p><p class="row-bottom">2个月</p></li><li class="row3"><p class="row-top">还款方式</p><p class="row-bottom">按月付息，到期还本</p></li><li class="row4"><p class="row-top">可投金额 / 募集总额</p><p class="row-bottom">0.00 元 / 100.00万元</p></li><li class="row5"><div class="line"><p class="progress fl"><em style="width: 100.00%;"></em></p><p class="progress-text">100.00%</p></div><p class="row-top">募集进度</p></li><li class="row6"><button type="button" class="btn disabled" onclick="toInvest(406,4)">还款中</button></li></ul></div></li></div></li></ul>
<ul class="paging cl" style="width: 500px; margin: 30px auto 0px;"><li><button type="button" class="pre">上一页</button></li><li class="active"><button type="button" data-num="1">1</button></li><li><button type="button" data-num="2">2</button></li><li><button type="button" data-num="3">3</button></li><li><button type="button" data-num="4">4</button></li><li><button type="button" data-num="5">5</button></li><li><button type="button" data-num="6">6</button></li><li><span>...</span></li><li><button type="button" data-num="9">9</button></li><li><button type="button" class="next">下一页</button></li></ul>
</div>
</div>
</div>


</body>
</html>
