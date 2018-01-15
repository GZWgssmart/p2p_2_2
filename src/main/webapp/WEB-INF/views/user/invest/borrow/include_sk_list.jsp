<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div style="width: 100%;" class="modal fade" id="skb-modal" tabindex="-1" role="dialog"
     aria-labelledby="myLargeModalLabel">
    <div style="width: 100%;" class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">还款列表</h4>
            </div>
            <div class="modal-body">
                <div id="skb-list-tollbar" class="tool-bar">
                    <a href="javascript:void(0);" onclick="tzBorrow.sk();" class="btn btn-primary">收款</a>
                </div>
                <table id="skb-list" class="table table-hover"
                       data-single-select="true"
                       data-url="<%=path%>/skb/pager_criteria">
                    <thead>
                    <tr>
                        <th data-checkbox="true"></th>
                        <th data-field="ybx">应收本息</th>
                        <th data-field="rbx">已收本息</th>
                        <th data-field="ylx">应收利息</th>
                        <th data-field="rlx">已收利息</th>
                        <th data-field="ybj">应收本金</th>
                        <th data-field="rbj">已收本金</th>
                        <th data-field="state" data-formatter="tzBorrow.fmt.fmtSkState">状态</th>
                        <th data-field="date" data-formatter="setTable.formatDate">收款时间</th>
                    </tr>
                    </thead>
                </table>
            </div>
        </div>
    </div>
</div>