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
								<!--<a href="#">UI &amp; Elements</a>--></li>
							<li><a href=""></a></li>
							<li></li>
						</ul>
						<!-- /.breadcrumb -->
						<!-- /section:basics/content.searchbox -->
					</div>
					<div class="page-content ">
						<div class="row" style="padding-top: 10px;">
						<div class="col-xs-12">
						<form action="${ctx}/user/fp/staff/list" method="POST" id="queryForm">
								<!-- PAGE CONTENT BEGINS -->
								<div class="col-xs-12">
									<div class="col-sm-3">
										<label>姓<span style="margin-right:28px;"></span>名：</label>
										<input type="text" class="InputName0" name="fpName" value="${fpName}" placeholder="请输入姓名" />
									</div>
									<div class="col-sm-3">
										<label>手机号码：</label>
										<input type="text" class="InputName0" name="fpMobile" value="${fpMobile}" placeholder="请输入手机号码" />
									</div>
								</div>
								<div class="col-xs-12" style="margin-top:10px;"></div>
								<div class="col-xs-12">
									<div class="col-sm-3">
										<label>合作机构：</label>
										<select class="chosen-select AceSelect" name="orgId" >
											<@option name="org_type_param" status="1" method="getOrgAsOption" value="${orgId}"/>
										</select>
									</div>
									<div class="col-sm-4">
										<label>用户状态：</label>
										<select class="chosen-select AceSelect" name="fpStatus" >
											<@option name="account_status_param" status="1" value="${fpStatus}"/>
										</select>
										<span id="queryCommit" class="BtnSouSu default-btn btn-blue">搜 索</span>
									</div>
								</div>
								
								<div class="col-xs-12">
									<span id="queryAdd" onclick="queryStaffAdd();" class="BtnNormalSu default-btn btn-blue">新 增</span>
									<span id="queryModify" onclick="queryStaffMod();" class="BtnNormalSu default-btn btn-blue">修 改</span>
									<span id="queryDelete" onclick="queryStaffDel();" class="BtnNormalSu default-btn btn-blue">删 除</span>
									<span id="registerApp" onclick="registerApp();" class="BtnNormalSu default-btn btn-blue">开通App账号</span>
									<span id="registerAdmin" onclick="registerAdmin();" class="BtnNormalSu default-btn btn-blue">开通后台账号</span>
									<span id="queryFpArchive" onclick="queryFpArchive();" class="BtnNormalSu default-btn btn-blue">职业档案</span>
										
									<table class="table table-striped table-bordered table-hover RtableStriped RtableStropSOS">
										<thead>
										<tr role="row">
											<th class="center">选择</th>
											<th class="center" width="5%">
												<span class="lbl" title="">序号</span>
											</th>
											<th class="center">姓名</th>
											<th class="center">性别</th>
											<th class="center">身份证号</th>
											<th class="center">手机号码</th>
											<th class="center">机构简称</th>
											<th class="center">用户状态</th>
											<th class="center">创建时间</th>
										</tr>
										</thead>
										<tbody>
										<#if staffListBy?if_exists>
											<#list staffListBy as staffList>
											<tr>
												<td class="center">
													<div class="aName"><input type="radio" value="${staffList.fpId}" name="fpIdRadio" <#if staffList.fpStatus != "0">disabled="disabled"</#if> /></div>
												</td>
												<td class="center">
													<div class="aName">${staffList_index+1+(pageView.pageNow-1)*pageView.pageSize}</div>
												</td>
												<td class="center">
													<div class="aName">${staffList.fpName?exists?string(staffList.fpName, "--")}</div>
												</td>
												<td class="center">
													<div class="aName">
														<@option name="gender_type_param" status="1" type="3" value="${staffList.fpGender}"/>
													</div>
												</td>
												<td class="center">
													<div class="aName">${staffList.fpNumber?exists?string(staffList.fpNumber, "--")}</div>
												</td>
												<td class="center">
													<div class="aName">${staffList.fpMobile?exists?string(staffList.fpMobile, "--")}</div>
												</td>
												<td class="center">
													<div class="aName">${staffList.orgShortName?exists?string(staffList.orgShortName, "--")}</div>
												</td>
												<td class="center">
													<div class="aName">
														<@option name="account_status_param" status="1" type="3" value="${staffList.fpStatus}"/>
													</div>
												</td>
												<td class="center">
													<div class="aName">
														<@date_sub value='${(staffList.fpTime?string("yyyy-MM-dd HH:mm:ss"))?default("--")}' />
													</div>
												</td>
											</tr>
											</#list>
										<#else>
											<tr align="center"><td colspan="9"><font color="red" size="4">没有查询到数据！</font></td></tr>
										</#if>
										</tbody>
									</table>
									<input type="hidden" id="pageNow" name="pageNow" value="${pageView.pageNow?if_exists}" />
									<#include "commons/page.ftl">
								</div>
						</form>
						</div><!-- /.col -->
						</div><!-- /.row -->
					</div><!-- /.page-content -->
				</div>
			</div><!-- /.main-content -->
		</div><!-- /.main-container -->
		
<form id="lastQueryForm" method="post" name="lastQueryForm" action="${ctx}/user/fp/staff/list?active=${active}">
 	<input type="hidden" id="oldPageNow" name="pageNow" value="${pageView.pageNow}" />
	<input type="hidden" name="orgId" value="${orgId}" />
	<input type="hidden" name="fpName" value="${fpName}" />
	<input type="hidden" name="fpMobile" value="${fpMobile}" />
	<input type="hidden" name="fpStatus" value="${fpStatus}" />
