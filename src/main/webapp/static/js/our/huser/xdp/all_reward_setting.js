var allRewardSetting = {
    showUpdateForm: function () {
        var row = setTable.isSingleSelected('rewardSetting-list');
        if (row) {
            $('#update-rewardSetting-modal').modal('show');
            $('#rwid').val(row.rwid);
            if (row.minmoney != null) {
                $('#minmoney').val(row.minmoney);
            }
            if (row.maxmoney != null) {
                $('#maxmoney').val(row.maxmoney);
            }
            if (row.percent != null) {
                $('#percent').val(row.percent);
            }
        }
    },
    showSaveForm: function () {
        return $('#addForm').validate({
            onfocusout: function(element){
                $(element).valid();
            },
            debug:false,
            onkeyup:false,
            rules:{
                'maxmoney':{
                    required: true,
                    isNumberGtZero:true
                },
                'minmoney':{
                    required: true,
                    isNumberGtZero:true
                },
                'percent':{
                    required: true,
                    min: 0,
                    max: 100
                }
            }
        });
    },
    submitSave: function () {
        var $addForm = $('#addForm');
        if ($addForm.valid()) {
            if ($('#minmoney').val() < $('#maxmoney').val()) {
                submitForm.save('/rewardSetting/save','addForm','rewardSetting-list','saveRewardSettingModal');
            } else {
                swtAlert.warn_info('最小金额需小于最大金额');
            }
        } else {
            swtAlert.warn_info(dataDict.form.validForm);
        }
    }
};

/**更新站内信信息*/
function update() {
    var updateForm = $('#updateForm');
    if (updateForm.valid() === false) {
        swtAlert.warn_info(dataDict.form.validForm);
    } else {
        submitForm.update('/rewardSetting/update', 'updateForm', 'rewardSetting-list', 'update-rewardSetting-modal');
    }
}
