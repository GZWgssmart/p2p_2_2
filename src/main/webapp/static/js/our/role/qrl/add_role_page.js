var setting = {
    check: {
        enable: true,
        chkStyle: "checkbox",
        chkboxType: { "Y": "ps", "N": "ps" }
    },
    data: {
        simpleData: {
            enable: true,
            idKey : "id",       // 结点的id,对应到Json中的id
            pIdKey : "parentId",// 结点的pId,对应到Json中的parentId
            rootPId : -1
        }
    },
    callback:{
        onAsyncSuccess:expandAll
    },
    async : {
        enable : true,  // 采用异步方式获取所有节点数据,默认false
        url : "/jur/list_treeVO"
    }
};

function expandAll() {
    var treeObj = $.fn.zTree.getZTreeObj("jurTree");
    treeObj.expandAll(true);
}

$(document).ready(function(){
    $.fn.zTree.init($("#jurTree"), setting);
});


function addRole() {
    if($('#add_role').valid()){
        var treeObj = $.fn.zTree.getZTreeObj("jurTree");
        var nodes1 = treeObj.getCheckedNodes(true);
        var jurIds = "";
        for(i = 0; i<nodes1.length; i++){
            jurIds = jurIds + nodes1[i].id + ",";
        }

        $.post("" + "/role/add?jurIds="+jurIds,
            $("#add_role").serialize(),
            function (data) {
                if (data.result === 'success') {
                    swal(data.message,"","success");
                    $(":text").val("");
                    var treeObj = $.fn.zTree.getZTreeObj("jurTree");
                    treeObj.checkAllNodes(false);
                } else {
                    swal(data.message,"","error");
                }
            }
        );
    }
}


$(function () {
    return $('#add_role').validate({
        onfocusout: function(element){
            $(element).valid();
        },
        debug:false,
        onkeyup:false,
        rules:{
            'rname':{
                required: true,
                isName: true
            },
        },
        messages:{

        }
    });
})
