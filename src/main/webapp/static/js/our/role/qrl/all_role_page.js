function setDetail() {
    var select= $("#allRole").bootstrapTable('getSelections');
    if(select.length == 1){


            // $.post("/employee/changeStatus",
            //     {"id":select[0].id, "status":0},
            //     function (data) {
            //         if (data.controllerResult.result == 'success') {
            //             $("#table1").bootstrapTable('refresh');
            //             swal(data.controllerResult.message,"","success");
            //         } else {
            //             swal(data.controllerResult.message,"","error");
            //         }
            //     }, "json"
            // );

    }else{
        swal("请选择一行数据","","warning");
    }
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