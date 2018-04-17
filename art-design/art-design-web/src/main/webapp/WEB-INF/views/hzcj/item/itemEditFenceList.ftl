<!-- 用户属性详情页面 -->
<#include "hzcj/common/option.ftl">
<#assign ctx = request.contextPath>
<div class="modal-dialog" role="document" style="width: 1000px;">
	<div class="modal-content">
		
		<div class="modal-header">
			<button type="button" class="bootbox-close-button close" data-dismiss="modal" aria-hidden="true">×</button>
			
			<h4 class="modal-title">&nbsp;项目栏目修改</h4>
		</div>
		<div class="modal-body">
			<div class="page-content ">
				<div class="row" style="padding-top: 10px;">
				<div class="col-xs-12">
				<form action="" method="POST" id="queryForm_ajax">
				<input type="hidden" name="querySign" value="1" />
				<input type="hidden" name="itemId" id="itemId"  value="${itemId}" />
						<!-- PAGE CONTENT BEGINS -->
						<div class="col-xs-12">
							<div class="col-sm-4">
								<label>栏目名称：</label>
								<input id="fenceName" class="InputName0" name="fenceName" value="${itemFenceVo.fenceName}"  type="text" >
							</div>
							<div class="col-sm-6">
									<label>是否选择：</label>
							       <select class="chosen-select AceSelect" name="accSign" id="accSign">
									<@option name="yes_no_type_param" status="1" type="4"  value="${itemFenceVo.accSign}"/>
								</select>
								<span id="queryCommit_ajax" class="BtnSouSu default-btn btn-blue">搜 索</span>
							</div>
							
						</div>
						<div class="col-xs-12">
							<#if "${accSign}"=="1">
								<span class="BtnNormalSu default-btn btn-blue" id="subEditItemDelColum">删 除</span>
							   <#else>
								<span class="BtnNormalSu default-btn btn-blue" id="subEditItemColum">新 增</span>
							   </#if> 
								
						<table class="table table-striped table-bordered table-hover RtableStriped RtableStropSOS" >
							<thead>
								<tr role="row">
									<th class="center" > 
										<input type="checkbox" id="all">选择  
									</th>
									<th class="center" >名称</th>
									<th class="center" ><span class="lbl" title="">编码</span></th>
								</tr>
							</thead>
							
							<tbody>
								<#if itemFenceList>
				            		<#list itemFenceList as itemFenceVo>
				            			<#if itemFenceVo>
											<tr>
												<td class="center">
													<div>   
														<input name="chkItem" type="checkbox"  value="${itemFenceVo.fenceId?if_exists}" fenceName="${itemFenceVo.fenceName?if_exists}">  
													</div>
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
			$("#itemEditFenceModal").modal("hide");
			$("#itemEditFenceModal").on("hidden.bs.modal", function() {
				queryItemEditFenceList($("#queryForm_ajax").serialize());
				$(this).off("hidden.bs.modal");
			});
		});
	});
	
	
	
	//翻页动作
	function queryformPage_ajax() {
		$("#itemEditFenceModal").modal("hide");
		$("#itemEditFenceModal").on("hidden.bs.modal", function() {
			queryItemEditFenceList($("#queryForm_ajax").serialize());
			$(this).off("hidden.bs.modal");
		});
	}
	
	
	
	
</script>
