<#assign active_parent_name = "上传文件管理">
<#assign active_menu_name = "上传文件列表">
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
					  <form action="${ctx}/upLoadManagement/getUpLoadList?active=${active}" method="POST" id="queryForm">
					  		<input type="hidden" name="querySign" value="1" />
						   <input id="pageNow" name="pageNow" type="hidden" value="${pageView.pageNow}" />
						   	 <div class="row" style="padding-top: 10px;">
				 		   		<div class="col-xs-12">
							 
								      <div class="col-sm-6">
										<label>上传日期：</label>
										<input id="start_time" name="startTime" value="${startTime}" class="Wdate WdateInput2" type="text" onfocus="var end_time=$dp.$('end_time');WdatePicker({onpicked:function(){end_time.focus();},dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'end_time\')}',isShowClear:true,isShowOthers:false,qsEnabled:false})">
										至
										<input id="end_time" name="endTime" value="${endTime}" class="Wdate WdateInput2" type="text" onfocus="WdatePicker({minDate:'#F{$dp.$D(\'start_time\')}',dateFmt:'yyyy-MM-dd',isShowClear:true,isShowOthers:false,qsEnabled:false})">
									 	 <span class="BtnSouSu default-btn btn-blue" id="queryCommit">搜 索</span>
									 </div>													 
							 </div>
						</form>
  				 	 </div>
				</div>
				<div class="row" style="padding-top: 10px;">
					<div class="col-xs-12">
						<table class="table table-striped table-bordered table-hover RtableStriped RtableStropSOS" >
							<thead>
								<tr role="row">
									<th class="center" >文件类型 </th>
									<th class="center" >文件来源</th>
									<th class="center" >上传日期</th>
								</tr>
							</thead>
							
							<tbody>
								<#if upLoadList>
				            		<#list upLoadList as upLoad>
				            			<#if upLoad>
											<tr>
												<td class="center">
												<a href="#" style="color: #3eafe0" onclick="openUpLoadInfo(${upLoad.upId});" title="点击查看明细">
													<div class="aName">
												<@option name="file_type_param"   status="1" type="3" value="${upLoad.upType?if_exists}"/>
													</div>
												</a>
												</td>
												<td class="center">
													<div class="aName">
													<@option name="source_type_param"   status="1" type="3" value="${upLoad.upSourceType?if_exists}"/>
													</div>
												</td>
												<td class="center">
												<div class="aName"><@date_sub value='${upLoad.upTime?string("yyyy-MM-dd HH:mm:ss")}' /></div>
												</td>
											</tr>
							    		</#if>
									</#list>
								<#else>
									<tr align="center"><td colspan="3"><font color="red" size="4">没有查询到数据！</font></td></tr>
								</#if>
							</tbody>
						</table>
						<#if upLoadList>
						<#include "commons/page.ftl">
						</#if>
					</div>
				</div>
			</div>
		</div>
	</div>
</div><!-- /.main-container -->

<form id="lastQueryForm" method="post" name="lastQueryForm" action="${ctx}/upLoadManagement/getUpLoadList?active=${active}">
<input type="hidden" id="oldPageNow" name="pageNow" value="${pageView.pageNow}" />
	<input type="hidden" name="querySign" value="1" />
</form>
<div class="modal fade" id="upLoadInfoModal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"></div>
<!--body html end-->
<#include "commons/foot.ftl">
<#include "commons/end.ftl">
<script>
$(function(){
				$("#queryCommit").click(function(){
					$("#pageNow").val(1);
					$("#queryForm").submit();
				});
			
				$("#flashPage").click(function(){
					$("#queryForm").submit();
				});
	    });
function openUpLoadInfo(upId){
			$('#upLoadInfoModal').html("加载中...").load(ctx + '/upLoadManagement/openUpLoadDtails?upId='+upId+'&r='+Math.random(),function(){
		   			 $("#upLoadInfoModal").modal();
			});
     }

</script>