var pagerBorrow = {
    formatState: function (value) {
        if (value === 0) {
            return '审核不通过';
        } else if (value === 1) {
            return '审核通过';
        } else if (value === 2) {
            return '审核中';
        } else if (value === 3) {
            return '未填写借款详情';
        }
    },
    formValidate: {
        save_borrowapply: function (modalId, formId) {
            setTable.showModal('save-borrowapply-modal');
            return $('#save-borrowapply-form').validate({
                onfocusout: function(element){
                    $(element).valid();
                },
                debug:false,
                onkeyup:false,
                rules:{
                    'rname':{
                        required: true,
                        isName: true
                    },
                    'money': {
                        required: true,
                        isNumberGtZero: true
                    },
                    'bzid': {
                        required: true
                    },
                    'type': {
                        required: true
                    },
                    'deadline': {
                        required: true
                    }
                },
                messages:{
                    'bzid':{
                        required: dataDict.form.noSelected
                    },
                    'type':{
                        required: dataDict.form.noSelected
                    }
                }
            });
        },
        save_borrowapply_detail: function () {
            var row = setTable.isSingleSelected('borrowapply-list');
            if (row) {
                setTable.showModal('save-borrowapply-detail-modal');
                $('#baid-input').val(row.baid);
                $('#detail-money-input').val(row.money);
                $('#nprofit-input').val(pagerBorrow.initYearProfit(row.lxname));
                return $('#save-borrowapply-detail-form').validate({
                    onfocusout: function(element){
                        $(element).valid();
                    },
                    debug:false,
                    onkeyup:false,
                    rules:{
                        'fpic':{
                            required: true,
                            isIdCardNo: true
                        },
                        'qpic': {
                          required: true
                        },
                        'mpurpose': {
                            required: true
                        },
                        'hksource': {
                            required: true
                        },
                        'suggest': {
                          required: true
                        },
                        'xmdescrip': {
                            required: true
                        },
                        'guarantee': {
                            required: true
                        },
                        'nprofit': {
                            required: true,
                            minValue: 0,
                            maxValue: 100
                        },
                        'way': {
                            required: true
                        }
                    },
                    messages:{

                    }
                });
            }
        }
    },
    select2: {
        //加载 标种下拉框 的数据
        loadBzType: function () {
            ourSelect2.idLoadNoSearch('/bz/list_combobox', '请选择标种', 'input-bzname');
        },
        //加载 借款类型下拉框 的数据
        loadJkType: function () {
            ourSelect2.idLoadNoSearch('/jklx/list_combobox', '请选择借款类型', 'input-lxname');
        }
    },
    submitForm: {
        save: function () {
            submitForm.save('/borrowapply/save', 'save-borrowapply-form', 'borrowapply-list', 'save-borrowapply-modal');
        },
        saveDetail: function () {

        }
    },
    initYearProfit: function (lxname) {
        if (lxname === '普金保') {
            return 8.0;
        } else if (lxname === '恒金保') {
            return 9.0;
        } else if (lxname === '多金宝') {
            return 10.0;
        } else  if (lxname === '新手标') {
            return 11.0;
        }
    }
};