<#assign active_parent_name = "视频管理">
<#assign active_menu_name = "视频上传">
<#assign ctx = request.contextPath>
<#include "commons/head.ftl">
<!-- /section:basics/navbar.layout -->
		<div class="main-container" id="main-container">

			<div id="sidebar" class="sidebar  responsive" data-sidebar="true" data-sidebar-scroll="true" data-sidebar-hover="true">
				<script type="text/javascript">
					try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
				</script>
				<div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
					<img src="${ctx}/img/line13.png" style="cursor: pointer">
				</div>
				<ul class="nav nav-list" style="top: 0px;">
					
					<li class="">
						<a href="${ctx}/videoManagement/listvideofromlocal" >
							<i class="menu-icon fa fa-desktop"></i>
							<span class="menu-text">
								视频查询
							</span>
						</a>

						<b class="arrow"></b>
					</li>
					
					<li class="active">
						<a href="${ctx}/videoManagement/addvideo" >
							<i class="menu-icon fa fa-desktop"></i>
							<span class="menu-text">
								视频上传
							</span>
						</a>

						<b class="arrow"></b>
					</li>
					
				</ul><!-- /.nav-list -->


				<!-- /section:basics/sidebar.layout.minimize -->
				<script type="text/javascript">
					try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}
				</script>
			</div>

			<!-- /section:basics/sidebar -->
			<div class="main-content">
				<div class="main-content-inner">
					<!-- 面包屑div -->
					<div class="breadcrumbs" id="breadcrumbs">
						<script type="text/javascript">
							try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
						</script>
						<ul class="breadcrumb">
							<li><span><i class="ace-icon fa  fa-map-marker bigger-130"></i> 当前位置：</span></li>
							<li><a href="${ctx}/index">首页</a>
								<!--<a href="#">UI &amp; Elements</a>--></li>
							<li><a href=""></a></li>
							<li></li>
						</ul>
						<!-- /.breadcrumb -->
						<!-- /section:basics/content.searchbox -->
					</div>
					<div class="page-content ">
						<div class="row" style="padding-top: 10px;">
						
												
			<form id="partner.detail.form" role="form" class="form-horizontal"
						    enctype="multipart/form-data" action="${ctx}/videoManagement/upload"
						    method="post">
						<input id="videoId" name="videoId" value="" type="hidden"/>
						
						   <div id="fileupload" class="panel-body">
							<span class="btn btn-success fileinput-button"> <i
								class="glyphicon glyphicon-plus"></i> <span>上传文件</span>
								 <input type="file" id="uploadFile" name="uploadFile" class="" onchange="preview(this);" />
                             </span>
						    <script type="text/plain" id="uploadVideo" style="display:none"></script>
						    	<input type="hidden" id="res" name="res" value="${res}" />
								<div class="col-xs-12 ">
									<div class="col-sm-4">
											<label>视频原名称：</label>
											<input id="videoTitle" name="videoTitle" value="" disabled="disabled"/>
									</div>
								</div>
								
								<div class="col-xs-12 ">
									<div class="col-sm-4">
											<label>视频格式：</label>
											<input id="videoType" name="videoType" value="" disabled="disabled"/>
									</div>
								</div>
								<div class="col-xs-12 ">
									<div class="col-sm-4">
											<label>视频描述：</label>
											<textarea type="text" id="videoDesc" name="videoDesc" class="InputName2" maxlength="50" onkeydown="this.value=this.value.substring(0, 50)" onkeyup="this.value=this.value.substring(0, 50)" style="width:433px;height:55px;resize: none;" ></textarea>
									</div>
								</div>
								<div class="col-xs-12 ">
									<div class="col-sm-4">
											<label>视频上传名称：</label>
											<input id="videoUpTitle" name="videoUpTitle" value="" disabled="disabled"/>
									</div>
								</div>
								<div class="col-xs-12 ">
									    <div class="form-group">
										     <div class="col-md-offset-3 col-md-8">
										      <button type="button" class="btn btn-primary" id="upLoadToLocal" >添加视频</button>
										     </div>
										    </div>
								</div>
								<div class="col-xs-12 ">
									    <div class="form-group">
										     <div class="col-md-offset-3 col-md-8">
										      <button type="button" class="btn btn-primary" id="uploadToWY" >上传视频</button>
										     </div>
										    </div>
								</div>
						    
						    
						    
						    
						
		 </form>
						
					

		
<#include "commons/foot.ftl">
<#include "commons/showVideos.ftl">
<script type="text/javascript" charset="utf-8" src="/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="/ueditor/ueditor.all.js"></script>
<script type="text/javascript">
$(function(){
	var ue = UE.getEditor('uploadVideo',{
		disabledTableInTable:false,
		allowDivTransToP:false,
		wordCount:false,
		elementPathEnabled:false
	});	
 	ue.addListener("afterupvideo",function(t,arg){
 		
 	});

$("#upLoadToLocal").click(function(){
				var dialog = ue.getDialog('insertvideo');
				dialog.open();
				return ;
				
				
				
				
                var formData = new FormData();
                formData.append("uploadFile", document.getElementById("uploadFile").files[0]);   
            	var videoTitle = $('#videoTitle').val();
            	var videoType = $('#videoType').val();
            	var videoDesc = $('#videoDesc').val();
            	if(videoTitle == ""){
				   Modal.alert({msg:"请选择文件"});
				   return false;
			     } else {
					$.ajax({
		                type: "POST",
		                url:"${ctx}/videoManagement/uploadVideoToLocal",
		                contentType: false,
		                processData: false,
		                data:formData,
		                success: function(data) {
		                if(data.result==4){
		                      Modal.alert({msg:"上传至本地服务失败"});
		                 }else if(data.result==2){
		                      Modal.alert({msg:"非法请求"});
		                 }else if(data.result==5){
		                      Modal.alert({msg:"新增数据失败"});
		                 } else {
		                  $('#videoUpTitle').val(data.fileLocalPath);
		                  $('#videoId').val(data.videoId);
		                   $.ajax({
								type : "POST",
								url : "${ctx}/videoManagement/uploadVideoToDB",
								  dataType: "json",
								data : {"videoType":videoType,"videoTitle":videoTitle,"videoDesc":videoDesc,"videoLocalName":data.fileLocalPath,"videoId":data.videoId},
								success : function(res) {
									 if(res!=1){
									  Modal.alert({msg:"新增视频失败"});
									}else{
									   Modal.alert({msg:"新增视频成功"});
									}
								}
							});
		                 }
		              }
		           });
				 }
      });
      
      
      $("#uploadToWY").click(function(){
	      var fileLocalPath = $('#videoUpTitle').val();
	      var videoId = $('#videoId').val();
	      if(fileLocalPath==""){
	          Modal.alert({msg:"请先添加视频"});
	      }
	      	 $.ajax({
							type : "POST",
							url : "${ctx}/videoManagement/uploadVideoToWY",
							  dataType: "json",
							data : {"videoLocalName":fileLocalPath,"videoId":videoId},
							success : function(data) {
								 if(data.result==200){
								   Modal.alert({msg:"视频上传至网易云成功"});
								}else if(data.result==1111){
								    Modal.alert({msg:"更新数据出错"});
								}else{
								  Modal.alert({msg:"视频上传至网易云失败"});
								}
							}
						});
      });
   
});

function preview(inputFile) {
   var file = inputFile.files[0];
   var name = file.name;
   var type = file.type;
  $("#videoTitle").val(name);
  $("#videoType").val(type);
}
</script>
<#include "commons/end.ftl">