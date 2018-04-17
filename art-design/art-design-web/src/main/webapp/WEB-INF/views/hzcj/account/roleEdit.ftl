<#assign ctx = request.contextPath>
<#include "hzcj/common/option.ftl">
<!-- 新建或编辑岗位-->
<!-- Modal -->
		<div class="modal-dialog" role="document" style="width: 756px;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
					<h4 class="modal-title" id="myModalLabel">分配角色</h4>
				</div>
				<div class="modal-body">
				<form role="form" class="form-group" action="" method="POST" id="saveRole_Form" >
					<input type="hidden" name="uId" id="uId"  value="${uId}" />
			       	<table class="table table-striped table-bordered table-hover RtableStriped RtableStropSOS">
						<thead>
						<tr role="row">
							<th class="center">
								序号
							</th>
							<th class="center">
								角色名称
							</th>
							<th class="center">
								 描述
							</th>
							<th class="center">
								创建人
							</th>
							<th class="center">
								创建时间
							</th>
							<th class="center">
								操作
							</th>
						</tr>
						</thead>
						<tbody>
						<#if roleList>
						    <#list roleList as role>
							<tr>
								<td class="center">
									<div>${role_index+1}</div>
								</td>
								<td class="center" >
									<div>${role.name?default("--")}</div>
								</td>
								<td class="center">
									<div>${role.description?default("--")}</div>
								</td>
								<td class="center">
									<div>${role.userName?default("--")}</div>
								</td>
								<td class="center">
									<div><@date_sub value='${role.createTime?string("yyyy-MM-dd HH:mm:ss")}' /></div>
								</td>
								<td class="center">
									<input class="ace" type="checkbox" value="${role.id}" name="role" ${role.selectedFlag?if_exists} style="right:50px\9;">
									<span class="lbl">${roleMap.get(role.id?int)}</span>
								</td>
							</tr>
						 </#list>
						 <#else>
						 	<tr align="center"><td colspan="6"><font color="red" size="4">没有查询到数据！</font></td></tr>
						</#if>
					
						</tbody>
					</table>
				</form>
				</div>
				<div class="modal-footer">
					<div class="text-center">
						<a onclick="saveRole();" class="default-btn btn-orange noBorder marginLR20">保 存</a>
						<a type="button" data-dismiss="modal" class="default-btn btn-gray marginLR20">取 消</a>
					</div>
				</div>
			</div>
		</div>
	


		
		