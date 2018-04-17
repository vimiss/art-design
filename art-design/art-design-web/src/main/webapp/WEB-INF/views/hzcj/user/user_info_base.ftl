<!-- 基础信息 -->
<#assign ctx = request.contextPath>
<#include "hzcj/common/option.ftl">
		
<div class="modal-body">
	<div class="col-xs-12">
		<div class="col-xs-12">
			<div class="col-sm-8 mb10">
				<label>用户头像：</label>
				<#if userInfoBaseById.infoUpId == null>
					<img src="${ctx}/img/pic06.png" width="80px" height="80px" />
				<#else>
					<img src="${ctx}${userInfoBaseById.upAbsoluteUrl}" width="100px" height="100px" />
				</#if>
			</div>
		</div>
		<div class="col-xs-12">
			<div class="col-sm-8 mb10">
				<label>用户姓名：</label>
				<input type="text" class="InputName1" name="attrName" value="${userInfoBaseById.infoUsername?exists?string(userInfoBaseById.infoUsername, '--')}" readonly="readonly" />
			</div>
		</div>
		<div class="col-xs-12">
			<div class="col-sm-8 mb10">
				<label>用户昵称：</label>
				<input type="text" class="InputName1" name="attrCode" value="${userInfoBaseById.infoNickname?exists?string(userInfoBaseById.infoNickname, '--')}" readonly="readonly" />
			</div>
		</div>
		<div class="col-xs-12">
			<div class="col-sm-8 mb10">
				<label>用户性别：</label>
				<select class="chosen-select AceSelect" disabled="disabled">
					<@option name="gender_type_param" status="1" type="5" value="${userInfoBaseById.infoGender}"/>
				</select>
			</div>
		</div>
		<div class="col-xs-12">
			<div class="col-sm-8 mb10">
				<label>用户生日：</label>
				<input type="text" class="InputName1" name="attrValue" value="${(userInfoBaseById.infoBirth?string('yyyy-MM-dd'))?default('--')}" readonly="readonly" />
			</div>
		</div>
	</div>
</div>
