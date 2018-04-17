<#assign ctx = request.contextPath>

<#include "commons/head.ftl">
<!-- /section:basics/navbar.layout -->
		<div class="main-container" id="main-container">

			<div id="sidebar" class="sidebar  responsive" data-sidebar="true" data-sidebar-scroll="true" data-sidebar-hover="true">
				<script type="text/javascript">
					try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
				</script>
				<div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
					<img src="${ctx}/img/line13.png" style="cursor: pointer">
				</div>
				<ul class="nav nav-list" style="top: 0px;">
					<#include "commons/menu.ftl">
				</ul><!-- /.nav-list -->


				<!-- /section:basics/sidebar.layout.minimize -->
				<script type="text/javascript">
					try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}
				</script>
			</div>

			<!-- /section:basics/sidebar -->
			<div class="main-content">
				<div class="main-content-inner">
					<!-- 面包屑div -->
					<div class="breadcrumbs" id="breadcrumbs">
						<script type="text/javascript">
							try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
						</script>
						<ul class="breadcrumb">
							<li><span><i class="ace-icon fa  fa-map-marker bigger-130"></i> 当前位置：</span></li>
							<li><a href="${ctx}/index">首页</a></li>
							<li><a href=""></a></li>
							<li></li>
						</ul>
						<!-- /.breadcrumb -->
						<!-- /section:basics/content.searchbox -->
					</div>
					<div class="page-content ">
						<div class="row" style="padding-top: 10px;">
						<form action="${ctx}/periodDelay/list" method="POST" id="queryForm">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->
								<div class="col-sm-3">
									<label >分期标题：</label>
									<input type="text" name="perName" value="${periodDelay.perName?if_exists}" class="InputName0">
								</div>
								<div class="col-sm-4">
										<label>创建时间：</label>
										<input id="start_time" name="delayStartTime" value="${periodDelay.delayStartTime}" class="Wdate WdateInput2" type="text" onfocus="var end_time=$dp.$('end_time');WdatePicker({onpicked:function(){end_time.focus();},dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'end_time\')}',isShowClear:true,isShowOthers:false,qsEnabled:false})">
										至
										<input id="end_time" name="delayEndTime" value="${periodDelay.delayEndTime}" class="Wdate WdateInput2" type="text" onfocus="WdatePicker({minDate:'#F{$dp.$D(\'start_time\')}',dateFmt:'yyyy-MM-dd',isShowClear:true,isShowOthers:false,qsEnabled:false})">
								</div>
								</div>
								<div class="col-xs-12" style="margin-top:10px;">
								<div class="col-xs-12">
								<div class="col-sm-5">
										<label>延期结束时间：</label>
										<input id="after_start_time" name="delayAfterStartTime" value="${periodDelay.delayAfterStartTime}" class="Wdate WdateInput2" type="text" onfocus="var end_time=$dp.$('after_end_time');WdatePicker({onpicked:function(){after_end_time.focus();},dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'after_end_time\')}',isShowClear:true,isShowOthers:false,qsEnabled:false})">
										至
										<input id="after_end_time" name="delayAfterEndTime" value="${periodDelay.delayAfterEndTime}" class="Wdate WdateInput2" type="text" onfocus="WdatePicker({minDate:'#F{$dp.$D(\'after_start_time\')}',dateFmt:'yyyy-MM-dd',isShowClear:true,isShowOthers:false,qsEnabled:false})">
								</div>
								<div class="col-sm-6">
										<label>原结束时间：</label>
										<input id="before_start_time" name="delayBeforeStartTime" value="${periodDelay.delayBeforeStartTime}" class="Wdate WdateInput2" type="text" onfocus="var end_time=$dp.$('before_end_time');WdatePicker({onpicked:function(){before_end_time.focus();},dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'before_end_time\')}',isShowClear:true,isShowOthers:false,qsEnabled:false})">
										至
										<input id="before_end_time" name="delayBeforeEndTime" value="${periodDelay.delayBeforeEndTime}" class="Wdate WdateInput2" type="text" onfocus="WdatePicker({minDate:'#F{$dp.$D(\'before_start_time\')}',dateFmt:'yyyy-MM-dd',isShowClear:true,isShowOthers:false,qsEnabled:false})">
										<span id="queryCommit" class="BtnSouSu default-btn btn-blue" >搜 索</span>
								</div>
								</div>
							
								<div class="col-xs-12 ">
									<table class="table table-striped table-bordered table-hover RtableStriped RtableStropSOS">
										<thead>
										<tr role="row">
											<th class="center" >序号</th>
											<th class="center" >分期标题</th>
											<th class="center" >分期延期前结束时间</th>
											<th class="center" >分期延期后结束时间</th>
											<th class="center" >创建时间</th>
										</tr>
										</thead>
										<tbody>
										<#if perioDelayList>
											<#list perioDelayList as periodDelay>
											<tr>
												<td class="center">
													<div class="aName">${periodDelay_index+1+(pageView.pageNow-1)*pageView.pageSize}</div>
												</td>
												<td class="center">
													<div class="aName">
														<a href="#" style="color: #3eafe0" onclick="openPeriodInfo(${periodDelay.perId});" title="点击查看分期明细">
															${periodDelay.perName?if_exists}
														</a>
													</div>
												</td>
												<td class="center">
													<div class="aName"><@date_sub value='${periodDelay.delayBeforeTime?string("yyyy-MM-dd HH:mm:ss")}' /></div>
												</td>
												<td class="center">
													<div class="aName"><@date_sub value='${periodDelay.delayAfterTime?string("yyyy-MM-dd HH:mm:ss")}' /></div>
												</td>
												<td class="center">
													<div class="aName"><@date_sub value='${periodDelay.delayTime?string("yyyy-MM-dd HH:mm:ss")}' /></div>
												</td>
											</tr>
											</#list>
										<#else>
											<tr align="center"><td colspan="5"><font color="red" size="4">没有查询到数据！</font></td></tr>
										</#if>
										</tbody>
									</table>
									<input type="hidden" id="pageNow" name="pageNow" value="${pageView.pageNow?if_exists}" />
									<#if perioDelayList>
									<#include "commons/page.ftl">
									</#if>
								</div>
							<!-- /.col -->
						</form>
						</div><!-- /.row -->
					</div><!-- /.page-content -->
				</div>
			</div><!-- /.main-content -->
		</div><!-- /.main-container -->

