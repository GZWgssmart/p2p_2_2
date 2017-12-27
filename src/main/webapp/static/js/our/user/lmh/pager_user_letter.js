var pagerUserLetter = {
    formatState: function (value) {
        if (value === 1) {
            return '已读';
        } else if (value === 2) {
            return '未读';
        }
    },
    formatTitle: function (value, row, index) {
        if (row.state === 2) {
            return '<strong>' + value + '</strong>';
        }
        return value;
    }
};