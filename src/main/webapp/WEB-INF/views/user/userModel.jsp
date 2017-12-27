<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="modal fade bs-example-modal-lg" id="updateTeacherModal" tabindex="-1" role="dialog"
     aria-labelledby="myLargeModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">邮箱注册</h4>
            </div>
            <div class="modal-body">
                <form id="addEmailForm" class="form-horizontal">
                    <input name="phone" type="hidden" value="${sessionScope.user.phone}" />
                    <div class="form-group">
                        <label for="email" class="col-sm-2 control-label">添加邮箱</label>
                        <div class="col-sm-10">
                            <input name="email" class="form-control" id="email" placeholder="输入您的邮箱地址">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <input type="reset" class="btn btn-default" value="重置"/>
                        <a href="javascript:void(0);" onclick="addEmail()"
                           class="btn btn-primary">确认</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="modal fade bs-example-modal-lg" id="verifyPhoneModal" tabindex="-1" role="dialog"
     aria-labelledby="myLargeModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="updatePhone">手机号修改</h4>
            </div>
            <div class="modal-body">
                <form id="verifyPhoneForm" class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">原手机号</label>
                        <div class="col-sm-8" id="phone">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="code" class="col-sm-2 control-label">验证码</label>
                        <div class="col-sm-8">
                            <input name="code" class="form-control" id="code" placeholder="输入您的手机验证码">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <input id="phoneCode" class="btn btn-default" value="获取手机验证码"/>
                        <a href="javascript:void(0);" onclick="vrifyPhone()"
                           class="btn btn-primary">确认</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="modal fade bs-example-modal-lg" id="updatePhoneModal" tabindex="-1" role="dialog"
     aria-labelledby="myLargeModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">手机号修改</h4>
            </div>
            <div class="modal-body">
                <form id="updatePhoneForm" class="form-horizontal">
                    <input type="hidden" name="uid" value="${sessionScope.user.uid}" />
                    <div class="form-group">
                        <label class="col-sm-2 control-label">原手机号</label>
                        <div class="col-sm-8">
                            <input name="phone" class="form-control" id="newPhone" placeholder="输入您的手机号码">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="code" class="col-sm-2 control-label">验证码</label>
                        <div class="col-sm-8">
                            <input name="code" class="form-control" id="codePhone" placeholder="输入您的手机验证码">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <input id="phoneCode1" class="btn btn-default" value="获取手机验证码"/>
                        <a href="javascript:void(0);" onclick="updatePhone()"
                           class="btn btn-primary">确认</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="modal fade bs-example-modal-lg" id="updateRnameModal" tabindex="-1" role="dialog"
     aria-labelledby="myLargeModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">身份认证</h4>
            </div>
            <div class="modal-body">
                <form id="userForm" class="form-horizontal">
                    <input type="hidden" name="uid" value="${sessionScope.user.uid}" />
                    <div class="form-group">
                        <label class="col-sm-2 control-label">真是姓名</label>
                        <div class="col-sm-8">
                            <input name="rname" class="form-control" id="rname" placeholder="输入真实姓名">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="code" class="col-sm-2 control-label">身份证号</label>
                        <div class="col-sm-8">
                            <input name="idno" class="form-control" id="idno" placeholder="输入身份证号">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <input type="reset" class="btn btn-default" value="重置"/>
                        <a href="javascript:void(0);" onclick="updateRame();"
                           class="btn btn-primary">保存</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="modal fade bs-example-modal-lg" id="updatePwdModal" tabindex="-1" role="dialog"
     aria-labelledby="myLargeModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">修改密码</h4>
            </div>
            <div class="modal-body">
                <form id="pwdForm" class="form-horizontal">

                    <div class="form-group">
                        <label class="col-sm-2 control-label">原始密码</label>
                        <div class="col-sm-8">
                            <input id="oldPwd" name="oldPwd" class="form-control" placeholder="输入原始密码">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">新密码</label>
                        <div class="col-sm-8">
                            <input id="newPwd" name="newPwd" class="form-control" placeholder="输入新密码">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">确认密码</label>
                        <div class="col-sm-8">
                            <input id="copPwd" class="form-control" placeholder="输入新密码">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <input type="reset" class="btn btn-default" value="重置"/>
                        <a href="javascript:void(0);" onclick="updatePwd();"
                           class="btn btn-primary">保存</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>