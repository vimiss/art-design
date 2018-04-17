<#assign active_parent_name = "分期管理">
<#assign active_menu_name = "分期列表">
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
					  <form action="${ctx}/periodManagement/listItemPeriod?active=${active}" method="POST" id="queryForm">
					  		<input type="hidden" name="querySign" value="1" />
						   <input id="pageNow" name="pageNow" type="hidden" value="${pageView.pageNow}" />
						   <input id="itemId" name="itemId" type="hidden" value="${itemPeriod.itemId}" />
						   	 <div class="row">
				 		   		<div class="col-xs-12">
									 <div class="col-sm-3">
										<label>分期标题：</label>
									      <input type="text" class="InputName0" name="perName" value="${itemPeriod.perName}" placeholder="请输入分期标题" />
									</div>
							 
							  <div class="col-sm-3">
									<label>审核状态：</label>
							       <select class="chosen-select AceSelect" name="perAuditStatus" id="perAuditStatus">
									<@option name="audit_status_param" status="1" value="${itemPeriod.perAuditStatus}" show="0,2"/>
								</select>
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
					<div class="col-xs-12">
					   <span onclick="goAdd('itemCloums=');" class="BtnNormalSu default-btn btn-blue">新 增</span>
					    <span onclick="goPeriodEdit();" class="BtnNormalSu default-btn btn-blue">修 改</span>
					    <span onclick="delPeriod();" class="BtnNormalSu default-btn btn-blue">删 除</span>
					    <span onclick="subAudit();" class="BtnNormalSu default-btn btn-blue">提 交</span>
					    
						<table class="table table-striped table-bordered table-hover RtableStriped RtableStropSOS" >
							<thead>
								<tr role="row">
								     <th class="center" >选择</th>
									<th class="center" >分期标题</th>
									<th class="center" >项目标题</th>
									<th class="center" >分期额度</th>
									<th class="center" >收益区间</th>
									<th class="center" >分期人数</th>
									<th class="center" >创建日期</th>
									<th class="center" >开始时间</th>
									<th class="center" >结束时间</th>
									<th class="center" >分期状态</th>
									<th class="center" >审核状态</th>
									<th class="center">操作</th>
								</tr>
							</thead>
							
							<tbody>
								<#if itemPeriodList>
				            		<#list itemPeriodList as itemPeriod>
				            			<#if itemPeriod>
											<tr>
											<td class="center">
													<div>   <input name="chkItem" type="radio" value="${itemPeriod.perId?if_exists}" pitemId="${itemPeriod.itemId}">  </div>
											</td>
												<td class="center">
													<div>
														<a href="#" style="color: #3eafe0" onclick="openPeriodInfo(${itemPeriod.perId});" title="点击查看分期明细">
															${itemPeriod.perName?if_exists}
														</a>
													</div>
												</td>
												<td class="center">
												  <a href="#"  style="color: #3eafe0" onclick="openItemInfo(${itemPeriod.itemId});" title="点击查看项目明细"> 
													${itemPeriod.itemName}
												   </a>
												</td>
												<td class="center">
													<div>
														<@amount_sub amount="${itemPeriod.perPlanQuota?if_exists}" type=2 />
													</div>
												</td>
												<td class="center">
													<div>
														<#if itemPeriod.perDrift == "0">
															<#if itemPeriod.perMinFee != null || itemPeriod.perMinFee != "">
																${itemPeriod.perMinFee}%</#if><#if itemPeriod.perMaxFee != null || itemPeriod.perMaxFee != "">~${itemPeriod.perMaxFee}%
															<#else>
																--
															</#if>
														<#else>
															<#if itemPeriod.perMinFee != null || itemPeriod.perMinFee != "">${itemPeriod.perMinFee}%+</#if>浮动
														</#if>
													</div>
												</td>
												<td class="center">
													<div>${itemPeriod.perTotalPeopleNum?if_exists}</div>
												</td>
												<td class="center">
												<div style=""><@date_sub value='${itemPeriod.perTime?string("yyyy-MM-dd")}' /></div>
												</td>
												<td class="center">
												<div style=""><@date_sub value='${itemPeriod.perOpenTime?string("yyyy-MM-dd HH:mm:ss")}' /></div>
												</td>
												<td class="center">
												<div style=""><@date_sub value='${itemPeriod.perOverTime?string("yyyy-MM-dd HH:mm:ss")}' /></div>
												</td>
												<td class="center">
													<@option name="period_status_param"   status="1" type="3" value="${itemPeriod.perStatus}"/>
												</td>
												<td class="center">
													<@option name="audit_status_param"   status="1" type="3" value="${itemPeriod.perAuditStatus}"/>
												</td>
												<!--	<td class="center">
												<#if itemPeriod.perStatus==1>
													当前状态:【新增】
													&nbsp;|&nbsp;
													<a href="#" style="color: #3eafe0" onclick="ajaxOpenPeriod(${itemPeriod.perId},${itemPeriod.itemId});" title="点击开启项目">开启</a>
													</#if>
												<#if itemPeriod.perStatus==2>
													当前状态:【开启】
													&nbsp;|&nbsp;
													<a href="#" style="color: #3eafe0" onclick="ajaxClosePeriod(${itemPeriod.perId},${itemPeriod.itemId});" title="点击关闭项目">关闭</a>
													</#if>
													<#if itemPeriod.perStatus==3>
														当前状态:【关闭】
														&nbsp;|&nbsp;
													<a href="#" style="color: #3eafe0" onclick="ajaxOpenPeriod(${itemPeriod.perId},${itemPeriod.itemId});" title="点击开启项目">开启</a>
												</#if>
													</td>-->
											
												<td class="center ">
													<div>
												<!--<a href="#"  style="color: #3eafe0" onclick="goPeriodEdit(${itemPeriod.perId});" > 修改 </a>
														&nbsp;|&nbsp;
												 <a href="#"  style="color: #3eafe0" onclick="delPeriod(${itemPeriod.perId},${itemPeriod.perAuditStatus});" > 删除 </a>
												 	&nbsp;|&nbsp;-->
												    <a class="btn btn-primary btn-sm" onclick="editIncome(${itemPeriod.itemId},${itemPeriod.perId});" > 编辑收益基准 </a>
												    <a class="btn btn-primary btn-sm" onclick="checkPeriodAudit(${itemPeriod.itemId},${itemPeriod.perId});" > 查看意见</a>
													</div>
												</td>
											</tr>
							    		</#if>
									</#list>
								<#else>
									<tr align="center"><td colspan="12"><font color="red" size="4">没有查询到数据！</font></td></tr>
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

