<!-- 用户新增页面 -->
<#assign ctx = request.contextPath>
<#include "hzcj/common/option.ftl">
<!-- Modal -->
<div class="modal-dialog" role="document" style="width: 600px;">
	<div class="modal-content">
		
		<div class="modal-header">
			<button type="button" class="bootbox-close-button close" data-dismiss="modal" aria-hidden="true">×</button>
			
			<h4 class="modal-title">&nbsp;新增</h4>
		</div>
		<div class="modal-body">
			<div class="col-xs-12">
				<div class="col-xs-12 mb10">
					<div class="col-sm-12">
						<label>任务名称：</label>
						<input type="text" class="InputName1" id="taskName" placeholder="请输入任务名称" />
					</div>
				</div>
				<div class="col-xs-12">
					<div class="col-sm-12 mb10">
						<label>任务标题：</label>
						<input type="text" class="InputName1" id="taskTitle" placeholder="请输入任务标题" />
					</div>
				</div>
				<div class="col-xs-12">
					<div class="col-sm-12 mb10">
						<label>任务描述：</label>
						<textarea class="InputName2" id="taskDesc"></textarea>
					</div>
				</div>
				<div class="col-xs-12">
					<div class="col-sm-12 mb10">
						<label>最小分值：</label>
						<input type="text" class="InputName1" id="taskMinValue" placeholder="请输入最小分值" />
					</div>
				</div>
				<div class="col-xs-12">
					<div class="col-sm-12 mb10">
						<label>最大分值：</label>
						<input type="text" class="InputName1" id="taskMaxValue" placeholder="请输入最大分值" />
					</div>
				</div>
				<div class="col-xs-12">
					<div class="col-sm-12 mb10">
						<label>条件类型：</label>
						 <select class="chosen-select AceSelect" id="conditionType" onchange="getConditionType();">
							<@option name="condition_type_param" status="1" type="2" />
						</select>
					</div>
				</div>
				<div class="col-xs-12">
					<div class="col-sm-12 mb10">
						<label>条件数值：</label>
						<input type="text" class="InputName1" id="conditionValue" placeholder="请输入条件数值" />
					</div>
				</div>
				<div class="col-xs-12">
					<div class="col-sm-12 mb10">
						<label>完成次数：</label>
						<input type="text" class="InputName1" id="taskFinishTime" value="1" placeholder="请输入完成次数" />
					</div>
				</div>
				<div class="col-xs-12">
					<div class="col-sm-12 mb10">
						<label>任务类型：</label>
						 <select class="chosen-select AceSelect" id="taskType">
							<@option name="task_type_param" status="1" type="2" />
						</select>
					</div>
				</div>
				<div class="col-xs-12">
					<div class="col-sm-12 mb10">
						<label>任务状态：</label>
						 <select class="chosen-select AceSelect" id="taskStatus">
							<@option name="status_param" status="1" type="2" />
						</select>
					</div>
				</div>
				<div class="col-xs-12">
					<div class="col-sm-12 mb10">
						<label>前台显示：</label>
						 <select class="chosen-select AceSelect" id="taskShowStatus">
							<@option name="yes_no_type_param" status="1" type="2" />
						</select>
					</div>
				</div>
				<div class="col-xs-12">
					<div class="col-sm-12 mb10">
						<label>关联页面：</label>
						<input type="text" class="InputName1" style="width:84%;" id="taskUrl" placeholder="请输入关联页面" />
					</div>
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<div class="text-center">
				<a type="button" onclick="submitTaskAdd();" class="default-btn btn-orange marginLR20">保 存</a>
				<a type="button" data-dismiss="modal" class="default-btn btn-gray marginLR20">取 消</a>
			</div>
		</div>
	</div>
</div>
<script>
	function getConditionType() {
		var conditionType = $("#conditionType").val();
		if (conditionType == "0") {
			$("#conditionValue").val("0");
			$("#conditionValue").attr("readonly", "readonly");
		} else {
			$("#conditionValue").val("");
			$("#conditionValue").removeAttr("readonly");
		}
	}
	function submitTaskAdd() {
		var taskName = $("#taskName").val();
		var taskTitle = $("#taskTitle").val();
		var taskDesc = $("#taskDesc").val();
		var taskMinValue = $("#taskMinValue").val();
		var taskMaxValue = $("#taskMaxValue").val();
		var conditionType = $("#conditionType").val();
		var conditionValue = $("#conditionValue").val();
		var taskFinishTime = $("#taskFinishTime").val();
		var taskType = $("#taskType").val();
		var taskStatus = $("#taskStatus").val();
		var taskShowStatus = $("#taskShowStatus").val();
		var taskUrl = $("#taskUrl").val();
		
		if (!taskName) {
			Modal.alert({msg:"请输入任务名称"});
			return;
		}
		if (!taskTitle) {
			Modal.alert({msg:"请输入任务标题"});
			return;
		}
		if (!taskDesc) {
			Modal.alert({msg:"请输入任务描述"});
			return;
		}
		if (!taskMinValue) {
			Modal.alert({msg:"请输入最小分值"});
			return;
		}
		if (!taskMaxValue) {
			Modal.alert({msg:"请输入最大分值"});
			return;
		}
		var taskMinValueInt = parseInt(taskMinValue);
		var taskMaxValueInt = parseInt(taskMaxValue);
		if (taskMinValueInt > taskMaxValueInt) {
			Modal.alert({msg:"最小分值必须小于等于最大分值"});
			return;
		}
		
		if (!conditionType) {
			Modal.alert({msg:"请选择条件类型"});
			return;
		}
		if (!conditionValue) {
			Modal.alert({msg:"请输入条件数值"});
			return;
		}
		if (!taskFinishTime) {
			Modal.alert({msg:"请输入完成次数"});
			return;
		}
		if (!taskType) {
			Modal.alert({msg:"请选择任务类型"});
			return;
		}
		if (!taskStatus) {
			Modal.alert({msg:"请选择任务状态"});
			return;
		}
		if (!taskShowStatus) {
			Modal.alert({msg:"请选择是否前台显示"});
			return;
		}
		
		var dataVar = {
			"taskName":taskName, "taskTitle":taskTitle, "taskDesc":taskDesc, "taskMinValue":taskMinValue, 
			"taskMaxValue":taskMaxValue, "conditionType":conditionType, "conditionValue":conditionValue, 
			"taskFinishTime":taskFinishTime, "taskType":taskType, "taskStatus":taskStatus, "taskUrl":taskUrl, "taskShowStatus":taskShowStatus
		};
		
		$.ajax({
			type:"post",
			dataType:"json",
			data:dataVar,
			url:"${ctx}/task/add",
			success:function(result) {
				if (result.code == "0") {
					Modal.alert({msg:"新增成功", okCallback:function() {
						$("#task_add_modal").modal("hide");
						$("#task_add_modal").on("hidden.bs.modal", function() {
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
