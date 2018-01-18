<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>



    function loadPage(url) {
        $('.about-right').load(url);
    }

    //平台运营信息
    function ptyy() {
        //平台运营
        $(".about-right").load("/user/ydate");
    }

    function gdbj() {
        //股东背景
        $(".about-right").load("/index/gdbj");
    }

    //公司简介
    function gsjj() {
        loadPage("/index/gsjj");
    }

    //平台资质
    function ptzz() {
        loadPage("/index/ptzz");
    }

    //顾问团队
    function tdgw() {
        loadPage("/index/tdgw");
    }

    //招贤纳士
    function zxns() {
        loadPage("/index/zxns");
    }

    //从业机构信息
    function cyjgxx() {
        loadPage("/index/cyjgxx");
    }

    //借款项目信息
    function jkxmxx() {
        loadPage("/index/jkxmxx");
    }

    //联系我们
    function lxwm() {
        loadPage("/index/lxwm");
    }

    var isClick = false;
    function animate1() {
        isClick = !isClick;
        if (isClick) {
            $("#animateDiv").animate({height:"175px"},500);
            $("#animateUl").empty();
            $("#animateUl").html(
                '<li class="xxpl"><a href="javaScript:void(0);" onClick="animate1()" ' +
                'class="icon-about about-xxpl">信息披露</a></li>'
                +'<li class="cyjgxx"><a href="#cyjg" class="icon-about about-cyjg" ' +
                'onclick="cyjgxx();">从业机构信息</a></li>'
                +'<li class="ptyy"><a href="javaScript:void(0)" onclick="ptyy();"' +
                ' class="icon-about about-ptyy">平台运营信息</a></li>'
                +'<li class="jkxmxx"><a href="#jkxm" class="icon-about about-jkxm" ' +
                'onclick="jkxmxx();">借款项目信息</a></li>');
            $('.cyjg').show();
            $('.ptyy').show();
            $('.jkxm').show();
        }
        else {
            $("#animateDiv").animate({height:"45px"},500);
            setTimeout(function() {
                $('.cyjgxx').hide();
                $('.ptyy').hide();
                $('.jkxmxx').hide();
            },500)
            location.hash='gdbj';
        }
    }
</script>