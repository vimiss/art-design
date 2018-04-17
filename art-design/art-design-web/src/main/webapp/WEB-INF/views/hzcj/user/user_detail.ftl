<!-- 用户详情 -->
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
								<!--<a href="#">UI &amp; Elements</a>--></li>
							<li><a href="${ctx}/jiaoxue">教学系统</a></li>
							<li class="active">配置列表</li>
						</ul>
						<!-- /.breadcrumb -->
						<!-- /section:basics/content.searchbox -->
					</div>
					<div class="page-content">
						<div class="row" style="margin-top:25px;">
							<input type="hidden" id="userIdHidden" value="${userId}" />
							<ul class="nav nav-tabs" id="userTab">
								<li class="active"><a href="#user_detail">账户详情</a></li>
								<li><a href="#user_acco">账号详情</a></li>
								<li><a href="#user_base_info">基础信息</a></li>
								<li><a href="#user_attr">属性详情</a></li>
								<li><a href="#user_cert">投资账号</a></li>
								<li><a href="#user_fp_arch">职业档案</a></li>
								<li><a href="#user_asset">资产证明</a></li>
								<li><a href="#user_fp_asset">理财师认证</a></li>
								<li><a href="#user_rela">关联理财师</a></li>
							</ul>
							<div class="tab-content">
								<div class="tab-pane active" id="user_detail">账户详情</div>
								<div class="tab-pane" id="user_acco">账号详情</div>
								<div class="tab-pane" id="user_base_info">基础信息</div>
								<div class="tab-pane" id="user_attr">属性详情</div>
								<div class="tab-pane" id="user_cert">投资账号</div>
								<div class="tab-pane" id="user_fp_arch">职业档案</div>
								<div class="tab-pane" id="user_asset">资产证明</div>
								<div class="tab-pane" id="user_fp_asset">理财师认证</div>
								<div class="tab-pane" id="user_rela">关联理财师</div>
							</div>
							<div class="row tc">
							<a href="javascript:;" id="backUserAccoList" onclick="backUserAccoList();" class="BtnNormalSu default-btn btn-blue">返 回</a>
						</div>
						</div>
					</div><!-- /.page-content -->
				</div>
			</div><!-- /.main-content -->
		</div><!-- /.main-container -->
<#include "commons/foot.ftl">
<!-- 课程包详情弹层 -->
<div class="modal fade" id="fp_org_add_modal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"></div>
<div class="modal fade" id="fp_org_mod_modal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"></div>
<script type="text/javascript">
	$(function(){
		//查询
		$("#queryCommit").click(function(){
			if(checkLoginStatus() == false) return;
			$("#pageNow").val(1);
			$("#queryForm").submit();
		});
		
		var tab_index = "#user_detail";
		queryUserInfo(tab_index, "${userId}");
		
		$('#userTab a').click(function (e) {
			e.preventDefault();
			
			var obj = e.target;
			var objHref = obj.href;
			var objId = objHref.substring(objHref.indexOf("#"));
			if (tab_index != objId) {
				queryUserInfo(objId, "${userId}");
				$(this).tab('show');
				tab_index = objId;
			}
		});
	});
	
	function queryUserInfo(objId, userId) {
		var url = "";
		if (objId == "#user_detail") {
			url= "${ctx}/user/info/detail";
		} else if (objId == "#user_acco") {
			url= "${ctx}/user/info/acco";
		} else if (objId == "#user_base_info") {
			url= "${ctx}/user/info/base";
		} else if (objId == "#user_attr") {
			url= "${ctx}/user/info/attr";
		} else if (objId == "#user_cert") {
			url= "${ctx}/user/info/cert";
		} else if (objId == "#user_fp_arch") {
			url= "${ctx}/user/info/fp/arch";
		} else if (objId == "#user_asset") {
			url= "${ctx}/user/info/asset";
		} else if (objId == "#user_fp_asset") {
			url= "${ctx}/user/info/fp/asset";
		} else if (objId == "#user_rela") {
			url= "${ctx}/user/info/rela";
		} else {
			Modal.alert({msg:"暂无当前页卡"});
			return;
		}
		$(objId).html("加载中...").load(url, "userId=" + userId);
	}
	
	function queryOrgAdd() {
		$('#fp_org_add_modal').html("加载中...").load('${ctx}/user/fp/org/add/page',function(res,sta,xhr){
			if(res){//判断是否正常返回了数据--登录拦截,res,sta,xhr
				$("#fp_org_add_modal").modal({
					keyboard:'false',//true是默认可是使用esc退出弹窗，false是不能使用esc退出
					show:'true',// bool值，立即调用show
					backdrop:'static'//static是只在弹窗内点击关闭按钮可以关闭
				});
			}
		});
	}
	
	function queryOrgMod() {
		var orgIdRadio = getRadioInput();
		if (!orgIdRadio) {
			Modal.alert({msg:"请选择一条需要操作的数据"});
			return;
		}
		
		$('#fp_org_mod_modal').html("加载中...").load('${ctx}/user/fp/org/mod/page?orgId='+orgIdRadio,function(res,sta,xhr){
			if(res){//判断是否正常返回了数据--登录拦截,res,sta,xhr
				$("#fp_org_mod_modal").modal({
					keyboard:'false',//true是默认可是使用esc退出弹窗，false是不能使用esc退出
					show:'true',// bool值，立即调用show
					backdrop:'static'//static是只在弹窗内点击关闭按钮可以关闭
				});
			}
		});
	}
	
	function backUserAccoList() {
		location.href = "${ctx}/user/acco/list";
	}
	
	function queryOrgDel() {
		var orgIdRadio = getRadioInput();
		if (!orgIdRadio) {
			Modal.alert({msg:"请选择一条需要操作的数据"});
			return;
		}
		
		Modal.confirm({msg:"确认要删除吗？", okCallback:function() {
			$(this).on("hidden.bs.modal", function() {
				$.ajax({
					type: "post",
					dataType: "json",
					data: {"orgId":orgIdRadio},
					url: "${ctx}/user/fp/org/del",
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
		var radioInput = $("input:radio:checked").val();
		return radioInput;
	}
	
	//翻页动作
	function queryformPage() {
		$("#lastQueryForm").submit();
	}
</script>
<#include "commons/end.ftl">