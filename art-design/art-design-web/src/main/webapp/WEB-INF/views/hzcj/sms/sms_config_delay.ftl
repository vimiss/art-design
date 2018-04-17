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
						<label>推迟时间：</label>
						<input type="hidden" id="configId" value="${smsConfigById.configId}" />
						<input type="text" class="InputName1" id="serialSendtime" value="${smsConfigById.serialSendtime}" placeholder="请输入推迟时间" /> (分钟)
					</div>
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<div class="text-center">
				<a href="javascript:;" onclick="submitDelayMod();" class="default-btn btn-orange noBorder marginLR20">保 存</a>
				<a href="javascript:;" data-dismiss="modal" class="default-btn btn-gray marginLR20">取 消</a>
			</div>
		</div>
	</div>
</div>
<script>
	function submitDelayMod() {
		var configId = $("#configId").val();
		var serialSendtime = $("#serialSendtime").val();
		
		if (!serialSendtime) {
			Modal.alert({msg:"请输入推迟时间"});
			return;
		}
		
		$.ajax({
			type: "post",
			dataType: "json",
			data: {"configId":configId, "serialSendtime":serialSendtime},
			url: "${ctx}/sms/config/delay",
			success: function(result) {
				if (result.code == "0") {
					Modal.alert({msg:"修改成功", okCallback:function() {
						$("#config_delay_time_modal").modal("hide");
						$("#config_delay_time_modal").on("hidden.bs.modal", function() {
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
