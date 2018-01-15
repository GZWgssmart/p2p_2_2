var tzLog = {
    id: {
        priList: 'invest-log-list',
        priSearch: 'tz-log-search',
        skbList: 'skb-list',
        skbModal: 'skb-modal'
    },
    url: {
        priUrl: '/borrowapply/list_user_invest'
    },
    fmt: {
        fmtCpname: function (value, row, index) {
            return '<a target="_blank" href="/borrowdetail/detail_page/' + row.baid + '">' + value + '</a>';
        }
    }
};