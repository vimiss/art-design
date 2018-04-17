<!-- 用户属性详情页面 -->
<#include "hzcj/common/option.ftl">
<#assign ctx = request.contextPath>
<div class="modal-dialog" role="document" style="width: 1000px;">
	<div class="modal-content">
		
		<div class="modal-header">
			<button type="button" class="bootbox-close-button close" data-dismiss="modal" aria-hidden="true">×</button>
			
			<h4 class="modal-title">&nbsp;项目栏目</h4>
		</div>
		<div class="modal-body">
			<div class="page-content ">
				<div class="row" style="padding-top: 10px;">
				<div class="col-xs-12">
				<form action="${ctx}/itemManagement/goItemNoticList" method="POST" id="queryForm_ajax">
				<input type="hidden" name="querySign" value="1" />
						<!-- PAGE CONTENT BEGINS -->
						<div class="col-xs-12">
							<div class="col-sm-8">
								<label>栏目名称：</label>
								<input id="fenceName" name="fenceName" class="InputName0" value="${itemFenceVo.fenceName}"  type="text" >
								<span href="javascript:;" id="queryCommit_ajax" class="BtnSouSu default-btn btn-blue">搜 索</span>
							</div>
						</div>
						<div class="col-xs-12">
							<span id="subItemColum1" class="BtnNormalSu default-btn btn-blue">新 增</span>
								
						<table class="table table-striped table-bordered table-hover RtableStriped RtableStropSOS" >
							<thead>
								<tr role="row">
									<th class="center" ><input type="checkbox" id="all">选择</th>
									<th class="center" >名称</th>
									<th class="center" >编码</th>
								</tr>
							</thead>
							
							<tbody>
								<#if itemFenceList>
				            		<#list itemFenceList as itemFenceVo>
				            			<#if itemFenceVo>
											<tr>
												<td class="center">
													<div><input name="chkItem" type="checkbox" value="${itemFenceVo.fenceId?if_exists}" fenceName="${itemFenceVo.fenceName?if_exists}">  </div>
												</td>
												<td class="center">
													<div>${itemFenceVo.fenceName?if_exists}</div>
												</td>
												<td class="center">
													<div>${itemFenceVo.fenceTableCode?if_exists}</div>
												</td>
									
												
											</tr>
							    		</#if>
									</#list>
								<#else>
									<tr align="center"><td colspan="3"><font color="red" size="4">没有查询到数据！</font></td></tr>
								</#if>
							</tbody>
						</table>
						<#if itemFenceList>
							<input type="hidden" id="pageNow_ajax" name="pageNow_ajax" value="${pageView_ajax.pageNow?if_exists}" />
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
<script type="text/javascript" src="${ctx}/js/hzcj/item.js?v=${jsv}"></script>
<script>
	$(function(){
		//查询
		$("#queryCommit_ajax").click(function(){
			if(checkLoginStatus() == false) return;
			$("#pageNow_ajax").val(1);
			$("#itemFenceModal").modal("hide");
			$("#itemFenceModal").on("hidden.bs.modal", function() {
				queryItemFenceList($("#queryForm_ajax").serialize());
				$(this).off("hidden.bs.modal");
			});
		});
	});
	
	
	
	//翻页动作
	function queryformPage_ajax() {
		$("#itemFenceModal").modal("hide");
		$("#itemFenceModal").on("hidden.bs.modal", function() {
			queryItemFenceList($("#queryForm_ajax").serialize());
			$(this).off("hidden.bs.modal");
		});
	}
	
	
	
	
</script>
