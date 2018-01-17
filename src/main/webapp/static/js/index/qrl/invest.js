var taste = false,
	proTypeId,//标的Id
	timeInterval,
	isTiyan=false,
	//标的详情
	productDetail,
	//用户信息
	userMap,
	//是否新手标
	isNewsPro,
	//是否设有投标密码
	hasPWD,
	//优惠券
	mapListCd,
	//可用余额
	canUseSum,
	inputMoney,//当前投标金额
	minvoucherAmt = 99,//优惠券最低使用金额
	voucherChose =false,//是否显示优惠券
	voucherAmt = 0,//优惠券金额
	voucherId = '',//卷id
	redmoneytype='',
	cantVoucher=false,//优惠券是否可操作
	//体验金额
	tiYanAmt,
	//相关文件
	fileList = [],
	//其他资料
	imgList = [];
$(function(){
	//页面初始化
	utils.initPage();
	//标的详情初始化
	proTypeId = utils.getUrlParam('id');
	if(proTypeId=='1'){
		taste = true;//体验标进度条
		isTiyan = true;
		var url = 'front/experBorrowInit.do';
		var param={uid:utils.Storage.getItem('uid')};
	}else{
		if(utils.Storage.getItem('uid')){
			var param={uid:utils.Storage.getItem('uid'),borrowId:proTypeId};
		}else{
			var param={uid:'',borrowId:proTypeId};
		}
		var url = 'front/queryBorrowDetail.do';
	}
	utils.ajax({
        url:url,
        data:JSON.stringify(param),
        dataType:'json',
        success: function(data){
        	if(data.error == '0'){
        		if(isTiyan){
        			productDetail = data;
        			userMap = data.userMap;
        			tiYanAmt = data.accountSum;
        			canUseSum = data.userMap.accountSum;//可用余额
        			if(data.residue == '0.00'){
//        				utils.alert('当前体验标的金额已投满，请等待下次体验标发放时间进行投资。');
        				utils.alert('当前新手标的金额已投满，请等待下次新手标发放时间进行投资。');
        			};
        			$('.sub-about').remove();
        			$(".line").hide();
        			$(".title_amt").text("已募集总金额");
        		}else{
        			productDetail = data;
        			if(data.userMap){
        				userMap = data.userMap;
        				hasPWD = data.hasPWD;
        				mapListCd = data.mapListCd;
        				canUseSum = data.userMap.usableSum;//可用余额
        			}
        		};
        		//是否为新手标
        		if(productDetail.borrowTypeSubId == 5){
        			isNewsPro = true;
        			if(data.investRecord && data.investRecord=='0'){
	        			productDetail.borrowStatus = '99';
	        		}
        		};
        		//体验标投资判断
        		if(isTiyan && canUseSum == 0){
        			productDetail.borrowStatus = '99';
    			};
    			//非体验标进入倒计时
    			if(!isTiyan){
	    			if(productDetail.borrowStatus == '2'){
	    				initFundTime();
	    			}
    			};
    			//初始化投标按钮状态
    			setBtnStatus(productDetail.borrowStatus);
    			//优惠券
    			var select = $('#selectQuan');
    			if(!isTiyan && data.userMap){
    				var quanLength = mapListCd.length;
    				if(quanLength>0){
    					$('<option value="0">请选择优惠券</option>').appendTo(select);
    					for(var i = 0;i<quanLength;i++){
    						$('<option value="'+mapListCd[i].money+'" data-id="'+mapListCd[i].id+'" data-name="'+mapListCd[i].redmoneytype+'">'+mapListCd[i].rbName+'</option>').appendTo(select);
    					}
    				}else{
    					$('<option value="0">当前没有可用的优惠券</option>').appendTo(select);
    				}
    			}else{
    				select.remove();
    			}
    			select.click(function(){
    				if(!cantVoucher){
    					utils.toast('请先输入投资金额');
    					return false;
    				}
    			})
    			select.change(function(){
    				voucherAmt = this.value;
    				voucherId = $(this).children('option:selected').data('id');
    				redmoneytype=$(this).children('option:selected').data('name');
    				reckon();
    			});


    			//初始化数据
    			initData();
        	}else if(data.error == 1){
        		utils.alert(data.msg,function(){
        			window.location.href='registpay.html';
        		});
        	}else{
        		utils.alert(data.msg,function(){
        			window.location.href='index.html';
        		});
        	}
        }

    });


});
//错误提示
function showError(msg,obj){
	$('.error-msg').text(msg).addClass('show');
	obj.parent('.from').addClass('error');
	obj.focus(function(){
		obj.parent('.from').removeClass('error');
		$('.error-msg').removeClass('show');
	});
};
//设置投标按钮状态
function setBtnStatus(borrow){
	if(borrow == 1){
		$('#investBtn').text('初审中');
	}else if(borrow == 2){
		$('#investBtn').text('立即投标').removeClass('disabled');
	}else if(borrow == 3){
		$('#investBtn').text('复审中');
	}else if(borrow == 4){
		$('#investBtn').text('还款中');
	}else if(borrow == 5){
		$('#investBtn').text('已还完');
	}else if(borrow == 99){
		$('#investBtn').text('已投资');
	}else{
		$('#investBtn').text('立即投标');
	}
};
//投标倒计时
function initFundTime(){
	clearInterval(timeInterval);
	var didTime = productDetail.bidTime.replace(/-/g,'/');
	var everTime = productDetail.nowDate.replace(/-/g,'/');
	var EndTime= new Date(didTime);
	var NowTime = new Date(everTime);
	var t =EndTime.getTime() - NowTime.getTime();
	if(t>0){
		productDetail.borrowStatus = 100;
	};
	timeInterval = setInterval(function(){
		t = t-1000;
	    var d=0;
	    var h=0;
	    var m=0;
	    var s=0;
	    if(t>0){
	      d=Math.floor(t/1000/60/60/24);
	      h=Math.floor(t/1000/60/60%24);
	      m=Math.floor(t/1000/60%60);
	      s=Math.floor(t/1000%60);
	      $('#investBtn').text(d+'天'+h+'时'+m+'分'+s+'秒');
	    }else{
	      $('#investBtn').text('立即投标');
	      productDetail.borrowStatus = 2;
	      clearInterval(timeInterval);
	    }
	},1000);
 };
 //初始化页面数据
