<#assign ctx = request.contextPath>
<#include "hzcj/common/option.ftl">

<!-- Modal -->
<div class="modal-dialog modal-lg1" role="document">
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
			<h4 class="modal-title" id="myModalLabel">理财师认证审核</h4>
		</div>
		<div class="modal-body">
		<form id="msgpushForm" name="msgpushForm" method="post" >
			<!-- 文本内容开始 -->
							 <div class="col-xs-12 MylistCol">
								<div class="pull-left MylistLeft">
									<strong class="InputStrong"><span class="red">*</span>审核结果：</strong>
								</div>
								<div class="pull-left MylistRight">
									<input type="hidden" name="assetId" value="${fpAssets.assetId}">
									<input type="hidden" name="userId" value="${fpAssets.userId}">
									<input type="hidden" name="orgId" value="${fpAssets.orgId}">
									<select class="chosen-select AceSelect" name="assetAuditStatus" >
										<@option name="audit_status_param" status="1" type="2" show="2,3" />
									</select>
								</div>
							</div>
							 <div class="col-xs-12 MylistCol">
								<div class="pull-left MylistLeft">
									<strong class="InputStrong"><span class="red">*</span>审核意见：</strong>
								</div>
								<div class="pull-left MylistRight">
									<input name="assetResult" id="assetResult" type="text" class="InputTexy1 InputTexy2"  maxlength="100"  placeholder="限100字符(中文字符长度为2)">
									<span id="checkAssetResult" class="red" style="margin-left: 20px;"></span>
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
													<div><img height="200" width="200" src="${file.upRelativeUrl?if_exists}" onclick="showImg(this);"></img></div>
												</td>
										</tr>
									</#list>			
									</table>			
								</div>
							</div>
							</#if>
							<input type="hidden" name="modifyFpAssets" value="${modifyFpAssets?if_exists}" />
		</form>
		</div>
		<div class="modal-footer">
			<div class="text-center">
				<a href="javascript:;" onclick="checkPersonalCenterForm()" class="default-btn btn-orange noBorder marginLR20">提 交</a>
				<a href="javascript:;" data-dismiss="modal" class="default-btn btn-gray marginLR20">取 消</a>
			</div>
		</div>
	</div>
</div>

		<script type="text/javascript" charset="utf-8" src="${ctx}/javascript/hzcj/len.js"></script>
	<script >
	function checkPersonalCenterForm(){
		var assetResult = $("#assetResult").val();
		if(!assetResult){
			$("#checkAssetResult").html("<font>审核意见不能为空</font>");
			return;
		}else{
			$("#checkAssetResult").empty();
		}
		var Reg = /^.{1,100}$/g;
		if(!Reg.test(assetResult)||len(assetResult)>100){
			$("#checkAssetResult").html("<font>限100字符(中文字符长度为2)!</font>");
			return;
		}else{
			$("#checkAssetResult").empty();
		}
		$.ajax({
			type : "POST",
			url : ctx + "/assets/fp/modify",
			data : $("#msgpushForm").serialize(),
			async : false,
			dataType:"json",
			error : function(request) {
			},
			success:function(data) {
				if(data.result == 'success'){
					Modal.alert({msg:"审核成功",okCallback:function(){
						$("#catalog_list_modal").modal("hide");
						$("#catalog_list_modal").on("hidden.bs.modal", function() {
							$("#queryCommit").click();
							$(this).off("hidden.bs.modal");
						});
					}});
				}else{
					Modal.alert({msg:data.message,okCallback:function(){
						$("#catalog_list_modal").modal("hide");
						$("#catalog_list_modal").on("hidden.bs.modal", function() {
							$("#queryCommit").click();
							$(this).off("hidden.bs.modal");
						});
					}});
				}
			}
		});
	}
	</script>
