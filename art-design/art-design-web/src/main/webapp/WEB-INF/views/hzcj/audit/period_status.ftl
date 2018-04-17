<!-- 分期状态页面 -->
<#include "hzcj/common/option.ftl">
<#assign ctx = request.contextPath>
<!-- Modal -->
<div class="modal-dialog" role="document" style="width: 520px;">
	<div class="modal-content">
		
		<div class="modal-header">
			<button type="button" class="bootbox-close-button close" data-dismiss="modal" aria-hidden="true">×</button>
			
			<h4 class="modal-title">&nbsp;修改分期状态</h4>
		</div>
		<div class="modal-body">
			<div class="col-xs-12">
				<div class="col-xs-12" style="display: none;">
					<div class="col-sm-8">
						<label>分期ID：</label>
						<input type="text" class="InputName1" id="perId" value="${itemPeriod.perId}" readonly="readonly" />
						<input type="hidden" id="modPeriodStatus" name="modPeriodStatus" value="${modPeriodStatus?if_exists}" />
					</div>
				</div>
				<div class="col-xs-12">
					<div class="col-sm-8">
						<label>分期状态：</label>
						<select class="chosen-select AceSelect" id="periodStatus">
							<#if itemPeriod.perStatus == "01">
								<@option name="period_status_param" status="1"  value="${itemPeriod.perStatus}" show="02,06" />
							</#if>
							<#if itemPeriod.perStatus == "02">
								<@option name="period_status_param" status="1"  value="${itemPeriod.perStatus}" show="03,04,06" />
							</#if>
							<#if itemPeriod.perStatus == "03">
								<@option name="period_status_param" status="1"  value="${itemPeriod.perStatus}" show="02,04,06" />
							</#if>
							<#if itemPeriod.perStatus == "04">
								<@option name="period_status_param" status="1"  value="${itemPeriod.perStatus}" show="05" />
							</#if>
							<#if itemPeriod.perStatus == "05">
								<@option name="period_status_param" status="1"  value="${itemPeriod.perStatus}" show="05" />
							</#if>
							<#if itemPeriod.perStatus == "06">
								<@option name="period_status_param" status="1"  value="${itemPeriod.perStatus}" show="06" />
							</#if>
						</select>
					</div>
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<div class="text-center">
				<a type="button" href="javascript:;" onclick="submitStatus();" class="default-btn btn-orange marginLR20">保 存</a>
				<a type="button" href="javascript:;" data-dismiss="modal" class="default-btn btn-gray marginLR20">取 消</a>
			</div>
		</div>
	</div>
</div>
<script>
	function submitStatus() {
		var perId = $("#perId").val();
		var perStatus = $("#periodStatus").val();
		var modPeriodStatus = $("#modPeriodStatus").val();
		if (!perStatus) {
			Modal.alert({msg:"请选择分期状态"});
			return;
		}
		Modal.confirm({msg:"确认更改分期状态吗？", okCallback:function() {
			$(this).on("hidden.bs.modal", function() {
				$.ajax({
					type: "post",
					dataType: "json",
					data: {"perId": perId, "perStatus": perStatus,"modPeriodStatus":modPeriodStatus},
					url: "${ctx}/itemPeriodAudit/token/modifyPeriodStatus",
					success: function(result) {
						if (result.code == "0") {
							Modal.alert({msg:"修改分期状态成功", okCallback:function() {
								$("#periodStatusModal").modal("hide");
								$("#periodStatusModal").on("hidden.bs.modal", function(){
									$("#queryCommit").click();
									$(this).off("hidden.bs.modal");
								});
							}});
						} else {
							$("input[name='modPeriodStatus']").val(result.value.newTokenName);
							Modal.alert({msg:result.msg});
						}
					}
				});
				
				$(this).off("hidden.bs.modal");
			});
		}});
	}
</script>
