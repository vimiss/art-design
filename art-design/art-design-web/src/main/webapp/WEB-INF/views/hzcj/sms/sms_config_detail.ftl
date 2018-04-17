<!-- 数据字典详情页面 -->
<#assign ctx = request.contextPath>
<#include "hzcj/common/option.ftl">
<!-- Modal -->
<div class="modal-dialog" role="document" style="width: 600px;">
	<div class="modal-content">
		
		<div class="modal-header">
			<button type="button" class="bootbox-close-button close" data-dismiss="modal" aria-hidden="true">×</button>
			
			<h4 class="modal-title">&nbsp;配置详情</h4>
		</div>
		<div class="modal-body">
			<div class="col-xs-12">
				<div class="col-xs-12">
					<div class="col-sm-8">
						<label>服<span style="margin-right:3px;">&nbsp;</span>务<span style="margin-right:3px;">&nbsp;</span>商：</label>
						${smsConfigById.serialName?exists?string(smsConfigById.serialName, "--")}
					</div>
				</div>
				<div class="col-xs-12">
					<div class="col-sm-8">
						<label>序<span style="margin-right:3px;">&nbsp;</span>列<span style="margin-right:3px;">&nbsp;</span>号：</label>
						${smsConfigById.serialNo?exists?string(smsConfigById.serialNo, "--")}
					</div>
				</div>
				<div class="col-xs-12">
					<div class="col-sm-8">
						<label>账<span style="margin-right:24px;">&nbsp;</span>号：</label>
						${smsConfigById.serialKey?exists?string(smsConfigById.serialKey, "--")}
					</div>
				</div>
				<div class="col-xs-12">
					<div class="col-sm-8">
						<label>密<span style="margin-right:24px;">&nbsp;</span>码：</label>
						${smsConfigById.serialPass?exists?string(smsConfigById.serialPass, "--")}
					</div>
				</div>
				<div class="col-xs-12">
					<div class="col-sm-12">
						<label>服务地址：</label>
						${smsConfigById.serialUri?exists?string(smsConfigById.serialUri, "--")}
					</div>
				</div>
				<div class="col-xs-12">
					<div class="col-sm-8">
						<label>短<span style="margin-right:3px;">&nbsp;</span>信<span style="margin-right:3px;">&nbsp;</span>头：</label>
						${smsConfigById.serialHead?exists?string(smsConfigById.serialHead, "--")}
					</div>
				</div>
				<div class="col-xs-12">
					<div class="col-sm-8">
						<label>服务类型：</label>
						<@option name="sms_serve_type_param" status="1" type="3" value="${smsConfigById.serialType}" />
					</div>
				</div>
				<div class="col-xs-12">
					<div class="col-sm-8">
						<label>服务状态：</label>
						<@option name="sms_status_param" status="1" type="3" value="${smsConfigById.serialStatus}" />
					</div>
				</div>
				<div class="col-xs-12">
					<div class="col-sm-8">
						<label>可用次数：</label>
						${smsConfigById.serialTimes?exists?string(smsConfigById.serialTimes, "--")} 次
					</div>
				</div>
				<div class="col-xs-12">
					<div class="col-sm-8">
						<label>服务时间：</label>
						<@option name="sms_limit_status_param" status="1" type="3" value="${smsConfigById.serialLimit}" />
						<#if smsConfigById.serialLimit == '1'>
						(${(smsConfigById.serialLimitBegin?string('HH:mm:ss'))?default("?")}-${(smsConfigById.serialLimitEnd?string('HH:mm:ss'))?default("?")})
						</#if>
					</div>
				</div>
				<div class="col-xs-12">
					<div class="col-sm-8">
						<label>推迟时间：</label>
						${smsConfigById.serialSendtime?exists?string(smsConfigById.serialSendtime, "--")} 分钟
					</div>
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<div class="text-center">
				<a href="javascript:;" data-dismiss="modal" class="default-btn btn-gray marginLR20">关 闭</a>
			</div>
		</div>
	</div>
</div>
