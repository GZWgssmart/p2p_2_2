<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="modal fade bs-example-modal-lg" id="welcome-cz-modal" tabindex="-1" role="dialog"
     aria-labelledby="myLargeModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">充值</h4>
            </div>
            <div class="modal-body">
                <form id="welcome-cz-form" class="form-horizontal">
                    <div class="form-group">
                        <label for="cz-money-input" class="col-sm-2 control-label">金额（元）</label>
                        <div class="col-sm-10">
                            <input name="money" class="form-control" id="cz-money-input">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="cz-select" class="col-sm-2 control-label">银行卡</label>
                        <div class="col-sm-10">
                            <select name="cardno" id="cz-select" class="load-data form-control"></select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="cz-password-input" class="col-sm-2 control-label">交易密码</label>
                        <div class="col-sm-10">
                            <input name="zpwd" type="password" class="form-control " id="cz-password-input"/>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <input type="reset" class="btn btn-default" value="重置"/>
                        <a href="javascript:void(0);" onclick="pagerBorrow.submitForm.save();" class="btn btn-primary">立即充值</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>