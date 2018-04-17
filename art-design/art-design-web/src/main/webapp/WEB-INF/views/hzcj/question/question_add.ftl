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
									<strong class="InputStrong"><span style="color:red">*</span>问卷名称：</strong>
								</div>
								<div class="pull-left MylistRight">
										<input type="text" id="quesName" name="quesName" style="width:200px;" class="InputName1"  maxlength="20"  placeholder="限20字符(中文字符长度为2)">
										<span id="checkQuesName" class="red" style="margin-left: 20px;"></span>
								</div>
							</div>
							 <div class="col-xs-12 MylistCol">
								<div class="pull-left MylistLeft">
									<strong class="InputStrong"><span style="color:red">*</span>问卷类别：</strong>
								</div>
								<div class="pull-left MylistRight">
									<select class="chosen-select AceSelect" id="quesType" name="quesType" >
										<@option name="question_type_param" status="1" value="${question.quesType}"/>
										</select>
										<span id="checkQuesType" class="red" style="margin-left: 20px;"></span>
								</div>
							</div>
							<div class="col-xs-12 MylistCol">
								<div class="pull-left MylistLeft">
									<strong class="InputStrong"><span style="color:red">*</span>发布状态：</strong>
								</div>
								<div class="pull-left MylistRight">
										<select class="chosen-select AceSelect" id="quesState" name="quesState" >
											<option value="0" selected>否</option>
										</select>
								</div>
							</div>
							<input type="hidden" name="addQuestion" value="${addQuestion?if_exists}" />
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
		var Reg = /^.{1,20}$/g;
		var quesName = $("#quesName").val();
		if(!Reg.test(quesName)||len(quesName)>20){
			$("#checkQuesName").html("<font>限20字符(中文字符长度为2)</font>");
			return;
		}else{
			$("#checkQuesName").empty();
		}
		if($("#quesType").val()==""){
			$("#checkQuesType").html("<font>请选择问卷类别</font>");
			return;
		}else{
			$("#checkQuesType").empty();
		}
		add();
	}
	function fanhui(){
			window.location.href=ctx+'/question/list';
	}
	function add(){
		$.ajax({
			type : "POST",
			url : ctx + "/question/token/add",
			data : $("#msgpushForm").serialize(),
			async : false,
			dataType:"json",
			error : function(request) {
			},
			success:function(data) {
				if(data.result == 'success'){
					Modal.alert({msg:"问卷新增成功",okCallback:function(){
						window.location.href=ctx+'/question/list';
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