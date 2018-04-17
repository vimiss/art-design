<#assign active_parent_name = "公告管理">
<#assign active_menu_name = "公告列表">
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
			<div class="breadcrumbs" id="breadcrumbs">
				<script type="text/javascript">
								try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
							</script>
				<ul class="breadcrumb">
					<li><span><i class="ace-icon fa  fa-map-marker bigger-130"></i> 当前位置：</span></li>
					<li><a href="${ctx}/index">首页</a>
						<!--<a href="#">UI &amp; Elements</a>--></li>
					<li><a href=""></a></li>
					<li></li>
				</ul>
			</div>
			<div class="page-content ">
				<div class="row" style="padding-top: 10px;">
				 	 <div class="col-xs-12">
					  <form action="${ctx}/noticeManagement/listnotice?active=${active}" method="POST" id="queryForm">
					  		<input type="hidden" name="querySign" value="1" />
						   <input id="pageNow" name="pageNow" type="hidden" value="${pageView.pageNow}" />
						   	 <div class="row" style="padding-top: 10px;">
									 	
				 		   		<div class="col-xs-12">
										<div class="col-sm-3">
											<label>栏目标题：</label>
											   <input type="text" class="InputName0" name="infoTitle" id="infoTitle"  value="${spreadInfoVo.infoTitle}"  maxlength="20"  placeholder="请输入栏目标题">
										</div>
									<div class="col-sm-3">
										<label>栏目类型：</label>
											 <select class="chosen-select AceSelect" name="infoType" id="infoType">
												<@option name="fence_type_param" status="1" method="getFenceAsOption" value="${spreadInfoVo.infoType}"/>
											</select>
										</div>
							 
								     <div class="col-sm-6">
										<label>发布日期：</label>
										<input id="start_time" name="startTime" value="${spreadInfoVo.startTime}" class="Wdate WdateInput2" type="text" onfocus="var end_time=$dp.$('end_time');WdatePicker({onpicked:function(){end_time.focus();},dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'end_time\')}',isShowClear:true,isShowOthers:false,qsEnabled:false})">
										至
										<input id="end_time" name="endTime" value="${spreadInfoVo.endTime}" class="Wdate WdateInput2" type="text" onfocus="WdatePicker({minDate:'#F{$dp.$D(\'start_time\')}',dateFmt:'yyyy-MM-dd',isShowClear:true,isShowOthers:false,qsEnabled:false})">
										
									   <span class="BtnSouSu default-btn btn-blue" id="queryCommit">搜 索</span>
									 </div>			
									 
									 							
							 	</div>
							 </div>
						</form>
  				 	 </div>
				</div>
				<div class="row" style="padding-top: 10px;">
					<div class="col-xs-12">
					   <span class="BtnNormalSu default-btn btn-blue"  onclick="goAddNotice();">新 增</span>
					 	<span onclick="goEditNotice();" class="BtnNormalSu default-btn btn-blue">修 改</span>
					    <span onclick="goDel();" class="BtnNormalSu default-btn btn-blue">删 除</span>
					    <span onclick="goPdf();" class="BtnNormalSu default-btn btn-blue">转PDF</span>
					    
						<table class="table table-striped table-bordered table-hover RtableStriped RtableStropSOS" >
							<thead>
								<tr role="row">
								    <th class="center" >选择 </th>
									<th class="center" >栏目标题</th>
									<th class="center" >栏目类型</th>
									<th class="center" >发布时间</th>
									<th class="center" >是否为列表</th>
									<th class="center" >是否已转PDF</th>
								</tr>
							</thead>
							
							<tbody>
								<#if spreadInfoList>
				            		<#list spreadInfoList as spreadInfoVo>
				            			<#if spreadInfoVo>
											<tr>
											<td class="center">
													<div class="aName"><input name="chkItem" type="radio" value="${spreadInfoVo.infoId?if_exists}">  </div>
											</td>
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
													<div class="aName">
														<@option name="yes_no_type_param"   status="1" type="3" value="${spreadInfoVo.itemIfList}"/>
													</div>
												</td>
												<td class="center">
													<div class="aName">
														<#if spreadInfoVo.infoPdfPath!=null>
														   是
														<#else>
														  否
														</#if>
													</div>
												</td>
												<!--
												<td class="center ">
													<div>
														<a  href="#"  onclick="goEditNotice(${spreadInfoVo.infoId});" style="color: #3eafe0">
														编辑
													</a>
														&nbsp;|&nbsp;
															</a>
														&nbsp;|&nbsp;<a href="#"  style="color: #3eafe0" onclick="goDel(${spreadInfoVo.infoId});" >
														删除
													</a>
														<a href="#" style="color: #3eafe0" onclick="goPdf(${spreadInfoVo.infoId});">
														转PDF
												</a>
													</div>
												</td>
												-->
											</tr>
							    		</#if>
									</#list>
								<#else>
									<tr align="center"><td colspan="6"><font color="red" size="4">没有查询到数据！</font></td></tr>
								</#if>
							</tbody>
						</table>
						<#if spreadInfoList>
						<#include "commons/page.ftl">
						</#if>
					</div>
				</div>
			</div>
		</div>
	</div>
</div><!-- /.main-container -->

<form id="lastQueryForm" method="post" name="lastQueryForm" action="${ctx}/noticeManagement/listnotice?active=${active}">
<input type="hidden" id="oldPageNow" name="pageNow" value="${pageView.pageNow}" />
	<input type="hidden" name="startTime" value="${spreadInfoVo.startTime}" />
	<input type="hidden" name="endTime" value="${spreadInfoVo.endTime}" />
	<input type="hidden" name="infoType" value="${spreadInfoVo.infoType}" />
	<input type="hidden" name="infoTitle" value="${spreadInfoVo.infoTitle}" />
	<input type="hidden" name="querySign" value="1" />
</form>
<#include "commons/foot.ftl">

<!-- 编辑弹出框 -->	
<div class="modal fade" id="editModal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"></div>
<div class="modal fade" id="addModal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"></div>


<script type="text/javascript" charset="utf-8" src="/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="/ueditor/ueditor.all.js"></script>
<script type="text/javascript" src="${ctx}/js/plugins/jquery.form/jquery.form.js"></script>
<script type="text/javascript" src="${ctx}/js/hzcj/notice.js?v=${jsv}"></script>
<script type="text/javascript" src="${ctx}/js/hzcj/jquery.validation.js"></script>
<script type="text/javascript" src="${ctx}/js/hzcj/messages_cn.js"></script>
<!--body html end-->
<#include "commons/end.ftl">
