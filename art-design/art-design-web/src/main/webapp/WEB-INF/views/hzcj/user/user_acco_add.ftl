<!-- 用户新增页面 -->
<#assign ctx = request.contextPath>
<#include "hzcj/common/option.ftl">
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
						<label>手机号码：</label>
						<input type="text" class="InputName1" id="accoUsername" maxlength="11" placeholder="请输入手机号码" />
					</div>
				</div>
				<div class="col-xs-12 mb10">
					<div class="col-sm-8">
						<label>签约状态：</label>
						 <select class="chosen-select AceSelect" id="staffStatus" onchange="staffStatusSelected();">
							<@option name="yes_no_type_param" status="1" type="2" />
						</select>
					</div>
				</div>
				<div style="display:none;" id="staffStatusDiv">
					<div class="col-xs-12 mb10">
						<div class="col-sm-8">
							<label>生成状态：</label>
							 <select class="chosen-select AceSelect" id="buildType" onchange="buildTypeSelected();">
								<@option name="build_type_param" status="1" type="4" />
							</select>
						</div>
					</div>
					<div class="col-xs-12 mb10">
						<div class="col-sm-8">
							<label>服<span style="margin-right:7px;"></span>务<span style="margin-right:7px;"></span>码：</label>
							 <input type="text" class="InputName1" maxlength="4" id="archCode" placeholder="请输入服务码" readonly="readonly" />
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<div class="text-center">
				<a type="button" onclick="submitAccoAdd();" class="default-btn btn-orange marginLR20">保 存</a>
				<a type="button" data-dismiss="modal" class="default-btn btn-gray marginLR20">取 消</a>
			</div>
		</div>
	</div>
</div>
<script>
	function staffStatusSelected() {
		var staffStatus = $("#staffStatus").val();
		if (staffStatus == "1") {
			$("#staffStatusDiv").show();
		} else {
			$("#staffStatusDiv").hide();
		}
	}
	function buildTypeSelected() {
		var buildType = $("#buildType").val();
		if (buildType == "1") {
			$("#archCode").removeAttr("readonly");
		} else {
			$("#archCode").val("");
			$("#archCode").attr("readonly", "readonly");
		}
	}
	function submitAccoAdd() {
		var accoUsername = $("#accoUsername").val();
		var staffStatus = $("#staffStatus").val();
		var buildType = $("#buildType").val();
		var archCode = $("#archCode").val();
		
		if (!accoUsername) {
			Modal.alert({msg:"请输入手机号码"});
			return;
		}
		var mobileReg = /^1\d{10}$/;
		if (!mobileReg.test(accoUsername)) {
			Modal.alert({msg:"请输入正确的手机号码"});
			return;
		}
		if (!staffStatus) {
			Modal.alert({msg:"请选择签约状态"});
			return;
		}
		if (staffStatus == "1") {
			if (buildType == "1") {
				if (!archCode) {
					Modal.alert({msg:"请输入服务码"});
					return;
				}
			}
		}
		
		$.ajax({
			type:"post",
			dataType:"json",
			data:{
				"accoUsername":accoUsername, "staffStatus":staffStatus, "accoType":"1", "accoOpenType":"03", 
				"buildType":buildType, "archCode":archCode
			},
			url:"${ctx}/user/acco/add",
			success:function(result) {
				if (result.code == "0") {
					Modal.alert({msg:"新增成功", okCallback:function() {
						$("#user_acco_add_modal").modal("hide");
						$("#user_acco_add_modal").on("hidden.bs.modal", function() {
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
