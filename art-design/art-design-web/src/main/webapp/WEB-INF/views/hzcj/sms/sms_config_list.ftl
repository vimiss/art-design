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
						<form action="${ctx}/sms/config/list" method="POST" id="queryForm">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->
								<div class="col-xs-12 ">
									<div class="col-sm-4">
										<label>服务状态：</label>
										<select class="chosen-select AceSelect" name="serialStatus" >
											<@option name="sms_status_param" status="1" value="${serialStatus}"/>
										</select>
										<span id="queryCommit" class="BtnSouSu default-btn btn-blue">搜 索</span>
									</div>
								</div>

								<div class="col-xs-12 ">
									<table class="table table-striped table-bordered table-hover RtableStriped RtableStropSOS">
										<thead>
										<tr role="row">
											<th class="center">序号</th>
											<th class="center">服务商</th>
											<th class="center">序列号</th>
											<th class="center">账号</th>
											<th class="center">密码</th>
											<th class="center">服务地址</th>
											<th class="center">短信头</th>
											<th class="center">服务类型</th>
											<th class="center">服务状态</th>
											<th class="center">可用次数</th>
											<th class="center">服务时间</th>
											<th class="center">推迟时间</th>
										</tr>
										</thead>
										<tbody>
										<#if smsConfigListByPage?exists>
											<#list smsConfigListByPage as smsConfig>
											<tr>
												<td class="center">
													<div class="aName">${smsConfig_index+1+(pageView.pageNow-1)*pageView.pageSize}</div>
												</td>
												<td class="center">
													<div class="aName">
														<a onclick="queryConfigDetail(${smsConfig.configId});">${smsConfig.serialName?default("--")}</a>
													</div>
												</td>
												<td class="center">
													<div class="aName">${smsConfig.serialNo}</div>
												</td>
												<td class="center">
													<div class="aName">${smsConfig.serialKey}</div>
												</td>
												<td class="center">
													<div class="aName">${smsConfig.serialPass}</div>
												</td>
												<td class="center">
													<div class="aName"><@text_sub value="${smsConfig.serialUri}" /></div>
												</td>
												<td class="center">
													<div class="aName">
														<a onclick="querySerialHead(${smsConfig.configId});">${smsConfig.serialHead?default("--")}</a>
													</div>
												</td>
												<td class="center">
													<div class="aName">
														<@option name="sms_serve_type_param" status="1" type="3" value="${smsConfig.serialType}" />
													</div>
												</td>
												<td class="center">
													<div class="aName">
														<a onclick="querySerialStatus(${smsConfig.configId});">
															<@option name="sms_status_param" status="1" type="3" value="${smsConfig.serialStatus}"/>
														</a>
													</div>
												</td>
												<td class="center ">
													<div class="aName">
														<a onclick="querySerialTimes(this, ${smsConfig.configId});" title="点击可刷新可用次数">${smsConfig.serialTimes?default("--")}</a>
													</div>
												</td>
												<td class="center ">
													<div class="aName">
														<a onclick="queryLimitTime(${smsConfig.configId});">
														<@option name="sms_limit_status_param" status="1" type="3" value="${smsConfig.serialLimit}" />
														<#if smsConfig.serialLimit == '1'>
														(${(smsConfig.serialLimitBegin?string('HH:mm:ss'))?default("?")}-${(smsConfig.serialLimitEnd?string('HH:mm:ss'))?default("?")})
														</#if>
														</a>
													</div>
												</td>
												<td class="center ">
													<div class="aName">
														<a onclick="queryDelayTime(${smsConfig.configId});">${smsConfig.serialSendtime?default("--")}</a>
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
								</div>
							</div><!-- /.col -->
						</form>
						</div><!-- /.row -->
					</div><!-- /.page-content -->
				</div>
			</div><!-- /.main-content -->
		</div><!-- /.main-container -->
		
<form id="lastQueryForm" method="post" name="lastQueryForm" action="${ctx}/sms/config/list?active=${active}">
 	<input type="hidden" id="oldPageNow" name="pageNow" value="${pageView.pageNow}" />
	<input type="hidden" name="serialStatus" value="${serialStatus}" />
