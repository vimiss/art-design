<!-- 用户属性详情页面 -->
<#include "hzcj/common/option.ftl">
<#assign ctx = request.contextPath>
<div class="modal-dialog" role="document" style="width: 1600px;">
	<div class="modal-content">
		
		<div class="modal-header">
			<button type="button" class="bootbox-close-button close" data-dismiss="modal" aria-hidden="true">×</button>
			
			<h4 class="modal-title">&nbsp;理财师详情</h4>
		</div>
		<div class="modal-body">
			<div class="page-content ">
				<div class="row" style="padding-top: 10px;">
				<div class="col-xs-12">
				<form action="${ctx}/user/relation/list" method="POST" id="queryForm_ajax">
						<!-- PAGE CONTENT BEGINS -->
						<div class="col-xs-12">
							<div class="col-sm-3">
								<label>用户名称：</label>
								<input type="text" class="InputName0" name="fpUsername" value="${fpUsername}" placeholder="请输入用户名称" />
								<input type="hidden" id="userId" name="userId" value="${userId}" />
								<input type="hidden" id="relaUserId" name="relaUserId" value="${relaUserId}" />
								<input type="hidden" id="modType" name="modType" value="${modType}" />
							</div>
							<div class="col-sm-3">
								<label>手机号码：</label>
								<input type="text" class="InputName0" name="fpMobile" value="${fpMobile}" placeholder="请输入手机号码" />
							</div>
							<div class="col-sm-3">
								<label>服<span style="margin-right:7px;"></span>务<span style="margin-right:7px;"></span>码：</label>
								<input type="text" class="InputName0" name="archCode" value="${archCode}" placeholder="请输入服务码" />
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
							<div class="col-sm-6">
								<label>所在城市：</label>
								<select class="chosen-select AceSelect" name="archProvince" id="archProvinceId" onchange="pcChange(this);">
									<@option name="province_type_param" status="1" method="getProvinceAsOption" value="${archProvince}"/>
								</select>
								<select class="chosen-select AceSelect" name="archCity" id="archCityId">
									<@option name="city_type_param" status="1" value="${archCity}"/>
								</select>
								<a href="javascript:;" id="queryCommit_ajax" class="BtnSouSu default-btn btn-blue">查 询</a>
							</div>
						</div>
						
						<div class="col-xs-12">
							<a href="javascript:;" id="queryAddRelation" onclick="queryAddRelation('${modType}');" class="BtnNormalSu default-btn btn-blue">关 联</a>	
							<table class="table table-striped table-bordered table-hover RtableStriped RtableStropSOS">
								<thead>
								<tr role="row">
									<th class="center">选择</th>
									<th class="center" width="5%">
										<span class="lbl" title="">序号</span>
									</th>
									<th class="center">机构简称</th>
									<th class="center">用户名称</th>
									<th class="center">性别</th>
									<th class="center">手机号码</th>
									<th class="center">服务码</th>
									<th class="center">从业年限</th>
									<th class="center">所在城市</th>
									<th class="center">认证状态</th>
									<th class="center">注册时间</th>
								</tr>
								</thead>
								<tbody>
								<#if relationListBy?if_exists>
									<#list relationListBy as relationList>
									<tr>
										<td class="center">
											<div class="aName"><input type="radio" value="${relationList.userId}" name="userIdRelationRadio" /></div>
										</td>
										<td class="center">
											<div class="aName">${relationList_index+1+(pageView_ajax.pageNow-1)*pageView_ajax.pageSize}</div>
										</td>
										<td class="center">
											<div class="aName">${relationList.orgShortName?exists?string(relationList.orgShortName, "--")}</div>
										</td>
										<td class="center">
											<div class="aName">${relationList.fpUsername?exists?string(relationList.fpUsername, "--")}</div>
										</td>
										<td class="center">
											<div class="aName">
												<@option name="gender_type_param" status="1" type="3" value="${relationList.archGender}"/>
											</div>
										</td>
										<td class="center">
											<div class="aName">${relationList.archPhone?exists?string(relationList.archPhone, "--")}</div>
										</td>
										<td class="center">
											<div class="aName">${relationList.archCode?exists?string(relationList.archCode, "--")}</div>
										</td>
										<td class="center">
											<div class="aName">${relationList.archPeriod?exists?string(relationList.archPeriod, "--")}</div>
										</td>
										<td class="center">
											<div class="aName">
												<@city_option province="${relationList.archProvince}" city="${relationList.archCity}" join="-" />
											</div>
										</td>
										<td class="center">
											<div class="aName">
												<@option name="audit_status_param" status="1" type="3" value="${relationList.userFp}"/>
											</div>
										</td>
										<td class="center">
											<div class="aName">
												<@date_sub value='${(relationList.userTime?string("yyyy-MM-dd"))?default("--")}' />
											</div>
										</td>
									</tr>
									</#list>
								<#else>
									<tr align="center"><td colspan="11"><font color="red" size="4">没有查询到数据！</font></td></tr>
								</#if>
								</tbody>
							</table>
							<input type="hidden" id="pageNow_ajax" name="pageNow_ajax" value="${pageView_ajax.pageNow?if_exists}" />
							<#include "hzcj/common/page_ajax.ftl">
						</div>
				</form>
				</div><!-- /.col -->
				</div><!-- /.row -->
			</div><!-- /.page-content -->
		</div>
		<div class="modal-footer">
			<div class="text-center">
				<a href="javascript:;" data-dismiss="modal" class="default-btn btn-orange noBorder marginLR20">关 闭</a>
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
			$("#user_relation_list_modal").modal("hide");
			$("#user_relation_list_modal").on("hidden.bs.modal", function() {
				queryRelationList($("#queryForm_ajax").serialize());
				$(this).off("hidden.bs.modal");
			});
		});
	});
	
	function pcChange(obj) {
		var provinceVar = $(obj).val();
		provinceCitySelect(provinceVar, "archCityId");
	}
	
	function queryAddRelation(modType) {
		var radioInput = $('input:radio[name="userIdRelationRadio"]:checked').val();
		if (radioInput) {
			if (modType == "0") {
				addRelation(radioInput);
			} else if (modType == "1") {
				modRelation(radioInput);
			} else {
				Modal.alert({msg:"未知关联类型"});
			}
		} else {
			Modal.alert({msg:"请选择一条需要操作的数据"});
		}
	}
	function addRelation(radioInput) {
		var userIdVar = $("#userId").val();
		var relationUserIdVar = radioInput;
		$.ajax({
			type: "post",
			dataType: "json",
			data: {"userId": userIdVar, "relationUserId": relationUserIdVar},
			url: "${ctx}/user/relation/add",
			success: function(result) {
				if (result.code == "0") {
					Modal.alert({msg:"新增关联成功", okCallback:function() {
						$("#user_relation_list_modal").modal("hide");
						$("#user_relation_list_modal").on("hidden.bs.modal", function() {
							$("#queryCommit").click();
							$(this).off("hidden.bs.modal");
						});
					}});
				} else {
					Modal.alert({msg:result.msg});
				}
			}
		});
	}
	function modRelation(radioInput) {
		var userIdVar = $("#userId").val();
		var relationUserIdVar = radioInput;
		var oldRelaUserIdVar = "${relaUserId}";
		$.ajax({
			type: "post",
			dataType: "json",
			data: {"userId": userIdVar, "relationUserId": relationUserIdVar, "oldRelationUserId":oldRelaUserIdVar},
			url: "${ctx}/user/relation/mod",
			success: function(result) {
				if (result.code == "0") {
					Modal.alert({msg:"修改关联成功", okCallback:function() {
						$("#user_relation_list_modal").modal("hide");
						$("#user_relation_list_modal").on("hidden.bs.modal", function() {
							$("#queryCommit").click();
							$(this).off("hidden.bs.modal");
						});
					}});
				} else {
					Modal.alert({msg:result.msg});
				}
			}
		});
	}
	//翻页动作
	function queryformPage_ajax() {
		$("#user_relation_list_modal").modal("hide");
		$("#user_relation_list_modal").on("hidden.bs.modal", function() {
			queryRelationList($("#queryForm_ajax").serialize());
			$(this).off("hidden.bs.modal");
		});
	}
</script>
