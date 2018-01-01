<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="modal fade bs-example-modal-lg" id="save-borrowapply-detail-modal" tabindex="-1" role="dialog"
     aria-labelledby="myLargeModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">借款详情</h4>
            </div>
            <div class="modal-body">
                <form id="save-borrowapply-detail-form" class="form-horizontal">
                    <input type="hidden" id="baid-input" name="baid"/>
                    <input type="hidden" id="detail-money-input" name="money"/>
                    <input type="hidden" name="ypic" id="ypic-input">
                    <input type="hidden" name="cpname" id="cpname-input">
                    <div class="form-group">
                        <label for="fpic-input" class="col-sm-2 control-label">法人身份证</label>
                        <div class="col-sm-10">
                            <input name="fpic" class="form-control" id="fpic-input" placeholder="身份证编号">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="qpic-input" class="col-sm-2 control-label">银行账号</label>
                        <div class="col-sm-10">
                            <input name="qpic" class="form-control" id="qpic-input" placeholder="企业银行账号">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="nprofit-input" class="col-sm-2 control-label">年化收益（%）</label>
                        <div class="col-sm-10">
                            <input name="nprofit" class="form-control" id="nprofit-input" placeholder="请填写0~100的数字">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="ypic-file" class="col-sm-2 control-label">营业执照图片：</label>
                        <div class="col-sm-10">
                            <input id="ypic-file" name="file" class="form-control file-preview" type="file">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="mpurpose-input" class="col-sm-2 control-label">资金用途</label>
                        <div class="col-sm-10">
                            <textarea style="height: 100px;" name="mpurpose" id="mpurpose-input" class="form-control"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="xmdescrip-input" class="col-sm-2 control-label">项目描述</label>
                        <div class="col-sm-10">
                            <textarea style="height: 100px;" name="xmdescrip" id="xmdescrip-input" class="form-control"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="suggest-input" class="col-sm-2 control-label">借款人描述</label>
                        <div class="col-sm-10">
                            <textarea style="height: 100px;" name="suggest" id="suggest-input" class="form-control"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="guarantee-input" class="col-sm-2 control-label">保障措施</label>
                        <div class="col-sm-10">
                            <textarea style="height: 100px;" name="guarantee" id="guarantee-input" class="form-control"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="hksource-input" class="col-sm-2 control-label">还款来源</label>
                        <div class="col-sm-10">
                            <textarea style="height: 100px;" name="hksource" id="hksource-input" class="form-control"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="way-input" class="col-sm-2 control-label">收益方式</label>
                        <div class="col-sm-10">
                            <textarea style="height: 100px;" name="way" id="way-input" class="form-control"></textarea>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <input type="reset" class="btn btn-default" value="重置"/>
                        <a href="javascript:void(0);" onclick="pagerBorrow.submitForm.saveDetail();" class="btn btn-primary">保存</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>