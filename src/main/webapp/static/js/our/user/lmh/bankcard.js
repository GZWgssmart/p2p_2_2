var bkCd = {
    id: {
        priTab: 'bankcard-list',
        saveModal: 'save-bankcard-modal',
        updateModal: 'update-bankcard-modal',
        saveForm: 'save-bankcard-form',
        updateForm: 'update-bankcard-form'
    },
    url: {
        pri: '/bankcard/pager_criteria',
        save: '/bankcard/save',
        update: '/bankcard/update',
        unbind: '/bankcard/remove/'
    },
    open: {
        saveModal: function () {
            setTable.showModal(bkCd.id.saveModal);
            return bkCd.valid.bankcard(bkCd.id.saveForm);
        },
        updateModal: function () {
            setTable.openUpdateModal(bkCd.id.priTab, bkCd.id.updateForm, bkCd.id.updateModal);
            return bkCd.valid.bankcard(bkCd.id.updateForm);
        }
    },
    valid: {
        bankcard: function (formId) {
            return $('#' + formId).validate({
                onfocusout: function (element) {
                    $(element).valid();
                },
                debug: false,
                onkeyup: false,
                rules: {
                    'cardno': {
                        required: true,
                        isBankCard: true
                    },
                    'rname': {
                        required: true,
                        isName: true
                    },
                    'idno': {
                        required: true,
                        isIdCardNo: true
                    },
                    'type': {
                        required: true
                    }
                },
                messages: {
                    'type': {
                        required: dataDict.form.noSelected
                    }
                }
            });
        }
    },
    submit: {
        save: function () {
            submitForm.save(contextPath + bkCd.url.save,
                bkCd.id.saveForm, bkCd.id.priTab, bkCd.id.saveModal);
        },
        update: function () {
            submitForm.update(contextPath + bkCd.url.update,
                bkCd.id.updateForm, bkCd.id.priTab, bkCd.id.updateModal);
        },
        unbind: function () {
            var row = setTable.isSingleSelected(bkCd.id.priTab);
            if (row) {
                swal({
                    title: dataDict.manage.removeConfirm,
                    text: dataDict.manage.noCancelMsg,
                    type: 'warning',
                    showCancelButton: true
                }).then(function (isConfirm) {
                    if (isConfirm.value) {
                        $.post(contextPath + bkCd.url.unbind + row.bcid,
                            function (data) {
                                if (data.result === 'success') {
                                    swtAlert.request_success(data.message);
                                    $('#' + bkCd.id.priTab).bootstrapTable('refresh');
                                } else {
                                    swtAlert.request_fail(data.message);
                                }
                            },'json');
                    }
                });
            }
        }
    }
};