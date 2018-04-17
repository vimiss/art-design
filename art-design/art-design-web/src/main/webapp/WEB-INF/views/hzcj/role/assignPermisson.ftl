<#assign ctx = request.contextPath>
<!-- Modal -->
<div class="modal-dialog" role="document" style="width: 780px;">
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
			<h4 class="modal-title" id="myModalLabel">分配权限</h4>
		</div>
		<div class="modal-body">
		<#include "hzcj/role/permissionTree.ftl">
		<form role="form" class="form-group" action="" method="post" id="assginPerForm" >
			<input id="roleId" name="id" type="hidden" value="${role.id}">
			<input id="permissonId" name="permissonId" type="hidden" value="">
			<input type="hidden" name="modifyPermission" value="${modifyPermission?if_exists}" />
		</form>
    	</div>
		<div class="modal-footer">
			<div class="text-center">
				<a href="javascript:;" onclick="saveAssignPermission();" class="default-btn btn-orange noBorder marginLR20">保 存</a>
				<a href="javascript:;" data-dismiss="modal" class="default-btn btn-gray marginLR20">取 消</a>
			</div>
		</div>
	</div>
</div>
<!-- 警告框！ --> 
<!-- Modal -->
<div class="modal fade HoranMyModals" id="operate_modal_ok" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel" style="z-index:2000;">
	<div class="modal-dialog" role="document" style="width: 430px; height: 230px;">
		<div class="modal-content">
			<div class="modal-body">
				<div class="container-fluid">
					<div class="row">
						<div class="text-center" style="font-size: 24px; padding: 50px 0" id="okDiv">
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer ">
				<div class="text-center">
					<a href="javascript:;" data-dismiss="modal" class="default-btn btn-gray marginLR20">确 定</a>
				</div>
			</div>
		</div>
	</div>
</div>
