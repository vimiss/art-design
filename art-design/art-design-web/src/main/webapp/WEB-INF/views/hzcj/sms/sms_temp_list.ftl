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
						<div class="col-xs-12">
						<form action="${ctx}/sms/temp/list" method="POST" id="queryForm">
								<!-- PAGE CONTENT BEGINS -->
								<div class="col-xs-12">
									<div class="col-sm-3">
										<label>模板编码：</label>
										<input type="text" class="InputName0" name="tempCode" value="${tempCode}" placeholder="请输入模板编码" />
									</div>
									<div class="col-sm-4">
										<label>模板名称：</label>
										<input type="text" class="InputName0" name="tempName" value="${tempName}" placeholder="请输入模板名称" />
										<span id="queryCommit" class="BtnSouSu default-btn btn-blue">搜 索</span>
									</div>
								</div>
								
								<div class="col-xs-12">
									<span id="queryAdd" onclick="queryTempAdd();" class="BtnNormalSu default-btn btn-blue">新 增</span>
									<span id="queryModify" onclick="queryTempMod();" class="BtnNormalSu default-btn btn-blue">修 改</span>
									<span id="queryDelete" onclick="queryTempDel();" class="BtnNormalSu default-btn btn-blue">删 除</span>
										
									<table class="table table-striped table-bordered table-hover RtableStriped RtableStropSOS">
										<thead>
										<tr role="row">
											<th class="center">选择</th>
											<th class="center">序号</th>
											<th class="center">模板编码</th>
											<th class="center">模板名称</th>
											<th class="center" width="65%">模板内容</th>
										</tr>
										</thead>
										<tbody>
										<#if smsTempListByPage?if_exists>
											<#list smsTempListByPage as tempList>
											<tr>
												<td class="center">
													<div class="aName"><input type="radio" value="${tempList.tempId}" name="tempIdRadio" /></div>
												</td>
												<td class="center">
													<div class="aName">${tempList_index+1+(pageView.pageNow-1)*pageView.pageSize}</div>
												</td>
												<td class="center">
													<div class="aName">${tempList.tempCode}</div>
												</td>
												<td class="center">
													<div class="aName">${tempList.tempName}</div>
												</td>
												<td class="center">
													<div class="aName">${tempList.tempContent}</div>
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
						</form>
						</div><!-- /.col -->
						</div><!-- /.row -->
					</div><!-- /.page-content -->
				</div>
			</div><!-- /.main-content -->
		</div><!-- /.main-container -->
		
<form id="lastQueryForm" method="post" name="lastQueryForm" action="${ctx}/sms/temp/list?active=${active}">
 	<input type="hidden" id="oldPageNow" name="pageNow" value="${pageView.pageNow}" />
	<input type="hidden" name="tempCode" value="${tempCode}" />
	<input type="hidden" name="tempName" value="${tempName}" />
</form>		
<#include "commons/foot.ftl">
<!-- 课程包详情弹层 -->
<div class="modal fade" id="sms_temp_add_modal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"></div>
<div class="modal fade" id="sms_temp_mod_modal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"></div>
<script type="text/javascript">
	$(function(){
		//查询
		$("#queryCommit").click(function(){
			if(checkLoginStatus() == false) return;
			$("#pageNow").val(1);
			$("#queryForm").submit();
		});
	});
	
	function queryTempAdd() {
		$('#sms_temp_add_modal').html("加载中...").load('${ctx}/sms/temp/add/page', function(res,sta,xhr){
			if(res){//判断是否正常返回了数据--登录拦截,res,sta,xhr
				$("#sms_temp_add_modal").modal({
					keyboard:'false',//true是默认可是使用esc退出弹窗，false是不能使用esc退出
					show:'true',// bool值，立即调用show
					backdrop:'static'//static是只在弹窗内点击关闭按钮可以关闭
				});
			}
		});
	}
	function queryTempMod() {
		var tempIdRadio = getRadioInput();
		if (!tempIdRadio) {
			Modal.alert({msg:"请选择一条需要操作的数据"});
			return;
		}
		
		$('#sms_temp_mod_modal').html("加载中...").load('${ctx}/sms/temp/mod/page', 'tempId='+tempIdRadio,function(res,sta,xhr){
			if(res){//判断是否正常返回了数据--登录拦截,res,sta,xhr
				$("#sms_temp_mod_modal").modal({
					keyboard:'false',//true是默认可是使用esc退出弹窗，false是不能使用esc退出
					show:'true',// bool值，立即调用show
					backdrop:'static'//static是只在弹窗内点击关闭按钮可以关闭
				});
			}
		});
	}
	function queryTempDel() {
		var tempIdRadio = getRadioInput();
		if (!tempIdRadio) {
			Modal.alert({msg:"请选择一条需要操作的数据"});
			return;
		}
		
		Modal.confirm({msg:"确认要删除吗？", okCallback:function() {
			$(this).on("hidden.bs.modal", function() {
				$.ajax({
					type: "post",
					dataType: "json",
					data: {"tempId":tempIdRadio},
					url: "${ctx}/sms/temp/remove",
					success: function(result) {
						if (result.code == "0") {
							Modal.alert({msg:"删除成功", okCallback:function() {
								$("#queryCommit").click();
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
	function getRadioInput() {
		var radioInput = $("input:radio[name='tempIdRadio']:checked").val();
		return radioInput;
	}
	
	//翻页动作
	function queryformPage() {
		$("#lastQueryForm").submit();
	}
</script>
<#include "commons/end.ftl">