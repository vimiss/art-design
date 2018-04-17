<!-- 数据字典详情页面 -->
<#assign ctx = request.contextPath>
<#include "hzcj/common/option.ftl">

<!-- Modal -->
<div class="modal-dialog" role="document" style="width: 600px;">
	<div class="modal-content">
		
		<div class="modal-header">
			<button type="button" class="bootbox-close-button close" data-dismiss="modal" aria-hidden="true">×</button>
			
			<h4 class="modal-title">&nbsp;职业档案</h4>
		</div>
		<div class="modal-body">
			<div class="col-xs-12">
				<div class="col-xs-12 mb10">
					<div class="col-sm-8">
						<label>姓<span style="margin-right:28px;"></span>名：</label>
						<input type="hidden" id="archIdMod" value="${userFpArchiveById.archId}" />
						<input type="hidden" id="userIdMod" value="${userFpArchiveById.userId}" />
						<input type="text" class="InputName1" id="archNameMod" maxlength="20" value="${fpStaffById.fpName}" readonly="readonly" />
					</div>
				</div>
				<div class="col-xs-12 mb10">
					<div class="col-sm-8">
						<label>性<span style="margin-right:28px;"></span>别：</label>
						<select class="chosen-select AceSelect" id="archGenderMod" >
							<@option name="gender_type_param" status="1" value="${userFpArchiveById.archGender?exists?string(userFpArchiveById.archGender, fpStaffById.fpGender)}"/>
						</select>
					</div>
				</div>
				<div class="col-xs-12">
					<div class="col-sm-8 mb10">
						<label>年<span style="margin-right:28px;"></span>龄：</label>
						<select class="chosen-select AceSelect" id="archAgeMod">
							<@option name="age_type_param" status="1" value="${userFpArchiveById.archAge}"/>
						</select>
					</div>
				</div>
				<div class="col-xs-12">
					<div class="col-sm-8 mb10">
						<label>籍<span style="margin-right:28px;"></span>贯：</label>
						<input type="text" class="InputName1" id="archPlaceMod" value="${userFpArchiveById.archPlace}" maxlength="30" placeholder="请输入籍贯" />
					</div>
				</div>
				<div class="col-xs-12">
					<div class="col-sm-8 mb10">
						<label>毕业院校：</label>
						<input type="text" class="InputName1" id="archSchoolMod" value="${userFpArchiveById.archSchool}" maxlength="30" placeholder="请输入毕业院校" />
					</div>
				</div>
				<div class="col-xs-12">
					<div class="col-sm-8 mb10">
						<label>联系电话：</label>
						<input type="text" class="InputName1" id="archPhoneMod" value="${fpStaffById.fpMobile}" readonly="readonly" />
					</div>
				</div>
				<div class="col-xs-12">
					<div class="col-sm-8 mb10">
						<label>电子邮件：</label>
						<input type="text" class="InputName1" id="archEmailMod" value="${userFpArchiveById.archEmail}" maxlength="30" placeholder="请输入电子邮件" />
					</div>
				</div>
				<div class="col-xs-12">
					<div class="col-sm-12 mb10">
						<label>所在城市：</label>
						<select class="chosen-select AceSelect" id="archProvinceMod" onchange="pcChange(this);">
							<@option name="province_type_param" status="1" method="getProvinceAsOption" value="${userFpArchiveById.archProvince}"/>
						</select>
						<select class="chosen-select AceSelect" id="archCityMod">
							<@option name="city_type_param" status="1" method="getCityAsOption" code="${userFpArchiveById.archProvince}" value="${userFpArchiveById.archCity}"/>
						</select>
					</div>
				</div>
				<div class="col-xs-12">
					<div class="col-sm-8 mb10">
						<label>公司名称：</label>
						<input type="text" class="InputName1" id="archCompanyMod" value="${fpOrgById.orgName}" readonly="readonly" />
					</div>
				</div>
				<div class="col-xs-12">
					<div class="col-sm-8 mb10">
						<label>公司地址：</label>
						<input type="text" class="InputName1" id="archCompanyAddressMod" value="${fpOrgById.orgAddress}" readonly="readonly" />
					</div>
				</div>
				<div class="col-xs-12">
					<div class="col-sm-8 mb10">
						<label>从业年限：</label>
						<select class="chosen-select AceSelect" id="archPeriodMod">
							<@option name="archive_period_type_param" status="1" value="${userFpArchiveById.archPeriod}"/>
						</select>
					</div>
				</div>
				<div class="col-xs-12">
					<div class="col-sm-8 mb10">
						<label>职业生涯：</label>
						<textarea class="InputName2" id="archDescMod" maxlength="100">${userFpArchiveById.archDesc}</textarea>
					</div>
				</div>
				<div class="col-xs-12">
					<div class="col-sm-8 mb10">
						<label>擅长领域：</label>
						<textarea class="InputName2" id="archAdeptMod" maxlength="100">${userFpArchiveById.archAdept}</textarea>
					</div>
				</div>
				<div class="col-xs-12">
					<div class="col-sm-8 mb10">
						<label>奖励荣誉：</label>
						<textarea class="InputName2" id="archHonorMod" maxlength="100">${userFpArchiveById.archHonor}</textarea>
					</div>
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<div class="text-center">
				<a type="button" onclick="submitStaffArchiveMod();" class="default-btn btn-orange marginLR20">保 存</a>
				<a type="button" data-dismiss="modal" class="default-btn btn-gray marginLR20">关 闭</a>
			</div>
		</div>
	</div>
