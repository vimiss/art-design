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
						<label>姓<span style="margin-right:28px;"></span>名：</label>
						<input type="hidden" id="fpIdMod" value="${fpStaffById.fpId}" />
						<input type="text" class="InputName1" id="fpNameMod" value="${fpStaffById.fpName}" maxlength="20" readonly="readonly" placeholder="请输入姓名" />
					</div>
				</div>
				<div class="col-xs-12 mb10">
					<div class="col-sm-8">
						<label>性<span style="margin-right:28px;"></span>别：</label>
						<select class="chosen-select AceSelect" id="fpGenderMod" disabled="disabled">
							<@option name="gender_type_param" status="1" value="${fpStaffById.fpGender}"/>
						</select>
					</div>
				</div>
				<div class="col-xs-12 mb10">
					<div class="col-sm-8">
						<label>身份证号：</label>
						<input type="text" class="InputName1" id="fpNumberMod" value="${fpStaffById.fpNumber}" readonly="readonly" placeholder="请输入身份证号" />
					</div>
				</div>
				<div class="col-xs-12 mb10">
					<div class="col-sm-8">
						<label>手机号码：</label>
						<input type="text" class="InputName1" id="fpMobileMod" value="${fpStaffById.fpMobile}" readonly="readonly" placeholder="请输入手机号码" />
					</div>
				</div>
				<div class="col-xs-12 mb10">
					<div class="col-sm-8">
						<label>合作机构：</label>
						<select class="chosen-select AceSelect" id="orgIdMod" disabled="disabled">
							<@option name="org_type_param" status="1" method="getOrgAsOption" value="${fpStaffById.orgId}"/>
						</select>
					</div>
				</div>
				<div class="col-xs-12 mb10">
					<div class="col-sm-8">
						<label>用户状态：</label>
						<select class="chosen-select AceSelect" id="fpStatusMod" onchange="fpStatusSelected();">
							<@option name="account_status_param" status="1" value="${fpStaffById.fpStatus}" show="0,2"/>
						</select>
					</div>
				</div>
				<div class="col-xs-12 mb10" style="display:none;" id="fpReasonDiv">
					<div class="col-sm-8">
						<label>账号原因：</label>
						<input type="text" class="InputName1" id="fpReasonMod" value="${fpStaffById.fpReason}" maxlength="30" />
					</div>
				</div>
				<div class="col-xs-12 mb10">
					<div class="col-sm-12">
						<label>应用头像：</label>
						<button type="button" class="btn btn-primary" id="uploadInfoPhotoMod" >上传头像</button>
						<script type="text/plain" id="uploadInfoPhotoImgMod" style="display:none"></script>
					</div>
					<div class="col-sm-12">
						<label><span style="margin-right:70px;"></span></label>
						<img id="uploadInfoPhotoPathMod" onclick="showImg(this);" />
						<input type="hidden" id="uploadInfoPhotoTitleMod" />
						<input type="hidden" id="uploadInfoPhotoSrcMod" />
					</div>
				</div>
				<div class="col-xs-12 mb10">
					<div class="col-sm-12">
						<label>全身照片：</label>
						<button type="button" class="btn btn-primary" id="uploadInfoFullPhotoMod" >上传全身照</button>
						<script type="text/plain" id="uploadInfoFullPhotoImgMod" style="display:none"></script>
					</div>
					<div class="col-sm-12">
						<label><span style="margin-right:70px;"></span></label>
						<img id="uploadInfoFullPhotoPathMod" onclick="showImg(this);" />
						<input type="hidden" id="uploadInfoFullPhotoTitleMod" />
						<input type="hidden" id="uploadInfoFullPhotoSrcMod" />
					</div>
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<div class="text-center">
				<a type="button" onclick="submitStaffMod();" class="default-btn btn-orange marginLR20">保 存</a>
				<a type="button" data-dismiss="modal" class="default-btn btn-gray marginLR20">关 闭</a>
			</div>
		</div>
	</div>
</div>


