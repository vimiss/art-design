<!-- 用户属性详情页面 -->
<#include "hzcj/common/option.ftl">
<#assign ctx = request.contextPath>
<div class="modal-dialog" role="document" style="width: 1600px;">
	<div class="modal-content">
		
		<div class="modal-header">
			<button type="button" class="bootbox-close-button close" data-dismiss="modal" aria-hidden="true">×</button>
			
			<h4 class="modal-title">&nbsp;项目栏目附件</h4>
		</div>
		<div class="modal-body">
			<div class="page-content ">
				<div class="row" style="padding-top: 10px;">
				<div class="col-xs-12">
				<form action="${ctx}/itemManagement/goItemNoticList" method="POST" id="queryForm_ajax">
				<input type="hidden" name="querySign" value="1" />
				<input type="hidden" name="itemId" value="${itemId}" />
						<!-- PAGE CONTENT BEGINS -->
						<div class="col-xs-12">
							<div class="col-sm-4">
								<label>标题名称：</label>
								<input type="text" class="InputName0" name="infoTitle" id="infoTitle"  value="${spreadInfoVo.infoTitle}"  maxlength="20"  placeholder="">
							</div>
							<div class="col-sm-4">
									<label>发布日期：</label>
										<input id="start_time" name="startTime" value="${spreadInfoVo.startTime}" class="Wdate WdateInput1" type="text" onfocus="var end_time=$dp.$('end_time');WdatePicker({onpicked:function(){end_time.focus();},dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'end_time\')}',isShowClear:true,isShowOthers:false,qsEnabled:false})">
										至
										<input id="end_time" name="endTime" value="${spreadInfoVo.endTime}" class="Wdate WdateInput1" type="text" onfocus="WdatePicker({minDate:'#F{$dp.$D(\'start_time\')}',dateFmt:'yyyy-MM-dd',isShowClear:true,isShowOthers:false,qsEnabled:false})">
							</div>
						</div>
						<div class="col-xs-12">
							<div class="col-sm-4">
									<label>是否关联：</label>
							       <select class="chosen-select AceSelect" name="accSign" id="accSign">
									<@option name="yes_no_type_param" status="1" type="4"  value="${spreadInfoVo.accSign}"/>
								</select>
							</div>
							<div class="col-sm-4">
							<label>已选栏目类型：</label>
							 	<select class="chosen-select AceSelect" name="infoType" id="infoType">
									<@option name="fence_type_param" status="1" method="getFenceAsOption" value="${spreadInfoVo.infoType}" show="${fcodes}"/>
								</select>
							</div>
							<div class="col-sm-4">
							<label>未选栏目类型：</label>
							 	<select class="chosen-select AceSelect" name="infoTypen" id="infoTypen">
									<@option name="fence_type_param" status="1" method="getFenceAsOption" value="${spreadInfoVo.infoTypen}" show="!${fcodes}"/>
								</select>
								<span id="queryCommit_ajax" class="BtnSouSu default-btn btn-blue">搜 索</span>
							</div>
							
						</div>
						
						<div class="col-xs-12">
							<table class="table table-striped table-bordered table-hover RtableStriped RtableStropSOS" >
								<thead>
									<tr role="row">
										<th class="center" width="20%" >标题名称</th>
										<th class="center" width="15%">栏目类型</th>
										<th class="center" width="15%">发布时间</th>
										<th class="center" width="25%">公告描述</th>
										<th class="center" width="15%">操作</th>
									</tr>
								</thead>
								
								<tbody>
									<#if spreadInfoList>
					            		<#list spreadInfoList as spreadInfoVo>
					            			<#if spreadInfoVo>
												<tr>
													<td class="center">
														<div class="aName">${spreadInfoVo.infoTitle?if_exists}</div>
													</td>
													<td class="center">
														<div class="aName">
															<@option name="fence_type_param"  method="getFenceAsOption" status="1" type="3" value="${spreadInfoVo.infoType}"/>
														</div>
													</td>
													<td class="center">
														<div class="aName"><@date_sub value='${spreadInfoVo.infoTime?string("yyyy-MM-dd HH:mm:ss")}' /></div>
													</td>
													<td class="center">
														<div class="aName">${spreadInfoVo.infoDesc?if_exists}</div>
													</td>
													<td class="center ">
														<div class="aName">
														<#if "${accSign}"=="1">
															<a class="btn btn-primary btn-sm" id="toPdf" onclick="goItemNoticePdf(${spreadInfoVo.infoId});">转PDF</a>
															<a class="btn btn-primary btn-sm" onclick="ajaxReleaseAssocNotice(${spreadInfoVo.infoId},${itemId});" >解除关联</a>
														<#else>
															<a class="btn btn-primary btn-sm" onclick="ajaxAssocNotice(${spreadInfoVo.infoId},${itemId},${spreadInfoVo.infoType});">建立关联</a>
															</#if>
														</div>
													</td>
												</tr>
								    		</#if>
										</#list>
									<#else>
										<tr align="center"><td colspan="5"><font color="red" size="4">
										<#if haveCloum=='no'>
										该项目没有选择任何栏目,请先在修改中选择栏目！
										<#else>
										没有查询到数据！
										</#if>
										</font></td></tr>
									</#if>
								</tbody>
							</table>
						<#if spreadInfoList>
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
				<a href="javascript:;" data-dismiss="modal" class="default-btn btn-gray noBorder marginLR20">关 闭</a>
			</div>
		</div>
	</div>
</div>
<script>
	$(function(){
		//查询
		$("#queryCommit_ajax").click(function(){
			if(checkLoginStatus() == false) return;
			$("#pageNow_ajax").val(1);
			$("#listNoticeModal").modal("hide");
			$("#listNoticeModal").on("hidden.bs.modal", function() {
				queryItemNoticeList($("#queryForm_ajax").serialize());
				$(this).off("hidden.bs.modal");
			});
		});
	});
	
	//翻页动作
	function queryformPage_ajax() {
		$("#listNoticeModal").modal("hide");
		$("#listNoticeModal").on("hidden.bs.modal", function() {
			queryItemNoticeList($("#queryForm_ajax").serialize());
			$(this).off("hidden.bs.modal");
		});
	}
</script>
