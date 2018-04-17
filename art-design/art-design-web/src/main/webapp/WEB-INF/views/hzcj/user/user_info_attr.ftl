<!-- 属性详情 -->
<#assign ctx = request.contextPath>
		
<div class="modal-body">
	<div class="col-xs-12">
		<table class="table table-striped table-bordered table-hover RtableStriped RtableStropSOS">
			<thead>
				<tr role="row">
					<th class="center" width="5%">
						<span class="lbl" title="">序号</span>
					</th>
					<th class="center">属性编码</th>
					<th class="center">属性名称</th>
					<th class="center">属性代码</th>
					<th class="center">属性键</th>
					<th class="center">属性值</th>
				</tr>
			</thead>
			<tbody>
			<#if userInfoAttrByIds?if_exists>
				<#list userInfoAttrByIds as userAttrList>
				<tr>
					<td class="center">
						<div class="aName">${userAttrList_index+1}</div>
					</td>
					<td class="center">
						<div class="aName">${userAttrList.attrId?exists?string(userAttrList.attrId, "--")}</div>
					</td>
					<td class="center">
						<div class="aName">${userAttrList.attrName?exists?string(userAttrList.attrName, "--")}</div>
					</td>
					<td class="center">
						<div class="aName">${userAttrList.attrCode?exists?string(userAttrList.attrCode, "--")}</div>
					</td>
					<td class="center">
						<div class="aName">${userAttrList.attrKey?exists?string(userAttrList.attrKey, "--")}</div>
					</td>
					<td class="center">
						<div class="aName">${userAttrList.attrValue?exists?string(userAttrList.attrValue, "--")}</div>
					</td>
				</tr>
				</#list>
			<#else>
				<tr align="center"><td colspan="6"><font color="red" size="4">没有查询到数据！</font></td></tr>
			</#if>
			</tbody>
		</table>
	</div>
</div>