<script>
	$(function() { 
		var infoUpPath = "${fpStaffById.infoUpPath}";
		var infoFullUpPath = "${fpStaffById.infoFullUpPath}";
		if (infoUpPath) {
			$("#uploadInfoPhotoPathMod").attr("src", "${ctx}"+infoUpPath);
			$("#uploadInfoPhotoPathMod").attr("width", "100px");
			$("#uploadInfoPhotoPathMod").attr("height", "100px");
		}
		if (infoFullUpPath) {
			$("#uploadInfoFullPhotoPathMod").attr("src", "${ctx}"+infoFullUpPath);
			$("#uploadInfoFullPhotoPathMod").attr("width", "80%");
			$("#uploadInfoFullPhotoPathMod").attr("height", "40%");
		}
		
		// 上传头像
		$("#uploadInfoPhotoMod").click(function(){
			var dialog = uploadInfoPhotoImgUe.getDialog('insertimage');
			dialog.open();
		});

		// 实例化上传图片窗口 
		var uploadInfoPhotoImgUe = UE.getEditor('uploadInfoPhotoImgMod', {
			disabledTableInTable:false,
			allowDivTransToP:false,
			wordCount:false,
			elementPathEnabled:false,
			zIndex:2147483646
		});

		// 上传图片之后的回调函数
		uploadInfoPhotoImgUe.addListener("afterInsertImage", function(t, arg) {
			$.each(arg, function(n, value) {
				$("#uploadInfoPhotoPathMod").attr("src", value.src);
				$("#uploadInfoPhotoPathMod").attr("width", "100px");
				$("#uploadInfoPhotoPathMod").attr("height", "100px");
				
				$("#uploadInfoPhotoTitleMod").val(value.title);
				$("#uploadInfoPhotoSrcMod").val(value.src);
			});
		});
		
		// 上传全身照
		$("#uploadInfoFullPhotoMod").click(function(){
			var dialog = uploadInfoFullPhotoImgUe.getDialog('insertimage');
			dialog.open();
		});

		// 实例化上传图片窗口 
		var uploadInfoFullPhotoImgUe = UE.getEditor('uploadInfoFullPhotoImgMod', {
			disabledTableInTable:false,
			allowDivTransToP:false,
			wordCount:false,
			elementPathEnabled:false,
			zIndex:2147483647
		});

		// 上传图片之后的回调函数
		uploadInfoFullPhotoImgUe.addListener("afterInsertImage", function(t, arg) {
			$.each(arg, function(n, value) {
				$("#uploadInfoFullPhotoPathMod").attr("src", value.src);
				$("#uploadInfoFullPhotoPathMod").attr("width", "80%");
				$("#uploadInfoFullPhotoPathMod").attr("height", "40%");
				
				$("#uploadInfoFullPhotoTitleMod").val(value.title);
				$("#uploadInfoFullPhotoSrcMod").val(value.src);
			});
		});
	});
	
	function fpStatusSelected() {
		var fpStatusMod = $("#fpStatusMod").val();
		if (fpStatusMod == "" || fpStatusMod == "0") {
			$("#fpReasonMod").val("");
			$("#fpReasonDiv").hide();
			$("#fpReasonDiv").find("label").html("账号原因：");
		} else if (fpStatusMod == "1" || fpStatusMod == "2" || fpStatusMod == "3") {
			$("#fpReasonMod").val("");
			$("#fpReasonDiv").show();
			
			var textVar = $("#fpStatusMod").find("option:selected").text();
			$("#fpReasonDiv").find("label").html(textVar + "原因：");
		}
	}
	function submitStaffMod() {
		var fpId = $("#fpIdMod").val();
		var fpName = $("#fpNameMod").val();
		var fpGender = $("#fpGenderMod").val();
		var fpNumber = $("#fpNumberMod").val();
		var fpMobile = $("#fpMobileMod").val();
		var orgId = $("#orgIdMod").val();
		var fpStatus = $("#fpStatusMod").val();
		var fpStatusText = $("#fpStatusMod").find("option:selected").text();
		var fpReason = $("#fpReasonMod").val();
		var uploadInfoPhotoPath = $("#uploadInfoPhotoPathMod").attr("src");
		var uploadInfoFullPhotoPath = $("#uploadInfoFullPhotoPathMod").attr("src");
		
		var infoUpName = $("#uploadInfoPhotoTitleMod").val();
		var infoUpPath = $("#uploadInfoPhotoSrcMod").val();
		var infoFullUpName = $("#uploadInfoFullPhotoTitleMod").val();
		var infoFullUpPath = $("#uploadInfoFullPhotoSrcMod").val();
		
		if (!fpName) {
			Modal.alert({msg:"请输入姓名"});
			return;
		}
		if (!fpGender) {
			Modal.alert({msg:"请选择性别"});
			return;
		}
		if (!fpNumber) {
			Modal.alert({msg:"请输入身份证号"});
			return;
		}
		var numberReg = /^(\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x))$/;
		if (!numberReg.test(fpNumber)) {
			Modal.alert({msg:"请输入正确的身份证号"});
			return;
		}
		if (!fpMobile) {
			Modal.alert({msg:"请输入手机号码"});
			return;
		}
		var mobileReg = /^1\d{10}$/;
		if (!mobileReg.test(fpMobile)) {
			Modal.alert({msg:"请输入正确的手机号码"});
			return;
		}
		if (!orgId) {
			Modal.alert({msg:"请选择合作机构"});
			return;
		}
		if (!fpStatus) {
			Modal.alert({msg:"请选择用户状态"});
			return;
		}
		if (fpStatus != "0") {
			if (!fpReason) {
				Modal.alert({msg:"请填写" + fpStatusText + "原因"});
				return;
			}
		}
		if (!uploadInfoPhotoPath) {
			Modal.alert({msg:"请选择应用头像"});
			return;
		}
		if (!uploadInfoFullPhotoPath) {
			Modal.alert({msg:"请选择全身照片"});
			return;
		}
		
		var dataVar = {
			"fpId":fpId, "orgId":orgId, "fpName":fpName, "fpGender":fpGender, 
			"fpNumber":fpNumber, "fpMobile":fpMobile, "fpStatus":fpStatus, "fpReason":fpReason
		};
		//if (infoUpPath) {
			dataVar.infoUpId = "${fpStaffById.infoUpId}";
			dataVar.infoUpName = infoUpName;
			dataVar.infoUpPath = infoUpPath;
		//}
		//if (infoFullUpPath) {
			dataVar.infoFullUpId = "${fpStaffById.infoFullUpId}";
			dataVar.infoFullUpName = infoFullUpName;
			dataVar.infoFullUpPath = infoFullUpPath;
		//}
		
		var infoTitle = "确认提交吗？";
		if (fpStatus != "0") {
			infoTitle = "确认要修改用户状态吗？";
		}
		Modal.confirm({msg:infoTitle, okCallback:function() {
			$(this).on("hidden.bs.modal", function() {
				$.ajax({
					type: "post",
					dataType: "json",
					data: dataVar,
					url: "${ctx}/user/fp/staff/mod",
					success: function(result) {
						if (result.code == "0") {
							Modal.alert({msg:"修改成功", okCallback:function() {
								$("#fp_staff_mod_modal").modal("hide");
								$("#fp_staff_mod_modal").on("hidden.bs.modal", function() {
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
