<!-- 账号详情 -->
<#assign ctx = request.contextPath>
<#include "hzcj/common/option.ftl">
		
<div class="modal-body">
	<div class="col-xs-12">
		<table class="table table-striped table-bordered table-hover RtableStriped RtableStropSOS">
			<thead>
				<tr role="row">
					<th class="center" width="5%">
						<span class="lbl" title="">序号</span>
					</th>
					<th class="center">账号编码</th>
					<th class="center">账号名称</th>
					<th class="center">账号密码</th>
					<th class="center">账号类型</th>
					<th class="center">开通类型</th>
					<th class="center">账号状态</th>
					<th class="center">创建时间</th>
					<th class="center">操作</th>
				</tr>
			</thead>
			<tbody>
			<#if userAccoByIds?if_exists>
				<#list userAccoByIds as userAccoList>
				<tr>
					<td class="center">
						<div class="aName">${userAccoList_index+1}</div>
					</td>
					<td class="center">
						<div class="aName">${userAccoList.accoId?exists?string(userAccoList.accoId, "--")}</div>
					</td>
					<td class="center">
						<div class="aName">${userAccoList.accoUsername?exists?string(userAccoList.accoUsername, "--")}</div>
					</td>
					<td class="center">
						<div class="aName">${userAccoList.accoPassword?exists?string(userAccoList.accoPassword, "--")}</div>
					</td>
					<td class="center">
						<div class="aName">
							<@option name="account_type_param" status="1" type="3" value="${userAccoList.accoType}" />
						</div>
					</td>
					<td class="center">
						<div class="aName">
							<@option name="account_open_type_param" status="1" type="3" value="${userAccoList.accoOpenType}" />
						</div>
					</td>
					<td class="center">
						<div class="aName">
							<@option name="status_param" status="1" type="3" value="${userAccoList.accoStatus}" />
						</div>
					</td>
					<td class="center">
						<div class="aName">${(userAccoList.accoTime?string("yyyy-MM-dd HH:mm:ss"))?default("--")}</div>
					</td>
					<td class="center">
						<div class="aName">
							<a onclick="modifyAccountStatusById(${userAccoList.accoId}, '${userAccoList.accoStatus}');" href="javascript:;" class="btn btn-primary btn-sm">
								<#if userAccoList.accoStatus == "0">启用<#else>禁用</#if>
							</a>
						</div>
					</td>
				</tr>
				</#list>
			<#else>
				<tr align="center"><td colspan="9"><font color="red" size="4">没有查询到数据！</font></td></tr>
			</#if>
			</tbody>
		</table>
	</div>
</div>
<script>
	function modifyAccountStatusById(accoId, accoStatus) {
		var infoType = "禁用";
		var accoStatusMod = "0";
		if (accoStatus == "0") {
			infoType = "启用";
			accoStatusMod = "1";
		}
		var infoTitle = "确认要" + infoType + "账号吗？";
		
		Modal.confirm({msg:infoTitle, okCallback:function() {
			$(this).on("hidden.bs.modal", function() {
				$.ajax({
					type: "post",
					dataType: "json",
					data: {"accoId":accoId, "accoStatus":accoStatusMod},
					url: "${ctx}/user/info/acco/status",
					success: function(result) {
						if (result.code == "0") {
							Modal.alert({msg:infoType + "账号成功", okCallback:function() {
								$("#user_acco").html("加载中...").load("${ctx}/user/info/acco", "userId=${userId}");
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
