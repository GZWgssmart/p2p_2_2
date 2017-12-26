<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="modal fade bs-example-modal-lg" id="save-borrowapply-modal" tabindex="-1" role="dialog"
     aria-labelledby="myLargeModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">申请借款</h4>
            </div>
            <div class="modal-body">
                <form id="save-borrowapply-form" class="form-horizontal">
                    <div class="form-group">
                        <label for="input-name" class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-10">
                            <input name="rname" class="form-control" id="input-name" value="${sessionScope.user.rname}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="input-phone" class="col-sm-2 control-label">金额</label>
                        <div class="col-sm-10">
                            <input name="money" class="form-control" id="input-phone" placeholder="借款金额">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="input-term" class="col-sm-2 control-label">借款期限</label>
                        <div class="col-sm-10">
                            <select name="term" id="input-term" class="form-control">
                                <option value="3">三个月还清</option>
                                <option value="6">六个月还清</option>
                                <option value="9">九个月还清</option>
                                <option value="12">一年还清</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="input-bzname" class="col-sm-2 control-label">标种类型</label>
                        <div class="col-sm-10">
                            <select name="bzname" id="input-bzname" class="form-control"></select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="input-xlname" class="col-sm-2 control-label">借款类型</label>
                        <div class="col-sm-10">
                            <select name="lxname" id="input-xlname" class="form-control"></select>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <input type="reset" class="btn btn-default" value="重置"/>
                        <a href="javascript:void(0);" onclick="teacherForm.save();" data-dismiss="modal" class="btn btn-primary">保存</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>