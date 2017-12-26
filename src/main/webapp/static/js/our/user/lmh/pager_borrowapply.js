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
            $('#' + modalId).modal('show');
            return $('#' + formId).validate({
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
                        isFloatGtZero: true
                    }
                },
                messages:{
                    'teacher.phone':{
                        remote: dataDict.form.existPhone
                    }
                }
            });
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
    }
};