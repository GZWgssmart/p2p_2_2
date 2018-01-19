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
<%@include file="../../user/top.jsp"%>
<%@include file="../../common/index/head_page.jsp"%>
<input type="hidden" id="user" value="${sessionScope.user.uid}"/>


<div class="subject">
    <div class="subject-submit">
        <div class="subject-submit-l" style="display: block;">
            <div class="subject-submit-title">
                <p id="borrowWayName">
                    <c:if test="${requestScope.borrow.type == 7}">
                        多金宝
                    </c:if>
                    <c:if test="${requestScope.borrow.type == 11}">
                        普金保
                    </c:if>
                    <c:if test="${requestScope.borrow.type == 9}">
                        恒金保
                    </c:if>
                    <c:if test="${requestScope.borrow.type == 10}">
                        新手标
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
                <input  type="hidden" id="kymoney"/>
                <p>可用余额：<span id="canUseSum">
                    <c:if test="${sessionScope.user == null}">
                        登录后可显示余额
                    </c:if>
                    <c:if test="${sessionScope.usermoney != null}">
                        ${sessionScope.usermoney.kymoney}元
                    </c:if>
                </span></p>
                <%--<p class="rate">预期收益：<span class="color" id="reckon">0.00</span></p>--%>
            </div>
            <div class="subject-s-r-c">
                <input type="hidden" id="symoney" value="${requestScope.borrow.symoney}"/>
                <p>剩余可投：<span id="investAmount">${requestScope.borrow.symoney}元</span></p>
                <p class="rate active" id="increaseP">加息收益：<span class="color" id="increase">0.00</span></p>
            </div>
            <div class="input">
                <input type="text" placeholder="请输入投资金额" id="amount" onkeyup="reckon()" onblur="focusblur(this)">
                <c:if test="${requestScope.borrow.state ==1}">
                    <button type="button" id="pushAll" onclick="invsetAll()">全投</button>
                </c:if>
            </div>
            <div class="quan">
                <select id="selectQuan">

                </select>
                <a href="javaScript:;" onclick="calculuteEarn()" class="icon icon-cal" id="calculator">详细收益明细</a>
            </div>
            <c:if test="${requestScope.borrow.state ==1}">
                <button class="btn" id="investBtn" type="button" onclick="bid()">立即投标</button>
            </c:if>
            <c:if test="${requestScope.borrow.state ==4}">
                <button class="btn  disabled" id="investBtn" type="button" style="">还款中</button>
            </c:if>
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
            <p class="title">募集资金：</p><p class="content" id="projectAmount">${requestScope.borrow.money - requestScope.borrow.symoney}元</p>
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
            <li class="">
                <img alt="" width="320" height="200" src="<%=path%>"+${requestScope.borrow.qpic}>
                <p>
                    <span class="icon icon-true">营业执照</span>
                </p>
                <a href="javascript:;" onclick="showBigImg(0,2)" style="display: none;">点击查看大图</a>
            </li>
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
<%@include file="../../common/index/foot_page.jsp" %>
</div>
<input type="hidden" id="juid" value="${requestScope.borrow.uid}">
<input type="hidden" id="nprofit" value="${requestScope.borrow.nprofit}">
<input type="hidden" id="cpname" value="${requestScope.borrow.cpname}">
<input type="hidden" id="baid" value="${requestScope.borrow.baid}">
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

    $(function () {
        var userId = $('#user').val();
        if(userId != null && userId != "" && userId != undefined){
            $.post(contextPath + "/user/user_money/"+userId,
                null,
                function (data) {
                    if (data != null) {
                        $('#canUseSum').text(data.kymoney+".00元");
                        $('#kymoney').val(data.kymoney);
                    }
                }, "json"
            );
        }else {
        }
    })

    function calculuteEarn() {
        var money = $('#amount').val();
        var nprofit = ${requestScope.borrow.nprofit};
        var term = ${requestScope.borrow.term};
        var bzid = ${requestScope.borrow.bzid};
        window.location.href='/borrowdetail/calculate_earn_page?money='+money+'&nprofit='+nprofit+'&term='+term+'&bzid='+bzid;
    }

    function bid(){
        var value = $('#amount').val();
        var user = $('#user').val();
        if(user != null && user != "" && user != undefined) {
            if (value >= 100) {

                var symoney = $('#symoney').val();
                if(value <= symoney){
                    var text = $('#selectQuan').find("option:selected").text();
                    text = text.substring(0, text.lastIndexOf('元优惠券'));
                    var money = value - text;

                    swal({
                        title: '需支付'+money+'元',
                        text: '请输入支付密码',
                        input: 'password'
                    }).then(function(obj) {
                        $.post(contextPath + "/user/con_pay_pwd/"+user+"/"+obj.value,
                            null,
                            function (data) {
                                if (data.result == "success") {
                                    //支付密码正确
                                    $.post(contextPath + "/tzb/save/",
                                        {
                                            "uid":user,
                                            "juid":$('#juid').val(),
                                            "money":value,
                                            "nprofit":$('#nprofit').val(),
                                            "cpname":$('#cpname').val(),
                                            "baid":$('#baid').val(),
                                            "tid": $('#selectQuan').find("option:selected").val()
                                        },
                                        function (data) {
                                            if (data.result == "success") {
                                                swal(data.message,"","success" )
                                                window.location.reload();
                                            }else{
                                                swal(data.message,"","warning" )
                                            }
                                        }, "json"
                                    );
                                }else{
                                    //支付密码错误
                                    swal(data.message,"","warning" )
                                }
                            }, "json"
                        );
                    });
                }else{
                    swal("您输入的金额大于剩余可投金额","","warning" )
                }
            } else {
                swal("投资金额必须大于100", "", "warning");
            }
        }else{
            swal("您还未登录登录，请先登陆","","warning");
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
