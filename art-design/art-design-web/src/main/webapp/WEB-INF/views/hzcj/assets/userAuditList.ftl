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
							<li><a href="${ctx}/index">首页</a>
							<li><a href=""></a></li>
							<li></li>
						</ul>
						<!-- /.breadcrumb -->
						<!-- /section:basics/content.searchbox -->
					</div>
					<div class="page-content ">
						<div class="row" style="padding-top: 10px;">
						<form action="${ctx}/assets/user/auditList" method="POST" id="queryForm">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->
								 <div class="col-sm-3">
										<label>审核状态：</label>
										<select class="chosen-select AceSelect" name="status" >
											<@option name="audit_status_param" status="1" type="4" value="${assetsVo.status}" show="2,3"/>
										</select>
								</div>	
								 <div class="col-sm-6">
										<label>申请时间：</label>
										<input id="start_time" name="startTime" value="${assetsVo.startTime}" class="Wdate WdateInput2" type="text" onfocus="var end_time=$dp.$('end_time');WdatePicker({onpicked:function(){end_time.focus();},dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'end_time\')}',isShowClear:true,isShowOthers:false,qsEnabled:false})">
										至
										<input id="end_time" name="endTime" value="${assetsVo.endTime}" class="Wdate WdateInput2" type="text" onfocus="WdatePicker({minDate:'#F{$dp.$D(\'start_time\')}',dateFmt:'yyyy-MM-dd',isShowClear:true,isShowOthers:false,qsEnabled:false})">
										<span  id="queryCommit" class="BtnSouSu default-btn btn-blue" onclick="file_Submit()">搜 索</span>
								</div>		
							</div>
								<div class="col-xs-12 ">
									<span id="queryGet" onclick="get();" class="BtnNormalSu default-btn btn-blue">查 看</span>
									
									<table class="table table-striped table-bordered table-hover RtableStriped RtableStropSOS">
										<thead>
										<tr role="row">
											<th class="center">
												选择
											</th>
											<th class="center">
												序号
											</th>
											<th class="center">
												用户昵称
											</th>
											<th class="center">
												用户账号
											</th>
											<th class="center" >
												投资者身份
											</th>
											<th class="center" >
												申请时间
											</th>
											<th class="center" >
												审核人
											</th>
											<th class="center" >
												审核结果
											</th>
											<th class="center">
												审核时间
											</th>
											<th class="center">
												审核意见
											</th>
										</tr>
										</thead>
										<tbody>
										<#if userList>
											<#list userList as user>
											<tr>
												<td class="center">
													<div class="aName"><input type="radio" value="${user.assetId}" name="assetIdRadio" /></div>
												</td>
												<td class="center">
													<div class="aName">${user_index+1+(pageView.pageNow-1)*pageView.pageSize}</div>
												</td>
												<td class="center">
													<div class="aName">${user.infoNickname?default("--")}</div>
												</td>
												<td class="center">
													<div class="aName">${user.accoUsername?default("--")}</div>
												</td>
												<td class="center">
													<div class="aName">
														<@option name="user_type_param" status="1" type="3" value="${user.userType}"/>
													</div>
												</td>
												<td class="center">
													<div class="aName"><@date_sub value='${user.assetTime?string("yyyy-MM-dd HH:mm:ss")}' /></div>
												</td>
												<td class="center">
													<div class="aName">${user.auditUsername?default("--")}</div>
												</td>
												<td class="center">
													<div class="aName">
														<@option name="audit_status_param" status="1" type="3" value="${user.assetAuditStatus}"/>
													</div>
												</td>
												<td class="center">
													<div class="aName">
													<#if user.assetAuditTime>
														<@date_sub value='${user.assetAuditTime?string("yyyy-MM-dd HH:mm:ss")}' />
													<#else>
														--
													</#if>	
													</div>
												</td>
												<td class="center">
													<div class="aName">
														${user.assetResult?default("--")}
													</div>
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
							</div><!-- /.col -->
						</form>
						</div><!-- /.row -->
					</div><!-- /.page-content -->
				</div>
			</div><!-- /.main-content -->
		</div><!-- /.main-container -->

<form id="lastQueryForm" method="post" name="lastQueryForm" action="${ctx}/assets/user/auditList">
 	<input type="hidden" id="oldPageNow" name="pageNow" value="${pageView.pageNow}" />
	<input type="hidden" name="status" value="${assetsVo.status}" />
	<input type="hidden" name="startTime" value="${assetsVo.startTime}" />
	<input type="hidden" name="endTime" value="${assetsVo.endTime}" />
</form>
		
<#include "commons/foot.ftl">
<div class="modal fade HoranMyModals" id="catalog_list_modal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"></div>
<script type="text/javascript">
	function getRadioInput() {
		var radioInput = $('input:radio[name="assetIdRadio"]:checked').val();
		return radioInput;
	}
	
	function file_Submit(){
		if(checkLoginStatus() == false) return;
		$("#pageNow").val(1);
		$("#queryForm").submit();
	}
	function get(){
		var assetIdRadio = getRadioInput();
		if (!assetIdRadio) {
			Modal.alert({msg:"请选择一条需要操作的数据"});
			return;
		}
		
		$('#catalog_list_modal').html("加载中...").load(ctx+'/assets/user/get?id='+assetIdRadio+'&r='+Math.random(),function(){
			$("#catalog_list_modal").modal();
		});
	}
	//翻页动作
	function queryformPage(){
		$("#lastQueryForm").submit();
	};
</script>
<#include "commons/end.ftl">