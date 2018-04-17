<!-- 用户属性详情页面 -->
<#include "hzcj/common/option.ftl">
<#assign ctx = request.contextPath>
<div class="modal-dialog" role="document" style="width: 1600px;">
	<div class="modal-content">
		
		<div class="modal-header">
			<button type="button" class="bootbox-close-button close" data-dismiss="modal" aria-hidden="true">×</button>
			
			<h4 class="modal-title">&nbsp;项目视频</h4>
		</div>
		<div class="modal-body">
			<div class="page-content ">
				<div class="row" style="padding-top: 10px;">
				<div class="col-xs-12">
				<form action="${ctx}/itemManagement/goitemVideoList" method="POST" id="queryForm_ajax">
				<input type="hidden" name="querySign" value="1" />
				<input type="hidden" name="itemId" value="${itemId}" />
						<!-- PAGE CONTENT BEGINS -->
						<div class="col-xs-12">
							<div class="col-sm-3">
									<label>上传日期：</label>
										<input id="start_time" name="startTime" value="${videosVo.startTime}" class="Wdate WdateInput1" type="text" onfocus="var end_time=$dp.$('end_time');WdatePicker({onpicked:function(){end_time.focus();},dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'end_time\')}',isShowClear:true,isShowOthers:false,qsEnabled:false})">
										至
										<input id="end_time" name="endTime" value="${videosVo.endTime}" class="Wdate WdateInput1" type="text" onfocus="WdatePicker({minDate:'#F{$dp.$D(\'start_time\')}',dateFmt:'yyyy-MM-dd',isShowClear:true,isShowOthers:false,qsEnabled:false})">
							</div>
							<div class="col-sm-4">
								<label>是否关联：</label>
							       <select class="chosen-select AceSelect" name="accSign" id="accSign">
									<@option name="yes_no_type_param" status="1" type="4" value="${videosVo.accSign}"/>
								</select>
								<span id="queryCommit_ajax" class="BtnSouSu default-btn btn-blue">搜 索</span>
							</div>
						</div>
						
						<div class="col-xs-12">
								
							<table class="table table-striped table-bordered table-hover RtableStriped RtableStropSOS">
								<thead>
								<tr role="row">
									<th class="center" >视频ID</th>
									<th class="center" >视频名称</th>
									<th class="center" width="15%">占用空间</th>
									<th class="center" width="10%">时长</th>
									<th class="center" width="15%">创建时间</th>
									<th class="center" width="10%">视频描述</th>
									<th class="center" width="15%">操作</th>
								</tr>
								</thead>
								<tbody>
								<#if videoList>
				            		<#list videoList as videosVo>
				            			<#if videosVo>
											<tr>
												<td class="center">
													<div class="aName">${videosVo.videoTitle?if_exists}</div>
												</td>
												<td class="center">
													<div class="aName">${videosVo.wyVid?if_exists}</div>
												</td>
												<td class="center">
													<div class="aName">${videosVo.wyInitialSize?if_exists}</div>
												</td>
												<td class="center">
													<div class="aName">${videosVo.wyDuration?if_exists}</div>
												</td>
												<td class="center">
													<div class="aName"><@date_sub value='${videosVo.videoTime?string("yyyy-MM-dd HH:mm:ss")}' /></div>
												</td>
												<td class="center">
													<div class="aName">${videosVo.videoDesc?if_exists}</div>
												</td>
												<td class="center ">
													<div class="aName">
													<#if accSign=="1">
														<a class="btn btn-primary btn-sm" onclick="goItemVideoEdit(${videosVo.videoId},${itemId});">编辑</a>
														<a class="btn btn-primary btn-sm" onclick="ajaxReleaseAssocVideo(${videosVo.videoId},${itemId});">解除关联</a>
													<#else>
														<a class="btn btn-primary btn-sm" onclick="ajaxAssocVideo(${videosVo.videoId},${itemId});">建立关联</a>
													</#if>
													</div>
												</td>
											</tr>
							    		</#if>
									</#list>
								<#else>
									<tr align="center"><td colspan="7"><font color="red" size="4">没有查询到数据！</font></td></tr>
								</#if>
							</tbody>
							</table>
								<#if videoList>
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
			$("#listVideoModal").modal("hide");
			$("#listVideoModal").on("hidden.bs.modal", function() {
				queryRelationList($("#queryForm_ajax").serialize());
				$(this).off("hidden.bs.modal");
			});
		});
	});
	
	
	
	//翻页动作
	function queryformPage_ajax() {
		$("#listVideoModal").modal("hide");
		$("#listVideoModal").on("hidden.bs.modal", function() {
			queryRelationList($("#queryForm_ajax").serialize());
			$(this).off("hidden.bs.modal");
		});
	}
</script>
