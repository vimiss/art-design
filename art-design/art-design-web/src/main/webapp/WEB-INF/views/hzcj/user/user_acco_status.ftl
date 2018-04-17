<!-- 用户账号状态页面 -->
<#include "hzcj/common/option.ftl">
<#assign ctx = request.contextPath>
<!-- Modal -->
<div class="modal-dialog" role="document" style="width: 520px;">
	<div class="modal-content">
		
		<div class="modal-header">
			<button type="button" class="bootbox-close-button close" data-dismiss="modal" aria-hidden="true">×</button>
			
			<h4 class="modal-title">&nbsp;修改</h4>
		</div>
		<div class="modal-body">
			<div class="col-xs-12">
				<div class="col-xs-12" style="display: none;">
					<div class="col-sm-8">
						<label>用户ID：</label>
						<input type="text" class="InputName1" id="userId" value="${userById.userId}" readonly="readonly" />
					</div>
				</div>
				<div class="col-xs-12">
					<div class="col-sm-8">
						<label>账号状态：</label>
						<select class="chosen-select AceSelect" id="userStatus" onchange="userStatusSelected();">
							<#if userById.userStatus == "0">
							<@option name="account_status_param" status="1" value="${userById.userStatus}" show="!2"/>
							<#else>
							<@option name="account_status_param" status="1" type="4" value="${userById.userStatus}" show="${userById.userStatus}"/>
							</#if>
						</select>
					</div>
				</div>
				<div class="col-xs-12" style="display:none;" id="userReasonDiv">
					<div class="col-sm-8">
						<label>账号原因：</label>
						<input type="text" class="InputName1" id="userReason" value="${userById.userReason}" maxlength="30" />
					</div>
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<div class="text-center">
				<#if userById.userStatus == "0">
				<a type="button" href="javascript:;" onclick="submitStatus();" class="default-btn btn-orange marginLR20">保 存</a>
				</#if>
				<a type="button" href="javascript:;" data-dismiss="modal" class="default-btn btn-gray marginLR20">取 消</a>
			</div>
		</div>
	</div>
</div>
<script>
	$(function() {
		var userStatus = $("#userStatus").val();
		if (userStatus == "" || userStatus == "0") {
			$("#userReasonDiv").hide();
			$("#userReasonDiv").find("label").html("账号原因：");
		} else if (userStatus == "1" || userStatus == "2" || userStatus == "3") {
			$("#userReasonDiv").show();
			
			var textVar = $("#userStatus").find("option:selected").text();
			$("#userReasonDiv").find("label").html(textVar + "原因：");
		}
	});
	function userStatusSelected() {
		var userStatus = $("#userStatus").val();
		if (userStatus == "" || userStatus == "0") {
			$("#userReason").val("");
			$("#userReasonDiv").hide();
			$("#userReasonDiv").find("label").html("账号原因：");
		} else if (userStatus == "1" || userStatus == "2" || userStatus == "3") {
			$("#userReason").val("");
			$("#userReasonDiv").show();
			
			var textVar = $("#userStatus").find("option:selected").text();
			$("#userReasonDiv").find("label").html(textVar + "原因：");
		}
	}
	function submitStatus() {
		var userId = $("#userId").val();
		var userStatus = $("#userStatus").val();
		var userStatusText = $("#userStatus").find("option:selected").text();
		var userReason = $("#userReason").val();
		if (!userStatus) {
			Modal.alert({msg:"请选择账号状态"});
			return;
		}
		if (userStatus != "0") {
			if (!userReason) {
				Modal.alert({msg:"请填写" + userStatusText + "原因"});
				return;
			}
		}
		
		var userFp = "${userById.userFp}";
		var infoTitle = "确认提交吗？";
		if (userFp == "3" && userStatus != "0") {
			infoTitle = "当前用户已经认证理财师，如果修改账号状态则无法继续为投资人服务，是否继续？";
		}
		Modal.confirm({msg:infoTitle, okCallback:function() {
			$(this).on("hidden.bs.modal", function() {
				$.ajax({
					type: "post",
					dataType: "json",
					data: {"userId": userId, "userStatus": userStatus, "userReason": userReason},
					url: "${ctx}/user/acco/status",
					success: function(result) {
						if (result.code == "0") {
							Modal.alert({msg:"修改账号状态成功", okCallback:function() {
								$("#user_status_modal").modal("hide");
								$("#user_status_modal").on("hidden.bs.modal", function() {
									$("#queryCommit").click();
									$(this).off("hidden.bs.modal");
								});
							}});
						} else {
							Modal.alert({msg:result.msg});
						}
					}
				});
				
				$(this).off("hidden.bs.modal");
			});
		}});
	}
</script>
