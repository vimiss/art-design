<#assign active_parent_name = "专题">
<#assign active_menu_name = "专题">
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
						<a href="${ctx}/jiaoxue/file/list">
							<i class="menu-icon fa fa-home"></i>
							<span class="menu-text"> 专题 </span>
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
							<li><a href="${ctx}/index">首页</a></li>
							<li><a href="${ctx}/jiaoxue">教学系统</a></li>
							<li class="active">专题</li>
						</ul>
						<!-- /.breadcrumb -->
						<!-- /section:basics/content.searchbox -->
					</div>
					<div class="page-content ">
						<div class="row" style="padding-top: 10px;">
						<form action="${ctx}/jiaoxue/file/list" method="POST" id="queryForm">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->
								<div style="">
									<label>学段：</label>
									<label class=" showChildNO">
										<#if file.gradeFlag?if_exists && file.gradeFlag==2>
											<input name="gradeFlag" value="2" type="radio" class="ace" checked>
										<#else>
											<input name="gradeFlag" value="2" type="radio" class="ace">
										</#if>
										<span class="lbl"> 初中</span>
									</label>
									<label class=" showChildNO">
										<#if file.gradeFlag?if_exists && file.gradeFlag==3>
											<input name="gradeFlag" value="3" type="radio" class="ace" checked>
										<#else>
											<input name="gradeFlag" value="3" type="radio" class="ace">
										</#if>
										<span class="lbl"> 高中</span>
									</label>
									<label class=" showChildNO">
										<#if file.gradeFlag?if_exists && file.gradeFlag==4>
											<input name="gradeFlag" value="4" type="radio" class="ace" checked>
										<#else>
											<input name="gradeFlag" value="4" type="radio" class="ace">
										</#if>
										<span class="lbl"> 初升高</span>
									</label>
								</div>
								<div style="margin-top: 20px;">
									<label>名称：</label>
									<input type="text" name="name" value="${file.name?if_exists}" class="InputTexy1" maxlength="30" style="width:200px;">
									<a href="javascript:;" style="vertical-align: top; margin-top: 11px;" id="queryCommit" class="BtnSouSu"><img src="${ctx}/img/menuIcon2.png" alt="查询" height="34" onclick="file_Submit()"></a>
								</div>
								
								<div class="col-xs-12 ">
									<table class="table table-striped table-bordered table-hover RtableStriped RtableStropSOS">
										<thead>
										<tr role="row">
											<th class="center" width="40%">
												<span class="lbl" title="">专题名称</span>
											</th>
											<th class="center" width="10%">
												学段
											</th>
											<th class="center" width="50%">
												描述
											</th>
										</tr>
										</thead>
										<tbody>
										<#if pageView.records>
											<#list pageView.records as file>
											<tr>
												<td class="center">
													<div class="aName">
														<a href="javascript:;" onclick="xiangQing(${file.id})">${file.name}</a>
													</div>
												</td>
												<td class="center">
													<div>
														<#if file.gradeFlag?if_exists && file.gradeFlag==2>
														初中
														<#elseif file.gradeFlag?if_exists && file.gradeFlag==3>
														高中
														<#elseif file.gradeFlag?if_exists && file.gradeFlag==4>
														初升高
														</#if>
													</div>
												</td>
												<td class="center">
													<div>${file.description}</div>
												</td>
											</tr>
											</#list>
										<#else>
											<tr align="center"><td colspan="3"><font color="red" size="4">没有查询到数据！</font></td></tr>
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

<form id="lastQueryForm" method="post" name="lastQueryForm" action="${ctx}/jiaoxue/file/list">
 	<input type="hidden" id="oldPageNow" name="pageNow" value="${pageView.pageNow}" />
	<input type="hidden" name="gradeFlag" value="${file.gradeFlag}" />
	<input type="hidden" name="name" value="${file.name}" />
</form>
		
<#include "commons/foot.ftl">
<div class="modal fade HoranMyModals" id="catalog_list_modal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel">
<script type="text/javascript">
	function file_Submit(){
		$("#queryForm").submit();
	}
	
	function xiangQing(fileId){
		$('#catalog_list_modal').html("加载中...").load(ctx + '/jiaoxue/file/xiangQing?r='+Math.random()+'&fileId='+fileId,function(res,sta,xhr){
			if(res){//判断是否正常返回了数据--登录拦截,res,sta,xhr
				$("#catalog_list_modal").modal({
					keyboard:'false',//true是默认可是使用esc退出弹窗，false是不能使用esc退出
					show:'true',// bool值，立即调用show
					backdrop:'static'//static是只在弹窗内点击关闭按钮可以关闭
				});
			}
		});
	}
	//翻页动作
	function queryformPage(){
		$("#lastQueryForm").submit();
	};
</script>
<#include "commons/end.ftl">