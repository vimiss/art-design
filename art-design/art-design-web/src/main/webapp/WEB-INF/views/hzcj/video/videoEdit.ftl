<#assign ctx = request.contextPath>
<#include "hzcj/common/option.ftl">
<!-- Modal -->
<div class="modal-dialog modal-lg1" role="document"  style="width:1500px;">
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
			<h4 class="modal-title" id="myModalLabel">编辑</h4>
		</div>
		<div class="modal-body">
		<form role="form" class="form-group" action="${ctx}/recruit/update" method="POST" id="editForm" >
			<input type="hidden" id="videoId" name="videoId" value="${videos.videoId}"/>
		     <input id="wyVid" name="wyVid" value="${videos.wyVid}" type="hidden">
		     	<input type="hidden" name="editVideo" value="${editVideo?if_exists}" />
		     	<input type="hidden" name="oldName" value="${videos.videoTitle}" />
			<div class="container-fluid">
				<div class="row">
					 <div class=" Mylist clearfix">
						<div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>视频名称：</div>
							<div class="pull-left MylistRight">
								<input type="text" class="InputName1" name="videoTitle" id="videoTitle" value="${videos.videoTitle}" maxlength="30"  placeholder="姓名只能为20位以内汉字或字母">
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
						<div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft">视频分类：</div>
							<div class="pull-left MylistRight">
								  <select class="chosen-select AceSelect" name="videoLocalCation" id="videoLocalCation" >
											<@option name="video_category_type_param" status="1"  value="${videos.videoLocalCation}" />
							     </select>
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
						
						<div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"  title="同步到云的简要描述">简要描述：</div>
							<div class="pull-left MylistRight">
								<textarea  class="InputName2" name="videoDesc" id="videoDesc"  maxlength="200"  title="同步到云的简要描述">${videos.videoDesc}</textarea>
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
				<a href="javascript:;" onclick="ajaxUpdateVideo();" class="default-btn btn-orange noBorder marginLR20">保 存</a>
				<a href="javascript:;" data-dismiss="modal" class="default-btn btn-gray marginLR20">取 消</a>
			</div>
		</div>
	</div>
</div>

<style>
input.error { border: 1px solid red; }
.error {
    overflow: hidden;
    padding: 0 8px 0 0;
    position: relative;
    color:red;
}
</style>

	<script src="${ctx}/js/hzcj/video.js?v=${jsv}"></script>

	
	<script type="text/javascript" >
</script>
