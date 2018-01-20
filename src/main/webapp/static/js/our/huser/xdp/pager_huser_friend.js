var pagerHuserFriend = {
    updateFriend: function () {
        var row = setTable.isSingleSelected('friend-list');
        if (row) {
           setTable.openUpdateModal("friend-list","updateForm","update-friend-modal");
            return showForm1();
        }
    }
};

function showForm1 () {
    return $('#updateForm').validate({
        onfocusout: function(element){
            $(element).valid();
        },
        debug:false,
        onkeyup:false,
        rules:{
            'imgalert':{
                required: true
            }
        }
    });
}

function update() {
    var updateForm = $('#updateForm');
    if (updateForm.valid() === false) {
        swtAlert.warn_info(dataDict.form.validForm);
    } else {
        var picName = $('#update-imgpath').val();
        picName = picName.substr(picName.lastIndexOf('\\') + 1);
        $('#realImg1').val(picName);
        submitForm.ajaxSave('/friend/update','updateForm','friend-list','update-friend-modal');
    }
};
