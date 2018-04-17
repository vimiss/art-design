<!-- 职业档案 -->
<#assign ctx = request.contextPath>
<#include "hzcj/common/option.ftl">
		
<div class="modal-body">
	<div class="col-xs-12">
		<div class="col-xs-12">
			<div class="col-sm-8 mb10">
				<label>档案编码：</label>
				<input type="text" class="InputName1" value="${userFpArchiveById.archId?exists?string(userFpArchiveById.archId, '--')}" readonly="readonly" />
			</div>
		</div>
		<div class="col-xs-12">
			<div class="col-sm-8 mb10">
				<label>性<span style="margin-right:28px;"></span>别：</label>
				<select class="chosen-select AceSelect" disabled="disabled">
					<@option name="gender_type_param" status="1" type="5" value="${userFpArchiveById.archGender}"/>
				</select>
			</div>
		</div>
		<div class="col-xs-12">
			<div class="col-sm-8 mb10">
				<label>年<span style="margin-right:28px;"></span>龄：</label>
				<select class="chosen-select AceSelect" disabled="disabled">
					<@option name="age_type_param" status="1" type="5" value="${userFpArchiveById.archAge}"/>
				</select>
			</div>
		</div>
		<div class="col-xs-12">
			<div class="col-sm-8 mb10">
				<label>籍<span style="margin-right:28px;"></span>贯：</label>
				<input type="text" class="InputName1" value="${userFpArchiveById.archPlace?exists?string(userFpArchiveById.archPlace, '--')}" readonly="readonly" />
			</div>
		</div>
		<div class="col-xs-12">
			<div class="col-sm-8 mb10">
				<label>毕业院校：</label>
				<input type="text" class="InputName1" value="${userFpArchiveById.archSchool?exists?string(userFpArchiveById.archSchool, '--')}" readonly="readonly" />
			</div>
		</div>
		<div class="col-xs-12">
			<div class="col-sm-8 mb10">
				<label>服<span style="margin-right:7px;"></span>务<span style="margin-right:7px;"></span>码：</label>
				<input type="text" class="InputName1" value="${userFpArchiveById.archCode?exists?string(userFpArchiveById.archCode, '--')}" readonly="readonly" />
			</div>
		</div>
		<div class="col-xs-12">
			<div class="col-sm-8 mb10">
				<label>联系电话：</label>
				<input type="text" class="InputName1" value="${userFpArchiveById.archPhone?exists?string(userFpArchiveById.archPhone, '--')}" readonly="readonly" />
			</div>
		</div>
		<div class="col-xs-12">
			<div class="col-sm-8 mb10">
				<label>电子邮件：</label>
				<input type="text" class="InputName1" value="${userFpArchiveById.archEmail?exists?string(userFpArchiveById.archEmail, '--')}" readonly="readonly" />
			</div>
		</div>
		<div class="col-xs-12">
			<div class="col-sm-8 mb10">
				<label>所在城市：</label>
				<input type="text" class="InputName1" value="<@city_option province='${userFpArchiveById.archProvince}' city='${userFpArchiveById.archCity}' join='-' />" readonly="readonly" />
			</div>
		</div>
		<div class="col-xs-12">
			<div class="col-sm-8 mb10">
				<label>公司名称：</label>
				<input type="text" class="InputName1" value="${userFpArchiveById.archCompany?exists?string(userFpArchiveById.archCompany, '--')}" readonly="readonly" />
			</div>
		</div>
		<div class="col-xs-12">
			<div class="col-sm-8 mb10">
				<label>公司地址：</label>
				<input type="text" class="InputName1" value="${userFpArchiveById.archCompanyAddress?exists?string(userFpArchiveById.archCompanyAddress, '--')}" readonly="readonly" />
			</div>
		</div>
		<div class="col-xs-12">
			<div class="col-sm-8 mb10">
				<label>从业年限：</label>
				<select class="chosen-select AceSelect" disabled="disabled">
					<@option name="archive_period_type_param" status="1" type="5" value="${userFpArchiveById.archPeriod}"/>
				</select>
			</div>
		</div>
		<div class="col-xs-12">
			<div class="col-sm-12 mb10">
				<label>职业生涯：</label>
				<textarea class="InputName2" readonly="readonly">${userFpArchiveById.archDesc?exists?string(userFpArchiveById.archDesc, '--')}</textarea>
			</div>
		</div>
		<div class="col-xs-12">
			<div class="col-sm-12 mb10">
				<label>擅长领域：</label>
				<textarea class="InputName2" readonly="readonly">${userFpArchiveById.archAdept?exists?string(userFpArchiveById.archAdept, '--')}</textarea>
			</div>
		</div>
		<div class="col-xs-12">
			<div class="col-sm-12 mb10">
				<label>奖励荣誉：</label>
				<textarea class="InputName2" readonly="readonly">${userFpArchiveById.archHonor?exists?string(userFpArchiveById.archHonor, '--')}</textarea>
			</div>
		</div>
	</div>
</div>
