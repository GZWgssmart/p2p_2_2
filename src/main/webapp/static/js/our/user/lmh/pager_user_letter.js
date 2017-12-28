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
    },
    removeRows: function() {
        setTable.removeRows('/user_letter/update_status?state=0', 'letter-list');
    },
    readRows: function () {
        setTable.updateStatus('/user_letter/update_status?state=1', 'letter-list');
    },
    unreadRows: function () {
        setTable.updateStatus('/user_letter/update_status?state=2', 'letter-list');
    }

};