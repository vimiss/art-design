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
					<div class="col-sm-8">
						<label>城市编码：</label>
						<input type="text" class="InputName1" id="paramAddPcCode" maxlength="6" placeholder="请输入城市编码" />
					</div>
				</div>
				<div class="col-xs-12 mb10">
					<div class="col-sm-8">
						<label>城市名称：</label>
						<input type="text" class="InputName1" id="paramAddPcName" placeholder="请输入城市名称" />
					</div>
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<div class="text-center">
				<a type="button" onclick="submitParamPcAdd();" class="default-btn btn-orange marginLR20">保 存</a>
				<a type="button" onclick="closeParamPcAdd();"  class="default-btn btn-gray marginLR20">取 消</a>
			</div>
		</div>
	</div>
</div>
<script>
	function submitParamPcAdd() {
		var paramAddPcCode = $("#paramAddPcCode").val();
		var paramAddPcName = $("#paramAddPcName").val();
		if (!paramAddPcCode) {
			Modal.alert({msg:"请填写城市编码"});
			return;
		}
		if (!paramAddPcName) {
			Modal.alert({msg:"请填写城市名称"});
			return;
		}
		$.ajax({
			type: "post",
			dataType: "json",
			data: {"pcCode": paramAddPcCode, "pcName": paramAddPcName, "pcLevel": "1"},
			url: "${ctx}/dict/param/pc/add",
			success: function(result) {
				if (result.code == "0") {
					Modal.alert({msg:"新增成功", okCallback:function() {
						closeParamPcAdd();
						$("#param_pc_add_modal").on("hidden.bs.modal", function() {
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
