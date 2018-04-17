<#assign active_parent_name = "项目管理">
<#assign active_menu_name = "项目列表">
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
					  <form action="${ctx}/itemManagement/listItem?active=${active}" method="POST" id="queryForm">
					  		<input type="hidden" name="querySign" value="1" />
						   <input id="pageNow" name="pageNow" type="hidden" value="${pageView.pageNow}" />
						   	 <div class="row" style="padding-top: 10px;">
				 		   		<div class="col-xs-12">
				 		   			 <div class="col-sm-3">
											<label>审核状态：</label>
									       <select class="chosen-select AceSelect" name="itemAuditStatus" id="itemAuditStatus">
											<@option name="audit_status_param" status="1" value="${item.itemAuditStatus}" show="0,2"/>
										</select>
									</div>
									
									 <div class="col-sm-3">
											<label>项目标题：</label>
									      <input type="text" class="InputName0" name="itemName" value="${item.itemName}" placeholder="请输入项目名称" />
									</div>
								
								     <div class="col-sm-5">
										<label>发布日期：</label>
										<input id="start_time" name="startTimeStr" value="${item.startTimeStr}" class="Wdate WdateInput1" type="text" onfocus="var end_time=$dp.$('end_time');WdatePicker({onpicked:function(){end_time.focus();},dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'end_time\')}',isShowClear:true,isShowOthers:false,qsEnabled:false})">
										至
										<input id="end_time" name="endTimeStr" value="${item.endTimeStr}" class="Wdate WdateInput1" type="text" onfocus="WdatePicker({minDate:'#F{$dp.$D(\'start_time\')}',dateFmt:'yyyy-MM-dd',isShowClear:true,isShowOthers:false,qsEnabled:false})">
									    <span class="BtnSouSu default-btn btn-blue" id="queryCommit">搜 索</span>
									 </div>																											 
							 	</div>
							 </div>
						</form>
  				 	 </div>
				</div>
				<div class="row" style="padding-top: 10px;">
					<div class="col-xs-12">
				    <span onclick="goAddPage();" class="BtnNormalSu default-btn btn-blue">新 增</span>
				    <span onclick="goItemEdit();" class="BtnNormalSu default-btn btn-blue">修 改</span>
				    <span onclick="submitItemDel();" class="BtnNormalSu default-btn btn-blue">删 除</span>
				    <span onclick="subItemAudit();" class="BtnNormalSu default-btn btn-blue">提 交</span>
				    
						<table class="table table-striped table-bordered table-hover RtableStriped RtableStropSOS" >
							<thead>
								<tr role="row">
								 <th class="center">选择</th>
									<th class="center">项目标题</th>
									<th class="center">总额度</th>
									<th class="center">剩余额度</th>
									<th class="center">收益区间</th>
									<th class="center">认购费率</th>
									<th class="center">创建时间</th>
									<th class="center">开始时间</th>
									<th class="center">项目状态</th>
									<th class="center">审核状态</th>
									<th class="center">操作</th>
								</tr>
							</thead>
							
							<tbody>
								<#if itemList>
				            		<#list itemList as item>
				            			<#if item>
											<tr>
											<td class="center">
													<div class="aName"><input name="chkItem" type="radio" value="${item.itemId?if_exists}"></div>
											</td>
												<td class="center">
													<div class="aName">
														<a href="#" style="color: #3eafe0" onclick="openItemInfo(${item.itemId});" title="点击查看项目明细">
															${item.itemName?if_exists}
														</a>
													</div>
												</td>
												<td class="center">
													<div class="aName">
													<@amount_sub amount="${item.itemTotalQuota}" type=2 />
													</div>
												</td>
												<td class="center">
													<div class="aName">
													<@amount_sub amount="${item.itemRemainQuota}" type=2 />
													</div>
												</td>
												<td class="center">
													<div class="aName">
														<#if item.itemDrift == "0">
															${item.itemMinFee?if_exists}%~${item.itemMaxFee?if_exists}%
														<#else>
															浮动
														</#if>
													</div>
												</td>
												<td class="center">
													<div class="aName">${item.itemReviseFee?if_exists}%</div>
												</td>
												<td class="center">
												<div class="aName"><@date_sub value='${item.itemTime?string("yyyy-MM-dd HH:mm:ss")}' /></div>
												</td>
												<td class="center">
												<div class="aName"><@date_sub value='${item.itemBeginTime?string("yyyy-MM-dd HH:mm:ss")}' /></div>
												</td>
												<td class="center">
													<div class="aName">
														<@option name="item_status_param"   status="1" type="3" value="${item.itemStatus}"/>
													</div>
												</td>
												<td class="center">
													<div class="aName">
														<@option name="audit_status_param"   status="1" type="3" value="${item.itemAuditStatus}"/>
													</div>
												</td>
												<td class="center ">
													<div class="aName">
													<a class="btn btn-primary btn-sm" onclick="queryItemNoticeList('itemId=${item.itemId}');" title="可修改或添加栏目">添加栏目附件</a>
													<a class="btn btn-primary btn-sm" onclick="queryRelationList('itemId=${item.itemId}');">添加视频</a>
													<a class="btn btn-primary btn-sm" onclick="checkItemAudit(${item.itemId});" >查看意见</a>
													</div>
												</td>
											</tr>
							    		</#if>
									</#list>
								<#else>
									<tr align="center"><td colspan="11"><font color="red" size="4">没有查询到数据！</font></td></tr>
								</#if>
							</tbody>
						</table>
						<#if itemList>
						<#include "commons/page.ftl">
				        </#if>
					</div>
				</div>
			</div>
		</div>
	</div>
