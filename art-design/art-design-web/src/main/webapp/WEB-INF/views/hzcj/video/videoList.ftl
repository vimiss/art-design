<#assign active_parent_name = "视频管理">
<#assign active_menu_name = "视频上传记录">
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
			<#include "commons/menu.ftl">
		</ul><!-- /.nav-list -->
		<!-- /section:basics/sidebar.layout.minimize -->
		<script type="text/javascript">
			try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}
		</script>
	</div>
	<!-- /section:basics/sidebar -->
	
	<div class="main-content">
		<div class="main-content-inner">
			<div class="breadcrumbs" id="breadcrumbs">
				<script type="text/javascript">
								try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
							</script>
				<ul class="breadcrumb">
					<li><span><i class="ace-icon fa  fa-map-marker bigger-130"></i> 当前位置：</span></li>
					<li><a href="${ctx}/index">首页</a></li>
					<li><a href=""></a></li>
					<li></li>
				</ul>
			</div>
			<div class="page-content ">
				<div class="row" style="padding-top: 10px;">
				 	 <div class="col-xs-12">
					  <form action="${ctx}/videoManagement/listvideofromlocal?active=${active}" method="POST" id="queryForm">
					  		<input type="hidden" name="querySign" value="1" />
					  		<input type="hidden" name="videoIdWY" id="videoIdWY" value="" />
					  		<input type="hidden" name="retxtpath" id="retxtpath" value="" />
						   <input id="pageNow" name="pageNow" type="hidden" value="${pageView.pageNow}" />
						   	 <div class="row" style="padding-top: 10px;">
				 		   		<div class="col-xs-12">
							
							<div class="col-sm-3">
									<label>视频名称：</label>
							      <input type="text" class="InputName0" name="videoTitle" value="${videosVo.videoTitle}" placeholder="请输入视频名称" />
							</div>
							 
							<div class="col-sm-3">
									<label>视频分类：</label>
							       <select class="chosen-select AceSelect" name="videoLocalCation" id="videoLocalCation">
									<@option name="video_category_type_param" status="1" value="${videosVo.videoLocalCation}"/>
								</select>
							</div>
							 
							 
								     <div class="col-sm-6">
										<label>上传日期：</label>
										<input id="start_time" name="startTime" value="${videosVo.startTime}" class="Wdate WdateInput2" type="text" onfocus="var end_time=$dp.$('end_time');WdatePicker({onpicked:function(){end_time.focus();},dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'end_time\')}',isShowClear:true,isShowOthers:false,qsEnabled:false})">
										至
										<input id="end_time" name="endTime" value="${videosVo.endTime}" class="Wdate WdateInput2" type="text" onfocus="WdatePicker({minDate:'#F{$dp.$D(\'start_time\')}',dateFmt:'yyyy-MM-dd',isShowClear:true,isShowOthers:false,qsEnabled:false})">
										
									   <span class="BtnSouSu default-btn btn-blue" id="queryCommit">搜 索</a>
									 </div>										
									
									 
									 
									<!-- <div class="col-sm-2">
									     <div class="col-md-offset-3 col-md-8">
										      <button type="button" class="btn btn-primary" id="upLoadToLocal" >添加视频</button>
										      <a type="hidden" id="but" onclick="getProcess();"></a>
										   </div>
									    <script type="text/plain" id="uploadVideo" style="display:none"></script>
									 </div>
									 
									 <div class="col-sm-2">
									     <div class="col-md-offset-3 col-md-8">
									     	<label>上传进度：</label>
										      <input type="input" name="retxtpathPro" id="retxtpathPro" value="" disabled="disabled"/>
										   </div>
									 </div>-->
									 
							 	</div>
							 </div>
						</form>
  				 	 </div>
				</div>
					<div class="col-xs-12">
					
					 <span onclick="goUpdate();" class="BtnNormalSu default-btn btn-blue">修 改</span>
					   <!-- <span onclick="ajaxDelVideo();" class="BtnSouSu default-btn btn-blue">删 除</span>-->
					
					
						<table class="table table-striped table-bordered table-hover RtableStriped RtableStropSOS" >
							<thead>
								<tr role="row">
									<th class="center">选择</th>
									<th class="center">
										视频名称
									</th>
									<th class="center">云ID</th>
									<th class="center">视频分类</th>
									<th class="center">占用空间</th>
									<th class="center">时长</th>
									<th class="center">发布状态</th>
									<th class="center">创建时间</th>
									<th class="center">视频描述</th>
									<th class="center">操作</th>
								</tr>
							</thead>
							
							<tbody>
								<#if videoList>
				            		<#list videoList as videosVo>
				            			<#if videosVo>
											<tr>
											<td class="center">
													<div class="aName"><input name="chkItem" type="radio" value="${videosVo.videoId?if_exists}">  </div>
											</td>
												<td class="center">
													<div class="aName">${videosVo.videoTitle?if_exists}</div>
												</td>
												<td class="center">
													<div class="aName">${videosVo.wyVid?if_exists}</div>
												</td>
												<td class="center">
													<div class="aName">
													<#if videosVo.videoLocalCation == null || videosVo.videoLocalCation == "">
													--
													<#else>
													<@option name="video_category_type_param"   status="1" type="3" value="${videosVo.videoLocalCation}"/>
													</#if>
													</div>
												</td>
												<td class="center">
													<div class="aName">${videosVo.wyInitialSizeString?if_exists}</div>
												</td>
												<td class="center">
													<div class="aName">${videosVo.wyDurationString?if_exists}</div>
												</td>
												<td class="center">
													<div class="aName"><@option name="issue_type_param"   status="1" type="3" value="${videosVo.videoIssueStatus?if_exists}"/></div>
												</td>
												<td class="center">
													<div class="aName"><@date_sub value='${videosVo.videoTime?string("yyyy-MM-dd")}' /></div>
												</td>
												
												<td class="center">
													<div class="aName">
													<#if (videosVo.videoDesc) ?if_exists>
													已描述
													<#else>
													<span title="可在编辑中进行视频描述">未描述</span>
													</#if>
													</div>
												</td>
												<td class="center ">
													<div class="aName">
														<!--<a href="#" style="color: #3eafe0" onclick="goUpdate(${videosVo.videoId});">
														编辑
													</a>
														&nbsp;&nbsp;|&nbsp;&nbsp;
													<a href="#" style="color: #3eafe0" onclick="ajaxDelVideo(${videosVo.videoId});">
														删除
													</a>-->
													<#if videosVo.videoIssueStatus == 0>
													<a class="btn btn-primary btn-sm" onclick="ajaxControllIssue(${videosVo.videoId},1);">
														开启发布
													</a>
													<#else>
													   <a class="btn btn-primary btn-sm" onclick="ajaxControllIssue(${videosVo.videoId},0);">
														关闭发布
													    </a>
													</#if>
													</div>
												</td>
											</tr>
							    		</#if>
									</#list>
								<#else>
									<tr align="center"><td colspan="10"><font color="red" size="4">没有查询到数据！</font></td></tr>
								</#if>
							</tbody>
						</table>
						<#if videoList>
						<#include "commons/page.ftl">
						</#if>
					</div>
				</div>
			</div>
		</div>
	</div>
