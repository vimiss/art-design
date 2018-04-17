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
                    	<form id="productAuditForm" name="productAuditForm" method="post">
	                      	<!-- 文本内容开始 -->
	                      	<div class="col-xs-12 MylistCol">
								<div class="pull-left MylistLeft">
									<strong class="InputStrong"><span style="color:red">*</span>产品名称：</strong>
								</div>
								<div class="pull-left MylistRight">
										<input type="text" id="prodName" name="prodName" style="width:200px;" value="${product.prodName}" disabled="disabled" class="InputTexy1 InputTexy2"  maxlength="100"  >
								</div>
							</div>
							 <div class="col-xs-12 MylistCol">
								<div class="pull-left MylistLeft">
									<strong class="InputStrong"><span style="color:red">*</span>产品类别：</strong>
								</div>
								<div class="pull-left MylistRight">
									<@option name="product_type_param" type="3" status="1" value="${product.prodTypeCode}"/>
								</div>
							</div>
							<div class="col-xs-12 MylistCol">
								<div class="pull-left MylistLeft">
									<strong class="InputStrong"><span style="color:red">*</span>产品描述：</strong>
								</div>
								<div class="pull-left MylistRight">
										<input type="text" id="prodDesc" name="prodDesc" value="${product.prodDesc}" disabled="disabled" style="width:200px;" class="InputTexy1 InputTexy2"  maxlength="500"  placeholder="限500字符(中文字符长度为2)">
								</div>
							</div>
							<div class="col-xs-12 MylistCol">
								<div class="pull-left MylistLeft">
									<strong class="InputStrong"><span style="color:red">*</span>创建时间：</strong>
								</div>
								<div class="pull-left MylistRight">
										<input id="prodTime" name="prodTime" value="${product.prodTime?string('yyyy-MM-dd HH:mm:ss')}" disabled="disabled" style="width:180px;" class="Wdate WdateInput1" type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true,isShowOthers:false,qsEnabled:false})">
								</div>
							</div>
							<div class="col-xs-12 MylistCol">
								<div class="pull-left MylistLeft">
									<strong class="InputStrong"><span style="color:red">*</span>审核结果：</strong>
								</div>
								<div class="pull-left MylistRight">
									<select class="chosen-select AceSelect" id="auditResult" name="auditResult" >
											<@option name="result_type_param" status="1" value="${productAuditVo.auditResult}" />
									</select>
									<span id="checkAuditResult" class="red" style="margin-left: 20px;"></span>
								</div>
							</div>
							<div class="col-xs-12 MylistCol">
								<div class="pull-left MylistLeft">
									<strong class="InputStrong"><span style="color:red">*</span>审核意见：</strong>
								</div>
								<div class="pull-left MylistRight">
										<input type="text" id="auditOpinion" name="auditOpinion" value="${productAuditVo.auditOpinion }" style="width:200px;" class="InputTexy1 InputTexy2"  maxlength="50"  placeholder="限50字符(中文字符长度为2)">
										<span id="checkAuditOpinion" class="red" style="margin-left: 20px;"></span>
								</div>
							</div>
							<div class="col-xs-12 MylistCol">
								<div class="pull-left MylistLeft">
									<strong class="InputStrong"><span style="color:red">*</span>审核时间：</strong>
								</div>
								<div class="pull-left MylistRight">
										<input id="auditTime" name="auditTime" value="${productAuditVo.auditTime?string('yyyy-MM-dd HH:mm:ss') }" style="width:180px;" class="Wdate WdateInput1" type="text"  onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true,isShowOthers:false,qsEnabled:false})">
										<span id="checkAuditTime" class="red" style="margin-left: 20px;"></span>
								</div>
							</div>
							<!-- 隐藏审核id判断是添加或修改 -->
							<input type="hidden" id="auditId" name="auditId" value="${productAuditVo.auditId}">
							<!-- 隐藏产品id -->
							<input type="hidden" id="prodId" name="prodId" value="${product.prodId}">
							<!-- 隐藏当前用户id -->
							<input type="hidden" id="auditUserId" name="auditUserId" value="${currentAccount.id }">
							<!-- 隐藏当前用户名称 -->
							<input type="hidden" id="auditUserName" name="auditUserName" value="${currentAccount.name }">
							<!-- 隐藏token的标识,防止重复提交 -->
							<input type="hidden" name="addProductAudit" value="${addProductAudit?if_exists}">
	                      	<!-- 文本内容结束 -->
	                  </form>
                      <div class="text-center col-xs-6 col-xs-offset-3" style="margin-top: 20px;">
                        <a class="default-btn btn-orange marginLR20" href="javascript:;" onClick="checkPersonalCenterForm();">提 交</a>
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
		<#include "setting/modalCommon.ftl">
	<script type="text/javascript" charset="utf-8" src="${ctx}/javascript/hzcj/len.js"></script>
	<script >
	function checkPersonalCenterForm(){
		if($("#auditResult").val()==""){
			$("#checkAuditResult").html("<font>请选择审核结果</font>");
			return;
		}else{
			$("#checkAuditResult").empty();
		}
		var Reg_desc = /^.{1,50}$/g;
		var auditOpinion = $("#auditOpinion").val();
		if(!Reg_desc.test(auditOpinion)||len(auditOpinion)>50){
			$("#checkAuditOpinion").html("<font>限50字符(中文字符长度为2)</font>");
			return;
		}else{
			$("#checkAuditOpinion").empty();
		}
		var auditTime= $("#auditTime").val();
		if(!auditTime){
			$("#checkAuditTime").html("<font>审核时间不能为空</font>");
			return;
		}else{
			$("#checkAuditTime").empty();
		}
		add();
	}
	function fanhui(){
		window.location.href=ctx+'/product/list';
	}
	function add(){
		$.ajax({
			type : "POST",
			url : ctx + "/productAudit/token/add",
			data : $("#productAuditForm").serialize(),
			async : false,
			dataType:"json",
			success:function(result) {
				if(result.code == "0"){
					Modal.alert({msg:"产品审核修改成功",okCallback:function(){
						window.location.href=ctx+'/product/list';
					}
				});
				}else{
					$("input[name='addProductAudit']").val(result.value.newTokenName);
					Modal.alert({msg:result.msg});
				}
			}
		});
	}
	</script>
		<!--body html end-->
		<#include "commons/end.ftl">