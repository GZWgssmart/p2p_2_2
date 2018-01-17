<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%--
  Created by IntelliJ IDEA.
  User: qiu
  Date: 2018/1/12
  Time: 15:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>我要投资-普金资本-安全可靠专注于供应链金融的国资背景P2P理财平台</title>
    <meta name="keywords" content="投资理财产品，小额投资理财，投资理财公司，个人理财、供应链金融产品，三方存管">
    <meta name="description" content="普金资本是目前国内知名的拥有国资背景的资理财公司，为投资理财用户提供多样的投资理财产品。投资额度小，短期投资周转快，高收益的安全理财尽在普金资本。">
    <link rel="stylesheet" href="<%=path%>/static/css/index/qrl/public.css">
    <link rel="stylesheet" href="<%=path%>/static/css/index/qrl/index.css">
    <link rel="icon" href="https://www.pujinziben.com/resources/front/v01/src/images/logo_title.jpg" type="image/x-icon">
    <%@include file="../../common/css/css_bootstrap-table.jsp"%>
    <%@include file="../../common/css/css_sweetalert.jsp"%>
    <%--<%@include file="../../common/css/css_bootstrap.jsp"%>--%>
</head>
<body>
<!--[if lt IE 8]>
<div class="show-danger">您正在使用 <strong>过时的</strong> 浏览器. 是时候 <a href="http://browsehappy.com/">更换一个更好的浏览器</a> 来提升用户体验.</div>
<![endif]-->
<!-- top -->
<div class="top" id="top">
    <!-- top -->
    <div class="wrap">
        <div class="top-left icon icon-phone">
            <span>客服热线：</span>400-606-2079 <span>（8:30～17:30）</span>
        </div>
        <div class="top-right cl">
            <ul class="top-list">
                <li class="first"><a href="javascript:void(0);" class="">退出</a></li>
                <li><a href="https://www.pujinziben.com/account.html#tuijian" class="icon icon-inv">邀请有礼</a></li>
                <li><a href="https://www.pujinziben.com/about.html#gdbj">关于我们</a></li>
                <li><a href="https://www.pujinziben.com/help.html">帮助中心</a></li>
                <li><a href="https://www.pujinziben.com/account.html#ipay" class="pay">充值</a></li>
                <li id="userName"><a href="<%=path%>/user/login_page" >登录</a></li>
                <li class="no"><a href="javascript:void(0);" class="icon icon-app" id="app">APP下载</a></li>
            </ul>
            <div id="qrCodeDiv" style="display: none;">
                <div class="CodeDiv">
                    <img src="<%=path%>/static/images/index/qrl/qrCode_ios.png">
                    <p>IOS下载</p>
                </div>
                <div class="CodeDiv">
                    <img src="<%=path%>/static/images/index/qrl/qrCode_android.png">
                    <p>Android下载</p>
                </div>
            </div>
        </div>
    </div>

</div>
<input type="hidden" id="user" value="${sessionScope.user.uid}"/>

<!-- nav -->
<div class="nav">
    <div class="wrap cl">
        <div class="logo"><a href="<%=path%>/"><img src="<%=path%>/static/images/index/qrl/logo.png" alt="普金资本"></a></div>
        <div class="nav-bar">
            <ul>
                <li class="icon icon-acc"><a href="https://www.pujinziben.com/account.html">我的账户</a></li>
                <!-- <li><a href="javascript:void(0);">信息披露</a></li> -->
                <li><a href="https://www.pujinziben.com/about.html">信息披露</a></li>
                <!-- <li><a href="javascript:void(0);" onclick="newPointer()">新手指导</a></li> -->
                <li><a href="https://www.pujinziben.com/safety.html">安全保障</a></li>
                <li class="active">
                    <a href="https://www.pujinziben.com/investlist.html">投资理财</a>
                    <div class="sub-nav">
                        <a href="https://www.pujinziben.com/investlist.html#006">恒金保</a>
                        <a href="https://www.pujinziben.com/investlist.html#004">普金保</a>
                        <a href="https://www.pujinziben.com/investlist.html#003">多金宝</a>
                        <a href="https://www.pujinziben.com/investlist.html#005">新手标</a>
                        <a href="https://www.pujinziben.com/creditorlist.html">债权转让</a>
                        <p class="left"></p>
                        <p class="right"></p>
                    </div>
                </li>
                <li><a href="<%=path%>/">首页</a></li>
            </ul>
        </div>
    </div>
