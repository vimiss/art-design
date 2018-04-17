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
				
				<ul class="nav nav-list">
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
							<li><a href="${ctx}/index">首页</a></li>
							<li><a href=""></a></li>
							<li></li>
						</ul>
						<!-- /.breadcrumb -->
						<!-- /section:basics/content.searchbox -->
					</div>
					<div class="page-content ">
						<div class="row" style="padding-top: 10px;">
						<form action="${ctx}/account/accountList" method="POST" id="queryForm">
							<div class="col-xs-12">
					
								<!-- PAGE CONTENT BEGINS -->
		                     	<div class="col-xs-12">
		                     	    <div class="col-sm-3">
			                     	    <label style="margin-left: 10px">用户名：</label>
										<input type="text" id="name" name="name" value="${account.name?if_exists?html}" class="InputName1" maxlength="30" placeholder="请输入用户名" />
									</div>
									<div class="col-sm-3">
										<label style="margin-left: 10px">真实姓名：</label>
										<input type="text" id="realName" name="realName" value="${account.realName?if_exists?html}" class="InputName1" maxlength="30" placeholder="请输入真实姓名" />
									</div>
								</div>
								<div class="col-xs-12" style="margin-top:10px;"></div>
								<div class="col-xs-12">
									<div class="col-sm-3">
										<label style="margin-left: 10px">手机号：</label>
										<input type="text" name="mobile" value="${account.mobile?if_exists?html}" class="InputName1" maxlength="30" placeholder="请输入手机号" />
									</div>
									<div class="col-sm-4">
										<label style="margin-left: 10px">身份证号：</label>
										<input type="text" name="idCardNo" value="${account.idCardNo?if_exists?html}" class="InputName1" maxlength="30" placeholder="请输入身份证号" />
										<span id="queryCommit" class="BtnSouSu default-btn btn-blue">搜 索</span>
									</div>
								</div>

								<div class="col-xs-12">
									<span onclick="addEmployeeShow()" class="BtnNormalSu default-btn btn-blue">新增系统用户</span>
									<span onclick="queryAccoChoice()" class="BtnNormalSu default-btn btn-blue">开通App账号</span>
									
									<table class="table table-striped table-bordered table-hover RtableStriped RtableStropSOS">
										<thead>
										<tr role="row">
											<th class="center">
												选择
											</th>
										    <th class="center" >
												序号
											</th>
											<th class="center">
												用户名
											</th>
											<th class="center">手机号</th>
											<th class="center">
												真实姓名
											</th>
											<th class="center" >
												身份证号
											</th>
											<th class="center" >建立时间</th>
											<th class="center">
												操作
											</th>
										</tr>
										</thead>
										<tbody>
										<#if accountList>
											<#list accountList as account>
											<tr>
												<td class="center">
													<div class="aName"><input type="radio" value="${account.id}" name="idRadio" /></div>
												</td>
											   <td class="center">
													<div>
													${account_index+1+(pageView.pageNow-1)*pageView.pageSize}
													</div>
												</td>
												<td class="center">
													<div>
														${account.name?default("--")}
													</div>
												</td>
												<td class="center">
													<div >
						                                ${account.mobile?default("--")}
													</div>
												</td>
												<td class="center">
													<div>
														${account.realName?default("--")}
													</div>
												</td>
												<td class="center">
													<div>
								                       ${account.idCardNo?default("--")}
													</div>
												</td>
												<td class="center">
													<div>
													<@date_sub value='${account.createTime?string("yyyy-MM-dd HH:mm:ss")}' /> 
													</div>
												</td>
												<td class="center">
													<a href="javascript:;" onclick="updateEmployeeShow('${account.id}')" class="btn btn-primary btn-sm"><span>编辑</span></a>
											         <a href="javascript:;" onclick="addRoleShow('${account.id}')" class="btn btn-primary btn-sm"><span>分配角色</span></a> 
											          <#if account.status == "1">
											             <a href="javascript:;" onclick="logoutAccount('${account.id}')" class="btn btn-success btn-sm"><span>注销</span></a>
											          <#else>
											              <a href="javascript:;" onclick="activatesAccount('${account.id}')" class="btn btn-light btn-sm"><span>激活</span></a>
											          </#if>		     
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
							</div><!-- /.col -->
						</form>
						</div><!-- /.row -->
					</div><!-- /.page-content -->
				</div>
			</div><!-- /.main-content -->
		</div><!-- /.main-container -->
		
<form id="lastQueryForm" method="post" name="lastQueryForm" action="${ctx}/account/accountList">
 	<input type="hidden" id="oldPageNow" name="pageNow" value="${pageView.pageNow}" />
	<input type="hidden" name="name" value="${account.name}" />
	<input type="hidden" name="realName" value="${account.realName}" />
	<input type="hidden" name="mobile" value="${account.mobile}" />
	<input type="hidden" name="idCardNo" value="${account.idCardNo}" />
</form>
		
<#include "commons/foot.ftl">
<!-- 新增、编辑用户 -->
<div class="modal fade" id="add_employee_modal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"></div>
<!-- 新增/编辑角色 --> 
<div class="modal fade" id="add_role_modal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"></div>
<!-- 开通app账号 --> 
<div class="modal fade" id="fp_staff_open_app_modal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"></div>
<script type="text/javascript" src="${ctx}/js/hzcj/jquery.validation.js"></script>
<script type="text/javascript"  src="${ctx}/js/hzcj/account.js?v=${jsv}"></script>
<#include "commons/end.ftl">