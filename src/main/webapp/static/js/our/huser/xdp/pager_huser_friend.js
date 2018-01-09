var pagerHuserFriend = {
    updateFriend: function () {
        var row = setTable.isSingleSelected('friend-list');
        if (row) {
            $('#update-friend-modal').modal('show');
            $('#fid').val(row.fid);
            if (row.imghref != null ){
                $('#update-imghref').val(row.imghref);
            }
            if(row.imgpath != null) {
                $('#update-imgpath').val(row.imgpath);
            }
            if(row.imgalert != null) {
                $('#update-imgalert').val(row.imgalert);
            }
            return showForm1();
        }
    }
};

var updateUe = UE.getEditor('imgalert',{
    initialFrameHeight: 400
});

function showForm1 () {
    return $('#updateForm').validate({
        onfocusout: function(element){
            $(element).valid();
        },
        debug:false,
        onkeyup:false,
        rules:{
            'title':{
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
        var picName = $('#imgpath').val();
        picName = picName.substr(picName.lastIndexOf('\\') + 1);
        var realImg = $('#realImg1').val(picName);
        submitForm.update('/letter/update_huser','updateForm','letter-list','update-letter-modal');
    }
};
