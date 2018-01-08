function search() {
    var startTime = $('#startTime').val();
    var endTime = $('#endTime').val();
    var myDate = new Date();
    var myTime = myDate.toLocaleDateString();     //获取当前时间
    if (CompareDate(startTime,endTime) || CompareDate(endTime,myTime) || CompareDate(startTime,myTime)) {
        swtAlert.warn_info(dataDict.form.time);
    } else {
        setTable.doSearch('checkForm', 'recommend-list', '/recommend/search');
    }
}


function CompareDate(d1,d2)
{
    return ((new Date(d1.replace(/-/g,"\/"))) > (new Date(d2.replace(/-/g,"\/"))));
}

