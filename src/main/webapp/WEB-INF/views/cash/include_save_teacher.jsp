<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="modal fade bs-example-modal-lg" id="saveTeacherModal" tabindex="-1" role="dialog"
     aria-labelledby="myLargeModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">添加教师</h4>
            </div>
            <div class="modal-body">
                <form id="save-teacher-basic" class="form-horizontal">
                    <div class="form-group">
                        <label for="input-name" class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-10">
                            <input name="teacher.name" class="form-control" id="input-name" placeholder="教师姓名">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="input-phone" class="col-sm-2 control-label">手机</label>
                        <div class="col-sm-10">
                            <input name="teacher.phone" class="form-control" id="input-phone" placeholder="请输入手机号">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="btn-group col-sm-10" data-toggle="buttons">
                            <label  class="btn btn-info active">
                                <input type="radio" name="teacher.gender" value="1" checked>男
                            </label>
                            <label  class="btn btn-info">
                                <input type="radio" name="teacher.gender" value="2">女
                            </label>
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