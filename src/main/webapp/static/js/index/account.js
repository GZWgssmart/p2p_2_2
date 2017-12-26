var contentType = "application/x-www-form-urlencoded; charset=utf-8";
var oPage;
$(function(){
		//初始化footer
		utils.initPage();
		if(!utils.Storage.getItem('uid')){
			utils.alert('您还未登录，请先登录！',function(){
				window.location.href=utils.getBasePath()+'login.html';
			});
			return;
		};
		hashChange();
});
function hashChange(){
	var hash = location.hash.replace('#','');
	$('.sub-nav li').removeClass('active');
	$('a[href="#'+hash+'"]').parent('li').addClass('active');
	switch(hash){
		case 'account':
			initAccount();
			break;
		case 'tuijian':
			initTuijian();
			break;
		case 'ipay':
			initIpay();
			break;
		case 'cash':
			initCash();
			break;
		case 'taste':
			initTaste();
			break;
		case 'fund':
			initFundRecord();
			break;
		case 'invest':
			initInvestManage();
			break;
		case 'claimm':
			initClaimManage();
			break;
		case 'claimb':
			initClaimBuy();
			break;
		case 'loan':
			initLoanManage();
			break;
		case 'bank':
			initMyDebitCard();
			break;
		case 'safe':
			initSafe();
			break;	
		case 'msg':
			initMsgCenters();
			break;
		case 'hetong':
			initHeTong();
			break;
		default : initAccount();$('a[href="#account"]').parent('li').addClass('active');
		break;
	};
	$('a[href="#'+hash+'"]').parent('li').addClass('active');
}

//账户总览
function initAccount(){
	$.ajax({
	    url: 'myaccount.html',
	    type: "get",
	    dataType: "html",
	    contentType:contentType,
	    success: function (data) {
	    	$('.account-right').empty();
	    	$('.account-right').html(data);
	    	$('.account-content').hide();
	    	$('.slb-view').hide();
//	       	//账户总览
	    	$('.all-a').click(function(){
	    		if($(this).hasClass('active')){
	    			return;
	    		}
	    		$(this).addClass('active').siblings('a').removeClass('active');
	    		$('.em-line').animate({'left':'0'},500);
	    		$('.all-view').show();
	    		$('.slb-view').hide();
	    	});
	    	//生利宝
	    	$('.slb-a').click(function(){
	    		if($(this).hasClass('active')){
	    			return;
	    		}
	    		$(this).addClass('active').siblings('a').removeClass('active');
	    		$('.em-line').animate({'left':'120px'},500);
	    		$('.all-view').hide();
	    		$('.slb-view').show();
	    		$('.list-a').show();
	    		$('.list-c').hide();
	    		$('#startDate').datepicker({format:'yyyy-mm-dd'}).on('changeDate',function(){});
		    	$('#endDate').datepicker({format:'yyyy-mm-dd'}).on('changeDate',function(){});
		    	var ipayAccount="";
		    	//查询汇付信息
		    	utils.ajax({
	    			url:'front/querShengLiBaoInfo.do',
	    			data:{},
	    			dataType:'json',
	    			success:function(data){
	    				ipayAccount=data.ipayAccount;
	    				if(data.error=="0"){
	    					$("#annuRate").html(data.annuRate);
		    				$("#prdRate").html(data.prdRate);
		    				$("#slbSum").html(data.totalAsset);
		    				$("#totalProfit").html(data.totalProfit);
	    				}else if (data.error == 1){
	    					utils.alert('您还未注册汇付天下，请先注册汇付天下！',function(){
	    						window.location.href='registpay.html';
	    					});
	    				} else {
	    					utils.alert(data.msg);
	    				}
	    				
	    			}
	    		});
		    	
		    	//搜索
		    	$('#slbSearch').unbind('click').click(function(){
		    		if(ipayAccount==""){
		    			utils.alert("您还未注册汇付天下");
		    			return;
		    		}
		    		var startDate = $('#startDate').val();
		    		var endDate = $('#endDate').val();
		    		if(startDate == ''){
		    			utils.toast('开始时间不能为空');
		    			return;
		    		}
		    		if(endDate == ''){
		    			utils.toast('结束时间不能为空');
		    			return;
		    		}
		    		if(startDate>endDate){
		    			utils.toast('开始时间不能大于结束时间');
		    			return;
		    		}
		    		if($("#to").hasClass('active')){
		    			initSlbData(startDate,endDate,1);
		    		}else if($("#go").hasClass('active')){
		    			initSlbData(startDate,endDate,2);
		    		}else{
		    			initSlbEarnData(startDate,endDate);
		    		}
		    		
		    	});
		    	
		    	if($('.listData li').size() == 0){
		    		//生利宝转入初始化数据查询
	    			initSlbData("","",1);
		    	}
		    	$('.slb-to').click(function(){
		    		if($(this).hasClass('active')){
		    			return;
		    		}
		    		if(ipayAccount==""){
		    			utils.alert("您还未注册汇付天下");
		    			return;
		    		}
		    		var startDate = $('#startDate').val();
		    		var endDate = $('#endDate').val();
			    	//生利宝转入初始化数据查询
		    		initSlbData(startDate,endDate,1);
		    		$(this).addClass('active').siblings('a').removeClass('active');
		    		$('.em-list').animate({'left':'0'},500);
		    		$('.list-a').show();
		    		$('.list-c').hide();
		    		
		    	});
		    	$('.slb-go').click(function(){
		    		if($(this).hasClass('active')){
		    			return;
		    		}
		    		if(ipayAccount==""){
		    			utils.alert("您还未注册汇付天下");
		    			return;
		    		}
			    	//生利宝转出初始化数据查询
		    		var startDate = $('#startDate').val();
		    		var endDate = $('#endDate').val();
		    		initSlbData(startDate,endDate,2);
		    		$(this).addClass('active').siblings('a').removeClass('active');
		    		$('.em-list').animate({'left':'110px'},500);
		    		$('.list-a').show();
		    		$('.list-c').hide();
		    	});
		    	$('.slb-sy').click(function(){
		    		if($(this).hasClass('active')){
		    			return;
		    		}
		    		if(ipayAccount==""){
		    			utils.alert("您还未注册汇付天下");
		    			return;
		    		}
		    		var startDate = $('#startDate').val();
		    		var endDate = $('#endDate').val();
		    		initSlbEarnData(startDate, endDate);
		    		$(this).addClass('active').siblings('a').removeClass('active');
		    		$('.em-list').animate({'left':'220px'},500);
		    		$('.list-a').hide();
		    		$('.list-c').show();
		    		
		    	});		    	
	    	});
	    	var options = {
	    			//Boolean - Whether we should show a stroke on each segment
	    			segmentShowStroke : true,
	    			//String - The colour of each segment stroke
	    			segmentStrokeColor : "#fff",
	    			//Number - The width of each segment stroke
	    			segmentStrokeWidth : 0,
	    			//The percentage of the chart that we cut out of the middle.
	    			percentageInnerCutout :100,
	    			//Boolean - Whether we should animate the chart	
	    			animation : true,
	    			//Number - Amount of animation steps
	    			animationSteps : 100,
	    			//String - Animation easing effect
	    			animationEasing : "easeOutBounce",
	    			//Boolean - Whether we animate the rotation of the Doughnut
	    			animateRotate : true,
	    			//Boolean - Whether we animate scaling the Doughnut from the centre
	    			animateScale : true,
	    			//Function - Will fire on animation completion.
	    			onAnimationComplete : function(){}
	    		};
	    	var param={uid:utils.Storage.getItem('uid')}; 
	    	utils.ajax({
	    		url:'front/queryHome.do',
	    		data:JSON.stringify(param),
	    		success:function(data){
	    			if(data.error=='0'){
	    				//用户名
	    				$('.name').text(data.username);
	    				//总资产
	    				var allTotal = parseFloat(data.usableSum) + parseFloat(data.freezeAmount) + parseFloat(data.forPaySum);
	    				allTotal = allTotal.toFixed(2);
	    				//可用金额data.usableSum
	    				$('#usableSum').text(data.usableSum.toFixed(2));
	    				//收益总额
	    				$('#earnSum').text(data.earnSum.toFixed(2));
	    				//总资产
	    				$('#allTotal').text(data.allTotal.toFixed(2));
	    				//投资总额
	    				var investSum = parseFloat(data.hasPayPrincipal)+parseFloat(data.forPayPrincipal);
	    				investSum = investSum.toFixed(2);
	    				$('#investSum').text(investSum);
	    				//冻结金额freezeAmount
	    				$('#freezeAmount').text(data.freezeAmount.toFixed(2));
	    				//待收总额
	    				$('#forPaySum').text(data.forPaySum.toFixed(2));
	    				//奖励金额
	    				$('#otherEarnAmount').text(data.otherEarnAmount==''?'0.00':data.otherEarnAmount);
	    				//代金券
	    				$('#voucher').text(data.voucher);
	    				//现金券
	    				$('#cashMap').text(data.cashMap);
	    				//抽奖次数
	    				$('#luckynum').text(data.times);
	    				$(".luckynum").hover(function(){
	    				    $(".luckyDetails").fadeToggle(300); 
	    				});
	    				// 未使用现金券，代金券数量
	    				if (data.count > 0) {
	    					$('#couponCount').text(data.count);
	    					$('#myCoupon').addClass('taste');
	    					$('#couponCount').addClass('couponStyle');
	    				} else {
	    					$('#myCoupon').removeClass('taste');
	    					$('#couponCount').removeClass('couponStyle');
	    				}
	    				//生成图表
	    				//var ctx = document.getElementById("myChart").getContext("2d");
	    				//安全等级
	    				if(data.flag=='1'){
	    					$('#safeLevel').text('低');
	    				}else if(data.flag=='2'){
	    					$('#safeLevel').text('中');
	    				}else{
	    					$('#safeLevel').text('高');
	    				};
	    				//是否注册汇付
	    				if(data.ipayAccount!='' && data.ipayAccount!=null){
	    					$('#registpay').html('<a href="javascript:;">登录汇付</a>').click(function(){
	    						utils.ajax({
	    							url:'front/loginHuiFu.do',
	    							data:{},
	    							success:function(data){
	    								if(data.error =='0'){
	    									var oHtml = data.huiFuhtml.replace('_blank','');
	    									$('#huifuHtml').empty().html(oHtml);
	    								}
	    							}
	    						});
	    					});
	    				}else{
	    					if (data.busiCode != "" && data.busiCode != null) {
	    						$('#registpay').html('<a href="javascript:;">查看企业账户申请状态</a>').click(function(){
		    						utils.ajax({
		    				    		url:'front/CorpRegisterQueryApp.do',
		    				    		data:JSON.stringify(param),	
		    				    		success:function(data){
		    				    			utils.alert(data.msg,function(){
		    				    				window.location.href='account.html';
		    				    			});
		    				    		}
		    						});
	    						});
	    						$('#reset').html('<a href="javascript:;">重填资料</a>').click(function(){
		    						utils.ajax({
		    				    		url:'front/regIpayEnterpriseAppInit.do',
		    				    		data:JSON.stringify(param),	
		    				    		success:function(data){
		    				    			if (data.error == 0) {
	    					    				window.location.href='singleRegist.html';
	    					    			} else {
	    					    				utils.alert(data.msg);
	    					    			}
		    				    		}
		    						});
	    						});
	    							/*$('#reset').html('<a href="javascript:;">重填资料</a>').click(function(){
		    							$('#single-submit').click(function(){
			    					    	utils.ajax({ // 查询用户是否已经绑定企业
			    					    		url:'front/regIpayEnterpriseAppInit.do',
			    					    		data:JSON.stringify(param),
			    					    		success:function(data){
			    					    			if (data.error == 0) {
			    					    				window.location.href='singleRegist.html';
			    					    			} else {
			    					    				utils.alert(data.msg);
			    					    			}
			    					    		}
			    					    	});
			    						})
	    							});*/
	    					} else {
		    					$('#registpay').html('<a href="javascript:;">注册汇付</a>').click(function(){
		    						utils.Dialog(true);
//		    						$('.regist-box').fadeIn();
//		    						$('.regist-box .close').click(function(){
//		    							$('.regist-box').hide();
//		    							utils.Dialog();
//		    						});
//		    						$('#person-submit').click(function(){
		    							window.location.href='registpay.html';
//		    						})
//		    						$('#single-submit').click(function(){
//		    							var param1={uid:utils.Storage.getItem('uid')}; 
//		    					    	utils.ajax({ // 查询用户是否已经绑定企业
//		    					    		url:'front/regIpayEnterpriseAppInit.do',
//		    					    		data:JSON.stringify(param),
//		    					    		success:function(data){
//		    					    			if (data.error == 0) {
//		    					    				window.location.href='singleRegist.html';
//		    					    			} else {
//		    					    				utils.alert(data.msg);
//		    					    			}
//		    					    		}
//		    					    	});
//		    						})
		    					});
	    					}
	    				}
	    		    	$('.account-content').show();
	    		    	//环形图开始  
	   		    	 $('#myChart').highcharts({
	   		    		 	chart: {
	   				            plotBackgroundColor: null,
	   				            plotBorderWidth: null,
	   				            plotShadow: false,
	   				        },
	   				        credits: {
	   							enabled: false   //右下角不显示LOGO
	   						},
	   						exporting: {
	   							enabled: false
	   						},
	   		    	        title: {
	   		    	            text: ''
	   		    	        },
	   		    	        colors:["#8d7ef2","#f8d280","#6dbfff","#fb9898","#86da70"],	   	  
	   		    	        plotOptions: {
	   			    	        pie: {
	   			    	        	shadow: false,
	   		 		                center: ['50%', '50%'],
	   				                allowPointSelect: true,
	   				                cursor: 'pointer',
	   				                dataLabels: {
	   				                    enabled: false
	   				                }
	   				            }
	   		    	        },
	   		    	        series: [{
	   		    	            type: 'pie',
	   		    	            name: '金额',
	   		    	            innerSize: '85%',
	   		    	            data: [
	   		    	            	['可用余额', Number(data.usableSum)],
	   		    	                ['投资总额', Number(investSum)],
	   		    	                ['冻结金额', Number(data.freezeAmount)],
	   		    	                ['待收总额', Number(data.forPaySum)],
	   		    	                ['奖励金额', Number(data.otherEarnAmount==''?'0':data.otherEarnAmount)]
	   		    	            ]
	   		    	        }],
	   		    	    });
	    			}else{
	    				utils.alert(data.msg);
	    			}
	    		}
	    	})
	    }
	});
}
// 转入转出
function slbaoTrading(){
	$.ajax({
		url: "front/slbaoTrading.do",
		type: "get",
		dataType: "json",
		contentType: contentType,
		success: function (data) {
			if(data.error == '0') {
				$("#huifuHtml").html(data.html);
			} else {
				utils.alert(data.msg);
			}
		}
	});
}

//生利宝转入、转出记录
function initSlbData(startDate,endDate,type){
	//数据初始化
	var payData = [
	       	     {
	       	    	 key:'recordTime',resolve:function(val,record){
	       	    		return val;
	       	    	 }
	       	     },
	       	     {
	       	    	 key:'handleSum',resolve:function(val){
	       	    		 return '<span class="black">'+utils.formatCurrency(val)+'</span>';
	       	    	 }
	       	     },
	       	     {
	       	    	 key:'usableSum',resolve:function(val){
	       	    		 return '<span class="black">'+utils.formatCurrency(val)+'</span>';
	       	    	 }
	       	     },
	       	     {
	       	    	 key:'paynumber',resolve:function(val){
	       	    		 return val;
	       	    	 }
	       	     },
	       	     {
	       	    	 key:'remarks',resolve:function(val){
	       	    		 return val;
	       	    	 }
	       	     }
     	];
	var startDate = startDate||'';
	var endDate = endDate||'';
	var param={
			startTime:startDate,
			endTime:endDate,
			type:type
	};
	oPage = null;
	oPage = new Page('front/querySlbRollOutRecord.do',param,$('.listData'),$('.paging'),payData,function(){
	});	
}

//生利宝收益记录
function initSlbEarnData(startDate,endDate){
	//数据初始化
	var payData = [
	       	     {
	       	    	 key:'recordTime',resolve:function(val,record){
	       	    		return val;
	       	    	 }
	       	     },
	       	     {
	       	    	 key:'income',resolve:function(val){
	       	    		 return '<span class="black">'+utils.formatCurrency(val)+'</span>';
	       	    	 }
	       	     },
	       	  {
	       	    	 key:'usableSum',resolve:function(val){
	       	    		 return '<span class="black">'+utils.formatCurrency(val)+'</span>';
	       	    	 }
	       	     },
	       	     {
	       	    	 key:'remarks',resolve:function(val){
	       	    		 return val;
	       	    	 }
	       	     }
   	];
	var startDate = startDate||'';
	var endDate = endDate||'';
	var param={
			startTime:startDate,
			endTime:endDate
	};
	oPage = null;
	oPage = new Page('front/queryEarnRecord.do',param,$('.listData'),$('.paging'),payData,function(){
	});	
}