</div>
<div class="subject">
    <div class="subject-submit">
        <div class="subject-submit-l" style="display: block;">
            <div class="subject-submit-title">
                <p id="borrowWayName">
                    <c:if test="${requestScope.borrow.type == 1}">
                        多金宝
                    </c:if>
                    <c:if test="${requestScope.borrow.type == 2}">
                        普金保
                    </c:if>
                    <c:if test="${requestScope.borrow.type == 3}">
                        恒金保
                    </c:if>
                    <c:if test="${requestScope.borrow.type == 4}">
                        新手标
                    </c:if>
                    <c:if test="${requestScope.borrow.type == 5}">
                        老手标
                    </c:if>
                </p>
                <h3 id="borrowTitle">${requestScope.borrow.cpname}</h3>
            </div>
            <div class="subject-submit-detail">
                <div class="subject-submit-rate">
                    <p>预期年化收益</p>
                    <p class="text color"><span class="color" id="rate">${requestScope.borrow.nprofit}</span>%</p>
                </div>
                <div class="subject-submit-date">
                    <p>项目期限</p>
                    <p class="text" id="date"><span>${requestScope.borrow.term}</span>个月</p>
                </div>
                <div class="subject-submit-amt">
                    <p class="title_amt">募集总金额</p>
                    <p class="text"><span id="amt">${requestScope.borrow.money}</span>元</p>
                </div>
            </div>
            <div class="subject-submit-bottom">
                <div class="subject-submit-b-l">
                    <p>还款方式：<span id="paymentMode"></span>${requestScope.borrow.bidType}</p>
                    <p>最小投标金额：<span id="minTenderedSum">100.00元</span></p>
                </div>
                <div class="subject-submit-b-l">
                    <p>总投标数：<span id="investNum">${requestScope.borrow.bidCount}</span></p>
                    <p>最大投标金额：<span id="maxTenderedSum">${requestScope.borrow.symoney}元</span></p>
                </div>
                <div class="subject-submit-b-r">
                    <div class="line">
                        <p>投资进度：</p><p class="progress"><em style="width: ${requestScope.borrow.schedule}%;"></em></p><p class="progress-text">${requestScope.borrow.schedule}%</p>
                    </div>
                    <p>截止投标时间：<span id="publishTime"><fmt:formatDate value="${requestScope.borrow.deadline}" pattern="yyyy-MM-dd HH:mm:ss"/></span></p>
                </div>
            </div>
        </div>
        <div class="subject-submit-r" style="display: block;">
            <div class="subject-s-r-u">
                <c:if test="${sessionScope.user == null}">
                    <a href="<%=path%>/user/login_page" class="subject-login">登录</a>
                </c:if>
            </div>
            <div class="subject-s-r-c">
                <input value="${sessionScope.usermoney.kymoney}" type="hidden" id="kymoney"/>
                <p>可用余额：<span id="canUseSum">
                    <c:if test="${sessionScope.user == null}">
                        登录后可显示余额
                    </c:if>
                    <c:if test="${sessionScope.usermoney != null}">
                        ${sessionScope.usermoney.kymoney}元
                    </c:if>
                </span></p>
                <p class="rate">预期收益：<span class="color" id="reckon">0.00</span></p>
            </div>
            <div class="subject-s-r-c">
                <p>剩余可投：<span id="investAmount">${requestScope.borrow.symoney}元</span></p>
                <p class="rate active" id="increaseP">加息收益：<span class="color" id="increase">0.00</span></p>
            </div>
            <div class="input">
                <input type="text" placeholder="请输入投资金额" id="amount" onkeyup="reckon()" onblur="focusblur(this)">
                <button type="button" id="pushAll" onclick="invsetAll()">全投</button>
            </div>
            <div class="quan">
                <select id="selectQuan">

                </select>
                <a href="https://www.pujinziben.com/calculator.html?repayWay=3&amp;showRate=9+1&amp;time=6" class="icon icon-cal" id="calculator">详细收益明细</a>
            </div>
            <button class="btn" id="investBtn" type="button" onclick="bid()">立即投标</button>
        </div>
    </div>
</div>