<form id="lastQueryForm" method="post" name="lastQueryForm" action="${ctx}/periodDelay/list">
 	<input type="hidden" id="oldPageNow" name="pageNow" value="${pageView.pageNow}" />
	<input type="hidden" name="perName" value="${periodDelay.perName}" />
	<input type="hidden" name="delayBeforeStartTime" value="${periodDelay.delayBeforeStartTime}" />
	<input type="hidden" name="delayBeforeEndTime" value="${periodDelay.delayBeforeEndTime}" />
	<input type="hidden" name="delayAfterStartTime" value="${periodDelay.delayAfterStartTime}" />
	<input type="hidden" name="delayAfterEndTime" value="${periodDelay.delayAfterEndTime}" />
	<input type="hidden" name="delayStartTime" value="${periodDelay.delayStartTime}" />
	<input type="hidden" name="delayEndTime" value="${periodDelay.delayEndTime}" />
</form>
		
<#include "commons/foot.ftl">
<div class="modal fade" id="periodInfoModal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"></div>
<div class="modal fade" id="itemInfoModal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"></div>

<script type="text/javascript" src="${ctx}/js/hzcj/jquery.validation.js"></script>
<script type="text/javascript" src="${ctx}/js/hzcj/messages_cn.js"></script>
<script type="text/javascript">
	$(function(){
		$("#queryCommit").click(function(){
			$("#pageNow").val(1);
			$("#queryForm").submit();
		});
	});
	function openPeriodInfo(perId){
		$('#periodInfoModal').html("加载中...").load(ctx + '/periodManagement/openPeriodInfo?perId='+perId+'&r='+Math.random(),function(){
				$("#periodInfoModal").modal();
		});
	}
	function openItemInfo(itemId){
		$('#itemInfoModal').html("加载中...").load(ctx + '/itemManagement/openItemInfo?itemId='+itemId+'&r='+Math.random(),function(){
				$("#itemInfoModal").modal();
		});
	}
	//翻页动作
	function queryformPage(){
		$("#lastQueryForm").submit();
	};
</script>
<#include "commons/end.ftl">