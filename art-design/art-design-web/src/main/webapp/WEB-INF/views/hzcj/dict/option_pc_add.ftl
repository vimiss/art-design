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
						<input type="text" class="InputName1" id="optionAddPcCode" placeholder="请输入城市编码" />
					</div>
				</div>
				<div class="col-xs-12 mb10">
					<div class="col-sm-8">
						<label>城市名称：</label>
						<input type="text" class="InputName1" id="optionAddPcName" placeholder="请输入城市名称" />
					</div>
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<div class="text-center">
				<a type="button" onclick="submitOptionPcAdd('${pcProvinceCode}');" class="default-btn btn-orange marginLR20">保 存</a>
				<a type="button" onclick="closeOptionPcAdd();" class="default-btn btn-gray marginLR20">取 消</a>
			</div>
		</div>
	</div>
</div>
<script>
	function submitOptionPcAdd(pcProvinceCode) {
		var optionAddPcCode = $("#optionAddPcCode").val();
		var optionAddPcName = $("#optionAddPcName").val();
		if (!optionAddPcCode) {
			Modal.alert({msg:"请填写城市编码"});
			return;
		}
		if (!optionAddPcName) {
			Modal.alert({msg:"请填写城市名称"});
			return;
		}
		$.ajax({
			type: "post",
			dataType: "json",
			data: {"pcCode": optionAddPcCode, "pcName": optionAddPcName, "pcLevel": "2", "pcProvinceCode": pcProvinceCode},
			url: "${ctx}/dict/option/pc/add",
			success: function(result) {
				if (result.code == "0") {
					Modal.alert({msg:"新增成功", okCallback:function() {
						closeOptionPcAdd();
						$("#option_pc_add_modal").on("hidden.bs.modal", function() {
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
