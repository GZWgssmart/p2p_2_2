var tzBorrow = {
    id: {
        priList: 'invest-borrow-list',
        priSearch: 'tz-borrow-search',
        skbList: 'skb-list',
        skbModal: 'skb-modal'
    },
    url: {
        priUrl: '/borrowapply/list_user_invest'
    },
    look: {
        skbList: function () {
            var row = setTable.isSingleSelected(tzBorrow.id.priList);
            if (row) {
                var skbTable = $('#' + tzBorrow.id.skbList);
                var url = skbTable.attr('data-url');
                skbTable.attr('data-url', url + '?baid=' + row.baid);
                skbTable.bootstrapTable({
                    method: 'get',
                    contentType: 'application/x-www-form-urlencoded',
                    //【其它设置】
                    locale: 'zh-CN',//中文支持
                    pagination: true,//是否开启分页（*）
                    sidePagination: 'server', //分页方式：client客户端分页，server服务端分页（*）
                    showRefresh: true,//刷新按钮,
                    toolbar: '#skb-list-tollbar',
                    height: $(window).height()//table的高度
                });
                setTable.showModal(tzBorrow.id.skbModal);
            }
        }
    },
    sk: function () {
        var row = setTable.isSingleSelected(tzBorrow.id.skbList);
        if (row && row.state === 1) {
            $.post(contextPath + '/skb/save_gathering',
                {skid: row.skid},
                function (data) {
                    if (data.result === 'success') {
                        swtAlert.success_not_timer(data.message);
                        setTable.postRefresh(tzBorrow.id.skbList);
                    } else {
                        swtAlert.request_fail(data.message);
                    }
                }, 'json');
        } else {
            swtAlert.warn_info('请选择 已还款 的一行进行收款');
        }
    },
    fmt: {
        fmtState: function (value) {
            if (value === 1) {
                return '融资中';
            } else if (value === 4) {
                return '还款中';
            } else if (value === 5) {
                return '融资失败';
            } else if (value === 6) {
                return '已还完';
            }
        },
        fmtSkState: function (value) {
            if (value === 0) {
                return '未还款';
            } else if (value === 1) {
                return '<label style="color: green">已还款</label>';
            } else {
                return '已收款';
            }
        },
        fmtCpname: function (value, row, index) {
            return '<a target="_blank" href="/borrowdetail/detail_page/' + row.baid + '">' + value + '</a>';
        }
    },
    search: {
        searchPri: function (select) {
            if (select.value === '-1') {
                setTable.postRefresh(tzBorrow.id.priList);
            } else {
                setTable.doSearch(tzBorrow.id.priSearch,
                    tzBorrow.id.priList,
                    contextPath + tzBorrow.url.priUrl);
            }
        }
    }
};