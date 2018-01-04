<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="modal fade bs-example-modal-lg" id="addSway" tabindex="-1" role="dialog"
     aria-labelledby="myLargeModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">添加还款方式</h4>
            </div>
            <div class="modal-body">
                <form id="addSwayForm" class="form-horizontal">
                    <div class="form-group">
                        <label for="sway" class="col-sm-2 control-label">还款方式</label>
                        <div class="col-sm-10">
                            <input name="sway" class="form-control" required="required" id="sway" placeholder="输入还款方式">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="fw" class="col-sm-2 control-label">算法</label>
                        <div class="col-sm-10">
                            <input name="fw" class="form-control" required="required" id="fw" placeholder="输入还款算法">
                        </div>
                    </div>

                    <div class="modal-footer">
                        <input type="reset" class="btn btn-default" value="重置"/>
                        <a href="javascript:void(0);" onclick="addSway();"
                           class="btn btn-primary">确认</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>