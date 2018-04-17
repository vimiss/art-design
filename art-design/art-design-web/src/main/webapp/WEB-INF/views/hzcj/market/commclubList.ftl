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
						<form action="${ctx}/commclub/list" method="POST" id="queryForm">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->
								<div class="col-xs-12">
									<div class="col-sm-3">
										<label>类别名称：</label>
										<input type="text" class="InputName0" name="clubName" value="${commClub.clubName?if_exists}" maxlength="40" placeholder="请输入类别名称" />
									</div>
									<div class="col-sm-3">
										<label>类别代码：</label>
										<input type="text" class="InputName0" name="clubCode" value="${commClub.clubCode?if_exists}" placeholder="请输入类别代码" />
									</div>
									<div class="col-sm-4">
										<label>使用状态：</label>
										<select class="chosen-select AceSelect" name="clubState">
											<@option name="status_param" status="1" value="${commClub.clubState}"/>
										</select>
										
									<span id="queryCommit" class="BtnSouSu default-btn btn-blue" onclick="file_Submit()">搜 索</span>
									</div>
								</div>
								</div>
							</div>
								<div class="col-xs-12 ">
									<span class="BtnNormalSu default-btn btn-blue" onclick="add();">新 增</span>
									<span class="BtnNormalSu default-btn btn-blue" onclick="modify();">修 改</span>
									
									<table class="table table-striped table-bordered table-hover RtableStriped RtableStropSOS">
										<thead>
										<tr role="row">
											<th class="center">选择</th>
											<th class="center" >
												序号
											</th>
											<th class="center" >
												类别名称
											</th>
											<th class="center" >
												类别代码
											</th>
											<th class="center" >
												类别描述
											</th>
											<th class="center" >
												类别图片
											</th>
											<th class="center" >
												状态
											</th>
											<th class="center" >
												创建时间
											</th>
										</tr>
										</thead>
										<tbody>
										<#if commClubList>
											<#list commClubList as commClub>
											<tr>
												<td class="center">
													<div class="aName"><input type="radio" value="${commClub.clubId}" name="clubId" /></div>
												</td>
												<td class="center">
													<div class="aName">${commClub_index+1+(pageView.pageNow-1)*pageView.pageSize}</div>
												</td>
												<td class="center">
													<div class="aName">${commClub.clubName}</div>
												</td>
												<td class="center">
													<div class="aName">${commClub.clubCode}</div>
												</td>
												<td class="center">
													<div class="aName">${commClub.clubDesc}</div>
												</td>
												<td class="center">
													<div class="aName">${commClub.clubUrl}</div>
												</td>
												<td class="center">
												<div class="aName">
													<@option name="status_param" status="1" type="3" value="${commClub.clubState}"/>
													</div>
												</td>
												<td class="center">
													<div class="aName"><@date_sub value='${commClub.clubTime?string("yyyy-MM-dd HH:mm:ss")}' /></div>
												</td>
											</tr>
											</#list>
										<#else>
											<tr align="center"><td colspan="8"><font color="red" size="4">没有查询到数据！</font></td></tr>
										</#if>
										</tbody>
									</table>
									<input type="hidden" id="pageNow" name="pageNow" value="${pageView.pageNow?if_exists}" />
									<#include "commons/page.ftl">
							</div><!-- /.col -->
						</form>
						</div><!-- /.row -->
					</div><!-- /.page-content -->
				</div>
			</div><!-- /.main-content -->
		</div><!-- /.main-container -->

<form id="lastQueryForm" method="post" name="lastQueryForm" action="${ctx}/commclub/list">
 	<input type="hidden" id="oldPageNow" name="pageNow" value="${pageView.pageNow}" />
	<input type="hidden" name="clubName" value="${commClub.clubName}" />
	<input type="hidden" name="clubCode" value="${commClub.clubCode}" />
	<input type="hidden" name="clubState" value="${commClub.clubState}" />
</form>
		
<#include "commons/foot.ftl">
<div class="modal fade HoranMyModals" id="catalog_list_modal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"></div>
<script type="text/javascript" charset="utf-8" src="/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="/ueditor/ueditor.all.js"></script>
<script type="text/javascript" src="${ctx}/js/hzcj/jquery.validation.js"></script>
<script type="text/javascript" src="${ctx}/js/hzcj/messages_cn.js"></script>
<script type="text/javascript">
	function file_Submit(){
		if(checkLoginStatus() == false) return;
		$("#pageNow").val(1);
		$("#queryForm").submit();
	}
	function add(){
		$('#catalog_list_modal').html("加载中...").load(ctx+'/commclub/add/page?r='+Math.random(),function(){
			$("#catalog_list_modal").modal();
		});
	}
	function modify(){
		var clubId = $('input:radio[name="clubId"]:checked').val();
		if (!clubId) {
			Modal.alert({msg:"请选择一条需要操作的数据"});
			return;
		}
		$('#catalog_list_modal').html("加载中...").load(ctx+'/commclub/modify/page?clubId='+clubId+'&r='+Math.random(),function(){
			$("#catalog_list_modal").modal();
		});
	}
	//翻页动作
	function queryformPage(){
		$("#lastQueryForm").submit();
	};
</script>
<#include "commons/end.ftl">