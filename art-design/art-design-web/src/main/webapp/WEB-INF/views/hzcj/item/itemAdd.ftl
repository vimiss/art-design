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
            <!-- 面包屑11div -->
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
                    	<form role="form" class="form-group" action="${ctx}/recruit/update" method="POST" id="editForm" >
							<input type="hidden" id="itemCloums" name="itemCloums" value="${itemCloums}" />
							<input type="hidden" id="itemCloumsName" name="itemCloumsName" value="" />
							<input type="hidden" name="addItem" value="${addItem?if_exists}" />
			<div class="container-fluid">
				<div class="row">
					 <div class="Mylist clearfix">
					 
					  <div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>项目栏目：</div>
							<div class="pull-left MylistRight">
							   <a class="BtnSouSu default-btn btn-blue" onclick="queryItemFenceList();" title="选择的内容将显示在APP端">选择栏目</a>
							   
							   <span id="columName"  style="color:#F00"></span>
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
						
					 <div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>产品名称：</div>
							<div class="pull-left MylistRight">
						         <select class="chosen-select AceSelect" name="prodTypeCode" id="prodTypeCode">
									<@option name="product_name_type_param" status="1" method="getProductAsOption" />
								</select>
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
						
						<div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>项目类型：</div>
							<div class="pull-left MylistRight">
							    <select class="chosen-select AceSelect" name="itemTypeCode" id="itemTypeCode">
											<@option name="item_type_param" status="1" type="2" />
										</select>
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
			
						<div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>项目标题：</div>
							<div class="pull-left MylistRight">
								<input type="text" class="InputName5" name="itemName" id="itemName"  maxlength="20"  placeholder="标题只能为20位以内汉字或字母">
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
						
						<div class="col-xs-12 MylistCol">
						<div class="pull-left MylistLeft"><span class="red">*</span>选择列表背景图片：</div>
							<div class="pull-left MylistRight">
								<span class="BtnSouSu default-btn btn-blue" id="openUpLoadItemListImg" >添加项目列表图片</span>
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
						
						<script type="text/plain" id="uploadItemListImg" style="display:none"></script>
						<div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>项目列表图片：</div>
							<div class="pull-left MylistRight">
								<img style="max-height: 60px; max-width: 250px;" id="itemListTitlePicBack" src="" onclick="showImg(this);" />
						         <input type="hidden"  id="itemListTitlePic"  name="itemListTitlePic" >
								<span id="itemListTitlePicErr" class="light-red"></span>
							</div>
						</div>
						
						<div class="col-xs-12 MylistCol">
						<div class="pull-left MylistLeft"><span class="red">*</span>选择详情背景图片：</div>
							<div class="pull-left MylistRight">
								<span class="BtnSouSu default-btn btn-blue" id="openUpLoadItemInfoImg" >添加项目详情图片</span>
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
						
						<script type="text/plain" id="uploadItemInfoImg" style="display:none"></script>
						<div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>项目详情图片：</div>
							<div class="pull-left MylistRight">
								<img style="max-height: 60px; max-width: 250px;" id="itemInfoTitlePicBack"  src="" onclick="showImg(this);" />
						         <input type="hidden"  id="itemInfoTitlePic"  name="itemInfoTitlePic" >
								<span id="itemInfoTitlePicErr"  id="itemInfoTitlePicErr" class="light-red"></span>
							</div>
						</div>
						
					    <div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>收益方式：</div>
							<div class="pull-left MylistRight">
							    <select class="chosen-select AceSelect" name="itemIncomeType" id="itemIncomeType" >
											<@option name="item_income_type_param" status="1" type="2"/>
										</select>
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
						
						  <div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>收益是否浮动：</div>
							<div class="pull-left MylistRight">
							    <select class="chosen-select AceSelect" name="itemDrift" id="itemDrift">
											<@option name="yes_no_type_param" status="1" type="2"/>
										</select>
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
						
						<div class="col-xs-12 MylistCol" id="itemMinFeeDiv">
							<div class="pull-left MylistLeft"><span class="red">*</span>最低收益(%)：</div>
							<div class="pull-left MylistRight">
							  <input type="text" class="InputName1" name="itemMinFee" id="itemMinFee"  maxlength="20"  placeholder="">
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
						
					  	<div class="col-xs-12 MylistCol" id="itemMaxFeeDiv">
							<div class="pull-left MylistLeft"><span class="red">*</span>最高收益(%)：</div>
							<div class="pull-left MylistRight">
								<input type="text" class="InputName1 amountLimitThree " name="itemMaxFee" id="itemMaxFee"  maxlength="20"  placeholder="">
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
						
						
						
					  	<div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>项目开始时间：</div>
							<div class="pull-left MylistRight">
							  <input id="itemBeginTimeStr" name="itemBeginTimeStr" class="Wdate WdateInput2" type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'%y-%M-%d',isShowClear:true,isShowOthers:false,qsEnabled:false})">
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
						
						<div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>项目额度：</div>
							<div class="pull-left MylistRight">
							  <input type="text" class="InputName1 totalQuotaCheck100 " name="itemTotalQuota" id="itemTotalQuota"  maxlength="20"  placeholder="">
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
						
						<div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>管理人：</div>
							<div class="pull-left MylistRight">
							  <input type="text" class="InputName5" name="itemKeeper" id="itemKeeper"  maxlength="20"  placeholder="">
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
						
						<div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>托管人：</div>
							<div class="pull-left MylistRight">
							  <input type="text" class="InputName5" name="itemTrustee" id="itemTrustee"  maxlength="20"  placeholder="">
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
						
						<div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>融资人：</div>
							<div class="pull-left MylistRight">
							  <input type="text" class="InputName5" name="itemFinancier" id="itemFinancier"  maxlength="20"  placeholder="">
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
						
						<div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>投资领域：</div>
							<div class="pull-left MylistRight">
							  <input type="text" class="InputName5" name="itemInvestArea" id="itemInvestArea"  maxlength="20"  placeholder="">
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
						
						<div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>资产标签：</div>
							<div class="pull-left MylistRight">
							  <input type="text" class="InputName5" name="itemAssetsTag" id="itemAssetsTag"  maxlength="20"  placeholder="">
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
						
						<div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>起投金额：</div>
							<div class="pull-left MylistRight">
							  <input type="text" class="InputName1 beginQuotaCheck100 amountLimitTwo " name="itemBeginQuota" id="itemBeginQuota"  maxlength="20"  placeholder="">
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
						
						<div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>递增金额：</div>
							<div class="pull-left MylistRight">
							  <input type="text" class="InputName1  incrementQuotaCheck100 amountLimitOne " name="itemIncrementQuota" id="itemIncrementQuota"  maxlength="20"  placeholder="">
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
						
						<div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>项目期限：</div>
							<div class="pull-left MylistRight">
							  <input type="text" class="InputName1" name="itemTerm" id="itemTerm"  maxlength="20"  placeholder="">
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
						
						 <div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>期限单位：</div>
							<div class="pull-left MylistRight">
							    <select class="chosen-select AceSelect " name="termUnit" id="termUnit">
											<@option name="term_unit_param" status="1" type="2" show="3,4" />
										</select>
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
						
						<div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>认购费率：</div>
							<div class="pull-left MylistRight">
							  <input type="text" class="InputName1" name="itemReviseFee" id="itemReviseFee"  maxlength="20"  placeholder="">
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
						
						<div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>风险等级：</div>
							<div class="pull-left MylistRight">
								<select class="chosen-select AceSelect " name="riskType" id="riskType">
											<@option name="risk_type_param" status="1" type="2"/>
								</select>
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
						
						<div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>开户名：</div>
							<div class="pull-left MylistRight">
							  <input type="text" class="InputName5" name="itemAccountName" id="itemAccountName"  maxlength="100"  placeholder="">
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
						
						<div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>募集银行：</div>
							<div class="pull-left MylistRight">
							  <input type="text" class="InputName5" name="itemRaiseBankName" id="itemRaiseBankName"  maxlength="100"  placeholder="">
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
						
						<div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>募集账号：</div>
							<div class="pull-left MylistRight">
							  <input type="text" class="InputName5" name="itemRaiseBankAccount" id="itemRaiseBankAccount"  maxlength="50"  placeholder="">
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
						
						<div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>打款备注：</div>
							<div class="pull-left MylistRight">
							  <input type="text" class="InputName5" name="itemPlayNotes" id="itemPlayNotes"  maxlength="100"  placeholder="">
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
						
						<div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>项目描述：</div>
							<div class="pull-left MylistRight">
							  <textarea  class="InputName2"  name="itemDesc" id="itemDesc"  maxlength="400"  placeholder="" ></textarea>
								<span id="itemDesc" class="light-red"></span>
							</div>
						</div>
						
				</div><!-- Mylist clearfix end -->
			</div><!-- row end -->
			</div><!-- container-fluid end -->
		</form>
                      <div class="text-center col-xs-6 col-xs-offset-3" style="margin-top: 20px;">
                        <a type="button" class="default-btn btn-orange marginLR20" href="javascript:;" onClick="ajaxSaveItem();">保 存</a>
                        <a type="button" class="default-btn btn-gray marginLR20" href="javascript:;" onClick="fanhui();">返 回</a>
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
<style>
input.error { border: 1px solid red; }
.error {
    overflow: hidden;
    padding: 0 8px 0 0;
    position: relative;
    color:red;
}
</style>

