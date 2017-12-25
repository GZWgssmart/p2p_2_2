var contextPath = '';
function checkVip() {

    $.get(contextPath + '/user/checkVip',
        function (data) {
            if (data.result === 'success') {
                window.location.href = contextPath + '/user/all_borrow_money_page';
            } else {
                swtAlert.request_fail_no_timer(data.message);
            }
        }, 'json');
}