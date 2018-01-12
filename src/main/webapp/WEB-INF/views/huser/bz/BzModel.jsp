<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="modal fade bs-example-modal-lg" id="addBz" tabindex="-1" role="dialog"
     aria-labelledby="myLargeModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">添加标种名称</h4>
            </div>
            <div class="modal-body">
                <form id="addBzForm" class="form-horizontal">
                    <div class="form-group">
                        <label for="save-bz" class="col-sm-2 control-label">标种名称</label>
                        <div class="col-sm-10">
                            <input name="bzname" class="form-control" id="save-bz" required="required" placeholder="输入标种名称">
                        </div>
                    </div>

                    <div class="modal-footer">
                        <input type="reset" class="btn btn-default" value="重置"/>
                        <a href="javascript:void(0);" onclick="addBz();"
                           class="btn btn-primary">确认</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="modal fade bs-example-modal-lg" id="updateBz" tabindex="-1" role="dialog"
     aria-labelledby="myLargeModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="ModalLabel">修改标种名称</h4>
            </div>
            <div class="modal-body">
                <form id="updateBzForm" class="form-horizontal">
                    <input type="hidden" name="bzid" id="bzid"/>
                    <div class="form-group">
                        <label for="bzname" class="col-sm-2 control-label">标种名称</label>
                        <div class="col-sm-10">
                            <input name="bzname" class="form-control" id="bzname" required="required" placeholder="输入标种名称">
                        </div>
                    </div>

                    <div class="modal-footer">
                        <input type="reset" class="btn btn-default" value="重置"/>
                        <a href="javascript:void(0);" onclick="updateBz();"
                           class="btn btn-primary">确认</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>