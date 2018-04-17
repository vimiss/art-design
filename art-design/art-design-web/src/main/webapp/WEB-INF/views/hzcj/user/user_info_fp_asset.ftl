<!-- 理财师认证 -->
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
					<th class="center">认证编码</th>
					<th class="center">真实名称</th>
					<th class="center">机构简称</th>
					<th class="center">审核状态</th>
					<th class="center">审核用户</th>
					<th class="center">审核时间</th>
					<th class="center">创建时间</th>
					<th class="center">审核意见</th>
				</tr>
			</thead>
			<tbody>
			<#if userInfoFpAssetsByIds?if_exists>
				<#list userInfoFpAssetsByIds as userFpAssetList>
				<tr>
					<td class="center">
						<div class="aName">${userFpAssetList_index+1}</div>
					</td>
					<td class="center">
						<div class="aName">${userFpAssetList.assetId?exists?string(userFpAssetList.assetId, "--")}</div>
					</td>
					<td class="center">
						<div class="aName">${userFpAssetList.fpUsername?exists?string(userFpAssetList.fpUsername, "--")}</div>
					</td>
					<td class="center">
						<div class="aName">${userFpAssetList.orgShortName?exists?string(userFpAssetList.orgShortName, "--")}</div>
					</td>
					<td class="center">
						<div class="aName">
							<@option name="audit_status_param" status="1" type="3" value="${userFpAssetList.assetAuditStatus}" />
						</div>
					</td>
					<td class="center">
						<div class="aName">${userFpAssetList.auditUsername?exists?string(userFpAssetList.auditUsername, "--")}</div>
					</td>
					<td class="center">
						<div class="aName">${(userFpAssetList.assetAuditTime?string("yyyy-MM-dd HH:mm:ss"))?default("--")}</div>
					</td>
					<td class="center">
						<div class="aName">${(userFpAssetList.assetTime?string("yyyy-MM-dd HH:mm:ss"))?default("--")}</div>
					</td>
					<td class="center">
						<div class="aName">${userFpAssetList.assetResult?exists?string(userFpAssetList.assetResult, "--")}</div>
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
