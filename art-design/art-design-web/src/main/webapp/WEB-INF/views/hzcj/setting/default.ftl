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
					<li class="active">
						<a href="${ctx}/setting/index">
							<i class="menu-icon fa fa-home"></i>
							<span class="menu-text"> 设置</span>
						</a>
						<b class="arrow"></b>
					</li>

					<li class="">
						<a href="${ctx}/setting/personalCenter" >
							<i class="menu-icon fa fa-file-text"></i>
							<span class="menu-text">
								个人中心
							</span>
							<!--<b class="arrow fa fa-angle-down"></b>-->
						</a>
						<b class="arrow"></b>
					</li>

                    <li class="">
						<a href="${ctx}/setting/to_update_pwd" >
							<i class="menu-icon fa fa-file-text"></i>
							<span class="menu-text">
								修改密码
							</span>
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
							<li><a href="${ctx}/index">首页</a>
								<!--<a href="#">UI &amp; Elements</a>--></li>
							<li><a href="${ctx}/setting/index">设置</a></li>
						</ul>
						<!-- /.breadcrumb -->
						<!-- /section:basics/content.searchbox -->
					</div>
					<div class="page-content ">
						<div class="row" style="padding-top: 10px;">
						<!-- PAGE CONTENT BEGINS -->
								<div class=" clearfix" style="background: #e9f3f6; padding: 75px 0">
									<div class="col-xs-10 col-xs-offset-2">
										<!-- PAGE CONTENT BEGINS -->
										<div class="col-md-6 col-xs-12 ResourceDiv" >
											<div class="ResouTopDiv"><img src="${ctx}/img/icon_gonggong.png"></div>
											<div class="ResouConDiv">个人中心</div>
											<div class="ResouBotDiv">
												<a href="${ctx}/setting/personalCenter" class="BtnSouSu default-btn btn-blue">查 看</a>
											</div>
										</div>
										<div class="col-md-6 col-xs-12 ResourceDiv">
											<div class="ResouTopDiv"><img src="${ctx}/img/icon_xiaoben.png"></div>
											<div class="ResouConDiv">修改密码</div>
											<div class="ResouBotDiv">
												<a href="${ctx}/setting/to_update_pwd" class="BtnSouSu default-btn btn-blue">查 看</a>
											</div>
										</div>
										<!-- PAGE CONTENT ENDS -->
									</div>
								</div>
								<!-- PAGE CONTENT ENDS --> 
						</div><!-- /.row -->
					</div><!-- /.page-content -->
				</div>
			</div><!-- /.main-content -->
		</div><!-- /.main-container -->
		
		
<#include "commons/foot.ftl">
<#include "commons/end.ftl">