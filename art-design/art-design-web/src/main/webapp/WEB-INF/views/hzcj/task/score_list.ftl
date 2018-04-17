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
						<form action="${ctx}/score/record/list" method="POST" id="queryForm">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->
								<div class="col-xs-12 ">
									<div class="col-sm-3">
										<label>手机号码：</label>
										<input type="text" class="InputName0" name="accoUsername" value="${accoUsername}" placeholder="请输入手机号码" />
									</div>
									<div class="col-sm-3">
										<label>用户昵称：</label>
										<input type="text" class="InputName0" name="infoNickname" value="${infoNickname}" placeholder="请输入用户昵称" />
									</div>
									<div class="col-sm-4">
										<label>记录类型：</label>
										<select class="chosen-select AceSelect" name="recordType" >
											<@option name="record_type_param" status="1" value="${recordType}"/>
										</select>
										<span id="queryCommit" class="BtnSouSu default-btn btn-blue">搜 索</span>
									</div>
								</div>

								<div class="col-xs-12 ">
									
									<table class="table table-striped table-bordered table-hover RtableStriped RtableStropSOS">
										<thead>
										<tr role="row">
											<th class="center">
												<span class="lbl" title="">序号</span>
											</th>
											<th class="center">记录类型</th>
											<th class="center">手机号码</th>
											<th class="center">用户昵称</th>
											<th class="center">记录名称</th>
											<th class="center">记录描述</th>
											<th class="center">获得积分</th>
											<th class="center">记录时间</th>
											<th class="center">有效期限</th>
											<th class="center">使用状态</th>
											<th class="center">使用时间</th>
											<th class="center">剩余积分</th>
										</tr>
										</thead>
										<tbody>
										<#if recordListByPage?if_exists>
											<#list recordListByPage as recordList>
											<tr>
												<td class="center">
													<div class="aName">${recordList_index+1+(pageView.pageNow-1)*pageView.pageSize}</div>
												</td>
												<td class="center">
													<div class="aName">
														<@option name="record_type_param" status="1" type="3" value="${recordList.recordType}"/>
													</div>
												</td>
												<td class="center">
													<div class="aName">${recordList.accoUsername?default("--")}</div>
												</td>
												<td class="center">
													<div class="aName">${recordList.infoNickname?default("--")}</div>
												</td>
												<td class="center">
													<div class="aName">${recordList.taskName?default("--")}</div>
												</td>
												<td class="center">
													<div class="aName"><@text_sub value="${recordList.taskDesc}" /></div>
												</td>
												<td class="center">
													<div class="aName">
														<span style="color:<#if recordList.earnType == "1">red<#else>green</#if>;">
														<@option name="earn_type_param" status="1" type="3" value="${recordList.earnType}" unit="${recordList.earnValue}"/>
														</span>
													</div>
												</td>
												<td class="center ">
													<div class="aName">
														<@date_sub value='${(recordList.recordTime?string("yyyy-MM-dd HH:mm:ss"))?default("--")}' />
													</div>
												</td>
												<td class="center ">
													<div class="aName">
														<@date_sub value='${(recordList.validTime?string("yyyy-MM-dd HH:mm:ss"))?default("--")}' />
													</div>
												</td>
												<td class="center">
													<div class="aName">
														<#if recordList.useStatus == null || recordList.useStatus == "">
														--
														<#else>
														<@option name="score_use_status_param" status="1" type="3" value="${recordList.useStatus}"/>
														</#if>
													</div>
												</td>
												<td class="center">
													<div class="aName">
														<@date_sub value='${(recordList.useTime?string("yyyy-MM-dd HH:mm:ss"))?default("--")}' />
													</div>
												</td>
												<td class="center">
													<div class="aName">${recordList.remainValue?default("--")}</div>
												</td>
											</tr>
											</#list>
										<#else>
											<tr align="center"><td colspan="12"><font color="red" size="4">没有查询到数据！</font></td></tr>
										</#if>
										</tbody>
									</table>
									<input type="hidden" id="pageNow" name="pageNow" value="${pageView.pageNow?if_exists}" />
									<#include "commons/page.ftl">
								</div>
							</div><!-- /.col -->
						</form>
						</div><!-- /.row -->
					</div><!-- /.page-content -->
				</div>
			</div><!-- /.main-content -->
		</div><!-- /.main-container -->
		
<form id="lastQueryForm" method="post" name="lastQueryForm" action="${ctx}/score/record/list?active=${active}">
 	<input type="hidden" id="oldPageNow" name="pageNow" value="${pageView.pageNow}" />
	<input type="hidden" name="accoUsername" value="${accoUsername}" />
	<input type="hidden" name="infoNickname" value="${infoNickname}" />
	<input type="hidden" name="recordType" value="${recordType}" />
	<input type="hidden" name="useStatus" value="${useStatus}" />
</form>		
<#include "commons/foot.ftl">

<script type="text/javascript">
	$(function(){
		//查询
		$("#queryCommit").click(function(){
			if(checkLoginStatus() == false) return;
			$("#pageNow").val(1);
			$("#queryForm").submit();
		});
	});
	//翻页动作
	function queryformPage() {
		$("#lastQueryForm").submit();
	}
</script>
<#include "commons/end.ftl">