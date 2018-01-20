<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="modal fade" id="saveFriendModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 100%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">添加合作公司</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form" id="addForm" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="imghref" class="col-sm-1 control-label">链接</label>
                        <div class="col-sm-10">
                            <input id="imghref" type="text" class="form-control" name="imghref">
                        </div>
                    </div>
                    <div class="form-group" style="margin-top: 20px;">
                        <label for="imgpath" class="col-sm-1 control-label">图片</label>
                        <div class="col-sm-10">
                            <input id="imgpath" name="file" class="file" type="file">
                            <input type="hidden" name="imgpath" id="realImg">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="imgalert" class="col-sm-1 control-label">图片描述</label>
                        <div class="col-sm-10">
                            <input id="imgalert" type="text" class="form-control" name="imgalert">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button id="btn" type="button" class="btn btn-primary" onclick="save();">确定</button>
            </div>
        </div>
    </div>
</div>

<script>
    function showForm () {
        return $('#addForm').validate({
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

    function save() {
        var $addForm = $('#addForm');
        if ($addForm.valid() === false) {
            swtAlert.warn_info(dataDict.form.validForm);
        } else {
            var picName = $('#imgpath').val();
            picName = picName.substr(picName.lastIndexOf('\\') + 1);
            $('#realImg').val(picName);
            submitForm.ajaxSave('/friend/save','addForm','friend-list','saveFriendModal');
        }
    }

</script>