</div><!-- /.main-container -->

<form id="lastQueryForm" method="post" name="lastQueryForm" action="${ctx}/itemManagement/listItem?active=${active}">
<input type="hidden" id="oldPageNow" name="pageNow" value="${pageView.pageNow}" />
	<input type="hidden" name="startTimeStr" value="${item.startTimeStr}" />
	<input type="hidden" name="endTimeStr" value="${item.endTimeStr}" />
	<input type="hidden" name="itemStatus" value="${item.itemStatus}" />
	<input type="hidden" name="itemName" value="${item.itemName}" />
	<input type="hidden" name="querySign" value="1" />
</form>
<#include "commons/foot.ftl">

<!-- 编辑弹出框 -->	
<div class="modal fade" id="addModal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"></div>
<div class="modal fade" id="addNoticeModal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"></div>
<div class="modal fade" id="listVideoModal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"></div>
<div class="modal fade" id="itemVideoEditModal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"></div>
<div class="modal fade" id="listNoticeModal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"></div>
<div class="modal fade" id="itemNoticeEditModal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"></div>
<div class="modal fade" id="itemInfoModal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"></div>
<div class="modal fade" id="itemEditModal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"></div>



<script type="text/javascript" src="${ctx}/js/hzcj/item.js?v=${jsv}"></script>
<script type="text/javascript" src="${ctx}/js/hzcj/jquery.validation.js"></script>
<script type="text/javascript" src="${ctx}/js/hzcj/messages_cn.js"></script>


<script type="text/javascript" charset="utf-8" src="/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="/ueditor/ueditor.all.js"></script>
<script type="text/javascript" src="${ctx}/js/plugins/jquery.form/jquery.form.js"></script>



<!--body html end-->
<#include "commons/end.ftl">
<script type="text/javascript" >
	function queryRelationList(param) {
		$('#listVideoModal').html("加载中...").load('${ctx}/itemManagement/goitemVideoList', param,function(res,sta,xhr){
			if(res){//判断是否正常返回了数据--登录拦截,res,sta,xhr
				$("#listVideoModal").modal({
					keyboard:'false',//true是默认可是使用esc退出弹窗，false是不能使用esc退出
					show:'true',// bool值，立即调用show
					backdrop:'static'//static是只在弹窗内点击关闭按钮可以关闭
				});
			}
		});
	}
	function queryItemNoticeList(param) {
		$('#listNoticeModal').html("加载中...").load('${ctx}/itemManagement/goItemNoticList', param,function(res,sta,xhr){
			if(res){//判断是否正常返回了数据--登录拦截,res,sta,xhr
				$("#listNoticeModal").modal({
					keyboard:'false',//true是默认可是使用esc退出弹窗，false是不能使用esc退出
					show:'true',// bool值，立即调用show
					backdrop:'static'//static是只在弹窗内点击关闭按钮可以关闭
				});
			}
		});
	}
	
	
	


	
</script>