function initData(){
	//标的类型
	$('#borrowWayName').text(productDetail.borrowWayName);
	//标的名称
	$('#borrowTitle').text(productDetail.borrowTitle);
	//年化
	$("#rate").text(productDetail.showRate);
	//期限
	if(isTiyan || productDetail.isDayThe == 2){
		$("#date").html('<span >'+productDetail.deadline+'</span>天');
	}else{
		$("#date").html('<span >'+productDetail.deadline+'</span>个月');
	};
	//金额
	$("#amt").text(productDetail.borrowAmount);
	//还款方式
	paymentMode(productDetail.paymentMode);
	//总投标数
	$('#investNum').text(productDetail.investNum);
	//最小投标金额
	$('#minTenderedSum').text(productDetail.minTenderedSum+'元');
	//最大投标金额
	if(productDetail.borrowWayName == '新手标'){
		var maxTenderedSum = productDetail.maxTenderedSum;
	}else{
		var maxTenderedSum = productDetail.maxTenderedSum;
	}
	
	$('#maxTenderedSum').text(maxTenderedSum>0?maxTenderedSum+'元':'无限制');
	//投资进度

	$('.progress-text').text(productDetail.schedules+'%');
	//发标时间
	$('#publishTime').text(productDetail.bidTime);
	//剩余可投
	$('#investAmount').text(productDetail.residue+'元');

	//可用余额
	if(productDetail.userMap){
		$('#canUseSum').text(canUseSum+'元');
		$('.subject-login').remove();
		//全部投资
		$('#pushAll').click(function(){
			pushAll(productDetail.residue,canUseSum);
		})
	}else{
		$('#canUseSum').text('登录后可显示余额');
		$('.subject-login').click(function(){
			window.location.href='login.html?href=invest&id='+proTypeId;
		})
	}
	//投标
	$('#investBtn').unbind('click').bind('click',function(){
		submit();
	});
	//项目详情相关
	//项目名称
	$('#projectTitle').text(productDetail.borrowTitle);
	//募集资金
	$('#projectAmount').text(productDetail.borrowAmount+'元');
	//项目预期收益
	$('#projectRate').text(productDetail.annualRate+'%');
	//资金用途
	$('#moneyPurposes').html(productDetail.purpose);
	//收益方式
	$('#projectType').html($('#paymentMode').text());
	//还款来源
	$('#retsource').html(productDetail.retsource);
	//项目介绍
	$('#projectIntro').html(productDetail.projectIntro);
	//项目描述
	$('#projectDetail').html(productDetail.detail);
	//保障措施
	$('#safeMeasures').html(productDetail.safeMeasures);
	//收益计算器
	var calculatorMode = '';
	if(productDetail.paymentMode == '4'){
		calculatorMode = '2';
	}else if(productDetail.paymentMode == '1'){
		calculatorMode = '1';
	}else{
		calculatorMode = '3';
	}
	$('#calculator').attr('href','calculator.html?repayWay='+calculatorMode+'&showRate='+productDetail.showRate+'&time='+productDetail.deadline);
	//显示项目详情
	$('#project').show();


	$('.subject-submit-l').fadeIn();
	$('.subject-submit-r').fadeIn();
	$('.progress em').animate({'width':productDetail.schedules+'%'},2000);
	//还款计划
	if(productDetail.borrowStatus == '4' || productDetail.borrowStatus == '5'){
		$('.sub-a-nav .plan').show();
	}
	var ev = utils.getUrlParam('ev');
	if(ev){
		$('#'+ev).click();
	}
};
//获取还款方式
function paymentMode(val){
	if(val==4){
		$('#paymentMode').text(' 一次性还款');
	}else if(val==1){
		$('#paymentMode').text('等额本息');
	}else{
		$('#paymentMode').text('按月付息，到期还本');
	}
};
//全部投资
function pushAll(can,user){
	var canAmt = parseFloat(can.replace(',',''));
	var canUser = parseFloat(user.toString().replace(',',''));
	var Amt = canAmt>canUser?canUser:canAmt;
	$('#amount').val(Amt);
	if(Amt>minvoucherAmt)cantVoucher = true;
	reckon();
};
//金额输入框事件绑定
function focusblur(obj){
	var amount = $(obj).val();
	
	proTypeId = utils.getUrlParam('id');
	if(proTypeId=='1'){
		taste = true;//体验标进度条
		isTiyan = true;
		var url = 'front/experBorrowInit.do';
		var param={uid:utils.Storage.getItem('uid')};
	}else{
		if(utils.Storage.getItem('uid')){
			var param={uid:utils.Storage.getItem('uid'),borrowId:proTypeId,money:amount};
		}else{
			var param={uid:'',borrowId:proTypeId};
		}
		var url = 'front/queryBorrowDetail.do';
	}
	utils.ajax({
        url:url,
        data:JSON.stringify(param),
        dataType:'json',
        success: function(data){
        	if(data.error == '0'){
        		if(isTiyan){
        			productDetail = data;
        			userMap = data.userMap;
        			tiYanAmt = data.accountSum;
        			canUseSum = data.userMap.accountSum;//可用余额
        			if(data.residue == '0.00'){
//        				utils.alert('当前体验标的金额已投满，请等待下次体验标发放时间进行投资。');
        				utils.alert('当前新手标的金额已投满，请等待下次新手标发放时间进行投资。');
        			};
        			$('.sub-about').remove();
        			$(".line").hide();
        			$(".title_amt").text("已募集总金额");
        		}else{
        			productDetail = data;
        			if(data.userMap){
        				userMap = data.userMap;
        				hasPWD = data.hasPWD;
        				mapListCd = data.mapListCd2;
        				canUseSum = data.userMap.usableSum;//可用余额
        			}
        		};
        		//是否为新手标
        		if(productDetail.borrowTypeSubId == 5){
        			isNewsPro = true;
        			if(data.investRecord && data.investRecord=='0'){
	        			productDetail.borrowStatus = '99';
	        		}
        		};
        		//体验标投资判断
        		if(isTiyan && canUseSum == 0){
        			productDetail.borrowStatus = '99';
    			};
    			//非体验标进入倒计时
    			if(!isTiyan){
	    			if(productDetail.borrowStatus == '2'){
	    				initFundTime();
	    			}
    			};
    			//初始化投标按钮状态
    			setBtnStatus(productDetail.borrowStatus);
    			//优惠券
    			var select = $('#selectQuan');
    			if(!isTiyan && data.userMap){
    				var quanLength = mapListCd.length;
    				if(quanLength>0){
    					$("#selectQuan").empty();
    					$('<option value="0">请选择优惠券</option>').appendTo(select);
    					for(var i = 0;i<quanLength;i++){
    						$('<option value="'+mapListCd[i].money+'" data-id="'+mapListCd[i].id+'" data-name="'+mapListCd[i].redmoneytype+'">'+mapListCd[i].rbName+'</option>').appendTo(select);
    					}
    				}else{
    					$("#selectQuan").empty();
    					$('<option value="0">当前没有可用的优惠券</option>').appendTo(select);
    				}
    			}else{
    				select.remove();
    			}
    			select.click(function(){
    				if(!cantVoucher){
    					utils.toast('请先输入投资金额');
    					return false;
    				}
    			})
    			select.change(function(){
    				voucherAmt = this.value;
    				voucherId = $(this).children('option:selected').data('id');
    				redmoneytype=$(this).children('option:selected').data('name');
    				reckon();
    			});


    			//初始化数据
    			initData();
        	}else if(data.error == 1){
        		utils.alert(data.msg,function(){
        			window.location.href='index.html';
        		});
        	}else{
        		utils.alert(data.msg,function(){
        			window.location.href='index.html';
        		});
        	}
        }

    });
	
    if(isNaN(amount)||amount<0||amount==""){//当没有填写金额时
    	utils.toast("请输入正确的投资金额！");
    	return;
	}
	var datePattern = /^(([1-9]\d{0,9})|0)(\.\d{1,2})?$/;
	if(!datePattern.test(amount)) {
		$(obj).val(amount.substring(0,amount.indexOf('.')+3));
//		utils.toast("请输入正确的投资金额！最多保留小数点后两位");
//		return;
	}
	//最小投资金额
	var minTendSum = productDetail.minTenderedSum;
	minTendSum = parseFloat(minTendSum.toString().replace(/,/g,""));
	//剩余可投金额
	
	var residue = productDetail.residue;
	residue = parseFloat(residue.toString().replace(/,/g,""));
	//当前输入金额
	var inputMoney = parseFloat(amount);
	if(residue>minTendSum){
		//当前输入金额60
		if(inputMoney < minTendSum){
			utils.toast('投资金额不能小于最小投资金额');
			return;
		}
	};
};
//计算收益
function reckon(){
	var value = $("#amount").val();
	
	if(value == '')return;
	if(value && value>minvoucherAmt){
		$('#selectQuan').attr('disabled',false);
		cantVoucher = true;
	}else{
		$('#selectQuan').attr('disabled',true);
		cantVoucher = false;
	};
	var isDayThe=productDetail.isDayThe;
	if(productDetail && !isNaN(value)){
		if(isDayThe==1){
			if(isTiyan){
				var moeny = (productDetail.annualRate/1200) * (productDetail.deadline/30) * canUseSum;
			}else{
				var moeny = (productDetail.annualRate/1200) * productDetail.deadline * value;
				var addInterestMoeny=0.00;
				if(voucherAmt>0){
					if(redmoneytype=='3'){
						//加息劵加息计算
						addInterestMoeny= (voucherAmt/1200) * productDetail.deadline * value;
					}else{
						//代金券收益计算
						 moeny = (productDetail.annualRate/1200) * productDetail.deadline * (parseFloat(value)+parseFloat(voucherAmt));
					}
				}
			};
		}else{
			//天标利息计算 
			var rate=productDetail.annualRate/100*1/12;
			var moeny=(parseFloat(value)+parseFloat(voucherAmt)) * rate * productDetail.deadline / 30;
			var addInterestMoeny=0.00;
			if(redmoneytype=='3'){
				//天标加息劵加息计算
				addInterestMoeny=(parseFloat(value)) * (voucherAmt/100*1/12) * productDetail.deadline / 30;
			}
		}
		$('#reckon').text(moeny.toFixed(2));
		$('#increase').text(addInterestMoeny.toFixed(2));
		if(addInterestMoeny>0){
			$("#increaseP").show();
		}else{
			$("#increaseP").hide();
		}
		
	}else{
		$('#reckon').text('0.00');
		$('#increase').text('0.00');
	}
}


