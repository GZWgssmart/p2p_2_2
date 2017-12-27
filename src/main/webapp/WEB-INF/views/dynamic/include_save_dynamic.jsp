<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="modal fade" id="saveDynamicModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 760px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">添加公司活动</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form" id="addForm" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="title" class="col-sm-2 control-label">标&nbsp;&nbsp;题：</label>
                        <div class="col-sm-10">
                            <input id="title" type="text" class="form-control" name="title"  placeholder="请输入标题">
                        </div>
                    </div>
                    <div class="form-group" style="margin-top: 20px;">
                        <label for="pic" class="col-sm-2 control-label">封面图片：</label>
                        <div class="col-sm-10">
                            <input id="pic" class="file" type="file" multiple data-min-file-count="1">
                            <input type="hidden" name="pic" id="realImg">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="content" class="col-sm-2 control-label">内&nbsp;&nbsp;容：</label>
                        <div class="col-sm-10">
                            <textarea id="content" style="height: 100px;" name="content" class="form-control" placeholder="请输入内容"></textarea>
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
        return $("#addForm").validate({
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
    };

    function save() {
        var pic = $("#pic").val();
        $("#realImg").val(pic);
        if ($('#addForm').valid() === false) return;
        $.post(contextPath + "/dynamic/save",
            $("#addForm").serialize(),
            function (data) {
                if(data.result === "success"){
                    window.location.href = contextPath + "/huser/all_dynamic_page";
                } else {
                    alert(data.message);
                }
            },'json'
        );
    };

</script>
