var allShborrow = {
    formatter: {
        formatIsok: function (value) {
            if (value === 0) {
                return '审核不通过';
            } else if (value === 1) {
                return '审核通过';
            } else if (value === 2) {
                return '审核中';
            }
        }
    }
};