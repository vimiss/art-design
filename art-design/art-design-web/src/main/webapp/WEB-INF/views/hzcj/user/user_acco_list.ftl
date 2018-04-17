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
						<form action="${ctx}/user/acco/list" method="POST" id="queryForm">
								<!-- PAGE CONTENT BEGINS -->
								<div class="col-xs-12">
									<div class="col-sm-3">
										<label>用户账号：</label>
										<input type="text" class="InputName0" name="accoUsername" value="${accoUsername}" placeholder="请输入用户账号" />
									</div>
									<div class="col-sm-3">
										<label>用户昵称：</label>
										<input type="text" class="InputName0" name="nickName" value="${nickName}" placeholder="请输入用户昵称" />
									</div>
									<div class="col-sm-3">
										<label>认证状态：</label>
										<select class="chosen-select AceSelect" name="userFp">
											<@option name="audit_status_param" status="1" value="${userFp}"/>
										</select>
									</div>
								</div>
								<div class="col-xs-12" style="margin-top:10px;"></div>
								<div class="col-xs-12">
									<div class="col-sm-3">
										<label>资产证明：</label>
										<select class="chosen-select AceSelect" name="userAssetStatus" >
											<@option name="audit_status_param" status="1" value="${userAssetStatus}"/>
										</select>
									</div>
									<div class="col-sm-4">
										<label>账号状态：</label>
										<select class="chosen-select AceSelect" name="userStatus" >
											<@option name="account_status_param" status="1" value="${userStatus}" show="-2"/>
										</select>
										<span id="queryCommit" class="BtnSouSu default-btn btn-blue">搜 索</span>
									</div>
								</div>

								<div class="col-xs-12 ">
									<span id="queryAdd" onclick="queryAccoAdd();" class="BtnNormalSu default-btn btn-blue">新 增</span>
									<!-- <span id="queryModify" onclick="queryAccoMod();" class="BtnNormalSu default-btn btn-blue">修 改</span> -->
									<span id="queryChoice" onclick="queryAccoChoice();" class="BtnNormalSu default-btn btn-blue">选择理财师</span>
									<span id="queryDetail" onclick="queryAccoDetail();" class="BtnNormalSu default-btn btn-blue">查看详情</span>
									<!-- <span id="queryDelete" onclick="queryAccoDel();" class="BtnNormalSu default-btn btn-blue">删 除</span> -->
									
									<table class="table table-striped table-bordered table-hover RtableStriped RtableStropSOS">
										<thead>
										<tr role="row">
											<th class="center">选择</th>
											<th class="center">序号</th>
											<th class="center">用户账号</th>
											<th class="center">用户昵称</th>
											<th class="center">存续资产</th>
											<th class="center">投资资产</th>
											<th class="center">认证状态</th>
											<th class="center">资产证明</th>
											<th class="center">性别</th>
											<th class="center">生日</th>
											<th class="center">所在城市</th>
											<th class="center">注册日期</th>
											<th class="center">账号状态</th>
											<th class="center">当前积分</th>
											<th class="center">当前等级</th>
										</tr>
										</thead>
										<tbody>
										<#if userListBy?if_exists>
											<#list userListBy as userList>
											<tr>
												<td class="center">
													<div class="aName"><input type="radio" value="${userList.userId}" name="userIdRadio" /></div>
												</td>
												<td class="center">
													<div class="aName">${userList_index+1+(pageView.pageNow-1)*pageView.pageSize}</div>
												</td>
												<td class="center">
													<div class="aName">${userList.accoUsername?exists?string(userList.accoUsername, "--")}</div>
												</td>
												<td class="center">
													<div class="aName">${userList.infoNickname?exists?string(userList.infoNickname, "--")}</div>
												</td>
												<td class="center">
													<div class="aName"><@amount_sub amount="${userList.userAsset}" type=2 /></div>
												</td>
												<td class="center">
													<div class="aName"><@amount_sub amount="${userList.userInvestAsset}" type=2 /></div>
												</td>
												<td class="center">
													<div class="aName">
														<@option name="audit_status_param" status="1" type="3" value="${userList.userFp}"/>
													</div>
												</td>
												<td class="center">
													<div class="aName">
														<@option name="audit_status_param" status="1" type="3" value="${userList.userAssetStatus}"/>
													</div>
												</td>
												<td class="center">
													<div class="aName">
														<@option name="gender_type_param" status="1" type="3" value="${userList.infoGender}"/>
													</div>
												</td>
												<td class="center">
													<div class="aName"><@date_sub value='${(userList.infoBirth?string("yyyy-MM-dd"))?default("--")}' /></div>
												</td>
												<td class="center">
													<div class="aName">
														<@city_option province="${userList.infoProvince}" city="${userList.infoCity}" join="-" />
													</div>
												</td>
												<td class="center">
													<div class="aName">
														<@date_sub value='${userList.userTime?string("yyyy-MM-dd HH:mm:ss")}' />
													</div>
												</td>
												<td class="center">
													<div class="aName">
														<#-- <#if userList.userStatus == "0"> -->
														<a onclick="queryUserStatus(${userList.userId});" class="btn btn-primary btn-sm">
															<@option name="account_status_param" status="1" type="3" value="${userList.userStatus}" show="-2" />
														</a>
														<#-- <#else>
															<@option name="account_status_param" status="1" type="3" value="${userList.userStatus}" show="-2" />
														</#if> -->
													</div>
												</td>
												<td class="center">
													<div class="aName">
														<a onclick="queryUserAttrById(${userList.attrPointId});" href="javascript:;" class="btn btn-primary btn-sm">查看</a>
													</div>
												</td>
												<td class="center">
													<div class="aName">
														<a onclick="queryUserAttrById(${userList.attrLevelId});" href="javascript:;" class="btn btn-primary btn-sm">查看</a>
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
						</form>
						</div><!-- /.col -->
						</div><!-- /.row -->
					</div><!-- /.page-content -->
				</div>
			</div><!-- /.main-content -->
		</div><!-- /.main-container -->
		
