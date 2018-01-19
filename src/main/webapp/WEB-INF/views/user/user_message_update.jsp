<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="modal fade" id="userMessage" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 100%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">修改信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form" id="addForm" enctype="multipart/form-data">

                    <div class="form-group">
                        <label for="title" class="col-sm-1 control-label">用户名：</label>
                        <div class="col-sm-10">
                            <input id="pic" name="file" class="file" type="file">
                            <input type="hidden" name="pic" id="realImg">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="title" class="col-sm-1 control-label">用户名：</label>
                        <div class="col-sm-10">
                            <input id="title" type="text" class="form-control" name="title"  placeholder="请输入标题">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="content" class="col-sm-1 control-label">性别：</label>
                        <div class="col-sm-10">
                            <script id="content" name="content" type="text/plain" ></script>
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

