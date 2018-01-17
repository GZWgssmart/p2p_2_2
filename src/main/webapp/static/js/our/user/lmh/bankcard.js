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
        update: '/bankcard/update'
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
        }
    }
};