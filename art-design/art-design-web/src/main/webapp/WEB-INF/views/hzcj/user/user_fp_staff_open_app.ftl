<!-- 用户新增页面 -->
<#assign ctx = request.contextPath>
<#include "hzcj/common/option.ftl">
<!-- Modal -->
<div class="modal-dialog" role="document" style="width: 600px;">
	<div class="modal-content">
		
		<div class="modal-header">
			<button type="button" class="bootbox-close-button close" data-dismiss="modal" aria-hidden="true">×</button>
			
			<h4 class="modal-title">&nbsp;开通App账号</h4>
		</div>
		<div class="modal-body">
			<div class="col-xs-12">
				<div class="col-xs-12 mb10">
					<div class="col-sm-8">
						<label>手机号码：</label>
						<input type="text" class="InputName1" id="fpMobileOpenApp" value="${fpStaffById.fpMobile}" readonly="readonly" />
					</div>
				</div>
				<div class="col-xs-12 mb10">
					<div class="col-sm-8">
						<label>生成状态：</label>
						 <select class="chosen-select AceSelect" id="buildTypeOpenApp" onchange="buildTypeSelected();">
							<@option name="build_type_param" status="1" type="4" />
						</select>
					</div>
				</div>
				<div class="col-xs-12 mb10">
					<div class="col-sm-8">
						<label>服<span style="margin-right:7px;"></span>务<span style="margin-right:7px;"></span>码：</label>
						 <input type="text" class="InputName1" maxlength="4" id="archCodeOpenApp" placeholder="请输入服务码" readonly="readonly" />
					</div>
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<div class="text-center">
				<a type="button" onclick="submitOpenApp(${fpStaffById.fpId}, '${fpStaffById.fpAccoStatus}');" class="default-btn btn-orange marginLR20">保 存</a>
				<a type="button" data-dismiss="modal" class="default-btn btn-gray marginLR20">关 闭</a>
			</div>
		</div>
	</div>
</div>
<script>
	function buildTypeSelected() {
		var buildType = $("#buildTypeOpenApp").val();
		if (buildType == "1") {
			$("#archCodeOpenApp").removeAttr("readonly");
		} else {
			$("#archCodeOpenApp").val("");
			$("#archCodeOpenApp").attr("readonly", "readonly");
		}
	}
	function submitOpenApp(fpId, fpAccoStatus) {
		var buildType = $("#buildTypeOpenApp").val();
		var archCode = $("#archCodeOpenApp").val();
		
		if (buildType == "1") {
			if (!archCode) {
				Modal.alert({msg:"请输入服务码"});
				return;
			}
		}
		if (fpAccoStatus == "1") {
			Modal.alert({msg:"当前用户已经开通App账号"});
			return;
		}
		
		$.ajax({
			type: "post",
			dataType: "json",
			data: {"fpId":fpId, "staffStatus":"1", "accoType":"1", "accoOpenType":"04", "buildType":buildType, "archCode":archCode},
			url: "${ctx}/user/fp/staff/open",
			success: function(result) {
				if (result.code == "0") {
					Modal.alert({msg:"开通App账号成功", okCallback:function() {
						$("#queryCommit").click();
					}});
				} else {
					Modal.alert({msg:result.msg});
				}
			}
		});
	}
</script>
