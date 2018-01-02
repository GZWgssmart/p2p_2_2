var pagerHuserMedia = {
    lookContent: function () {
        var row = setTable.isSingleSelected('media-list');
        if (row) {
            $('#look-media-modal').modal('show');
            $('#content-body').html(row.content);
        }
    },

    updateMedia: function () {
        var row = setTable.isSingleSelected('media-list');
        if (row) {
            $('#update-media-modal').modal('show');
            $('#mid').val(row.mid);
            if (row.url != null ){
                $('#url1').val(row.url);
            }
            if (row.title != null ){
                $('#title1').val(row.title);
            }
            updateMedia.ready(function () {
                if (row.content != null ){
                    updateMedia.setContent(row.content);
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

var mediaContent = UE.getEditor('mediaContent',{
    initialFrameHeight: 400
});

function getContent() {
    alert(mediaContent.getContent());
    alert(updateMedia.getContent());
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
            url:'/media/save',
            dataType: 'json',
            success: function(data){
                if(data.result === 'success'){
                    window.location.href = contextPath + "/huser/all_media_page";
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
var updateMedia = UE.getEditor('updateMediaContent',{
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
        $('#realImg1').val(picName);
        updateForm.ajaxSubmit({
            type: 'POST',
            url:'/media/update',
            dataType: 'json',
            success: function(data){
                if(data.result === 'success'){
                    window.location.href = contextPath + "/huser/all_media_page";
                } else {
                    swtAlert.request_fail(data.message);
                }
            }
        });
    }

};
