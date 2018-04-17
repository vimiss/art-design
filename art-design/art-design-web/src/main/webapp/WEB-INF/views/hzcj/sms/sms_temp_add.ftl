<!-- 数据字典详情页面 -->
<#assign ctx = request.contextPath>
<!-- Modal -->
<div class="modal-dialog" role="document" style="width: 600px;">
	<div class="modal-content">
		
		<div class="modal-header">
			<button type="button" class="bootbox-close-button close" data-dismiss="modal" aria-hidden="true">×</button>
			
			<h4 class="modal-title">&nbsp;新增</h4>
		</div>
		<div class="modal-body">
			<div class="col-xs-12">
				<div class="col-xs-12 mb10">
					<div class="col-sm-12">
						<label>模板编码：</label>
						<input type="text" class="InputName1" id="tempCode" placeholder="请输入模板编码" />
					</div>
				</div>
				<div class="col-xs-12 mb10">
					<div class="col-sm-12">
						<label>模板名称：</label>
						<input type="text" class="InputName1" id="tempName" placeholder="请输入模板名称" />
					</div>
				</div>
				<div class="col-xs-12 mb10">
					<div class="col-sm-12">
						<label>模板内容：</label>
						<textarea class="InputName2" id="tempContent"></textarea>
					</div>
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<div class="text-center">
				<a type="button" onclick="submitTempAdd();" class="default-btn btn-orange marginLR20">保 存</a>
				<a type="button" data-dismiss="modal" class="default-btn btn-gray marginLR20">取 消</a>
			</div>
		</div>
	</div>
</div>
<script>
	function submitTempAdd() {
		var tempCode = $("#tempCode").val();
		var tempName = $("#tempName").val();
		var tempContent = $("#tempContent").val();
		
		if (!tempCode) {
			Modal.alert({msg:"请输入模板编码"});
			return;
		}
		if (!tempName) {
			Modal.alert({msg:"请输入模板名称"});
			return;
		}
		if (!tempContent) {
			Modal.alert({msg:"请输入模板内容"});
			return;
		}
		
		$.ajax({
			type: "post",
			dataType: "json",
			data: {"tempCode":tempCode, "tempName":tempName, "tempContent":tempContent},
			url: "${ctx}/sms/temp/add",
			success: function(result) {
				if (result.code == "0") {
					Modal.alert({msg:"新增成功", okCallback:function() {
						$("#sms_temp_add_modal").modal("hide");
						$("#sms_temp_add_modal").on("hidden.bs.modal", function() {
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
