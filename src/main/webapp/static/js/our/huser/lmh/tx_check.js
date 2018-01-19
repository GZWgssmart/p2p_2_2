var txCheck = {
    id: {
        priTab: 'txCheck-list',
        saveModal: 'save-excuse-modal',
        saveForm: 'save-excuse-form'
    },
    url: {
        pri: '/tx_check/pager_criteria',
        check: '/tx_check/check',
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
            var row = setTable.isSingleSelected(txCheck.id.priTab);
            if (row) {
                if (row.state === 2) {
                    setTable.showModal(txCheck.id.saveModal);
                } else {
                    swtAlert.warnNoTimer('请选择 审核中 的数据进行操作');
                }
            }
        }
    },
    submit: {
        search: function () {
        },
        checkOk: function () {
            var row = setTable.isSingleSelected(txCheck.id.priTab);
            if (row) {
                if (row.state === 2) {
                    var jsonData = {
                        'rcid': row.rcid,
                        'txid': row.txid,
                        'isok': 1,
                        'excuse': ''
                    };
                    swal({
                        title: dataDict.manage.checkConfirm,
                        text: dataDict.manage.noCancelMsg,
                        type: 'warning',
                        showCancelButton: true
                    }).then(function (isConfirm) {
                        if (isConfirm.value) {
                            $.post(contextPath + txCheck.url.check,
                                jsonData,
                                function (data) {
                                    if (data.result === 'success') {
                                        swtAlert.request_success(data.message);
                                        setTable.postRefresh(txCheck.id.priTab);
                                    } else {
                                        swtAlert.request_fail(data.message);
                                    }
                                }, 'json');
                        }
                    });
                } else {
                    swtAlert.warnNoTimer('请选择 审核中 的数据进行操作');
                }
            }
        },
        checkNo: function () {
            var row = setTable.isSingleSelected(txCheck.id.priTab);
            if (row) {
                var excuseInput = $('#excuse-input');
                var excuse = excuseInput.val();
                var jsonData = {
                    'rcid': row.rcid,
                    'txid': row.txid,
                    'isok': 0,
                    'excuse': excuse
                };
                $.post(contextPath + txCheck.url.check,
                    jsonData,
                    function (data) {
                        if (data.result === 'success') {
                            swtAlert.request_success(data.message);
                            setTable.postRefresh(txCheck.id.priTab);
                            setTable.hideModal(txCheck.id.saveModal);
                            excuseInput.val('');
                        } else {
                            swtAlert.request_fail(data.message);
                        }
                    }, 'json');
            }
        }
    }
};