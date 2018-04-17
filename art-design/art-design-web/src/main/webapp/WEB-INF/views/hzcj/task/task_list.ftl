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
							<li><a href="${ctx}/index">首页</a></li>
							<li><a href=""></a></li>
							<li></li>
						</ul>
						<!-- /.breadcrumb -->
						<!-- /section:basics/content.searchbox -->
					</div>
					<div class="page-content ">
						<div class="row" style="padding-top: 10px;">
						<form action="${ctx}/task/list" method="POST" id="queryForm">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->
								<div class="col-xs-12 ">
									<div class="col-sm-3">
										<label>任务名称：</label>
										<input type="text" class="InputName0" name="taskName" value="${taskName}" placeholder="请输入任务名称" />
									</div>
									<div class="col-sm-3">
										<label>任务类型：</label>
										<select class="chosen-select AceSelect" name="taskType" >
											<@option name="task_type_param" status="1" value="${taskType}"/>
										</select>
									</div>
									<div class="col-sm-4">
										<label>任务状态：</label>
										<select class="chosen-select AceSelect" name="taskStatus" >
											<@option name="status_param" status="1" value="${taskStatus}"/>
										</select>
										<span id="queryCommit" class="BtnSouSu default-btn btn-blue">搜 索</span>
									</div>
								</div>

								<div class="col-xs-12 ">
									<span id="queryAdd" onclick="queryTaskAdd();" class="BtnNormalSu default-btn btn-blue">新 增</span>
									<span id="queryModify" onclick="queryTaskMod();" class="BtnNormalSu default-btn btn-blue">修 改</span>
									<span id="queryDelete" onclick="queryTaskDel();" class="BtnNormalSu default-btn btn-blue">删 除</span>
									
									<table class="table table-striped table-bordered table-hover RtableStriped RtableStropSOS">
										<thead>
										<tr role="row">
											<th class="center">选择</th>
											<th class="center">
												<span class="lbl" title="">序号</span>
											</th>
											<th class="center">任务名称</th>
											<th class="center">任务标题</th>
											<th class="center">最小分值</th>
											<th class="center">最大分值</th>
											<th class="center">条件类型</th>
											<th class="center">条件数值</th>
											<th class="center">完成次数</th>
											<th class="center">任务类型</th>
											<th class="center">任务状态</th>
											<th class="center">前台显示</th>
											<th class="center">关联页面</th>
											<th class="center">创建时间</th>
										</tr>
										</thead>
										<tbody>
										<#if taskListByPage?if_exists>
											<#list taskListByPage as taskList>
											<tr>
												<td class="center">
													<div class="aName">
														<a onclick=""><input type="radio" value="${taskList.taskId}" name="taskIdRadio" /></a>
													</div>
												</td>
												<td class="center">
													<div class="aName">${taskList_index+1+(pageView.pageNow-1)*pageView.pageSize}</div>
												</td>
												<td class="center">
													<div class="aName">${taskList.taskName?default("--")}</div>
												</td>
												<td class="center">
													<div class="aName">${taskList.taskTitle?default("--")}</div>
												</td>
												<td class="center">
													<div class="aName">${taskList.taskMinValue?default("--")}</div>
												</td>
												<td class="center">
													<div class="aName">${taskList.taskMaxValue?default("--")}</div>
												</td>
												<td class="center">
													<div class="aName">
														<@option name="condition_type_param" status="1" type="3" value="${taskList.conditionType}"/>
													</div>
												</td>
												<td class="center">
													<div class="aName">${taskList.conditionValue?default("--")}</div>
												</td>
												<td class="center">
													<div class="aName">${taskList.taskFinishTime?default("--")}</div>
												</td>
												<td class="center">
													<div class="aName">
														<@option name="task_type_param" status="1" type="3" value="${taskList.taskType}"/>
													</div>
												</td>
												<td class="center">
													<div class="aName">
														<@option name="status_param" status="1" type="3" value="${taskList.taskStatus}"/>
													</div>
												</td>
												<td class="center ">
													<div class="aName">
														<@option name="yes_no_type_param" status="1" type="3" value="${taskList.taskShowStatus}"/>
													</div>
												</td>
												<td class="center ">
													<div class="aName"><@text_sub value="${taskList.taskUrl}" /></div>
												</td>
												<td class="center ">
													<div class="aName">
														<@date_sub value='${(taskList.taskTime?string("yyyy-MM-dd HH:mm:ss"))?default("--")}' />
													</div>
												</td>
											</tr>
											</#list>
										<#else>
											<tr align="center"><td colspan="14"><font color="red" size="4">没有查询到数据！</font></td></tr>
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
		
<form id="lastQueryForm" method="post" name="lastQueryForm" action="${ctx}/task/list?active=${active}">
 	<input type="hidden" id="oldPageNow" name="pageNow" value="${pageView.pageNow}" />
	<input type="hidden" name="taskName" value="${taskName}" />
	<input type="hidden" name="taskType" value="${taskType}" />
	<input type="hidden" name="taskStatus" value="${taskStatus}" />
</form>		
<#include "commons/foot.ftl">
<!-- 课程包详情弹层 -->
<div class="modal fade" id="task_add_modal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"></div>
<div class="modal fade" id="task_mod_modal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"></div>

<script type="text/javascript">
	$(function(){
		//查询
		$("#queryCommit").click(function(){
			if(checkLoginStatus() == false) return;
			$("#pageNow").val(1);
			$("#queryForm").submit();
		});
	});
	function queryTaskAdd() {
		$('#task_add_modal').html("加载中...").load('${ctx}/task/add/page', function(res,sta,xhr){
			if(res){//判断是否正常返回了数据--登录拦截,res,sta,xhr
				$("#task_add_modal").modal({
					keyboard:'false',//true是默认可是使用esc退出弹窗，false是不能使用esc退出
					show:'true',// bool值，立即调用show
					backdrop:'static'//static是只在弹窗内点击关闭按钮可以关闭
				});
			}
		});
	}
	function queryTaskMod() {
		var taskIdRadio = getRadioInput();
		if (!taskIdRadio) {
			Modal.alert({msg:"请选择一条需要操作的数据"});
			return;
		}
		
		$('#task_mod_modal').html("加载中...").load('${ctx}/task/modify/page', 'taskId='+taskIdRadio, function(res,sta,xhr){
			if(res){//判断是否正常返回了数据--登录拦截,res,sta,xhr
				$("#task_mod_modal").modal({
					keyboard:'false',//true是默认可是使用esc退出弹窗，false是不能使用esc退出
					show:'true',// bool值，立即调用show
					backdrop:'static'//static是只在弹窗内点击关闭按钮可以关闭
				});
			}
		});
	}
	function queryTaskDel() {
		var taskIdRadio = getRadioInput();
		if (!taskIdRadio) {
			Modal.alert({msg:"请选择一条需要操作的数据"});
			return;
		}
		
		Modal.confirm({msg:"确认要删除吗？", okCallback:function() {
			$(this).on("hidden.bs.modal", function() {
				$.ajax({
					type: "post",
					dataType: "json",
					data: {"taskId": taskIdRadio},
					url: "${ctx}/task/remove",
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
		var radioInput = $('input:radio[name="taskIdRadio"]:checked').val();
		return radioInput;
	}
	
	//翻页动作
	function queryformPage() {
		$("#lastQueryForm").submit();
	}
</script>
<#include "commons/end.ftl">