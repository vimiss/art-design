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
						<input type="text" class="InputName1" id="optionModPcCodeMod" value="${optionPcDetail.pcCode}" readonly="readonly" placeholder="请输入城市编码" />
					</div>
				</div>
				<div class="col-xs-12 mb10">
					<div class="col-sm-8">
						<label>城市名称：</label>
						<input type="text" class="InputName1" id="optionModPcNameMod" value="${optionPcDetail.pcName}" placeholder="请输入城市名称" />
					</div>
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<div class="text-center">
				<a type="button" onclick="submitOptionPcMod('${optionPcDetail.pcCode}', '${pcProvinceCode}');" class="default-btn btn-orange marginLR20">保 存</a>
				<a type="button" onclick="closeOptionPcMod();" class="default-btn btn-gray marginLR20">取 消</a>
			</div>
		</div>
	</div>
</div>
<script>
	function submitOptionPcMod(pcCode, pcProvinceCode) {
		var optionModPcName = $("#optionModPcNameMod").val();
		if (!optionModPcName) {
			Modal.alert({msg:"请填写城市名称"});
			return;
		}
		$.ajax({
			type: "post",
			dataType: "json",
			data: {"pcCode": pcCode, "pcName": optionModPcName},
			url: "${ctx}/dict/option/pc/modify",
			success: function(result) {
				if (result.code == "0") {
					Modal.alert({msg:"修改成功", okCallback:function() {
						closeOptionPcMod();
						$("#option_pc_mod_modal").on("hidden.bs.modal", function() {
							closeOptionPcList();
							$(this).off("hidden.bs.modal");
						});
						$("#option_pc_list_modal").on("hidden.bs.modal", function() {
							queryOptionPcList(pcProvinceCode);
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
