$(function(){
	//页面初始化
	utils.initPage();
	if(window.location.href.indexOf('?')>0){
		$('#repayWay').val(utils.getUrlParam('repayWay'));
		$('#annualRate').val(utils.getUrlParam('annualRate'));
		$('#time').val(utils.getUrlParam('time'));
	}
	// $('.btn').click(function(){
	// 	initData();
	// })
	
	$('#isDayThe').change(function(){
		var isDayThe=$('#isDayThe').val();
		$("#qishu1").find("li").remove();
		$("#qishu2").find("li").remove();
		if(isDayThe==2){
			$('#qishu3').html("");
			$('#repayTime').html("（天）");
			$('#repayWay').html('<option value="2">一次还本付息</option>');
			$('#qishu1').append('<li class="title"><div class="children0">期数</div><div class="children1">应还本息</div><div class="children2">应还本金</div><div class="children3">应还利息</div><div class="children4">本息余额</div></li>');
		}else{
			$('#qishu3').html("每个月");
			$("#qishu1").find("li").remove();
			$('#repayTime').html("（月）");
			$('#repayWay').html('<option value="1">等额本息还款</option><option value="2">一次还本付息</option><option value="3">先息后本</option>');
			$('#qishu1').append('<li class="title"><div class="children0">期数</div><div class="children1">月还本息</div><div class="children2">月还本金</div><div class="children3">月还利息</div><div class="children4">本息余额</div></li>');
		}
		
		var repayWay = $('#repayWay').val();
		var money = $('#money').val();
		var annualRate = $('#annualRate').val();
		var time = $('#time').val();
		if(repayWay !=""&&money !="" &&annualRate !="" &&time !=""){
			initData();
		}
		
	})

    var  money = $('#money1').val();
    var  nprofit = $('#nprofit1').val();
    var  term = $('#term1').val();
    var  bzid = $('#bzid1').val();

	if((money != null && money != "" && money != undefined) && (nprofit != null && nprofit != "" && nprofit != undefined) &&
        (term != null && term != "" && term != undefined) && (bzid != null && bzid != "" && bzid != undefined)){
         $('#money').val(money);
         $('#nprofit').val(nprofit);
         $('#term').val(term);
        $("#bzid option").each(function(){  //遍历所有option
            var txt = $(this).val();   //获取option值
            if(txt == bzid ){
                $(this).prop("selected",true)
            }
        })
        initData();
	}


});
function initData(){
	$('.listData').empty();
	var repayWay = $('#repayWay').val();
	var money = $('#money').val();
	var annualRate = $('#annualRate').val();
	var time = $('#time').val();
	if(annualRate==''){
		utils.toast('年化收益率不能为空');
		return;
	}
	if(time==''){
		utils.toast('还款期限不能为空');
		return;
	}
	if(utils.isMoney(money)){
		utils.toast('请输入正确的金额');
		return;
	}
    $.post("/borrowdetail/calculate_earn",
        $('#calculForm').serialize(),
        function (data) {
            if (data.allLoans != null) {
				for(i = 0; i < data.allLoans.length; i++){
					$('#allPay').text(data.totalRepayment);
					if(i%2 == 1){
                        $('#qishu2').append(
                            "<li class=\"interval\">\n" +
                            "                        <div class=\"children0\">"+data.allLoans[i].month+"</div>\n" +
                            "                        <div class=\"children1\">"+formateData(data.allLoans[i].repayment)+"</div>\n" +
                            "                        <div class=\"children2\">"+formateData(data.allLoans[i].payPrincipal)+"</div>\n" +
                            "                        <div class=\"children3\">"+data.allLoans[i].interest+"</div>\n" +
                            "                        <div class=\"children4\">"+formateData(data.allLoans[i].remainTotal)+"</div>\n" +
                            "                        </li>"
                        );
					}else{
                        $('#qishu2').append(
                        	"<li>\n" +
                            "                        <div class=\"children0\">"+data.allLoans[i].month+"</div>\n" +
                            "                        <div class=\"children1\">"+formateData(data.allLoans[i].repayment)+"</div>\n" +
                            "                        <div class=\"children2\">"+formateData(data.allLoans[i].payPrincipal)+"</div>\n" +
                            "                        <div class=\"children3\">"+data.allLoans[i].interest+"</div>\n" +
                            "                        <div class=\"children4\">"+formateData(data.allLoans[i].remainTotal)+"</div>\n" +
                            "            </li>"
						);
					}

				}
            } else {
                $('#selectQuan').append("<option value='0'>当前没有可用的优惠券</option>");
            }
        }, "json"
    );

	function formateData(value) {
		if(value == null){
			return 0;
		}else{
			return value;
		}

    }

    // var dataList = [
	 //                {
	 //                	key:'mon',resolve:function(val){
	 //                		return val;
	 //                	}
	 //                },
	 //                {
	 //                	key:'monForRateA',resolve:function(val){
	 //                		return val;
	 //                	}
	 //                },
	 //                {
	 //                	key:'monForA',resolve:function(val){
	 //                		return val;
	 //                	}
	 //                },
	 //                {
	 //                	key:'monForRate',resolve:function(val){
	 //                		return val;
	 //                	}
	 //                },
	 //                {
	 //                	key:'rateARemain',resolve:function(val){
	 //                		return val;
	 //                	}
	 //                }
	 //                ]
    // var param={repayWay:repayWay,borrowSum:money,yearRate:annualRate,borrowTime:time,isDayThe:$('#isDayThe').val()};
    // utils.ajax({
    //     url:'front/frontfinanceTools.do',
    //     data:JSON.stringify(param),
    //     dataType:'json',
    //     success: function(data){
    //     	if(data.error == '0'){
    //     		if(data.isDayThe=='2'){
    //     			$('#qishu3').html("");
    //     			$('.children1').html("应还本息");
    //     			$('.children2').html("应还本金");
    //     			$('.children3').html("应还利息");
    //     		}else{
    //     			$('#qishu3').html("每个月");
    //     			$('.children1').html("月还本息");
    //     			$('.children2').html("月还本金");
    //     			$('.children3').html("月还利息");
    //     		}
    //     		utils.initListData(dataList,data.lists,$('.listData'));
    //     		$('#monAmt').text(data.lists[0].monForRateA);
    //     		$('#monRate').text(data.lists[0].monRate+'%');
    //     		$('#allPay').text(data.lists[0].allPay);
    //     	}else{
    //     		utils.toast(data.msg);
    //     	}
    //     }
    // });
}