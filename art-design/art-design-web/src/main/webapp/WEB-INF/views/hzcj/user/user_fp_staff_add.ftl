<!-- 数据字典详情页面 -->
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
						<label>姓<span style="margin-right:28px;"></span>名：</label>
						<input type="text" class="InputName1" id="fpName" maxlength="20" placeholder="请输入姓名" />
					</div>
				</div>
				<div class="col-xs-12 mb10">
					<div class="col-sm-8">
						<label>性<span style="margin-right:28px;"></span>别：</label>
						<select class="chosen-select AceSelect" id="fpGender" >
							<@option name="gender_type_param" status="1" type="2" />
						</select>
					</div>
				</div>
				<div class="col-xs-12 mb10">
					<div class="col-sm-8">
						<label>身份证号：</label>
						<input type="text" class="InputName1" id="fpNumber" maxlength="18" placeholder="请输入身份证号" />
					</div>
				</div>
				<div class="col-xs-12 mb10">
					<div class="col-sm-8">
						<label>手机号码：</label>
						<input type="text" class="InputName1" id="fpMobile" maxlength="11" placeholder="请输入手机号码" />
					</div>
				</div>
				<div class="col-xs-12 mb10">
					<div class="col-sm-8">
						<label>合作机构：</label>
						<select class="chosen-select AceSelect" id="orgId" >
							<@option name="org_type_param" status="1" method="getOrgAsOption" type="2" />
						</select>
					</div>
				</div>
				<div class="col-xs-12">
					<div class="col-sm-12">
						<label>应用头像：</label>
						<button type="button" class="btn btn-primary" id="uploadInfoPhoto" >上传头像</button>
						<script type="text/plain" id="uploadInfoPhotoImg" style="display:none"></script>
					</div>
					<div class="col-sm-12">
						<label><span style="margin-right:70px;"></span></label>
						<img id="uploadInfoPhotoPath" onclick="showImg(this);" />
						<input type="hidden" id="uploadInfoPhotoTitle" />
						<input type="hidden" id="uploadInfoPhotoSrc" />
					</div>
				</div>
				<div class="col-xs-12">
					<div class="col-sm-12 mb10">
						<label>全身照片：</label>
						<button type="button" class="btn btn-primary" id="uploadInfoFullPhoto" >上传全身照</button>
						<script type="text/plain" id="uploadInfoFullPhotoImg" style="display:none"></script>
					</div>
					<div class="col-sm-12">
						<label><span style="margin-right:70px;"></span></label>
						<img id="uploadInfoFullPhotoPath" onclick="showImg(this);" />
						<input type="hidden" id="uploadInfoFullPhotoTitle" />
						<input type="hidden" id="uploadInfoFullPhotoSrc" />
					</div>
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<div class="text-center">
				<a type="button" onclick="submitStaffAdd();" class="default-btn btn-orange marginLR20">保 存</a>
				<a type="button" data-dismiss="modal"  class="default-btn btn-gray marginLR20">关 闭</a>
			</div>
		</div>
	</div>
</div>
<script>
	$(function() {
		// 上传头像
		$("#uploadInfoPhoto").click(function(){
			var dialog = uploadInfoPhotoImgUe.getDialog('insertimage');
			dialog.open();
		});

		// 实例化上传图片窗口 
		var uploadInfoPhotoImgUe = UE.getEditor('uploadInfoPhotoImg', {
			disabledTableInTable:false,
			allowDivTransToP:false,
			wordCount:false,
			elementPathEnabled:false,
			zIndex:2147483646
		});

		// 上传图片之后的回调函数
		uploadInfoPhotoImgUe.addListener("afterInsertImage", function(t, arg) {
			$.each(arg, function(n, value) {
				$("#uploadInfoPhotoPath").attr("src", value.src);
				$("#uploadInfoPhotoPath").attr("width", "100px");
				$("#uploadInfoPhotoPath").attr("height", "100px");
				
				$("#uploadInfoPhotoTitle").val(value.title);
				$("#uploadInfoPhotoSrc").val(value.src);
			});
		});
		
		// 上传全身照
		$("#uploadInfoFullPhoto").click(function(){
			var dialog = uploadInfoFullPhotoImgUe.getDialog('insertimage');
			dialog.open();
		});

		// 实例化上传图片窗口 
		var uploadInfoFullPhotoImgUe = UE.getEditor('uploadInfoFullPhotoImg', {
			disabledTableInTable:false,
			allowDivTransToP:false,
			wordCount:false,
			elementPathEnabled:false,
			zIndex:2147483647
		});

		// 上传图片之后的回调函数
		uploadInfoFullPhotoImgUe.addListener("afterInsertImage", function(t, arg) {
			$.each(arg, function(n, value) {
				$("#uploadInfoFullPhotoPath").attr("src", value.src);
				$("#uploadInfoFullPhotoPath").attr("width", "80%");
				$("#uploadInfoFullPhotoPath").attr("height", "40%");
				
				$("#uploadInfoFullPhotoTitle").val(value.title);
				$("#uploadInfoFullPhotoSrc").val(value.src);
			});
		});
	});
	
	function submitStaffAdd() {
		var fpName = $("#fpName").val();
		var fpGender = $("#fpGender").val();
		var fpNumber = $("#fpNumber").val();
		var fpMobile = $("#fpMobile").val();
		var orgId = $("#orgId").val();
		var uploadInfoPhotoPath = $("#uploadInfoPhotoPath").attr("src");
		var uploadInfoFullPhotoPath = $("#uploadInfoFullPhotoPath").attr("src");
		
		var infoUpName = $("#uploadInfoPhotoTitle").val();
		var infoUpPath = $("#uploadInfoPhotoSrc").val();
		var infoFullUpName = $("#uploadInfoFullPhotoTitle").val();
		var infoFullUpPath = $("#uploadInfoFullPhotoSrc").val();
		
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
		if (!uploadInfoPhotoPath) {
			Modal.alert({msg:"请选择应用头像"});
			return;
		}
		if (!uploadInfoFullPhotoPath) {
			Modal.alert({msg:"请选择全身照片"});
			return;
		}
		
		$.ajax({
			type: "post",
			dataType: "json",
			data: {
				"orgId":orgId, "fpName":fpName, "fpGender":fpGender, 
				"fpNumber":fpNumber, "fpMobile":fpMobile, "fpStatus":"0", 
				"infoUpName":infoUpName, "infoUpPath":infoUpPath, "fpAccoStatus":"0", 
				"infoFullUpName":infoFullUpName, "infoFullUpPath":infoFullUpPath
			},
			url: "${ctx}/user/fp/staff/add",
			success: function(result) {
				if (result.code == "0") {
					Modal.alert({msg:"新增成功", okCallback:function() {
						$("#fp_staff_add_modal").modal("hide");
						$("#fp_staff_add_modal").on("hidden.bs.modal", function() {
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
