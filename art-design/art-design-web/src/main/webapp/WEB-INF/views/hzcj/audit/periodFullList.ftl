<#assign active_parent_name = "分期管理">
<#assign active_menu_name = "分期募集完成管理">
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
						<form action="${ctx}/itemPeriodAudit/listFullPeriod" method="POST" id="queryForm">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->
								<div class="col-sm-3">
									<label>项目标题：</label>
									<input type="text" name="itemName" value="${itemPeriodAuditVo.item.itemName?if_exists}" class="InputName0" >
								</div>
								<div class="col-sm-3">
									<label>分期标题：</label>
									<input type="text" name="perName" value="${itemPeriodAuditVo.itemPeriod.perName?if_exists}" class="InputName0" >
								</div>
								<div class="col-sm-6">
										<label>创建日期：</label>
										<input id="start_time" name="startTimeStr" value="${itemPeriodAuditVo.itemPeriod.startTimeStr}" class="Wdate WdateInput2" type="text" onfocus="var end_time=$dp.$('end_time');WdatePicker({onpicked:function(){end_time.focus();},dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'end_time\')}',isShowClear:true,isShowOthers:false,qsEnabled:false})">
										至
										<input id="end_time" name="endTimeStr" value="${itemPeriodAuditVo.itemPeriod.endTimeStr}" class="Wdate WdateInput2" type="text" onfocus="WdatePicker({minDate:'#F{$dp.$D(\'start_time\')}',dateFmt:'yyyy-MM-dd',isShowClear:true,isShowOthers:false,qsEnabled:false})">	
										<span id="queryCommit" class="BtnSouSu default-btn btn-blue" >搜 索</span>
								</div>
							</div>
								<div class="col-xs-12 ">
									<span onclick="queryEffect();" class="BtnNormalSu default-btn btn-blue">订单生效</span>
									<span onclick="queryPeriodApply()" class="BtnNormalSu default-btn btn-blue" >查看订单</span>
									<table class="table table-striped table-bordered table-hover RtableStriped RtableStropSOS">
										<thead>
										<tr role="row">
											<th class="center" >选择</th>
											<th class="center" width="150px">项目标题</th>
											<th class="center" width="150px">分期标题</th>
											<th class="center" >分期额度</th>
											<th class="center" >剩余额度</th>
											<th class="center" >分期人数</th>
											<th class="center" >剩余人数</th>
											<th class="center" >是否浮动</th>
											<th class="center" >收益区间</th>
											<th class="center" >创建日期</th>
											<th class="center" >开始时间</th>
											<th class="center" >结束时间</th>
											<th class="center" >分期状态</th>
											<th class="center" >审核人名称</th>
											<th class="center" >审核时间</th>
											<th class="center" >审核结果</th>
										</tr>
										</thead>
										<tbody>
										<#if itemPeriodAuditList>
											<#list itemPeriodAuditList as itemPeriodAudit>
											<tr>
												<td class="center">
													<div><input name="auditIdRadio" type="radio" value="${itemPeriodAudit.auditId?if_exists}"></div>
												</td>
												<td class="center">
													<div>
														<a href="#"  style="color: #3eafe0" onclick="openItemInfo(${itemPeriodAudit.itemId});" title="点击查看项目明细"> 
															${itemPeriodAudit.item.itemName?if_exists}
												   		</a>
													</div>
												</td>
												<td class="center">
													<div>
														<a href="#" style="color: #3eafe0" onclick="openPeriodInfo(${itemPeriodAudit.perId});" title="点击查看分期明细">
															${itemPeriodAudit.itemPeriod.perName?if_exists}
														</a>
													</div>
												</td>
												<td class="center">
													<div><@amount_sub amount="${itemPeriodAudit.itemPeriod.perPlanQuota}" type=2 /></div>
												</td>
												<td class="center">
													<div><@amount_sub amount="${itemPeriodAudit.itemPeriod.perRemainQuota}" type=2 /></div>
												</td>
												<td class="center">
													<div>${itemPeriodAudit.itemPeriod.perTotalPeopleNum}</div>
												</td>
												<td class="center">
													<div>${itemPeriodAudit.itemPeriod.perRemainPeopleNum}</div>
												</td>
												<td class="center">
													<div><@option name="yes_no_type_param" status="1" type="3" value="${itemPeriodAudit.itemPeriod.perDrift}" /></div>
												</td>
												<td class="center">
													<div>
														<#if itemPeriodAudit.itemPeriod.perDrift == "0">
															${itemPeriodAudit.itemPeriod.perMinFee}%~${itemPeriodAudit.itemPeriod.perMaxFee}%
														<#else>
															${itemPeriodAudit.itemPeriod.perMinFee}%+浮动
														</#if>
													</div>
												</td>
												<td class="center">
													<div><@date_sub value='${itemPeriodAudit.itemPeriod.perTime?string("yyyy-MM-dd HH:mm:ss")}' /></div>
												</td>
												<td class="center">
													<div><@date_sub value='${itemPeriodAudit.itemPeriod.perOpenTime?string("yyyy-MM-dd HH:mm:ss")}' /></div>
												</td>
												<td class="center">
													<div><@date_sub value='${itemPeriodAudit.itemPeriod.perOverTime?string("yyyy-MM-dd HH:mm:ss")}' /></div>
												</td>
												<td class="center">
													<div class="aName">
														<a onclick="queryPeriodStatus(${itemPeriodAudit.perId});">
															<@option name="period_status_param" status="1" type="3" value="${itemPeriodAudit.itemPeriod.perStatus}" />
														</a>
													</div>
												</td>
												<td class="center">
													<div>${itemPeriodAudit.auditUserName}</div>
												</td>
												<td class="center">
													<div><@date_sub value='${itemPeriodAudit.auditTime?string("yyyy-MM-dd HH:mm:ss")}' /></div>
												</td>
												<td class="center">
													<div><@option name="result_type_param" type="3" status="1" value="${itemPeriodAudit.auditResult}"/></div>
												</td>
											</tr>
											</#list>
										<#else>
											<tr align="center"><td colspan="16"><font color="red" size="4">没有查询到数据！</font></td></tr>
										</#if>
										</tbody>
									</table>
									<input type="hidden" id="pageNow" name="pageNow" value="${pageView.pageNow?if_exists}" />
									<#if itemPeriodAuditList>
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