//充值初始化
//充值
function initIpay(){
	//充值页面
	$.ajax({
	    url: 'ipay.html',
	    type: "get",
	    dataType: "html",
	    contentType:contentType,
	    success: function (data) {
	    	$('.account-right').empty();
	    	$('.account-right').html(data);
	    	//查询汇付信息
	    	utils.ajax({
    			url:'front/findIpayAccountByUserId.do',
    			data:{},
    			success:function(data){
    				if(data.user==null){
    					utils.alert('您还未注册汇付天下，请先注册汇付天下！',function(){
    						window.location.href='registpay.html';
    					});
    				}
    			}
    		})
	    	//充值
	    	$('.show-ipay').click(function(){
	    		if($(this).hasClass('active')){
	    			return;
	    		}
	    		$(this).addClass('active').siblings('a').removeClass('active');
	    		$('.em-line').animate({'left':'0'},500);
	    		$('.ipay-pay').show();
	    		$('.ipay-list').hide();
	    	});
	    	
	    	//充值
    		$('#ipay-submit').click(function(){
    			
    			var money = $('#ipay-amt').val();
    			if(money == ''){
    				utils.toast('请输入充值金额');return;
    			}
    			if(utils.isMoney(money)){
    				utils.toast('金额格式不正确');return;
    			}
				utils.ajax({
			        url:'front/findIpayAccountByUserId.do',
			        data:{},
			        dataType:'json',
			        success: function(data){
			        	if(data.error==0){
			        		if(data.user.ipayAccount == ''){
			        			utils.confirm('您还未注册汇付，请先注册汇付',function(){
			        				window.location.href="registpay.html";
			        			})
			        		}else{
			        			//充值
			        			var param={money:money}; 
			    				utils.ajax({
			    			        url:'front/ipayPayment.do',
			    			        data:JSON.stringify(param),
			    			        dataType:'json',
			    			        success: function(data){
			    			        	if(data.error==0){
			    			        		$('#alipay').empty().html(data.html);
			    			        	}else{
			    			        		utils.alert(data.msg);
			    			        	}	
			    			        }
			    			    });
			        		}
			        	}else{
			        		utils.alert(data.msg);
			        	}	
			        }
			    })
    		})
	    	//充值记录
	    	$('.show-ipay-list').click(function(){
	    		if($(this).hasClass('active')){
	    			return;
	    		}
	    		$(this).addClass('active').siblings('a').removeClass('active');
	    		$('.em-line').animate({'left':'120px'},500);
	    		$('.ipay-pay').hide();
	    		$('.ipay-list').show();
	    		
	    		$('#startDate').datepicker({format:'yyyy-mm-dd'}).on('changeDate',function(){});
		    	$('#endDate').datepicker({format:'yyyy-mm-dd'}).on('changeDate',function(){});
		    	if($('.listData li').size() == 0){
		    		//初始化数据查询
			    	initIpayData();
		    	}
		    	//搜索
		    	$('#ipaySearch').unbind('click').click(function(){
		    		var startDate = $('#startDate').val();
		    		var endDate = $('#endDate').val();
		    		if(startDate == ''){
		    			utils.toast('开始时间不能为空');
		    			return;
		    		}
		    		if(endDate == ''){
		    			utils.toast('结束时间不能为空');
		    			return;
		    		}
		    		if(startDate>endDate){
		    			utils.toast('开始时间不能大于结束时间');
		    			return;
		    		}
		    		initIpayData(startDate,endDate);
		    	});
	    	});
	    }
	});
};
//充值记录初始化
function initIpayData(startDate,endDate){
	//数据初始化
	var payData = [
	       	     {
	       	    	 key:'',resolve:function(val,record){
	       	    		 return utils.Storage.getItem('username');
	       	    	 }
	       	     },
	       	     {
	       	    	 key:'rechargeMoney',resolve:function(val){
	       	    		 return '<span class="black">'+utils.formatCurrency(val)+'</span>';
	       	    	 }
	       	     },
	       	     {
	       	    	 key:'investTime',resolve:function(val){
	       	    		 return '汇付充值';
	       	    	 }
	       	     },
	       	     {
	       	    	 key:'rechargeTime',resolve:function(val){
	       	    		 return val;
	       	    	 }
	       	     },
	       	     {
	       	    	 key:'result',resolve:function(val){
	       	    		var str ='';
	       	    		 if(val == '1'){
	       	    			str = '<p><span class="icon icon-true">成功</span></p>';
	       	    		 }else{
	       	    			str = '<p><span class="icon icon-wrong">失败</span></p>';
	       	    		 }
	       	    		 return str;
	       	    	 }
	       	     }
       	];
	var startDate = startDate||'';
	var endDate = endDate||'';
	var param={
			startTime:startDate,
			endTime:endDate
	};
	oPage = null;
	oPage = new Page('front/rechargeList.do',param,$('.listData'),$('.paging'),payData,function(){
		$('#invest').show();
	});
	
}
//提现
//提现初始化
//提现
function initCash(){
	//提现页面
	$.ajax({
	    url: 'cash.html',
	    type: "get",
	    dataType: "html",
	    contentType:contentType,
	    success: function (data) {
	    	$('.account-right').empty();
	    	$('.account-right').html(data);
	    	$('.account-content').hide();
	    	//充值
	    	$('.show-cash').click(function(){
	    		if($(this).hasClass('active')){
	    			return;
	    		}
	    		$(this).addClass('active').siblings('a').removeClass('active');
	    		$('.em-line').animate({'left':'0'},500);
	    		$('.cash-pay').show();
	    		$('.cash-list').hide();
	    	});
	    	var param={uid:utils.Storage.getItem('uid')}; 
			utils.ajax({
		        url:'front/queryWithdraw.do',
		        data:JSON.stringify(param),
		        dataType:'json',
		        success: function(data){
		        	if(data.error == '0'){
		        		$('#cash-realName').text(data.realName);
		        		$('#cash-usableSum').text(data.usableSum.toFixed(2)+"元");
		        		if(data.bankList.length>0){
			        		for(var i=0;i<data.bankList.length;i++){
			        			$('<li data-name="'+data.bankList[i].bankName+'" data-bankno="'+data.bankList[i].cardNo+'"><a href="javascript:;">'+data.bankList[i].bankName+'&nbsp;&nbsp;|&nbsp;&nbsp;'+utils.encodeBank(data.bankList[i].cardNo)+'</a></li>')
			        			.click(function(){
			        				var bankno = $(this).attr('data-bankno');//jquery bug
			        				var bankname = $(this).data('name');
			        				$('#select-bank')
			        				.val(bankname+'  |  '+utils.encodeBank(bankno))
			        				.data('bankno',bankno);
			        				$('.select-box').slideUp(200);
			        			})
			        			.appendTo($('.select-box'));
			        		};
			        		var withdrawPhone=data.bindingPhone;
			        		$('#withdrawPhone').text(withdrawPhone.substr(0, 3) + '****' + withdrawPhone.substr(7));
			        		//默认值
			        		$("#select-bank").val(data.bankList[0].bankName+'  |  '+utils.encodeBank(data.bankList[0].cardNo))
			        		.data('bankno',data.bankList[0].cardNo)
			        		.click(function(){
			        			$('.select-box').slideToggle(200);
			        		});
			        		//计算手续费
			        		$('#cashInput').blur(function(){
			        			var value = $(this).val();
			        			if(utils.isMoney(value)){
			        				utils.toast('金额格式不正确');
			        				$('#cash-submit').addClass('disabled').unbind('click');
			        				return;
			        			}else if(value<100){
			        				utils.toast('提现金额不能小于100');return;
			        			}else{
			        				$('#cash-submit').removeClass('disabled').unbind('click').bind('click',function(){
			        					cashSubmit();
			        				});
			        			}
			        			var param = {
			        					dealMoney:value
			        			};
			        			//计算手续费
			        			utils.ajax({
			        				url:'front/withdrawFee.do',
			        				data:JSON.stringify(param),
			        				dataType:'json',
			        				success:function(data){
			        					if(data.code == 1){ 
			        		    			//无手续费
			        		    	  		$("#serviceFee").html("0.00"); 
			        		    	  	}else if(data.code == 3){ 
			        		    	  		//服务费金额
			        		    	  		$('#refreew').text("0.00")
			        		    	  	}else { 
			        		    	  		//服务费金额
			        		    	  		$('#refreew').text(data.msg)
			        			     	}
			        				}
			        			})
			        			
			        		});
			        		//获取验证码
			        		$('#getMsgCode').click(function(){
			        			var phone= data.bindingPhone;
			        			if(phone==''){
			        				utils.toast('请输入手机号');
			        				return;
			        			};
			        			utils.getSmsCode($(this),phone,'withdraw');
			        		});
			        		$('.account-content').show();
		        		}else{
		        			utils.alert('您还未绑定银行，请先绑定银行卡',function(){
		        				location.hash = '#bank';
		        			});
		        		}
		        	}else if(data.error=='-1'){
		        		utils.alert('您还未注册汇付天下，请先注册汇付天下！',function(){
    						window.location.href='registpay.html';
    					});
		        	}else if(data.error=='4'){
		        		utils.alert('您还未绑定银行，请先绑定银行卡',function(){
	        				location.hash = '#bank';
	        			});
		        	}else{
		        		utils.alert(data.msg);
		        	}
		        }
		    });
	    	//提现记录
	    	$('.show-cash-list').click(function(){
	    		if($(this).hasClass('active')){
	    			return;
	    		}
	    		$(this).addClass('active').siblings('a').removeClass('active');
	    		$('.em-line').animate({'left':'120px'},500);
	    		$('.cash-pay').hide();
	    		$('.cash-list').show();
	    		$('#startDate').datepicker({format:'yyyy-mm-dd'}).on('changeDate',function(){});
		    	$('#endDate').datepicker({format:'yyyy-mm-dd'}).on('changeDate',function(){});
		    	if($('.listData li').size() == 0){
		    		//初始化数据查询
		    		initcashData();
		    	};
		    	//搜索
		    	$('#cashSearch').unbind('click').click(function(){
		    		var startDate = $('#startDate').val();
		    		var endDate = $('#endDate').val();
		    		if(startDate == ''){
		    			utils.toast('开始时间不能为空');
		    			return;
		    		}
		    		if(endDate == ''){
		    			utils.toast('结束时间不能为空');
		    			return;
		    		}
		    		if(startDate>endDate){
		    			utils.toast('开始时间不能大于结束时间');
		    			return;
		    		}
		    		initcashData(startDate,endDate);
		    	});
	    	});
	    }
	});
}
//提现
function cashSubmit(){
	var amt = $('#cashInput').val();
//	var password = $('#cash-password').val();
	var smsCode = $('#cash-smsCode').val();
	var recivePhone = $('#getMsgCode').data('recivePhone');
	var randomCode = $('#getMsgCode').data('randomCode');
	var bankNo = $('#select-bank').data('bankno');
	if(amt == ''){
		utils.toast('金额不能为空');return;
	}
//	if(password == ''){
//		utils.toast('交易密码不能为空');return;
//	}
	if(smsCode == ''){
		utils.toast('请填写短信验证码');return;
	}
	if(utils.isMoney(amt)){
		utils.toast('金额格式不正确');return;
	}
//	if(amt<100){
//		utils.toast('提现金额不能小于100');return;
//	}
	if(!recivePhone){
		utils.toast('请获取短信验证码');return;
	}
//	var param={"auth":"{uid:'1hYMPUoJKl8='}","info":"{dealpwd:'"+password+"',code:'"+smsCode+"',randomCode:'"+randomCode+"',recivePhone:'"+recivePhone+"',money:'"+amt+"',bankId:'"+bankNo+"'}"}; 
	var param={code:smsCode,money:amt,bankId:bankNo,codeType:'withdraw'};
	utils.ajax({
        url:'front/addWithdraw.do',
        data:JSON.stringify(param),
        dataType:'json',
        success: function(data){
        	if(data.error =='0'){
        		$('#returnHtml').html(data.html.replace('target="_blank"',''));
        	}else{
        		utils.alert(data.msg);
        	}
        }
    })
}
function initcashData(startDate,endDate){
	//数据初始化
	var cashData = [
	       	     {
	       	    	 key:'',resolve:function(val,record){
	       	    		 return utils.Storage.getItem('username');
	       	    	 }
	       	     },
	       	     {
	       	    	 key:'sum',resolve:function(val){
	       	    		 return '<span class="black">'+utils.formatCurrency(val)+'元</span>';
	       	    	 }
	       	     },
	       	     {
	       	    	 key:'bankId',resolve:function(val){
	       	    		 return val;
	       	    	 }
	       	     },
	       	     {
	       	    	 key:'poundage',resolve:function(val){
	       	    		 return '<span class="black">'+utils.formatCurrency(val)+'元</span>';
	       	    	 }
	       	     },
	       	     {
	       	    	 key:'applyTime',resolve:function(val){
	       	    		 return val;
	       	    	 }
	       	     },
	       	     {
	       	    	 key:'status',resolve:function(val){
	       	    		var str ='';
	       	    		 if(val == '2'){
	       	    			str = '<p><span class="icon icon-true">已提现</span></p>';
	       	    		 }else if(val=='1'){
	       	    			str = '<p><span class="icon icon-danger">审核中</span></p>';
	       	    		 }else if(val=='3'){
	       	    			str = '<p><span class="icon icon-wrong">取消</span></p>';
	       	    		 }else if(val=='4'){
	       	    			str = '<p><span class="icon icon-danger">转账中</span></p>';
	       	    		 }else if(val=='5'){
	       	    			str = '<p><span class="icon icon-wrong">失败</span></p>';
	       	    		 }
	       	    		 return str;
	       	    	 }
	       	     },
	       	     {
	       	    	 key:'status',resolve:function(val,record){
	       	    		var str ='';
	       	    		 if(val == '2'){
	       	    			str = '<p><span class="black">--</span></p>';
	       	    		 }else if(val=='1'){
	       	    			str = $('<a href="javascript:void(0);" onclick="deleteWithdraw('+record.id+','+record.sum+')">取消</a>');
	       	    		 }else if(val=='3'){
	       	    			str = '<p><span class="black">--</span></p>';
	       	    		 }else if(val=='4'){
	       	    			str = '<p><span class="black">--</span></p>';
	       	    		 }else if(val=='5'){
	       	    			str = '<p><span class="black">--</span></p>';
	       	    		 }
	       	    		 return str;
	       	    	 }
	       	     }
       	];
	var startDate = startDate||'';
	var endDate = endDate||'';
	var param={
			startTime:startDate,
			endTime:endDate
	};
	var payPage = new Page('front/withdrawList.do',param,$('.listData'),$('.paging'),cashData,function(){});
}

//取消提现
function deleteWithdraw(id,sum){
    if(!window.confirm("确定要取消提现记录")){
	     return;
	}
	var param={wId:id};
	utils.ajax({
        url:'front/deleteWithdraw.do',
        data:JSON.stringify(param),
        dataType:'json',
        success: function(data){
        	if(data.error =='0'){
        		utils.alert("取消成功");
                //初始化数据查询
        		initcashData();
        	}else{
        		utils.alert(data.msg);
        	}
        }
    });
}

