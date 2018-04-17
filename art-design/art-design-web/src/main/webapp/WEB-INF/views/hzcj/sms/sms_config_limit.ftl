<!-- 数据字典详情页面 -->
<#assign ctx = request.contextPath>
<#include "hzcj/common/option.ftl">
<!-- Modal -->
<div class="modal-dialog" role="document" style="width: 600px;">
	<div class="modal-content">
		
		<div class="modal-header">
			<button type="button" class="bootbox-close-button close" data-dismiss="modal" aria-hidden="true">×</button>
			
			<h4 class="modal-title">&nbsp;修改</h4>
		</div>
		<div class="modal-body">
			<div class="col-xs-12">
				<div class="col-xs-12">
					<div class="col-sm-8">
						<label>服务时间：</label>
						<input type="hidden" id="configId" value="${smsConfigById.configId}" />
						<select class="chosen-select AceSelect" onchange="limitSelected();" id="serialLimit">
							<@option name="sms_limit_status_param" status="1" value="${smsConfigById.serialLimit}" />
						</select>
					</div>
				</div>
				<div style="display:none;" id="limitTimeDiv">
					<div class="col-xs-12">
						<div class="col-sm-12">
							<label>起始时间：</label>
							<input id="serialLimitBegin" value="${(smsConfigById.serialLimitBegin?string('HH:mm:ss'))?default('')}" class="Wdate WdateInput2" type="text" onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'serialLimitEnd\')}',dateFmt:'HH:mm:ss',isShowClear:true,isShowOthers:false,qsEnabled:false})">
						</div>
					</div>
					<div class="col-xs-12">
						<div class="col-sm-12">
							<label>结束时间：</label>
							<input id="serialLimitEnd" value="${(smsConfigById.serialLimitEnd?string('HH:mm:ss'))?default('')}" class="Wdate WdateInput2" type="text" onfocus="WdatePicker({minDate:'#F{$dp.$D(\'serialLimitBegin\')}',dateFmt:'HH:mm:ss',isShowClear:true,isShowOthers:false,qsEnabled:false})">
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<div class="text-center">
				<a href="javascript:;" onclick="submitLimitMod();" class="default-btn btn-orange noBorder marginLR20">保 存</a>
				<a href="javascript:;" data-dismiss="modal" class="default-btn btn-gray marginLR20">取 消</a>
			</div>
		</div>
	</div>
</div>
<script>
	$(function() {
		var serialLimit = "${smsConfigById.serialLimit}";
		if (serialLimit == "1") {
			$("#limitTimeDiv").show();
		} else {
			$("#limitTimeDiv").hide();
		}
	});
	function limitSelected() {
		var serialLimit = $("#serialLimit").val();
		if (serialLimit == "1") {
			$("#limitTimeDiv").show();
		} else {
			$("#limitTimeDiv").hide();
		}
	}
	function submitLimitMod() {
		var configId = $("#configId").val();
		var serialLimit = $("#serialLimit").val();
		var serialLimitBegin = $("#serialLimitBegin").val();
		var serialLimitEnd = $("#serialLimitEnd").val();
		
		if (!serialLimit) {
			Modal.alert({msg:"请选择服务时间"});
			return;
		}
		if (!serialLimitBegin) {
			Modal.alert({msg:"请选择起始时间"});
			return;
		}
		if (!serialLimitEnd) {
			Modal.alert({msg:"请选择结束时间"});
			return;
		}
		
		$.ajax({
			type: "post",
			dataType: "json",
			data: {"configId":configId, "serialLimit":serialLimit, "serialLimitBegin":serialLimitBegin, "serialLimitEnd":serialLimitEnd},
			url: "${ctx}/sms/config/limit",
			success: function(result) {
				if (result.code == "0") {
					Modal.alert({msg:"修改成功", okCallback:function() {
						$("#config_limit_time_modal").modal("hide");
						$("#config_limit_time_modal").on("hidden.bs.modal", function() {
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
</script>
