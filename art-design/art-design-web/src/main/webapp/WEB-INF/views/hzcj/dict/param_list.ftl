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
						<form action="${ctx}/dict/param/list" method="POST" id="queryForm">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->
								<div class="col-xs-12 ">
									<div class="col-sm-3">
										<label>参数名称：</label>
										<input type="text" class="InputName0" name="paramName" value="${paramName}" placeholder="请输入参数名称" />
									</div>
									<div class="col-sm-3">
										<label>参数描述：</label>
										<input type="text" class="InputName0" name="paramDesc" value="${paramDesc}" placeholder="请输入参数描述" />
									</div>
									<div class="col-sm-6">
										<label>参数状态：</label>
										<select class="chosen-select AceSelect" name="paramStatus" >
											<@option name="status_param" status="1" value="${paramStatus}"/>
										</select>
										<span id="queryCommit" class="BtnSouSu default-btn btn-blue">搜 索</span>
									</div>
								</div>

								<div class="col-xs-12 ">
									<span id="queryAdd" onclick="queryParamAdd();" class="BtnNormalSu default-btn btn-blue">新 增</span>
									<span id="queryModify" onclick="queryParamMod();" class="BtnNormalSu default-btn btn-blue">修 改</span>
									<span id="queryDelete" onclick="queryParamDel();" class="BtnNormalSu default-btn btn-blue">删 除</span>
									<span style="margin-left:10px;"></span>
									<span id="queryDetail" onclick="queryParamOption();" class="BtnNormalSu default-btn btn-blue">查看选项</span>
									<span id="queryProvinceCity" onclick="queryParamPcList();" class="BtnNormalSu default-btn btn-blue">查看城市</span>
									
									<table class="table table-striped table-bordered table-hover RtableStriped RtableStropSOS">
										<thead>
										<tr role="row">
											<th class="center">选择</th>
											<th class="center" width="5%">
												<span class="lbl" title="">序号</span>
											</th>
											<th class="center">参数名称</th>
											<th class="center">参数描述</th>
											<th class="center">参数状态</th>
										</tr>
										</thead>
										<tbody>
										<#if paramListBy?if_exists>
											<#list paramListBy as paramList>
											<tr>
												<td class="center">
													<div class="aName"><input type="radio" value="${paramList.paramId}" name="paramIdRadio" /></div>
												</td>
												<td class="center">
													<div class="aName">${paramList_index+1+(pageView.pageNow-1)*pageView.pageSize}</div>
												</td>
												<td class="center">
													<div class="aName">${paramList.paramName?if_exists}</div>
												</td>
												<td class="center">
													<div class="aName">${paramList.paramDesc?if_exists}</div>
												</td>
												<td class="center">
													<div class="aName">
														<@option name="status_param" status="1" type="3" value="${paramList.paramStatus}"/>
													</div>
												</td>
											</tr>
											</#list>
										<#else>
											<tr align="center"><td colspan="5"><font color="red" size="4">没有查询到数据！</font></td></tr>
										</#if>
										</tbody>
									</table>
									<input type="hidden" id="pageNow" name="pageNow" value="${pageView.pageNow?if_exists}" />
									<#include "commons/page.ftl">
								</div>
							</div><!-- /.col -->
						</form>
						</div><!-- /.row -->
					</div><!-- /.page-content -->
				</div>
			</div><!-- /.main-content -->
		</div><!-- /.main-container -->
		
<form id="lastQueryForm" method="post" name="lastQueryForm" action="${ctx}/dict/param/list?active=${active}">
 	<input type="hidden" id="oldPageNow" name="pageNow" value="${pageView.pageNow}" />
	<input type="hidden" name="paramName" value="${paramName}" />
	<input type="hidden" name="paramDesc" value="${paramDesc}" />
	<input type="hidden" name="paramStatus" value="${paramStatus}" />
