var checkType = {
    formatType: function (value) {
        if (value === 0) {
            return '充值';
        } else if (value === 1) {
            return '提现';
        } else if (value === 2) {
            return '投资';
        } else if (value === 3) {
            return '收款（回款）';
        } else {
            return '还款';
        }
    }
}

function search() {
    var startTime = $('#startTime').val();
    var endTime = $('#endTime').val();
    var myDate = new Date();
    var myTime = myDate.toLocaleDateString();     //获取当前时间
    if (CompareDate(startTime,endTime) || CompareDate(endTime,myTime) || CompareDate(startTime,myTime)) {
        swtAlert.warn_info(dataDict.form.time);
    } else {
        setTable.doSearch('checkForm', 'money-log-list', '/moneyLog/search');
    }
}

function CompareDate(d1,d2)
{
    return ((new Date(d1.replace(/-/g,"\/"))) > (new Date(d2.replace(/-/g,"\/"))));
}