//我的赠券
function initTaste(){
	$.ajax({
	    url: 'taste.html',
	    type: "get",
	    dataType: "html",
	    contentType:contentType,
	    success: function (data) {
	    	$('.account-right').html(data);
//	    	$('.account-content').hide();	   
			//代金券按钮
	    	dtasteData();
			$('#dLink').click(function(){
				if($(this).hasClass('active')){
					return;
				};
				$(this).addClass('active').siblings('a').removeClass('active');
	    		$('.em-line').animate({'left':'0'},500);
	    		dtasteData();
			});	  
   			//加息券按钮
			$('#jLink').click(function(){
				if($(this).hasClass('active')){
					return;
				};
				$(this).addClass('active').siblings('a').removeClass('active');
	    		$('.em-line').animate({'left':'120px'},500);
	    		jtasteData();
			});
			//现金券按钮
			$('#xLink').click(function(){
				if($(this).hasClass('active')){
					return;
				};
				$(this).addClass('active').siblings('a').removeClass('active');
	    		$('.em-line').animate({'left':'240px'},500);
	    		xtasteData();
			});
			
			var params={
					couponType: 1 ,//代金券， 3 加息券， 2 现金券
				 	useType: 1,// 未使用， 2已使用， 3已过期
				 	curPage: 1//当前页
			}
			utils.ajax({
		        url:'front/queryCoupon.do',
		        data:JSON.stringify(params),
		        dataType:'json',
		        success: function(data){
		        	if(data.error == 0){
		        		// 顶部消息未使用券的数量 couponStyle
		        		if (data.dCount > 0) {
		        			$("#dCount").addClass('couponStyle');
		        			$("#dCount").text(data.dCount);
		        		} else {
		        			$("#dCount").removeClass('couponStyle');
		        		}
		        		if (data.jCount > 0) {		
		        			$("#jCount").addClass('couponStyle');
		        			$("#jCount").text(data.jCount);
		        		} else {
		        			$("#jCount").removeClass('couponStyle');
		        		}
		        		if (data.xCount > 0) {
		        			$("#xCount").addClass('couponStyle');
		        			$("#xCount").text(data.xCount);
		        		} else {
		        			$("#xCount").removeClass('couponStyle');
		        		}
		    			//体验金按钮
		        		var tBox = $('#ttaste');
		    			$('#tLink').click(function(){
		    				if($(this).hasClass('active')){
		    					return;
		    				};
		    				$(this).addClass('active').siblings('a').removeClass('active');
		    				$('.em-line').animate({'left':'360px'},500);
		    				ttasteData(data);
		    			});
	    				tBox.find('.sub-nav a').click(function(){
		    				if($(this).hasClass('active')){
		    					return;
		    				}
		    				var index = $(this).index();
							$(this).addClass('active').siblings('a').removeClass('active');
							tBox.children('ul').eq(index).show().siblings('ul').hide();
		    			});	
		        	}else{
		        		utils.alert(data.msg);
			        }
		        }
			})
	    }			
	})
}	
//代金券
function dtasteData(){
	$('#xtaste').hide();$('#ttaste').hide();$('#jtaste').hide();$('#dtaste').show();	
	var dtasteData1 =[
	                     {
	 	                	key:'id',resolve:function(val,record){
	 	                		var msg1='',msg2='',msg3="";	
	        					if(record.borrowFlag==1){
	        						msg3='所有';
	        					}else if(record.borrowFlag==2){
	        						msg3='新手';
	        					}else if(record.borrowFlag==3){
	        						msg3='仅老';
	        					}
	
	        					if(record.deadline==0){
	        						msg1="单笔投资满";
	        						msg2='不可投新手标项目';
	        					}else{
	        						msg1="[新人红包]单笔投资满";
	        						msg2='仅限'+record.deadline+'个月及以上的'+msg3+'标可用';
	        					}
	 	                		var dtastHtml = '<div class="bg-nouse"><div class="taste-bg-l">'+
	 	                						'<p class="money">¥<span>'+utils.formatCurrency(record.money)+'</span></p>'+
	 	                						'<p class="date">满<span>'+record.investAmount+'</span>元抵用</p>'+
	 	                						'</div>'+
	 	                						'<div class="text">'+
	 	                						'<p>'+msg1+record.investAmount+'元使用</p>'+
	 	                						'<p>'+msg2+'</p>'+
	 	                						'<p>有效期至'+record.useendtime+'</p>'+
	 	                						'</div>'+
	 	                						'<div class="taste-bg-r">'+
	 	                						'<a href="investlist.html" class="taste-btn">立即使用</a>'+
	 	                						'</div></div>'	        
	 	                		return dtastHtml;
	 	                	}
	 	                  }
	 	                ]  
	var dtasteData2 =[
	                     {
	 	                	key:'id',resolve:function(val,record){
	 	                		var msg1='',msg2='',msg3="";
	        					if(record.borrowFlag==1){
	        						msg3='所有';
	        					}else if(record.borrowFlag==2){
	        						msg3='新手';
	        					}else if(record.borrowFlag==3){
	        						msg3='仅老';
	        					}
	
	        					if(record.deadline==0){
	        						msg1="单笔投资满";
	        						msg2='不可投新手标项目';
	        					}else{
	        						msg1="[新人红包]单笔投资满";
	        						msg2='仅限'+record.deadline+'个月及以上的'+msg3+'标可用';
	        					}
	 	                		var dtastHtml = '<div class="bg-use"><div class="taste-bg-l">'+
	 	                						'<p class="money">¥<span>'+utils.formatCurrency(record.money)+'</span></p>'+
	 	                						'<p class="date">满<span>'+record.investAmount+'</span>元抵用</p>'+
	 	                						'</div>'+
	 	                						'<div class="text">'+
	 	                						'<p>'+msg1+record.investAmount+'元使用</p>'+
	 	                						'<p>'+msg2+'</p>'+
	 	                						'<p>使用时间:'+record.usetime+'</p>'+
	 	                						'</div>'+
	 	                						'<div class="taste-bg-r">'+
	 	                						'<a href="investlist.html" class="taste-btn"></a>'+
	 	                						'</div></div>'	        
	 	                		return dtastHtml;
	 	                	}
	 	                  }
	 	                ]  
	var dtasteData3 =[
	                     {
	 	                	key:'id',resolve:function(val,record){
	 	                		var msg1='',msg2='',msg3="";	 	                	
	        					if(record.borrowFlag==1){
	        						msg3='所有';
	        					}else if(record.borrowFlag==2){
	        						msg3='新手';
	        					}else if(record.borrowFlag==3){
	        						msg3='仅老';
	        					}
	
	        					if(record.deadline==0){
	        						msg1="单笔投资满";
	        						msg2='不可投新手标项目';
	        					}else{
	        						msg1="[新人红包]单笔投资满";
	        						msg2='仅限'+record.deadline+'个月及以上的'+msg3+'标可用';
	        					}
	 	                		var dtastHtml = '<div class="bg-date"><div class="taste-bg-l">'+
	 	                						'<p class="money">¥<span>'+utils.formatCurrency(record.money)+'</span></p>'+
	 	                						'<p class="date">满<span>'+record.investAmount+'</span>元抵用</p>'+
	 	                						'</div>'+
	 	                						'<div class="text">'+
	 	                						'<p>'+msg1+record.investAmount+'元使用</p>'+
	 	                						'<p>'+msg2+'</p>'+
	 	                						'<p>有效期至'+record.useendtime+'</p>'+
	 	                						'</div>'+
	 	                						'<div class="taste-bg-r">'+
	 	                						'<a href="investlist.html" class="taste-btn"></a>'+
	 	                						'</div></div>'	        
	 	                		return dtastHtml;
	 	                	}
	 	                  }
	 	                ]  
	var params = {
			couponType:"" ,//代金券， 3 加息券， 2 现金券
		 	useType: "",// 未使用， 2已使用， 3已过期
	};
	var dtastePage = new Page('front/queryCoupon.do',params,$('.dtaste-listData1 .nouse'),$('.dtaste-listData1 .paging'),dtasteData1,function(){});	
	$('#Dunused').unbind('click').click(function(){
		if($(this).hasClass('active')){
			return;
		}
		$(this).addClass('active').siblings('a').removeClass('active');
		var params = {
				couponType: 1 ,//代金券， 3 加息券， 2 现金券
			 	useType: 1,// 未使用， 2已使用， 3已过期
    	};
		$('.dtaste-listData1').show().siblings('div.dtaste-listData').hide();
		
		dtastePage = new Page('front/queryCoupon.do',params,$('.dtaste-listData1 .nouse'),$('.dtaste-listData1 .paging'),dtasteData1,function(){});
	});
	$('#Dused').unbind('click').click(function(){
		if($(this).hasClass('active')){
			return;
		}
		$(this).addClass('active').siblings('a').removeClass('active');
		var params = {
				couponType: 1 ,//代金券， 3 加息券， 2 现金券
			 	useType: 2,// 未使用， 2已使用， 3已过期
    	};
		$('.dtaste-listData2').show().siblings('div.dtaste-listData').hide();
		
		dtastePage = new Page('front/queryCoupon.do',params,$('.dtaste-listData2 .use'),$('.dtaste-listData2 .paging'),dtasteData2,function(){});
	});
	$('#Dexpired').unbind('click').click(function(){
		if($(this).hasClass('active')){
			return;
		}
		$(this).addClass('active').siblings('a').removeClass('active');
		var params = {
				couponType: 1 ,//代金券， 3 加息券， 2 现金券
			 	useType: 3,// 未使用， 2已使用， 3已过期
    	};
		$('.dtaste-listData3').show().siblings('div.dtaste-listData').hide();
		
		dtastePage = new Page('front/queryCoupon.do',params,$('.dtaste-listData3 .overdue'),$('.dtaste-listData3 .paging'),dtasteData3,function(){});
	});

}
//加息券
function jtasteData(){
	$('#jtaste').show();$('#dtaste').hide();$('#xtaste').hide();$('#ttaste').hide();
	var jtasteData1 =[
	                     {
	 	                	key:'id',resolve:function(val,record){
	 	                		var msg1='',msg2='',msg3="";	
	        					if(record.borrowFlag==1){
	        						msg3='所有';
	        					}else if(record.borrowFlag==2){
	        						msg3='新手';
	        					}else if(record.borrowFlag==3){
	        						msg3='仅老';
	        					}
	
	        					if(record.deadline==0){
	        						msg1="单笔投资满";
	        						msg2='不可投新手标项目';
	        					}else{
	        						msg1="[新人红包]单笔投资满";
	        						msg2='仅限'+record.deadline+'个月及以上的'+msg3+'标可用';
	        					}
	 	                		var jtastHtml = '<div class="bg-nouse"><div class="taste-bg-l">'+
	 	                						'<p class="money"><span>'+record.money+'</span>%</p>'+
	 	                						'<p class="date">满<span>'+record.investAmount+'</span>元抵用</p>'+
	 	                						'</div>'+
	 	                						'<div class="text">'+
	 	                						'<p>'+msg1+record.investAmount+'元使用</p>'+
	 	                						'<p>'+msg2+'</p>'+
	 	                						'<p>有效期至'+record.useendtime+'</p>'+
	 	                						'</div>'+
	 	                						'<div class="taste-bg-r">'+
	 	                						'<a href="investlist.html" class="taste-btn">立即使用</a>'+
	 	                						'</div></div>'	        
	 	                		return jtastHtml;
	 	                	}
	 	                  }
	 	                ]  
	var jtasteData2 =[
	                     {
	 	                	key:'id',resolve:function(val,record){
	 	                		var msg1='',msg2='',msg3="";
	        					if(record.borrowFlag==1){
	        						msg3='所有';
	        					}else if(record.borrowFlag==2){
	        						msg3='新手';
	        					}else if(record.borrowFlag==3){
	        						msg3='仅老';
	        					}
	
	        					if(record.deadline==0){
	        						msg1="单笔投资满";
	        						msg2='不可投新手标项目';
	        					}else{
	        						msg1="[新人红包]单笔投资满";
	        						msg2='仅限'+record.deadline+'个月及以上的'+msg3+'标可用';
	        					}
	 	                		var jtastHtml = '<div class="bg-use"><div class="taste-bg-l">'+
	 	                						'<p class="money"><span>'+record.money+'</span>%</p>'+
	 	                						'<p class="date">满<span>'+record.investAmount+'</span>元抵用</p>'+
	 	                						'</div>'+
	 	                						'<div class="text">'+
	 	                						'<p>'+msg1+record.investAmount+'元使用</p>'+
	 	                						'<p>'+msg2+'</p>'+
	 	                						'<p>使用时间:'+record.usetime+'</p>'+
	 	                						'</div>'+
	 	                						'<div class="taste-bg-r">'+
	 	                						'<a href="investlist.html" class="taste-btn"></a>'+
	 	                						'</div></div>'	        
	 	                		return jtastHtml;
	 	                	}
	 	                  }
	 	                ]  
	var jtasteData3 =[
	                     {
	 	                	key:'id',resolve:function(val,record){
	 	                		var msg1='',msg2='',msg3="";	 	                	
	        					if(record.borrowFlag==1){
	        						msg3='所有';
	        					}else if(record.borrowFlag==2){
	        						msg3='新手';
	        					}else if(record.borrowFlag==3){
	        						msg3='仅老';
	        					}
	
	        					if(record.deadline==0){
	        						msg1="单笔投资满";
	        						msg2='不可投新手标项目';
	        					}else{
	        						msg1="[新人红包]单笔投资满";
	        						msg2='仅限'+record.deadline+'个月及以上的'+msg3+'标可用';
	        					}
	 	                		var jtastHtml = '<div class="bg-date"><div class="taste-bg-l">'+
	 	                						'<p class="money"><span>'+record.money+'</span>%</p>'+
	 	                						'<p class="date">满<span>'+record.investAmount+'</span>元抵用</p>'+
	 	                						'</div>'+
	 	                						'<div class="text">'+
	 	                						'<p>'+msg1+record.investAmount+'元使用</p>'+
	 	                						'<p>'+msg2+'</p>'+
	 	                						'<p>有效期至'+record.useendtime+'</p>'+
	 	                						'</div>'+
	 	                						'<div class="taste-bg-r">'+
	 	                						'<a href="investlist.html" class="taste-btn"></a>'+
	 	                						'</div></div>'	        
	 	                		return jtastHtml;
	 	                	}
	 	                  }
	 	                ]  
	var params = {
			couponType:"3" ,//代金券， 3 加息券， 2 现金券
		 	useType: "1",// 未使用， 2已使用， 3已过期
	};
	var JtastePage = new Page('front/queryCoupon.do',params,$('.jtaste-listData1 .nouse'),$('.jtaste-listData1 .paging'),jtasteData1,function(){});	
	$('#Junused').unbind('click').click(function(){
		if($(this).hasClass('active')){
			return;
		}
		$(this).addClass('active').siblings('a').removeClass('active');
		var params = {
				couponType: 3 ,//代金券， 3 加息券， 2 现金券
			 	useType: 1,// 未使用， 2已使用， 3已过期
			};
		$('.jtaste-listData1').show().siblings('div.jtaste-listData').hide();
		
		JtastePage = new Page('front/queryCoupon.do',params,$('.jtaste-listData1 .nouse'),$('.jtaste-listData1 .paging'),jtasteData1,function(){});
	});
	$('#Jused').unbind('click').click(function(){
		if($(this).hasClass('active')){
			return;
		}
		$(this).addClass('active').siblings('a').removeClass('active');
		var params = {
				couponType: 3 ,//代金券， 3 加息券， 2 现金券
			 	useType: 2,// 未使用， 2已使用， 3已过期
			};
		$('.jtaste-listData2').show().siblings('div.jtaste-listData').hide();
		
		JtastePage = new Page('front/queryCoupon.do',params,$('.jtaste-listData2 .use'),$('.jtaste-listData2 .paging'),jtasteData2,function(){});
	});
	$('#Jexpired').unbind('click').click(function(){
		if($(this).hasClass('active')){
			return;
		}
		$(this).addClass('active').siblings('a').removeClass('active');
		var params = {
				couponType:3 ,//代金券， 3 加息券， 2 现金券
			 	useType: 3,// 未使用， 2已使用， 3已过期
		};
		$('.jtaste-listData3').show().siblings('div.jtaste-listData').hide();
		
		JtastePage = new Page('front/queryCoupon.do',params,$('.jtaste-listData3 .overdue'),$('.jtaste-listData3 .paging'),jtasteData3,function(){});
	});	
}
//现金券
function xtasteData(){
	var canSend;
	$('#dtaste').hide();$('#jtaste').hide();$('#xtaste').show();$('#ttaste').hide();
	var xtasteData1 =[
	                     {
	 	                	key:'id',resolve:function(val,record){
	 	                		var xtastHtml = '<div class="xj-nouse">'+
												'<div class="taste-bg-l">'+
												'<p class="money">¥<span>'+utils.formatCurrency(record.money)+'</span></p>'+			     
												'</div>'+
												'<div class="text"><p class="date">有效期至'+record.useendtime+'</p></div>'+
												'<div class="taste-bg-r">'+
												'<button type="submit" onclick="useCard('+record.id+',this)" class="nouse-btn'+record.id+'">立即使用</button>'+
												'</div>'+		        
												'</div>'        
								return xtastHtml;
	 	                	}
	 	                  }
	 	                ]  
	var xtasteData2 =[
	                     {
	 	                	key:'id',resolve:function(val,record){
	 	                		var xtastHtml = '<div class="xj-use">'+
												'<div class="taste-bg-l">'+
												'<p class="money">¥<span>'+utils.formatCurrency(record.money)+'</span></p>'+			     
												'</div>'+
												'<div class="text"><p class="date">使用时间:'+record.usetime+'</p></div>'+
												'<div class="taste-bg-r">'+
												'<a href="javascript:;" class="taste-btn"></a>'+
												'</div>'+		        
												'</div>'        
								return xtastHtml;
	 	                	}
	 	                  }
	 	                ]  
	var xtasteData3 =[
	                     {
	 	                	key:'id',resolve:function(val,record){
	 	                		var xtastHtml = '<div class="xj-date">'+
	        									'<div class="taste-bg-l">'+
        										'<p class="money">¥<span>'+utils.formatCurrency(record.money)+'</span></p>'+			     
        										'</div>'+
        										'<div class="text"><p class="date">有效期至'+record.useendtime+'</p></div>'+
        										'<div class="taste-bg-r">'+
    											'<a href="javascript:;" class="taste-btn"></a>'+
    											'</div>'+		        
        										'</div>'        
	 	                		return xtastHtml;
	 	                	}
	 	                  }
	 	                ]  
	var params = {
			couponType:"2" ,//代金券， 3 加息券， 2 现金券
		 	useType: "1",// 未使用， 2已使用， 3已过期
	};
	var XtastePage = new Page('front/queryCoupon.do',params,$('.xtaste-listData1 .nouse'),$('.xtaste-listData1 .paging'),xtasteData1,function(){});	
	$('#Xunused').unbind('click').click(function(){
		if($(this).hasClass('active')){
			return;
		}
		$(this).addClass('active').siblings('a').removeClass('active');
		var params = {
				couponType: 2 ,//代金券， 3 加息券， 2 现金券
			 	useType: 1,// 未使用， 2已使用， 3已过期
			};
		$('.xtaste-listData1').show().siblings('div.xtaste-listData').hide();
		
		XtastePage = new Page('front/queryCoupon.do',params,$('.xtaste-listData1 .nouse'),$('.xtaste-listData1 .paging'),xtasteData1,function(){});
	});
	$('#Xused').unbind('click').click(function(){
		if($(this).hasClass('active')){
			return;
		}
		$(this).addClass('active').siblings('a').removeClass('active');
		var params = {
				couponType: 2 ,//代金券， 3 加息券， 2 现金券
			 	useType: 2,// 未使用， 2已使用， 3已过期
			};
		$('.xtaste-listData2').show().siblings('div.xtaste-listData').hide();
		
		XtastePage = new Page('front/queryCoupon.do',params,$('.xtaste-listData2 .use'),$('.xtaste-listData2 .paging'),xtasteData2,function(){});
	});
	$('#Xexpired').unbind('click').click(function(){
		if($(this).hasClass('active')){
			return;
		}
		$(this).addClass('active').siblings('a').removeClass('active');
		var params = {
				couponType:2 ,//代金券， 3 加息券， 2 现金券
			 	useType: 3,// 未使用， 2已使用， 3已过期
		};
		$('.xtaste-listData3').show().siblings('div.xtaste-listData').hide();
		
		XtastePage = new Page('front/queryCoupon.do',params,$('.xtaste-listData3 .overdue'),$('.xtaste-listData3 .paging'),xtasteData3,function(){});
	});	
}
//体验金
function ttasteData(data){
	$('#dtaste').hide();$('#jtaste').hide();$('#xtaste').hide();$('#ttaste').show();		
	var tBox = $('#ttaste');
	if (data.isUse == 0 && data.investAmount > 0) {
		var noLi =  $('<li class="xj-nouse">'+
					'<div class="taste-bg-l">'+
					'<p class="money">¥<span>'+data.investAmount+'</span></p>'+			     
					'</div>'+
					'<div class="text"><p class="date">有效期至:2017-11-07</p></div>'+
					'<div class="taste-bg-r">'+
					'<a href="javascript:;" onclick="investTYJ()" class="taste-btn">立即使用</a>'+
					'</div>'+		        
					'</li>');
		tBox.find('.nouse .none').remove();
		noLi.appendTo(tBox.find('.nouse'));
	} else if (data.isUse == 1 && data.investAmount > 0) {
		var useLi =  $('<li class="xj-use">'+
					'<div class="taste-bg-l">'+
					'<p class="money">¥<span>'+data.investAmount+'</span></p>'+			     
					'</div>'+
					'<div class="text"><p class="date">使用时间:2017-11-07</p></div>'+
					'<div class="taste-bg-r">'+
					'<a href="javascript:;"class="taste-btn"></a>'+
					'</div>'+		        
					'</li>');
			tBox.find('.use .none').remove();
			useLi.appendTo(tBox.find('.use'));
	}else if (data.isUse == 2 && data.investAmount > 0){
	   var useLi =  $('<li class="xj-date">'+
					'<div class="taste-bg-l">'+
					'<p class="money">¥<span>'+data.investAmount+'</span></p>'+			     
					'</div>'+
					'<div class="text"><p class="date">有效期至:2017-11-07</p></div>'+
					'<div class="taste-bg-r">'+
					'<a href="javascript:;" class="taste-btn"></a>'+
					'</div>'+		        
	   				'</li>');
	    	tBox.find('.overdue .none').remove();
			useLi.attr('class','xj-date').appendTo(tBox.find('.overdue'));
	}        	
}        		
function investTYJ() {
	window.location.href="invest.html?id=1";
}

