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
						<form action="${ctx}/address/list" method="POST" id="queryForm">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->
								<div style="margin-top: 20px;">
									<label style="margin-left: 10px">用户账号：</label>
									<input type="text" name="accoUsername" value="${userAddressVo.accoUsername?if_exists}" class="InputName0" maxlength="20" />
									<span id="queryCommit" class="BtnSouSu default-btn btn-blue" onclick="file_Submit()">搜 索</span>
								</div>		
							</div>
								<div class="col-xs-12 ">
									<table class="table table-striped table-bordered table-hover RtableStriped RtableStropSOS">
										<thead>
										<tr role="row">
											<th class="center" >
												<span class="lbl" title="">序号</span>
											</th>
											<th class="center" >
												<span class="lbl" title="">用户账号</span>
											</th>
											<th class="center" >
												<span class="lbl" title="">收货人姓名</span>
											</th>
											<th class="center" >
												<span class="lbl" title="">手机号码</span>
											</th>
											<th class="center" >
												<span class="lbl" title="">地址详情</span>
											</th>
											<th class="center" >
												<span class="lbl" title="">邮政编码</span>
											</th>
											<th class="center" >
												地址标签
											</th>
											<th class="center" >
												是否默认地址
											</th>
											<th class="center" >
												创建时间
											</th>
										</tr>
										</thead>
										<tbody>
										<#if userAddressList>
											<#list userAddressList as address>
											<tr>
												<td class="center">
													<div>${address_index+1+(pageView.pageNow-1)*pageView.pageSize}</div>
												</td>
												<td class="center">
													<div>${address.accoUsername}</div>
												</td>
												<td class="center">
													<div>${address.addrUsername}</div>
												</td>
												<td class="center">
													<div>${address.addrMobile}</div>
												</td>
												<td class="center">
													<div>${address.addrAddress}</div>
												</td>
												<td class="center">
													<div>${address.addrPostcode}</div>
												</td>
												<td class="center">
													<div>${address.addrTag}</div>
												</td>
												<td class="center">
													<div>
													<@option name="yes_no_type_param" status="1" type="3" value="${address.addrDefault}"/>
													</div>
												</td>
												<td class="center">
													<div><@date_sub value='${address.addrTime?string("yyyy-MM-dd HH:mm:ss")}' /></div>
												</td>
											</tr>
											</#list>
										<#else>
											<tr align="center"><td colspan="9"><font color="red" size="4">没有查询到数据！</font></td></tr>
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

<form id="lastQueryForm" method="post" name="lastQueryForm" action="${ctx}/address/list">
 	<input type="hidden" id="oldPageNow" name="pageNow" value="${pageView.pageNow}" />
	<input type="hidden" name="accoUsername" value="${userAddressVo.accoUsername}" />
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
	//翻页动作
	function queryformPage(){
		$("#lastQueryForm").submit();
	};
</script>
<#include "commons/end.ftl">