<!-- 用户属性详情页面 -->
<#assign ctx = request.contextPath>
<#include "hzcj/common/option.ftl">
<div class="modal-dialog" role="document" style="width: 500px;">
	<div class="modal-content">
		
		<div class="modal-header">
			<button type="button" class="bootbox-close-button close" data-dismiss="modal" aria-hidden="true">×</button>
			
			<h4 class="modal-title">&nbsp;理财师详情</h4>
		</div>
		<div class="modal-body">
			<div class="col-xs-12">
				<div class="col-xs-12">
					<div class="col-sm-8">
						<label>机构简称：</label>
						${relationListByUserId.orgShortName?exists?string(relationListByUserId.orgShortName, "--")}
					</div>
				</div>
				<div class="col-xs-12">
					<div class="col-sm-8">
						<label>真实名称：</label>
						${relationListByUserId.fpUsername?exists?string(relationListByUserId.fpUsername, "--")}
					</div>
				</div>
				<div class="col-xs-12">
					<div class="col-sm-8">
						<label>性<span style="margin-right:24px;">&nbsp;</span>别：</label>
						<@option name="gender_type_param" status="1" type="3" value="${relationListByUserId.archGender}" />
					</div>
				</div>
				<div class="col-xs-12">
					<div class="col-sm-8">
						<label>服<span style="margin-right:3px;">&nbsp;</span>务<span style="margin-right:3px;">&nbsp;</span>码：</label>
						${relationListByUserId.archCode?exists?string(relationListByUserId.archCode, "--")}
					</div>
				</div>
				<div class="col-xs-12">
					<div class="col-sm-8">
						<label>手机号码：</label>
						${relationListByUserId.archPhone?exists?string(relationListByUserId.archPhone, "--")}
					</div>
				</div>
				<div class="col-xs-12">
					<div class="col-sm-8">
						<label>从业年限：</label>
						<@option name="archive_period_type_param" status="1" type="3" value="${relationListByUserId.archPeriod}"/>
					</div>
				</div>
				<div class="col-xs-12">
					<div class="col-sm-8">
						<label>所在城市：</label>
						<@city_option province="${relationListByUserId.archProvince}" city="${relationListByUserId.archCity}" join="-" />
					</div>
				</div>
				<div class="col-xs-12">
					<div class="col-sm-8">
						<label>认证状态：</label>
						<@option name="audit_status_param" status="1" type="3" value="${relationListByUserId.userFp}"/>
					</div>
				</div>
				<div class="col-xs-12">
					<div class="col-sm-8">
						<label>注册时间：</label>
						${(relationListByUserId.userTime?string('yyyy-MM-dd'))?default('--')}
					</div>
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<div class="text-center">
				<a href="javascript:;" onclick="submitRelaMod(${relationListByUserId.userId}, ${relationListByUserId.relaUserId});" class="default-btn btn-orange noBorder marginLR20">修 改</a>
				<a href="javascript:;" data-dismiss="modal" class="default-btn btn-gray marginLR20">关 闭</a>
			</div>
		</div>
	</div>
</div>
<script>
	function submitRelaMod(userId, relaUserId) {
		Modal.confirm({msg:"确认要修改吗？", okCallback:function() {
			$(this).on("hidden.bs.modal", function() {
				$("#user_relation_associate_modal").modal("hide");
				$("#user_relation_associate_modal").on("hidden.bs.modal", function() {
					queryRelationList("userId="+userId+"&relaUserId="+relaUserId+"&modType=1");
					$(this).off("hidden.bs.modal");
				});
				
				$(this).off("hidden.bs.modal");
			});
		}});
	}
</script>