</div><!-- /.main-container -->

<form id="lastQueryForm" method="post" name="lastQueryForm" action="${ctx}/videoManagement/listvideofromlocal?active=${active}">
<input type="hidden" id="oldPageNow" name="pageNow" value="${pageView.pageNow}" />
	<input type="hidden" name="startTime" value="${videosVo.startTime}" />
	<input type="hidden" name="endTime" value="${videosVo.endTime}" />
	<input type="hidden" name="videoTitle" value="${videosVo.videoTitle}" />
	<input type="hidden" name="videoLocalCation" value="${videosVo.videoLocalCation}" />
	<input type="hidden" name="querySign" value="1" />
</form>
<#include "commons/foot.ftl">

<!-- 编辑弹出框 -->	
<div class="modal fade" id="editModal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"></div>

<script type="text/javascript" charset="utf-8" src="/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="/ueditor/ueditor.all.js"></script>
	<script type="text/javascript" src="${ctx}/js/hzcj/jquery.validation.js"></script>
<script type="text/javascript" src="${ctx}/js/hzcj/messages_cn.js"></script>
<script src="${ctx}/js/hzcj/video.js?v=${jsv}"></script>
<!--body html end-->
<#include "commons/end.ftl">
<script>
/**$(function(){
		var ue = UE.getEditor('uploadVideo',{
				disabledTableInTable:false,
				allowDivTransToP:false,
				wordCount:false,
				elementPathEnabled:false
			});
		
		 	ue.addListener("afterupvideo",function(t,arg){
				 	var url="" ;
				 	var name="" ;
		 		  $.each(arg,function(n,value) {
		 		       url+=value.url+"&";
		 		       name+=value.original+"&";
		 		  });
		 		  
		 		  $.ajax({
							type : "POST",
							url : "${ctx}/videoManagement/createTxtPath",
							  dataType: "json",
							success : function(result) {
								if (result.retxtpath != "") {
							              //Modal.alert({msg:result.retxtpath);
							            $("#retxtpath").val(result.retxtpath);
							               $("#but").trigger("click");
							                      $.ajax({
															type : "POST",
															url : "${ctx}/videoManagement/uploadVideoToWYFromServer",
															  dataType: "json",
															data : {"videoLocalPathArr":url,"videoName":name,"retxtpath":result.retxtpath},
															success : function(result) {
																if (result.code == "0") {
																  $("#retxtpathPro").val("已完成");
																    clearInterval(b); //移除循环器      
																		Modal.alert({msg:"上传视频成功"});
																	} else {
																		Modal.alert({msg:result.msg});
																	}
															}
														});
									} else {
										Modal.alert({msg:result.msg});
									}
							}
						});
		 	});
		 	
		 	$("#upLoadToLocal").click(function(){
			 	var dialog = ue.getDialog('insertvideo');
									dialog.open();
									return ;
									  });
	        });
	    
	   		 	    var b;		
			   function getProcess(){
					   var retxtpath =  $("#retxtpath").val();
					   b=setInterval(function(){
								    $.ajax({
										type : "POST",
										url : "${ctx}/videoManagement/progress",
										  dataType: "json",
										data : {"retxtpath":retxtpath},
								         success:function(data){  
									         if(data.pro=="" || typeof(data.pro)=="undefined"){
									           $("#retxtpathPro").val("解析中...");
									         } else{
									            $("#retxtpathPro").val(data.pro+"%");
									         }
										     if(data.pro>=90){ 
										         $("#retxtpathPro").val("已完成");
										         clearInterval(b); //移除循环器      
										      }
								         }  
								    });        
					        } ,1000);//这个添加到单击事件的函数体里  
					}
					
		**/			
					
					
</script>