<form id="lastQueryForm" method="post" name="lastQueryForm" action="${ctx}/periodManagement/listItemPeriod?active=${active}">
     <input type="hidden" id="oldPageNow" name="pageNow" value="${pageView.pageNow}" />
	<input type="hidden" name="startTimeStr" value="${itemPeriod.startTimeStr}" />
	<input type="hidden" name="endTimeStr" value="${itemPeriod.endTimeStr}" />
	<input type="hidden" name="perStatus" value="${itemPeriod.perStatus}" />
	<input type="hidden" name="perName" value="${itemPeriod.perName}" />
</form>
<#include "commons/foot.ftl">

<!-- 编辑弹出框 -->	
<div class="modal fade" id="addModal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabelAdd"></div>
<div class="modal fade" id="periodInfoModal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabelEdit"></div>
<div class="modal fade" id="periodEditModal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"></div>
<div class="modal fade" id="itemInfoModal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"></div>
<div class="modal fade" id="choseItemModal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"></div>


<script type="text/javascript" src="${ctx}/js/hzcj/period.js?v=${jsv}"></script>
<script type="text/javascript" src="${ctx}/js/hzcj/jquery.validation.js"></script>
<script type="text/javascript" src="${ctx}/js/hzcj/messages_cn.js"></script>





<!--body html end-->
<#include "commons/end.ftl">
<script type="text/javascript" >
	function choseItem(param) {
		$('#choseItemModal').html("加载中...").load('${ctx}/periodManagement/goChoseItemList', param,function(res,sta,xhr){
			if(res){//判断是否正常返回了数据--登录拦截,res,sta,xhr
				$("#choseItemModal").modal({
					keyboard:'false',//true是默认可是使用esc退出弹窗，false是不能使用esc退出
					show:'true',// bool值，立即调用show
					backdrop:'static'//static是只在弹窗内点击关闭按钮可以关闭
				});
			}
		});
	}

</script>