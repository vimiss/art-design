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
						<label>机构代码：</label>
						<input type="text" class="InputName1" id="orgCode" maxlength="3" placeholder="请输入机构代码" />
					</div>
				</div>
				<div class="col-xs-12 mb10">
					<div class="col-sm-8">
						<label>机构简称：</label>
						<input type="text" class="InputName1" id="orgShortName" placeholder="请输入机构简称" />
					</div>
				</div>
				<div class="col-xs-12 mb10">
					<div class="col-sm-8">
						<label>机构全称：</label>
						<input type="text" class="InputName1" id="orgName" placeholder="请输入机构全称" />
					</div>
				</div>
				<div class="col-xs-12 mb10">
					<div class="col-sm-8">
						<label>合作状态：</label>
						<select class="chosen-select AceSelect" id="orgJoinStatus" >
							<@option name="yes_no_type_param" status="1" type="2" />
						</select>
					</div>
				</div>
				<div class="col-xs-12 mb10">
					<div class="col-sm-8">
						<label>机构地址：</label>
						<textarea class="InputName2" id="orgAddress" cols="8" rows="3"></textarea>
					</div>
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<div class="text-center">
				<a type="button" onclick="submitOrgAdd();" class="default-btn btn-orange marginLR20">保 存</a>
				<a type="button" data-dismiss="modal" class="default-btn btn-gray marginLR20">关 闭</a>
			</div>
		</div>
	</div>
</div>
<script>
	function submitOrgAdd() {
		var orgCode = $("#orgCode").val();
		var orgShortName = $("#orgShortName").val();
		var orgName = $("#orgName").val();
		var orgJoinStatus = $("#orgJoinStatus").val();
		var orgAddress = $("#orgAddress").val();
		
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
				"orgJoinStatus":orgJoinStatus, "orgAddress":orgAddress
			},
			url: "${ctx}/user/fp/org/add",
			success: function(result) {
				if (result.code == "0") {
					Modal.alert({msg:"新增成功", okCallback:function() {
						$("#fp_org_add_modal").modal("hide");
						$("#fp_org_add_modal").on("hidden.bs.modal", function() {
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