<form id="lastQueryForm" method="post" name="lastQueryForm" action="${ctx}/user/acco/list?active=${active}">
 	<input type="hidden" id="oldPageNow" name="pageNow" value="${pageView.pageNow}" />
	<input type="hidden" name="nickName" value="${nickName}" />
	<input type="hidden" name="userFp" value="${userFp}" />
	<input type="hidden" name="userAssetStatus" value="${userAssetStatus}" />
	<input type="hidden" name="userStatus" value="${userStatus}" />
</form>		
<#include "commons/foot.ftl">
<!-- 课程包详情弹层 -->
<div class="modal fade" id="user_attr_detail_modal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"></div>
<div class="modal fade" id="user_status_modal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"></div>
<div class="modal fade" id="user_acco_add_modal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"></div>
<div class="modal fade" id="user_relation_associate_modal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"></div>
<div class="modal fade" id="user_relation_list_modal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"></div>
<script type="text/javascript">
	$(function(){
		//查询
		$("#queryCommit").click(function(){
			if(checkLoginStatus() == false) return;
			$("#pageNow").val(1);
			$("#queryForm").submit();
		});
	});
	function queryUserAttrById(attrId) {
		$('#user_attr_detail_modal').html("加载中...").load('${ctx}/user/attr/detail', 'attrId='+attrId, function(res,sta,xhr){
			if(res){//判断是否正常返回了数据--登录拦截,res,sta,xhr
				$("#user_attr_detail_modal").modal({
					keyboard:'false',//true是默认可是使用esc退出弹窗，false是不能使用esc退出
					show:'true',// bool值，立即调用show
					backdrop:'static'//static是只在弹窗内点击关闭按钮可以关闭
				});
			}
		});
	}
	
	function queryUserStatus(userId){
		$('#user_status_modal').html("加载中...").load('${ctx}/user/acco/status/page', 'userId='+userId, function(res,sta,xhr){
			if(res){//判断是否正常返回了数据--登录拦截,res,sta,xhr
				$("#user_status_modal").modal({
					keyboard:'false',//true是默认可是使用esc退出弹窗，false是不能使用esc退出
					show:'true',// bool值，立即调用show
					backdrop:'static'//static是只在弹窗内点击关闭按钮可以关闭
				});
			}
		});
	}
	
	function queryAccoAdd() {
		$('#user_acco_add_modal').html("加载中...").load('${ctx}/user/acco/add/page', function(res,sta,xhr){
			if(res){//判断是否正常返回了数据--登录拦截,res,sta,xhr
				$("#user_acco_add_modal").modal({
					keyboard:'false',//true是默认可是使用esc退出弹窗，false是不能使用esc退出
					show:'true',// bool值，立即调用show
					backdrop:'static'//static是只在弹窗内点击关闭按钮可以关闭
				});
			}
		});
	}
	
	function queryRelationAssociate(param) {
		$('#user_relation_associate_modal').html("加载中...").load('${ctx}/user/relation/associate', param, function(res,sta,xhr){
			if(res){//判断是否正常返回了数据--登录拦截,res,sta,xhr
				$("#user_relation_associate_modal").modal({
					keyboard:'false',//true是默认可是使用esc退出弹窗，false是不能使用esc退出
					show:'true',// bool值，立即调用show
					backdrop:'static'//static是只在弹窗内点击关闭按钮可以关闭
				});
			}
		});
	}
	
	function queryRelationList(param) {
		$('#user_relation_list_modal').html("加载中...").load('${ctx}/user/relation/list', param, function(res,sta,xhr){
			if(res){//判断是否正常返回了数据--登录拦截,res,sta,xhr
				$("#user_relation_list_modal").modal({
					keyboard:'false',//true是默认可是使用esc退出弹窗，false是不能使用esc退出
					show:'true',// bool值，立即调用show
					backdrop:'static'//static是只在弹窗内点击关闭按钮可以关闭
				});
			}
		});
	}
	
	function getRadioInput() {
		var radioInput = $('input:radio[name="userIdRadio"]:checked').val();
		return radioInput;
	}
	
	function queryAccoDetail() {
		var userIdRadio = getRadioInput();
		if (!userIdRadio) {
			Modal.alert({msg:"请选择一条需要操作的数据"});
			return;
		}
		location.href = '${ctx}/user/info?userId='+userIdRadio;
	}
	
	function queryAccoChoice() {
		var userIdRadio = getRadioInput();
		if (!userIdRadio) {
			Modal.alert({msg:"请选择一条需要操作的数据"});
			return;
		}
		$.ajax({
			type: "post",
			dataType: "json",
			data: {"userId":userIdRadio},
			url: "${ctx}/user/relation/check",
			success: function(result) {
				if (result.code == "0") {
					var userRelaObj = result.value.userRelationById;
					if (userRelaObj) {
						queryRelationAssociate("userId=" + userIdRadio + "&relaUserId=" + userRelaObj.relaUserId);
					} else {
						queryRelationList("userId=" + userIdRadio + "&modType=0");
					}
				} else {
					Modal.alert({msg:result.msg});
				}
			}
		});
	}
	//翻页动作
	function queryformPage() {
		$("#lastQueryForm").submit();
	}
</script>
<#include "commons/end.ftl">