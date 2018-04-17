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
						<a href="${ctx}/setting/index">
							<i class="menu-icon fa fa-home"></i>
							<span class="menu-text">设置</span>
						</a>
						<b class="arrow"></b>
					</li>
                    <#list settingResources as s>
						<li class="<#if s.url == settingResource.url>active</#if>">
							<a href="${ctx}${(s.url)!}" >
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
                	<#include "hzcj/setting/personalCenterInclude.ftl">
              </div>
              <!-- /.page-content -->
            </div>
          </div>
          <!-- /.main-content -->
			
		</div><!-- /.main-container -->

		<#include "commons/foot.ftl">
		<#include "hzcj/setting/modalCommon.ftl">
		<!--body html end-->
		<#include "commons/end.ftl">
		<script >
		$(function(){
			//所有a标签点击时触发
			$("a").click(function(){
				if(checkLoginStatus() == false) return;
			})
		})

		function checkPersonalCenterForm(){
			var nameReg = /^([\u4E00-\u9FA5|a-zA-Z]){2,20}$/g;
			var name = $("#accountName").val();
			var mobile = $("#mobile").val();
			/*if(!nameReg.test(name)){
				$("#checkaccountName").html("<font>限中文或字母(2-20位)!</font>");
				return;
			}*/
			if(mobile!=""&&!isMobile(mobile)){
				$("#checkMobile").html("<font>手机号不符合格式!</font>");
				return;
			}
			checkPersonalCenter();
		}

		/**
		*规则：	移动: 前3位 134-139  或者 150-159   一共11位
		*		联通: 前3位 130-133  或者 150-159   一共11位
		* 		新增18号段。17号段，14号段
		*	     这是最新规则
		*功能：	检查参数的电话号码格式是否正确（仅手机号）
		*参数：	str：	字符串
		*返回：	如果通过验证返回true,否则返回false
		*/
		function isMobile(str){   
			var regu =/^1[3|4|5|7|8][0-9]{9}$/;	
			var reg = new RegExp(regu);	
			if (reg.test(str)) {	
				return true;	
			}else{	
				return false;
			}
		}

		function checkPersonalCenter(){
			$.ajax({
				type : "POST",
				url : ctx + "/setting/check_personal_center",
				data : $("#personalCenterForm").serialize(),
				async : false,
				dataType:"json",
				error : function(request) {
				},
				success:function(data) {
					if(data.result == 'success'){
						$("#updateNameOkDiv").html("修改后将重新登录，确定修改吗？");
						$("#updateNameAndMobile_modal_ok").modal({
							keyboard:'false',//true是默认可是使用esc退出弹窗，false是不能使用esc退出
							show:'true',// bool值，立即调用show
							backdrop:'static'//static是只在弹窗内点击关闭按钮可以关闭
						});
					}else{
						$("#personalCenterOkDiv").html(data.message);
						$("#personalCenter_operate_modal_ok").modal({
							keyboard:'false',//true是默认可是使用esc退出弹窗，false是不能使用esc退出
							show:'true',// bool值，立即调用show
							backdrop:'static'//static是只在弹窗内点击关闭按钮可以关闭
						});
					}
				}
			});
		}

		function updatePersonalCenter(){
			$("#personalCenterForm").submit();
		}
		</script>
		