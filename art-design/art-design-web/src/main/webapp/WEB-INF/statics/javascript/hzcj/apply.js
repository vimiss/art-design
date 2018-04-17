var val ;
var vali;
$(function(){
	$("#queryCommit").click(function(){
		$("#pageNow").val(1);
		$("#queryForm").submit();
	});
	val=  $("#applyForm").validate({
		 rules:{
			 	applyUserId:{
					required:true,
				},
				applyUserName:{
					required:true,
				},
				applyAdvisorId:{
					required:true,
				},
				applyAdvisorName:{
					required:true,
				},
				perId:{
					required:true,
				},
				itemId:{
					required:true,
				},
				applyQuota:{
					required:true,
					digits:true,
					quotaLimitOne:true,
					quotaLimitTwo:true,
					applyQuotaCheck100:true,
				},
				applyUnit:{
					required:true,
				},
				payTime:{
					required:true,
				},
				
		 },
		   messages:{
			   	applyUserId:{
	            	required:"请选择投资人",
	            },
	            applyUserName:{
	            	required:"请选择投资人",
	            },
	            applyAdvisorId:{
	            	required:"请选择投资顾问",
	            },
	            applyAdvisorName:{
	            	required:"请选择投资顾问",
	            },
				perId:{
					required:"请选择投资分期",
				},
				itemId:{
					required:"请选择投资项目",
				},
	            applyQuota:{
					required:"请填写申请额度",
					digits:"请输入正整数",
				},
				applyUnit:{
					required:"请选择投资单元",
				},
	            payTime:{
					required:"请选择付款时间",
				},
		   }
	});
	vali = $("#applyEditForm").validate({
		 rules:{
				applyStatus:{
					required:true,
				}
		 },
		   messages:{
				applyStatus:{
					required:"请选择申请状态",
				}
		   }
	});
	function test100( num )
	{
	var r = /^[1-9]\d*00$/;
	 return r.test( num );
	}
	
	jQuery.validator.addMethod("applyQuotaCheck100", function(value, element) { 
		var returnVal = false;  
		var applyQuota = $("#applyQuota").val();
		if(applyQuota!=""){
			returnVal =  test100( applyQuota ); 
		}
		return returnVal;
	},"申请额度必须为100的倍数");
	
	jQuery.validator.addMethod("quotaLimitOne", function(value, element) {  
		var returnVal = false;  
		var itemBeginQuota = $("#itemBeginQuota").val();
		var applyQuota = $("#applyQuota").val();
		if(parseFloat(itemBeginQuota)<=parseFloat(applyQuota)){
			returnVal = true;
		}
		return returnVal;
		},"申请金额必须大于或等于起投金额");
	
	jQuery.validator.addMethod("quotaLimitTwo", function(value, element) {  
		var returnVal = false;  
		var perRemainQuota = $("#perRemainQuota").val();
		var applyQuota = $("#applyQuota").val();
		if(parseFloat(perRemainQuota)>=parseFloat(applyQuota)){
			returnVal = true;
		}
		return returnVal;
		},"申请金额必须小于或等于分期剩余额度");
});
function goApply(){
	$('#applyModal').html("加载中...").load(ctx + '/periodApply/goApply',function(){
			$("#applyModal").modal({
				keyboard:'false',//true是默认可是使用esc退出弹窗，false是不能使用esc退出
				show:'true',// bool值，立即调用show
				backdrop:'static'//static是只在弹窗内点击关闭按钮可以关闭
			});
	});
}
function editApply(){
	if(!$("#applyEditForm").valid()){
		return;
	}
	var applyStatus = $("#applyStatus").val();
	var applyFailReason = $("#applyFailReason").val();
	var truePayTime = $("#truePayTime").val();
	if(applyStatus=='05'){
		if(!applyFailReason||applyFailReason==''){
			$("#checkApplyReason").html("<font>请选择失效原因</font>");
			return;
		}else{
			$("#checkApplyReason").empty();
		}
	}
	if(applyStatus=='02'){
		if(!truePayTime||truePayTime==''){
			$("#checkTruePayTime").html("<font>请填写实际打款时间</font>");
			return;
		}else{
			$("#checkTruePayTime").empty();
		}
	}
	Modal.confirm({msg:"确定保存吗？", okCallback:function() {
		$(this).on("hidden.bs.modal", function() {
			$.ajax({
				type : "POST",
				url : ctx + "/periodApply/token/modify",
				data : $("#applyEditForm").serialize(),
				async : false,
				dataType:"json",
				success : function(result) {
					if (result.code == "0") {
						Modal.alert({msg:"保存成功", okCallback:function() {
							$("#applyEditModal").modal("hide");
							$("#applyEditModal").on("hidden.bs.modal", function() {
								$(this).off("hidden.bs.modal");
								$("#queryCommit").click();
							});
						}});
					} else {
						$("input[name='modifyPeriodApply']").val(result.value.newTokenName);
						Modal.alert({msg:result.msg});
					}
				}
			});
			
			$(this).off("hidden.bs.modal");
		});
	}});
}
function savePeriodApply(){
	if(!$("#applyForm").valid()){
		return;
	}
	Modal.confirm({msg:"确定预约吗？", okCallback:function() {
		$(this).on("hidden.bs.modal", function() {
			$.ajax({
				type : "POST",
				url : ctx + "/periodApply/token/savePeriodApply",
				data : $("#applyForm").serialize(),
				async : false,
				dataType:"json",
				success : function(result) {
					if(result.code==0){
						Modal.alert({msg:"预约成功", okCallback:function() {
							$("#applyForm").modal("hide");
							$("#queryCommit").click();
						}});
					}else{
						$("input[name='addPeriodApply']").val(result.value.newTokenName);
						Modal.alert({msg:result.msg});
					}
				}
			});
			
			$(this).off("hidden.bs.modal");
		});
	}});
}
//翻页动作
function queryformPage(){
	$("#lastQueryForm").submit();
}
function removeApply(){
	var applyId = getApplyRadio();
	if (!applyId) {
		Modal.alert({msg:"请选择一条需要操作的数据"});
		return;
	}
	Modal.confirm({msg:"确定删除吗？", okCallback:function() {
		$(this).on("hidden.bs.modal", function() {
			$.ajax({
				type:"post",
				dataType:"json",
				data:{"applyId":applyId},
				async : false,
				url: ctx + "/periodApply/removeApply",
				success:function(result) {
					if (result.code == "0") {
						Modal.alert({msg:"删除成功", okCallback:function() {
							location.reload();
						}});
					} else {
						Modal.alert({msg:result.msg});
					}
				}
			});
			
			$(this).off("hidden.bs.modal");
		});
	}});
}

