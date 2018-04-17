<!-- 账户详情 -->
<#assign ctx = request.contextPath>
<#include "hzcj/common/option.ftl">
<#include "hzcj/common/number.ftl">
		
<div class="modal-body">
	<div class="col-xs-12">
		<div class="col-xs-12">
			<div class="col-sm-8 mb10">
				<label>用户编码：</label>
				<input type="text" class="InputName1" value="${userInfoDetailById.userId}" readonly="readonly" />
			</div>
		</div>
		<div class="col-xs-12">
			<div class="col-sm-8 mb10">
				<label>存续资产：</label>
				<input type="text" class="InputName1" value="<@amount_sub amount='${userInfoDetailById.userAsset}' type=2 />" readonly="readonly" />
			</div>
		</div>
		<div class="col-xs-12">
			<div class="col-sm-8 mb10">
				<label>投资资产：</label>
				<input type="text" class="InputName1" value="<@amount_sub amount='${userInfoDetailById.userInvestAsset}' type=2 />" readonly="readonly" />
			</div>
		</div>
		<div class="col-xs-12">
			<div class="col-sm-8 mb10">
				<label>业绩资产：</label>
				<input type="text" class="InputName1" value="<@amount_sub amount='${userInfoDetailById.userPerformanceAsset}' type=2 />" readonly="readonly" />
			</div>
		</div>
		<div class="col-xs-12">
			<div class="col-sm-8 mb10">
				<label>积<span style="margin-right:28px;"></span>分：</label>
				<input type="text" class="InputName1" value="${userInfoDetailById.attrPointValue}" readonly="readonly" />
			</div>
		</div>
		<div class="col-xs-12">
			<div class="col-sm-8 mb10">
				<label>等<span style="margin-right:28px;"></span>级：</label>
				<input type="text" class="InputName1" value="${userInfoDetailById.attrLevelValue}" readonly="readonly" />
			</div>
		</div>
		<div class="col-xs-12">
			<div class="col-sm-8 mb10">
				<label>资产证明：</label>
				<select class="chosen-select AceSelect" disabled="disabled">
					<@option name="audit_status_param" status="1" type="5" value="${userInfoDetailById.userAssetStatus}"/>
				</select>
			</div>
		</div>
		<div class="col-xs-12">
			<div class="col-sm-8 mb10">
				<label>认证状态：</label>
				<select class="chosen-select AceSelect" disabled="disabled">
					<@option name="audit_status_param" status="1" type="5" value="${userInfoDetailById.userFp}"/>
				</select>
			</div>
		</div>
		<div class="col-xs-12">
			<div class="col-sm-8 mb10">
				<label>用户状态：</label>
				<select class="chosen-select AceSelect" disabled="disabled">
					<@option name="account_status_param" status="1" type="5" value="${userInfoDetailById.userStatus}"/>
				</select>
			</div>
		</div>
		<div class="col-xs-12">
			<div class="col-sm-8 mb10">
				<label>风险偏好：</label>
				<select class="chosen-select AceSelect" disabled="disabled">
					<@option name="user_risk_type_param" status="1" type="5" value="${userInfoDetailById.userRisk}"/>
				</select>
			</div>
		</div>
		<div class="col-xs-12">
			<div class="col-sm-8 mb10">
				<label>注册时间：</label>
				<input type="text" class="InputName1" value="${(userInfoDetailById.userTime?string('yyyy-MM-dd HH:mm:ss'))?default('--')}" readonly="readonly" />
			</div>
		</div>
	</div>
</div>
