/**
 * Created by Animo on 2017-08-25.
 */
/**
 * Created by Animo on 2017-08-24.
 */
(function(document, window, $) {
    'use strict';
    (function() {
        $('#allAdmin').bootstrapTable({
            url: "/huser/all_admin",//匹配后台
            dataType:"json",//后台返回的数据
            method: 'post',//post提交
            pageNumber:1,//初始页码
            dataField: 'activityPage',
            contentType: "application/x-www-form-urlencoded",//必须的，操你大爷！！！！
            sidePagination: "server", //服务端请求
            search: true,//	是否启用搜索框
            strictSearch : true,//设置为 true启用 全匹配搜索，否则为模糊搜索
            striped:true,//	设置为 true 会有隔行变色效果
            pagination: true,//是否显示 数据条数选择框
            showRefresh: true,//	是否显示 刷新按钮
            showToggle: true,//是否显示 切换试图（table/card）按钮
            // sortName:'age',//定义排序列,通过url方式获取数据填写字段名，否则填写下标
            searchOnEnterKey:true,//设置为 true时，按回车触发搜索方法，否则自动触发搜索方法
            showColumns: true,//是否显示 内容列下拉框
            cardView:true,//设置为 true将显示card视图，适用于移动设备。否则为table试图，适用于pc
            detailView:true,//	设置为 true 可以显示详细页面模式。
            pageList: [10, 25, 50, 100], //可供选择的每页的行数（*）
            iconSize: 'outline',
            toolbar: '#exampleTableEventsToolbar',
            icons: {
                refresh: 'glyphicon-repeat',
                toggle: 'glyphicon-list-alt',
                columns: 'glyphicon-list'
            },
            columns: [
                {
                    checkbox:true
                },{
                    field:'hid',
                    title:'用户id',
                    "visible": false
                }, {
                    field: 'rname',
                    title: '用户姓名',
                    align:'center'
                }, {
                    field: 'sex',
                    title: '性别',
                    align:'center'
                }, {
                    field: 'email',
                    title: '邮箱',
                    align:'center'
                },{
                    field: 'roleRname',
                    title: '角色',
                    align:'center'
                }
            ],
            queryParamsType: "undefined"
        });

        var $result = $('#examplebtTableEventsResult');
        //
        // $('#exampleTableEvents').on('all.bs.table', function(e, name, args) {
        //     console.log('Event:', name, ', data:', args);
        // })
        //
        //     .on('click-row.bs.table', function(e, row, $element) {
        //         $result.text('Event: click-row.bs.table');
        //     })
        //
        //     .on('dbl-click-row.bs.table', function(e, row, $element) {
        //         $result.text('Event: dbl-click-row.bs.table');
        //     })
        //     .on('sort.bs.table', function(e, name, order) {
        //         $result.text('Event: sort.bs.table');
        //     })
        //
        //     .on('check.bs.table', function(e, row) {
        //         $result.text('Event: check.bs.table');
        //     })
        //     .on('uncheck.bs.table', function(e, row) {
        //         $result.text('Event: uncheck.bs.table');
        //     })
        //
        //     .on('check-all.bs.table', function(e) {
        //         alert("单选框全部选中");
        //         $result.text('Event: check-all.bs.table');
        //     })
        //
        //     .on('uncheck-all.bs.table', function(e) {
        //         $result.text('Event: uncheck-all.bs.table');
        //     })
        //
        //     .on('load-success.bs.table', function(e, data) {
        //         //alert("刷新成功");
        //         $result.text('Event: load-success.bs.table');
        //     })
        //     .on('load-error.bs.table', function(e, status) {
        //         $result.text('Event: load-error.bs.table');
        //     })
        //     .on('column-switch.bs.table', function(e, field, checked) {
        //         $result.text('Event: column-switch.bs.table');
        //     })
        //     .on('page-change.bs.table', function(e, size, number) {
        //         $result.text('Event: page-change.bs.table');
        //     })
        //     .on('search.bs.table', function(e, text) {
        //         $result.text('Event: search.bs.table');
        //     });
    })();
})(document, window, jQuery);

