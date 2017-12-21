<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="modal fade bs-example-modal-lg" id="clazzTeacherModal" tabindex="-1" role="dialog"
     aria-labelledby="myLargeModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">分配班级</h4>
            </div>
            <div class="modal-body">
                <table id="clazzTeacherList" class="table table-hover">
                    <thead>
                    <tr>
                        <th data-checkbox="true"></th>
                        <th data-field="clazz" data-formatter="setTable.formatName">班级名称</th>
                        <th data-field="teachStatus" data-formatter="teacherTable.formatTeachStatus">状态</th>
                        <th data-field="modifiedTime" data-formatter="setTable.formatDate">修改时间</th>
                        <th data-field="createdTime" data-formatter="setTable.formatDate">创建时间</th>
                    </tr>
                    </thead>
                </table>
                <div class="modal-footer">
                    <a href="javascript:void(0);" class="btn btn-default" data-dismiss="modal">取消</a>
                    <a href="javascript:void(0);" onclick="teacherForm.save();" class="btn btn-primary">确认</a>
                </div>
            </div>
        </div>
    </div>
</div>

