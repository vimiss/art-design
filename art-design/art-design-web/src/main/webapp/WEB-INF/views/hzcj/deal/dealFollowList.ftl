<!-- 用户属性详情页面 -->
<#include "hzcj/common/option.ftl">
<#assign ctx = request.contextPath>
<div class="modal-dialog" role="document" style="width: 1000px;">
	<div class="modal-content">
		
		<div class="modal-header">
			<button type="button" class="bootbox-close-button close" data-dismiss="modal" aria-hidden="true">×</button>
			
			<h4 class="modal-title">&nbsp;交易跟踪</h4>
		</div>
		<div class="modal-body">
			<div class="page-content ">
				<div class="row" style="padding-top: 10px;">
				<div class="col-xs-12">
				<form action="${ctx}/dealFollow/list" method="POST" id="queryForm_ajax">
						<!-- PAGE CONTENT BEGINS -->
						<div class="col-xs-12">
						<input type="hidden" name="applyId" id="applyId" value="${applyId}" />
						<table class="table table-striped table-bordered table-hover RtableStriped RtableStropSOS" >
							<thead>
								<tr role="row">
									<th class="center" >序号</th>
									<th class="center" >交易跟踪状态</th>
									<th class="center" >交易跟踪内容模板</th>
									<th class="center" >交易跟踪时间</th>
								</tr>
							</thead>
							
							<tbody>
								<#if dealFollowList>
									<#list dealFollowList as dealFollow>
									<tr>
										<td class="center">
											<div>${dealFollow_index+1+(pageView_ajax.pageNow-1)*pageView_ajax.pageSize}</div>
										</td>
										<td class="center">
											<div><@option name="apply_status_param" status="1" type="3" value="${dealFollow.followName}"/></div>
										</td>
										<td class="center">
											<div>${dealFollow.followContent}</div>
										</td>
										<td class="center">
											<div><@date_sub value='${dealFollow.followTime?string("yyyy-MM-dd HH:mm:ss")}' /></div>
										</td>
									</tr>
									</#list>
								<#else>
									<tr align="center"><td colspan="4"><font color="red" size="4">没有查询到数据！</font></td></tr>
								</#if>
							</tbody>
						</table>
							<input type="hidden" id="pageNow_ajax" name="pageNow_ajax" value="${pageView_ajax.pageNow?if_exists}" />
							<#if dealFollowList>
							<#include "hzcj/common/page_ajax.ftl">
							</#if>
						</div>
				</form>
				</div><!-- /.col -->
				</div><!-- /.row -->
			</div><!-- /.page-content -->
		</div>
		<div class="modal-footer">
			<div class="text-center">
				<a href="javascript:;" data-dismiss="modal" class="default-btn btn-gray marginLR20">关 闭</a>
			</div>
		</div>
	</div>
</div>
<script>
	
	//翻页动作
	function queryformPage_ajax() {
		$("#dealInfoModal").modal("hide");
		$("#dealInfoModal").on("hidden.bs.modal", function() {
			openDealFollow($("#queryForm_ajax").serialize());
			$(this).off("hidden.bs.modal");
		});
	}
	
</script>
