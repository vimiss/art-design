<#assign ctx = request.contextPath>
<#include "hzcj/common/option.ftl">
<!-- 新建或编辑机构 -->
		<div class="modal-dialog" role="document" style="width: 756px;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
					<h4 class="modal-title" id="myModalLabel">新增角色</h4>
				</div>
				<div class="modal-body">
				<form role="form" class="form-group" action="" method="post" id="addRoleForm" >
					<div class="container-fluid">
						<div class="row">
							<div class=" Mylist clearfix">
								<div class="col-xs-12 MylistCol">
									<div class="pull-left MylistLeft"><span class="red">*</span>角色名称：</div>
										<div class="pull-left MylistRight">
										<input type="text" class="InputName1" id="roleName" name="name"  value="" maxlength="20" placeholder="20位字符">
										<span id="checkRoleName" class="light-red"></span>
									</div>
								</div>
								<div class="col-xs-12 MylistCol">
									<div class="pull-left MylistLeft"><span class="red">*</span>角色编码：</div>
										<div class="pull-left MylistRight">
										<select class="chosen-select AceSelect" name="code"  id="code">
											<@option name="role_type_param" status="1" />
									</select>
									</div>
								</div>
								<div class="col-xs-12 MylistCol">
									<div for="classe_id" class="pull-left MylistLeft"><span class="red"> </span>描述：</div>
									<div class="pull-left MylistRight">
										<textarea type="text" class="InputName2" name="description" maxlength="50" onkeydown="this.value=this.value.substring(0, 50)" 
										onkeyup="this.value=this.value.substring(0, 50)" placeholder="50位非特殊字符"></textarea>
										<span id="checkDescription" class="light-red"></span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<input type="hidden" name="addRole" value="${addRole?if_exists}" />
					<input type="hidden" name="id" value="">
				</form>
				</div>
				<div class="modal-footer">
					<div class="text-center">
						<a class="default-btn btn-orange marginLR20" onclick="saveAddRole();">保 存</a>
						<a data-dismiss="modal" class="default-btn btn-gray marginLR20">取 消</a>
					</div>
				</div>
			</div>
		</div>
