<#assign ctx = request.contextPath>
<#include "hzcj/common/option.ftl">
<!-- Modal -->
<div class="modal-dialog modal-lg1" role="document">
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
			<h4 class="modal-title" id="myModalLabel">项目分期预约</h4>
		</div>
		<div class="modal-body">
		<form role="form" class="form-group" action="${ctx}/recruit/update" method="POST" id="applyForm" >
				<input type="hidden" name="addPeriodApply" value="${addPeriodApply?if_exists}" />
			<div class="container-fluid">
				<div class="row">
					 <div class=" Mylist clearfix">
					 
					 <div class="col-xs-12 MylistCol">
								<div class="pull-left MylistLeft">
									<strong class="InputStrong"><span style="color:red">*</span>选择投资人：</strong>
								</div>
								<div class="pull-left MylistRight">
									<span onclick="choseUserList();" class="BtnSouSu default-btn btn-blue">选择投资人和投顾</span>
								</div>
					</div>
					<div class="col-xs-12 MylistCol">
								<div class="pull-left MylistLeft">
									<strong class="InputStrong"><span style="color:red">*</span>投资人姓名：</strong>
								</div>
								<div class="pull-left MylistRight">
									<input type="text" class="texy1" id="applyUserName" name="applyUserName" readonly="readonly" placeholder="请先选择投资人">
									<input type="hidden" name="applyUserId" id="applyUserId"  />
									<span id="checkStudentName" class="light-red"></span>
								</div>
					</div>
					<div class="col-xs-12 MylistCol">
								<div class="pull-left MylistLeft">
									<strong class="InputStrong"><span style="color:red">*</span>投顾姓名：</strong>
								</div>
								<div class="pull-left MylistRight">
									<input type="text" class="texy1" id="applyAdvisorName" name="applyAdvisorName" readonly="readonly"  placeholder="请先选择投资人">
									<input type="hidden" name="applyAdvisorId" id="applyAdvisorId"  />
									<span id="checkStudentName" class="light-red"></span>
								</div>
					</div>
			      	<div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>选择项目分期：</div>
							<div class="pull-left MylistRight">
								<span onclick="choseItemPeriod();" class="BtnSouSu default-btn btn-blue">选择投资项目分期</span>
							</div>
					</div>
						<div class="col-xs-12 MylistCol">
								<div class="pull-left MylistLeft"><span class="red">*</span>项目标题：</div>
								<div class="pull-left MylistRight">
								  	<input type="text" class="texy1" id="itemName" disabled="disabled"  placeholder="请先选择投资项目">
									<input type="hidden" name="itemId" id="itemId" />
								  	<span id="checkStudentName" class="light-red"></span>
								</div>
						</div>
						<div class="col-xs-12 MylistCol">
								<div class="pull-left MylistLeft"><span class="red">*</span>分期标题：</div>
								<div class="pull-left MylistRight">
								  	<input type="text" class="texy1" id="perName" disabled="disabled" placeholder="请先选择投资分期">
									<input type="hidden" name="perId" id="perId"  />
								  	<span id="checkStudentName" class="light-red"></span>
								</div>
						</div>
						<div class="col-xs-12 MylistCol">
								<div class="pull-left MylistLeft"><span class="red">*</span>分期额度：</div>
								<div class="pull-left MylistRight">
								  	<input type="text" class="texy1" id="perPlanQuota" disabled="disabled" placeholder="请先选择投资项目分期">
								</div>
						</div>
						<div class="col-xs-12 MylistCol">
								<div class="pull-left MylistLeft"><span class="red">*</span>剩余额度：</div>
								<div class="pull-left MylistRight">
								  	<input type="text" class="texy1" id="perRemainQuota" readonly="readonly" placeholder="请先选择投资项目分期">
								</div>
						</div>
						<div class="col-xs-12 MylistCol">
								<div class="pull-left MylistLeft"><span class="red">*</span>起投额度：</div>
								<div class="pull-left MylistRight">
								  	<input type="text" class="texy1" id="itemBeginQuota" readonly="readonly" placeholder="请先选择投资项目分期">
								</div>
						</div>
						<div class="col-xs-12 MylistCol">
								<div class="pull-left MylistLeft"><span class="red">*</span>递增额度：</div>
								<div class="pull-left MylistRight">
								  	<input type="text" class="texy1" id="itemIncrementQuota" readonly="readonly" placeholder="请先选择投资项目分期">
								</div>
						</div>
						<div class="col-xs-12 MylistCol">
								<div class="pull-left MylistLeft"><span class="red">*</span>分期结束时间：</div>
								<div class="pull-left MylistRight">
									<input type="text" class="texy1" id="perOverTime" name="perOverTime" readonly="readonly" placeholder="请先选择投资项目分期">
									<span id="checkStudentName" class="light-red"></span>
								</div>
						</div>
						<div class="col-xs-12 MylistCol">
								<div class="pull-left MylistLeft"><span class="red">*</span>投资单元：</div>
								<div class="pull-left MylistRight">
									<input type="text" class="texy1" id="applyUnit" name="applyUnit" readonly="readonly" placeholder="请先选择投资项目分期">
									<span id="checkStudentName" class="light-red"></span>
								</div>
						</div>
						<div class="col-xs-12 MylistCol">
								<div class="pull-left MylistLeft"><span class="red">*</span>申请额度：</div>
								<div class="pull-left MylistRight">
								  	<input type="text" class="texy1" id="applyQuota" name="applyQuota"  >
									<span id="checkStudentName" class="light-red"></span>
								</div>
						</div>
						<div class="col-xs-12 MylistCol">
								<div class="pull-left MylistLeft"><span class="red">*</span>预约打款时间：</div>
								<div class="pull-left MylistRight">
									<input id="payTime" name="payTime" style="width:180px;" class="Wdate WdateInput1" type="text"  onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'%y-%M-%d',maxDate:'#F{$dp.$D(\'perOverTime\')}',isShowClear:true,isShowOthers:false,qsEnabled:false})">
									<span id="checkStudentName" class="light-red"></span>
								</div>
						</div>
      <div class="modal-footer">
			<div class="text-center">
				<a style="cursor:pointer;" onclick="savePeriodApply();" class="default-btn btn-orange marginLR20 mt10">保 存</a>
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
	<script type="text/javascript" >
	</script>
	