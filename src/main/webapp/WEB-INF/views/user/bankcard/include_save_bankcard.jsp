<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="modal fade bs-example-modal-lg" id="save-bankcard-modal" tabindex="-1" role="dialog"
     aria-labelledby="myLargeModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">绑定银行卡</h4>
            </div>
            <div class="modal-body">
                <form id="save-bankcard-form" class="form-horizontal">
                    <div class="form-group">
                        <label for="cardno" class="col-sm-2 control-label">银行卡号</label>
                        <div class="col-sm-10">
                            <input name="cardno" class="form-control" id="cardno" placeholder="输入您的银行卡号！">
                        </div>
                    </div>
                    <%--<div class="form-group">
                        <label for="rname" class="col-sm-2 control-label">真实姓名</label>
                        <div class="col-sm-10">
                            <input name="rname" class="form-control" id="rname" value="${sessionScope.user.rname}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="idno" class="col-sm-2 control-label">身份证号</label>
                        <div class="col-sm-10">
                            <input name="idno" class="form-control" id="idno" value="${sessionScope.user.idno}">
                        </div>
                    </div>--%>
                    <div class="form-group">
                        <label for="type" class="col-sm-2 control-label">选择银行</label>
                        <div class="col-sm-10">
                            <select name="type" class="form-control" id="type">
                                <option>建设银行</option>
                                <option>民生银行</option>
                                <option>交通银行</option>
                                <option>农业银行</option>
                            </select>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <input type="reset" class="btn btn-default" value="重置"/>
                        <a href="javascript:void(0);" onclick="bkCd.submit.save();"
                           class="btn btn-primary">保存</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>