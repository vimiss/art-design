<!-- 关联理财师 -->
<#assign ctx = request.contextPath>
<#include "hzcj/common/option.ftl">

<div class="modal-body">
	<div class="col-xs-12">
		<#if relationListByUserId?exists>
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
				<@option name="archive_period_type_param" status="1" type="3" value="${relationListByUserId.archPeriod}" />
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
		<#else>
		<div class="col-xs-12">
			<div class="col-sm-8">
				<label>您还没有关联投资顾问，现在就去<a onclick="backUserAccoList();" class="colorBlue">关联</a></label>
			</div>
		</div>
		</#if>
	</div>
</div>