//投标
function submit(){
	var Amount = $('#amount').val();
	var status = productDetail.borrowStatus;
	if(status == '100'){
		utils.toast('还没到投标时间！请耐心等待！');
		return;
	}
	if(status!=2){return};
	if(!productDetail.userMap){
		utils.alert('您还未登录，请先登录！',function(){
			window.location.href=utils.getBasePath()+'login.html?href=invest&id='+proTypeId;
		});
		return;
	};
	if(parseFloat(canUseSum) == 0){
		utils.confirm('您当前可用余额为0，如需继续投资，请充值!', function () {
			if(!utils.Storage.getItem('ipayAccount')){
				utils.alert('您还未注册汇付天下，请先注册汇付天下！',function(){
					window.location.href='registpay.html';
				});
			}else{
				window.location.href='account.html#ipay';
			}
	     });
		return;
	}
	if(Amount == ''){
		utils.toast('请输入投资金额');
		return;
	}
	if(utils.isMoney(Amount)){
		utils.toast('金额格式不正确');
		return;
	}
	if(!isTiyan && parseFloat(canUseSum) < parseFloat(Amount)){
		utils.toast('投资金额不能大于可用金额');
		return;
	}
	//当前金额
	inputMoney = parseFloat(Amount);

	//剩余可投金额
	var residue = parseFloat(productDetail.residue.toString().replace(/,/g,''));
	//最小投资金额
	var minTendSum = parseFloat(productDetail.minTenderedSum.toString().replace(/,/g,''));
	//最大投资金额
	var maxTenderedSum = productDetail.maxTenderedSum>0?parseFloat(productDetail.maxTenderedSum.toString().replace(/,/g,'')):9999999999;
	//投资总额 = 当前金额 +优惠券金额
	var investAmt = parseFloat(inputMoney);
	if(redmoneytype!='3'){
		investAmt+= parseFloat(voucherAmt);
	}
	//剩余可投金额小于
	if(investAmt > residue){
		utils.toast('投资金额不能大于剩余可投金额');
		return;
	};
	//剩余可投50>最小投资100
	if(residue>minTendSum){
		//当前输入金额60
		if(inputMoney < minTendSum){
			utils.toast('投资金额不能小于最小投资金额');
			return;
		}
	};
	if(parseFloat(inputMoney)>maxTenderedSum){
		utils.toast('投资金额不能大于最大投资金额');
		return;
	};
	var password = '';
	if(hasPWD > 0){
		utils.Dialog(true);
		$('.hasPWD').fadeIn();
		$('#password').val('');
		$('.hasPWD .close').click(function(){
			$('.hasPWD').hide();
			utils.Dialog();
		});
		$('#haspwd-submit').unbind('click').click(function(){
			ajaxSubmit();
		})
	}else{
		ajaxSubmit();
	}
};
//提交
function ajaxSubmit(){
	password = $('#password').val()
	if(hasPWD >0 && password == ''){
		utils.toast('请输入投资密码');
		return;
	};
	var url = '';
	if(isTiyan){
		url = 'front/exGoInvest.do';
	
		var param = {id:proTypeId,investAmount:productDetail.residue,amount:userMap.accountSum,borrowSum:productDetail.borrowSum,
				yearRate:productDetail.showRate,borrowTime:productDetail.deadline}
	}else{
		url = 'front/financeInvest.do';
		var param = {borrowId:proTypeId,amount:inputMoney,money:voucherAmt,juanId:voucherId,hasPwd:hasPWD,investPWD:password,borrowTitle:encodeURI(productDetail.borrowTitle),ipayAccount:productDetail.ipayAccount,borrowTypeSubId:productDetail.borrowTypeSubId,deadline:productDetail.deadline}
	};
	if(hasPWD > 0){
		$('#haspwd-submit').unbind('click').addClass('disabled').text('投标中...');
	}else{
		$('#investBtn').addClass('disabled').text('投标中...').unbind('click');
	}
	utils.ajax({
		url:url,
		data:JSON.stringify(param),
		dataType:'json',
		success: function(data){
			if(data.error=='0'){
				if(isTiyan){
					utils.alert('投标成功！',function(){
						window.location.href='index.html';
					});
					return;
				};
				var html = data.html.replace('target="_blank"','');
				$('#productJump').empty().html(html);
			}else if(data.error=='2'){
				utils.alert(data.msg,function(){
					window.location.reload();
	    		   })
			}else{
				utils.alert(data.msg);
			}
			$('#investBtn').removeClass('disabled').text('立即投标').unbind('click').bind('click',function(){
				submit();
			});
			$('#haspwd-submit').removeClass('disabled').text('立即投标').unbind('click').bind('click',function(){
				ajaxSubmit();
			});
		}
	})
}
//标的详情
function getDetail(obj){
	if($(obj).hasClass('active')){
		return;
	};
	$('.em-line').animate({'left':'40px'},500);
	$('.sub-a-box').hide();
	$(obj).addClass('active').siblings().removeClass('active');
	$('#project').show();
}
//获取相关文件
function getFile(obj){
	if($(obj).hasClass('active')){
		return;
	};
	if(!productDetail.userMap){
		utils.alert('您还未登录，请先登录！',function(){
			window.location.href=utils.getBasePath()+'login.html?href=invest&ev=getFile&id='+proTypeId;
		});
		return;
	};
	$('.em-line').animate({'left':'160px'},500);
	$('.sub-a-box').hide();
	$(obj).addClass('active').siblings().removeClass('active');
	if($('.files-box').children('li').size()>0){
		$('#files').show();
		return;
	};
	var param = {borrowId:proTypeId}
	utils.ajax({
		url:'front/financeAuditByBorrowId.do',
		data:JSON.stringify(param),
		dataType:'json',
		success: function(data){
			if(data.error=='0'){
				var files = $('#files');
				var filesBox = $('.files-box');
				//绑定事件
				fileList = data.auditList;
				//生成列表
				for(var i = 1;i<=fileList.length;i++){
					var classes="";
					if(i%3 == 0){
						classes = 'nomargin';
					};
					if(fileList[i-1].materAuthTypeId =='22'){
						if(fileList[i-1].imgPath){
							var li = $('<li class="'+classes+'" onclick="showImg('+fileList[i-1].userId+')"><img alt=""  width="320" height="200" src="'+fileList[i-1].imgPath+'" /><p><span class="icon icon-true">'+fileList[i-1].name+'</span></p><a href="javascript:void(0);">查看更多</a></li>');
							li.find('img').mouseenter(function(){
								$(this).siblings('a').fadeIn(100).mouseout(function(){
									$(this).fadeOut();
								});
							});
						}else{
							var li = $('<li class="'+classes+'"><img alt=""  width="320" height="200" src="/WEB-PC/src/images/nullimg.jpg" /><p><span class="icon icon-false">'+fileList[i-1].name+'</span></p></li>');
						}
					}else{
						var li = $('<li class="'+classes+'"><img alt=""  width="320" height="200" src="'+fileList[i-1].imgPath+'" /><p><span class="icon icon-true">'+fileList[i-1].name+'</span></p><a href="javascript:;" onclick="showBigImg(0,'+i+')">点击查看大图</a></li>');
						li.find('img').mouseenter(function(){
							$(this).siblings('a').fadeIn(100).mouseout(function(){
								$(this).fadeOut();
							});
						});
					};
					li.appendTo(filesBox);
				};
				files.show();
			}else{
				utils.alert(data.msg);
			}
		}
	})
};
//查看更多资料
function showImg(user){
	if($('.files-more-list').children('li').size()>0){
		$('.files-more').show();
		utils.Dialog(true);
		return;
	};
	var param = {
		typeId:'22',groupId:productDetail.groupid,userId:user
	}
	utils.ajax({
		url:'front/showImg.do',
		data:JSON.stringify(param),
		dataType:'json',
		success: function(data){
			imgList = data.imgList;
			var moreList = $('.files-more-list');
			for(var i = 1;i<=imgList.length;i++){
				var classes="";
				if(i%4 == 0){
					classes = 'nomargin';
				};
				var li = $('<li class="'+classes+'"><img alt=""  width="260" height="160" src="'+imgList[i-1].imagePath+'" /><a href="javascript:showBigImg(1,'+[i]+');">点击查看大图</a></li>');
				li.find('img').mouseenter(function(){
					$(this).siblings('a').fadeIn(100).mouseout(function(){
						$(this).fadeOut();
					});
				});

				li.appendTo(moreList);
			}
			$('.files-more .close').click(function(){
				$('.files-more').hide();
				utils.Dialog();
			});
			$('.files-more').show();
			utils.Dialog(true);
		}
	});
};
//大图预览
function showBigImg(flag,index){
	var list = [];
	if(flag==0){
		list = fileList;
		var path = list[index-1].imgPath
	}else{
		list = imgList;
		var path = list[index-1].imagePath
	};
   var name = list[index-1].name;
	var overlay = $('<div class="overlay-img"></div>').appendTo($('body'));
	var imgBox = $('<img class="bigImg" src="'+path+'" />').appendTo($('body'));
	imgBox.load(function(){

		imgW = imgBox[0].offsetWidth;
		imgH = imgBox[0].offsetHeight;

		var clientHeight = window.innerHeight || document.documentElement.clientHeight || document.body.clientHeight;   //height
		//var w = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;      //width

		var oHeight = imgH>clientHeight?clientHeight:imgH;
		var oWidth = clientHeight<imgH?(clientHeight/imgH) * imgW:imgW;
		imgBox.css({
			'height':oHeight+'px',
			'margin-left':-oWidth/2+'px',
			'margin-top':-oHeight/2+'px'
		});
	});
	overlay.bind('click',function(){
		overlay.remove();
		imgBox.remove();
	})


}
//还款计划
function getPlan(obj){
	if($(obj).hasClass('active')){
		return;
	};
	$('.em-line').animate({'left':'280px'},500);
	$('.sub-a-box').hide();
	$(obj).addClass('active').siblings().removeClass('active');
	var listData = [
	       	     {
	       	    	 key:'repayPeriod',resolve:function(val,record){
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
	       	    		if(val == null){
	       	    			return '无';
	               		 }else{
		       	    		 return val;
	               		 }
	       	    	 }
	       	     },
	       	     {
	       	    	 key:'hasPI',resolve:function(val){
	       	    		 return val;
	       	    	 }
	       	     },
	       	     {
	       	    	 key:'stillPI',resolve:function(val){
	       	    		 return val;
	       	    	 }
	       	     },
	       	     {
	       	    	 key:'hasFI',resolve:function(val){
	       	    		 return val;
	       	    	 }
	       	     },
	       	     {
	       	    	 key:'lateFI',resolve:function(val){
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
	       	     }
	       	];
	var param = {
			borrowId:proTypeId
	}
	utils.ajax({
		url:'front/repaymentPlan.do',
		data:JSON.stringify(param),
		success:function(data){
			if(data.error=='0'){
				$('#plan .listData').empty();
				var oData = data.repayList;
				utils.initListData(listData,oData,$('#plan .listData'));
				$('#plan').show();
			}else{
				utils.alert(data.msg);
			}
		}
	})
}

//投资记录
function getInvest(obj){
 	var user = $('#user').val();
 	if(user != null && user != "" && user != undefined){
        if($('.plan').is(':visible')){
            $('.em-line').animate({'left':'520px'},500);
        }else{
            $('.em-line').animate({'left':'280px'},500);
        }

        $('.sub-a-box').hide();
        $(obj).addClass('active').siblings().removeClass('active');
        $('#invest').show();
	}else {
		swal("您还未登录登录，请先登陆","","warning");
    }

};
function dangger(obj){

	if($(obj).hasClass('active')){
		return;
	};
	if($('.plan').is(':visible')){
		$('.em-line').animate({'left':'520px'},500);
	}else{
		$('.em-line').animate({'left':'280px'},500);
	}

	$('.sub-a-box').hide();
	$(obj).addClass('active').siblings().removeClass('active');
	$('#tips').show();
}
//查看平台服务协议
function AgreeMent(val){
	var id = '31';
	if(val == 1){
		id='12';
		$('.AgreeMent .title').text('风险提示书');
	}else{
		$('.AgreeMent .title').text('普金资本服务协议');
	}
	utils.Dialog(true);
	$('.AgreeMent').fadeIn();
	$('.AgreeMent .close').click(function(){
		$('.AgreeMent').hide();
		utils.Dialog();
	});
	$('.AgreeMent .popup-area').empty();
	var param={TypeId:id}; 
	utils.ajax({
        url:'querytips.do',
        data:JSON.stringify(param),
        dataType:'json',
        success: function(data){
        	if(data.error == '0'){
        		$('.AgreeMent .popup-area').html(data.content);

        	}
        }
    })
}
