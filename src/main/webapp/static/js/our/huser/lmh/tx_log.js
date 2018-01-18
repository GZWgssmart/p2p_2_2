var txLog = {
    id: {
        priTab: 'txLog-list',
        saveModal: 'save-excuse-modal',
        saveForm: 'save-excuse-form'
    },
    url: {
        pri: '/tx_log/pager_criteria'
    },
    open: {

    },
    submit: {
        search: function (select) {
            if (select.value === '-1') {
                setTable.postRefresh(txLog.id.priTab);
            } else {
                setTable.doSearch(txLog.id.searchForm,
                    txLog.id.priTab,
                    contextPath + txLog.url.pri);
            }
        }
    }
};