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
						<label>机构代码：</label>
						<input type="hidden" id="orgIdMod" value="${fpOrgById.orgId}" />
						<input type="text" class="InputName1" id="orgCodeMod" maxlength="3" value="${fpOrgById.orgCode}" readonly="readonly" placeholder="请输入机构代码" />
					</div>
				</div>
				<div class="col-xs-12 mb10">
					<div class="col-sm-8">
						<label>机构简称：</label>
						<input type="text" class="InputName1" id="orgShortNameMod" value="${fpOrgById.orgShortName}" readonly="readonly" placeholder="请输入机构简称" />
					</div>
				</div>
				<div class="col-xs-12 mb10">
					<div class="col-sm-8">
						<label>机构全称：</label>
						<input type="text" class="InputName1" id="orgNameMod" value="${fpOrgById.orgName}" readonly="readonly" placeholder="请输入机构全称" />
					</div>
				</div>
				<div class="col-xs-12 mb10">
					<div class="col-sm-8">
						<label>合作状态：</label>
						<select class="chosen-select AceSelect" id="orgJoinStatusMod" >
							<@option name="yes_no_type_param" status="1" value="${fpOrgById.orgJoinStatus}"/>
						</select>
					</div>
				</div>
				<div class="col-xs-12 mb10">
					<div class="col-sm-8">
						<label>机构地址：</label>
						<textarea class="InputName2" id="orgAddressMod">${fpOrgById.orgAddress}</textarea>
					</div>
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<div class="text-center">
				<a type="button" onclick="submitOrgMod();" class="default-btn btn-orange marginLR20">保 存</a>
				<a type="button" data-dismiss="modal" class="default-btn btn-gray marginLR20">关 闭</a>
			</div>
		</div>
	</div>
</div>
<script>
	function submitOrgMod() {
		var orgId = $("#orgIdMod").val();
		var orgCode = $("#orgCodeMod").val();
		var orgShortName = $("#orgShortNameMod").val();
		var orgName = $("#orgNameMod").val();
		var orgJoinStatus = $("#orgJoinStatusMod").val();
		var orgAddress = $("#orgAddressMod").val();
		
		if (!orgCode) {
			Modal.alert({msg:"请输入机构代码"});
			return;
		}
		if (!orgShortName) {
			Modal.alert({msg:"请输入机构简称"});
			return;
		}
		if (!orgName) {
			Modal.alert({msg:"请输入机构全称"});
			return;
		}
		if (!orgJoinStatus) {
			Modal.alert({msg:"请选择合作状态"});
			return;
		}
		if (!orgAddress) {
			Modal.alert({msg:"请输入机构地址"});
			return;
		}
		
		$.ajax({
			type: "post",
			dataType: "json",
			data: {
				"orgCode":orgCode, "orgShortName":orgShortName, "orgName":orgName, 
				"orgJoinStatus":orgJoinStatus, "orgAddress":orgAddress, "orgId":orgId
			},
			url: "${ctx}/user/fp/org/mod",
			success: function(result) {
				if (result.code == "0") {
					Modal.alert({msg:"修改成功", okCallback:function() {
						$("#fp_org_mod_modal").modal("hide");
						$("#fp_org_mod_modal").on("hidden.bs.modal", function() {
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
