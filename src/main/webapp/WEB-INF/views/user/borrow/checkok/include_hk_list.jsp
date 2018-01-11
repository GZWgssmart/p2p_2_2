<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div style="width: 100%;" class="modal fade" id="hkb-modal" tabindex="-1" role="dialog"
     aria-labelledby="myLargeModalLabel">
    <div  style="width: 100%;" class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">还款列表</h4>
            </div>
            <div class="modal-body">
                <div id="hk-list-tollbar" class="tool-bar">
                    <form id="password-form" class="form-inline">
                        <input id="deal-password" placeholder="请输入您的交易密码后还款" type="password" class="form-control"/>
                        <a href="javascript:void(0);" onclick="allCheckok.hk();" class="btn btn-primary">还款</a>
                    </form>
                </div>
                <table id="hkb-list" class="table table-hover"
                       data-single-select="true"
                       data-url="<%=path%>/hkb/pager_criteria">
                    <thead>
                    <tr>
                        <th data-checkbox="true"></th>
                        <th data-field="rname">申请人</th>
                        <th data-field="cpname">产品名</th>
                        <th data-field="ybx">本息</th>
                        <th data-field="ylx">利息</th>
                        <th data-field="ybj">本金</th>
                        <th data-field="yfx">罚息</th>
                        <th data-field="state" data-formatter="allCheckok.formatter.formatHkState">状态</th>
                        <th data-field="yustartime" data-formatter="setTable.formatDate">逾期开始时间</th>
                        <th data-field="rtime" data-formatter="setTable.formatDate">实还时间</th>
                    </tr>
                    </thead>
                </table>
            </div>
        </div>
    </div>
</div>