<#assign ctx = request.contextPath>
<#include "hzcj/common/option.ftl">
<#include "hzcj/common/number.ftl">
<!-- Modal -->
<div class="modal-dialog modal-lg1" role="document">
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
			<h4 class="modal-title" id="myModalLabel">项目明细</h4>
		</div>
		<div class="modal-body">
		<form role="form" class="form-group" action="${ctx}/recruit/update" method="POST" id="editForm" >
			<div class="container-fluid">
				<div class="row">
					 <div class=" Mylist clearfix">
					 
					  <div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>产品名称：</div>
							<div class="pull-left MylistRight">
							    <select class="chosen-select AceSelect" name="prodTypeCode" id="prodTypeCode" disabled="disabled">
									<@option name="product_name_type_param" status="1" method="getProductAsOption"  value="${item.prodTypeCode}"/>
								</select>
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
					  <div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>项目类别：</div>
							<div class="pull-left MylistRight">
							    <select class="chosen-select AceSelect" name="itemTypeCode" disabled="disabled">
											<@option name="item_type_param" status="1" value="${item.itemTypeCode}"/>
										</select>
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
					 
					 
						<div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>项目标题：</div>
							<div class="pull-left MylistRight">
								<input type="text" class="InputName5" name="itemName" id="itemName"  value="${item.itemName}" disabled="disabled">
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
						
					    <div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>收益方式：</div>
							<div class="pull-left MylistRight">
							    <select class="chosen-select AceSelect" name="itemIncomeType" disabled="disabled">
												<@option name="item_income_type_param" status="1" value="${item.itemIncomeType}"/>
										</select>
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
						
						
					    <div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>收益是否浮动：</div>
							<div class="pull-left MylistRight">
							    <select class="chosen-select AceSelect" name="itemDrift"   id="itemDrift" disabled="disabled">
							         <@option name="yes_no_type_param" status="1" value="${item.itemDrift}" />
								</select>
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
						
					<div class="col-xs-12 MylistCol" id="itemMinFeeDiv">
							<div class="pull-left MylistLeft"><span class="red">*</span>最低收益(%)：</div>
							<div class="pull-left MylistRight">
							  <input type="text" class="InputName1" name="itemMinFee" id="itemMinFee"  value="${item.itemMinFee}" disabled="disabled">
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
						
					<div class="col-xs-12 MylistCol"  id="itemMaxFeeDiv">
							<div class="pull-left MylistLeft"><span class="red">*</span>最高收益(%)：</div>
							<div class="pull-left MylistRight">
							  <input type="text" class="InputName1" name="itemMaxFee" id="itemMaxFee" value="${item.itemMaxFee}" disabled="disabled">
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
						
					<div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>项目额度：</div>
							<div class="pull-left MylistRight">
							  <input type="text" class="InputName1" name="itemTotalQuota" id="itemTotalQuota" value="<@amount_sub amount='${item.itemTotalQuota}' type=2 />" disabled="disabled" />
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
						
						
					<div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>管理人：</div>
							<div class="pull-left MylistRight">
							  <input type="text" class="InputName5" name="itemKeeper" id="itemKeeper"  value="${item.itemKeeper}" disabled="disabled">
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
						
					<div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>托管人：</div>
							<div class="pull-left MylistRight">
							  <input type="text" class="InputName5" name="itemTrustee" id="itemTrustee" value="${item.itemTrustee}" disabled="disabled">
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
						
					<div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>融资人：</div>
							<div class="pull-left MylistRight">
							  <input type="text" class="InputName5" name="itemFinancier" id="itemFinancier" value="${item.itemFinancier}" disabled="disabled">
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
						
					<div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>投资领域：</div>
							<div class="pull-left MylistRight">
							  <input type="text" class="InputName5" name="itemInvestArea" id="itemInvestArea" value="${item.itemInvestArea}" disabled="disabled">
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
						
					<div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>资产标签：</div>
							<div class="pull-left MylistRight">
							  <input type="text" class="InputName5" name="itemAssetsTag" id="itemAssetsTag"   value="${item.itemAssetsTag}" disabled="disabled">
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
						
					<div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>起投金额：</div>
							<div class="pull-left MylistRight">
							  <input type="text" class="InputName1" name="itemBeginQuota" id="itemBeginQuota"   value="<@amount_sub amount='${item.itemBeginQuota}' type=2 />" disabled="disabled">
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
						
					<div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>递增金额：</div>
							<div class="pull-left MylistRight">
							  <input type="text" class="InputName1" name="itemIncrementQuota" id="itemIncrementQuota"  value="<@amount_sub amount='${item.itemIncrementQuota}' type=2 />" disabled="disabled">
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
						
					<div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>项目期限：</div>
							<div class="pull-left MylistRight">
							  <input type="text" class="InputName1" name="itemTerm" id="itemTerm"  value="${item.itemTerm}" disabled="disabled">
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
						
						<div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>期限单位：</div>
							<div class="pull-left MylistRight">
							   <select class="chosen-select AceSelect " name="termUnit" id="termUnit" disabled="disabled">
									<@option name="term_unit_param" status="1" value="${item.termUnit}" show="3,4" />
								</select>
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
						
					<div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>认购费率：</div>
							<div class="pull-left MylistRight">
							  <input type="text" class="InputName1" name="itemReviseFee" id="itemReviseFee" value="${item.itemReviseFee}" disabled="disabled">
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
						
					<div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>风险等级：</div>
							<div class="pull-left MylistRight">
								<select class="chosen-select AceSelect " name="riskType" id="riskType" disabled="disabled">
											<@option name="risk_type_param" status="1" value="${item.riskType}"/>
								</select>
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
						
					<div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>开户名：</div>
							<div class="pull-left MylistRight">
							  <input type="text" class="InputName5" name="itemAccountName" id="itemAccountName" value="${item.itemAccountName}" disabled="disabled">
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
						
					<div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>募集银行：</div>
							<div class="pull-left MylistRight">
							  <input type="text" class="InputName5" name="itemRaiseBankName" id="itemRaiseBankName"  value="${item.itemRaiseBankName}" disabled="disabled">
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
						
					<div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>募集账号：</div>
							<div class="pull-left MylistRight">
							  <input type="text" class="InputName5" name="itemRaiseBankAccount" id="itemRaiseBankAccount"  value="${item.itemRaiseBankAccount}" disabled="disabled">
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
						
					<div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>打款备注：</div>
							<div class="pull-left MylistRight">
							  <input type="text" class="InputName5" name="itemPlayNotes" id="itemPlayNotes"  value="${item.itemPlayNotes}" disabled="disabled">
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
						
						
					<div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>项目描述：</div>
							<div class="pull-left MylistRight">
							  <textarea  class="InputName2"  name="itemDesc" id="itemDesc"   disabled="disabled">${item.itemDesc} </textarea>
								<span id="itemDesc" class="light-red"></span>
							</div>
						</div>
						
						
						
					</div>
				</div>
			</div>
		</form>
		</div>
		<div class="modal-footer">
			<div class="text-center">
				<a href="javascript:;" data-dismiss="modal" class="default-btn btn-gray marginLR20">关 闭</a>
			</div>
		</div>
	</div>
</div>
	<script src="${ctx}/js/hzcj/item.js?v=${jsv}"></script>
<script type="text/javascript" >
	
	$(function(){
	        var v = $("#itemDrift").val();
	        if(v==1){
	        	   $("#itemMaxFeeDiv").hide();
	        	   $("#itemMinFeeDiv").hide();
	        	   $("#itemMaxFee").attr("name","itemMaxFeeh");
	        	   $("#itemMinFee").attr("name","itemMinFeeh");
	           }else{
	        	   $("#itemMaxFeeDiv").show();
	        	   $("#itemMinFeeDiv").show();
	        	   $("#itemMaxFee").attr("name","itemMaxFee");
	        	   $("#itemMinFee").attr("name","itemMinFee");
	           }
	        
		});
		</script>
	