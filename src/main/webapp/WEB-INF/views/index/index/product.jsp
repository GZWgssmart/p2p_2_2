<%--
  Created by IntelliJ IDEA.
  User: ID.LQF
  Date: 2018/1/12
  Time: 20:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <meta charset=UTF-8">
    <title>项目介绍</title>
</head>
<body>
<div class="account-right-nav">
    <div class="sub-a-nav">
        <a href="javascript:void(0);" class="active">恒金保</a>
        <a href="javascript:void(0);" class="">普金保</a>
        <a href="javascript:void(0);" class="">多金宝</a>
    </div>
    <em class="em-line"></em>
</div>
<div class="account-content">
    <div class="content">
        <p class="text">
            以保理公司持有的大型知名企业签发并承兑的商业承兑汇票为还款保障的金融产品，借款到期时，保理公司以承兑企业无条件支付的票面资金用于归还借款本息。
        </p>
        <img src="<%=path %>/static/images/product/hengjin.png" style="width:890px;" class="img">
    </div>
    <div class="content">
        <p class="text">
            基于供应链上下游的采购贸易，为采购方或项目方提供融资，融资方以应收账款质押、保证金担保等形式为借款提供担保。
        </p>
        <img src="<%=path %>/static/images/product/pujin.png" style="width:890px;" class="img">
    </div>
    <div class="content">
        <p class="text">
            企业由于生产经营周转或项目投资需要资金，提供足值的不动产或动产作为抵质押物申请借款。
        </p>
        <img src="<%=path %>/static/images/product/duojin.png" class="img">
    </div>
</div>
</body>
</html>