//使用现金券
function useCard(id,_this){
	if(canSend = true){
		//$(_this).unbind();
		$(_this).attr("disabled","disabled");
		var param={uid:utils.Storage.getItem('uid'),id:id};
		utils.ajax({
	        url:'front/useXianJinQuan.do',
	        data:JSON.stringify(param),
	        dataType:'json',
	        success: function(data){	        	
	        	if(data.error == 0){      
	        		utils.alert('现金券领取成功!',function(){
	        			//$("#xtaste").load(location.href+"#xtaste"); 
	        			xtasteData();       			
	        		})	       
	        	}else{
	        		utils.alert(data.msg);
	        	}
	        }
	    });
	}else{
		return false;
	}	
}
//资金记录
function initFundRecord(){
	$.ajax({
	    url: 'fundrecord.html',
	    type: "get",
	    dataType: "html",
	    contentType:contentType,
	    success: function (data) {
	    	$('.account-right').html(data);
	    	var transType='';
	    	$('#startDate').datepicker({format:'yyyy-mm-dd'}).on('changeDate',function(){});
	    	$('#endDate').datepicker({format:'yyyy-mm-dd'}).on('changeDate',function(){});
	    	
	    	$('.fund-param-list li').click(function(){
	    		$(this).addClass('active').siblings('li').removeClass('active');
	    		transType = $(this).index();
	    	});
	    	initFundRecordData();
	    	//查询
	    	$('#fundSearch').unbind('click').click(function(){
	    		var startDate = $('#startDate').val();
	    		var endDate = $('#endDate').val();
	    		if(startDate == '' && endDate != ''){
	    			utils.toast('开始时间不能为空');
	    			return;
	    		}
	    		if(startDate != '' && endDate == ''){
	    			utils.toast('结束时间不能为空');
	    			return;
	    		}
	    		if((startDate != '' && endDate != '') && startDate>endDate){
	    			utils.toast('开始时间不能大于结束时间');
	    			return;
	    		}
	    		var param = {};
	    		param.startTime = startDate;
	    		param.endTime = endDate;
	    		param.momeyType = transType;
	    		initFundRecordData(param);
	    		
	    	})
	    }
	});
}
//资金记录初始化
function initFundRecordData(m){
	var param = {}; 
	if(m){
		param = m
	}else{
		param.startTime = '';
		param.endTime = '';
		param.momeyType = '';
	}
	var fundData = [
	                {
	                	key:'recordTime',resolve:function(val){
	                		return val;
	                	}
	                },
	                {
	                	key:'fundMode',resolve:function(val){
	                		return val;
	                	}
	                },
	                {
	                	key:'income',resolve:function(val,record){
	                		return inOrOut(val,record.spending);
	                	}
	                },
	                {
	                	key:'usableSum',resolve:function(val){
	                		return '<span class="black">'+utils.formatCurrency(val)+'元</span>';
	                	}
	                },
	                {
	                	key:'',resolve:function(val,record){
	                		var a = $('<a href="javascript:;" class="btn-link">查看详情</a>');
	                		a.bind('click',function(){
	                			utils.alert(strChina(record.remarks));
	                		});
	                		return a;
	                	}
	                }
	                
	                ]
	var fundPage = new Page('front/findFundrecordList.do',param,$('.listData'),$('.paging'),fundData,function(){});
	
}
//资金记录收入还是支出
function inOrOut(income,spending){
	if(income>0){
		return '+'+income.toFixed(2);
	}else if(income == 0 && spending==0){
		return income.toFixed(2);
	}else{
		return '-'+spending.toFixed(2);
	}
}
//匹配新闻中的中文字符
function strChina(str){
	return str.replace(/<[^>]+>/g,"");
}
//投资管理
function initInvestManage(){
	$.ajax({
	    url: 'investmanage.html',
	    type: "get",
	    dataType: "html",
	    contentType:contentType,
	    success: function (data) {
	    	$('.account-right').html(data);
	    	$('#invest-startDate').datepicker({format:'yyyy-mm-dd'}).on('changeDate',function(){});
	    	$('#invest-endDate').datepicker({format:'yyyy-mm-dd'}).on('changeDate',function(){});
	    	initInvestList();
	    	$('#invest-manage-Link').unbind('click').click(function(){
	    		if($(this).hasClass('active')){
	    			return;
	    		}
	    		$(this).addClass('active').siblings('a').removeClass('active');
	    		$('.em-line').animate({'left':'0'},500);
	    		initInvestList();
	    	});
	    	
	    	$('#invest-detail-Link').unbind('click').click(function(){
	    		if($(this).hasClass('active')){
	    			return;
	    		}
	    		$(this).addClass('active').siblings('a').removeClass('active');
	    		$('.em-line').animate({'left':'120px'},500);
	    		initInvestDetail();
	    	});
	    }
	});
}

//债权管理
function initClaimManage(){
	$.ajax({
	    url: 'claimmanage.html',
	    type: "get",
	    dataType: "html",
	    contentType:contentType,
	    success: function (data) {
	    	$('.account-right').html(data);
	    	initClaimmCan();
	    	$('.claimm a').click(function(){
	    		if($(this).hasClass('active')){
	    			return;
	    		}
	    		$(this).addClass('active').siblings('a').removeClass('active');
	    		var index = $(this).index();
	    		$('.em-line').animate({'left':index*120+'px'},500);
	    		switch(index){
	    			case 0 :initClaimmCan();break;
	    			case 1 :initClaimmIn();break;
	    			case 2 :initClaimmIs();break;
	    			case 3 :initClaimmFail();break;
	    		}
	    	});
	    	
	    	$('.zhaiQuanBtn').click(function(){
	    		var id = '24';
	    		utils.Dialog(true);
	    		$('.AgreeMent').fadeIn();
	    		$('.AgreeMent .close').click(function(){
	    			$('.AgreeMent').hide();
	    			utils.Dialog();
	    		});
	    		$('.AgreeMent .popup-area').empty();
	    		var param={TypeId:id}; 
	    		utils.ajax({
	    	        url:'front/querytips.do',
	    	        data:JSON.stringify(param),
	    	        dataType:'json',
	    	        success: function(data){
	    	        	if(data.error == '0'){
	    	        		$('.AgreeMent .popup-area').html(data.content);
	    	        	}
	    	        }
	    	    })
	    	});
	    	$('#shiLi').click(function(){
	    		var id = '33';
	    		utils.Dialog(true);
	    		$('.AgreeMent_shiLi').fadeIn();
	    		$('.AgreeMent_shiLi .close').click(function(){
	    			$('.AgreeMent_shiLi').hide();
	    			utils.Dialog();
	    		});
	    		$('.AgreeMent_shiLi .popup-area').empty();
	    		var param={TypeId:id}; 
	    		utils.ajax({
	    			url:'front/querytips.do',
	    			data:JSON.stringify(param),
	    			dataType:'json',
	    			success: function(data){
	    				if(data.error == '0'){
	    					$('.AgreeMent_shiLi .popup-area').html(data.content);
	    				}
	    			}
	    		})
	    	});
	    }
	});
}
//可转让
function initClaimmCan(){
	$('#claimm-can').show().siblings('div').hide();
	var ClaimmCanData = [
		                {
		                	key:'borrowTitle',resolve:function(val,record){
		                		var a =$('<a href="invest.html?id='+record.borrowId+'" title="'+val+'">'+strTitle(val)+'</a>');
		                		return a;
		                	}
		                },
		                {
		                	key:'remainBorrowLimit',resolve:function(val,record){
		                		return val+'/'+record.deadline;
		                	}
		                },
		                {
		                	key:'annualRate',resolve:function(val,record){
		                		return val+'%';
		                	}
		                },
		                {
		                	key:'recivedPrincipal',resolve:function(val,record){
		                		return '<span class="black">'+utils.formatCurrency(parseFloat(val)-parseFloat(record.hasPrincipal))+'元</span>';
		                	}
		                },
		                {
		                	key:'hasPI',resolve:function(val){
		                		return '<span class="black">'+utils.formatCurrency(val)+'元</span>';
		                	}
		                },
		                {
		                	key:'recievedPI',resolve:function(val,record){
		                		return '<span class="black">'+utils.formatCurrency(parseFloat(val)-parseFloat(record.hasPI))+'元</span>';
		                	}
		                },
		                {
		                	key:'debtStatus',resolve:function(val,record){
		                		if(val == null || val=='4' || val=='5' || val=='6' || val=='7'){
		                			var a = $('<a href="javascript:;" class="btn-link">债权转让</a>');
		                			a.click(function(){
		                				addAssignmentDebt(record);
		                			});
		                		}else{
		                			var a = $('<a href="javascript:;">撤回</a>');
		                			a.click(function(){
		                				cancelApplyDebt(record.debtId);
		                			});
		                		}
		                		return a;
		                	}
		                }
		                ]
	var param = {
			assignFlag:'canAssign',
			borrowerName:$('#claimm-can-person').val(),
			borrowTitle:$('#claimm-can-title').val()
	}
	var claimmCanPage = new Page('front/debtsManage.do',param,$('#claimm-can .listData'),$('#claimm-can .paging'),ClaimmCanData,function(){});
	//search
	$('#claimm-can-Search').unbind('click').click(function(){
		param = {
				assignFlag:'canAssign',
				borrowerName:$('#claimm-can-person').val(),
				borrowTitle:$('#claimm-can-title').val()
		};
		claimmCanPage = new Page('front/debtsManage.do',param,$('#claimm-can .listData'),$('#claimm-can .paging'),ClaimmCanData,function(){});
	})
	
}
//转让中
function initClaimmIn(){
	$('#claimm-in').show().siblings('div').hide();
	var ClaimmInData = [
			                {
			                	key:'borrowTitle',resolve:function(val,record){
			                		var a =$('<a href="invest.html?id='+record.borrowId+'" title="'+val+'">'+strTitle(val)+'</a>');
			                		return a;
			                	}
			                },
			                {
			                	key:'debtLimit',resolve:function(val,record){
			                		return val+'/'+record.deadline;
			                	}
			                },
			                {
			                	key:'annualRate',resolve:function(val,record){
			                		return val+'%';
			                	}
			                },
			                {
			                	key:'realAmount',resolve:function(val,record){
			                		return '<span class="black">'+utils.formatCurrency(val)+'元</span>';
			                	}
			                },
			                {
			                	key:'auctionBasePrice',resolve:function(val){
			                		return '<span class="black">'+utils.formatCurrency(val)+'元</span>';
			                	}
			                },
			                {
			                	key:'remainAuctionTime',resolve:function(val,record){
			                		return strTime(val);
			                	}
			                }
			                ]
		var param = {
				assignFlag:'assigning',
				borrowerName:$('#claimm-in-person').val(),
				borrowTitle:$('#claimm-in-title').val()
		}
		var claimmCanPage = new Page('front/debtsManage.do',param,$('#claimm-in .listData'),$('#claimm-in .paging'),ClaimmInData,function(){});
		//search
		$('#claimm-in-Search').unbind('click').click(function(){
			param = {
					assignFlag:'assigning',
					borrowerName:$('#claimm-in-person').val(),
					borrowTitle:$('#claimm-in-title').val()
			};
			claimmCanPage = new Page('front/debtsManage.do',param,$('#claimm-in .listData'),$('#claimm-in .paging'),ClaimmInData,function(){});
		})
}
//已转让
function initClaimmIs(){
	$('#claimm-is').show().siblings('div').hide();
	var ClaimmInData = [
		                {
		                	key:'borrowTitle',resolve:function(val,record){
		                		var a =$('<a href="invest.html?id='+record.borrowId+'" title="'+val+'">'+strTitle(val)+'</a>');
		                		return a;
		                	}
		                },
		                {
		                	key:'debtLimit',resolve:function(val,record){
		                		return val+'/'+record.deadline;
		                	}
		                },
		                {
		                	key:'annualRate',resolve:function(val,record){
		                		return val+'%';
		                	}
		                },
		                {
		                	key:'realAmount',resolve:function(val,record){
		                		return '<span class="black">'+utils.formatCurrency(val)+'元</span>';
		                	}
		                },
		                {
		                	key:'debtSum',resolve:function(val){
		                		return '<span class="black">'+utils.formatCurrency(val)+'元</span>';
		                	}
		                },
		                {
		                	key:'auctionBasePrice',resolve:function(val,record){
		                		return '<span class="black">'+utils.formatCurrency(val)+'元</span>';
		                	}
		                },
		                {
		                	key:'auctionEndTime',resolve:function(val,record){
		                		return strTime(val);
		                	}
		                },
		                {
		                	key:'viewpdf_url',resolve:function(val,record){
		                		var a = '<a href="'+val+'" class="btn-link" target=“_blank”>查看合同</a>';
		                		return a;
		                	}
		                }
		                ]
	var param = {
			assignFlag:'alreadyAssign',
			borrowerName:$('#claimm-in-person').val(),
			borrowTitle:$('#claimm-in-title').val()
	}
	var claimmInPage = new Page('front/debtsManage.do',param,$('#claimm-is .listData'),$('#claimm-is .paging'),ClaimmInData,function(){});
	//search
	$('#claimm-in-Search').unbind('click').click(function(){
		param = {
				assignFlag:'canAssign',
				borrowerName:$('#claimm-in-person').val(),
				borrowTitle:$('#claimm-in-title').val()
		};
		claimmInPage = new Page('front/debtsManage.do',param,$('#claimm-is .listData'),$('#claimm-is .paging'),ClaimmInData,function(){});
	})
}
//转让失败
function initClaimmFail(){
	$('#claimm-fail').show().siblings('div').hide();
	var ClaimmFailData = [
		                {
		                	key:'borrowTitle',resolve:function(val,record){
		                		var a =$('<a href="invest.html?id='+record.borrowId+'" title="'+val+'">'+strTitle(val)+'</a>');
		                		return a;
		                	}
		                },
		                {
		                	key:'annualRate',resolve:function(val,record){
		                		return val+'%';
		                	}
		                },
		                {
		                	key:'debtLimit',resolve:function(val,record){
		                		return val+'/'+record.deadline;
		                	}
		                },
		                {
		                	key:'realAmount',resolve:function(val,record){
		                		return '<span class="black">'+utils.formatCurrency(val)+'元</span>';
		                	}
		                },
		                {
		                	key:'debtSum',resolve:function(val){
		                		return '<span class="black">'+utils.formatCurrency(val)+'元</span>';
		                	}
		                },
		                {
		                	key:'auctionBasePrice',resolve:function(val,record){
		                		return '<span class="black">'+utils.formatCurrency(val)+'元</span>';
		                	}
		                },
		                {
		                	key:'debtStatus',resolve:function(val,record){
		                		if(val=='4'){
		                			return '竞拍失败';
		                		}
		                		if(val=='5'){
		                			return '撤销';
		                		}
		                		if(val=='6'){
		                			return '审核失败';
		                		}
		                		if(val=='7'){
		                			return '提前还款';
		                		}
		                	}
		                }
		                ]
	var param = {
			assignFlag:'',
			borrowerName:$('#claimm-fail-person').val(),
			borrowTitle:$('#claimm-fail-title').val()
	}
	var claimmInPage = new Page('front/debtsManage.do',param,$('#claimm-fail .listData'),$('#claimm-fail .paging'),ClaimmFailData,function(){});
	//search
	$('#claimm-fail-Search').unbind('click').click(function(){
		param = {
				assignFlag:'',
				borrowerName:$('#claimm-fail-person').val(),
				borrowTitle:$('#claimm-fail-title').val()
		};
		claimmInPage = new Page('front/debtsManage.do',param,$('#claimm-fail .listData'),$('#claimm-fail .paging'),ClaimmFailData,function(){});
	})
}
//债权转让提交
//债权转让submit
function addAssignmentDebt(list){
	utils.Dialog(true);
	$('.claimm-from').show();
	$('.claimm-from .close').click(function(){
		utils.Dialog();
		$('.claimm-from').hide();
	});
	$('#claimm-price').val("");
//	$('#claimm-password').val("");
	$('#claimm-tips').val("");
	var canDebtsAmt = (parseFloat(list.recivedPrincipal)-parseFloat(list.hasPrincipal)).toFixed(2);
	$('#canDebtsAmt').text(canDebtsAmt);
	//债转提交
	$('#claimm-submit').unbind('click').bind('click',function(){
		//转让期限
		var Debtdate = $('#auctionDays').val();
		//转让price
		var claimmPrice = $('#claimm-price').val();
//		//交易密码
//		var claimmPwd = $('#claimm-password').val();
		//转让描述
		var tips = $('#claimm-tips').val();
		if(Debtdate==''){
			utils.toast('请输入转让期限');
			return;
		}
		if(claimmPrice==''){
			utils.toast('请输入转让价格');
			return;
		}
		if(utils.isMoney(claimmPrice)){
			utils.toast('请输入正确金额');
			return;
		}
		var maxClaimm = canDebtsAmt*1.1;
		var minClaimm = canDebtsAmt*0.5;
		if((claimmPrice>maxClaimm) || (claimmPrice<minClaimm)){
			utils.alert('转让价格范围为'+minClaimm.toFixed(2)+'到'+maxClaimm.toFixed(2)+'元之间,请重新输入');
			return;
		}
//		if(claimmPwd==''){
//			utils.toast('请输入交易密码');
//			return;
//		}
		var parap = {
				debtLimit:list.remainBorrowLimit,
				auctionDays:Debtdate,
				auctionBasePrice:claimmPrice,
//				dealpwd:claimmPwd,
				borrowId:list.borrowId,
				investId:list.investId,
				debtSum:canDebtsAmt,
				details:tips
		}
		utils.ajax({
			url:'front/debtsAssignment.do',
			data:JSON.stringify(parap),
			type:'POST',
			success:function(data){
				if(data.error=='0'){
					utils.alert('债权发布成功',function(){
						window.location.reload();
					});
				}else{
					utils.alert(data.msg);
				}
			}
		})
	})
}
//撤回
function cancelApplyDebt(id){
	utils.confirm('您确定要撤回吗？',function(){
		utils.Loading();
		var parm = {
				debtId:id
		}
		utils.ajax({
			url:'front/recallDebtsAssignment.do',
			data:JSON.stringify(parm),
			success:function(data){
				if(data.error == '0'){
					utils.alert('债权撤回成功！',function(){
						window.location.reload();
					})
				}
			}
		})
		
	})
}
//债权购买
function initClaimBuy(){
	$.ajax({
	    url: 'claimbuy.html',
	    type: "get",
	    dataType: "html",
	    contentType:contentType,
	    success: function (data) {
	    	$('.account-right').html(data);
	    	$('#played-claimbuy-startDate').datepicker({format:'yyyy-mm-dd'}).on('changeDate',function(){});
	    	$('#played-claimbuy-endDate').datepicker({format:'yyyy-mm-dd'}).on('changeDate',function(){});
	    	
	    	$('#success-claim-startDate').datepicker({format:'yyyy-mm-dd'}).on('changeDate',function(){});
	    	$('#success-claim-endDate').datepicker({format:'yyyy-mm-dd'}).on('changeDate',function(){});
	    	
	    	initPlayedClaimBuy();
	    	$('.played-claimbuy').click(function(){
	    		if($(this).hasClass('active')){
	    			return;
	    		}
	    		$(this).addClass('active').siblings('a').removeClass('active');
	    		$('.em-line').animate({'left':'0'},500);
	    		initPlayedClaimBuy();
	    	});
	    	$('.success-claimbuy').click(function(){
	    		if($(this).hasClass('active')){
	    			return;
	    		}
	    		$(this).addClass('active').siblings('a').removeClass('active');
	    		$('.em-line').animate({'left':'120px'},500);
	    		initSuccessClaimBuy();
	    	});
	    }
	});
}
//参与购买的债权
function initPlayedClaimBuy(){
	$('#played-claimbuy').show();
	$('#success-claimbuy').hide();
	var PlayedData = [
		                {
		                	key:'borrowTitle',resolve:function(val,record){
		                		var a =$('<a href="invest.html?id='+record.borrowId+'" title="'+val+'">'+strTitle(val)+'</a>');
		                		return a;
		                	}
		                },
		                {
		                	key:'borrowerName',resolve:function(val){
		                		return val;
		                	}
		                },
		                {
		                	key:'debtLimit',resolve:function(val,record){
		                		if(val){
		                			return val+'/'+record.deadline;
		                		}else{
		                			return record.deadline;
		                		}
		                	}
		                },
		                {
		                	key:'annualRate',resolve:function(val,record){
		                		return val+'%';
		                	}
		                },
		                {
		                	key:'auctionBasePrice',resolve:function(val){
		                		return '<span class="black">'+utils.formatCurrency(val)+'元</span>';
		                	}
		                },
		                {
		                	key:'auctionTime',resolve:function(val,record){
		                		if(val =='2'){
		                			return record.remainDays;
		                		}else{
		                			return '--';
		                		}
		                	}
		                },
		                {
		                	key:'debtStatus',resolve:function(val){
		                		return getDebtStatus(val);
		                	}
		                }
		                ]
	var param = {
			borrowTitle:'',
			startTime:$('#played-claimbuy-startDate').val(),
			endTime:$('#played-claimbuy-endDate').val()
	}
	var playedClaimBuyPage = new Page('front/findBuyingDebt.do',param,$('#played-claimbuy .listData'),$('#played-claimbuy .paging'),PlayedData,function(){});
	
	$('#played-claimbuy-Search').un('click').click(function(){
		param = {
				borrowTitle:'',
				startTime:$('#played-claimbuy-startDate').val(),
				endTime:$('#played-claimbuy-endDate').val()
		}
		playedClaimBuyPage = new Page('front/findBuyingDebt.do',param,$('#played-claimbuy .listData'),$('#played-claimbuy .paging'),PlayedData,function(){});
	})

}


