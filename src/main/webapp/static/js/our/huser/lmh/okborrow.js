var okBorrow = {
    id: {
        priTab: 'okborrow-list',
        lookModal: 'look-detail-modal',
        lookForm: 'look-detail-form',
        searchForm:'okborrow-search-form'
    },
    url: {
      pri: '/borrowapply/list_okborrow'
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
                return '还款成功';
            }
        }
    },
    lookDetail: function () {
        var row = setTable.isSingleSelected(okBorrow.id.priTab);
        if (row) {
            $.get('/borrowdetail/getByApplyId/' + row.baid,
                function (data) {
                    $('#ypic-img').attr('src', contextPath + data.ypic);
                    $(okBorrow.id.lookForm).form('load', data);
                }, 'json');
            setTable.showModal('look-detail-modal');
        }
    },
    okCheck: function () {
        var row = setTable.isSingleSelected(allShborrow.id.priTab);
        if (row) {
            swal({
                title: dataDict.manage.checkConfirm,
                text: dataDict.manage.noCancelMsg,
                type: 'warning',
                showCancelButton: true
            }).then(function (isConfirm) {
                if (isConfirm.value) {
                    $.post('/shborrow/updateStatus',
                        {
                            'baid': row.baid,
                            'isok': 1,
                            'shid': row.shid,
                            'excuse': ''
                        }, function (data) {
                            setTable.requestCall(data, allShborrow.id.priTab);
                        }, 'json');
                }
            });

        }
    },
    submit: {
        search: function (select) {
            if (select.value === '-1') {
                setTable.postRefresh(okBorrow.id.priTab);
            } else {
                setTable.doSearch(okBorrow.id.searchForm,
                    okBorrow.id.priTab,
                    contextPath + okBorrow.url.pri);
            }
        }
    }
};