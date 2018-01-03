var pagerHuserLetter = {
    updateLetter: function () {
        var row = setTable.isSingleSelected('letter-list');
        if (row) {
            $('#update-letter-modal').modal('show');
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
 *更新站内信内容
 */
var updateUe = UE.getEditor('updateContent',{
    initialFrameHeight: 400
});

/**更新站内信信息*/
function update() {
    var updateForm = $('#updateForm');
    if (updateForm.valid() === false) {
        swtAlert.warn_info(dataDict.form.validForm);
    } else {
        updateForm.ajaxSubmit({
            type: 'POST',
            url:'/letter/update_pager',
            dataType: 'json',
            success: function(data){
                if(data.result === 'success'){
                    window.location.href = contextPath + "/letter/all_letter_page";
                } else {
                    swtAlert.request_fail(data.message);
                }
            }
        });
    }
};