function getApplyRadio() {
	var applyRadio = $('input:radio[name="applyRadio"]:checked').val();
	return applyRadio;
}

function modifyApply(){
	var applyId = getApplyRadio();
	if (!applyId) {
		Modal.alert({msg:"请选择一条需要操作的数据"});
		return;
	}
	$('#applyEditModal').html("加载中...").load(ctx + '/periodApply/token/modify/page?applyId='+applyId+'&r='+Math.random(),function(){
			$("#applyEditModal").modal();
	});
}
function openDealFollow(param){
	if(param==''||param==undefined){
		var applyId = getApplyRadio();
		if (!applyId) {
			Modal.alert({msg:"请选择一条需要操作的数据"});
			return;
		}
		param='applyId='+applyId;
	}
	$('#dealInfoModal').html("加载中...").load(ctx + '/dealFollow/list',param,function(){
			$("#dealInfoModal").modal();
	});
}
function choseUserList(param){
	$("#applyModal").modal("hide");
	$('#choseUserModal').html("加载中...").load(ctx + '/periodApply/choseUserList',param,function(){
			$("#choseUserModal").modal({
				keyboard:'false',//true是默认可是使用esc退出弹窗，false是不能使用esc退出
				show:'true',// bool值，立即调用show
				backdrop:'static'//static是只在弹窗内点击关闭按钮可以关闭
			});
	});
}
function openPeriodInfo(perId){
	$('#periodInfoModal').html("加载中...").load(ctx + '/periodManagement/openPeriodInfo?perId='+perId+'&r='+Math.random(),function(){
			$("#periodInfoModal").modal();
	});
}
function openItemInfo(itemId){
	$('#itemInfoModal').html("加载中...").load(ctx + '/itemManagement/openItemInfo?itemId='+itemId+'&r='+Math.random(),function(){
			$("#itemInfoModal").modal();
	});
}
function choseItemPeriod(param){
	$("#applyModal").modal("hide");
	$('#chosePeriodModal').html("加载中...").load(ctx + '/periodApply/choseItemPeriod',param,function(){
			$("#chosePeriodModal").modal({
				keyboard:'false',//true是默认可是使用esc退出弹窗，false是不能使用esc退出
				show:'true',// bool值，立即调用show
				backdrop:'static'//static是只在弹窗内点击关闭按钮可以关闭
			});
	});
}
function showOpinion(applyStatus){
	if(applyStatus=="05"){
		$("#opinion").show();
		$(".failReason").show();
	}else{
		$("#opinion").hide();
		$(".failReason").hide();
		$("#applyOpinion").val("");
		$("#applyFailReason").val("");
	}
	var checkState=$("#checkState").val();
	if(checkState=='01'){//默认为预约中
		if(applyStatus=="02"){
			$(".truePayTime").show();
			$("#truePayTime").removeAttr("readonly");
		}else{
			$(".truePayTime").hide();
			$("#truePayTime").val("");
		}
	}else if(checkState=='00'){//录入状态
		$(".truePayTime").hide();
	}else{
		$("#truePayTime").attr("disabled","disabled");
		$(".truePayTime").show();
		$("#checkTrueTime").hide();
	}
	
}
