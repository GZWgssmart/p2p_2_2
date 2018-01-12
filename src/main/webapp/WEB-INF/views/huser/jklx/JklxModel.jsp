<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="modal fade bs-example-modal-lg" id="addJklx" tabindex="-1" role="dialog"
     aria-labelledby="myLargeModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">添加借款类型</h4>
            </div>
            <div class="modal-body">
                <form id="addJklxForm" class="form-horizontal">
                    <div class="form-group">
                        <label for="save-jklx" class="col-sm-2 control-label">借款类型</label>
                        <div class="col-sm-10">
                            <input name="lxname" class="form-control" id="save-jklx" required="required" placeholder="输入借款类型">
                        </div>
                    </div>

                    <div class="modal-footer">
                        <input type="reset" class="btn btn-default" value="重置"/>
                        <a href="javascript:void(0);" onclick="addJklx();"
                           class="btn btn-primary">确认</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="modal fade bs-example-modal-lg" id="updateJklx" tabindex="-1" role="dialog"
     aria-labelledby="myLargeModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="ModalLabel">修改借款类型</h4>
            </div>
            <div class="modal-body">
                <form id="updateJklxForm" class="form-horizontal">
                    <input type="hidden" name="lxid" id="lxid"/>
                    <div class="form-group">
                        <label for="lxname" class="col-sm-2 control-label">借款类型</label>
                        <div class="col-sm-10">
                            <input name="lxname" class="form-control" id="lxname" required="required" placeholder="输入借款类型">
                        </div>
                    </div>

                    <div class="modal-footer">
                        <input type="reset" class="btn btn-default" value="重置"/>
                        <a href="javascript:void(0);" onclick="updateJklx();"
                           class="btn btn-primary">确认</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>