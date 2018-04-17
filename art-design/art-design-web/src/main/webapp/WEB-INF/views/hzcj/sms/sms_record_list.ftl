<#assign ctx = request.contextPath>

<#macro times value>
	<#if value == null || value?trim?length == 0>
		<#local result="--" />
	<#else>
		<#local year="${value[0..3]+'-'}" />
		<#local month="${value[4..5]+'-'}" />
		<#local day="${value[6..7]}" />
		<#local hour="${value[8..9]+':'}" />
		<#local minute="${value[10..11]+':'}" />
		<#local second="${value[12..13]}" />
	</#if>
${year+month+day}
<br />
${hour+minute+second}
</#macro>

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
						<form action="${ctx}/sms/record/list" method="POST" id="queryForm">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->
								<div class="col-xs-12">
									<div class="col-sm-3">
										<label>手机号码：</label>
										<input type="text" class="InputName0" name="smsMobile" value="${smsMobile}" placeholder="请输入手机号码" />
									</div>
									<div class="col-sm-3">
										<label>处理状态：</label>
										<select class="chosen-select AceSelect" name="dealStatus" >
											<@option name="sms_deal_status_param" status="1" value="${dealStatus}"/>
										</select>
									</div>
									<div class="col-sm-6">
										<label>发送时间：</label>
										<input id="beginTime" name="beginTime" value="${beginTime?default('')}" class="Wdate WdateInput2" type="text" onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'endTime\')}',dateFmt:'yyyy-MM-dd',isShowClear:true,isShowOthers:false,qsEnabled:false})">
										至
										<input id="endTime" name="endTime" value="${endTime?default('')}" class="Wdate WdateInput2" type="text" onfocus="WdatePicker({minDate:'#F{$dp.$D(\'beginTime\')}',dateFmt:'yyyy-MM-dd',isShowClear:true,isShowOthers:false,qsEnabled:false})">
										<a href="javascript:;" id="queryCommit" class="BtnSouSu default-btn btn-blue">搜 索</a>
									</div>
								</div>

								<div class="col-xs-12 ">
									<table class="table table-striped table-bordered table-hover RtableStriped RtableStropSOS">
										<thead>
										<tr role="row">
											<th class="center">
												<span class="lbl" title="">序号</span>
											</th>
											<th class="center">手机号码</th>
											<th class="center">运营发送时间</th>
											<th class="center">运营接收时间</th>
											<th class="center">平台发送时间</th>
											<th class="center">实际发送时间</th>
											<th class="center">消息编号</th>
											<th class="center">服务号码</th>
											<th class="center">发送状态</th>
											<th class="center">短信类别</th>
											<th class="center">错误代码</th>
											<th class="center">批次号码</th>
											<th class="center">优先级</th>
											<th class="center">处理状态</th>
											<th class="center">消息内容</th>
										</tr>
										</thead>
										<tbody>
										<#if smsRecordListByPage?if_exists>
											<#list smsRecordListByPage as smsRecord>
											<tr>
												<td class="center">
													<div class="aName">${smsRecord_index+1+(pageView.pageNow-1)*pageView.pageSize}</div>
												</td>
												<td class="center">
													<div class="aName">${smsRecord.smsMobile?default("--")}</div>
												</td>
												<td class="center">
													<div class="aName"><@times value="${smsRecord.sendTime}" /></div>
												</td>
												<td class="center">
													<div class="aName"><@times value="${smsRecord.receiveTime}" /></div>
												</td>
												<td class="center">
													<div class="aName"><@times value="${smsRecord.platSendTime}" /></div>
												</td>
												<td class="center">
													<div class="aName"><@times value="${smsRecord.platRealTime}" /></div>
												</td>
												<td class="center">
													<div class="aName">${smsRecord.smsSeqId?default("--")}</div>
												</td>
												<td class="center">
													<div class="aName">${smsRecord.serviceCode?default("--")}</div>
												</td>
												<td class="center">
													<div class="aName">
														<@option name="sms_send_type_param" status="1" type="3" value="${smsRecord.sendStatus}"/>
													</div>
												</td>
												<td class="center">
													<div class="aName">
														<@option name="sms_type_param" status="1" type="3" value="${smsRecord.smsType}"/>
													</div>
												</td>
												<td class="center ">
													<div class="aName">${smsRecord.errorCode?default("--")}</div>
												</td>
												<td class="center ">
													<div class="aName">${smsRecord.batchCode?default("--")}</div>
												</td>
												<td class="center">
													<div class="aName">
														<@option name="sms_priority_type_param" status="1" type="3" value="${smsRecord.smsPriority}" />
													</div>
												</td>
												<td class="center">
													<div class="aName">
														<@option name="sms_deal_status_param" status="1" type="3" value="${smsRecord.dealStatus}"/>
													</div>
												</td>
												<td class="center ">
													<div class="aName">
														<a class="btn btn-primary btn-sm" onclick="querySmsContent('${smsRecord.smsContent}');">查看</a>
													</div>
												</td>
											</tr>
											</#list>
										<#else>
											<tr align="center"><td colspan="15"><font color="red" size="4">没有查询到数据！</font></td></tr>
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
		
<form id="lastQueryForm" method="post" name="lastQueryForm" action="${ctx}/sms/record/list?active=${active}">
 	<input type="hidden" id="oldPageNow" name="pageNow" value="${pageView.pageNow}" />
	<input type="hidden" name="smsMobile" value="${smsMobile}" />
	<input type="hidden" name="dealStatus" value="${dealStatus}" />
	<input type="hidden" name="beginTime" value="${beginTime}" />
	<input type="hidden" name="endTime" value="${endTime}" />
</form>		
<#include "commons/foot.ftl">
<!-- 课程包详情弹层 -->
<div class="modal fade" id="record_content_modal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" style="width: 600px;">
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="bootbox-close-button close" data-dismiss="modal" aria-hidden="true">×</button>
			
			<h4 class="modal-title">&nbsp;新增</h4>
		</div>
		<div class="modal-body">
			<div class="col-xs-12">
				<div class="col-xs-12">
					<div class="col-sm-12">
						<label>消息内容：</label>
						<textarea class="InputName4" readonly="readonly" id="contentModal"></textarea>
					</div>
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<div class="text-center">
				<a href="javascript:;" data-dismiss="modal" class="default-btn btn-orange noBorder marginLR20">关 闭</a>
			</div>
		</div>
	</div>
	</div>
</div>
<script type="text/javascript">
	$(function(){
		//查询
		$("#queryCommit").click(function(){
			if(checkLoginStatus() == false) return;
			$("#pageNow").val(1);
			$("#queryForm").submit();
		});
	});
	function querySmsContent(smsContent) {
		$("#contentModal").html(smsContent);
		$("#record_content_modal").modal({
			keyboard:'false',//true是默认可是使用esc退出弹窗，false是不能使用esc退出
			show:'true',// bool值，立即调用show
			backdrop:'static'//static是只在弹窗内点击关闭按钮可以关闭
		});
	}
	
	//翻页动作
	function queryformPage() {
		$("#lastQueryForm").submit();
	}
</script>
<#include "commons/end.ftl">