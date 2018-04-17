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
						<form action="${ctx}/user/fp/org/list" method="POST" id="queryForm">
								<!-- PAGE CONTENT BEGINS -->
								<div class="col-xs-12">
									<div class="col-sm-3">
										<label>机构全称：</label>
										<input type="text" class="InputName0" name="orgName" value="${orgName}" placeholder="请输入机构全称" />
									</div>
									<div class="col-sm-6">
										<label>合作状态：</label>
										<select class="chosen-select AceSelect" name="orgJoinStatus" >
											<@option name="yes_no_type_param" status="1" value="${orgJoinStatus}"/>
										</select>
										
										<span id="queryCommit" class="BtnSouSu default-btn btn-blue">搜 索</span>
									</div>
								</div>
								
								<div class="col-xs-12">
									<span id="queryAdd" onclick="queryOrgAdd();" class="BtnNormalSu default-btn btn-blue">新 增</span>
									<span id="queryModify" onclick="queryOrgMod();" class="BtnNormalSu default-btn btn-blue">修 改</span>
									<span id="queryDelete" onclick="queryOrgDel();" class="BtnNormalSu default-btn btn-blue">删 除</span>	
									<table class="table table-striped table-bordered table-hover RtableStriped RtableStropSOS">
										<thead>
										<tr role="row">
											<th class="center">选择</th>
											<th class="center" width="5%">
												<span class="lbl" title="">序号</span>
											</th>
											<th class="center">机构代码</th>
											<th class="center">机构简称</th>
											<th class="center">机构全称</th>
											<th class="center">合作状态</th>
											<th class="center">创建时间</th>
											<th class="center">机构地址</th>
										</tr>
										</thead>
										<tbody>
										<#if orgListBy?if_exists>
											<#list orgListBy as orgList>
											<tr>
												<td class="center">
													<div class="aName"><input type="radio" value="${orgList.orgId}" name="orgIdRadio" /></div>
												</td>
												<td class="center">
													<div class="aName">${orgList_index+1+(pageView.pageNow-1)*pageView.pageSize}</div>
												</td>
												<td class="center">
													<div class="aName">${orgList.orgCode?exists?string(orgList.orgCode, "--")}</div>
												</td>
												<td class="center">
													<div class="aName">${orgList.orgShortName?exists?string(orgList.orgShortName, "--")}</div>
												</td>
												<td class="center">
													<div class="aName">${orgList.orgName?exists?string(orgList.orgName, "--")}</div>
												</td>
												<td class="center">
													<div class="aName">
														<@option name="yes_no_type_param" status="1" type="3" value="${orgList.orgJoinStatus}"/>
													</div>
												</td>
												<td class="center">
													<div class="aName">
														<@date_sub value='${(orgList.orgTime?string("yyyy-MM-dd HH:mm:ss"))?default("--")}' />
													</div>
												</td>
												<td class="center">
													<div class="aName">${orgList.orgAddress?exists?string(orgList.orgAddress, "--")}</div>
												</td>
											</tr>
											</#list>
										<#else>
											<tr align="center"><td colspan="8"><font color="red" size="4">没有查询到数据！</font></td></tr>
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
		
<form id="lastQueryForm" method="post" name="lastQueryForm" action="${ctx}/user/fp/org/list?active=${active}">
 	<input type="hidden" id="oldPageNow" name="pageNow" value="${pageView.pageNow}" />
	<input type="hidden" name="orgName" value="${orgName}" />
	<input type="hidden" name="orgJoinStatus" value="${orgJoinStatus}" />
</form>		
<#include "commons/foot.ftl">
<!-- 课程包详情弹层 -->
<div class="modal fade" id="fp_org_add_modal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"></div>
<div class="modal fade" id="fp_org_mod_modal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"></div>
<script type="text/javascript">
	$(function(){
		//查询
		$("#queryCommit").click(function(){
			if(checkLoginStatus() == false) return;
			$("#pageNow").val(1);
			$("#queryForm").submit();
		});
	});
	
	function queryOrgAdd() {
		$('#fp_org_add_modal').html("加载中...").load('${ctx}/user/fp/org/add/page',function(res,sta,xhr){
			if(res){//判断是否正常返回了数据--登录拦截,res,sta,xhr
				$("#fp_org_add_modal").modal({
					keyboard:'false',//true是默认可是使用esc退出弹窗，false是不能使用esc退出
					show:'true',// bool值，立即调用show
					backdrop:'static'//static是只在弹窗内点击关闭按钮可以关闭
				});
			}
		});
	}
	function queryOrgMod() {
		var orgIdRadio = getRadioInput();
		if (!orgIdRadio) {
			Modal.alert({msg:"请选择一条需要操作的数据"});
			return;
		}
		
		$('#fp_org_mod_modal').html("加载中...").load('${ctx}/user/fp/org/mod/page?orgId='+orgIdRadio,function(res,sta,xhr){
			if(res){//判断是否正常返回了数据--登录拦截,res,sta,xhr
				$("#fp_org_mod_modal").modal({
					keyboard:'false',//true是默认可是使用esc退出弹窗，false是不能使用esc退出
					show:'true',// bool值，立即调用show
					backdrop:'static'//static是只在弹窗内点击关闭按钮可以关闭
				});
			}
		});
	}
	function queryOrgDel() {
		var orgIdRadio = getRadioInput();
		if (!orgIdRadio) {
			Modal.alert({msg:"请选择一条需要操作的数据"});
			return;
		}
		
		Modal.confirm({msg:"确认要删除吗？", okCallback:function() {
			$(this).on("hidden.bs.modal", function() {
				$.ajax({
					type: "post",
					dataType: "json",
					data: {"orgId":orgIdRadio},
					url: "${ctx}/user/fp/org/remove",
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
	
	//翻页动作
	function queryformPage() {
		$("#lastQueryForm").submit();
	}
</script>
<#include "commons/end.ftl">