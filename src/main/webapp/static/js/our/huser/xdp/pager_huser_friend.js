var pagerHuserFriend = {
    updateFriend: function () {
        var row = setTable.isSingleSelected('friend-list');
        if (row) {
            $('#update-friend-modal').modal('show');
            $('#fid').val(row.fid);
            if (row.imghref != null ){
                $('#imghref').val(row.imghref);
            }
            if(row.imgpath != null) {
                $('#imgpath').val(row.imgpath);
            }
            if(row.imgalert != null) {
                $('#imgalert').val(row.imgalert);
            }
            // return showForm1();
        }
    }
};

/**
 * 添加dynamic的一些方法
 * @returns {*|jQuery}
 */
function showForm () {
    return $('#addForm').validate({
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

var ue = UE.getEditor('imgalert',{
    initialFrameHeight: 400
});

function getContent() {
    alert(ue.getContent());
    alert(updateUe.getContent());
}

function save() {
    var $addForm = $('#addForm');
    if ($addForm.valid() === false) {
        swtAlert.warn_info(dataDict.form.validForm);
    } else {
        var picName = $('#imgpath').val();
        picName = picName.substr(picName.lastIndexOf('\\') + 1);
        $('#realImg').val(picName);
        $addForm.ajaxSubmit({
            type: 'POST',
            url:'/frined/save',
            dataType: 'json',
            success: function(data){
                if(data.result === 'success'){
                    window.location.href = contextPath + "/huser/all_friend";
                } else {
                    swtAlert.request_fail(data.message);
                }
            }
        });
    }

};

/**
 *更新的一些方法
 */
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
        updateForm.ajaxSubmit({
            type: 'POST',
            url:'/friend/update_pager',
            dataType: 'json',
            success: function(data){
                if(data.result === 'success'){
                    window.location.href = contextPath + "/huser/all_friend";
                } else {
                    swtAlert.request_fail(data.message);
                }
            }
        });
    }

};
