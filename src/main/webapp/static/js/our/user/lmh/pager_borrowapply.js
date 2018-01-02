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
        save_borrowapply: function () {
            setTable.showModal('save-borrowapply-modal');
            return pagerBorrow.formValidate.valid.basic_validate('save-borrowapply-form');
        },
        update_borrowapply: function () {
            setTable.openUpdateModal('borrowapply-list', 'update-borrowapply-form', 'update-borrowapply-modal');
            return pagerBorrow.formValidate.valid.basic_validate('update-borrowapply-form');
        },
        save_borrowapply_detail: function () {
            var row = setTable.isSingleSelected('borrowapply-list');
            if (row) {
                if (row.state === 3) {
                    setTable.showModal('save-borrowapply-detail-modal');
                    $('#baid-input').val(row.baid);
                    $('#detail-money-input').val(row.money);
                    $('#nprofit-input').val(pagerBorrow.initYearProfitCpname(row.lxname));
                    return pagerBorrow.formValidate.valid.detail_validate('save-borrowapply-detail-form');
                } else {
                    swtAlert.warn_info('请选择\'未填写借款详情\'的数据进行填写');
                }
            }
        },
        update_borrow_detail: function () {
            var row = setTable.isSingleSelected('borrowapply-list');
            if (row) {
                if (row.state === 2) {
                    setTable.showModal('update-borrowapply-detail-modal');
                    alert(row.ypic);
                    $.get('/borrowdetail/getByApplyId/' + row.baid,
                        function (data) {
                            $('#ypic-img').attr('src', contextPath + data.ypic);
                            $('#update-borrowapply-detail-form').form('load', data);
                        }, 'json');
                    return pagerBorrow.formValidate.valid.detail_validate('update-borrowapply-detail-form');
                } else {
                    swtAlert.warn_info('请选择\'审核中\'的数据进行修改');
                }
            }
        },
        valid: {
            detail_validate: function (detailFormId) {
                return $('#' + detailFormId).validate({
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
                            required: true,
                            isBankCard: true
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
                            min: 0,
                            max: 100
                        },
                        'way': {
                            required: true
                        }
                    },
                    messages:{

                    }
                });
            },
            basic_validate: function (basicFormId) {
                return $('#' + basicFormId).validate({
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
            }
        }
    },
    select2: {
        //加载 标种下拉框 的数据
        loadBzType: function () {
            ourSelect2.classLoadNoSearch('/bz/list_combobox', '请选择标种', 'bz-select2');
        },
        //加载 借款类型下拉框 的数据
        loadJkType: function () {
            ourSelect2.classLoadNoSearch('/jklx/list_combobox', '请选择借款类型', 'jkxl-select2');
        }
    },
    submitForm: {
        save: function () {
            submitForm.save('/borrowapply/save', 'save-borrowapply-form', 'borrowapply-list', 'save-borrowapply-modal');
        },
        saveDetail: function () {
            submitForm.setFileName('ypic-input', 'ypic-file');
            submitForm.ajaxSave('/borrowdetail/save', 'save-borrowapply-detail-form', 'borrowapply-list', 'save-borrowapply-detail-modal');
        },
        updateBasic: function () {
            submitForm.update('/borrowapply/update', 'update-borrowapply-form', 'borrowapply-list', 'update-borrowapply-modal');
        },
        updateDetail: function () {
            submitForm.setFileName('update-ypic-input', 'update-ypic-file');
            submitForm.ajaxSave('/borrowdetail/update', 'update-borrowapply-detail-form', 'borrowapply-list', 'update-borrowapply-detail-modal');
        }
    },
    initYearProfitCpname: function (lxname) {
        var cpInput = $('#cpname-input');
        var dateNum = new Date() / 1000 * 1000;
        if (lxname === '普金保') {
            cpInput.val('pjb' + dateNum);
            return 8.0;
        } else if (lxname === '恒金保') {
            cpInput.val('hjb' + dateNum);
            return 9.0;
        } else if (lxname === '多金宝') {
            cpInput.val('djb' + dateNum);
            return 10.0;
        } else  if (lxname === '新手标') {
            cpInput.val('sxb' + dateNum);
            return 11.0;
        }
    }
};