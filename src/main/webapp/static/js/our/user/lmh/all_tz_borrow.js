var tzBorrow = {
    id: {
        priTab: 'invest-borrow-list',
        priSearch: 'tz-borrow-search'
    },
    url: {
        priUrl: '/borrowapply/list_user_invest'
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
        }
    },
    search: {
        searchPri: function (select) {
            if (select.value === '-1') {
                setTable.postRefresh(tzBorrow.id.priTab);
            } else {
                setTable.doSearch(tzBorrow.id.priSearch,
                    tzBorrow.id.priTab,
                    contextPath + tzBorrow.url.priUrl);
            }
        }
    }
};