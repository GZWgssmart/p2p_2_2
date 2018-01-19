var txLog = {
    id: {
        priTab: 'txLog-list',
        search: 'txlog-search-form'
    },
    url: {
        pri: '/tx_log/pager_criteria'
    },
    open: {

    },
    submit: {
        search: function () {
            setTable.doSearch(txLog.id.search,
                txLog.id.priTab, txLog.url.pri);
        }
    }
};