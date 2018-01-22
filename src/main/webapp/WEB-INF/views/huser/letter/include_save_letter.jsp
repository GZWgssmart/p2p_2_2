<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="modal fade" id="saveLetterModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 100%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">添加站内信</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form" id="addForm" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="title" class="col-sm-2 control-label">标题：</label>
                        <div class="col-sm-10">
                            <input id="title" type="text" class="form-control" name="title"  placeholder="请输入标题">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="content" class="col-sm-2 control-label">内容：</label>
                        <div class="col-sm-10">
                            <input id="content" class="form-control" name="content" />
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button id="btn" type="button" class="btn btn-primary" onclick="save();">添加</button>
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

    function save() {
        var $addForm = $('#addForm');
        if ($addForm.valid() === false) {
            swtAlert.warn_info(dataDict.form.validForm);
        } else {
            submitForm.save('/letter/save','addForm','letter-list','saveLetterModal');
        }
    }

</script>
