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
						<form action="${ctx}/question/list" method="POST" id="queryForm">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->
								<div class="col-sm-3">
									<label>问卷名称：</label>
									<input type="text" name="quesName" value="${question.quesName?if_exists}" class="InputName0" maxlength="20" style="width:200px;">
								</div>
								<div class="col-sm-4">
									<label>问卷类别：</label>
									<select class="chosen-select AceSelect" name="quesType" >
									<@option name="question_type_param" status="1" value="${question.quesType}"/>
										</select>
										
									<span id="queryCommit" class="BtnSouSu default-btn btn-blue"  onclick="file_Submit()">搜 索</span>
								</div>
							</div >	
								<div class="col-xs-12 ">
									<span onclick="add();" class="BtnNormalSu default-btn btn-blue">新 增</span>
									<span onclick="modify();" class="BtnNormalSu default-btn btn-blue">修 改</span>
									<span onclick="remove();" class="BtnNormalSu default-btn btn-blue">删 除</span>
									
									<div class="col-xs-12">
										<div class="col-sm-10 mt10" style="margin-bottom:10px;">
										1、首先新建问卷，输入问卷名称，选择问卷类别，保存问卷；<br/>2、然后点击编辑，录入题目、题项及答案信息。
										</div>
									</div>
									
									<table class="table table-striped table-bordered table-hover RtableStriped RtableStropSOS">
										<thead>
										<tr role="row">
											<th class="center">
												选择
											</th>
											<th class="center">
												序号
											</th>
											<th class="center">
												问卷名称
											</th>
											<th class="center">
												问卷类型
											</th>
											<th class="center">
												发布状态
											</th>
										</tr>
										</thead>
										<tbody>
										<#if questionList>
											<#list questionList as question>
											<tr>
												<td class="center">
													<div class="aName"><input type="radio" value="${question.quesId}" name="quesIdRadio" /></div>
												</td>
												<td class="center">
													<div class="aName">${question_index+1+(pageView.pageNow-1)*pageView.pageSize}</div>
												</td>
												<td class="center">
													<div class="aName">${question.quesName}</div>
												</td>
												<td class="center">
													<div class="aName">
													<@option name="question_type_param" status="1" type="3" value="${question.quesType}"/>
													</div>
												</td>
												<td class="center">
													<div class="aName">
														<@option name="issue_type_param" status="1" type="3" value="${question.quesState}"/>
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
							<!-- /.col -->
						</form>
						</div><!-- /.row -->
					</div><!-- /.page-content -->
				</div>
			</div><!-- /.main-content -->
		</div><!-- /.main-container -->

<form id="lastQueryForm" method="post" name="lastQueryForm" action="${ctx}/question/list">
 	<input type="hidden" id="oldPageNow" name="pageNow" value="${pageView.pageNow}" />
	<input type="hidden" name="quesType" value="${question.quesType}" />
	<input type="hidden" name="quesName" value="${question.quesName}" />
</form>
		
<#include "commons/foot.ftl">
<div class="modal fade HoranMyModals" id="catalog_list_modal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"></div>
<script type="text/javascript">
	function getRadioInput() {
		var radioInput = $('input:radio[name="quesIdRadio"]:checked').val();
		return radioInput;
	}
	function file_Submit(){
		if(checkLoginStatus() == false) return;
		$("#pageNow").val(1);
		$("#queryForm").submit();
	}
	function add(){
		$("#queryForm").attr("action","${ctx}/question/token/add/page");
		$("#queryForm").submit();
	}
	function remove(){
		var quesIdRadio = getRadioInput();
		if (!quesIdRadio) {
			Modal.alert({msg:"请选择一条需要操作的数据"});
			return;
		}
		
		Modal.confirm({msg:"确定删除吗？", okCallback:function() {
			$(this).on("hidden.bs.modal", function() {
				$.ajax({
					type:"post",
					dataType:"json",
					data:{"id":quesIdRadio},
					async : false,
					url:"${ctx}/question/remove",
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
		var quesIdRadio = getRadioInput();
		if (!quesIdRadio) {
			Modal.alert({msg:"请选择一条需要操作的数据"});
			return;
		}
		
		$("#queryForm").attr("action","${ctx}/question/token/modify/page?id="+quesIdRadio);
		$("#queryForm").submit();
	}
	//翻页动作
	function queryformPage(){
		$("#lastQueryForm").submit();
	};
</script>
<#include "commons/end.ftl">