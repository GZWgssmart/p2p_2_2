<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="modal fade bs-example-modal-lg" id="check-modal" tabindex="-1" role="dialog"
     aria-labelledby="myLargeModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">拒绝通过</h4>
            </div>
            <div class="modal-body">
                <form id="check-form" class="form-horizontal">
                    <div class="form-group">
                        <label for="excuse-input" class="col-sm-2 control-label">拒绝理由：</label>
                        <div class="col-sm-10">
                            <textarea style="height: 100px;" name="excuse" id="excuse-input" class="form-control"></textarea>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <input type="reset" class="btn btn-default" value="重置"/>
                        <a href="javascript:void(0);" onclick="checkVip.checkNoPass();" class="btn btn-primary">保存</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>