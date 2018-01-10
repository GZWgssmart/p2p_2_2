<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div style="width: 100%;" class="modal fade bs-example-modal-lg" id="hkb-modal" tabindex="-1" role="dialog"
     aria-labelledby="myLargeModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div style="width: 100%;" class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">还款列表</h4>
            </div>
            <div class="modal-body">
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
                        <th data-field="state">状态</th>
                        <th data-field="yustartime" data-formatter="setTable.formatDate">逾期开始时间</th>
                        <th data-field="rtime" data-formatter="setTable.formatDate">实还时间</th>
                    </tr>
                    </thead>
                </table>
            </div>
        </div>
    </div>
</div>