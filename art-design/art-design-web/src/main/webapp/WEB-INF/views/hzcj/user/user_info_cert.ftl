<!-- 投资账号 -->
<#assign ctx = request.contextPath>
<#include "hzcj/common/option.ftl">
		
<div class="modal-body">
	<div class="col-xs-12">
		<div class="col-xs-12">
			<div class="col-sm-8 mb10">
				<label>认证编码：</label>
				<input type="text" class="InputName1" name="attrName" value="${userCertifyById.certId?exists?string(userCertifyById.certId, '--')}" readonly="readonly" />
			</div>
		</div>
		<div class="col-xs-12">
			<div class="col-sm-8 mb10">
				<label>用户姓名：</label>
				<input type="text" class="InputName1" name="attrName" value="${userCertifyById.certUsername?exists?string(userCertifyById.certUsername, '--')}" readonly="readonly" />
			</div>
		</div>
		<div class="col-xs-12">
			<div class="col-sm-8 mb10">
				<label>证件类型：</label>
				<select class="chosen-select AceSelect" disabled="disabled">
					<@option name="cert_type_param" status="1" type="5" value="${userCertifyById.certType}"/>
				</select>
			</div>
		</div>
		<div class="col-xs-12">
			<div class="col-sm-8 mb10">
				<label>证件号码：</label>
				<input type="text" class="InputName1" name="attrCode" value="${userCertifyById.certNumber?exists?string(userCertifyById.certNumber, '--')}" readonly="readonly" />
			</div>
		</div>
		<div class="col-xs-12">
			<div class="col-sm-8 mb10">
				<label>创建时间：</label>
				<input type="text" class="InputName1" name="attrValue" value="${(userCertifyById.certTime?string('yyyy-MM-dd'))?default('--')}" readonly="readonly" />
			</div>
		</div>
	</div>
</div>
