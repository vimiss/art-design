<!-- 数据字典详情页面 -->
<#assign ctx = request.contextPath>
<#include "hzcj/common/option.ftl">
<!-- Modal -->
<div class="modal-dialog" role="document" style="width: 600px;">
	<div class="modal-content">
		
		<div class="modal-header">
			<button type="button" class="bootbox-close-button close" data-dismiss="modal" aria-hidden="true">×</button>
			
			<h4 class="modal-title">&nbsp;修改</h4>
		</div>
		<div class="modal-body">
			<div class="col-xs-12">
				<div class="col-xs-12">
					<div class="col-sm-8">
						<label>服务状态：</label>
						<input type="hidden" id="configId" value="${smsConfigById.configId}" />
						<select class="chosen-select AceSelect" id="serialStatus">
							<@option name="sms_status_param" status="1" value="${smsConfigById.serialStatus}" />
						</select>
					</div>
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<div class="text-center">
				<a href="javascript:;" onclick="submitStatusMod();" class="default-btn btn-orange noBorder marginLR20">保 存</a>
				<a href="javascript:;" data-dismiss="modal" class="default-btn btn-gray marginLR20">取 消</a>
			</div>
		</div>
	</div>
</div>
<script>
	function submitStatusMod() {
		var configId = $("#configId").val();
		var serialStatus = $("#serialStatus").val();
		
		if (!serialStatus) {
			Modal.alert({msg:"请选择服务状态"});
			return;
		}
		
		if (serialStatus == "0") {
			Modal.confirm({msg:"注销后短信服务将停止，是否继续？", okCallback:function() {
				$(this).on("hidden.bs.modal", function() {
					statusAjax(configId, serialStatus);
					$(this).off("hidden.bs.modal");
				});
			}});
		} else {
			statusAjax(configId, serialStatus);
		}
	}
	
	function statusAjax(configId, serialStatus) {
		$.ajax({
			type: "post",
			dataType: "json",
			data: {"configId":configId, "serialStatus":serialStatus},
			url: "${ctx}/sms/config/status",
			success: function(result) {
				if (result.code == "0") {
					Modal.alert({msg:"修改成功", okCallback:function() {
						$("#config_serial_status_modal").modal("hide");
						$("#config_serial_status_modal").on("hidden.bs.modal", function() {
							$("#queryCommit").click();
							$(this).off("hidden.bs.modal");
						});
					}});
				} else {
					Modal.alert({msg:result.msg});
				}
			}
		});
	}
</script>