</form>		
<#include "commons/foot.ftl">
<!-- 课程包详情弹层 -->
<div class="modal fade" id="param_add_modal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"></div>
<div class="modal fade" id="param_detail_modal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"></div>
<div class="modal fade" id="option_list_modal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"></div>
<div class="modal fade" id="option_add_modal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"></div>
<div class="modal fade" id="option_detail_modal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"></div>
<div class="modal fade" id="param_pc_list_modal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"></div>
<div class="modal fade" id="param_pc_add_modal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"></div>
<div class="modal fade" id="param_pc_mod_modal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"></div>
<div class="modal fade" id="option_pc_list_modal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"></div>
<div class="modal fade" id="option_pc_add_modal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"></div>
<div class="modal fade" id="option_pc_mod_modal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"></div>
<script type="text/javascript">
	$(function(){
		//查询
		$("#queryCommit").click(function(){
			if(checkLoginStatus() == false) return;
			$("#pageNow").val(1);
			$("#queryForm").submit();
		});
	});
	
	function getRadioInput() {
		var radioInput = $('input:radio[name="paramIdRadio"]:checked').val();
		return radioInput;
	}
	
	function queryParamAdd() {
		$('#param_add_modal').html("加载中...").load('${ctx}/dict/param/add/page', function(res,sta,xhr){
			if(res){//判断是否正常返回了数据--登录拦截,res,sta,xhr
				$("#param_add_modal").modal({
					keyboard:'false',//true是默认可是使用esc退出弹窗，false是不能使用esc退出
					show:'true',// bool值，立即调用show
					backdrop:'static'//static是只在弹窗内点击关闭按钮可以关闭
				});
			}
		});
	}
	function queryOptionAdd(paramId) {
		$('#option_add_modal').html("加载中...").load('${ctx}/dict/option/add/page', 'paramId='+paramId, function(res,sta,xhr){
			if(res){//判断是否正常返回了数据--登录拦截,res,sta,xhr
				$("#option_add_modal").modal({
					keyboard:'false',//true是默认可是使用esc退出弹窗，false是不能使用esc退出
					show:'true',// bool值，立即调用show
					backdrop:'static'//static是只在弹窗内点击关闭按钮可以关闭
				});
			}
		});
	}
	function queryParamMod() {
		var paramIdRadio = getRadioInput();
		if (!paramIdRadio) {
			Modal.alert({msg:"请选择一条需要操作的数据"});
			return;
		}
		queryDetail(paramIdRadio);
	}
	function queryParamDel() {
		var paramIdRadio = getRadioInput();
		if (!paramIdRadio) {
			Modal.alert({msg:"请选择一条需要操作的数据"});
			return;
		}
		Modal.confirm({msg:"确认要删除吗？", okCallback:function() {
			$(this).on("hidden.bs.modal", function() {
				$.ajax({
					type: "post",
					dataType: "json",
					data: {"paramId": paramIdRadio},
					url: "${ctx}/dict/param/remove",
					success: function(result) {
						if (result.code == "0") {
							Modal.alert({msg:"删除成功", okCallback:function() {
								$("#queryCommit").click();
							}});
						} else {
							Modal.alert(result.msg);
						}
					}
				});
				
				$(this).off("hidden.bs.modal");
			});
		}});
	}
	
	function queryParamPcList() {
		$('#param_pc_list_modal').html("加载中...").load('${ctx}/dict/param/pc/list', function(res,sta,xhr){
			if(res){//判断是否正常返回了数据--登录拦截,res,sta,xhr
				$("#param_pc_list_modal").modal({
					keyboard:'false',//true是默认可是使用esc退出弹窗，false是不能使用esc退出
					show:'true',// bool值，立即调用show
					backdrop:'static'//static是只在弹窗内点击关闭按钮可以关闭
				});
			}
		});
	}
	function queryParamPcAdd() {
		$('#param_pc_add_modal').html("加载中...").load('${ctx}/dict/param/pc/add/page', function(res,sta,xhr){
			if(res){//判断是否正常返回了数据--登录拦截,res,sta,xhr
				$("#param_pc_add_modal").modal({
					keyboard:'false',//true是默认可是使用esc退出弹窗，false是不能使用esc退出
					show:'true',// bool值，立即调用show
					backdrop:'static'//static是只在弹窗内点击关闭按钮可以关闭
				});
			}
		});
	}
	function queryParamPcMod(pcCode) {
		$('#param_pc_mod_modal').html("加载中...").load('${ctx}/dict/param/pc/mod/page', 'pcCode='+pcCode, function(res,sta,xhr){
			if(res){//判断是否正常返回了数据--登录拦截,res,sta,xhr
				$("#param_pc_mod_modal").modal({
					keyboard:'false',//true是默认可是使用esc退出弹窗，false是不能使用esc退出
					show:'true',// bool值，立即调用show
					backdrop:'static'//static是只在弹窗内点击关闭按钮可以关闭
				});
			}
		});
	}
	function queryOptionPcAdd(pcProvinceCode) {
		$('#option_pc_add_modal').html("加载中...").load('${ctx}/dict/option/pc/add/page', 'pcProvinceCode='+pcProvinceCode, function(res,sta,xhr){
			if(res){//判断是否正常返回了数据--登录拦截,res,sta,xhr
				$("#option_pc_add_modal").modal({
					keyboard:'false',//true是默认可是使用esc退出弹窗，false是不能使用esc退出
					show:'true',// bool值，立即调用show
					backdrop:'static'//static是只在弹窗内点击关闭按钮可以关闭
				});
			}
		});
	}
	function queryOptionPcMod(pcCode, pcProvinceCode) {
		$('#option_pc_mod_modal').html("加载中...").load('${ctx}/dict/option/pc/mod/page', 'pcCode='+pcCode+'&pcProvinceCode='+pcProvinceCode, function(res,sta,xhr){
			if(res){//判断是否正常返回了数据--登录拦截,res,sta,xhr
				$("#option_pc_mod_modal").modal({
					keyboard:'false',//true是默认可是使用esc退出弹窗，false是不能使用esc退出
					show:'true',// bool值，立即调用show
					backdrop:'static'//static是只在弹窗内点击关闭按钮可以关闭
				});
			}
		});
	}
	function queryOptionPcList(pcCode) {
		$('#option_pc_list_modal').html("加载中...").load('${ctx}/dict/option/pc/list', 'pcCode='+pcCode, function(res,sta,xhr){
			if(res){//判断是否正常返回了数据--登录拦截,res,sta,xhr
				$("#option_pc_list_modal").modal({
					keyboard:'false',//true是默认可是使用esc退出弹窗，false是不能使用esc退出
					show:'true',// bool值，立即调用show
					backdrop:'static'//static是只在弹窗内点击关闭按钮可以关闭
				});
			}
		});
	}
	function closeParamPcList() {
		$("#param_pc_list_modal").modal("hide");
	}
	function closeParamPcAdd() {
		$("#param_pc_add_modal").modal("hide");
	}
	function closeParamPcMod() {
		$("#param_pc_mod_modal").modal("hide");
	}
	function closeOptionPcList() {
		$("#option_pc_list_modal").modal("hide");
	}
	function closeOptionPcAdd() {
		$("#option_pc_add_modal").modal("hide");
	}
	function closeOptionPcMod() {
		$("#option_pc_mod_modal").modal("hide");
	}
	function queryParamOption() {
		var paramIdRadio = getRadioInput();
		if (!paramIdRadio) {
			Modal.alert({msg:"请选择一条需要操作的数据"});
			return;
		}
		queryOptionList(paramIdRadio);
	}
	function queryDetail(paramId){
		$('#param_detail_modal').html("加载中...").load('${ctx}/dict/param/detail', 'paramId='+paramId,function(res,sta,xhr){
			if(res){//判断是否正常返回了数据--登录拦截,res,sta,xhr
				$("#param_detail_modal").modal({
					keyboard:'false',//true是默认可是使用esc退出弹窗，false是不能使用esc退出
					show:'true',// bool值，立即调用show
					backdrop:'static'//static是只在弹窗内点击关闭按钮可以关闭
				});
			}
		});
	}
	function queryOptionList(paramId){
		$('#option_list_modal').html("加载中...").load('${ctx}/dict/option/list', 'paramId='+paramId,function(res,sta,xhr){
			if(res){//判断是否正常返回了数据--登录拦截,res,sta,xhr
				$("#option_list_modal").modal({
					keyboard:'false',//true是默认可是使用esc退出弹窗，false是不能使用esc退出
					show:'true',// bool值，立即调用show
					backdrop:'static'//static是只在弹窗内点击关闭按钮可以关闭
				});
			}
		});
	}
	function closeParamDetail() {
		$("#param_detail_modal").modal("hide");
	}
	function closeOptionList() {
		$("#option_list_modal").modal("hide");
	}
	function closeOptionAdd() {
		$("#option_add_modal").modal("hide");
	}
	function closeOptionDetail() {
		$("#option_detail_modal").modal("hide");
	}
	//展示详情
	function queryOptionDetail(paramId, optionName){
		$('#option_detail_modal').html("加载中...").load('${ctx}/dict/option/detail', 'paramId='+paramId+'&optionName='+optionName,function(res,sta,xhr){
			if(res){//判断是否正常返回了数据--登录拦截,res,sta,xhr
				$("#option_detail_modal").modal({
					keyboard:'false',//true是默认可是使用esc退出弹窗，false是不能使用esc退出
					show:'true',// bool值，立即调用show
					backdrop:'static'//static是只在弹窗内点击关闭按钮可以关闭
				});
			}
		});
	}
	//翻页动作
	function queryformPage() {
		$("#lastQueryForm").submit();
	}
</script>
<#include "commons/end.ftl">