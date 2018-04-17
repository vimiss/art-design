<#assign ctx = request.contextPath>
<#include "hzcj/common/option.ftl">

<!-- Modal -->
<div class="modal-dialog modal-lg1" role="document">
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
			<h4 class="modal-title" id="myModalLabel">理财师认证信息</h4>
		</div>
		<div class="modal-body">
		<form id="msgpushForm" name="msgpushForm" method="post" >
			<!-- 文本内容开始 -->
							<div class="col-xs-12 MylistCol">
								<div class="pull-left MylistLeft">
									<strong class="InputStrong">申请时间：</strong>
								</div>
								<div class="pull-left MylistRight">
										${fpAssets.assetTime?string("yyyy-MM-dd HH:mm:ss")}
								</div>
							</div>
							 <div class="col-xs-12 MylistCol">
								<div class="pull-left MylistLeft">
									<strong class="InputStrong">审核人：</strong>
								</div>
								<div class="pull-left MylistRight">
									${fpAssets.auditUsername}
								</div>
							</div>
							 <div class="col-xs-12 MylistCol">
								<div class="pull-left MylistLeft">
									<strong class="InputStrong">审核时间：</strong>
								</div>
								<div class="pull-left MylistRight">
									${fpAssets.assetAuditTime?string("yyyy-MM-dd HH:mm:ss")}
								</div>
							</div>
							 <div class="col-xs-12 MylistCol">
								<div class="pull-left MylistLeft">
									<strong class="InputStrong">审核结果：</strong>
								</div>
								<div class="pull-left MylistRight">
									<@option name="audit_status_param" status="1" type="3" value="${fpAssets.assetAuditStatus}"/>
								</div>
							</div>
							 <div class="col-xs-12 MylistCol">
								<div class="pull-left MylistLeft">
									<strong class="InputStrong">审核意见：</strong>
								</div>
								<div class="pull-left MylistRight">
									${fpAssets.assetResult?default("--")}
								</div>
							</div>
							<#if fileList>
							 <div class="col-xs-12 MylistCol">
								<div class="pull-left MylistLeft">
									<strong class="InputStrong">附件：</strong>
								</div>
								<div class="pull-left MylistRight">
									<table>
									<thead>
										<tr role="row">
											<th class="center" width="10%">图片顺序</th>
											<th class="center" width="80%"><span class="lbl" title="">附件图片</span></th>
										</tr>
									</thead>
									<#list fileList as file>
									<tr>
												<td class="center">
													<div>${file_index+1}</div>
												</td>
												<td class="center">
													<div><img height="200" width="200" src="${file.upRelativeUrl?if_exists}"  onclick="showImg(this);"></img></div>
												</td>
										</tr>
									</#list>			
									</table>			
								</div>
							</div>
							</#if>
		</form>
		</div>
		<div class="modal-footer">
			<div class="text-center">
				<a href="javascript:;" data-dismiss="modal" class="default-btn btn-gray marginLR20">关闭</a>
			</div>
		</div>
	</div>
</div>