//成功购买的债权
function initSuccessClaimBuy(){
	
	$('#played-claimbuy').hide();
	$('#success-claimbuy').show();
	
	var SuccessClaimData = [
		                {
		                	key:'borrowTitle',resolve:function(val,record){
		                		var a =$('<a href="invest.html?id='+record.borrowId+'" title="'+val+'">'+strTitle(val)+'</a>');
		                		return a;
		                	}
		                },
		                {
		                	key:'debtLimit',resolve:function(val,record){
		                		if(val){
		                			return val+'/'+record.deadline;
		                		}else{
		                			return record.deadline;
		                		}
		                	}
		                },
		                {
		                	key:'annualRate',resolve:function(val,record){
		                		return val+'%';
		                	}
		                },
		                {
		                	key:'debtSum',resolve:function(val){
		                		return '<span class="black">'+utils.formatCurrency(val)+'元</span>';
		                	}
		                },
		                {
		                	key:'auctionBasePrice',resolve:function(val){
		                		return '<span class="black">'+utils.formatCurrency(val)+'元</span>';
		                	}
		                },
		                {
		                	key:'auctionEndTime',resolve:function(val,record){
		                		return strTime(val);
		                	}
		                },
		                {
		                	key:'viewpdf_url',resolve:function(val){
		                		var a = '<a href="'+val+'" class="btn-link" target=“_blank”>查看合同</a>';
		                		return a;
		                	}
		                }
		                ]
	var param = {
			borrowTitle:'',
			startTime:$('#success-claim-startDate').val(),
			endTime:$('#success-claim-endDate').val()
	}
	var SuccessClaimBuyPage = new Page('front/findSucessBuyedDebt.do',param,$('#success-claimbuy .listData'),$('#success-claimbuy .paging'),SuccessClaimData,function(){});
	$('#success-claim-Search').unbind('click').click(function(){
		param = {
				borrowTitle:'',
				startTime:$('#success-claim-startDate').val(),
				endTime:$('#success-claim-endDate').val()
		}
		SuccessClaimBuyPage = new Page('front/findSucessBuyedDebt.do',param,$('#success-claimbuy .listData'),$('#success-claimbuy .paging'),SuccessClaimData,function(){});
	})
}
//获取债权状态
function getDebtStatus(status){
	
	if(status == '2'){
		return '转让中';
	}
	if(status == '3'){
		return '购买成功';
	}
	if(status == '4'){
		return '购买失败';
	}
	if(status == '5'){
		return '撤销';
	}
	if(status == '6'){
		return '审核失败';
	}
	if(status == '7'){
		return '提前还款';
	}
	
}

//投资列表
function initInvestList(){
	$('#invest').show();
	$('#payment').hide();
	var borrowFlag = 'successLoan';
	var investData1 = [
	                {
	                	key:'borrowTitle',resolve:function(val,record){
	                		var a =$('<a href="invest.html?id='+record.borrowId+'" title="'+val+'">'+strTitle(val)+'</a>');
	                		return a;
	                	}
	                },
	                {
	                	key:'borrowWayName',resolve:function(val){
	                		return val;
	                	}
	                },
	                {
	                	key:'annualRate',resolve:function(val,record){
	                		return val+'%';
	                	}
	                },
	                {
	                	key:'deadline',resolve:function(val,record){
	                		return getDeadLine(val,record.isDayThe);
	                	}
	                },
	                {
	                	key:'paymentMode',resolve:function(val){
	                		return paymentMode(val);
	                	}
	                },
	                {
	                	key:'investAmount',resolve:function(val){
	                		return '<span class="black">'+utils.formatCurrency(val)+'</span>';
	                	}
	                },
	                {
	                	key:'investTime',resolve:function(val){
	                		return strTime(val);
	                	}
	                }
	                ]
	var investData2 = [
		                {
		                	key:'borrowTitle',resolve:function(val,record){
		                		var a =$('<a href="invest.html?id='+record.borrowId+'" title="'+val+'">'+strTitle(val)+'</a>');
		                		return a;
		                	}
		                },
		                {
		                	key:'borrowWayName',resolve:function(val){
		                		return val;
		                	}
		                },
		                {
		                	key:'annualRate',resolve:function(val,record){
		                		return val+'%';
		                	}
		                },
		                {
		                	key:'deadline',resolve:function(val,record){
		                		return getDeadLine(val,record.isDayThe);
		                	}
		                },
		                {
		                	key:'paymentMode',resolve:function(val){
		                		return paymentMode(val);
		                	}
		                },
		                {
		                	key:'publishTime',resolve:function(val){
		                		return strTime(val);
		                	}
		                },
		                {
		                	key:'investAmount',resolve:function(val){
		                		return '<span class="black">'+utils.formatCurrency(val)+'</span>';
		                	}
		                },
		                {
		                	key:'investTime',resolve:function(val){
		                		return strTime(val);
		                	}
		                }
		                ]
	var investData3 = [
		                {
		                	key:'borrowTitle',resolve:function(val,record){
		                		var a =$('<a href="invest.html?id='+record.borrowId+'" title="'+val+'">'+strTitle(val)+'</a>');
		                		return a;
		                	}
		                },
		                {
		                	key:'borrowWayName',resolve:function(val){
		                		return val;
		                	}
		                },
		                {
		                	key:'annualRate',resolve:function(val,record){
		                		return val+'%';
		                	}
		                },
		                {
		                	key:'deadline',resolve:function(val,record){
		                		return getDeadLine(val,record.isDayThe);
		                	}
		                },
		                {
		                	key:'realAmount',resolve:function(val){
		                		return '<span class="black">'+utils.formatCurrency(val)+'</span>';
		                	}
		                },
		                {
		                	key:'forTotalSum',resolve:function(val){
		                		return '<span class="black">'+utils.formatCurrency(val)+'</span>';
		                	}
		                },
		                {
		                	key:'recentlyRepayDate',resolve:function(val){
		                		return strTime(val);
		                	}
		                },
		                
		                {
		                	key:'viewpdf_url',resolve:function(val,record){
		                		/*<a class="ml10" href="'+record.download_url+'">下载</a>*/   
		                		var a = '<a href="javascript:paymentDetail('+record.borrowId+','+record.aid+');">详情</a><a class="ml10" href="'+val+'" target=“_blank”>查看合同</a>';
		                		return a;
		                	}
		                }
		                ]
	var investData4 = [
		                {
		                	key:'borrowTitle',resolve:function(val,record){
		                		var a =$('<a href="invest.html?id='+record.borrowId+'" title="'+val+'">'+strTitle(val)+'</a>');
		                		return a;
		                	}
		                },
		                {
		                	key:'borrowWayName',resolve:function(val){
		                		return val;
		                	}
		                },
		                {
		                	key:'annualRate',resolve:function(val,record){
		                		return val+'%';
		                	}
		                },
		                {
		                	key:'deadline',resolve:function(val,record){
		                		return getDeadLine(val,record.isDayThe);
		                	}
		                },
		                {
		                	key:'realAmount',resolve:function(val){
		                		return '<span class="black">'+utils.formatCurrency(val)+'</span>';
		                	}
		                },
		                {
		                	key:'forTotalSum',resolve:function(val){
		                		return '<span class="black">'+utils.formatCurrency(val)+'</span>';
		                	}
		                },
		                {
		                	key:'publishTime',resolve:function(val){
		                		return strTime(val);
		                	}
		                },
		                {
		                	key:'viewpdf_url',resolve:function(val,record){
		                		/*var div = $('<div class="more-content"></div>');
		                		var ul = $('<div class="more-box"></div>');
		                		var a = $('<a href="javascript:;">查看更多</a>').appendTo(div);
		                		var detail = $('<a href="javascript:;">查看详情</a>').click(function(){
		                			investRepayDetail(record.borrowId);
		                		}).appendTo(ul);
		                		var sea = $('<a href="'+record.viewpdf_url+'">查看合同</a>').appendTo(ul);
		                		var down = $('<a href="'+record.download_url+'">下载合同</a>').appendTo(ul);
		                		ul.appendTo(div);*/
		                		var str = '<a href="javascript:paymentDetail('+record.borrowId+','+record.bid+');">详情</a><a class="ml10" href="'+val+'" target=“_blank”>查看合同</a>';
		                		return str;
		                	}
		                }
		                ]
	var param = {
			borrowFlag:borrowFlag,
			publishTimeStart:'',
			publishTimeEnd:'',
			title:''
	};
	var investPage = new Page('front/investmentManage.do',param,$('.invest-listData1 .listData'),$('.invest-listData1 .paging'),investData1,function(){});
	
	$('#invest-s1').unbind('click').click(function(){
		borrowFlag = 'successLoan';
		$(this).addClass('active').siblings('a').removeClass('active');
		var param = {
    			borrowFlag:borrowFlag,
    			publishTimeStart:$('#invest-startDate').val(),
    			publishTimeEnd:$('#invest-endDate').val(),
    			title:''
    	};
		$('.invest-listData1').show().siblings('div.invest-listData').hide();
		investPage = new Page('front/investmentManage.do',param,$('.invest-listData1 .listData'),$('.invest-listData1 .paging'),investData1,function(){});
	});
	$('#invest-s2').unbind('click').click(function(){
		borrowFlag = 'tendersingBorrow';
		$(this).addClass('active').siblings('a').removeClass('active');
		var param = {
    			borrowFlag:borrowFlag,
    			publishTimeStart:$('#invest-startDate').val(),
    			publishTimeEnd:$('#invest-endDate').val(),
    			title:''
    	};
		$('.invest-listData2').show().siblings('div.invest-listData').hide();
		investPage = new Page('front/investmentManage.do',param,$('.invest-listData2 .listData'),$('.invest-listData2 .paging'),investData2,function(){});
	});
	$('#invest-s3').unbind('click').click(function(){
		$(this).addClass('active').siblings('a').removeClass('active');
		borrowFlag = 'recycleBorrow';
		var param = {
    			borrowFlag:borrowFlag,
    			publishTimeStart:$('#invest-startDate').val(),
    			publishTimeEnd:$('#invest-endDate').val(),
    			title:''
    	};
		$('.invest-listData3').show().siblings('div.invest-listData').hide();
		
		investPage = new Page('front/investmentManage.do',param,$('.invest-listData3 .listData'),$('.invest-listData3 .paging'),investData3,function(){});
	});
	$('#invest-s4').unbind('click').click(function(){
		$(this).addClass('active').siblings('a').removeClass('active');
		borrowFlag = '';
		var param = {
    			borrowFlag:borrowFlag,
    			publishTimeStart:$('#invest-startDate').val(),
    			publishTimeEnd:$('#invest-endDate').val(),
    			title:''
    	};
		$('.invest-listData4').show().siblings('div.invest-listData').hide();
		
		investPage = new Page('front/investmentManage.do',param,$('.invest-listData4 .listData'),$('.invest-listData4 .paging'),investData4,function(){});
	});
	$('#investSearch').unbind('click').click(function(){
		if(borrowFlag=='successLoan'){
			$('#invest-s1').click();
		}
		if(borrowFlag=='tendersingBorrow'){
			$('#invest-s2').click();
		}
		if(borrowFlag=='recycleBorrow'){
			$('#invest-s3').click();
		}
		if(borrowFlag==''){
			$('#invest-s4').click();
		}
	});
	
}
//收款明细
function initInvestDetail(){
	$('#invest').hide();
	$('#payment').show();
	$('#payment-startDate').datepicker({format:'yyyy-mm-dd'}).on('changeDate',function(){});
	$('#payment-endDate').datepicker({format:'yyyy-mm-dd'}).on('changeDate',function(){});
	var param = {
			publishTimeStart:'',
			publishTimeEnd:'',
			title:''
	};
	var investDetailData = [
		                {
		                	key:'borrowTitle',resolve:function(val,record){
		                		var a =$('<a href="invest.html?id='+record.borrowId+'" title="'+val+'">'+strTitle(val)+'</a>');
		                		return a;
		                	}
		                },
		                {
		                	key:'borrowWayName',resolve:function(val){
		                		return val;
		                	}
		                },
		                {
		                	key:'annualRate',resolve:function(val,record){
		                		return val+'%';
		                	}
		                },
		                {
		                	key:'deadline',resolve:function(val,record){
		                		return getDeadLine(val,record.isDayThe);
		                	}
		                },
		                {
		                	key:'realAmount',resolve:function(val){
		                		return '<span class="black">'+utils.formatCurrency(val)+'元</span>';
		                	}
		                },
		                {
		                	key:'forHasSum',resolve:function(val){
		                		return '<span class="black">'+utils.formatCurrency(val)+'元</span>';
		                	}
		                },
		                {
		                	key:'publishTime',resolve:function(val){
		                		return strTime(val);
		                	}
		                }
		                ]
	var investDetailPage = new Page('front/getMoneyDetail.do',param,$('.invest-detailTable .listData'),$('.invest-detailTable .paging'),investDetailData,function(data){
		var backAcountStatisMap = data.backAcountStatisMap;
		$('#allForPI').text(backAcountStatisMap.allForPI);
		$('#allForPIOneMonth').text(backAcountStatisMap.allForPIOneMonth);
		$('#allForPIThreeMonth').text(backAcountStatisMap.allForPIThreeMonth);
		$('#allForPIYear').text(backAcountStatisMap.allForPIYear);
	});

	$('#invest-detailSearch').unbind('click').click(function(){
		param = {
				publishTimeStart:$('#payment-startDate').val(),
				publishTimeEnd:$('#payment-endDate').val(),
				title:''
		};
		investDetailPage = new Page('front/getMoneyDetail.do',param,$('.invest-detailTable .listData'),$('.invest-detailTable .paging'),investDetailData,function(){});
	})
}
//还款详情
function paymentDetail(borrowId,id){
	utils.Dialog(true);
	$('.payment-detail .listData').empty();
	$('.payment-detail').show();
	$('.payment-detail .close').click(function(){
		utils.Dialog();
		$('.payment-detail').hide();
	});
	var param = {
			borrowId:borrowId,
			id:id
	}
	var repayData = [
	                 {
	                	 key:'repayPeriod',resolve:function(val,record,index){
	                		 return val;
	                	 }
	                 },
	                 {
	                	 key:'repayDate',resolve:function(val,record){
	                		 return strTime(val);
	                	 }
	                 },
	                 {
	                	 key:'forpayPrincipal',resolve:function(val,record){
	                		 return val;
	                	 }
	                 },
	                 {
	                	 key:'forpayInterest',resolve:function(val,record){
	                		 return val;
	                	 }
	                 },
	                 {
	                	 key:'principalBalance',resolve:function(val,record){
	                		 return val;
	                	 }
	                 },
	                 {
	                	 key:'manage',resolve:function(val,record){
	                		 return val;
	                	 }
	                 },
	                 {
	                	 key:'isLate',resolve:function(val,record){
	                		 if(val=='1'){
	                			 return '否';
	                		 }else{
	                			 return '是';
	                		 }
	                	 }
	                 },
	                 {
	                	 key:'lateDay',resolve:function(val,record){
	                		 return val;
	                	 }
	                 },
	                 {
	                	 key:'forFI',resolve:function(val,record){
	                		 return val;
	                	 }
	                 },
	                 {
	                	 key:'hasReceive',resolve:function(val,record){
	                		 return val;
	                	 }
	                 },
	                 {
	                	 key:'isWebRepay',resolve:function(val,record){
	                		 if(val=='2'){
	                			 return '网站垫付';
	                		 }else{
	                			 return record.username.substring(0,3)+'...';
	                		 }
	                	 }
	                 }
	                 ]
	utils.ajax({
		url:'front/findBorrowForpayDetail.do',
		data:JSON.stringify(param),
		success:function(data){
			utils.initListData(repayData,data.listMap,$('.payment-detail .listData'));
		}
	})
}
//借款管理
function initLoanManage(){
	$.ajax({
	    url: 'loanmanage.html',
	    type: "get",
	    dataType: "html",
	    contentType:contentType,
	    success: function (data) {
	    	$('.account-right').html(data);
	    	loanLinkInit();
	    	$('#repayEdit').hide();
	    	$('#loanLink').click(function(){
	    		if($(this).hasClass('active')){
	    			return;
	    		}
	    		$(this).addClass('active').siblings('a').removeClass('active');
	    		$('.em-line').animate({'left':'0'},500);
	    		$('#repay').hide();
	    		$('#repayEdit').hide();
	    		$('#loan').show();
	    		loanLinkInit();
	    	});
	    	$('#detailLink').click(function(){
	    		if($(this).hasClass('active')){
	    			return;
	    		}
	    		$(this).addClass('active').siblings('a').removeClass('active');
	    		$('.em-line').animate({'left':'120px'},500);
	    		$('#loan').hide();
	    		$('#repayEdit').hide();
	    		$('#repay').show();
	    		detailLinkInit();
	    	});
	    	$('#repayEditLink').click(function(){
	    		if($(this).hasClass('active')){
	    			return;
	    		}
	    		$(this).addClass('active').siblings('a').removeClass('active');
	    		$('.em-line').animate({'left':'240px'},500);
	    		$('#loan').hide();
	    		$('#repay').hide();
	    		autoRepaymentInit();
	    	});
	    }
	});
}

