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
									<strong class="InputStrong"><span style="color:red">*</span>题项的编码：</strong>
								</div>
								<div class="pull-left MylistRight">
										<input type="hidden" id="librId" name="librId" value="${librId}">
										<input type="text" id="librCode" name="librCode" class="InputName1"  maxlength="1"  >
										<span id="checkLibrCode" class="red" style="margin-left: 20px;"></span>
								</div>
							</div>
							 <div class="col-xs-12 MylistCol">
								<div class="pull-left MylistLeft">
									<strong class="InputStrong"><span style="color:red">*</span>题项的内容：</strong>
								</div>
								<div class="pull-left MylistRight">
									<input name="optionContent" id="optionContent" type="text" class="InputName1"  maxlength="100"  placeholder="限100字符(中文字符长度为2)">
									<span id="checkOptionContent" class="red" style="margin-left: 20px;"></span>
								</div>
							</div>
							 <div class="col-xs-12 MylistCol">
								<div class="pull-left MylistLeft">
									<strong class="InputStrong"><span style="color:red">*</span>题项的分值：</strong>
								</div>
								<div class="pull-left MylistRight">
									<input name="optionMark" id="optionMark" type="text" class="InputName1"  maxlength="2"  placeholder="1~99之间的数字">
									<span id="checkOptionMark" class="red" style="margin-left: 20px;"></span>
								</div>
							</div>
								<input type="hidden" name="addOption" value="${addOption?if_exists}" />
	                      	<!-- 文本内容结束 -->
	                  </form>
                      <div class="text-center col-xs-6 col-xs-offset-3" style="margin-top: 20px;">
                        <a type="button" class="default-btn btn-orange marginLR20" href="javascript:;" onClick="checkPersonalCenterForm()">保 存</a>
                        <a type="button" class="default-btn btn-gray marginLR20" href="javascript:;" onClick="fanhui()">返 回</a>
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
		<#include "hzcj/setting/modalCommon.ftl">
	<script type="text/javascript" charset="utf-8" src="${ctx}/javascript/hzcj/len.js"></script>
	<script >
	function checkPersonalCenterForm(){
		if($("#librCode").val()==""){
			$("#checkLibrCode").html("<font>请输入题项的编码!</font>");
			return;
		}else{
			$("#checkLibrCode").empty();
		}
		var Reg = /^.{1,100}$/g;
		var optionContent = $("#optionContent").val();
		if(!Reg.test(optionContent)||len(optionContent)>100){
			$("#checkOptionContent").html("<font>限100字符(中文字符长度为2)!</font>");
			return;
		}else{
			$("#checkOptionContent").empty();
		}
		var Reg_mark = /^[1-9]\d?$/g;
		var optionMark = $("#optionMark").val();
		if(!Reg_mark.test(optionMark)){
			$("#checkOptionMark").html("<font>1~99之间的数字!</font>");
			return;
		}else{
			$("#checkOptionMark").empty();
		}
		add();
	}
	function fanhui(){
		$("#msgpushForm").attr("action","${ctx}/question/token/library/modify/page?id="+$("#librId").val());
		$("#msgpushForm").submit();
	}
	function add(){
		$.ajax({
			type : "POST",
			url : ctx + "/question/token/option/add",
			data : $("#msgpushForm").serialize(),
			async : false,
			dataType:"json",
			error : function(request) {
			},
			success:function(data) {
				if(data.result == 'success'){
					Modal.alert({msg:"题项新增成功",okCallback:function(){
						window.location.href=ctx+'/question/token/library/modify/page?id='+$("#librId").val();
					}
				});
				}else{
					Modal.alert({msg:data.message});
				}
			}
		});
	}
	</script>
		<!--body html end-->
		<#include "commons/end.ftl">