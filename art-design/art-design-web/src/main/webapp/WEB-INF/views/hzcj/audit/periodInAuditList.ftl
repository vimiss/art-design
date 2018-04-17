<#assign active_parent_name = "分期管理">
<#assign active_menu_name = "分期审核管理">
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
					  <form action="${ctx}/itemPeriodAudit/listPeriodAudit?active=${active}" method="POST" id="queryForm">
						    <input id="pageNow" name="pageNow" type="hidden" value="${pageView.pageNow}" />
				 		   		<div class="col-xs-12">
									<div class="col-sm-3">
										<label>分期标题：</label>
									    <input type="text" id="perName" name="perName" value="${itemPeriod.perName}" placeholder="请输入分期标题" class="InputName0"	/>
									</div>
								    <div class="col-sm-6">
										<label>创建日期：</label>
										<input id="start_time" name="startTimeStr" value="${itemPeriod.startTimeStr}" class="Wdate WdateInput2" type="text" onfocus="var end_time=$dp.$('end_time');WdatePicker({onpicked:function(){end_time.focus();},dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'end_time\')}',isShowClear:true,isShowOthers:false,qsEnabled:false})">
										至
										<input id="end_time" name="endTimeStr" value="${itemPeriod.endTimeStr}" class="Wdate WdateInput2" type="text" onfocus="WdatePicker({minDate:'#F{$dp.$D(\'start_time\')}',dateFmt:'yyyy-MM-dd',isShowClear:true,isShowOthers:false,qsEnabled:false})">
										<span class="BtnSouSu default-btn btn-blue" id="queryCommit">搜 索</span>
									</div>
								</div>
						</form>
  				 	 </div>
				</div>
				<div class="row">
				   	<span onclick="goAudit();" class="BtnNormalSu default-btn btn-blue">审 核</span>								
				   		 
					<div class="col-xs-12">
						<table class="table table-striped table-bordered table-hover RtableStriped RtableStropSOS" >
							<thead>
								<tr role="row">
								    <th class="center" >选择</th>
									<th class="center" >项目标题</th>
									<th class="center" >分期标题</th>
									<th class="center" >分期额度</th>
									<th class="center" >剩余额度</th>
									<th class="center" >计划人数</th>
									<th class="center" >剩余人数</th>
									<th class="center" >是否浮动</th>
									<th class="center" >收益区间</th>
									<th class="center" >创建日期</th>
									<th class="center" >开始时间</th>
									<th class="center" >结束时间</th>
									<th class="center" >分期状态</th>
									<th class="center" >审核状态</th>
								</tr>
							</thead>
							
							<tbody>
								<#if itemPeriodList>
				            		<#list itemPeriodList as itemPeriod>
				            			<#if itemPeriod>
											<tr>
											<td class="center">
												<div><input name="periodIdRadio" type="radio" value="${itemPeriod.perId?if_exists}"></div>
											</td>
												<td class="center">
													<div>
														<a href="#"  style="color: #3eafe0" onclick="openItemInfo(${itemPeriod.itemId});" title="点击查看项目明细"> 
																${itemPeriod.itemName}
												   		</a>
													</div>
												</td>
												<td class="center">
													<div>
														<a href="#" style="color: #3eafe0" onclick="openPeriodInfo(${itemPeriod.perId});" title="点击查看项目分期明细">
															${itemPeriod.perName?if_exists}
														</a>
													</div>
												</td>
												<td class="center">
													<div><@amount_sub amount="${itemPeriod.perPlanQuota}" type=2 /></div>
												</td>
												<td class="center">
													<div><@amount_sub amount="${itemPeriod.perRemainQuota}" type=2 /></div>
												</td>
												<td class="center">
													<div>${itemPeriod.perTotalPeopleNum}</div>
												</td>
												<td class="center">
													<div>${itemPeriod.perRemainPeopleNum}</div>
												</td>
												<td class="center">
													<div><@option name="yes_no_type_param" status="1" type="3" value="${itemPeriod.perDrift}"/></div>
												</td>
												<td class="center">
													<div>
														<#if itemPeriod.perDrift == "0">
															${itemPeriod.perMinFee}%~${itemPeriod.perMaxFee}%
														<#else>
															${itemPeriod.perMinFee}%+浮动
														</#if>
													</div>
												</td>
												<td class="center">
													<div><@date_sub value='${itemPeriod.perTime?string("yyyy-MM-dd")}' /></div>
												</td>
												<td class="center">
													<div><@date_sub value='${itemPeriod.perOpenTime?string("yyyy-MM-dd HH:mm:ss")} '/></div>
												</td>
												<td class="center">
													<div><@date_sub value='${itemPeriod.perOverTime?string("yyyy-MM-dd HH:mm:ss")}' /></div>
												</td>
												<td class="center">
													<div><@option name="period_status_param" status="1" type="3" value="${itemPeriod.perStatus}"/></div>
												</td>
												<td class="center">
													<div><@option name="audit_status_param" status="1" type="3" value="${itemPeriod.perAuditStatus}"/></div>
												</td>
											</tr>
							    		</#if>
									</#list>
								<#else>
									<tr align="center"><td colspan="14"><font color="red" size="4">没有查询到数据！</font></td></tr>
								</#if>
							</tbody>
						</table>
						<#if itemPeriodList>
						<#include "commons/page.ftl">
						</#if>
					</div>
				</div>
			</div>
		</div>
	</div>
</div><!-- /.main-container -->

<form id="lastQueryForm" method="post" name="lastQueryForm" action="${ctx}/itemPeriodAudit/listPeriodAudit?active=${active}">
<input type="hidden" id="oldPageNow" name="pageNow" value="${pageView.pageNow}" />
	<input type="hidden" name="startTimeStr" value="${itemPeriod.startTimeStr}" />
	<input type="hidden" name="endTimeStr" value="${itemPeriod.endTimeStr}" />
	<input type="hidden" name="perName" value="${itemPeriod.perName}" />
</form>
<#include "commons/foot.ftl">

<!-- 编辑弹出框 -->	
<div class="modal fade" id="periodAuditAddModal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"></div>
<div class="modal fade" id="periodInfoModal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"></div>
<div class="modal fade" id="itemInfoModal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"></div>

<script type="text/javascript" src="${ctx}/js/hzcj/audit.js?v=${jsv}"></script>
<script type="text/javascript" src="${ctx}/js/hzcj/jquery.validation.js"></script>
<script type="text/javascript" src="${ctx}/js/hzcj/messages_cn.js"></script>

<!--body html end-->
<#include "commons/end.ftl">
<script type="text/javascript" >
</script>