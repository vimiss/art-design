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
									<strong class="InputStrong"><span style="color:red">*</span>题目名称：</strong>
								</div>
								<div class="pull-left MylistRight">
										<input type="hidden" id="quesId" name="quesId" value="${quesId}">
										<input type="text" id="librName" name="librName" class="InputName1"  maxlength="200"  placeholder="限200字符(中文字符长度为2)">
										<span id="checkLibrName" class="red" style="margin-left: 20px;"></span>
								</div>
							</div>
							 <div class="col-xs-12 MylistCol">
								<div class="pull-left MylistLeft">
									<strong class="InputStrong">题目描述：</strong>
								</div>
								<div class="pull-left MylistRight">
									<input name="librDesc" id="librDesc" type="text" class="InputName1"   maxlength="500"  placeholder="限500字符(中文字符长度为2)">
									<span id="checkLibrDesc" class="red" style="margin-left: 20px;"></span>
								</div>
							</div>
							<input type="hidden" name="addLibrary" value="${addLibrary?if_exists}" />
	                      	<!-- 文本内容结束 -->
	                  </form>
                      <div class="text-center col-xs-6 col-xs-offset-3" style="margin-top: 20px;">
                        <a class="default-btn btn-orange marginLR20" href="javascript:;" onClick="checkPersonalCenterForm()">保 存</a>
                        <a class="default-btn btn-gray marginLR20" href="javascript:;" onClick="fanhui()">返 回</a>
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
		var Reg = /^.{1,200}$/g;
		var librName = $("#librName").val();
		if(!Reg.test(librName)||len(librName)>200){
			$("#checkLibrName").html("<font>限200字符(中文字符长度为2)!</font>");
			return;
		}else{
			$("#checkLibrName").empty();
		}
		var Reg1 = /^.{1,500}$/g;
		var librDesc = $("#librDesc").val();
		if(librDesc!=""&&(!Reg1.test(librDesc)||len(librDesc)>500)){
			$("#checkLibrDesc").html("<font>限500字符(中文字符长度为2)!</font>");
			return;
		}else{
			$("#checkLibrDesc").empty();
		}
		add();
	}
	function fanhui(){
		$("#msgpushForm").attr("action","${ctx}/question/token/modify/page?id="+$("#quesId").val());
		$("#msgpushForm").submit();
	}
	function add(){
		$.ajax({
			type : "POST",
			url : ctx + "/question/token/library/add",
			data : $("#msgpushForm").serialize(),
			async : false,
			dataType:"json",
			error : function(request) {
			},
			success:function(data) {
				if(data.result == 'success'){
					Modal.alert({msg:"题目新增成功",okCallback:function(){
						window.location.href=ctx+'/question/token/modify/page?id='+$("#quesId").val();
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