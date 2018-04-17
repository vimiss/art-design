<#assign ctx = request.contextPath>
<#include "hzcj/common/option.ftl">
<#include "hzcj/common/number.ftl">
<!-- Modal -->
<div class="modal-dialog modal-lg1" role="document" style="width:1400px;">
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
			<h4 class="modal-title" id="myModalLabel">分期明细</h4>
		</div>
		<div class="modal-body">
		<form role="form" class="form-group" action="${ctx}/recruit/update" method="POST" id="editForm" >
			<div class="container-fluid">
				<div class="row">
					 <div class=" Mylist clearfix">
						
							<div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>项目标题：</div>
							<div class="pull-left MylistRight">
								<input type="hidden" class="InputName1" id="itemIds" value="${itemPeriod.itemId}" />
								<input type="text" class="InputName5"  value="${itemPeriod.itemName}" disabled="disabled">
						     	<a class="BtnSouSu default-btn btn-blue" onclick="openItemInfo(${itemPeriod.itemId});">查看项目明细 </a>
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
						
						<div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>分期标题：</div>
							<div class="pull-left MylistRight">
								<input type="text" class="InputName5"  value="${itemPeriod.perName}" disabled="disabled">
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
						
					<div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>分期额度：</div>
							<div class="pull-left MylistRight">
							  <input type="text" class="InputName1" value="<@amount_sub amount='${itemPeriod.perPlanQuota}' type=2 />" disabled="disabled">
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
							 <input type="text" class="InputName1" value="${(itemPeriod.perOpenTime?string("yyyy-MM-dd HH:mm:ss"))}" disabled="disabled"/>
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
					<div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>结束时间：</div>
							<div class="pull-left MylistRight">
							 <input type="text" class="InputName1" value="${(itemPeriod.perOverTime?string("yyyy-MM-dd HH:mm:ss"))}" disabled="disabled"/>
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
					<div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>截止打款时间：</div>
							<div class="pull-left MylistRight">
							 <input type="text" class="InputName1" value="${(itemPeriod.perPayEndDate?string("yyyy-MM-dd HH:mm:ss"))}" disabled="disabled"/>
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
							  <input type="text" class="InputName1" name="perMaxFee" id="perMaxFee" value="<#if itemPeriod.perDrift == '0'>${itemPeriod.perMaxFee}<#else>浮动</#if>" disabled="disabled">
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
						
						<#--
						<div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>收益是否浮动：</div>
							<div class="pull-left MylistRight">
							    <select class="chosen-select AceSelect" name="perDrift" id="perDrift" disabled="disabled">
											<@option name="yes_no_type_param" status="1" value="${itemPeriod.perDrift}" />
										</select>
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
						 -->
						<div class="col-xs-12 MylistCol">
								<#if incomeList>
									<table   class="table table-striped table-bordered table-hover RtableStriped RtableStropSOS">
										<tr role="row">
											<th class="center">投资单元</th>
											<th class="center">投资期限</th>
											<th class="center">付息方式</th>
											<th class="center" colspan="100">投资描述</th>
										</tr>
										<#list incomeList as income>
										<tr >
											<td class="center">
												${income.incUnit}
											</td>
											<td class="center">
												${income.incTerm}
											</td>
											<td class="center">
												<#if income.incOrder!='0'>
													<@option name="pay_method_type_param" status="1" type="3" value="${income.payMethod}"/>
												</#if>
											</td>
											${income.incDesc}
										</tr>
										</#list>
									</table>		
									</#if>	
						</div>
						
						
					</div>
				</div>
			</div>
		</form>
		</div>
		<div class="modal-footer">
			<div class="text-center">
				<a href="javascript:;" data-dismiss="modal" class="default-btn btn-gray marginLR20">关 闭</a>
			</div>
		</div>
	</div>
</div>
	<script src="${ctx}/js/hzcj/period.js?v=${jsv}"></script>
