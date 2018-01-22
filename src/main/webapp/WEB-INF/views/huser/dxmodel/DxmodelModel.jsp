<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="modal fade bs-example-modal-lg" id="addDxmodel" tabindex="-1" role="dialog"
     aria-labelledby="myLargeModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">添加短信模版</h4>
            </div>
            <div class="modal-body">
                <form id="addDxmodelForm" class="form-horizontal">
                    <div class="form-group">
                        <label for="save-content" class="col-sm-2 control-label">模版内容</label>
                        <div class="col-sm-10">
                            <input name="content" class="form-control" id="save-content" required="required" placeholder="输入标种名称">
                        </div>
                    </div>

                    <div class="modal-footer">
                        <input type="reset" class="btn btn-default" value="重置"/>
                        <a href="javascript:void(0);" onclick="addDxmodel();"
                           class="btn btn-primary">确认</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="modal fade bs-example-modal-lg" id="updateDxmodel" tabindex="-1" role="dialog"
     aria-labelledby="myLargeModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="ModalLabel">修改短信模版</h4>
            </div>
            <div class="modal-body">
                <form id="updateDxmodelForm" class="form-horizontal">
                    <input type="hidden" name="dxid" id="dxid"/>
                    <div class="form-group">
                        <label for="content" class="col-sm-2 control-label">短信模版</label>
                        <div class="col-sm-10">
                            <input name="content" class="form-control" id="content" required="required" placeholder="输入标种名称">
                        </div>
                    </div>

                    <div class="modal-footer">
                        <input type="reset" class="btn btn-default" value="重置"/>
                        <a href="javascript:void(0);" onclick="updateDxmodel();"
                           class="btn btn-primary">确认</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>