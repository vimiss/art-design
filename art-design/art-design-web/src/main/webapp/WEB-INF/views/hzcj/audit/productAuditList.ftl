<#assign active_parent_name = "产品管理">
<#assign active_menu_name = "产品审核管理">
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
					<!-- 面包屑div -->
					<div class="breadcrumbs" id="breadcrumbs">
						<script type="text/javascript">
							try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
						</script>
						<ul class="breadcrumb">
							<li><span><i class="ace-icon fa  fa-map-marker bigger-130"></i> 当前位置：</span></li>
							<li><a href="${ctx}/index">首页</a>
							<li><a href=""></a></li>
							<li></li>
						</ul>
						<!-- /.breadcrumb -->
						<!-- /section:basics/content.searchbox -->
					</div>
					<div class="page-content ">
						<div class="row" style="padding-top: 10px;">
						<form action="${ctx}/productAudit/list" method="POST" id="queryForm">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->
								<div class="col-sm-3">
									<label>审核人名称：</label>
									<input type="text" name="auditUserName" value="${productAuditVo.auditUserName?if_exists}" class="InputName0" maxlength="20">
								</div>
								<div class="col-sm-3">
									<label>审核结果：</label>
									<select class="chosen-select AceSelect" name="auditResult" >
											<@option name="result_type_param" status="1" value="${productAuditVo.auditResult}"/>
										</select>
								</div>
								<div class="col-sm-3">
									<label>审核意见：</label>
									<input type="text" name="auditOpinion" value="${productAuditVo.auditOpinion?if_exists}" class="InputName0" maxlength="50">
								</div>
								</div>
								<div class="col-xs-12" style="margin-top:10px;">
								<div class="col-xs-12">
								<div class="col-sm-3">
									<label>产品名称：</label>
									<input type="text" name="prodName" value="${productAuditVo.product.prodName?if_exists}" class="InputName0" maxlength="50">
								</div>
								<div class="col-sm-6">
										<label>审核时间：</label>
										<input id="start_time" name="startTime" value="${productAuditVo.startTime?if_exists}" class="Wdate WdateInput2" type="text" onfocus="var end_time=$dp.$('end_time');WdatePicker({onpicked:function(){end_time.focus();},dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'end_time\')}',isShowClear:true,isShowOthers:false,qsEnabled:false})">
										至
										<input id="end_time" name="endTime" value="${productAuditVo.endTime?if_exists}" class="Wdate WdateInput2" type="text" onfocus="WdatePicker({minDate:'#F{$dp.$D(\'start_time\')}',dateFmt:'yyyy-MM-dd',isShowClear:true,isShowOthers:false,qsEnabled:false})">
										<span id="queryCommit" class="BtnSouSu default-btn btn-blue" onclick="file_Submit()">搜 索</span>
								</div>
								</div>	
								<div class="col-xs-12 ">
									<table class="table table-striped table-bordered table-hover RtableStriped RtableStropSOS">
										<thead>
										<tr role="row">
											<th class="center" width="5%">
												<span class="lbl" title="">序号</span>
											</th>
											<th class="center" width="5%">
												审核结果
											</th>
											<th class="center" width="20%">
												审核意见
											</th>
											<th class="center" width="10%">
												产品名称
											</th>
											<th class="center" width="10%">
												产品类别
											</th>
											<th class="center" width="5%">
												产品描述
											</th>
											<th class="center" width="5%">
												审核人名称
											</th>
											<th class="center" width="10%">
												审核时间
											</th>
											<th class="center" width="15%">
												操作
											</th>
										</tr>
										</thead>
										<tbody>
										<#if productAuditList>
											<#list productAuditList as productAudit>
											<tr>
												<td class="center">
													<div>${productAudit_index+1+(pageView.pageNow-1)*pageView.pageSize}</div>
												</td>
												<td class="center">
													<div>
														<@option name="result_type_param" status="1" type="3" value="${productAudit.auditResult}"/>
													</div>
												</td>
												<td class="center">
													<div>${productAudit.auditOpinion}</div>
												</td>
												<td class="center">
													<div>${productAudit.product.prodName}</div>
												</td>
												<td class="center">
													<div>
														<@option name="product_type_param" status="1" type="3" value="${productAudit.product.prodTypeCode}"/>
													</div>
												</td>
												<td class="center">
													<div>${productAudit.product.prodDesc}</div>
												</td>
												<td class="center">
													<div>${productAudit.auditUserName}</div>
												</td>
												<td class="center">
													<div>
													<@date_sub value='${productAudit.auditTime?string("yyyy-MM-dd HH:mm:ss")}' />
													</div>
												</td>
												<td class="center">
													<div>
													<a class="btn btn-primary btn-sm" onclick="modify(${productAudit.auditId});">修改</a>
													<a class="btn btn-primary btn-sm" onclick="remove(${productAudit.auditId});">删除</a>
													</div>
												</td>
											</tr>
											</#list>
										<#else>
											<tr align="center"><td colspan="9"><font color="red" size="4">没有查询到数据！</font></td></tr>
										</#if>
										</tbody>
									</table>
									<input type="hidden" id="pageNow" name="pageNow" value="${pageView.pageNow?if_exists}" />
									<#if productAuditList>
									<#include "commons/page.ftl">
									</#if>
								</div>
							<!-- /.col -->
						</form>
						</div><!-- /.row -->
					</div><!-- /.page-content -->
				</div>
			</div><!-- /.main-content -->
		</div><!-- /.main-container -->

<form id="lastQueryForm" method="post" name="lastQueryForm" action="${ctx}/productAudit/list">
 	<input type="hidden" id="oldPageNow" name="pageNow" value="${pageView.pageNow}" />
	<input type="hidden" name="auditResult" value="${productAuditVo.auditResult}" />
	<input type="hidden" name="auditOpinion" value="${productAuditVo.auditOpinion}" />
	<input type="hidden" name="prodName" value="${productAuditVo.product.prodName}" />
	<input type="hidden" name="auditUserName" value="${productAuditVo.auditUserName}" />
	<input type="hidden" name="startTime" value="${productAuditVo.startTime}" />
	<input type="hidden" name="endTime" value="${productAuditVo.endTime}" />
</form>
		
<#include "commons/foot.ftl">
<div class="modal fade HoranMyModals" id="catalog_list_modal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"></div>
<script type="text/javascript">
	
	function file_Submit(){
		if(checkLoginStatus() == false) return;
		$("#pageNow").val(1);
		$("#queryForm").submit();
	}
	function remove(id){
		Modal.confirm({msg:"确定删除吗？", okCallback:function() {
			$(this).on("hidden.bs.modal", function() {
				$.ajax({
					type:"post",
					dataType:"json",
					data:{"id":id},
					async : false,
					url:"${ctx}/productAudit/remove",
					success:function(result) {
						if (result.code == "0") {
							Modal.alert({msg:"删除成功", okCallback:function() {
								location.reload();
							}});
						} else {
							Modal.alert({msg:result.msg});
						}
					}
				});
			
				$(this).off("hidden.bs.modal");
			});
		}});
	}
	function modify(id){
		$("#queryForm").attr("action","${ctx}/productAudit/token/modify/page?id="+id);
		$("#queryForm").submit();
	}
	//翻页动作
	function queryformPage(){
		$("#lastQueryForm").submit();
	};
</script>
<#include "commons/end.ftl">