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
							<span class="menu-text">设置</span>
						</a>
						<b class="arrow"></b>
					</li>
					<#list settingResources as s>
						<li class="<#if s.url == settingResource.url>active</#if>">
							<a href="${ctx}${(s.url)}" >
								<i class="menu-icon fa fa-file-text"></i>
								<span class="menu-text">
									${s.name}
								</span>
							</a>
	
							<b class="arrow"></b>
						</li>
					</#list>
				</ul><!-- /.nav-list -->



				<!-- /section:basics/sidebar.layout.minimize -->
				<script type="text/javascript">
					try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}
				</script>
			</div>

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
							<li><a href="${ctx}/setting/index">设置</a></li>
							<li class="active">${settingResource.name}</li>
						</ul>
						<!-- /.breadcrumb -->
						<!-- /section:basics/content.searchbox -->
					</div>
              <div class="page-content">
                	<#if settingResource.url == "/setting/personalCenter">
                		<#include "setting/personalCenterInclude.ftl">
                	</#if>
                	<#if settingResource.url == "/setting/to_update_pwd">
                		<#include "setting/updatePwdInclude.ftl">
                	</#if>
              </div>
              <!-- /.page-content -->
            </div>
          </div>
          <!-- /.main-content -->
			
		</div><!-- /.main-container -->

		<#include "commons/foot.ftl">
		<#include "hzcj/setting/modalCommon.ftl">
		<script src="${ctx}/javascript/setting/personalCenter.js?version='20170413001'"></script>
		<script src="${ctx}/javascript/setting/updatePwd.js?version='20170413001'"></script>
		<!--body html end-->
		<#include "commons/end.ftl">