</form>		
<#include "commons/foot.ftl">
<!-- 课程包详情弹层 -->
<div class="modal fade" id="fp_staff_add_modal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"></div>
<div class="modal fade" id="fp_staff_mod_modal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"></div>
<div class="modal fade" id="fp_staff_open_app_modal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"></div>
<div class="modal fade" id="fp_staff_archive_modal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"></div>

<script type="text/javascript" charset="utf-8" src="${ctx}/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="${ctx}/ueditor/ueditor.all.js"></script>
<script type="text/javascript">
	$(function(){
		//查询
		$("#queryCommit").click(function(){
			if(checkLoginStatus() == false) return;
			$("#pageNow").val(1);
			$("#queryForm").submit();
		});
	});
	
	function queryStaffAdd() {
		$('#fp_staff_add_modal').html("加载中...").load('${ctx}/user/fp/staff/add/page',function(res,sta,xhr){
			if(res){//判断是否正常返回了数据--登录拦截,res,sta,xhr
				$("#fp_staff_add_modal").modal({
					keyboard:'false',//true是默认可是使用esc退出弹窗，false是不能使用esc退出
					show:'true',// bool值，立即调用show
					backdrop:'static'//static是只在弹窗内点击关闭按钮可以关闭
				});
			}
		});
	}
	function queryStaffMod() {
		var staffIdRadio = getRadioInput();
		if (!staffIdRadio) {
			Modal.alert({msg:"请选择一条需要操作的数据"});
			return;
		}
		
		$('#fp_staff_mod_modal').html("加载中...").load('${ctx}/user/fp/staff/mod/page?fpId='+staffIdRadio,function(res,sta,xhr){
			if(res){//判断是否正常返回了数据--登录拦截,res,sta,xhr
				$("#fp_staff_mod_modal").modal({
					keyboard:'false',//true是默认可是使用esc退出弹窗，false是不能使用esc退出
					show:'true',// bool值，立即调用show
					backdrop:'static'//static是只在弹窗内点击关闭按钮可以关闭
				});
			}
		});
	}
	function queryStaffDel() {
		var staffIdRadio = getRadioInput();
		if (!staffIdRadio) {
			Modal.alert({msg:"请选择一条需要操作的数据"});
			return;
		}
		
		Modal.confirm({msg:"确认要删除吗？", okCallback:function() {
			$(this).on("hidden.bs.modal", function() {
				$.ajax({
					type: "post",
					dataType: "json",
					data: {"fpId":staffIdRadio},
					url: "${ctx}/user/fp/staff/remove",
					success: function(result) {
						if (result.code == "0") {
							Modal.alert({msg:"删除成功", okCallback:function() {
								$("#queryCommit").click();
							}});
						} else {
							Modal.alert({msg:result.msg});
						}
					}
				});
				
				$(this).off("hidden.bs.modal");
			});
		}});
	}
	function getRadioInput() {
		var radioInput = $("input:radio:checked").val();
		return radioInput;
	}
	
	function registerApp() {
		var staffIdRadio = getRadioInput();
		if (!staffIdRadio) {
			Modal.alert({msg:"请选择一条需要操作的数据"});
			return;
		}
		
		$('#fp_staff_open_app_modal').html("加载中...").load('${ctx}/user/fp/staff/open/page?fpId='+staffIdRadio, function(res,sta,xhr) {
			if(res){//判断是否正常返回了数据--登录拦截,res,sta,xhr
				$("#fp_staff_open_app_modal").modal({
					keyboard:'false',//true是默认可是使用esc退出弹窗，false是不能使用esc退出
					show:'true',// bool值，立即调用show
					backdrop:'static'//static是只在弹窗内点击关闭按钮可以关闭
				});
			}
		});
	}
	function queryFpArchive() {
		var staffIdRadio = getRadioInput();
		if (!staffIdRadio) {
			Modal.alert({msg:"请选择一条需要操作的数据"});
			return;
		}
		
		$.ajax({
			type: "post",
			dataType: "json",
			data: {"fpId":staffIdRadio},
			url: "${ctx}/user/fp/staff/arch/check",
			success: function(result) {
				if (result.code == "0") {
					$('#fp_staff_archive_modal').html("加载中...").load('${ctx}/user/fp/staff/arch/page?fpId='+staffIdRadio, function(res,sta,xhr) {
						if(res){//判断是否正常返回了数据--登录拦截,res,sta,xhr
							$("#fp_staff_archive_modal").modal({
								keyboard:'false',//true是默认可是使用esc退出弹窗，false是不能使用esc退出
								show:'true',// bool值，立即调用show
								backdrop:'static'//static是只在弹窗内点击关闭按钮可以关闭
							});
						}
					});
				} else {
					Modal.alert({msg:result.msg});
				}
			}
		});
	}
	
	function registerAdmin() {
		var staffIdRadio = getRadioInput();
		if (!staffIdRadio) {
			Modal.alert({msg:"请选择一条需要操作的数据"});
			return;
		}
		
		Modal.confirm({msg:"确认要开通后台账号吗？", okCallback:function() {
			$(this).on("hidden.bs.modal", function() {
				$.ajax({
					type: "post",
					dataType: "json",
					data: {"fpId":staffIdRadio},
					url: "${ctx}/user/fp/admin/open",
					success: function(result) {
						if (result.code == "0") {
							Modal.alert({msg:"开通后台账号成功", okCallback:function() {
								$("#queryCommit").click();
							}});
						} else {
							Modal.alert({msg:result.msg});
						}
					}
				});
				
				$(this).off("hidden.bs.modal");
			});
		}});
	}
	
	//翻页动作
	function queryformPage() {
		$("#lastQueryForm").submit();
	}
</script>
<#include "commons/end.ftl">