<form id="lastQueryForm" method="post" name="lastQueryForm" action="${ctx}/itemPeriodAudit/listFullPeriod">
 	<input type="hidden" id="oldPageNow" name="pageNow" value="${pageView.pageNow}" />
	<input type="hidden" name="startTimeStr" value="${itemPeriodAuditVo.itemPeriod.startTimeStr}" />
	<input type="hidden" name="endTimeStr" value="${itemPeriodAuditVo.itemPeriod.endTimeStr}" />
	<input type="hidden" name="perName" value="${itemPeriodAuditVo.itemPeriod.perName}" />
	<input type="hidden" name="itemName" value="${itemPeriodAuditVo.item.itemName}" />
</form>
		
<#include "commons/foot.ftl">
<div class="modal fade" id="periodApplyListModal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"></div>
<div class="modal fade" id="periodEffectModal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"></div>
<div class="modal fade" id="periodStatusModal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"></div>
<div class="modal fade" id="periodInfoModal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"></div>
<div class="modal fade" id="itemInfoModal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"></div>


<script type="text/javascript" src="${ctx}/js/hzcj/audit.js?v=${jsv}"></script>
<script type="text/javascript" src="${ctx}/js/hzcj/jquery.validation.js"></script>
<script type="text/javascript" src="${ctx}/js/hzcj/messages_cn.js"></script>
<script type="text/javascript">
</script>
<#include "commons/end.ftl">