var contextPath = '';
function checkVip() {

    $.get(contextPath + '/user/checkVip',
        function (data) {
            if (data.result === 'success') {
                window.location.href = "/user/vip_page";
                //$('#content-main').append("<iframe class='J_iframe' name='iframe0' width='100%' height='100%' src='/user/vip_page' frameborder='0' data-id='/user/vip_page' seamless=''></iframe>");
            } else {
                swtAlert.request_fail_no_timer("充值金额大于一万，投资金额大于一千开启");

            }
        }, 'json');
}