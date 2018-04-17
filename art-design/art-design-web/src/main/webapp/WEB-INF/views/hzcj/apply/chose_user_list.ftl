<!-- 用户属性详情页面 -->
<#include "hzcj/common/option.ftl">
<#include "hzcj/common/number.ftl">
<#assign ctx = request.contextPath>
<div class="modal-dialog" role="document" style="width: 1600px;">
	<div class="modal-content">
		
		<div class="modal-header">
			<button type="button" class="bootbox-close-button close" data-dismiss="modal" aria-hidden="true">×</button>
			
			<h4 class="modal-title">&nbsp;选择投资人</h4>
		</div>
		<div class="modal-body">
			<div class="page-content ">
				<div class="row" style="padding-top: 10px;">
				<div class="col-xs-12">
				<form action="${ctx}/periodApply/choseUserList" method="POST" id="queryForm_ajax">
						<!-- PAGE CONTENT BEGINS -->
						<div class="col-xs-12">
						<div class="col-sm-3">
							<label>用户姓名：</label>
							<input type="text" class="InputName0" name="infoUsername" value="${infoUsername}" />
						</div>
						<div class="col-sm-3">
							<label>投资状态：</label>
							<select class="chosen-select AceSelect" name="relaInvestStatus">
								<@option name="invest_status_param" status="1" value="${relaInvestStatus}"/>
							</select>
						</div>
						<div class="col-sm-4">
							<label>用户账号：</label>
							<input type="text" class="InputName0" name="accoUsername" value="${accoUsername}" />
							<a href="javascript:;" id="queryCommit_ajax" class="BtnSouSu default-btn btn-blue">查 询</a>
						</div>
					</div>
						
						<div class="col-xs-12">
							<a href="javascript:;" id="queryAccoChoice" onclick="queryAccoChoice();" class="BtnNormalSu default-btn btn-blue">确认该投资人</a>	
							<table class="table table-striped table-bordered table-hover RtableStriped RtableStropSOS">
								<thead>
								<tr role="row">
									<th class="center">选择</th>
									<th class="center">用户姓名</th>
									<th class="center">用户账号</th>
									<th class="center">用户昵称</th>
									<th class="center">性别</th>
									<th class="center">用户城市</th>
									<th class="center">累计金额</th>
									<th class="center">用户资产</th>
									<th class="center">风险偏好</th>
									<th class="center">生日</th>
									<th class="center">注册日期</th>
									<th class="center">投资状态</th>
									<th class="center">账号状态</th>
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
											<div class="aName">${userList.infoUsername?exists?string(userList.infoUsername, "--")}</div>
										</td>
										<td class="center">
											<div class="aName">${userList.accoUsername?exists?string(userList.accoUsername, "--")}</div>
										</td>
										<td class="center">
											<div class="aName">${userList.infoNickname?exists?string(userList.infoNickname, "--")}</div>
										</td>
										<td class="center">
											<div class="aName">
												<@option name="gender_type_param" status="1" type="3" value="${userList.infoGender}"/>
											</div>
										</td>
										<td class="center">
											<div class="aName"><@city_option province="${userList.infoProvince}" city="${userList.infoCity}" join="-" /></div>
										</td>
										<td class="center">
											<div class="aName"><@amount_sub amount="${userList.applyQuota}" type=2 /></div>
										</td>
										<td class="center">
											<div class="aName"><@amount_sub amount="${userList.userAsset}" type=2 /></div>
										</td>
										<td class="center">
											<div class="aName">
												<@option name="user_risk_type_param" status="1" type="3" value="${userList.userRisk}"/>
											</div>
										</td>
										<td class="center">
											<div class="aName">${(userList.infoBirth?string("yyyy-MM-dd"))?default("--")}</div>
										</td>
										<td class="center">
											<div class="aName"><@date_sub value='${userList.userTime?string("yyyy-MM-dd HH:mm:ss")}' /></div>
										</td>
										<td class="center">
											<div class="aName">
												<@option name="yes_no_type_param" status="1" type="3" value="${userList.relaInvestStatus}"/>
											</div>
										</td>
										<td class="center">
											<div class="aName">
												<@option name="account_status_param" status="1" type="3" value="${userList.userStatus}"/>
											</div>
										</td>
									</tr>
									</#list>
								<#else>
									<tr align="center"><td colspan="13"><font color="red" size="4">没有查询到数据！</font></td></tr>
								</#if>
								</tbody>
							</table>
							<input type="hidden" id="pageNow_ajax" name="pageNow_ajax" value="${pageView_ajax.pageNow?if_exists}" />
							<#if userListBy>
							<#include "hzcj/common/page_ajax.ftl">
							</#if>
						</div>
				</form>
				</div><!-- /.col -->
				</div><!-- /.row -->
			</div><!-- /.page-content -->
		</div>
		<div class="modal-footer">
			<div class="text-center">
				<a href="javascript:;" data-dismiss="modal" class="default-btn btn-gray noBorder marginLR20">关 闭</a>
			</div>
		</div>
	</div>
</div>
<script>
	$(function(){
		//查询
		$("#queryCommit_ajax").click(function(){
			if(checkLoginStatus() == false) return;
			$("#pageNow_ajax").val(1);
			$("#choseUserModal").modal("hide");
			$("#choseUserModal").on("hidden.bs.modal", function() {
				choseUserList($("#queryForm_ajax").serialize());
				$(this).off("hidden.bs.modal");
			});
		});
	});
	function queryAccoChoice() {
		var userIdRadio = $('input:radio[name="userIdRadio"]:checked').val();
		if (!userIdRadio) {
			Modal.alert({msg:"请选择一条需要操作的数据"});
			return;
		}
		$.ajax({
			type: "post",
			dataType: "json",
			data: {"userId":userIdRadio},
			url: "${ctx}/periodApply/relation/check",
			success: function(result) {
				if (result.code == "0") {
					var userRelaObj = result.value.userRelationById;
					if (userRelaObj) {
						queryRelationAssociate("userId=" + userIdRadio + "&relaUserId=" + userRelaObj.relaUserId);
					} else {
						Modal.alert({msg:"该用户没有理财师，请先去选择理财师"});
					}
				} else {
					Modal.alert({msg:result.msg});
				}
			}
		});
	}
	function queryRelationAssociate(param) {
		$('#user_associate_modal').html("加载中...").load('${ctx}/periodApply/relation/associate', param, function(res,sta,xhr){
			if(res){//判断是否正常返回了数据--登录拦截,res,sta,xhr
				$("#user_associate_modal").modal({
					keyboard:'false',//true是默认可是使用esc退出弹窗，false是不能使用esc退出
					show:'true',// bool值，立即调用show
					backdrop:'static'//static是只在弹窗内点击关闭按钮可以关闭
				});
			}
		});
	}
	//翻页动作
	function queryformPage_ajax() {
		$("#choseUserModal").modal("hide");
		$("#choseUserModal").on("hidden.bs.modal", function() {
			choseUserList($("#queryForm_ajax").serialize());
			$(this).off("hidden.bs.modal");
		});
	}
</script>
