<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="modal fade" id="update-friend-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 100%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">修改合作公司</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form" id="updateForm" enctype="multipart/form-data">
                    <input type="hidden" id="fid" name="fid">
                    <div class="form-group">
                        <label for="imghref" class="col-sm-1 control-label">链接</label>
                        <div class="col-sm-10">
                            <input id="imghref" type="text" class="form-control" name="imghref">
                        </div>
                    </div>
                    <div class="form-group" style="margin-top: 20px;">
                        <label for="imgpath" class="col-sm-1 control-label">图片路径</label>
                        <div class="col-sm-10">
                            <input id="imgpath" name="file" class="file" type="file">
                            <input type="hidden" name="imgpath" id="realImg1">
                        </div>
                    </div>
                    <div class="form-group" >
                        <label for="imgalert" class="col-sm-1 control-label">图片描述</label>
                        <div class="col-sm-10">
                            <input id="imgalert" name="imgalert" type="text" class="form-control" />
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button id="btn" type="button" class="btn btn-primary" onclick="update();">修改</button>
            </div>
        </div>
    </div>
</div>

