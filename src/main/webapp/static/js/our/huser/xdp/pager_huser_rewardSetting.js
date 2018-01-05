var pagerHuserRewardSetting = {
        updateRewardSetting: function () {
        var row = setTable.isSingleSelected('rewardSetting-list');
        if (row) {
            $('#update-rewardSetting-modal').modal('show');
            $('#rwid').val(row.rwid);
            if (row.minmoney != null ){
                $('#minmoney').val(row.minmoney);
            }
            if(row.maxmoney != null) {
                $('#maxmoney').val(row.maxmoney);
            }
            if(row.percent != null) {
                $('#percent').val(row.percent);
            }
            /*updateUe.ready(function () {
                if (row.content != null ){
                    updateUe.setContent(row.content);
                }
            })*/
        }
    }
};

/**更新站内信信息*/
function update() {
    var updateForm = $('#updateForm');
    if (updateForm.valid() === false) {
        swtAlert.warn_info(dataDict.form.validForm);
    } else {
        submitForm.update('/rewardSetting/update','updateForm','rewardSetting-list','update-rewardSetting-modal');
    }
}