function autoRepaymentInit() {
	$.ajax({
	    url: 'front/autoRepaymentInit.do',
	    type: "get",
	    dataType: "json",
	    contentType:contentType,
	    success: function (data) {
	    	if (data.error == 0) {
	    		$("#payment_money").text(data.automaticBidMap.usableSum);
	    		$("#payment_state").text(data.bidStatus == 2 ? '已开启' : '已关闭');
	    		$("#payment_btn").text(data.bidStatus == 1 ? '开启' : '关闭');
	    		$('#repayEdit').show();
	    	} else {
	    		utils.alert(data.msg);
	    	}
	    	
	    	$('#payment_btn').unbind('click').click(function(){
	    		var state;
	    		if (data.bidStatus == 1) {
	    			state = 2;
	    		} else if (data.bidStatus == 2) {
	    			state = 1;
	    		}
	    		var param = {'state':state};
	    		utils.ajax({
	    		    url: 'front/autoRepayment.do',
	    		    type: "get",
	    		    data: JSON.stringify(param),
	    		    dataType: "json",
	    		    contentType:contentType,
	    		    success: function (data) {
	    		    	utils.alert(data.msg);
	    		    	autoRepaymentInit();
	    		    }
	    		});
	    	});
	    }
	});
}

//借款管理初始化
function loanLinkInit(){
	var borrowFlag = 'auditing';
	var param = {
			borrowFlag:borrowFlag,
			publishTimeStart:'',
			publishTimeEnd:'',
			title:''
	};
	$('#startDate').datepicker({format:'yyyy-mm-dd'}).on('changeDate',function(){});
	$('#endDate').datepicker({format:'yyyy-mm-dd'}).on('changeDate',function(){});
	var listData = [
	                {
	                	key:'borrowTitle',resolve:function(val,record){
	                		var a =$('<a href="invest.html?id='+record.id+'" title="'+val+'">'+strTitle(val)+'</a>');
	                		return a;
	                	}
	                	
	                },
	                {
	                	key:'borrowWayName',resolve:function(val){
	                		return val;
	                	}
	                },
	                {
	                	key:'paymentMode',resolve:function(val){
	                		return paymentMode(val);
	                	}
	                },
	                {
	                	key:'borrowAmount',resolve:function(val){
	                		return '<span class="black">'+utils.formatCurrency(val)+'元</span>';
	                	}
	                },
	                {
	                	key:'annualRate',resolve:function(val){
	                		return val+'%';
	                	}
	                },
	                {
	                	key:'deadline',resolve:function(val,record){
	                		return getDeadLine(val,record.isDayThe);
	                	}
	                },
	                {
	                	key:'publishTime',resolve:function(val){
	                		return strTime(val);
	                	}
	                },
	                {
	                	key:'schedules',resolve:function(val){
	                		return val+'%';
	                	}
	                },
	                {
	                	key:'borrowStatus',resolve:function(val){
	                		return borrowStatus(val);
	                	}
	                }
	                ];
	var listData1 = [
	                {
	                	key:'borrowTitle',resolve:function(val,record){
	                		var a =$('<a href="invest.html?id='+record.id+'" title="'+val+'">'+strTitle(val)+'</a>');
	                		return a;
	                	}
	                	
	                },
	                {
	                	key:'',resolve:function(val,record){
	                		var a =$('<a href="javascript:;" target=“_blank”>查看协议</a>');
	                		a.bind('click',function(){
	                			showContract(record.borrowId);
	                		 });
	                		return a;
	                	}
	                },
	                {
	                	key:'paymentMode',resolve:function(val){
	                		return paymentMode(val);
	                	}
	                },
	                {
	                	key:'borrowAmount',resolve:function(val){
	                		return '<span class="black">'+utils.formatCurrency(val)+'元</span>';
	                	}
	                },
	                {
	                	key:'annualRate',resolve:function(val){
	                		return val+'%';
	                	}
	                },
	                {
	                	key:'deadline',resolve:function(val,record){
	                		return getDeadLine(val,record.isDayThe);
	                	}
	                },
	                {
	                	key:'publishTime',resolve:function(val){
	                		return strTime(val);
	                	}
	                },
	                {
	                	key:'stillTotalSum',resolve:function(val){
	                		return '<span class="black">'+utils.formatCurrency(val)+'元</span>';
	                	}
	                },
	                {
	                	key:'borrowStatus',resolve:function(val){
	                		return borrowStatus(val);
	                	}
	                }
	                ];
	var listData2 = [
    	                {
    	                	key:'borrowTitle',resolve:function(val,record){
    	                		var a =$('<a href="invest.html?id='+record.id+'" title="'+val+'">'+strTitle(val)+'</a>');
    	                		return a;
    	                	}
    	                	
    	                },
    	                {
    	                	key:'username',resolve:function(val){
    	                		return val;
    	                	}
    	                },
    	                {
    	                	key:'realAmount',resolve:function(val){
    	                		return '<span class="black">'+utils.formatCurrency(val)+'</span>';
    	                	}
    	                },
    	                {
    	                	key:'recivedPI',resolve:function(val){
    	                		return val;
    	                	}
    	                },
    	                {
    	                	key:'hasPrincipal',resolve:function(val){
    	                		return val;
    	                	}
    	                },
    	                {
    	                	key:'hasInterest',resolve:function(val){
    	                		return val;
    	                	}
    	                },
    	                {
    	                	key:'forPrincipal',resolve:function(val){
    	                		return val;
    	                	}
    	                },
    	                {
    	                	key:'forInterest',resolve:function(val){
    	                		return val;
    	                	}
    	                }
    	                ];
	var loanPage = new Page('front/borrowManageList.do',param,$('#loan .loan-listData1 .listData'),$('#loan .loan-listData1 .paging'),listData,function(){});
	//审核中
	$('#loan-s').unbind('click').click(function(){
		borrowFlag = 'auditing';
		/*if($(this).hasClass('active')&&search==true){
			return;
		}*/
		$(this).addClass('active').siblings('a').removeClass('active');
		var param = {
    			borrowFlag:borrowFlag,
    			publishTimeStart:$('#startDate').val(),
    			publishTimeEnd:$('#endDate').val(),
    			title:''
    	};
		$('.loan-listData1').show().siblings('div.loan-listData').hide();
		$('#loan .account-form-investor').hide();
		$('#loan .account-form-manage').show();
		loanPage = new Page('front/borrowManageList.do',param,$('#loan .loan-listData1 .listData'),$('#loan .loan-listData1 .paging'),listData,function(){});
	});
	//招标中
	$('#loan-z').unbind('click').click(function(){
		borrowFlag = 'inviting';
		$(this).addClass('active').siblings('a').removeClass('active');
		var param = {
    			borrowFlag:borrowFlag,
    			publishTimeStart:$('#startDate').val(),
    			publishTimeEnd:$('#endDate').val(),
    			title:''
    	};
		$('.loan-listData2').show().siblings('div.loan-listData').hide();
		$('#loan .account-form-investor').hide();
		$('#loan .account-form-manage').show();
		loanPage = new Page('front/borrowManageList.do',param,$('#loan .loan-listData2 .listData'),$('#loan .loan-listData2 .paging'),listData,function(){});
	});
	//成功借款
	$('#loan-c').unbind('click').click(function(){
		borrowFlag = 'success';
		$(this).addClass('active').siblings('a').removeClass('active');
		var param = {
    			borrowFlag:borrowFlag,
    			publishTimeStart:$('#startDate').val(),
    			publishTimeEnd:$('#endDate').val(),
    			title:''
    	};
		$('.loan-listData3').show().siblings('div.loan-listData').hide();
		$('#loan .account-form-investor').hide();
		$('#loan .account-form-manage').show();
		$('#loan .listData').removeClass('loanData-investor');
		loanPage = new Page('front/borrowManageList.do',param,$('#loan .loan-listData3 .listData'),$('#loan .loan-listData3 .paging'),listData1,function(){});
	});
	//借款明细
	$('#loan-j').unbind('click').click(function(){
		borrowFlag = '';
		$(this).addClass('active').siblings('a').removeClass('active');
		var param = {
				borrowFlag:'',
				investor:$('#investor').val(),
				title:''
		};
		
		$('.loan-listData4').show().siblings('div.loan-listData').hide();
		$('#loan .account-form-manage').hide();
		$('#loan .account-form-investor').show();
		loanPage = new Page('front/borrowManageList.do',param,$('#loan .loan-listData4 .listData'),$('#loan .loan-listData4 .paging'),listData2,function(){});
	});
	$('#loanSearch').unbind('click').click(function(){
		if(borrowFlag=='auditing'){
			$('#loan-s').click();
		}
		if(borrowFlag=='inviting'){
			$('#loan-z').click();
		}
		if(borrowFlag=='success'){
			$('#loan-c').click();
		}
	});
	$('#j-loanSearch').unbind('click').click(function(){
		if($('#investor').val()==''){
			utils.toast('请输入投资者');
			return;
		}
		$('#loan-j').click();
	});
	$('#qingSearch').unbind('click').click(function(){
		$('#payment-startDate').datepicker('clearDates');
		$('#payment-endDate').datepicker('clearDates');
	})
}

//还款明细初始化
function detailLinkInit(){
	var borrowFlag = 'repaymenting';
	var param = {
			borrowFlag:borrowFlag,
			publishTimeStart:'',
			publishTimeEnd:'',
			title:''
	};
	$('#d-startDate').datepicker({format:'yyyy-mm-dd'}).on('changeDate',function(){});
	$('#d_endDate').datepicker({format:'yyyy-mm-dd'}).on('changeDate',function(){});
	var dlistData = [
	                {
	                	key:'borrowTitle',resolve:function(val,record){
	                		var a =$('<a href="invest.html?id='+record.id+'" title="'+val+'">'+strTitle(val)+'</a>');
	                		return a;
	                	}
	                
	                },
	                {
	                	key:'borrowWayName',resolve:function(val,record){
	                		var a =$('<a href="javascript:;" class="btn-link" target=“_blank”>查看合同</a>');
	                		 a.bind('click',function(){
	                			showContract(record.borrowId);
	                		 });
	                		 return a;
	                	}
	                },
	                {
	                	key:'paymentMode',resolve:function(val){
	                		return paymentMode(val);
	                	}
	                },
	                {
	                	key:'borrowAmount',resolve:function(val){
	                		return '<span class="black">'+utils.formatCurrency(val)+'元</span>';
	                	}
	                },
	                {
	                	key:'annualRate',resolve:function(val){
	                		return val+'%';
	                	}
	                },
	                {
	                	key:'deadline',resolve:function(val,record){
	                		return getDeadLine(val,record.isDayThe);
	                	}
	                },
	                {
	                	key:'repayDate',resolve:function(val){
	                		return strTime(val);
	                	}
	                },
	                {
	                	key:'hasSum',resolve:function(val){
	                		return '<span class="black">'+utils.formatCurrency(val)+'元</span>';
	                	}
	                },
	                {
	                	key:'borrowId',resolve:function(val){
	                		var a =$('<a href="javascript:;">明细</a>');
	                		a.bind('click',function(){
	                			showRepayDetail(val);
	                		});
	                		return a;
	                	}
	                }
	                ];
	var dlistData1 = [
	                 {
	                	 key:'borrowTitle',resolve:function(val,record){
	                		 var a =$('<a href="invest.html?id='+record.id+'" title="'+val+'">'+strTitle(val)+'</a>');
	                		 return a;
	                	 }
	                 
	                 },
	                 {
	                	 key:'',resolve:function(val,record){
	                		 var a =$('<a href="javascript:;" class="btn-link" target=“_blank”>查看合同</a>');
	                		 a.bind('click',function(){
	                			showContract(record.borrowId);
	                		 });
	                		 return a;
	                	 }
	                 },
	                 {
	                	 key:'borrowAmount',resolve:function(val){
	                		 return '<span class="black">'+utils.formatCurrency(val)+'元</span>';
	                	 }
	                 },
	                 {
	                	 key:'annualRate',resolve:function(val){
	                		 return val+'%';
	                	 }
	                 },
	                 {
	                	 key:'deadline',resolve:function(val,record){
	                		 return getDeadLine(val,record.isDayThe);
	                	 }
	                 },
	                 {
	                	 key:'repayDate',resolve:function(val){
	                		 return strTime(val);
	                	 }
	                 },
	                 {
	                	 key:'stillTotalSum',resolve:function(val){
	                		 return '<span class="black">'+utils.formatCurrency(val)+'</span>';
	                	 }
	                 },
	                 {
	                	 key:'hasFI',resolve:function(val){
	                		 return val;
	                	 }
	                 },
	                 {
	                	 key:'borrowId',resolve:function(val){
	                		 var a =$('<a href="javascript:;">明细</a>');
		                		a.bind('click',function(){
		                			showRepayDetail(val);
		                		});
		                		return a;
	                	 }
	                 }
	                 ];
	var dlistData2 = [
	                 {
	                	 key:'borrowTitle',resolve:function(val,record){
	                		 var a =$('<a href="invest.html?id='+record.id+'" title="'+val+'">'+strTitle(val)+'</a>');
	                		 return a;
	                	 }
	                 
	                 },
	                 {
	                	 key:'repayPeriod',resolve:function(val){
	                		 return val;
	                	 }
	                 },
	                 {
	                	 key:'repayDate',resolve:function(val){
	                		 return val;
	                	 }
	                 },
	                 {
	                	 key:'realRepayDate',resolve:function(val){
	                		 return val;
	                	 }
	                 },
	                 {
	                	 key:'forPI',resolve:function(val){
	                		 return val;
	                	 }
	                 },
	                 {
	                	 key:'stillInterest',resolve:function(val){
	                		 return val;
	                	 }
	                 },
	                 {
	                	 key:'lateFI',resolve:function(val){
	                		 return val;
	                	 }
	                 },
	                 {
	                	 key:'lateDay',resolve:function(val){
	                		 return val;
	                	 }
	                 },
	                 {
	                	 key:'repayStatus',resolve:function(val){
	                		 if(val == '1'){
	                			 return '未偿还';
	                		 }else{
	                			 return '已偿还';
	                		 }
	                		 
	                	 }
	                 },
	                 {
	                	 key:'repayStatus',resolve:function(val,record){
	                		 if(val!='1'){
	                			 return '--'
	                		 }else{
	                			 var a =$('<a href="javascript:;">还款</a>');
			                		a.bind('click',function(){
			                			showRepaySubmit(record.payId);
			                		});
			                		return a;
	                		 }
	                	 }
	                 }
	                 ];	
	var detailPage = new Page('front/repaymentDetail.do',param,$('#repay .listTable1 .listData'),$('#repay .listTable1 .detailPaging'),dlistData,function(){});
	//还款中
	$('#detail-h').unbind('click').click(function(){
		borrowFlag = 'repaymenting';
		/*if($(this).hasClass('active')&&search==true){
			return;
		}*/
		$(this).addClass('active').siblings('a').removeClass('active');
		var param = {
				borrowFlag:borrowFlag,
				publishTimeStart:$('#d-startDate').val(),
				publishTimeEnd:$('#d_endDate').val(),
				title:''
		};
		$('.listTable3').hide();
		$('.listTable2').hide();
		$('.listTable1').show();
		detailPage = new Page('front/repaymentDetail.do',param,$('#repay .listTable1 .listData'),$('#repay .listTable1 .detailPaging'),dlistData,function(){});
	});
	//已还完
	$('#detail-y').unbind('click').click(function(){
		borrowFlag = 'alreadyRepaid';
		$(this).addClass('active').siblings('a').removeClass('active');
		var param = {
				borrowFlag:borrowFlag,
				publishTimeStart:$('#d-startDate').val(),
				publishTimeEnd:$('#d_endDate').val(),
				title:''
		};
		$('.listTable3').hide();
		$('.listTable1').hide();
		$('.listTable2').show();
		detailPage = new Page('front/repaymentDetail.do',param,$('#repay .listTable2 .listData'),$('#repay .listTable2 .detailPaging'),dlistData1,function(){});
	});
	//还款明细
	$('#detail-m').unbind('click').click(function(){
		borrowFlag = '';
		$(this).addClass('active').siblings('a').removeClass('active');
		var param = {
				borrowFlag:borrowFlag,
				publishTimeStart:$('#d-startDate').val(),
				publishTimeEnd:$('#d_endDate').val(),
				title:''
		};
		$('.listTable2').hide();
		$('.listTable1').hide();
		$('.listTable3').show();
		detailPage = new Page('front/repaymentDetail.do',param,$('#repay .listTable3 .listData'),$('#repay .listTable3 .detailPaging'),dlistData2,function(){});
	});
	//七日内还款明细
	$('#detail-sm').unbind('click').click(function(){
		borrowFlag = '7';
		$(this).addClass('active').siblings('a').removeClass('active');
		var param = {
				borrowFlag:borrowFlag,
				publishTimeStart:$('#d-startDate').val(),
				publishTimeEnd:$('#d_endDate').val(),
				title:''
		};
		$('.listTable2').hide();
		$('.listTable1').hide();
		$('.listTable3').show();
		detailPage = new Page('front/repaymentDetail.do',param,$('#repay .listTable3 .listData'),$('#repay .listTable3 .detailPaging'),dlistData2,function(){});
	});
	$('#detailSearch').unbind('click').click(function(){
		if(borrowFlag=='repaymenting'){
			$('#detail-h').click();
		}
		if(borrowFlag=='alreadyRepaid'){
			$('#detail-y').click();
		}
		if(borrowFlag==''){
			$('#detail-m').click();
		}
		if(borrowFlag=='7'){
			$('#detail-sm').click();
		}
	});
}
//还款明细列表
//还款详细明细
function  showRepayDetail(borrowId){
	utils.Dialog(true);
	$('.repay-detail').show();
	$('.repay-detail .close').click(function(){
		utils.Dialog();
		$('.repay-detail').hide();
	});
	var param = {
			borrowId:borrowId,
			status:'1'
	}
	var repayData = [
	                 {
	                	 key:'repayStatus',resolve:function(val,record,index){
	                		 return index;
	                	 }
	                 },
	                 {
	                	 key:'repayDate',resolve:function(val,record){
	                		 return val;
	                	 }
	                 },
	                 {
	                	 key:'repayTotal',resolve:function(val,record){
	                		 return val;
	                	 }
	                 },
	                 {
	                	 key:'realRepayDate',resolve:function(val,record){
	                		 return val;
	                	 }
	                 },
	                 {
	                	 key:'lateDay',resolve:function(val,record){
	                		 return val+'天';
	                	 }
	                 },
	                 {
	                	 key:'hasPI',resolve:function(val,record){
	                		 return val;
	                	 }
	                 },
	                 {
	                	 key:'lateTotal',resolve:function(val,record){
	                		 return val;
	                	 }
	                 },
	                 {
	                	 key:'total',resolve:function(val,record){
	                		 return val;
	                	 }
	                 },
	                 {
	                	 key:'repayStatus',resolve:function(val,record){
	                		 return val;
	                	 }
	                 },
	                 {
	                	 key:'repayStatus',resolve:function(val,record){
	                		 if(val == '已偿还'){
	                			 return val;
	                		 }else{
	                			 var a = $( '<a href="javascript:;">还款</a>');
	                			 a.bind('click',function(){
	                				 	utils.Dialog();
	                					$('.repay-detail').hide();
	                				 showRepaySubmit(record.id);
	                			 })
	                			 return a;
	                		 }
	                		 
	                	 }
	                 }
	                 ]
	var repayTable = new Page('front/findPayingDetailsByBorrowId.do',param,$('.repay-detail .listData'),$('.repay-detail .paging'),repayData,function(){});
}
//借款合同
function  showContract(borrowId){
	utils.Dialog(true);
	$('.contract-detail').show();
	$('.contract-detail .close').click(function(){
		utils.Dialog();
		$('.contract-detail').hide();
	});
	var param = {
			borrowId:borrowId
	}
	var ContractData = [
	                 {
	                	 key:'borrowTitle',resolve:function(val,record,index){
	                		 return index;
	                	 }
	                 },
	                 {
	                	 key:'publishName',resolve:function(val,record){
	                		 return val;
	                	 }
	                 },
	                 {
	                	 key:'investName',resolve:function(val,record){
	                		 return val;
	                	 }
	                 },
	                 {
	                	 key:'viewpdf_url',resolve:function(val,record){
	                		 if(val){
	                			 return '<a href="'+val+'" target=“_blank”>查看</a>';
	                		 }else{
	                			 return '--';
	                		 }
	                	 }
	                 },
	                 {
	                	 key:'download_url',resolve:function(val,record){
	                		 if(val){
	                			 return '<a href="'+val+'">下载</a>';
	                		 }else{
	                			 return '--';
	                		 }
	                	 }
	                 }
	                 ]
	var ContractTable = new Page('front/queryPactList.do',param,$('.contract-detail .listData'),$('.contract-detail .paging'),ContractData,function(){});
}

