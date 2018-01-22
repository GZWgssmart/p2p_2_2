<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="modal fade" id="update-letter-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 100%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">修改站内信</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form" id="updateForm">
                    <input type="hidden" id="lid" name="lid">
                    <div class="form-group">
                        <label for="title1" class="col-sm-2 control-label">标题：</label>
                        <div class="col-sm-10">
                            <input id="title1" type="text" class="form-control" name="title"  placeholder="请输入标题">
                        </div>
                    </div>
                    <div class="form-group" >
                        <label for="updateContent" class="col-sm-2 control-label">内容:</label>
                        <div class="col-sm-10">
                            <input id="updateContent" class="form-control" name="content"/>
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