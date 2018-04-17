<#assign ctx = request.contextPath>
<#include "hzcj/common/option.ftl">
<#include "hzcj/common/number.ftl">
<!-- Modal -->
<div class="modal-dialog modal-lg1" role="document" >
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
			<h4 class="modal-title" id="myModalLabel">审核预约申请</h4>
		</div>
		<div class="modal-body">
		<form role="form" class="form-group" method="POST" id="applyEditForm" >
				<input type="hidden" id="applyInvestUnit" name="applyInvestUnit" value="${periodApplyVo.applyInvestUnit}">
				<input type="hidden" id="applyId" name="applyId" value="${periodApplyVo.applyId}">
				<input type="hidden" id="itemId" name="itemId" value="${periodApplyVo.itemId}">
				<input type="hidden" id="applyUserId" name="applyUserId" value="${periodApplyVo.applyUserId}">
				<input type="hidden" id="applyAdvisorId" name="applyAdvisorId" value="${periodApplyVo.applyAdvisorId}">
				<input type="hidden" id="perId" name="perId" value="${periodApplyVo.perId}">
				<input type="hidden" name="modifyPeriodApply" value="${modifyPeriodApply?if_exists}">
			<div class="container-fluid">
				<div class="row">
					 <div class=" Mylist clearfix">
					 		<div class="col-xs-12 MylistCol">
								<div class="pull-left MylistLeft">
									<strong class="InputStrong">项目标题：</strong>
								</div>
								<div class="pull-left MylistRight">
										<input type="text" id="itemName" name="itemName" value="${periodApplyVo.itemName}" readonly="readonly" style="width:200px;" class="InputTexy1 InputTexy2"  maxlength="50" >
								</div>
							</div>
							<div class="col-xs-12 MylistCol">
								<div class="pull-left MylistLeft">
									<strong class="InputStrong">分期标题：</strong>
								</div>
								<div class="pull-left MylistRight">
										<input type="text" id="perName" name="perName" value="${periodApplyVo.perName}" readonly="readonly" style="width:200px;" class="InputTexy1 InputTexy2"  maxlength="50" >
								</div>
							</div>
	                      	<div class="col-xs-12 MylistCol">
								<div class="pull-left MylistLeft">
									<strong class="InputStrong">投资人姓名：</strong>
								</div>
								<div class="pull-left MylistRight">
									<input type="text" name="applyUserName" value="${periodApplyVo.applyUserName}" readonly="readonly" style="width:200px;"  class="InputTexy1 InputTexy2"  maxlength="20"  placeholder="限20字符(中文字符长度为2)">
								</div>
							</div>
							<div class="col-xs-12 MylistCol">
								<div class="pull-left MylistLeft">
									<strong class="InputStrong">顾问姓名：</strong>
								</div>
								<div class="pull-left MylistRight">
									<input type="text" name="applyAdvisorName" value="${periodApplyVo.applyAdvisorName}" readonly="readonly" style="width:200px;"  class="InputTexy1 InputTexy2"  maxlength="20"  placeholder="限20字符(中文字符长度为2)">
								</div>
							</div>
							<div class="col-xs-12 MylistCol">
								<div class="pull-left MylistLeft">
									<strong class="InputStrong">起投额度：</strong>
								</div>
								<div class="pull-left MylistRight">
										<input type="text" value='<@amount_sub amount="${periodApplyVo.itemBeginQuota}" type=2 />' readonly="readonly" style="width:200px;" class="InputTexy1 InputTexy2"  maxlength="50" >
										<input type="hidden" id="itemBeginQuota" name="itemBeginQuota" value="${periodApplyVo.itemBeginQuota}" >
								</div>
							</div>
							<div class="col-xs-12 MylistCol">
								<div class="pull-left MylistLeft">
									<strong class="InputStrong">递增额度：</strong>
								</div>
								<div class="pull-left MylistRight">
										<input type="text" value='<@amount_sub amount="${periodApplyVo.itemIncrementQuota}" type=2 />' readonly="readonly" style="width:200px;" class="InputTexy1 InputTexy2"  maxlength="50" >
										<input type="hidden" id="itemIncrementQuota" name="itemIncrementQuota" value="${periodApplyVo.itemIncrementQuota}" >
								</div>
							</div>
							<div class="col-xs-12 MylistCol">
								<div class="pull-left MylistLeft">
									<strong class="InputStrong">剩余额度：</strong>
								</div>
								<div class="pull-left MylistRight">
										<input type="text" value='<@amount_sub amount="${periodApplyVo.perRemainQuota}" type=2 />' readonly="readonly" style="width:200px;" class="InputTexy1 InputTexy2"  maxlength="50" >
										<input type="hidden" id="perRemainQuota" name="perRemainQuota" value="${periodApplyVo.perRemainQuota}">
								</div>
							</div>
							<div class="col-xs-12 MylistCol">
								<div class="pull-left MylistLeft">
									<strong class="InputStrong">预约时间：</strong>
								</div>
								<div class="pull-left MylistRight">
										<input id="applyTime" name="applyTime" readonly="readonly" value="${periodApplyVo.applyTime?string('yyyy-MM-dd HH:mm:ss')}"  style="width:180px;" class="Wdate WdateInput1" type="text" >
								</div>
							</div>
							<div class="col-xs-12 MylistCol">
								<div class="pull-left MylistLeft">
									<strong class="InputStrong">预约打款时间：</strong>
								</div>
								<div class="pull-left MylistRight">
										<input id="payTime" name="payTime" readonly="readonly" value="${periodApplyVo.payTime?string('yyyy-MM-dd HH:mm:ss')}"  style="width:180px;" class="Wdate WdateInput1" type="text" >
								</div>
							</div>
							<div class="col-xs-12 MylistCol">
								<div class="pull-left MylistLeft">
									<strong class="InputStrong">申请额度：</strong>
								</div>
								<div class="pull-left MylistRight">
										<input  type="text" value='<@amount_sub amount="${periodApplyVo.applyQuota}" type=2 />' readonly="readonly" style="width:200px;" class="InputTexy1 InputTexy2"  maxlength="50" >
										<input  type="hidden" id="applyQuota" name="applyQuota" value="${periodApplyVo.applyQuota }">
										<span id="checkApplyQuota" class="red" style="margin-left: 20px;"></span>
								</div>
							</div>
							<div class="col-xs-12 MylistCol">
								<div class="pull-left MylistLeft">
									<strong class="InputStrong">投资单元：</strong>
								</div>
								<div class="pull-left MylistRight">
									<input  type="text" id="applyUnit" name="applyUnit" value="${periodApplyVo.incUnit}" readonly="readonly" style="width:200px;" class="InputTexy1 InputTexy2"  maxlength="50" >
									<span id="checkApplyUnit" class="red" style="margin-left: 20px;"></span>
								</div>
							</div>
							
							<div class="col-xs-12 MylistCol">
								<div class="pull-left MylistLeft">
									<strong class="InputStrong"><span style="color:red">*</span>申请状态：</strong>
								</div>
								<div class="pull-left MylistRight">
								<input  type="hidden" id="checkState" value="${periodApplyVo.applyStatus}"/>
									<select class="chosen-select AceSelect" id="applyStatus" name="applyStatus" onchange="showOpinion(this.value)">
											<#if periodApplyVo.applyStatus == "00">
											<@option name="apply_status_param" status="1" value="${periodApplyVo.applyStatus}" show="01,05" />										
											</#if>
											<#if periodApplyVo.applyStatus == "01">
											<@option name="apply_status_param" status="1" value="${periodApplyVo.applyStatus}" show="02,05" />										
											</#if>
											<#if periodApplyVo.applyStatus == "02">
											<@option name="apply_status_param" status="1" value="${periodApplyVo.applyStatus}" show="03,05" />										
											</#if>
											<#if periodApplyVo.applyStatus == "03">
											<@option name="apply_status_param" status="1" value="${periodApplyVo.applyStatus}" show="04" />										
											</#if>
											<#if periodApplyVo.applyStatus == "04">
											<@option name="apply_status_param" status="1" value="${periodApplyVo.applyStatus}" show="06" />										
											</#if>
											<#if periodApplyVo.applyStatus == "05">
											<@option name="apply_status_param" status="1" value="${periodApplyVo.applyStatus}" show="05" />										
											</#if>
											<#if periodApplyVo.applyStatus == "06">
											<@option name="apply_status_param" status="1" value="${periodApplyVo.applyStatus}" show="06" />										
											</#if>
									</select>
									<span id="checkApplyStatus" class="red" style="margin-left: 20px;"></span>
								</div>
							</div>
							<div class="col-xs-12 MylistCol truePayTime"  style="display:none;"  >
								<div class="pull-left MylistLeft">
									<strong class="InputStrong"><span style="color:red" style="display:none;" class="truePayTime" id="checkTrueTime">*</span>实际打款时间:</strong>
								</div>
								<div class="pull-left MylistRight">
									<input id="truePayTime" name="truePayTime" style="width:180px;" value="${periodApplyVo.truePayTime?string('yyyy-MM-dd HH:mm:ss')}" class="Wdate WdateInput1" type="text"  onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'#F{$dp.$D(\'applyTime\')}',isShowClear:true,isShowOthers:false,qsEnabled:false})">
									<span id="checkTruePayTime" class="red" style="margin-left: 20px;"></span>
								</div>
							</div>
							<div class="col-xs-12 MylistCol failReason" style="display:none;">
								<div class="pull-left MylistLeft">
									<strong class="InputStrong"><span style="color:red">*</span>失效原因：</strong>
								</div>
								<div class="pull-left MylistRight">
									<select class="chosen-select AceSelect" id="applyFailReason" name="applyFailReason" >
										<@option name="period_fail_type_param" status="1" value="${periodApplyVo.applyFailReason}" />	
									</select>
									<span id="checkApplyReason" class="red" style="margin-left: 20px;"></span>
								</div>
							</div>
							<div class="col-xs-12 MylistCol" style="display:none;" id="opinion">
								<div class="pull-left MylistLeft">
									<strong class="InputStrong">驳回意见：</strong>
								</div>
								<div class="pull-left MylistRight">
									<input type="text" id="applyOpinion" name="applyOpinion"  style="width:200px;" class="InputTexy1 InputTexy2"  maxlength="500"  >
									<span id="checkApplyOpinion" class="red" style="margin-left: 20px;"></span>
								</div>
							</div>
      <div class="modal-footer">
			<div class="text-center">
				<a style="cursor:pointer;" onclick="editApply();" class="default-btn btn-orange marginLR20 mt10">保 存</a>
				<a type="button" data-dismiss="modal" class="default-btn btn-gray marginLR20 mt10">取 消</a>
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

	<script src="${ctx}/js/hzcj/apply.js?v=${jsv}"></script>
	<script type="text/javascript">
	 $(function(){
		 showOpinion($("#applyStatus").val());
	 });
	</script>