<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="modal fade" id="saveRewardSettingModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 100%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">添加投资奖励设置</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form" id="addForm">
                    <div class="form-group">
                        <label for="minmoney" class="col-sm-1 control-label">最小金额</label>
                        <div class="col-sm-10">
                            <input id="minmoney" type="number" class="form-control" name="minmoney"  placeholder="请输入最小金额">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="maxmoney" class="col-sm-1 control-label">最大金额</label>
                        <div class="col-sm-10">
                            <input id="maxmoney" type="number" class="form-control" name="maxmoney"  placeholder="请输入最大金额">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="percent" class="col-sm-1 control-label">百分比</label>
                        <div class="col-sm-10">
                            <input id="percent" type="number" class="form-control" name="percent"  placeholder="请输入百分比">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button id="btn" type="button" class="btn btn-primary" onclick="allRewardSetting.submitSave();">添加</button>
            </div>
        </div>
    </div>
</div>

