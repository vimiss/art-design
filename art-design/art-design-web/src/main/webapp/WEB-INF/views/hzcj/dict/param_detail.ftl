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
				<div class="col-xs-12 mb10">
					<div class="col-sm-8">
						<label>参数名称：</label>
						<input type="text" class="InputName1" id="paramNameMod" value="${paramDetail.paramName}" readonly="readonly" placeholder="请输入参数名称" />
					</div>
				</div>
				<div class="col-xs-12 mb10">
					<div class="col-sm-8">
						<label>参数别名：</label>
						<input type="text" class="InputName1" id="paramAlaisMod" value="${paramDetail.paramAlais}" readonly="readonly" placeholder="请输入参数别名" />
					</div>
				</div>
				<div class="col-xs-12 mb10">
					<div class="col-sm-8">
						<label>参数描述：</label>
						<input type="text" class="InputName1" id="paramDescMod" value="${paramDetail.paramDesc}" placeholder="请输入参数描述" />
					</div>
				</div>
				<div class="col-xs-12 mb10">
					<div class="col-sm-8">
						<label>是否使用：</label>
						<select class="chosen-select AceSelect" id="paramStatusMod" >
							<@option name="status_param" status="1" value="${paramDetail.paramStatus}"/>
						</select>
					</div>
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<div class="text-center">
				<a type="button" onclick="submitParamDetail(${paramDetail.paramId});" class="default-btn btn-orange marginLR20">保 存</a>
				<a type="button" onclick="closeParamDetail();"  class="default-btn btn-gray marginLR20">取 消</a>
			</div>
		</div>
	</div>
</div>
<script>
	function submitParamDetail(paramId) {
		var paramName = $("#paramNameMod").val();
		var paramAlais = $("#paramAlaisMod").val();
		var paramDesc = $("#paramDescMod").val();
		var paramStatus = $("#paramStatusMod").val();
		if (!paramName) {
			Modal.alert({msg:"请填写参数名称"});
			return;
		}
		if (!paramAlais) {
			Modal.alert({msg:"请填写参数别名"});
			return;
		}
		if (!paramDesc) {
			Modal.alert({msg:"请填写参数描述"});
			return;
		}
		if (!paramStatus) {
			Modal.alert({msg:"请选择使用状态"});
			return;
		}
		$.ajax({
			type: "post",
			dataType: "json",
			data: {"paramId": paramId, "paramName": paramName, "paramAlais": paramAlais, "paramDesc": paramDesc, "paramStatus": paramStatus},
			url: "${ctx}/dict/param/modify",
			success: function(result) {
				if (result.code == "0") {
					Modal.alert({msg:"修改成功", okCallback:function() {
						closeParamDetail();
						$("#param_detail_modal").on("hidden.bs.modal", function() {
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