<div class="modal fade" id="itemFenceModal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"></div>



<script type="text/javascript" src="${ctx}/js/hzcj/item.js?v=${jsv}"></script>
<script type="text/javascript" src="${ctx}/js/hzcj/jquery.validation.js"></script>
<script type="text/javascript" src="${ctx}/js/hzcj/messages_cn.js"></script>


<script type="text/javascript" charset="utf-8" src="/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="/ueditor/ueditor.all.js"></script>
<script type="text/javascript" src="${ctx}/js/plugins/jquery.form/jquery.form.js"></script>
	<script type="text/javascript" >
	$(function(){
	        var v = $("#itemDrift").val();
	        if(v==""){
	        	   $("#itemMaxFeeDiv").hide();
	        	   $("#itemMinFeeDiv").hide();
	        	   $("#itemMaxFee").attr("name","itemMaxFeeh");
	        	   $("#itemMinFee").attr("name","itemMinFeeh");
	           }
	           
	           
	           $("#itemDrift").change(function(){
		         var v = $("#itemDrift").val();
	           if(v==1){
	        	   $("#itemMaxFeeDiv").hide();
	        	   $("#itemMinFeeDiv").hide();
	        	   $("#itemMaxFee").attr("name","itemMaxFeeh");
	        	   $("#itemMinFee").attr("name","itemMinFeeh");
	           }else{
	        	   $("#itemMaxFee").val('');
	        	   $("#itemMinFee").val('');
	        	   $("#itemMaxFeeDiv").show();
	        	   $("#itemMinFeeDiv").show();
	        	   $("#itemMaxFee").attr("name","itemMaxFee");
	        	   $("#itemMinFee").attr("name","itemMinFee");
	           }
	});
	           
	           
	           
		});
	
	
	function fanhui(){
		window.location.href=ctx+'/itemManagement/listItem';
	}
	
	
	
     //实例化项目列表上传图片窗口 
		var ue = UE.getEditor('uploadItemListImg',{
				disabledTableInTable:false,
				allowDivTransToP:false,
				wordCount:false,
				elementPathEnabled:false,
				zIndex:2147483647
			});	
			
	//点击项目列表上传图片按钮，打开上传窗口
	 	$("#openUpLoadItemListImg").click(function(){
			 	var dialog = ue.getDialog('insertimage');
					dialog.open();
					return ;
			 });
		
		//上传项目列表图片之后的回调函数
		ue.addListener("afterInsertImage",function(t,arg){
		      $.each(arg,function(n,value) {
		 		       	var itemListTitlePicBack = $("#itemListTitlePicBack").attr("src",value.src);
		 		       	$("#itemListTitlePicErr").html("");
		 		  });
		});
		
		///////////////////////////////////////////////////////////////////////////////////////////


        //实例化项目明细上传图片窗口 
		var ueInfo = UE.getEditor('uploadItemInfoImg',{
				disabledTableInTable:false,
				allowDivTransToP:false,
				wordCount:false,
				elementPathEnabled:false,
				zIndex:2147483647
			});	

		//点击项目明细上传图片按钮，打开上传窗口
	 	$("#openUpLoadItemInfoImg").click(function(){
	 		
			 	var dialog = ueInfo.getDialog('insertimage');
					dialog.open();
					return ;
			 });
		
	
		
		//上传项目明细图片之后的回调函数
		ueInfo.addListener("afterInsertImage",function(t,arg){
		      $.each(arg,function(n,value) {
		 		       	var titlePic = $("#itemInfoTitlePicBack").attr("src",value.src);
							  	$("#itemInfoTitlePicErr").html("");
		 		  });
		});
		
		////////////////////////////////////////////////////////////////////////////////////////////
		
		
	function queryItemFenceList(param) {
		$('#itemFenceModal').html("加载中...").load('${ctx}/itemManagement/goitemFence', param,function(res,sta,xhr){
			if(res){//判断是否正常返回了数据--登录拦截,res,sta,xhr
				$("#itemFenceModal").modal({
					keyboard:'false',//true是默认可是使用esc退出弹窗，false是不能使用esc退出
					show:'true',// bool值，立即调用show
					backdrop:'static'//static是只在弹窗内点击关闭按钮可以关闭
				});
			}
		});
	}
	
	
		

		</script>
		<!--body html end-->
		<#include "commons/end.ftl">