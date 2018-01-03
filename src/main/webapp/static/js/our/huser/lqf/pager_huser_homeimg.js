var pagerHuserHomeImg = {
    updateHomeImg: function () {
        var row = setTable.isSingleSelected('homeImg-list');
        if (row) {
            $('#update-homeimg-modal').modal('show');
            $('#hid').val(row.hid);
            if (row.imghref != null ){
                $('#imghref1').val(row.imghref);
            }
            return showForm1();
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
            'imghref':{
                required: true
            }
        }
    });
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
            url:'/homeImg/save',
            dataType: 'json',
            success: function(data){
                if(data.result === 'success'){
                    window.location.href = contextPath + "/huser/all_homeimg_page";
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
function showForm1 () {
    return $('#updateForm').validate({
        onfocusout: function(element){
            $(element).valid();
        },
        debug:false,
        onkeyup:false,
        rules:{
            'imghref':{
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
        var picName = $('#imgpath1').val();
        picName = picName.substr(picName.lastIndexOf('\\') + 1);
        $('#realImg1').val(picName);
        updateForm.ajaxSubmit({
            type: 'POST',
            url:'/homeImg/update',
            dataType: 'json',
            success: function(data){
                if(data.result === 'success'){
                    window.location.href = contextPath + "/huser/all_homeimg_page";
                } else {
                    swtAlert.request_fail(data.message);
                }
            }
        });
    }
}