<div class="sub-about">
    <div class="sub-a-nav">
        <a href="javascript:void(0);" class="active" onclick="getDetail(this)">项目详情</a>
        <a href="javascript:void(0);" onclick="getFile(this)" id="getFile">相关文件</a>
        <a href="javascript:void(0);" onclick="getPlan(this)" class="plan" id="getPlan">还款计划</a>
        <a href="javascript:void(0);" onclick="getInvest(this)" id="getInvest">投资记录</a>
        <a href="javascript:void(0);" onclick="dangger(this)">风险提示</a>
    </div>
    <em class="em-line"></em>
    <div class="sub-a-box" id="project" style="display: block;">
        <div class="detail cl">
            <p class="title">产品名称：</p><p class="content" id="projectTitle">${requestScope.borrow.cpname}</p>
        </div>
        <div class="detail cl">
            <p class="title">募集资金：</p><p class="content" id="projectAmount">132,254.00元</p>
        </div>
        <div class="detail cl">
            <p class="title">预期年化收益：</p><p class="content" id="projectRate">${requestScope.borrow.nprofit}%</p>
        </div>
        <div class="detail cl">
            <p class="title">起息日期：</p><p class="content">满标计息</p>
        </div>
        <div class="detail cl">
            <p class="title">资金用途：</p><p class="content" id="moneyPurposes">${requestScope.borrow.mpurpose}</p>
        </div>
        <div class="detail cl">
            <p class="title">收益方式：</p><p class="content" id="projectType">按月付息，到期还本</p>
        </div>
        <!-- <div class="detail cl">
            <p class="title">截止日期：</p><p class="content"></p>
        </div> -->
        <div class="detail cl">
            <p class="title">还款来源：</p><p class="content" id="retsource">${requestScope.borrow.hksource}</p>
        </div>
        <div class="detail cl">
            <p class="title">借款人介绍：</p><p class="content" id="projectIntro">${requestScope.borrow.suggest}</p>
        </div>
        <div class="detail cl">
            <p class="title">项目描述：</p><p class="content" id="projectDetail">${requestScope.borrow.xmdescrip}</p>
        </div>
        <div class="detail cl">
            <p class="title">保障措施：</p><p class="content" id="safeMeasures">${requestScope.borrow.guarantee}</p>
        </div>
    </div>
    <div class="sub-a-box files" id="files">
        <p class="icon icon-danger files-title">普金资本将以客观、公正的原则，最大程度地核实借入者信息的真实性，但不保证审核信息100%真实。如果借入者长期逾期，其提供的信息将被公布。</p>
        <ul class="files-box">
        </ul>
    </div>
    <div class="sub-a-box plan" id="plan">
        <ul class="">
            <li class="title"><div class="children0">序号</div><div class="children1">计划还款日期</div><div class="children2">实际还款日期</div><div class="children3">已还本息</div><div class="children4">待还本息</div><div class="children5">已付罚息</div><div class="children6">待还罚息</div><div class="children7">状态</div></li>
        </ul>
        <ul class="listData">
        </ul>
    </div>
    <div class="sub-a-box invest" id="invest">
        <div>
            <table id="investTable"
                   data-toggle="table"
                   data-show-columns="false"
                   data-height="460"
                   data-cookie="true"
                   data-cookie-id-table="saveId"
                   data-pagination="true"
                   data-classes="table table-no-bordered"
                   data-search="false"
                   data-url="<%=path%>/tzb/pager_invest_history_by_borrowId/?borrowId=${requestScope.borrow.baid}"
                   data-side-pagination="server">
                <thead>
                <tr>
                    <th data-field="phone" data-formatter=formatPhone >投资人</th>
                    <th data-field="money" data-formatter=formatMoney>投资金额</th>
                    <th data-field="time" data-formatter=formatDate>投资时间</th>
                </tr>
                </thead>

            </table>
        </div>
    </div>
    <div class="sub-a-box dangger" id="tips">
        <p class="icon icon-danger tips-title"><b>普金资本郑重提示：</b>用户应自行对交易风险进行全面了解、充分认识、谨慎决策，用户应对其决策承担全部责任并承担全部风险。如用户通过普金资本平
            台进行下一步操作，即表示已经认真阅读本提示书并完全了解与接受。</p>
        <div class="content">
            <p class="title">一、政策风险</p>
            <p>因国家宏观政策和相关法律法规发生变化，可能引起价格方面的异常波动，用户可能因此遭受损失。</p>
            <p class="title">二、信用风险</p>
            <p> 普金资本不对本金和收益提供任何保证或承诺。若平台项目发生逾期还款，由平台合作机构保理公司或担保公司在 30 个工作日内进行债权回购。合作机构在发生
                最不利情况下（可能但并不一定发生），项目进入司法程序，可能不利于用户实现项目的预期收益甚至本金遭受损失。</p>
            <p class="title">三、信息传递风险</p>
            <p>普金资本将按协议约定进行信息披露，用户应充分关注并及时主动查询交易信息，如未及时查询，或由于通讯故障、系统故障以及其他不可抗力等因素的影响使得
                无法及时了解交易信息，由此产生责任和风险应由用户承担。</p>
            <p class="title">四、不可抗力及意外事件风险</p>
            <p>包括但不限于自然灾害、金融市场危机、战争、黑客攻击、病毒感染等不能预见、不能避免、不能克服的不可抗力事件，对于由于不可抗力及意外事件风险导致的
                任何损失，客户须自行承担。</p>
            <p class="title">五、流动性风险</p>
            <p>用户提以债权转让方式通过普金资本平台进行转让的，普金资本不对债权转让完成的时间以及债权转让能否全部成功实现做出任何承诺，债权未成功转让的，用户
                面临资金不能变现、丧失其他投资机会的风险。</p>
            <p class="icon icon-danger"><span>特别提示：</span>本风险提示书不能穷尽全部风险及市场的全部情形。</p>
        </div>

    </div>
