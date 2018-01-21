var wecUsr = {
    static: {
        isBinding: false,
        userId: 0
    },
    msg: {
        noBindCard: '请先绑定银行卡'
    },
    id: {
        priTab: '',
        txModal: 'welcome-tx-modal',
        czModal: 'welcome-cz-modal',
        txSelect: 'tx-select',
        czSelect: 'cz-select',
        txForm: 'welcome-tx-form',
        czForm: 'welcome-cz-form'
    },
    url: {
        binding: '/bankcard/list_card/',
        money: '/usermoney/get/',
        tx: '/moneyLog/tx',
        cz: '/moneyLog/cz'
    },
    open: {
        txModal: function () {
            if (wecUsr.static.isBinding) {
                setTable.showModal(wecUsr.id.txModal);
                return wecUsr.open.valid(wecUsr.id.txForm);
            } else {
                swtAlert.warnNoTimer(wecUsr.msg.noBindCard);
            }
        },
        czModal: function () {
            if (wecUsr.static.isBinding) {
                setTable.showModal(wecUsr.id.czModal);
                return wecUsr.open.valid(wecUsr.id.czForm);
            } else {
                swtAlert.warnNoTimer(wecUsr.msg.noBindCard);
            }
        },
        valid: function (formId) {
            return $('#' + formId).validate({
                onfocusout: function(element){
                    $(element).valid();
                },
                debug:false,
                onkeyup:false,
                rules:{
                    'money': {
                        required: true,
                        isNumberGtZero: true
                    },
                    'zpwd': {
                        required: true
                    },
                    'bcid': {
                        required: true
                    }
                },
                messages:{
                    'bcid':{
                        required: dataDict.form.noSelected
                    }
                }
            });
        }
    },
    submit: {
        tx: function () {
            wecUsr.submit.txOrcz(wecUsr.url.tx, wecUsr.id.txForm, wecUsr.id.txModal);
        },
        cz: function () {
            wecUsr.submit.txOrcz(wecUsr.url.cz, wecUsr.id.czForm, wecUsr.id.czModal);
        },
        txOrcz: function (url, formId, modalId) {
            var $form = $('#' + formId);
            if ($form.valid()) {
                $.post(url, $form.serialize(),
                    function (data) {
                        if (data.result === 'success') {
                            swtAlert.request_success(data.message);
                            setTimeout("location.reload()", 1500);
                        } else {
                            swtAlert.request_fail_no_timer(data.message);
                        }
                    }, 'json');
            } else {
                swtAlert.warnNoTimer(dataDict.form.validForm);
            }
        }
    },
    getBindData: function (userId) {
        $.get(contextPath + wecUsr.url.binding + userId,
            function (data) {
                if (data.length > 0) {
                    wecUsr.static.isBinding = true;
                    setTable.idLoadSelectData(wecUsr.id.txSelect, data);
                    setTable.idLoadSelectData(wecUsr.id.czSelect, data);
                }
            }, 'json');
    },
    getMoneyData: function (userId) {
        $.get(contextPath + wecUsr.url.money + userId,
            function (data) {
                for (var money in data) {
                    $('#' + money).text(data[money]);
                }
            }, 'json');
    }
};