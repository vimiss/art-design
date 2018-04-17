<#assign active_parent_name = "阀值配置管理">
<#assign active_menu_name = "阀值配置列表">
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
					<li><a href=""></a></li>
					<li></li>
				</ul>
			</div>
			<div class="page-content ">
				<div class="row" style="padding-top: 10px;">
				 	 <div class="col-xs-12">
					  <form action="${ctx}/configManagement/configList?active=${active}" method="POST" id="queryForm">
					  		<input type="hidden" name="querySign" value="1" />
						   <input id="pageNow" name="pageNow" type="hidden" value="${pageView.pageNow}" />
						   	 <div class="row" style="padding-top: 10px;">
				 		   		<div class="col-xs-12">
									 <div class="col-sm-4">
									 	<label>阀值名称：</label>
									    <input id="confName" name="confName" class="InputName0" value="${configVo.confName}"  type="text" >								
									 </div>
								     <div class="col-sm-6">
										<label>创建日期：</label>
										<input id="start_time" name="startTime" value="${configVo.startTime}" class="Wdate WdateInput2" type="text" onfocus="var end_time=$dp.$('end_time');WdatePicker({onpicked:function(){end_time.focus();},dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'end_time\')}',isShowClear:true,isShowOthers:false,qsEnabled:false})">
										至
										<input id="end_time" name="endTime" value="${configVo.endTime}" class="Wdate WdateInput2" type="text" onfocus="WdatePicker({minDate:'#F{$dp.$D(\'start_time\')}',dateFmt:'yyyy-MM-dd',isShowClear:true,isShowOthers:false,qsEnabled:false})">
										
									 	<span class="BtnSouSu default-btn btn-blue" id="queryCommit">搜 索</span>
									 </div>		
							 	</div>
							 </div>
						</form>
  				 	 </div>
				</div>
				<div class="row" style="padding-top: 10px;">
					<div class="col-xs-12">
					 <span onclick="goAddConfig();" class="BtnNormalSu default-btn btn-blue">新 增</span>
					    <span onclick="goConfigEdit();" class="BtnNormalSu default-btn btn-blue">修 改</span>
					    <span onclick="delConfig();" class="BtnNormalSu default-btn btn-blue">删 除</span>
					    
						<table class="table table-striped table-bordered table-hover RtableStriped RtableStropSOS" >
							<thead>
								<tr role="row">
								   <th class="center" >选择</th>
									<th class="center" >阀值名称</th>
									<th class="center" >阀值类型</th>
									<th class="center" >阀值最小值</th>
									<th class="center" >阀值最大值</th>
									<th class="center" >阀值排序</th>
									<th class="center" >阀值结果</th>
									<th class="center" >字典状态</th>
									<th class="center" >创建时间</th>
								</tr>
							</thead>
							
							<tbody>
								<#if configVoList>
				            		<#list configVoList as configVo>
				            			<#if configVo>
											<tr>
											<td class="center">
													<div class="aName">   <input name="chkItem" type="radio" value="${configVo.confId?if_exists}">  </div>
											</td>
												<td class="center">
													<div class="aName">
														<a href="#" style="color: #3eafe0" onclick="openConfigInfo(${configVo.confId});" title="点击查看项目明细">
															${configVo.confName?if_exists}
														</a>
													</div>
												</td>
												<td class="center">
													<div class="aName">
														<@option name="config_type_param" status="1" type="3" value="${configVo.confType}"/>
													</div>
												</td>
												<td class="center">
												<div class="aName">${configVo.confMinValue?if_exists}</div>
												</td>
												<td class="center">
												<div class="aName">${configVo.confMaxValue?if_exists}</div>
												</td>
												<td class="center">
												<div class="aName">${configVo.confSort?if_exists}</div>
												</td>
												<td class="center">
												<div class="aName">${configVo.confResult?if_exists}</div>
												</td>
												<td class="center">
												    <div class="aName">
														<@option name="status_param" status="1" type="3" value="${configVo.confStatus}"/>
													</div>
												</td>
												<td class="center">
													<div class="aName"><@date_sub value='${configVo.confTime?string("yyyy-MM-dd")}' /></div>
												</td>
											</tr>
							    		</#if>
									</#list>
								<#else>
									<tr align="center"><td colspan="9"><font color="red" size="4">没有查询到数据！</font></td></tr>
								</#if>
							</tbody>
						</table>
						<#if configVoList>
						<#include "commons/page.ftl">
						</#if>
					</div>
				</div>
			</div>
		</div>
	</div>
</div><!-- /.main-container -->

<form id="lastQueryForm" method="post" name="lastQueryForm" action="${ctx}/configManagement/configList?active=${active}">
<input type="hidden" id="oldPageNow" name="pageNow" value="${pageView.pageNow}" />
	<input type="hidden" name="startTime" value="${configVo.startTime}" />
	<input type="hidden" name="endTime" value="${configVo.endTime}" />
	<input type="hidden" name="querySign" value="1" />
</form>
<#include "commons/foot.ftl">

<!-- 编辑弹出框 -->	
<div class="modal fade" id="addModal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"></div>
<div class="modal fade" id="cofigInfoModal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"></div>
<div class="modal fade" id="cofigEditModal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"></div>


<!--body html end-->
<#include "commons/end.ftl">

<script type="text/javascript" src="${ctx}/js/hzcj/configs.js?v=${jsv}"></script>
<script type="text/javascript" src="${ctx}/js/hzcj/jquery.validation.js"></script>
<script type="text/javascript" src="${ctx}/js/hzcj/messages_cn.js"></script>
<script type="text/javascript" >

</script>