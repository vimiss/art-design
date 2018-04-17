<#assign ctx = request.contextPath>
<#include "hzcj/common/option.ftl">
<!-- Modal -->
<div class="modal-dialog modal-lg1" role="document" style="width: 1200px;">
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" id='meClose'>×</span></button>
			<h4 class="modal-title" id="myModalLabelEdit">修改分期</h4>
		</div>
		<div class="modal-body">
		<form role="form" class="form-group" action="${ctx}/recruit/update" method="POST" id="editForm" >
				<input type="hidden" name="addPeriod" value="${addPeriod?if_exists}" />
				<input type="hidden" name="version" value="${itemPeriod.version}" />
				<input type="hidden" name="perId" id="perId" value="${itemPeriod.perId}" />
				<input type="hidden" name="perOldName" id="perOldName" value="${itemPeriod.perName}" />
			<div class="container-fluid">
				<div class="row">
					 <div class=" Mylist clearfix">
					 
		             <div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>选择项目：</div>
							<div class="pull-left MylistRight">
							   <!--<a class="BtnSouSu default-btn btn-blue" onclick="choseItem();" >选择项目 </a>
							&nbsp;|&nbsp;-->
							<input type="hidden" name="itemId" id="trueItemId" value="${itemPeriod.itemId}" />
								 <span id="itemNames"  style="color:#F00">&nbsp;|&nbsp;已选择项目[${itemPeriod.itemName}]</span>
						     <!-- <select class="chosen-select AceSelect" name="itemId" id="itemIds">
									<@option name="item_period_param" status="1" method="getItemAsOption"  value="${itemPeriod.itemId}"/>
								</select>-->
						     	
						     <a class="BtnSouSu default-btn btn-blue" onclick="openEditItemInfo();" >查看项目明细 </a>
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
					 
					 
	               <div>
						<div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>分期标题：</div>
							<div class="pull-left MylistRight">
								<input type="text" class="InputName5" name="perName" id="perName" value="${itemPeriod.perName}"  maxlength="20"  placeholder="姓名只能为20位以内汉字或字母">
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
						
						
						
					<div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>分期额度：</div>
							<div class="pull-left MylistRight">
							  <input type="text" class="InputName1" name="perPlanQuota" id="perPlanQuotaEdit" value="${itemPeriod.perPlanQuota}"    maxlength="20"  placeholder="">
								<span id="perPlanQuotaCheck" class="light-red"></span>
							</div>
						</div>
						
					<div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>分期人数：</div>
							<div class="pull-left MylistRight">
							  <input type="text" class="InputName1" name="perTotalPeopleNum" id="perTotalPeopleNum"  value="${itemPeriod.perTotalPeopleNum}"   maxlength="20"  placeholder="">
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
						
				       <div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>开始时间：</div>
							<div class="pull-left MylistRight ">
						      <input id="d4311" class="Wdate WdateInput2"
																	name="perOpenTimeStr" type="text" value="${(itemPeriod.perOpenTime?string("yyyy-MM-dd HH:mm:ss"))}" 
																	onFocus="WdatePicker({minDate:'<%=nowDate%>',maxDate:'#F{$dp.$D(\'d4312\')}',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
							</div>
						</div>
						
				      <div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>结束时间：</div>
							<div class="pull-left MylistRight ">
							<input id="d4312" class="Wdate WdateInput2"
																	type="text" name="perOverTimeStr" value="${(itemPeriod.perOverTime?string("yyyy-MM-dd"))}" 
																	onFocus="WdatePicker({minDate:'#F{$dp.$D(\'d4311\')}',dateFmt:'yyyy-MM-dd'})" />
							</div>
						</div>
				      <div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>截止打款时间：</div>
							<div class="pull-left MylistRight ">
							<input id="d4313" class="Wdate WdateInput2"
																	type="text" name="perPayEndDateStr" value="${(itemPeriod.perPayEndDate?string("yyyy-MM-dd"))}" 
																	onFocus="WdatePicker({minDate:'#F{$dp.$D(\'d4311\')}',maxDate:'#F{$dp.$D(\'d4312\')}',dateFmt:'yyyy-MM-dd'})" />
							</div>
						</div>
						
						
						<!-- <div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>最低收益(%)：</div>
							<div class="pull-left MylistRight">
							  <input type="text" class="InputName1 ajaxMinFeeCheck " name="perMinFee" id="perMinFee"  value="${itemPeriod.perMinFee}" >
								<span id="checkStudentName" class="light-red"></span>
							</div>	
						</div>
						
					  <div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>最高收益(%)：</div>
							<div class="pull-left MylistRight">
							  <input type="text" class="InputName1 ajaxMaxFeeCheck ajaxMaxMinFeeCheck " name="perMaxFee" id="perMaxFee" value="${itemPeriod.perMaxFee}">
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
						
						<div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>收益是否浮动：</div>
							<div class="pull-left MylistRight">
							    <select class="chosen-select AceSelect" name="perDrift" id="perDrift"  disabled="disabled">
											<@option name="yes_no_type_param" status="1"  value="${itemPeriod.perDrift}" />
										</select>
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>-->
						
						
						
      <div class="modal-footer">
			<div class="text-center">
				<a href="javascript:;" onclick="ajaxSaveUpdatePeriod();" class="default-btn btn-orange noBorder marginLR20">保 存</a>
				<a href="javascript:;" data-dismiss="modal" class="default-btn btn-gray marginLR20" id='ceClose'>取 消</a>
			</div>
		</div>
						
</div>	<!--隐藏结束-->			
				</div>
			</div>

			
		</form>
		</div>
		
	</div>
