<#assign ctx = request.contextPath>
<#include "hzcj/common/option.ftl">
<!-- Modal -->
<div class="modal-dialog modal-lg1" role="document" style="width:1500px;">
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
			<h4 class="modal-title" id="myModalLabel">阀值明细</h4>
		</div>
		<div class="modal-body">
		<form role="form" class="form-group" action="${ctx}/recruit/update" method="POST" id="editForm" >
			<div class="container-fluid">
				<div class="row">
					 <div class=" Mylist clearfix">
					 
						<div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>阀值名称：</div>
							<div class="pull-left MylistRight">
								<input type="text" class="InputName1" value="${thresHold.thName}" disabled="disabled">
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
						
						
					<div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>阀值类型：</div>
							<div class="pull-left MylistRight">
							  <input type="text" class="InputName1" value="${thresHold.thType}" disabled="disabled">
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
						
					<div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>最小值：</div>
							<div class="pull-left MylistRight">
							  <input type="text" class="InputName1" value="${thresHold.thMinValue}" disabled="disabled">
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
						
						
						
					<div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>最大值：</div>
							<div class="pull-left MylistRight">
							  <input type="text" class="InputName1" value="${thresHold.thMaxValue}" disabled="disabled">
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
						
					<div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>阀值排序：</div>
							<div class="pull-left MylistRight">
							  <input type="text" class="InputName1" value="${thresHold.thSort}" disabled="disabled">
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
						
					<div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>阀值结果：</div>
							<div class="pull-left MylistRight">
							  <input type="text" class="InputName1"   value="${thresHold.thResult}" disabled="disabled">
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
