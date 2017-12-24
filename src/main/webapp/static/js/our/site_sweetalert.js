$(function () {
    swal.setDefaults({
        confirmButtonText: '确认',
        cancelButtonText: '取消'
    });
});
var swtAlert = {
    warn_info: function (message) {
        swal({
            title: '提示！',
            text: message,
            type: 'warning'
        });
    },
    request_success: function (message) {
        swal({
            title: '成功！',
            text: message,
            type: 'success',
            timer: 1500
        });
    },
    request_fail: function (message) {
        swal({
            title: '失败！',
            text: message,
            type: 'error',
            timer: 1500
        });
    },
    request_fail_no_timer: function (message) {
        swal({
            title: '失败！',
            text: message,
            type: 'error'
        });
    },
    remove_rows: function (rows, url, tableId) {
        swal({
            title: dataDict.manage.removeConfirm,
            text: dataDict.manage.removeMsg,
            type: 'warning',
            showCancelButton: true
        }).then(function (isConfirm) {
            if (isConfirm.value) {
                var ids = setTable.convertSelectedId(rows);
                $.post(contextPath + url,
                    {'id': ids},
                    function (data) {
                        if (data.result === 'success') {
                            swtAlert.request_success(data.message);
                            $('#' + tableId).bootstrapTable('refresh');
                        } else {
                            swtAlert.request_fail(data.message);
                        }
                    },'json');
            }
        });
    }
};