var allShborrow = {
    id: {
        tableId: 'shborrow-list',
        checkForm: 'check-form',
        checkModal: 'check-modal'
    },
    formatter: {
        formatState: function (value) {
            if (value === 0) {
                return '审核不通过';
            } else if (value === 1) {
                return '审核通过';
            } else if (value === 2) {
                return '审核中';
            }
        }
    },
    lookDetail: function () {
        var row = setTable.isSingleSelected(allShborrow.id.tableId);
        if (row) {
            $.get('/borrowdetail/getByApplyId/' + row.baid,
                function (data) {
                    $('#ypic-img').attr('src', contextPath + data.ypic);
                    $('#look-detail-form').form('load', data);
                }, 'json');
            setTable.showModal('look-detail-modal');
        }
    },
    okCheck: function () {
        var row = setTable.isSingleSelected(allShborrow.id.tableId);
        if (row) {
            $.post('/shborrow/updateStatus',
                {
                    'baid': row.baid,
                    'isok': 1,
                    'shid': row.shid,
                    'excuse': ''
                }, function (data) {
                    setTable.requestCall(data, allShborrow.id.tableId);
                }, 'json');
        }
    },
    showCheckForm: function () {
        var row = setTable.isSingleSelected(allShborrow.id.tableId);
        if (row) {
            setTable.showModal(allShborrow.id.checkModal);
            $('#check-shid-input').val(row.shid);
            $('#check-baid-input').val(row.baid);
            $('#excuse-input').val(row.excuse);
            return $('#' + allShborrow.id.checkForm).validate({
                onfocusout: function(element){
                    $(element).valid();
                },
                debug:false,
                onkeyup:false,
                rules:{
                    'excuse':{
                        required: true
                    }
                }
            });
        }
    },
    submitCheck: function () {
        if ($('#' + allShborrow.id.checkForm).valid()) {
            $.post('/shborrow/updateStatus',
                $('#' + allShborrow.id.checkForm).serialize(),
                function (data) {
                    setTable.requestCall(data, allShborrow.id.tableId, allShborrow.id.checkModal);
                }, 'json');
        }
    }
};