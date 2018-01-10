<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="modal fade" id="update-rewardSetting-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 100%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">修改投资奖励设置</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form" id="updateForm">
                    <input type="hidden" id="rwid" name="rwid">
                    <div class="form-group">
                        <label for="update-minmoney" class="col-sm-1 control-label">最小金额</label>
                        <div class="col-sm-10">
                            <input id="update-minmoney" type="text" class="form-control" name="minmoney"  placeholder="请输入最小金额">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update-maxmoney" class="col-sm-1 control-label">最大金额</label>
                        <div class="col-sm-10">
                            <input id="update-maxmoney" type="text" class="form-control" name="maxmoney"  placeholder="请输入最大金额">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update-percent" class="col-sm-1 control-label">百分比</label>
                        <div class="col-sm-10">
                            <input id="update-percent" type="text" class="form-control" name="percent"  placeholder="请输入百分比">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button id="btn" type="button" class="btn btn-primary" onclick="update();">修改</button>
            </div>
        </div>
    </div>
</div>