</div>
<div class="files-more">
    <p class="title">其他资料</p>
    <a href="javascript:void(0);" class="close icon icon-close"></a>
    <ul class="files-more-list">
    </ul>
</div>
<div class="popup hasPWD">
    <p class="title left">输入投标密码</p>
    <a href="javascript:void(0);" class="close icon icon-close"></a>
    <div class="popup-from">
        <div class="label cl">
            <label>投标密码</label><input type="password" id="password" maxlength="30" placeholder="请输入投标密码">
        </div>
        <button type="button" class="btn" id="haspwd-submit">立即投标</button>
    </div>
</div>
<div class="popup AgreeMent">
    <p class="title left">普金资本服务协议</p>
    <a href="javascript:void(0);" class="close icon icon-close"></a>
    <div class="popup-area">

    </div>
</div>
<div id="ajaxFooter">


    <div class="mod-sidebar">
        <ul>
            <li><a target="_blank" href="tencent://message/?uin=1332666988&amp;Site=&amp;Menu=yes" class="sidebar-qq"></a></li>
            <li><a href="javascript:void(0);" class="sidebar-wx"></a></li>
            <li><a href="https://www.pujinziben.com/calculator.html" class="sidebar-cl"></a></li>
            <li><a href="javascript:void(0);" class="wenquan" title="填写即送5元代金券"></a></li>
            <li><a href="javascript:void(0);" class="sidebar-top"></a></li>
        </ul>
    </div>
    <!-- concat -->
    <div class="index-concat">
        <div class="wrap cl">
            <div class="index-concat-left">
                <img src="<%=path%>/static/images/index/qrl/index_erweima.png" alt="扫码关注普金资本">
            </div>
            <div class="index-concat-phone">
                <p>财富热线</p>
                <h3>400-606-2079</h3>
            </div>
            <div class="index-concat-channel">
                <p class="about_cel_no">admin@pujinziben.com</p>
            </div>
            <div class="index-concat-link cl"><a href="javascript:;" class="title">友情链接</a><a target="_blank" href="http://www.p2peye.com/">网贷天眼</a><a target="_blank" href="http://www.wdtianxia.com/">网贷天下</a><a target="_blank" href="http://bank.pingan.com/">中国平安银行</a><a target="_blank" href="http://www.ccb.com/cn/home/indexv3.html">中国建设银行</a><a target="_blank" href="http://www.wangdaidongfang.com/">网贷东方</a><a target="_blank" href="http://www.p2p001.com/">第一网贷</a></div>
        </div>
    </div>
    <div class="footer">
        <div class="wrap">
            <p class="text">
                版权所有 © 普金资本运营（赣州）有限公司 All rights reserved <br>
                备案确认书：<a href="http://www.miitbeian.gov.cn/publish/query/indexFirst.action" target="_blank" class="beian">赣ICP备16004010号</a><a href="http://new.cnzz.com/v1/login.php?siteid=1260871948" target="_blank">  <img src="<%=path%>/static/images/index/qrl/CNZZ.png" alt=""></a>&nbsp;&nbsp;&nbsp;&nbsp;<a target="_blank" href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=36070202000195" style="display:inline-block;text-decoration:none;height:20px;line-height:20px;" class="beian"><img src="<%=path%>/static/images/index/qrl/beian.png" style="float:left;">赣公网安备 36070202000195号</a>

            </p>
            <div class="footer-list" style="width:650px;text-align:center">
                <a id="___szfw_logo___" href="https://credit.szfw.org/CX05252017016185201512.html" target="_blank"><img src="<%=path%>/static/images/index/qrl/foot2.png" border="0"></a>
                <!-- <a href="https://credit.cecdc.com/CX20160720023638001698.html"><img src="resources/front/v01/src/images/ft_link_01.png" alt=""></a> -->
                <a href="https://www.yunaq.com/analytics/login/?site=pujinziben.com" target="_blank"><img src="<%=path%>/static/images/index/qrl/ft_link_02.png" alt=""></a>
                <a href="http://si.trustutn.org/info?sn=685170725000594426611&amp;certType=4" target="_blank"><img width="110px" height="40px" src="<%=path%>/static/images/index/qrl/p2p_bottom_large_img.jpg" alt=""></a>
                <!-- 				<a href="http://webscan.360.cn/index/checkwebsite/url/www.pujinziben.com"><img width="110px" height="40px" border="0" src="http://img.webscan.360.cn/status/pai/hash/745ef449cbf0f6a74791f73d57aa7ac2"/></a> -->
                <a href="https://v.pinpaibao.com.cn/authenticate/cert/?site=www.pujinziben.com&amp;at=business" target="_blank">
                    <img src="<%=path%>/static/images/index/qrl/ft_link_04.png" alt="">
                </a>
                <a target="_blank" href="http://ec.eqixin.com/?sn=QX3712005910061483682343"><img width="112px" height="34px" src="<%=path%>/static/images/index/qrl/foot1.png"></a>
            </div>
        </div>
    </div>
    <div class="popup wechart-box">
        <p class="title left">关注普金资本微信公众号</p>
        <a href="javascript:void(0);" class="close icon icon-close"></a>
        <div class="popup-from">
            <img class="wechart" src="<%=path%>/static/images/index/qrl/wechart.jpg">
        </div>
    </div>
