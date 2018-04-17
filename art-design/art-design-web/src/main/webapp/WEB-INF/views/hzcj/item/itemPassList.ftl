<#assign active_parent_name = "项目管理">
<#assign active_menu_name = "项目审核通过管理">
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
					  <form action="${ctx}/itemAudit/passItemList?active=${active}" method="POST" id="queryForm">
						    <input id="pageNow" name="pageNow" type="hidden" value="${pageView.pageNow}" />
						   	 <div class="row" style="padding-top: 10px;">
				 		   		<div class="col-xs-12">
								    <div class="col-sm-3">
										<label>项目标题：</label>
										<input type="text" name="itemName" value="${itemAuditVo.item.itemName?if_exists}" class="InputName0" maxlength="20">
								    </div>
							 	<div class="col-sm-3">
											<label>项目状态：</label>
										    <select class="chosen-select AceSelect" name="itemStatus" id="itemStatus">
												<@option name="item_status_param" status="1" value="${itemAuditVo.item.itemStatus}" show="02,03"/>
											</select>
									</div>
									<div class="col-sm-6">
											<label>创建时间：</label>
											<input id="start_time" name="startTimeStr" value="${itemAuditVo.item.startTimeStr}" class="Wdate WdateInput2" type="text" onfocus="var end_time=$dp.$('end_time');WdatePicker({onpicked:function(){end_time.focus();},dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'end_time\')}',isShowClear:true,isShowOthers:false,qsEnabled:false})">
											至
											<input id="end_time" name="endTimeStr" value="${itemAuditVo.item.endTimeStr}" class="Wdate WdateInput2" type="text" onfocus="WdatePicker({minDate:'#F{$dp.$D(\'start_time\')}',dateFmt:'yyyy-MM-dd',isShowClear:true,isShowOthers:false,qsEnabled:false})">
											
										<span id="queryCommit" class="BtnSouSu default-btn btn-blue" >搜 索</span>
									</div>
							 	</div>
							 </div>
						</form>
  				 	 </div>
				</div>
				<div class="row" style="padding-top: 10px;">
					<div class="col-xs-12">
						<table class="table table-striped table-bordered table-hover RtableStriped RtableStropSOS" >
							<thead>
								<tr role="row">
									<th class="center" >序号</th>
									<th class="center" >项目标题</th>
									<th class="center" >项目类别</th>
									<th class="center" >项目额度</th>
									<th class="center" >剩余额度</th>
									<th class="center" >收益方式</th>
									<th class="center" >收益区间</th>
									<th class="center" >项目期限</th>
									<th class="center" >创建时间</th>
									<th class="center" >开始时间</th>
									<th class="center" >项目状态</th>
									<th class="center" >审核人名称</th>
									<th class="center" >审核时间</th>
									<th class="center" >审核状态</th>
								</tr>
							</thead>
							
							<tbody>
								<#if itemAuditList>
				            		<#list itemAuditList as itemAudit>
											<tr>
												<td class="center">
													<div class="aName">${itemAudit_index+1+(pageView.pageNow-1)*pageView.pageSize}</div>
												</td>
												<td class="center">
													<div class="aName">
														<a href="#" style="color: #3eafe0" onclick="openItemInfo(${itemAudit.item.itemId});" title="点击查看项目明细">
															${itemAudit.item.itemName?if_exists}
														</a>
													</div>
												</td>
												<td class="center">
													<div class="aName"><@option name="item_type_param" status="1" type="3" value="${itemAudit.item.itemTypeCode}"/></div>
												</td>
												<td class="center">
													<div class="aName"><@amount_sub amount="${itemAudit.item.itemTotalQuota}" type=2 /></div>
												</td>
												<td class="center">
													<div class="aName"><@amount_sub amount="${itemAudit.item.itemRemainQuota}" type=2 /></div>
												</td>
												<td class="center">
													<div class="aName"><@option name="item_income_type_param" status="1" type="3" value="${itemAudit.item.itemIncomeType}"/></div>
												</td>
												<td class="center">
													<div class="aName">
														<#if itemAudit.item.itemDrift == "0">
															${itemAudit.item.itemMinFee}%~${itemAudit.item.itemMaxFee}%
														<#else>
															浮动
														</#if>
													</div>
												</td>
												<td class="center">
													<div class="aName">${itemAudit.item.itemTerm}<@option name="term_unit_param" status="1" type="3" value="${itemAudit.item.termUnit}"/></div>
												</td>
												<td class="center">
													<div class="aName"><@date_sub value='${itemAudit.item.itemTime?string("yyyy-MM-dd HH:mm:ss")}' /></div>
												</td>
												<td class="center">
													<div class="aName"><@date_sub value='${itemAudit.item.itemBeginTime?string("yyyy-MM-dd HH:mm:ss")}' /></div>
												</td>
												<td class="center">
													<div class="aName"><@option name="item_status_param" status="1" type="3" value="${itemAudit.item.itemStatus}"/></div>
												</td>
												<td class="center">
													<div class="aName">${itemAudit.auditUserName}</div>
												</td>
												<td class="center">
													<div class="aName">${itemAudit.auditTime?string("yyyy-MM-dd HH:mm:ss")}</div>
												</td>
												<td class="center">
													<div class="aName"><@option name="result_type_param" status="1" type="3" value="${itemAudit.auditResult}"/></div>
												</td>
											</tr>
									</#list>
								<#else>
									<tr align="center"><td colspan="14"><font color="red" size="4">没有查询到数据！</font></td></tr>
								</#if>
							</tbody>
						</table>
						<#if itemAuditList>
						<#include "commons/page.ftl">
						</#if>
					</div>
				</div>
			</div>
		</div>
	</div>
</div><!-- /.main-container -->

<form id="lastQueryForm" method="post" name="lastQueryForm" action="${ctx}/itemAudit/passItemList?active=${active}">
    <input type="hidden" id="oldPageNow" name="pageNow" value="${pageView.pageNow}" />
	<input type="hidden" name="startTimeStr" value="${itemAuditVo.item.startTimeStr}" />
	<input type="hidden" name="endTimeStr" value="${itemAuditVo.item.endTimeStr}" />
	<input type="hidden" name="itemStatus" value="${itemAuditVo.item.itemStatus}" />
	<input type="hidden" name="itemName" value="${itemAuditVo.item.itemName}" />
</form>
<#include "commons/foot.ftl">

<!-- 编辑弹出框 -->	
<div class="modal " id="itemInfoModal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"></div>

<script type="text/javascript" src="${ctx}/js/hzcj/itemcheck.js?v=${jsv}"></script>
<script type="text/javascript" src="${ctx}/js/hzcj/jquery.validation.js"></script>
<script type="text/javascript" src="${ctx}/js/hzcj/messages_cn.js"></script>





<!--body html end-->
<#include "commons/end.ftl">
<script type="text/javascript" >
</script>