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
						<label>短<span style="margin-right:3px;">&nbsp;</span>信<span style="margin-right:3px;">&nbsp;</span>头：</label>
						<input type="hidden" id="configId" value="${smsConfigById.configId}" />
						<input type="text" class="InputName1" id="serialHead" value="${smsConfigById.serialHead}" placeholder="请输入短信头" />
					</div>
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<div class="text-center">
				<a href="javascript:;" onclick="submitHeadMod();" class="default-btn btn-orange noBorder marginLR20">保 存</a>
				<a href="javascript:;" data-dismiss="modal" class="default-btn btn-gray marginLR20">取 消</a>
			</div>
		</div>
	</div>
</div>
<script>
	function submitHeadMod() {
		var configId = $("#configId").val();
		var serialHead = $("#serialHead").val();
		
		if (!serialHead) {
			Modal.alert({msg:"请输入短信头"});
			return;
		}
		
		$.ajax({
			type: "post",
			dataType: "json",
			data: {"configId":configId, "serialHead":serialHead},
			url: "${ctx}/sms/config/head",
			success: function(result) {
				if (result.code == "0") {
					Modal.alert({msg:"修改成功", okCallback:function() {
						$("#config_serial_head_modal").modal("hide");
						$("#config_serial_head_modal").on("hidden.bs.modal", function() {
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
