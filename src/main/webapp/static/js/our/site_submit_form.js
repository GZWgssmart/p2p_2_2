var submitForm = {
    save: function (url, formId, tableId, modalId) {
        var $form = $('#' + formId);
        if ($form.valid()) {
            $.post(url, $form.serialize(),
                function (data) {
                    if (data.result === 'success') {
                        swtAlert.request_success(data.message);
                        $form[0].reset();
                        $('#' + tableId).bootstrapTable('refresh');
                        $('#' + modalId).modal('hide');
                    } else {
                        swtAlert.request_fail(data.message);
                    }
                }, 'json');
        } else {
            swtAlert.warn_info(dataDict.form.validForm);
        }
    },
    update: function (url, formId, tableId) {
        var $form = $('#' + formId);
        $.post(url, $form.serialize(),
            function (data) {
                if (data.result === 'success') {
                    swtAlert.request_success(data.message);
                    $('#' + tableId).bootstrapTable('refresh');
                } else {
                    swtAlert.request_fail(data.message);
                }
            }, 'json');
    },
    login: function (url, formId, okUrl) {
        var $form = $('#' + formId);
        $.post(url, $form.serialize(),
            function (data) {
                if (data.result === 'success') {
                    window.location.href = okUrl;
                } else {
                    swtAlert.request_fail(data.message);
                }
            }, 'json');
    }
};