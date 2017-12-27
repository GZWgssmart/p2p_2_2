var ourSelect2 = {
    classLoadNoSearch: function (url, placeholder, className) {
        var selectTag = $('.' + className);
        selectTag.select2({
            minimumResultsForSearch: -1,
            placeholder: placeholder,
            ajax: {
                url: contextPath + url,
                dataType: 'json',
                delay: 1500,
                processResults: function (data) {
                    return {
                        results: data
                    }
                }

            }
        });
    },
    idLoadNoSearch: function (url, placeholder, id) {
        var selectTag = $('#' + id);
        selectTag.select2({
            minimumResultsForSearch: -1,
            ajax: {
                url: contextPath + url,
                dataType: 'json',
                delay: 1500,
                processResults: function (data) {
                    return {
                        results: data
                    }
                }

            }
        });
    }
};