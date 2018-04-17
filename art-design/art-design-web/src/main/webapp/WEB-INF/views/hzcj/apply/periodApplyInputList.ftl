<#assign active_parent_name = "预约管理">
<#assign active_menu_name = "投顾预约管理">
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
						<form action="${ctx}/periodApply/listInputApply" method="POST" id="queryForm">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->
								<div class="col-sm-3">
									<label>投资人姓名：</label>
									<input type="text" name="applyUserName" value="${periodApplyVo.applyUserName?if_exists}" class="InputName0" >
								</div>
								<@shiro.hasRole name="admin">
								<div class="col-sm-3">
									<label>投顾姓名：</label>
									<input type="text" name="applyAdvisorName" value="${periodApplyVo.applyAdvisorName?if_exists}" class="InputName0" >
								</div>
								</@shiro.hasRole> 
								<div class="col-sm-3">
									<label>项目标题：</label>
									<input type="text" name="itemName" value="${periodApplyVo.itemName?if_exists}" class="InputName0" >
								</div>
								<div class="col-sm-3">
									<label>分期标题：</label>
									<input type="text" name="perName" value="${periodApplyVo.perName?if_exists}" class="InputName0" >
								</div>
								</div>
								<div class="col-xs-12" style="margin-top:10px;">
								<div class="col-xs-12">
									<div class="col-sm-5">
											<label>申请时间：</label>
											<input id="apply_start_time" name="applyStartTime" value="${periodApplyVo.applyStartTime}" class="Wdate WdateInput2" type="text" onfocus="var apply_end_time=$dp.$('apply_end_time');WdatePicker({onpicked:function(){apply_end_time.focus();},dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'apply_end_time\')}',isShowClear:true,isShowOthers:false,qsEnabled:false})">
											至
											<input id="apply_end_time" name="applyEndTime" value="${periodApplyVo.applyEndTime}" class="Wdate WdateInput2" type="text" onfocus="WdatePicker({minDate:'#F{$dp.$D(\'apply_start_time\')}',dateFmt:'yyyy-MM-dd',isShowClear:true,isShowOthers:false,qsEnabled:false})">
									</div>
									<div class="col-sm-6">
											<label>预约打款时间：</label>
											<input id="pay_start_time" name="payStartTime" value="${periodApplyVo.payStartTime}" class="Wdate WdateInput2" type="text" onfocus="var pay_end_time=$dp.$('pay_end_time');WdatePicker({onpicked:function(){pay_end_time.focus();},dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'pay_end_time\')}',isShowClear:true,isShowOthers:false,qsEnabled:false})">
											至
											<input id="pay_end_time" name="payEndTime" value="${periodApplyVo.payEndTime}" class="Wdate WdateInput2" type="text" onfocus="WdatePicker({minDate:'#F{$dp.$D(\'pay_start_time\')}',dateFmt:'yyyy-MM-dd',isShowClear:true,isShowOthers:false,qsEnabled:false})">
											<span id="queryCommit" class="BtnSouSu default-btn btn-blue" >搜 索</span>
									</div>
							</div>	
								<div class="col-xs-12 ">
									<span onclick="modifyApply();" class="BtnNormalSu default-btn btn-blue">审 核</span>
									<@shiro.hasRole name="admin">
									<span onclick="removeApply();" class="BtnNormalSu default-btn btn-blue">删 除</span>
									</@shiro.hasRole> 
									<span onclick="goApply();" class="BtnNormalSu default-btn btn-blue">预 约</span>
									<!-- <span onclick="openDealFollow();" class="BtnNormalSu default-btn btn-blue">订单跟踪</span> -->
									
									<table class="table table-striped table-bordered table-hover RtableStriped RtableStropSOS">
										<thead>
										<tr role="row">
											<th class="center" >选择</th>
											<th class="center" width="150px">项目标题</th>
											<th class="center" width="150px">分期标题</th>
											<th class="center" >分期额度</th>
											<th class="center" >剩余额度</th>
											<th class="center" >申请额度</th>
											<th class="center" >投资单元</th>
											<th class="center" >投资期限</th>
											<th class="center" >投资人姓名</th>
											<@shiro.hasRole name="admin">
											<th class="center" >投顾姓名</th>
											<th class="center" >机构简称</th>
											</@shiro.hasRole>
											<th class="center" >申请时间</th>
											<th class="center" >预约打款时间</th>
											<!-- <th class="center" >实际打款时间</th> -->
											<th class="center" >申请状态</th>
										</tr>
										</thead>
										<tbody>
										<#if periodApplyList>
											<#list periodApplyList as periodApply>
											<tr>
												<td class="center">
													<div><input name="applyRadio" type="radio" value="${periodApply.applyId?if_exists}"> </div>
												</td>
												<td class="center">
													<div>
														<a href="#"  style="color: #3eafe0" onclick="openItemInfo(${periodApply.itemId});"  title="查看项目明细 ">
															${periodApply.itemName?if_exists}
														</a>
													</div>
												</td>
												<td class="center">
													<div>
														<a href="#" style="color: #3eafe0" onclick="openPeriodInfo(${periodApply.perId});" title="点击查看分期明细">
															${periodApply.perName?if_exists}
														</a>
													</div>
												</td>
												<td class="center">
													<div><@amount_sub amount="${periodApply.perPlanQuota}" type=2 /></div>
												</td>
												<td class="center">
													<div><@amount_sub amount="${periodApply.perRemainQuota}" type=2 /></div>
												</td>
												<td class="center">
													<div><@amount_sub amount="${periodApply.applyQuota}" type=2 /></div>
												</td>
												<td class="center">
													<div>${periodApply.incUnit}</div>
												</td>
												<td class="center">
													<div>${periodApply.incTermString}</div>
												</td>
												<td class="center">
													<div>${periodApply.applyUserName}</div>
												</td>
												<@shiro.hasRole name="admin">
												<td class="center">
													<div>${periodApply.applyAdvisorName?default("--")}</div>
												</td>
												<td class="center">
													<div>${periodApply.orgShortName?default("--")}</div>
												</td>
												</@shiro.hasRole>
												<td class="center">
													<div><@date_sub value='${periodApply.applyTime?string("yyyy-MM-dd HH:mm:ss")}' /></div>
												</td>
												<td class="center">
													<div><@date_sub value='${periodApply.payTime?string("yyyy-MM-dd HH:mm:ss")}' /></div>
												</td>
												<!-- 
												<td class="center">
													<div>
													<#if periodApply.truePayTime>
														<@date_sub value='${periodApply.truePayTime?string("yyyy-MM-dd HH:mm:ss")}' />
													<#else>
														--
													</#if>
													</div>
												</td>
												 -->
												<td class="center">
													<div><@option name="apply_status_param" status="1" type="3" value="${periodApply.applyStatus}" /></div>
												</td>
											</tr>
											</#list>
										<#else>
											<tr align="center">
												<@shiro.lacksRole name = "admin">
												<td colspan="12"><font color="red" size="4">没有查询到数据！</font></td>
												</@shiro.lacksRole>
												<@shiro.hasRole name = "admin">
												<td colspan="14"><font color="red" size="4">没有查询到数据！</font></td>
												</@shiro.hasRole>
											</tr>
										</#if>
										</tbody>
									</table>
									<input type="hidden" id="pageNow" name="pageNow" value="${pageView.pageNow?if_exists}" />
									<#if periodApplyList>
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

