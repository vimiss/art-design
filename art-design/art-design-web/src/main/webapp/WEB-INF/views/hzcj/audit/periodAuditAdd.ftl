<#assign ctx = request.contextPath>
<#include "hzcj/common/option.ftl">
<!-- Modal -->
<div class="modal-dialog modal-lg1" role="document">
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
			<h4 class="modal-title" id="myModalLabel">项目分期审核</h4>
		</div>
		<div class="modal-body">
		<form role="form" class="form-group" action="${ctx}/recruit/update" method="POST" id="addForm" >
				<input type="hidden" name="addPeriodAudit" value="${addPeriodAudit?if_exists}" />
				<input type="hidden" name="perId" value="${itemPeriod.perId}" />
				<input type="hidden" name="itemId" value="${itemPeriod.itemId}" />
				<input type="hidden" id="auditUserId" name="auditUserId" value="${currentAccount.id }">
				<input type="hidden" id="auditUserName" name="auditUserName" value="${currentAccount.name }">
			<div class="container-fluid">
				<div class="row">
					 <div class=" Mylist clearfix">
					 
			      <div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>项目标题：</div>
							<div class="pull-left MylistRight">
								<input type="hidden" class="InputName1" id="itemIds" value="${itemPeriod.itemId}" />
								<input type="text" class="InputName1"  value="${itemPeriod.itemName}" disabled="disabled">
						     	<a class="BtnSouSu default-btn btn-blue" onclick="openItemInfo(${itemPeriod.itemId});">查看项目明细</a>
								<span id="checkStudentName" class="light-red"></span>
							</div>
					</div>
					 
	               <div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>分期标题：</div>
							<div class="pull-left MylistRight">
								<input type="text" class="InputName1"  value="${itemPeriod.perName}" disabled="disabled">
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
						
						<div class="col-xs-12 MylistCol">
								<div class="pull-left MylistLeft"><span class="red">*</span>分期额度：</div>
								<div class="pull-left MylistRight">
								  <input type="text" class="InputName1"value="${itemPeriod.perPlanQuota}" disabled="disabled">
									<span id="checkStudentName" class="light-red"></span>
								</div>
							</div>
						
						<div class="col-xs-12 MylistCol">
								<div class="pull-left MylistLeft"><span class="red">*</span>分期人数：</div>
								<div class="pull-left MylistRight">
								  <input type="text" class="InputName1" value="${itemPeriod.perTotalPeopleNum}" disabled="disabled">
									<span id="checkStudentName" class="light-red"></span>
								</div>
							</div>
						
						<div class="col-xs-12 MylistCol">
								<div class="pull-left MylistLeft"><span class="red">*</span>开始时间：</div>
								<div class="pull-left MylistRight">
								 <input type="text" class="InputName1" value="${itemPeriod.perOpenTime?string("yyyy-MM-dd HH:mm:ss")}" disabled="disabled"/>
									<span id="checkStudentName" class="light-red"></span>
								</div>
							</div>
						<div class="col-xs-12 MylistCol">
								<div class="pull-left MylistLeft"><span class="red">*</span>结束时间：</div>
								<div class="pull-left MylistRight">
								 <input type="text" class="InputName1" value="${itemPeriod.perOverTime?string("yyyy-MM-dd HH:mm:ss")}" disabled="disabled"/>
									<span id="checkStudentName" class="light-red"></span>
								</div>
							</div>
						
						<div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>最低收益(%)：</div>
							<div class="pull-left MylistRight">
							  <input type="text" class="InputName1" name="perMinFee" id="perMinFee"  value="${itemPeriod.perMinFee}" disabled="disabled">
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
						
					  <div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>最高收益(%)：</div>
							<div class="pull-left MylistRight">
							  <input type="text" class="InputName1" name="perMaxFee" id="perMaxFee" value="${itemPeriod.perMaxFee}" disabled="disabled">
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
						
						<div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>收益是否浮动：</div>
							<div class="pull-left MylistRight">
							    <select class="chosen-select AceSelect" name="perDrift" id="perDrift" disabled="disabled">
											<@option name="yes_no_type_param" status="1" value="${itemPeriod.perDrift}" />
										</select>
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
						
						<div class="col-xs-12 MylistCol">
								<div class="pull-left MylistLeft">
									<strong class="InputStrong"><span style="color:red">*</span>审核结果：</strong>
								</div>
								<div class="pull-left MylistRight">
									<select class="chosen-select AceSelect" id="auditResult" name="auditResult" >
											<@option name="result_type_param" status="1" type="2" />
									</select>
									<span id="checkStudentName" class="light-red"></span>
								</div>
						</div>	
								
						<div class="col-xs-12 MylistCol">
								<div class="pull-left MylistLeft">
									<strong class="InputStrong"><span style="color:red">*</span>审核意见：</strong>
								</div>
								<div class="pull-left MylistRight">
										<input type="text" id="auditOpinion" name="auditOpinion" style="width:200px;" class="InputName1"  maxlength="50"  placeholder="限50字符(中文字符长度为2)">
										<span id="checkStudentName" class="light-red"></span>			
								</div>
						</div>
						
      <div class="modal-footer">
			<div class="text-center">
				<a style="cursor:pointer;" onclick="savePeriodAudit();" class="default-btn btn-orange marginLR20 mt10">提 交</a>
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

	<script src="${ctx}/js/hzcj/audit.js?v=${jsv}"></script>
	<script type="text/javascript" >
	
		

		</script>