</div>
<style>
input.error { border: 1px solid red; }
.error {
    overflow: hidden;
    padding: 0 8px 0 0;
    position: relative;
    color:red;
}
</style>

	<script src="${ctx}/js/hzcj/period.js?v=${jsv}"></script>
	<script type="text/javascript" >
	
		function openEditItemInfo() {
			var itemId = $('#trueItemId').val();
			var param = 'itemId='+itemId;
		$('#itemInfoModal').html("加载中...").load('${ctx}/itemManagement/openItemInfo', param,function(res,sta,xhr){
			if(res){//判断是否正常返回了数据--登录拦截,res,sta,xhr
				$("#itemInfoModal").modal({
					keyboard:'false',//true是默认可是使用esc退出弹窗，false是不能使用esc退出
					show:'true',// bool值，立即调用show
					backdrop:'static'//static是只在弹窗内点击关闭按钮可以关闭
				});
			}
		});
	}
	
	
		//金额校验 分期额度不能大于项目剩余额度
jQuery.validator.addMethod("ajaxAmountCheckOne", function(value, element) {  
	var returnVal = false;  
	var perPlanQuota = $("#perPlanQuotaEdit").val();
	var perId = $("#perId").val();
	var itemId = $("select[name='itemId']").find("option:selected").val();
	$.ajax({
		type : "POST",
		url : ctx+"/periodManagement/ajaxAmountCheckOne",
		data : {"perPlanQuota":perPlanQuota,"itemId":itemId,"perId":perId},
		async : false,
		dataType:"json",
		success : function(result) {
			if (result.code == "0000") {
				returnVal=true;   
			} else {
			 $("#perPlanQuotaCheck").html("当前项目剩余额度为["+result.msg+"]");
				returnVal=false; 
			}
		}
	});
	return returnVal;   
}," 分期额度必须小于项目剩余额度");

		//金额校验 分期额度必须大于项目起投额度
jQuery.validator.addMethod("ajaxAmountCheckTwo", function(value, element) {  
	var returnVal = false;  
	var perPlanQuota = $("#perPlanQuotaEdit").val();
	var itemId = $("select[name='itemId']").find("option:selected").val();
	$.ajax({
		type : "POST",
		url : ctx+"/periodManagement/ajaxAmountCheckTwo",
		data : {"perPlanQuota":perPlanQuota,"itemId":itemId},
		async : false,
		dataType:"json",
		success : function(result) {
			if (result.code == "0000") {
				returnVal=true;   
			} else {
			 $("#perPlanQuotaCheck").html("当前项目起投额度为["+result.msg+"]");
				returnVal=false; 
			}
		}
	});
	return returnVal;   
}," 分期额度必须大于项目起投额度");
	
	


//收益校验 分期最低收益和最高收益必须在项目的收益区间之内，并且最高收益必须大于最高收益

jQuery.validator.addMethod("ajaxMinFeeCheck", function(value, element) {  
	var returnVal = false;  
	var perMinFee = $("#perMinFee").val();
	var itemId = $("select[name='itemId']").find("option:selected").val();
	
	$.ajax({
		type : "POST",
		url : ctx+"/periodManagement/ajaxMinFeeCheck",
		data : {"perMinFeeStr":perMinFee,"itemId":itemId},
		async : false,
		dataType:"json",
		success : function(result) {
			if (result.code == "0000") {
				returnVal=true;   
			} 
			else {
			$("#feeMinCheck").html("当前项目收益区间为["+result.msg+"]");
				returnVal=false; 
			}
		}
	});
	return returnVal;  
},"输入的值不在项目收益区间");

jQuery.validator.addMethod("ajaxMaxFeeCheck", function(value, element) {  
	var returnVal = false;  
	var perMaxFee = $("#perMaxFee").val();
	var itemId = $("select[name='itemId']").find("option:selected").val();
	
	$.ajax({
		type : "POST",
		url : ctx+"/periodManagement/ajaxMaxFeeCheck",
		data : {"perMaxFeeStr":perMaxFee,"itemId":itemId},
		async : false,
		dataType:"json",
		success : function(result) {
			if (result.code == "0000") {
				returnVal=true;   
			} 
			else {
			$("#feeMaxCheck").html("当前项目收益区间为["+result.msg+"]");
				returnVal=false; 
			}
		}
	});
	return returnVal;  
},"输入的值不在项目收益区间");

jQuery.validator.addMethod("ajaxMaxMinFeeCheck", function(value, element) {  
	var returnVal = false;  
	var perMaxFee = $("#perMaxFee").val();
    var perMinFee = $("#perMinFee").val();
	
	$.ajax({
		type : "POST",
		url : ctx+"/periodManagement/ajaxMaxMinFeeCheck",
		data : {"perMaxFeeStr":perMaxFee,"perMinFeeStr":perMinFee},
		async : false,
		dataType:"json",
		success : function(result) {
			if (result.code == "0000") {
				returnVal=true;   
			} 
			else {
				returnVal=false; 
			}
		}
	});
	return returnVal;  
},"最高收益必须大于最低收益");


jQuery.validator.addMethod("checkPerName", function(value, element) {  
		var returnVal = false;  
		var perName = $("#perName").val();
		var perOldName = $("#perOldName").val();
			var itemId = $("select[name='itemId']").find("option:selected").val();
		$.ajax({
			type : "POST",
			url : ctx+"/periodManagement/checkPerName",
			data : {"itemId":itemId,"perName":perName,"perOldName":perOldName},
			async : false,
			dataType:"json",
			success : function(result) {
				if (result.code == "0000") {
					returnVal=true;   
				} 
				else {
					returnVal=false; 
				}
			}
		});
		return returnVal;   
	},"该项目下分期标题已存在");  


		</script>