//还款表单显示
function showRepaySubmit(id){
//	$('#input-imgCode').val(''); 
//	$('#use-password').val(''); 
	utils.Dialog(true);
	$('.repay-from').show();
	$('.repay-from .close').click(function(){
		utils.Dialog();
		$('.repay-from').hide();
	});
	var param = {
			payId:id,
	};
	utils.ajax({
		url:'front/findMyPayData.do',
		data:JSON.stringify(param),
		success:function(data){
			if(data.error=='0'){
				//账户余额
				$('#repay-amt').text(data.payMap.totalSum);
				//可用余额
				$('#repay-use').text(data.payMap.usableSum);
				//还款日期
				$('#repay-redate').text(data.payMap.repayDate);
				//待还本息
				$('#repay-dbent').text(data.payMap.forPI);
				//逾期本息
				$('#repay-rbent').text(data.payMap.lateFI);
				//需还金额
				$('#repay-must').text(data.payMap.needSum);
				utils.getImgCode($('#imgCode'),'invest');
				$('#imgCode').click(function(){
					utils.getImgCode($(this),'invest');
				});
				$('#getMsgCode').click(function(){
					utils.getSmsCode($(this),data.payMap.phone,'huifuRegist');
				});
				//还款
				$('#repay-submit').unbind('click').bind('click',function(){
					if($(this).hasClass('disabled'))
						return;
					RepaySubmit(data.payMap.id,data.payMap.needSum);
				});
			}else{
				utils.alert(data.msg);
			}
		}
	})
}
//submit
function RepaySubmit(repayid,needSums){
//	var code = $('#input-imgCode').val(); 
	var password = $('#getMsgCode').data('randomCode')
	var msgcode = $('#msgcode').val();
	if(password==''){
		utils.toast('请先获取短信验证码!');
		return;
	};
	if(msgcode==''){
		utils.toast('请输验证码');
		return;
	};  
	var repayparam = {
//			code:code,
			id:repayid,
			pwd:password,
			needSum:needSums,
			msgcode:msgcode,
	};
	$('#repay-submit').addClass('disabled').text('还款中...').unbind('click');
	//ajax
	utils.ajax({
		url:'front/referPay.do',
		data:JSON.stringify(repayparam),
		success:function(data){
			$('#repay-submit').removeClass('disabled').text('还款').bind('click',function(){ 
				RepaySubmit(repayid,needSums);
			});
			if(data.error=='0'){
				utils.alert('还款成功',function(){
					$('#msgcode').val('');
					$('.repay-from').hide();
					utils.Dialog();
				});
				$('#detail-m').click();
			}else{
				utils.alert(data.msg);
			}
		}
	});	
}
//获取还款方式
function paymentMode(val){
	if(val==4){
		return ' 一次性还款';
	}else if(val==1){
		return '等额本息';
	}else{
		return '按月付息，到期还本';
	}
};
//获取标的时间
function getDeadLine(deadline,isDayThe){
	if(isDayThe == '1'){
		return deadline+'个月';
	}else{
		return deadline+'天';
	}
}
//时间格式化
function strTime(time){
	return time.substring(0,10);
}
//还款状态
function borrowStatus(s){
	if(s == 2){
		return '招标中';
	}else if(s == 3){
		return '已满标';
	}else if(s == 4){
		return '还款中';
	}else if(s == 5){
		return '已还完';
	}else if(s == 6){
		return '已流标';
	}
}
//标题格式化
function strTitle(title){
	if(title.length>7){
		return title.substring(0,6)+'...';
	}else{
		return title;
	}
}
//推荐好友初始化
var isEmployeeReferral = -1;
//推荐好友
function initTuijian(){
	$.ajax({
	    url: 'friend.html',
	    type: "get",
	    dataType: "html",
	    contentType:contentType,
	    success: function (data) {
	    	utils.ajax({
	    		url:'front/friendManagerInit.do?is=1',
	    		data:{},
	    		dataType:'json',
	    		success:function(record){
	    			if(record.error=='0'){
	    				if (record.isEmployeeReferral == 2) {
	    					// 内部员工推荐
	    					isEmployeeReferral = 2;
	    				}
	    			}
	    		}
	    	})
	    	
	    	$('.account-right').html(data);
	    	//uid
	    	$('#uid').text(utils.Storage.getItem('uid'));
	    	//生成推荐链接
	    	$('#tj-clip-text').text('https://www.pujinziben.com/regist.html?useCode='+utils.Storage.getItem('uid'));
	    	//复制文本
	    	var text = $(".tj-clip-text").text();
	    	clipboard(text,'tj-clip-btn','复制成功！','tj-clip');
	    		    	
	    	$('.tuijian-list').hide();
	    	$(".invest-list").hide();
	    	$(".investList").hide();
	    	$(".fanhui").hide();
	    	
	    	$(".tuijian").click(function () {
	    		tuiJianList();
	    		
	    		if($(this).hasClass('active')){
	    			return;
	    		}
	    		$(this).addClass('active').siblings('a').removeClass('active');
	    		$('.em-line').animate({'left':'0'},500);
	    		$('.tuiJianShow').show();
	    		$('.tuijian-list').hide();
		    	$(".invest-list").hide();
		    	$(".investList").hide();
		    	$(".fanhui").hide();
	    	});
	    	
	    	$(".show-tuijian-list").bind("click", function () {
	    		if($(this).hasClass('active')){
	    			return;
	    		}
	    		$(this).addClass('active').siblings('a').removeClass('active');
	    		$('.em-line').animate({'left':'120px'},500);
	    		$('.tuiJianShow').hide();
	    		$('.tuijian-list').show();
		    	$(".invest-list").hide();
		    	$(".investList").hide();
		    	$(".fanhui").hide();
	    		
	    		$('#startDate').datepicker({format:'yyyy-mm-dd'}).on('changeDate',function(){});
		    	$('#endDate').datepicker({format:'yyyy-mm-dd'}).on('changeDate',function(){});
		    	if($('.listData li').size() == 0){
		    		//初始化数据查询
		    		tuiJianList();
		    	};
		    	//搜索
		    	$('#cashSearch').unbind('click').click(function(){
		    		var startDate = $('#startDate').val();
		    		var endDate = $('#endDate').val();
		    		if(startDate == ''){
		    			utils.toast('开始时间不能为空');
		    			return;
		    		}
		    		if(endDate == ''){
		    			utils.toast('结束时间不能为空');
		    			return;
		    		}
		    		if(startDate>endDate){
		    			utils.toast('开始时间不能大于结束时间');
		    			return;
		    		}
		    		tuiJianList();
		    	});
	    	});
	    	
	    }
	});
	
}

// 推荐列表查询
function tuiJianList() {
	var begin = $("#startDate").val();
	var end = $("#endDate").val();
	//数据初始化
	var payData = [
	       	     {
	       	    	 key:'username',resolve:function(val, record){
	       	    		 return val;
	       	    	 }
	       	     }, {
	       	    	 key:'createTime',resolve:function(val, record){
	       	    		 return val;
	       	    	 }
	       	     }, {
	       	    	 key:'rewardMoney',resolve:function(val, record){
	       	    		if (val == null) {
	       	    			return '<span class="black">0</span>';	
	       	    		} else {
	       	    			return '<span class="black">'+utils.formatCurrency(val)+'</span>';
	       	    		}
	       	    		
	       	    	 }
	       	     }, {
	       	    	 key:'',resolve:function(val, record){
	       	    		 if (isEmployeeReferral != 2){
	       	    			 return "- -";
	       	    		 }
	       	    		 var a = $("<a href='javascript:;'>查看</a>");
	       	    		 a.click(function() {
	       	    			 // 查看推荐的好友投资详细信息
	       	    			 $(".tuijian-list").hide();
	       	    			 $(".investList").show();
	       	    			 $(".invest-listData").show();
	       	    			 $(".fanhui").css({"float":"right","dispaly":"block","color":"#87CEFA"});
	       	    			 $(".fanhui").show();
	       	    			 investRecordInit(record.username, record.userId);
	       	    		 });
	       	    		 return a;
	       	    	 }
	       	     }
       	];
	var param={'begin':begin,'end':end}; 
	oPage = null;
	oPage = new Page('front/friendManagerInit.do',param,$('.tuijian-list .listData'),$('.tuijian-list .paging'),payData,function(data){
		if (data.error != 0) {
			alert(data.msg);
			return;
		}
	});
}

function investRecordInit(username, userId) {
	$('#invest-startDate').datepicker({format:'yyyy-mm-dd'}).on('changeDate',function(){});
	$('#invest-endDate').datepicker({format:'yyyy-mm-dd'}).on('changeDate',function(){});
	var payData = [
        {
        	key:'borrowTitle',resolve:function(val,record){
        		var a =$('<a href="invest.html?id='+record.borrowId+'" title="'+val+'">'+strTitle(val)+'</a>');
        		return a;
        	}
        },
        {
        	key:'borrowWayName',resolve:function(val){
        		return val;
        	}
        },
        {
        	key:'annualRate',resolve:function(val,record){
        		return val+'%';
        	}
        },
        {
        	key:'deadline',resolve:function(val,record){
        		return getDeadLine(val,record.isDayThe);
        	}
        },
        {
        	key:'paymentMode',resolve:function(val){
        		return paymentMode(val);
        	}
        },
        {
        	key:'investAmount',resolve:function(val){
        		return '<span class="black">'+utils.formatCurrency(val)+'</span>';
        	}
        },
        {
        	key:'investTime',resolve:function(val){
        		return strTime(val);
        	}
        }
    ]
	
	var begin = '';
	var end = '';
	$('#investSearch').unbind('click').click(function(){
		begin = $("#invest-startDate").val();
		end = $("#invest-endDate").val();
		var param={'username':username,'userId':userId,'publishTimeStart':begin,'publishTimeEnd':end,'title':''};
		
		oPage = null;
		oPage = new Page('front/investRecordInit.do',param,$('.invest-listData1 .listData'),$('.invest-listData1 .paging'),payData,function(data){
			if (data.error != 0) {
				alert(data.msg);
				return;
			}
		});
	});
	
	$(".fanhui").click(function() {
		$('.tuiJianShow').hide();
		$('.tuijian-list').show();
    	$(".invest-list").hide();
    	$(".investList").hide();
    	$(".fanhui").hide();
		
		$('#startDate').datepicker({format:'yyyy-mm-dd'}).on('changeDate',function(){});
    	$('#endDate').datepicker({format:'yyyy-mm-dd'}).on('changeDate',function(){});
    	if($('.listData li').size() == 0){
    		//初始化数据查询
    		tuiJianList();
    	};
    	//搜索
    	$('#cashSearch').unbind('click').click(function(){
    		var startDate = $('#startDate').val();
    		var endDate = $('#endDate').val();
    		if(startDate == ''){
    			utils.toast('开始时间不能为空');
    			return;
    		}
    		if(endDate == ''){
    			utils.toast('结束时间不能为空');
    			return;
    		}
    		if(startDate>endDate){
    			utils.toast('开始时间不能大于结束时间');
    			return;
    		}
    		tuiJianList(startDate,endDate);
    	});
	});
	
	var param={'username':username,'userId':userId,'publishTimeStart':begin,'publishTimeEnd':end,'title':''};
	
	oPage = null;
	oPage = new Page('front/investRecordInit.do',param,$('.invest-listData1 .listData'),$('.invest-listData1 .paging'),payData,function(data){
		if (data.error != 0) {
			alert(data.msg);
			return;
		}
	});
}


