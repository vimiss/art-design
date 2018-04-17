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
						<form action="${ctx}/itemFence/list" method="POST" id="queryForm">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->
								<div class="col-sm-3">
									<label>栏目名称：</label>
									<input type="text" name="fenceName" value="${itemFenceVo.fenceName?if_exists}" class="InputName0" maxlength="30" style="width:200px;">
								</div>
								<div class="col-sm-3">
									<label>英文名称：</label>
									<input type="text" name="fenceTableCode" value="${itemFenceVo.fenceTableCode?if_exists}" class="InputName0" maxlength="30" style="width:200px;">
								</div>
								<div class="col-sm-3">
									<label>发现栏目：</label>
									<select class="chosen-select AceSelect" id="fenceFlag" name="fenceFlag" >
										<@option name="yes_no_type_param" status="1" value="${itemFenceVo.fenceFlag}"/>
									</select>
								</div>
							</div>
							<div class="col-xs-12" style="margin-top:10px;"></div>
							<div class="col-xs-12">
								<div class="col-sm-6">
									<label>起始时间：</label>
									<input id="start_time" name="startTime" value="${itemFenceVo.startTime}" class="Wdate WdateInput2" type="text" onfocus="var end_time=$dp.$('end_time');WdatePicker({onpicked:function(){end_time.focus();},dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'end_time\')}',isShowClear:true,isShowOthers:false,qsEnabled:false})">
									至
									<input id="end_time" name="endTime" value="${itemFenceVo.endTime}" class="Wdate WdateInput2" type="text" onfocus="WdatePicker({minDate:'#F{$dp.$D(\'start_time\')}',dateFmt:'yyyy-MM-dd',isShowClear:true,isShowOthers:false,qsEnabled:false})">
									
							   		<span id="queryCommit" class="BtnSouSu default-btn btn-blue" onclick="file_Submit()">搜 索</span>
								</div>
							</div>
								<div class="col-xs-12 ">
								   <span onclick="add();" class="BtnNormalSu default-btn btn-blue">新 增</span>
								   <span onclick="modify();" class="BtnNormalSu default-btn btn-blue">修 改</span>
								   <!--<span onclick="remove();" class="BtnNormalSu default-btn btn-blue">删 除</span>-->
								   
									<table class="table table-striped table-bordered table-hover RtableStriped RtableStropSOS">
										<thead>
										<tr role="row">
											<th class="center" >选择</th>
											<th class="center" >序号</th>
											<th class="center" >栏目名称</th>
											<th class="center" >栏目编码</th>
											<th class="center" >发现栏目</th>
											<th class="center" >创建时间</th>
										</tr>
										</thead>
										<tbody>
										<#if itemFenceList>
											<#list itemFenceList as itemFence>
											<tr>
												<td class="center">
													<div class="aName"><input type="radio" value="${itemFence.fenceId}" name="fenceIdRadio" /></div>
												</td>
												<td class="center">
													<div class="aName">${itemFence_index+1+(pageView.pageNow-1)*pageView.pageSize}</div>
												</td>
												<td class="center">
													<div class="aName">${itemFence.fenceName}</div>
												</td>
												<td class="center">
													<div class="aName">${itemFence.fenceTableCode}</div>
												</td>
												<td class="center">
													<div class="aName">
														<@option name="yes_no_type_param" status="1" type="3" value="${itemFence.fenceFlag}"/>
													</div>
												</td>
												<td class="center">
													<div class="aName">
														<@date_sub value='${itemFence.fenceTime?string("yyyy-MM-dd HH:mm:ss")}' />
													</div>
												</td>
											</tr>
											</#list>
										<#else>
											<tr align="center"><td colspan="6"><font color="red" size="4">没有查询到数据！</font></td></tr>
										</#if>
										</tbody>
									</table>
									<input type="hidden" id="pageNow" name="pageNow" value="${pageView.pageNow?if_exists}" />
									<#if itemFenceList>
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

<form id="lastQueryForm" method="post" name="lastQueryForm" action="${ctx}/itemFence/list">
 	<input type="hidden" id="oldPageNow" name="pageNow" value="${pageView.pageNow}" />
	<input type="hidden" name="fenceTableCode" value="${itemFenceVo.fenceTableCode}" />
	<input type="hidden" name="fenceName" value="${itemFenceVo.fenceName}" />
	<input type="hidden" name="fenceFlag" value="${itemFenceVo.fenceFlag}" />
	<input type="hidden" name="startTime" value="${itemFenceVo.startTime}" />
	<input type="hidden" name="endTime" value="${itemFenceVo.endTime}" />
</form>
		
<#include "commons/foot.ftl">
<script type="text/javascript">
	function getRadioInput() {
		var radioInput = $('input:radio[name="fenceIdRadio"]:checked').val();
		return radioInput;
	}
	function file_Submit(){
		if(checkLoginStatus() == false) return;
		$("#pageNow").val(1);
		$("#queryForm").submit();
	}
	function add(){
		$("#queryForm").attr("action","${ctx}/itemFence/token/add/page");
		$("#queryForm").submit();
	}
	function remove(){
		var fenceIdRadio = getRadioInput();
		if (!fenceIdRadio) {
			Modal.alert({msg:"请选择一条需要操作的数据"});
			return;
		}
		
		Modal.confirm({msg:"确定删除吗？", okCallback:function() {
			$(this).on("hidden.bs.modal", function() {
				$.ajax({
					type:"post",
					dataType:"json",
					data:{"id":fenceIdRadio},
					async : false,
					url:"${ctx}/itemFence/remove",
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
	function modify(){
		var fenceIdRadio = getRadioInput();
		if (!fenceIdRadio) {
			Modal.alert({msg:"请选择一条需要操作的数据"});
			return;
		}
		
		$("#queryForm").attr("action","${ctx}/itemFence/token/modify/page?id="+fenceIdRadio);
		$("#queryForm").submit();
	}
	//翻页动作
	function queryformPage(){
		$("#lastQueryForm").submit();
	};
</script>
<#include "commons/end.ftl">