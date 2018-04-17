<!-- 项目分期投资单元页面 -->
<#assign ctx = request.contextPath>
<#include "hzcj/common/option.ftl">
<#include "hzcj/common/number.ftl">
<div class="modal-dialog" role="document" style="width: 1000px;">
	<div class="modal-content">
		
		<div class="modal-header">
			<button type="button" class="bootbox-close-button close" data-dismiss="modal" aria-hidden="true">×</button>
			
			<h4 class="modal-title">&nbsp;分期投资单元详情</h4>
		</div>
		<div class="modal-body">
				<div class="col-xs-12">
					<div class="col-sm-8">
						<label>项目标题：</label>
						${item.itemName?if_exists}
					</div>
				</div>
				<div class="col-xs-12">
					<div class="col-sm-8">
						<label>分期标题：</label>
						${itemPeriod.perName?if_exists}
					</div>
				</div>
				<div class="col-xs-12">
					<div class="col-sm-8">
						<label>项目起投额度：</label>
						<@amount_sub amount="${item.itemBeginQuota}" type=2 />
					</div>
				</div>
				<#if incomeList>
				<div class="col-xs-12">	
					<table   class="table table-striped table-bordered table-hover RtableStriped RtableStropSOS">
						<tr role="row">
							<th class="center">投资单元</th>
							<th class="center">投资期限</th>
							<th class="center">付息方式</th>
							<th class="center" width="70%" colspan="100">投资描述</th>
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
				</div>	
				</#if>	
				<div class="col-xs-12">
					<div class="col-sm-8">
						<label>投资单元：</label>
						<select class="chosen-select AceSelect" id="investUnit" name="investUnit" >
									<#list incomeUnits as unit>
										<option value="${unit}">${unit}</option>
									</#list>
						</select>
					</div>
				</div>
		</div>
		<div class="modal-footer">
			<div class="text-center">
				<a href="javascript:;" onclick="submitInvestUnit(${itemPeriod.itemId},${itemPeriod.perId});" class="default-btn btn-orange noBorder marginLR20">确 定</a>
				<a href="javascript:;" data-dismiss="modal" class="default-btn btn-gray marginLR20">关 闭</a>
			</div>
		</div>
	</div>
</div>
<script>
	function submitInvestUnit(itemId,perId) {
		var unit = $("#investUnit").val();
		if(!unit){
			Modal.alert({msg:"请选择投资单元"});
			return;
		}
		Modal.confirm({msg:"确认选择此分期和投资单元吗？", okCallback:function() {
			$(this).on("hidden.bs.modal", function() {
				$("#choseUnitModal").modal("hide");
				$("#choseUnitModal").on("hidden.bs.modal", function() {
					$("#itemId").val(itemId);
					$("#perId").val(perId);
					$("#applyUnit").val(unit);
					$("#itemBeginQuota").val("${item.itemBeginQuota}");
					$("#perPlanQuota").val("${itemPeriod.perPlanQuota}");
					$("#perRemainQuota").val("${itemPeriod.perRemainQuota}");
					$("#itemIncrementQuota").val("${item.itemIncrementQuota}");
					$("#perOverTime").val("${itemPeriod.perOverTime?string('yyyy-MM-dd HH:mm:ss')}");
					$("#itemName").val("${item.itemName}");
					$("#perName").val("${itemPeriod.perName}");
					
					$("#chosePeriodmodal").modal("hide");
					
					$("#applyModal").modal("show");
					$(this).off("hidden.bs.modal");
				});
				
				$(this).off("hidden.bs.modal");
			});
		}});
	}
</script>
