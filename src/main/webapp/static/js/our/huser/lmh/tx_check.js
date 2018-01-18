var txCheck = {
    id: {
        priTab: 'txCheck-list',
        saveModal: 'save-excuse-modal',
        saveForm: 'save-excuse-form'
    },
    url: {
        pri: '/tx_check/pager_criteria',
        checkOk: '/tx_check/check_ok',
        checkNo: '/tx_check/check_no'
    },
    fmt: {
        fmtState: function (value) {
            if (value === 0) {
                return '审核不通过';
            } else {
                return '审核中';
            }
        }
    },
    open: {
        checkNo: function () {
            setTable.showModal(txCheck.id.saveModal);
        }
    },
    submit: {
        search: function () {
        },
        checkOk: function () {
            var row = setTable.isSingleSelected(txCheck.id.priTab);
            if (row) {
                var jsonData = {
                    'rcid': row.rcid,
                    'txid': row.txid,
                    'isok': 1,
                    'excuse': ''
                };
                txCheck.submit.check(jsonData);
            }
        },
        checkNo: function () {
            var row = setTable.isSingleSelected(txCheck.id.priTab);
            if (row) {
                var excuse = $('#excuse-input').val();
                var jsonData = {
                    'rcid': row.rcid,
                    'txid': row.txid,
                    'isok': 0,
                    'excuse': excuse
                };
                txCheck.submit.check(jsonData);
            }
        },
        check: function (jsonData) {
            if (row.state === 2) {
                swal({
                    title: dataDict.manage.checkConfirm,
                    text: dataDict.manage.noCancelMsg,
                    type: 'warning',
                    showCancelButton: true
                }).then(function (isConfirm) {
                    if (isConfirm.value) {
                        $.post(contextPath + url,
                            jsonData,
                            function (data) {
                                if (data.result === 'success') {
                                    swtAlert.request_success(data.message);
                                    $('#' + tableId).bootstrapTable('refresh');
                                } else {
                                    swtAlert.request_fail(data.message);
                                }
                            }, 'json');
                    }
                });
            } else {
                swtAlert.warnNoTimer('请选择 未审核 的数据进行操作');
            }
        }
    }
};