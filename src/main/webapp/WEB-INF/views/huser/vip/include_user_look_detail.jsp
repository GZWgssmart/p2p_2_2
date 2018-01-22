<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="modal fade bs-example-modal-lg" id="look-detail-modal" tabindex="-1" role="dialog"
     aria-labelledby="myLargeModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">用户详情</h4>
            </div>
            <div class="modal-body">
                <form id="look-detail-form" class="form-horizontal">
                    <div class="form-group">
                        <label for="update-uname-input" class="col-sm-2 control-label">真实姓名</label>
                        <div class="col-sm-10">
                            <input name="uname" class="form-control" id="update-uname-input">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update-phone-input" class="col-sm-2 control-label">手机号</label>
                        <div class="col-sm-10">
                            <input name="phone" class="form-control" id="update-phone-input">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update-idtype-input" class="col-sm-2 control-label">证件类型</label>
                        <div class="col-sm-10">
                            <input name="idtype" class="form-control" id="update-idtype-input">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update-idno-input" class="col-sm-2 control-label">证件号</label>
                        <div class="col-sm-10">
                            <input name="idno" class="form-control" id="update-idno-input">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update-email-input" class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-10">
                            <input name="email" class="form-control" id="update-email-input">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update-rname-input" class="col-sm-2 control-label">真实姓名</label>
                        <div class="col-sm-10">
                            <input name="rname" class="form-control" id="update-rname-input">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="face-img" class="col-sm-2 control-label">头像：</label>
                        <div class="col-sm-10">
                            <img id="face-img" src="" alt="" class="img img-responsive"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update-sex-input" class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <input name="sex" class="form-control" id="update-sex-input">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update-registerTime-input" class="col-sm-2 control-label">注册时间</label>
                        <div class="col-sm-10">
                            <input name="registerTime" class="form-control" id="update-registerTime-input">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update-ism-input" class="col-sm-2 control-label">婚否</label>
                        <div class="col-sm-10">
                            <input name="ism" class="form-control" id="update-ism-input">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update-bschool-input" class="col-sm-2 control-label">毕业学院</label>
                        <div class="col-sm-10">
                            <input name="bschool" class="form-control" id="update-bschool-input">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update-addr-input" class="col-sm-2 control-label">居住地</label>
                        <div class="col-sm-10">
                            <input name="addr" class="form-control" id="update-addr-input">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update-work-input" class="col-sm-2 control-label">现工作</label>
                        <div class="col-sm-10">
                            <input name="work" class="form-control" id="update-work-input">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update-age-input" class="col-sm-2 control-label">年龄</label>
                        <div class="col-sm-10">
                            <input name="age" class="form-control" id="update-age-input">
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>