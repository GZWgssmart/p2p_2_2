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
    }
};