</div>


<script>
	function pcChange(obj) {
		var provinceVar = $(obj).val();
		provinceCitySelect(provinceVar, "archCityMod");
	}
	
	function submitStaffArchiveMod() {
		var archIdMod = $("#archIdMod").val();
		var userIdMod = $("#userIdMod").val();
		var archGenderMod = $("#archGenderMod").val();
		var archAgeMod = $("#archAgeMod").val();
		var archPlaceMod = $("#archPlaceMod").val();
		var archSchoolMod = $("#archSchoolMod").val();
		var archEmailMod = $("#archEmailMod").val();
		var archProvinceMod = $("#archProvinceMod").val();
		var archCityMod = $("#archCityMod").val();
		var archPeriodMod = $("#archPeriodMod").val();
		var archDescMod = $("#archDescMod").val();
		var archAdeptMod = $("#archAdeptMod").val();
		var archHonorMod = $("#archHonorMod").val();
		
		if (!archGenderMod) {
			Modal.alert({msg:"请选择性别"});
			return;
		}
		if (!archAgeMod) {
			Modal.alert({msg:"请选择年龄"});
			return;
		}
		if (!archPlaceMod) {
			Modal.alert({msg:"请输入籍贯"});
			return;
		}
		if (!archSchoolMod) {
			Modal.alert({msg:"请输入毕业院校"});
			return;
		}
		if (!archEmailMod) {
			Modal.alert({msg:"请输入电子邮件"});
			return;
		}
		var emailReg = /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;
		if (!emailReg.test(archEmailMod)) {
			Modal.alert({msg:"输入的电子邮件格式不正确"});
			return;
		}
		if (!archProvinceMod) {
			Modal.alert({msg:"请选择省"});
			return;
		}
		if (!archCityMod) {
			Modal.alert({msg:"请选择市"});
			return;
		}
		if (!archPeriodMod) {
			Modal.alert({msg:"请选择从业年限"});
			return;
		}
		if (!archDescMod) {
			Modal.alert({msg:"请输入职业生涯"});
			return;
		}
		if (!archAdeptMod) {
			Modal.alert({msg:"请输入擅长领域"});
			return;
		}
		if (!archHonorMod) {
			Modal.alert({msg:"请输入奖励荣誉"});
			return;
		}
		
		$.ajax({
			type: "post",
			dataType: "json",
			data: {
				"archId":archIdMod, "userId":userIdMod, "archAge":archAgeMod, 
				<#if userFpArchiveById.archGender?if_exists><#else>"archGender":archGenderMod, </#if>
				"archPlace":archPlaceMod, "archSchool":archSchoolMod, "archEmail":archEmailMod, 
				"archProvince":archProvinceMod, "archCity":archCityMod, "archPeriod":archPeriodMod, 
				"archDesc":archDescMod, "archAdept":archAdeptMod, "archHonor":archHonorMod
			},
			url: "${ctx}/user/fp/staff/arch/mod",
			success: function(result) {
				if (result.code == "0") {
					Modal.alert({msg:"修改成功", okCallback:function() {
						$("#fp_staff_archive_modal").modal("hide");
						$("#fp_staff_archive_modal").on("hidden.bs.modal", function() {
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
