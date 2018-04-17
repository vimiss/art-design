<#assign ctx = request.contextPath>
<#include "hzcj/common/option.ftl">
<!-- Modal -->
<div class="modal-dialog modal-lg1" role="document" style="width:1500px;">
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
			<h4 class="modal-title" id="myModalLabel">上传明细</h4>
		</div>
		<div class="modal-body">
		<form role="form" class="form-group" action="${ctx}/recruit/update" method="POST" id="editForm" >
			<div class="container-fluid">
				<div class="row">
					 <div class=" Mylist clearfix">
					 
						<div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>排序：</div>
							<div class="pull-left MylistRight">
								<input type="text" class="InputName1" value="${uploadFile.upSort}" disabled="disabled">
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
						
						
					<div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>相对路径：</div>
							<div class="pull-left MylistRight">
							  <input type="text" class="InputName1" value="${uploadFile.upRelativeUrl}" disabled="disabled">
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
						
					<div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>全路径：</div>
							<div class="pull-left MylistRight">
							  <input type="text" class="InputName1" value="${uploadFile.upAbsoluteUrl}" disabled="disabled">
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
						
						
						
					<div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>资源类型：</div>
							<div class="pull-left MylistRight">
							  <input type="text" class="InputName1" value="${uploadFile.upType}" disabled="disabled">
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
						
					<div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>所属的主键ID：</div>
							<div class="pull-left MylistRight">
							  <input type="text" class="InputName1" value="${uploadFile.upBelongId}" disabled="disabled">
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
						
					<div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>来源类型：</div>
							<div class="pull-left MylistRight">
							  <input type="text" class="InputName1"   value="${uploadFile.upSourceType}" disabled="disabled">
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
						
						
						<div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>上传时间：</div>
							<div class="pull-left MylistRight">
							  <input type="text" class="InputName1" value="${(uploadFile.upTime?string("yyyy-MM-dd HH:mm:ss"))}"  disabled="disabled">
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
						<div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>上传图片：</div>
							<div class="pull-left MylistRight">
								<img id="uploadInfoPhotoPathMod" src="${ctx}${uploadFile.upRelativeUrl}" onclick="showImg(this);" width="80%" height="40%" />
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
