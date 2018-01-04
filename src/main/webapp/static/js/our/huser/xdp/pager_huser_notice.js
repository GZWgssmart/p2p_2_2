var pagerNoticeLetter = {
    updateNotice: function () {
        var row = setTable.isSingleSelected('notice-list');
        if (row) {
            $('#update-notice-modal').modal('show');
            $('#dyid').val(row.dyid);
            if (row.title != null ){
                $('#title1').val(row.title);
            }
            updateUe.ready(function () {
                if (row.content != null ){
                    updateUe.setContent(row.content);
                }
            })
        }
    }
};

/**
 *更新最新公告内容
 */
var updateUe = UE.getEditor('updateContent',{
    initialFrameHeight: 400
});

/**更新最新公告信息*/
function update() {
    var updateForm = $('#updateForm');
    if (updateForm.valid() === false) {
        swtAlert.warn_info(dataDict.form.validForm);
    } else {
        submitForm.update('/notice/update_huser','updateForm','notice-list','update-notice-modal');
    }
};