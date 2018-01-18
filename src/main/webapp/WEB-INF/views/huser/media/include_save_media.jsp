<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="modal fade" id="saveMediaModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 100%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">添加媒体报道</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form" id="addForm" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="title" class="col-sm-1 control-label">标&nbsp;&nbsp;题：</label>
                        <div class="col-sm-10">
                            <input id="title" type="text" class="form-control" name="title" placeholder="请输入标题">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="url" class="col-sm-1 control-label">链&nbsp;&nbsp;接：</label>
                        <div class="col-sm-10">
                            <input id="url" type="text" class="form-control" name="url" placeholder="请输入地址">
                        </div>
                    </div>
                    <div class="form-group" style="margin-top: 20px;">
                        <label for="pic" class="col-sm-1 control-label">封面图：</label>
                        <div class="col-sm-10">
                            <input id="pic" name="file" class="file" type="file">
                            <input type="hidden" name="pic" id="realImg">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="mediaContent" class="col-sm-1 control-label">内&nbsp;&nbsp;容：</label>
                        <div class="col-sm-10">
                            <script id="mediaContent" name="content" type="text/plain" ></script>
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