//复制初始化
function clipboard(text,button,msg,parent) {
    if(window.clipboardData){        //for ie
        var copyBtn = document.getElementById(button);
        copyBtn.onclick = function(){
            window.clipboardData.setData('text',text);
            utils.alert(msg);
        }
    }else{
    	initclip(text);
    }
    return false;
}
//获取复制文本
function initclip(text) {
	var clip = new ZeroClipboard.Client();
	clip.setHandCursor( true );
	clip.addEventListener('mouseOver', function(){
		clip.setText( text );
	},false);
	clip.addEventListener('complete', function(){
		utils.alert('复制成功！');
	});
	clip.glue( 'tj-clip-btn' );
}
//安全中心
function initSafe(){
	//充值页面
	$.ajax({
	    url: 'safe.html',
	    type: "get",
	    dataType: "html",
	    contentType:contentType,
	    success: function (data) {
	    	$('.account-right').empty();
	    	$('.account-right').html(data);
	    	$('.account-content').hide();
	    	//获取安全信息
	    	utils.ajax({
	    		url:'front/safeCenterData.do',
	    		data:{},
	    		dataType:'json',
	    		success:function(record){
	    			if(record.error=='0'){
		    			//资料完善度
	    				var informationFinishedDgree = record.informationFinishedDgree;
	    				$('.safe-t-line em').css({'width':informationFinishedDgree+'%'});
	    				if(informationFinishedDgree=='30'){
	    					$('.safe-t-r').text('低');
	    				}else if(informationFinishedDgree=='50'){
	    					$('.safe-t-r').text('中');
	    				}else{
	    					$('.safe-t-r').text('高');
	    				}
	    				//登录密码
	    				$('#password-btn').click(function(){
	    					changePwd('login');
	    				})
	    				//交易密码
	    				var dealset = record.usermap.dealset;
	    				if(dealset == '1'){
	    					$('#dealpwd').text('设置').click(function(){
	    						changePwd('dealpwd');
	    					});
	    					$('#forgetpwd').remove();
	    				}else{
	    					$('#dealpwd').text('修改').click(function(){
	    						changePwd('dealpwd');
	    					});
	    				}
	    				//手机号码
	    				if(record.map.cellPhone ==''){
	    					$('#cellPhone').text('进行绑定');
	    					$('#cellPhone-text').text('请绑定手机号');
	    					$('#cellPhone-icon').attr('class','icon icon-wrong');
	    					$('#changePhone').hide();
	    				}else{
	    					$('#cellPhone').text('已绑定').addClass('on');
	    					$('#cellPhone-text').text(record.map.cellPhone);
	    					$('#changePhone').click(function(){
	    						changePhone(record.usermap.mobilePhone);
	    					})
	    				}
	    				//邮箱
	    				if(record.usermap.email ==''||record.usermap.email ==null){
	    					$('#email').text('进行绑定').click(function(){
	    						bindEmail();
	    					});
	    					$('#email-text').text('获取最新的投资讯息和账户信息变动通知');
	    					$('#email-icon').attr('class','icon icon-wrong');
	    				}else{
	    					$('#email-text').text(record.usermap.email);
	    					$('#email').text('已绑定').addClass('on');
	    				}
	    				//身份认证
	    				if(record.map.realName!=''){
	    					$('#realName-text').text(record.map.realName+'    '+record.map.idNo);
	    					$('#realName').text('已认证').addClass('on');
	    				}else{
	    					$('#realName-text').text('一旦实名认证通过将不能修改');
	    					$('#realName').text('去认证').click(function(){
	    						window.location.href="registpay.html";
	    					});
	    					$('#realName-icon').attr('class','icon icon-wrong');
	    				}
	    				$('.account-content').show();
	    			}else{
	    				utils.alert(record.msg);
	    			}
	    			
	    		}
	    	})
	    }
	});
}
//邮箱绑定
function bindEmail(){
	utils.Dialog(true);
	$('.bind-email').fadeIn();
	$('.bind-email .close').click(function(){
		$('.bind-email').hide();
		utils.Dialog();
	});
	//修改邮箱
	$('#email-submit').unbind('click').click(function(){
		var email = $('#addEmail').val();
		if(email == ''){
			utils.toast('邮箱不能为空');
			return;
		}
		if(!utils.isEmail(email)){
			utils.toast('请输入正确邮箱');
			return;
		}
		var param = {
				email:email
		};
		utils.ajax({
			url:'front/sendEmailForUserSet.do',
			data:JSON.stringify(param),
			dataType:'json',
			success:function(data){
				if(data.mailAddress=='0'){
		             utils.alert("邮箱不能为空");
		        }else if(data.mailAddress=='1'){
		        	utils.alert("该邮箱不存在");
		        }else if (data.mailAddress=='4'){
		        	utils.alert("该邮箱已被绑定,请重新输入");
		        }else if (data.mailAddress=='2'){
		        	utils.alert("绑定邮箱异常，请联系客服");
		        }else if (data.mailAddress=='3'){
		        	utils.alert("请求参数为空");
			    }else{
			    	utils.alert("邮件已经发送到你的邮箱,请<a href=http://"+data.mailAddress+"  target='_blank'><font color='green'> 登录</font></a>到你的邮箱验证");
		        }
			}
		})
	});
	
};
//修改绑定手机号
function changePhone(phone){
	utils.Dialog(true);
	$('.change-phone').fadeIn();
	$('.change-phone .close').click(function(){
		$('.change-phone').hide();
		utils.Dialog();
	});
	$('.change-phone .step1').show().siblings('.step2').hide();
	$('#oldPhoneNum').text(phone.substring(0,3)+'****'+phone.substring(7,11));
	$('#oldMobliePhoneCode').val('');
	clearInterval(utils.time);
	//获取原手机短信验证码
	$('#getMsgCodeOld').removeClass('disabled').text('获取验证码').unbind('click').click(function(){
		utils.getSmsCode($(this),phone,'oldMobileCode');
	});
	//验证原手机号码
	$('#phone-submit-one').unbind('click').click(function(){
		var oldMobileCode = $('#oldMobliePhoneCode').val();
		if($('#getMsgCodeOld').data('error')){
			utils.alert($('#getMsgCodeOld').data('error'));
			return;
		};
		if(!$('#getMsgCodeOld').data('randomCode')){
			utils.alert('请先获取原手机短信验证码！');
			return;
		};
		if(oldMobileCode == ''){
			utils.toast('原手机短信验证码不能为空');
			return;
		}
		var param = {
				code:oldMobileCode,
				type:'oldMobileCode'
		}
		utils.ajax({
			url:'checkMobilePhoneCode.do',
			data:JSON.stringify(param),
			success:function(data){
				if(data.error == '0'){
					$('.change-phone .step1').hide().siblings('.step2').show();
					changePhoneStepTwo();
				}else{
					utils.alert(data.msg);
				}
			}
		})
	})
}
//修改手机第二步
function changePhoneStepTwo(){
	clearInterval(utils.time);
	//获取短信验证码
	$('#getMsgCode').removeClass('disabled').text('获取验证码').unbind('click').click(function(){
		utils.getSmsCode($(this),$('#newMobliePhone').val(),'updateMobileCode');
	})
	$('#phone-submit').unbind('click').click(function(){
		var mobile = $('#newMobliePhone').val();
		var updateMobileCode = $('#newMobliePhoneCode').val();
		
		if(mobile == ''){
			utils.toast('新手机号码不能为空');
			return;
		}
		if(utils.isPhone(mobile)){
			utils.toast('请填写正确的手机号码');
			return;
		}
		if($('#getMsgCode').data('error')){
			utils.alert($('#getMsgCode').data('error'));
			return;
		};
		if(!$('#getMsgCode').data('randomCode')){
			utils.alert('请获取新手机短信验证码！');
			return;
		};
		if(updateMobileCode == ''){
			utils.toast('新手机短信验证码不能为空');
			return;
		}
		var param = {
				mobile:mobile,
				updateMobileCode:updateMobileCode
		}
		utils.ajax({
			url:'front/updateBindingMobile.do',
			data:JSON.stringify(param),
			dataType:'json',
			success:function(data){
				if(data.error == '0'){
					$('.change-phone .popup-from').hide().siblings('.popup-result').show();
					$('#phone-submit-success').click(function(){
						utils.Storage.clear();
						window.location.href='login.html';
					})
				}else{
					utils.alert(data.msg);
				}
				
			}
		});
	})
}
//修改登录交易密码
function changePwd(type){
	utils.Dialog(true);
	$('.change-pwd').fadeIn();
	$('.change-pwd .close').click(function(){
		$('.change-pwd').hide();
		utils.Dialog();
	});
	$('#oldPassword').val("");
	$('#newPassword').val("");
	$('#confirmPassword').val("");
	//修改登录密码
	$('#pwd-submit').unbind('click').click(function(){
		changePwdSubmit(type);
	});
}
function changePwdSubmit(type){
	var oldPassword = $('#oldPassword').val();
	var newPassword = $('#newPassword').val();
	var confirmPassword = $('#confirmPassword').val();
	if(oldPassword == ''){
		utils.toast('原始密码不能为空');
		return;
	}
	if(newPassword == '' || newPassword.length<6){
		utils.toast('密码长度必须为6-20个字符');
		return;
	}
	if(confirmPassword == ''){
		utils.toast('确认密码不能为空');
		return;
	}
	if(oldPassword == newPassword){
		utils.toast('新密码与原始密码一致');
		return;
	}
	if(newPassword != confirmPassword){
		utils.toast('两次密码输入不一致');
		return;
	}
	var param = {
			oldPassword:oldPassword,
			newPassword:newPassword,
			confirmPassword:confirmPassword,
			type:type
	};
	$('#pwd-submit').addClass('disabled').text('提交中...').unbind('click');
	//修改登录密码
	utils.ajax({
		url:'front/changeLoginPassword.do',
		data:JSON.stringify(param),
		dataType:'json',
		success:function(data){
			$('#pwd-submit').removeClass('disabled').text('确认').bind('click',function(){
				changePwdSubmit(type);
			});
			if (data == 1) {
				utils.alert("两次密码输入不一致");
				return;
			} else if (data == 2) {
				utils.alert("旧密码错误");
				return;
			} else if (data == 3) {
				utils.alert("新密码修改失败");
				return;
			} else if (data == 4) {
				utils.alert("密码长度输入错误,密码长度范围为6-20");
				return;
			} else if (data == 5) {
				utils.alert("*修改失败！你的账号出现异常，请速与管理员联系！");
				return;
			} else if (data == 6) {
				utils.alert("登录密码不能和交易密码一样！");
				return;
			} else if (data == 7) {
				utils.alert("交易密码不能和登录密码一样！");
				return;
			} else if (data == 8) {
				utils.alert("修改登录密码异常，请与客服联系解决！");
				return;
			} else {
				$('.change-pwd .popup-from').hide().siblings('.popup-result').show();
				$('#submit-success').click(function(){
					window.location.reload();
				})
			}
		}
	})	

}
//我的银行卡
function initMyDebitCard() {
	$.ajax({
	    url: 'debitCard.html',
	    type: "get",
	    dataType: "html",
	    contentType:contentType,
	    success: function (data) {
	    	$('.account-right').empty();
	    	$('.account-right').html(data);
	    	// 查询数据库中银行卡信息
	    	var param={uid:utils.Storage.getItem('uid')};
			utils.ajax({
				url:'front/queryBankList.do',
				data:JSON.stringify(param),
				dataType:'json',
				success: function(data){
	        	if(data.error =='0'){
	        		var cards = $("#myDebitCard");
	        		for (var i = 0; i < data.bankList.length; i++) {
	        			// 银行卡项 
	        			var item = data.bankList[i];
	        			var cardColor = 'bank-card_1';
	        			if (i % 2 != 0) {
	        				cardColor = 'bank-card_2';
	        			}
	        			// 卡号 
	        			var cardNo1 = item.cardNo.substr(0,4);
	        			var cardNo2 = item.cardNo.substr(item.cardNo.length - 4,item.cardNo.length - 1);
	        			var cardUserName = item.cardUserName.substr(1, item.cardUserName.length - 1);
	        			var card = 
	        				$('<div id="card1" class="'+ cardColor +'">' +
	        					'<div class="bank-top">' +
		        					/*'<div class="bank-cardLogo"></div>' +*/
		        					'<div class="bank-cardTitle">'+ item.bankName +'</div>' +
		        					'<div class="bank-cardType">储蓄卡</div>' +
		        				'</div>' +
		        				'<div class="bank-center">' +
		        					/*'<div class="bank-empty"></div>' +*/
		        					'<div class="bank-cardNumber">'+ cardNo1 +' **** **** '+ cardNo2 +'</div>' +
		        					'<div class="bank-userName">*'+ cardUserName +'</div>' +
		        				'</div>' +
	        				'</div>');
	        			card.appendTo(cards);
	        		}
	        		// 循环完银行卡后显示添加银行卡
	        		var cards = $("#myDebitCard");
	        		// 添加银行卡对象
	        		var card = 
        				$('<div id="card3" class="bank-card_3" onclick="addCard();" style="cursor:pointer;">'+
    						'<div class="bank-addCard"><a href="javascript:;" >添加银行卡</a></div>'+
    					'</div>');
        			card.appendTo(cards);
	        		
	        	}else if(data.error =='4'){
	        		// 循环完银行卡后显示添加银行卡
	        		var cards = $("#myDebitCard");
	        		// 添加银行卡对象
	        		var card = 
        				$('<div id="card3" class="bank-card_3" onclick="addCard();" style="cursor:pointer;">'+
    						'<div class="bank-addCard"><a href="javascript:;" >添加银行卡</a></div>'+
    					'</div>');
        			card.appendTo(cards);
	        	}else{
	        		utils.alert(data.msg);
	        	}
	        }
    })
	    	
	    }
	});
}
//添加银行卡
function addCard(){
	var param={uid:utils.Storage.getItem('uid')};
	utils.ajax({
        url:'front/addBankInfo.do',
        data:JSON.stringify(param),
        dataType:'json',
        success: function(data){
        	if(data.error == '0'){
        		$('#myDebitCard').empty().html(data.html);
        	}else if(data.msg=='请先注册汇付'){
        		utils.alert(data.msg,function(){
        			window.location.href="registpay.html";
        		});
        	}else{
        		utils.alert(data.msg);
        	}
        }
    })
}
//消息中心
function initMsgCenters(){
	$.ajax({
		url: 'msgCenters.html',
		type: "get",
		dataType: "html",
		contentType:contentType,
		success: function (data) {
			$('.account-right').empty();
			$('.account-right').html(data);
			initMsgData();
		}
	});
}
//消息列表初始化
function initMsgData(){
	//数据初始化
	var payData = [
	       	     {
	       	    	 key:'',resolve:function(val, record){
	       	    		 var check;
	       	    		 if (record.mailStatus == '已读'){
	       	    			 check = $('<input class="check" type="checkbox" value="'+ record.id +'" name="sysMail" />');
	       	    		 } else {
	       	    			 check = $('<input type="checkbox" value="'+ record.id +'" name="sysMail" />');
	       	    		 }
	       	    		 return check;
	       	    	 }
	       	     },
	       	     {
	       	    	 key:'',resolve:function(val){
	       	    		 return '系统消息';
	       	    	 }
	       	     },
	       	     {
	       	    	 key:'mailTitle',resolve:function(val,record,index){
	       	    		 var data;
	       	    		 if (record.mailStatus == '已读'){
	       	    			 data = $("<a href='javascript:;' style='color: #c0c0c0;'>" + val + "</a>");
	       	    		 } else {
	       	    			 data = $("<a href='javascript:;' style='color: #333;'>" + val + "</a>");
	       	    		 }
	       	    		data.click(function(){
	       	    			initMsgxq(record.id);
	       	    		})
	       	    		return data;
	       	    	 }
	       	     },
	       	     {			
	       	    	 key:'sendTime',resolve:function(val){
//	       	    		 var date = new Date(val.time);
	       	    		 return strTime(val);
	       	    	 }
	       	     }
       	];
	var app = "app";
	var param={app:app};
	oPage = null;
	oPage = new Page('front/querySysMails2.do',param,$('.msg-list.listData'),$('.paging'),payData,function(){});
	
}
//合同查询
function initHeTong(){
	$.ajax({
		url: 'hetong.html',
		type: "get",
		dataType: "html",
		contentType:contentType,
		success: function (data) {
			$('.account-right').empty();
			$('.account-right').html(data);
			
			$('#hetong-startDate').datepicker({format:'yyyy-mm-dd'}).on('changeDate',function(){});
			$('#hetong-endDate').datepicker({format:'yyyy-mm-dd'}).on('changeDate',function(){});
			heTongData();
			$('#hetongSearch').unbind('click').click(function(){
				heTongData();
			})
		}
	});
}
//合同查询
function heTongData() {
	var begin = $("#hetong-startDate").val();
	var end = $("#hetong-endDate").val();
	//数据初始化
	var payData = [
	       	     {
	       	    	 key:'borrower',resolve:function(val, record){
	       	    		 return val;
	       	    	 }
	       	     }, {
	       	    	 key:'borrowTitle',resolve:function(val, record){
	       	    		 return val;
	       	    	 }
	       	     }, {
	       	    	 key:'borrowWayName',resolve:function(val, record){
	       	    		 return val;
	       	    	 }
	       	     }, {
	       	    	 key:'paymentMode',resolve:function(val, record){
	       	    		 if (val == "1") {
	       	    			 return "按月等额本息还款";
	       	    		 } else if (val == "2") {
	       	    			 return "按先息后本还款";
	       	    		 } else if (val == "4") {
	       	    			 return "一次性还款";
	       	    		 }
	       	    	 }
	       	     }, {
	       	    	 key:'schedules',resolve:function(val, record){
	       	    		 return val;
	       	    	 }
	       	     }, {
	       	    	 key:'annualRate',resolve:function(val, record){
	       	    		 return val;
	       	    	 }
	       	     }, {
	       	    	 key:'deadline',resolve:function(val, record){
	       	    		 return val + "个月";
	       	    	 }
	       	     }, {
	       	    	 key:'publishTime',resolve:function(val, record){
	       	    		 return strTime(val);
	       	    	 }
	       	     }, {
	       	    	 key:'download_url',resolve:function(val, record){
	       	    		 return "<a href="+ val +" target=“_blank”>查看</a>";
	       	    	 }
	       	     }
       	];
	var param={"publishTimeStart":begin, "publishTimeEnd":end};
	oPage = new Page('app/queryHeTongList2.do',param,$('.listData'),$('.paging'),payData,function(data){
		if (data.error != 0) {
			alert(data.msg);
			return;
		}
	});
	
}
// 日期转换
function timeToStr(time) {   
      var year = time.getFullYear();  
      var month = time.getMonth() + 1;  //月  
      var day = time.getDate();         //日  
      var hh = time.getHours();       //时  
      var mm = time.getMinutes();    //分  
      var str= year + "-";  
      if(month < 10) {
    	  str+= "0" + month + "-";
      } else {
    	  str+= month + "-";
      }
      if(day < 10) {
          str+= "0" + day;
      } else {
    	  str+= day;
      }
      str+= " " + hh + ":" + (mm < 10 ? "0"+mm : mm);
     return(str);   
 } 

// 消息详情
function initMsgxq(id) {
	$.ajax({
		url: 'msgxq.html',
		type: "get",
		dataType: "html",
		contentType:contentType,
		success: function (data) {
			$('.account-right').empty();
			$('.account-right').html(data);
			$(".msgPerson").hide();
			initMsgxq2(id);
		}
	});
}
function initMsgxq2(id) {
	utils.ajax({
		url: "front/queryEmailById2.do?mailId="+id+"&type=1",
		dataType: "json",
		success: function (data) {
			$(".msgPerson").show();
			$(".msgTitle").html(data.msgTitle);
			$(".msgContent").html(data.msgContent);
			$(".msgTime").html(data.msgTime);
		}
	});
}
// 选中已读
function checkAll_Sys(e){
	if(e.checked){
		$("input[name='sysMail']").attr("checked","checked");
	}else{
		$("input[name='sysMail']").attr("checked",false);
	}
}
// 删除选中已读
function deleteMsg (obj) {
	$("#deleteMsg").attr("disabled",true);
	var stIdArray = [];
	$("input[name='sysMail']:checked").each(function(){
		stIdArray.push($(this).val());
	});
	if(stIdArray.length == 0){
		alert("请选择需要删除的内容");
		$("#deleteMsg").attr("disabled",false);
		return ;
	}
	if(!window.confirm("确定要删除吗?")){
	  $("#deleteMsg").attr("disabled",false);
		return;
	}
	var ids = stIdArray.join(",");
	$.ajax({
		url: "front/deleteSysMails2.do",
		type: "get",
		data: {ids:ids},
		dataType: "json",
		contentType: contentType,
		success: function (data) {
			if(data.error == '0') {
				initMsgCenters();
			} else {
				utils.alert(data.msg);
			}
			$("#deleteMsg").attr("disabled",false);
		}
	});
}

function readedSys(){
    $("#readedSys").attr("disabled",true);	
	var stIdArray = [];
	$("input[name='sysMail']:checked").each(function(){
		stIdArray.push($(this).val());
	});
	if(stIdArray.length == 0){
		alert("请选择要标记的内容");
		$("#readedSys").attr("disabled",false);
		return ;
	}
	if(!window.confirm("确定要将所选邮件标记为已读吗?")){
		 $("#readedSys").attr("disabled",false);
		return;
	}
	var ids = stIdArray.join(",");
	var param = {};
	param["paramMap.ids"] = ids;
	param["paramMap.type"]="readed";
	$.ajax({
		url: "front/updateSys2Readed2.do",
		type: "get",
		data: param,
		dataType: "json",
		contentType: contentType,
		success: function (data) {
			if(data.error == '0') {
				initMsgCenters();
			} else {
				utils.alert(data.msg);
			}
			$("#readedSys").attr("disabled",false);
		}
	});
}

function unReadSys(){
   $("#unReadSys").attr("disabled",true);
	var stIdArray = [];
	$("input[name='sysMail']:checked").each(function(){
		stIdArray.push($(this).val());
	});
	if(stIdArray.length == 0){
		alert("请选择要标记的内容");
		$("#unReadSys").attr("disabled",false);
		return ;
	}
	if(!window.confirm("确定要将所选邮件标记为未读吗?")){
    	$("#unReadSys").attr("disabled",false);
		return;
	}
	var ids = stIdArray.join(",");
	var param = {};
	param["paramMap.ids"] = ids;
	param["paramMap.type"]="unread";
	$.ajax({
		url: "front/updateSys2UNReaded2.do",
		type: "get",
		data: param,
		dataType: "json",
		contentType: contentType,
		success: function (data) {
			if(data.error == '0') {
				initMsgCenters();
			} else {
				utils.alert(data.msg);
			}
			$("#unReadSys").attr("disabled",false);
		}
	});
}



































































































function weixin1() {
	$("#weixin").attr("style","background:url('src/images/wechart.jpg')left top /100% no-repeat;");
}

function weixin2() {
	$("#weixin").attr("style","background-position:left -1705px;");
}