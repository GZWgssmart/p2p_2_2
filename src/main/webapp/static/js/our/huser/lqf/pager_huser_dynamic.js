var pagerHuserDynamic = {
    lookContent: function () {
        var row = setTable.isSingleSelected('dynamic-list');
        if (row) {
            $('#look-dynamic-modal').modal('show');
            $('#content-body').html(row.content);
        }
    },

    updateDynamic: function () {
        var row = setTable.isSingleSelected('dynamic-list');
        if (row) {
            $('#update-dynamic-modal').modal('show');
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
        },
        messages:{
            'title': {

            }
        }
    });
}

var ue = UE.getEditor('content',{
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
        var picName = $('#pic').val();
        picName = picName.substr(picName.lastIndexOf('\\') + 1);
        $('#realImg').val(picName);
        $addForm.ajaxSubmit({
            type: 'POST',
            url:'/dynamic/save',
            dataType: 'json',
            success: function(data){
                if(data.result === 'success'){
                    window.location.href = contextPath + "/huser/all_dynamic_page";
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
var updateUe = UE.getEditor('updateContent',{
    initialFrameHeight: 400
});

function showForm () {
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
        },
        messages:{
            'title': {

            }
        }
    });
}

function update() {
    var updateForm = $('#updateForm');
    if (updateForm.valid() === false) {
        swtAlert.warn_info(dataDict.form.validForm);
    } else {
        var picName = $('#pic1').val();
        picName = picName.substr(picName.lastIndexOf('\\') + 1);
        var realImg = $('#realImg1').val(picName);
        updateForm.ajaxSubmit({
            type: 'POST',
            url:'/dynamic/update',
            dataType: 'json',
            success: function(data){
                if(data.result === 'success'){
                    window.location.href = contextPath + "/huser/all_dynamic_page";
                } else {
                    swtAlert.request_fail(data.message);
                }
            }
        });
    }

};
