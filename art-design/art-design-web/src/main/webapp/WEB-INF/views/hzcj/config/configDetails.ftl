<#assign ctx = request.contextPath>
<#include "hzcj/common/option.ftl">
<!-- Modal -->
<div class="modal-dialog modal-lg1" role="document">
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
			<h4 class="modal-title" id="myModalLabel">阀值配置明细</h4>
		</div>
		<div class="modal-body">
		<form role="form" class="form-group" action="${ctx}/recruit/update" method="POST" id="editForm" >
			<div class="container-fluid">
				<div class="row">
					 <div class=" Mylist clearfix">
					 
						<div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>阀值名称：</div>
							<div class="pull-left MylistRight">
								<input type="text" class="InputName1"  value="${config.confName}" disabled="disabled">
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
						<div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>阀值类型：</div>
							<div class="pull-left MylistRight">
							    <select class="chosen-select AceSelect"  disabled="disabled">
											<@option name="config_type_param" status="1"  value="${config.confType}" />
										</select>
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
						<div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>阀值最小值：</div>
							<div class="pull-left MylistRight">
								<input type="text" class="InputName1"  value="${config.confMinValue}" disabled="disabled">
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
						<div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>阀值最大值：</div>
							<div class="pull-left MylistRight">
								<input type="text" class="InputName1"  value="${config.confMaxValue}" disabled="disabled">
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
						<div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>阀值排序：</div>
							<div class="pull-left MylistRight">
								<input type="text" class="InputName1"  value="${config.confSort}" disabled="disabled">
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
						<div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>阀值结果：</div>
							<div class="pull-left MylistRight">
								<input type="text" class="InputName1"  value="${config.confResult}" disabled="disabled">
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
						<div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>阀值描述：</div>
							<div class="pull-left MylistRight">
								<input type="text" class="InputName1"  value="${config.confDesc}" disabled="disabled">
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
						<div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>创建时间：</div>
							<div class="pull-left MylistRight">
								<input type="text" class="InputName1"  value="${(config.confTime?string("yyyy-MM-dd HH:mm:ss"))}" disabled="disabled">
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
						<div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>使用状态：</div>
							<div class="pull-left MylistRight">
								<select class="chosen-select AceSelect"  disabled="disabled">
											<@option name="status_param" status="1"   value="${config.confStatus}" />
										</select>
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
						
					</div>
				</div>
			</div>
		</form>
		</div>
		<div class="modal-footer">
			<div class="text-center">
				<a href="javascript:;" data-dismiss="modal" class="default-btn btn-gray marginLR20">关 闭</a>
			</div>
		</div>
	</div>
</div>