</form>		
<#include "commons/foot.ftl">
<!-- 课程包详情弹层 -->
<div class="modal fade" id="config_detail_modal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"></div>
<div class="modal fade" id="config_limit_time_modal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"></div>
<div class="modal fade" id="config_serial_status_modal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"></div>
<div class="modal fade" id="config_delay_time_modal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"></div>
<div class="modal fade" id="config_serial_head_modal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"></div>
<script type="text/javascript">
	$(function(){
		//查询
		$("#queryCommit").click(function(){
			if(checkLoginStatus() == false) return;
			$("#pageNow").val(1);
			$("#queryForm").submit();
		});
	});
	function querySerialTimes(obj, configId) {
		$.ajax({
			type: "post",
			dataType: "json",
			data: {"configId": configId},
			url: "${ctx}/sms/config/times",
			success: function(result) {
				if (result.code == "0") {
					$(obj).html(result.value.serialTimes);
				} else {
					Modal.alert({msg:result.msg});
				}
			}
		});
	}	
	function queryConfigDetail(configId) {
		$('#config_detail_modal').html("加载中...").load('${ctx}/sms/config/detail', 'configId='+configId, function(res,sta,xhr){
			if(res){//判断是否正常返回了数据--登录拦截,res,sta,xhr
				$("#config_detail_modal").modal({
					keyboard:'false',//true是默认可是使用esc退出弹窗，false是不能使用esc退出
					show:'true',// bool值，立即调用show
					backdrop:'static'//static是只在弹窗内点击关闭按钮可以关闭
				});
			}
		});
	}
	function queryLimitTime(configId) {
		$('#config_limit_time_modal').html("加载中...").load('${ctx}/sms/config/limit/page', 'configId='+configId, function(res,sta,xhr){
			if(res){//判断是否正常返回了数据--登录拦截,res,sta,xhr
				$("#config_limit_time_modal").modal({
					keyboard:'false',//true是默认可是使用esc退出弹窗，false是不能使用esc退出
					show:'true',// bool值，立即调用show
					backdrop:'static'//static是只在弹窗内点击关闭按钮可以关闭
				});
			}
		});
	}
	function querySerialStatus(configId) {
		$('#config_serial_status_modal').html("加载中...").load('${ctx}/sms/config/status/page', 'configId='+configId, function(res,sta,xhr){
			if(res){//判断是否正常返回了数据--登录拦截,res,sta,xhr
				$("#config_serial_status_modal").modal({
					keyboard:'false',//true是默认可是使用esc退出弹窗，false是不能使用esc退出
					show:'true',// bool值，立即调用show
					backdrop:'static'//static是只在弹窗内点击关闭按钮可以关闭
				});
			}
		});
	}
	function querySerialHead(configId) {
		$('#config_serial_head_modal').html("加载中...").load('${ctx}/sms/config/head/page', 'configId='+configId, function(res,sta,xhr){
			if(res){//判断是否正常返回了数据--登录拦截,res,sta,xhr
				$("#config_serial_head_modal").modal({
					keyboard:'false',//true是默认可是使用esc退出弹窗，false是不能使用esc退出
					show:'true',// bool值，立即调用show
					backdrop:'static'//static是只在弹窗内点击关闭按钮可以关闭
				});
			}
		});
	}
	function queryDelayTime(configId) {
		$('#config_delay_time_modal').html("加载中...").load('${ctx}/sms/config/delay/page', 'configId='+configId, function(res,sta,xhr){
			if(res){//判断是否正常返回了数据--登录拦截,res,sta,xhr
				$("#config_delay_time_modal").modal({
					keyboard:'false',//true是默认可是使用esc退出弹窗，false是不能使用esc退出
					show:'true',// bool值，立即调用show
					backdrop:'static'//static是只在弹窗内点击关闭按钮可以关闭
				});
			}
		});
	}
	
	//翻页动作
	function queryformPage() {
		$("#lastQueryForm").submit();
	}
</script>
<#include "commons/end.ftl">