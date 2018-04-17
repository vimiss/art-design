<!-- 资产证明 -->
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
					<th class="center">证明编码</th>
					<th class="center">审核状态</th>
					<th class="center">审核用户</th>
					<th class="center">审核时间</th>
					<th class="center">创建时间</th>
					<th class="center">审核意见</th>
				</tr>
			</thead>
			<tbody>
			<#if userInfoAssetsByIds?if_exists>
				<#list userInfoAssetsByIds as userAssetList>
				<tr>
					<td class="center">
						<div class="aName">${userAssetList_index+1}</div>
					</td>
					<td class="center">
						<div class="aName">${userAssetList.assetId?exists?string(userAssetList.assetId, "--")}</div>
					</td>
					<td class="center">
						<div class="aName">
							<@option name="audit_status_param" status="1" type="3" value="${userAssetList.assetAuditStatus}" />
						</div>
					</td>
					<td class="center">
						<div class="aName">${userAssetList.auditUsername?exists?string(userAssetList.auditUsername, "--")}</div>
					</td>
					<td class="center">
						<div class="aName">${(userAssetList.assetAuditTime?string("yyyy-MM-dd HH:mm:ss"))?default("--")}</div>
					</td>
					<td class="center">
						<div class="aName">${(userAssetList.assetTime?string("yyyy-MM-dd HH:mm:ss"))?default("--")}</div>
					</td>
					<td class="center">
						<div class="aName">${userAssetList.assetResult?exists?string(userAssetList.assetResult, "--")}</div>
					</td>
				</tr>
				</#list>
			<#else>
				<tr align="center"><td colspan="7"><font color="red" size="4">没有查询到数据！</font></td></tr>
			</#if>
			</tbody>
		</table>
	</div>
</div>
