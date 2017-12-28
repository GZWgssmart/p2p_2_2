var setTable = {
    setBootstrapTable: function (tableId) {
        $('#' + tableId).bootstrapTable({
            method: 'get',
            contentType: 'application/x-www-form-urlencoded',
            //【其它设置】
            locale: 'zh-CN',//中文支持
            pagination: true,//是否开启分页（*）
            sidePagination: 'server', //分页方式：client客户端分页，server服务端分页（*）
            showRefresh: true,//刷新按钮
            toolbar: '#tool-bar',
            height: $(window).height()//table的高度
        });
    },
    removeRows: function (url, tableId) {
        var rows = $('#' + tableId).bootstrapTable('getSelections');
        if (rows.length > 0) {
            swtAlert.removeRows(rows, url, tableId);
        } else {
            swtAlert.warn_info(dataDict.manage.noSelected);
        }
    },
    updateStatus: function (url, tableId) {
        var rows = setTable.isSelected(tableId);
        if (rows) {
            var ids = setTable.convertSelectedId(rows);
            $.post(contextPath + url + '&id=' + ids,
                function (data) {
                    if (data.result === 'success') {
                        swtAlert.request_success(data.message);
                        $('#' + tableId).bootstrapTable('refresh');
                    } else {
                        swtAlert.request_fail(data.message);
                    }
                }, 'json');
        }
    },
    isSingleSelected: function (tableId) {
        var row = $('#' + tableId).bootstrapTable('getSelections');
        if (row.length === 1) {
            return row[0];
        }
        swtAlert.warn_info(dataDict.manage.singleSelect);
        return false;
    },
    isSelected: function (tableId) {
        var row = $('#' + tableId).bootstrapTable('getSelections');
        if (row.length >= 1) {
            return row;
        }
        swtAlert.warn_info(dataDict.manage.noSelected);
        return false;
    },
    convertSelectedId: function (rows) {
        var ids = '';
        for (var i = 0, len = rows.length; i < len; i++) {
            if (ids === '') {
                ids = rows[i].id;
            } else {
                ids += ',' + rows[i].id;
            }
        }
        return ids;
    },
    openUpdateModal: function (tableId, formId, prefix, modalId) {
        if (setTable.singleSelect(tableId)) {
            var row = $('#' + tableId).bootstrapTable('getSelections');
            var reRow = setTable.rebuildRow(row[0], prefix);
            var myForm = $('#' + formId);
            myForm.form('load', reRow);
            $('#' + modalId).modal('show');
            cashValidate.searchValid(formId).resetForm();
        }
    },
    rebuildRow: function (row, prefix) {
        var data = {};
        for (var key in row) {
            data[prefix + "." + key] = row[key];
        }
        return data;
    },
    doSearch: function (formId, tableId, url) {
        $('#' + tableId).bootstrapTable('refresh', {
            url: url + "?" + $('#' + formId).serialize()
        });
    },
    formatName: function (value) {
        return value.name;
    },
    formatDate: function (value) {
        if (value === undefined || value === null || value === '') {
            return '';
        } else {
            var date = new Date(value);
            var year = date.getFullYear().toString();
            var month = (date.getMonth() + 1);
            var day = date.getDate().toString();
            var hour = date.getHours().toString();
            var minutes = date.getMinutes().toString();
            var seconds = date.getSeconds().toString();
            if (month < 10) {
                month = '0' + month;
            }
            if (day < 10) {
                day = '0' + day;
            }
            if (hour < 10) {
                hour = '0' + hour;
            }
            if (minutes < 10) {
                minutes = '0' + minutes;
            }
            if (seconds < 10) {
                seconds = '0' + seconds;
            }
            if (hour === 0 && minutes === 0 && seconds === 0) {
                return year + '-' + month + '-' + day;
            }
            return year + '-' + month + '-' + day + ' ' + hour + ':' + minutes + ':' + seconds;
        }
    },
    formatGender: function (value) {
        if (value === 1) {
            return '男';
        } else if (value === 2) {
            return '女';
        } else {
            return '未填写';
        }
    },
    formatImg: function (value) {
        return '<img class="img-responsive" src="' + contextPath + value + '" />';
    }
};

