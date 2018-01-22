var pagerHuserLetter = {
    updateLetter: function () {
        var row = setTable.isSingleSelected('letter-list');
        if (row) {
            $('#update-letter-modal').modal('show');
            $('#lid').val(row.lid);
            $('#updateContent').val(row.content);
            $('#title1').val(row.title);
        }
    }
};

/**更新站内信信息*/
function update() {
    var updateForm = $('#updateForm');
    if (updateForm.valid() === false) {
        swtAlert.warn_info(dataDict.form.validForm);
    } else {
        submitForm.update('/letter/update_huser', 'updateForm', 'letter-list', 'update-letter-modal');
    }
}