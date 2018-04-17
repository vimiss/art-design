var val ;
$(function(){
	$("#queryCommit").click(function(){
		$("#pageNow").val(1);
		$("#queryForm").submit();
	});
	val=  $("#addForm").validate({
		 rules:{
				auditResult:{
					required:true,
				},    
				auditOpinion:{
					required:true,
				}
		 },
		   messages:{
			   auditResult:{
	            	required:"请选择审核结果",
	            } ,
	            auditOpinion:{
					required:"必填",
				}
		   }
	});
});
//翻页动作
function queryformPage() {
	$("#lastQueryForm").submit();
}

function goAudit(){
	var perId = getRadioInput();
	if (!perId) {
		Modal.alert({msg:"请选择一条需要操作的数据"});
		return;
	}
	$('#periodAuditAddModal').html("加载中...").load(ctx + '/itemPeriodAudit/token/goAddPeriodAudit?perId='+perId+'&r='+Math.random(),function(){
			$("#periodAuditAddModal").modal();
	});
}

function goPeriodAuditEdit(auditId){
	$('#periodAuditEditModal').html("加载中...").load(ctx + '/itemPeriodAudit/token/goPeriodAudit?auditId='+auditId+'&r='+Math.random(),function(){
			$("#periodAuditEditModal").modal();
	});
}

function getAuditRadio() {
	var auditRadio = $('input:radio[name="auditIdRadio"]:checked').val();
	return auditRadio;
}

function getRadioInput() {
	var radioInput = $('input:radio[name="periodIdRadio"]:checked').val();
	return radioInput;
}

