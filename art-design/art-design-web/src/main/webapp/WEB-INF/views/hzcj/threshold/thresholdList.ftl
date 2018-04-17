<#assign active_parent_name = "阀值管理">
<#assign active_menu_name = "阀值列表">
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
					<li><a href="${ctx}/index">首页</a>
						<!--<a href="#">UI &amp; Elements</a>--></li>
					<li><a href=""></a></li>
					<li></li>
				</ul>
				<div class="pull-right fanhuiIndex">
					<a href="#" onclick="shichang()" style="margin-top: 0px;">设置时长</a>
					<a href="${ctx}/index" style="margin-top: 0px;"><img src="${ctx}/img/menu_fanhui.png" alt="返回首页"></a>
				</div>
			</div>
			<div class="page-content ">
				<div class="row" style="padding-top: 10px;">
				 	 <div class="col-xs-12">
					  <form action="${ctx}/thresHoldManagement/thresholdList?active=${active}" method="POST" id="queryForm">
					  		<input type="hidden" name="querySign" value="1" />
						   <input id="pageNow" name="pageNow" type="hidden" value="${pageView.pageNow}" />
						   	 <div class="row" style="padding-top: 10px;">
				 		   		<div class="col-xs-12">
							 
							 <div class="row">
								     <div class="col-sm-4">
										<label>阀值类型：</label>
											<select class="chosen-select AceSelect" name="thType" >
											<option value="">请选择</option>
											<#if thresHoldTypeList?exists>
												<#list thresHoldTypeList as tht>
													<option value="${tht.thType}"<#if "${tht.thType}"=="${thresHoldVo.thType}">selected="selected"</#if>>${tht.thName}</option>
												</#list>
											</#if>
										</select>
									   <a href="javascript:void(0);" class="BtnSouSu default-btn btn-blue" id="queryCommit">搜 索</a>
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
									<th class="center" > 阀值名称 </th>
									<th class="center" > 阀值最小值</th>
									<th class="center" > 阀值最大值 </th>
									<th class="center" width="15%">阀值结果</th>
								</tr>
							</thead>
							
							<tbody>
								<#if thresHoldList>
				            		<#list thresHoldList as thresHoldVo>
				            			<#if thresHoldVo>
											<tr>
												<td class="center">
													<a href="#" style="color: #3eafe0" onclick="openThresHoldInfo(${thresHoldVo.thId});" title="点击查看明细">
													<div>${thresHoldVo.thName?if_exists}</div>
													</a>
												</td>
												<td class="center">
													<div>${thresHoldVo.thMinValue?if_exists}</div>
												</td>
												<td class="center">
													<div>${thresHoldVo.thMaxValue?if_exists}</div>
												</td>
												
												<td class="center">
													<div>${thresHoldVo.thResult?if_exists}</div>
												</td>
											</tr>
							    		</#if>
									</#list>
								<#else>
									<tr align="center"><td colspan="4"><font color="red" size="4">没有查询到数据！</font></td></tr>
								</#if>
							</tbody>
						</table>
						<#include "commons/page.ftl">
					</div>
				</div>
			</div>
		</div>
	</div>
</div><!-- /.main-container -->

<form id="lastQueryForm" method="post" name="lastQueryForm" action="${ctx}/thresHoldManagement/thresholdList?active=${active}">
<input type="hidden" id="oldPageNow" name="pageNow" value="${pageView.pageNow}" />
	<input type="hidden" name="querySign" value="1" />
	<input type="hidden" name="thType" value="${thresHoldVo.thType}" />
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
	    
	    
	    function openThresHoldInfo(thId){
			$('#upLoadInfoModal').html("加载中...").load(ctx + '/thresHoldManagement/openThresHoldDtails?thId='+thId+'&r='+Math.random(),function(){
		   			 $("#upLoadInfoModal").modal();
			});
     }
	    
</script>