</div>

<%@include file="../../common/js/js_jquery.jsp"%>
<script type="text/javascript" src="<%=path%>/static/js/index/qrl/jquery.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/index/qrl/public.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/index/qrl/invest.js"></script>
<%@include file="../../common/js/js_boostrap_table.jsp"%>
<%@include file="../../common/js/js_sweetalert.jsp"%>
<%@include file="../../common/js/js_boostrap.jsp"%>
<script>

    $(function () {
        var userId = $('#user').val();
        if(userId != null && userId != "" && userId != undefined){
            $.post(contextPath + "/ticket/query_user_ticket/"+$('#user').val(),
                null,
                function (data) {
                    if (data.length != 0) {
                        for(i = 0; i < data.length;i++){
                            $('#selectQuan').append("<option value="+ data[i].id+">"+data[i].value+"元优惠券"+"</option>");
                        }
                    } else {
                        $('#selectQuan').append("<option value='0'>当前没有可用的优惠券</option>");
                    }
                }, "json"
            );
        }else {
            $('#selectQuan').append("<option>当前没有可用的优惠券</option>");
        }
    })

//    $(function () {
//        var userId = $('#user').val();
//        if(userId != null && userId != "" && userId != undefined){
//            $.post(contextPath + "/user/user_money/"+userId,
//                null,
//                function (data) {
//                    if (data != null) {
//                        $('#canUseSum').text(data.kymoney);
//                    }
//                }, "json"
//            );
//        }else {
//        }
//    })

    function bid(){
        var value = $('#amount').val();
        alert(value)
        if(value >= 100){
            var text = $('#selectQuan').find("option:selected").text();
            text = text.substring(0, text.lastIndexOf('元优惠券'));
            $('#money').val(value - text);
            swal({
                title: '输入交易密码',
                text:'asdf',
                input: 'password',
                preConfirm: function () {
                    
                }
            });
        }else{
            swal("投资金额必须大于100","","warning");
        }
    }

    function invsetAll() {
        var user = $('#user').val();
        if(user != null && user != "" && user != undefined){
            var residueMoney = $('#kymoney').val();
            var residueInvset = ${requestScope.borrow.symoney};
            if(residueMoney != 0){
                if(residueMoney <= residueInvset){
                    $('#amount').val(residueMoney);
                }else {
                    $('#amount').val(residueInvset);
                }
            }else{
                swal("您的可用余额为0，请您先充值","","warning");
            }
        }else {
            swal("您还未登录登录，请先登陆","","warning");
        }
    }

    function formatPhone(value) {
        var phone = "";
        for(i = 0; i < value.length;i++){
            if(i >= 3 && i< 7 ){
                phone = phone + "*";
            }else{
                phone = phone + value[i];
            }
        }

        return phone;
    }

    function formatMoney(value) {
        return value+".00";
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
