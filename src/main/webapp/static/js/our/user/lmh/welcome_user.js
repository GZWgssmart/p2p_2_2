var wecUsr = {
    static: {
        isBinding: false,
        userId: 0
    },
    msg: {
        noBindCard: '请先绑定银行卡'
    },
    id: {
        txModal: 'welcome-tx-modal',
        czModal: 'welcome-cz-modal',
        txSelect: 'tx-select',
        czSelect: 'cz-select',
        txForm: 'welcome-tx-form',
        czForm: 'welcome-cz-form'
    },
    url: {
        binding: '/bankcard/list_card/',
        money: '/usermoney/get/'
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
                    'cardno': {
                        required: true
                    }
                },
                messages:{
                    'cardno':{
                        required: dataDict.form.noSelected
                    }
                }
            });
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