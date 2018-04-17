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
					</div>
              <div class="page-content">
                	<div class="row" style="padding-top: 10px;">
                  <div class="col-xs-12">
                    <!-- PAGE CONTENT BEGINS -->
                    <div class=" Mylist clearfix">
                    	<form id="msgpushForm" name="msgpushForm" method="post">
	                      	<!-- 文本内容开始 -->
	                      	<div class="col-xs-12 MylistCol">
								<div class="pull-left MylistLeft">
									<strong class="InputStrong"><span style="color:red">*</span>栏目名称：</strong>
								</div>
								<div class="pull-left MylistRight">
										<input type="text" id="fenceName" name="fenceName" class="InputName0"  value="${itemFence.fenceName}"  maxlength="30"  placeholder="限30字符(中文字符长度为2)">
										<span id="checkFenceName" class="red" style="margin-left: 20px;"></span>
								</div>
							</div>
							<div class="col-xs-12 MylistCol">
								<div class="pull-left MylistLeft">
									<strong class="InputStrong"><span style="color:red">*</span>栏目编码：</strong>
								</div>
								<div class="pull-left MylistRight">
										<input type="text" id="fenceTableCode" name="fenceTableCode" class="InputName0"  maxlength="30"  placeholder="限30个英文单词">
										<span id="checkFenceTableCode" class="red" style="margin-left: 20px;"></span>
								</div>
							</div>
							<div class="col-xs-12 MylistCol">
								<div class="pull-left MylistLeft">
									<strong class="InputStrong"><span style="color:red">*</span>发现栏目：</strong>
								</div>
								<div class="pull-left MylistRight">
										<select class="chosen-select AceSelect" id="fenceFlag" name="fenceFlag" >
											<@option name="yes_no_type_param" status="1" type="2"/>
										</select>
										<span id="checkFenceFlag" class="red" style="margin-left: 20px;"></span>
								</div>
							</div>
							<input type="hidden" name="addItemFence" value="${addItemFence?if_exists}">
	                      	<!-- 文本内容结束 -->
	                  </form>
                      <div class="text-center col-xs-6 col-xs-offset-3" style="margin-top: 20px;">
                        <a class="default-btn btn-orange marginLR20" href="javascript:;" onClick="checkPersonalCenterForm();">保 存</a>
                        <a class="default-btn btn-gray marginLR20" href="javascript:;" onClick="fanhui();">返 回</a>
                      </div>
                    </div>
                    <!-- PAGE CONTENT ENDS -->
                  </div>
                  <!-- /.col -->
                </div>
                <!-- /.row -->
              </div>
              <!-- /.page-content -->
            </div>
          </div>
          <!-- /.main-content -->
			
		</div><!-- /.main-container -->

		<#include "commons/foot.ftl">
	<script type="text/javascript" charset="utf-8" src="${ctx}/javascript/hzcj/len.js"></script>
	<script >
	function checkPersonalCenterForm(){
		var Reg = /^.{1,30}$/g;
		var fenceName = $("#fenceName").val();
		if(!Reg.test(fenceName)||len(fenceName)>30){
			$("#checkFenceName").html("<font>限30字符(中文字符长度为2)</font>");
			return;
		}else{
			$("#checkFenceName").empty();
		}
		var Reg_desc = /^.{1,30}$/g;
		var fenceTableCode = $("#fenceTableCode").val();
		if(!Reg_desc.test(fenceTableCode)||len(fenceTableCode)>30){
			$("#checkFenceTableCode").html("<font>限30字符(中文字符长度为2)</font>");
			return;
		}else{
			$("#checkFenceTableCode").empty();
		}
		if($("#fenceFlag").val()==""){
			$("#checkFenceFlag").html("<font>请选择是否为发现栏目</font>");
			return;
		}else{
			$("#checkFenceFlag").empty();
		}
		add();
	}
	function fanhui(){
		window.location.href=ctx+'/itemFence/list';
	}
	function add(){
		$.ajax({
			type : "POST",
			url : ctx + "/itemFence/token/add",
			data : $("#msgpushForm").serialize(),
			async : false,
			dataType:"json",
			success:function(result) {
				if(result.code == "0"){
					Modal.alert({msg:"栏目新增成功",okCallback:function(){
						window.location.href=ctx+'/itemFence/list';
					}
				});
				}else{
					$("input[name='addItemFence']").val(result.value.newTokenName);
					Modal.alert({msg:result.msg});
				}
			}
		});
	}
	</script>
		<!--body html end-->
		<#include "commons/end.ftl">