function savePeriodAudit(){
	if(!$("#addForm").valid()){
		return;
	}
	$.ajax({
		type : "POST",
		url : ctx + "/itemPeriodAudit/token/addPeriodAudit",
		data : $("#addForm").serialize(),
		async : false,
		dataType:"json",
		success : function(result) {
			if(result.code==0){
				Modal.alert({msg:"提交成功", okCallback:function() {
					$("#queryCommit").click();
				}});
			}else{
				$("input[name='addPeriodAudit']").val(result.value.newTokenName);
				Modal.alert({msg:result.msg});
			}
		}
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

function queryPeriodStatus(perId){
	$('#periodStatusModal').html("加载中...").load(ctx + '/itemPeriodAudit/token/period/status/page', 'perId='+perId, function(res,sta,xhr){
		if(res){//判断是否正常返回了数据--登录拦截,res,sta,xhr
			$("#periodStatusModal").modal({
				keyboard:'false',//true是默认可是使用esc退出弹窗，false是不能使用esc退出
				show:'true',// bool值，立即调用show
				backdrop:'static'//static是只在弹窗内点击关闭按钮可以关闭
			});
		}
	});
}
function queryEffect(param){
	if(param==''||param==undefined){
		var auditId = $('input:radio[name="auditIdRadio"]:checked').val();
		if (!auditId) {
			Modal.alert({msg:"请选择一条需要操作的数据"});
			return;
		}
		param='auditId='+auditId;
	}
	$('#periodEffectModal').html("加载中...").load(ctx + '/itemPeriodAudit/queryEffect',param,function(){
			$("#periodEffectModal").modal({
				keyboard:'false',//true是默认可是使用esc退出弹窗，false是不能使用esc退出
				show:'true',// bool值，立即调用show
				backdrop:'static'//static是只在弹窗内点击关闭按钮可以关闭
			});
	});
}
function goEffect(){
	var perId=$("#perId").val();
	var itemId=$("#itemId").val();
	$.ajax({
		type : "POST",
		url : ctx + "/itemPeriodAudit/checkEffected",
		data : {"perId":perId,"itemId":itemId},
		async : false,
		dataType:"json",
		success : function(result) {
			if (result.code == "0") {
				var countConfirmApply = result.value.countConfirmApply;
				if (countConfirmApply>0) {
					effectAllApply(itemId,perId);
				} else {
					Modal.alert({msg:"该项目分期下所有已确认订单已生效"});
				}
			} else {
				Modal.alert({msg:result.msg});
			}
		}
	});
}
function goSelectedEffect(){
	var applyId = $('input:radio[name="applyRadio"]:checked').val();
	if (!applyId) {
		Modal.alert({msg:"请选择一条需要操作的数据"});
		return;
	}
	var perId=$("#perId").val();
	var itemId=$("#itemId").val();
	Modal.confirm({msg:"确认让已选择的订单生效吗？", okCallback:function() {
		$(this).on("hidden.bs.modal", function() {
			$.ajax({
				type : "POST",
				url : ctx + "/itemPeriodAudit/goEffectApply",
				data : {"perId":perId,"itemId":itemId,"applyId":applyId},
				async : false,
				dataType:"json",
				success : function(result) {
					if(result.code==0){
						Modal.alert({msg:"订单生效成功", okCallback:function() {
							$("#queryCommit").click();
						}});
					}else{
						Modal.alert({msg:result.msg});
					}
				}
			});
			
			$(this).off("hidden.bs.modal");
		});
	}});
}
//function goUnEffectApply(){
//	var applyId = $('input:radio[name="applyRadio"]:checked').val();
//	if (!applyId) {
//		alert("请选择一条需要操作的数据");
//		return;
//	}
//	var perId=$("#perId").val();
//	var itemId=$("#itemId").val();
//	if(confirm("确认让已选择的订单失效吗？")){
//		$.ajax({
//			type : "POST",
//			url : ctx + "/itemPeriodAudit/goUnEffectApply",
//			data : {"perId":perId,"itemId":itemId,"applyId":applyId},
//			async : false,
//			dataType:"json",
//			success : function(result) {
//				if(result.code==0){
//					alert("订单失效成功");
//					$("#queryCommit").click();
//				}else{
//					alert(result.msg);
//				}
//			}
//		});
//	}
//}
function effectAllApply(itemId,perId){
	Modal.confirm({msg:"确认让此项目分期下已确认的订单全部生效吗？", okCallback:function() {
		$(this).on("hidden.bs.modal", function() {
			$.ajax({
				type : "POST",
				url : ctx + "/itemPeriodAudit/goEffectApply",
				data : {"perId":perId,"itemId":itemId},
				async : false,
				dataType:"json",
				success : function(result) {
					if(result.code==0){
						Modal.alert({msg:"订单生效成功", okCallback:function() {
							$("#queryCommit").click();
						}});
					}else{
						Modal.alert({msg:result.msg});
					}
				}
			});
			
			$(this).off("hidden.bs.modal");
		});
	}});
}

function queryPeriodDelay(){
	var auditId = getAuditRadio();
	if (!auditId) {
		Modal.alert({msg:"请选择一条需要操作的数据"});
		return;
	}
	$('#periodOverTimeModal').html("加载中...").load(ctx + '/itemPeriodAudit/token/modPeriodDelay/page', 'auditId='+auditId, function(res,sta,xhr){
		if(res){//判断是否正常返回了数据--登录拦截,res,sta,xhr
			$("#periodOverTimeModal").modal({
				keyboard:'false',//true是默认可是使用esc退出弹窗，false是不能使用esc退出
				show:'true',// bool值，立即调用show
				backdrop:'static'//static是只在弹窗内点击关闭按钮可以关闭
			});
		}
	});
}

function queryPeriodApply(param){
	if(param==''||param==undefined){
		var auditId = getAuditRadio();
		if (!auditId) {
			Modal.alert({msg:"请选择一条需要操作的数据"});
			return;
		}
		param='auditId='+auditId;
	}
	$('#periodApplyListModal').html("加载中...").load(ctx + '/periodApply/listApplyByPeriod', param, function(res,sta,xhr){
		if(res){//判断是否正常返回了数据--登录拦截,res,sta,xhr
			$("#periodApplyListModal").modal({
				keyboard:'false',//true是默认可是使用esc退出弹窗，false是不能使用esc退出
				show:'true',// bool值，立即调用show
				backdrop:'static'//static是只在弹窗内点击关闭按钮可以关闭
			});
		}
	});
}

