<!-- 数据字典详情页面 -->
<#assign ctx = request.contextPath>
<!-- Modal -->
<div class="modal-dialog" role="document" style="width: 600px;">
	<div class="modal-content">
		
		<div class="modal-header">
			<button type="button" class="bootbox-close-button close" data-dismiss="modal" aria-hidden="true">×</button>
			
			<h4 class="modal-title">&nbsp;修改</h4>
		</div>
		<div class="modal-body">
			<div class="col-xs-12">
				<div class="col-xs-12 mb10">
					<div class="col-sm-8">
						<label>城市编码：</label>
						<input type="text" class="InputName1" id="paramModPcCodeMod" value="${paramPcDetail.pcCode}" maxlength="6" readonly="readonly" placeholder="请输入城市编码" />
					</div>
				</div>
				<div class="col-xs-12 mb10">
					<div class="col-sm-8">
						<label>城市名称：</label>
						<input type="text" class="InputName1" id="paramModPcNameMod" value="${paramPcDetail.pcName}" placeholder="请输入城市名称" />
					</div>
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<div class="text-center">
				<a type="button" onclick="submitParamPcMod('${paramPcDetail.pcCode}');" class="default-btn btn-orange marginLR20">保 存</a>
				<a type="button" onclick="closeParamPcMod();" class="default-btn btn-gray marginLR20">取 消</a>
			</div>
		</div>
	</div>
</div>
<script>
	function submitParamPcMod(pcCode) {
		var paramModPcName = $("#paramModPcNameMod").val();
		if (!paramModPcName) {
			Modal.alert({msg:"请填写城市名称"});
			return;
		}
		$.ajax({
			type: "post",
			dataType: "json",
			data: {"pcCode": pcCode, "pcName": paramModPcName},
			url: "${ctx}/dict/param/pc/modify",
			success: function(result) {
				if (result.code == "0") {
					Modal.alert({msg:"修改成功", okCallback:function() {
						closeParamPcMod();
						$("#param_pc_mod_modal").on("hidden.bs.modal", function() {
							closeParamPcList();
							$(this).off("hidden.bs.modal");
						});
						$("#param_pc_list_modal").on("hidden.bs.modal", function() {
							queryParamPcList();
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