<form id="lastQueryForm" method="post" name="lastQueryForm" action="${ctx}/periodApply/listInputApply">
 	<input type="hidden" id="oldPageNow" name="pageNow" value="${pageView.pageNow}" />
	<input type="hidden" name="applyUserName" value="${periodApplyVo.applyUserName}" />
	<input type="hidden" name="applyAdvisorName" value="${periodApplyVo.applyAdvisorName}" />
	<input type="hidden" name="itemName" value="${periodApplyVo.itemName}" />
	<input type="hidden" name="perName" value="${periodApplyVo.perName}" />
	<input type="hidden" name="payStartTime" value="${periodApplyVo.payStartTime}" />
	<input type="hidden" name="payEndTime" value="${periodApplyVo.payEndTime}" />
	<input type="hidden" name="applyStartTime" value="${periodApplyVo.applyStartTime}" />
	<input type="hidden" name="applyEndTime" value="${periodApplyVo.applyEndTime}" />
</form>

<#include "commons/foot.ftl">
<div class="modal fade" id="applyAuditModal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"></div>
<div class="modal fade" id="choseUnitModal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"></div>
<div class="modal fade" id="chosePeriodModal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"></div>
<div class="modal fade" id="choseUserModal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"></div>
<div class="modal fade" id="user_associate_modal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"></div>
<div class="modal fade" id="applyModal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"></div>
<div class="modal fade" id="dealInfoModal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"></div>
<div class="modal fade" id="periodInfoModal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"></div>
<div class="modal fade" id="itemInfoModal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"></div>
<div class="modal fade" id="applyEditModal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"></div>
<script type="text/javascript" src="${ctx}/js/hzcj/apply.js?v=${jsv}"></script>
<script type="text/javascript" src="${ctx}/js/hzcj/jquery.validation.js"></script>
<script type="text/javascript" src="${ctx}/js/hzcj/messages_cn.js"></script>
<script type="text/javascript">
	function goApplyAudit(){
		var applyId = getApplyRadio();
		if (!applyId) {
			Modal.alert({msg:"请选择一条需要操作的数据"});
			return;
		}
		$('#applyAuditModal').html("加载中...").load(ctx + '/periodApply/token/goApplyAudit?applyId='+applyId,function(){
				$("#applyAuditModal").modal({
					keyboard:'false',//true是默认可是使用esc退出弹窗，false是不能使用esc退出
					show:'true',// bool值，立即调用show
					backdrop:'static'//static是只在弹窗内点击关闭按钮可以关闭
				});
		});
	}
	function getApplyRadio() {
		var applyRadio = $('input:radio[name="applyRadio"]:checked').val();
		return applyRadio;
	}
</script>
<#include "commons/end.ftl">