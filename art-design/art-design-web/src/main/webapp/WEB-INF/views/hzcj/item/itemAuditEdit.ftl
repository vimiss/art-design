<#assign ctx = request.contextPath>
<#include "hzcj/common/option.ftl">
<!-- Modal -->
<div class="modal-dialog modal-lg1" role="document">
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
			<h4 class="modal-title" id="myModalLabel">项目审核</h4>
		</div>
		<div class="modal-body">
		<form role="form" class="form-group" action="${ctx}/itemAudit/modResultItem" method="POST" id="editForm" >
				<input type="hidden" name="itemId" value="${itemAndAudit.itemId}" />
				<input type="hidden" name="addItemAudit" value="${addItemAudit?if_exists}" />
				<input type="hidden" id="auditUserId" name="auditUserId" value="${currentAccount.id }">
				<input type="hidden" id="auditUserName" name="auditUserName" value="${currentAccount.name }">
			<div class="container-fluid">
				<div class="row">
					 <div class=" Mylist clearfix">

						<div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft">项目标题：</div>
							<div class="pull-left MylistRight">
								<a href="#"  style="color: #3eafe0" onclick="openItemInfo(${itemAndAudit.itemId});" title="查看项目明细">
									${itemAndAudit.itemName} 
								</a>	
							<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
						
					  <div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>审核结果：</div>
							<div class="pull-left MylistRight">
							  <select class="chosen-select AceSelect" name="auditResult" id="auditResult" >
							               <@option name="result_type_param" status="1" type="2" value="${itemAndAudit.auditResult}"/>
							  </select>
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
						
						<div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>审核意见：</div>
							<div class="pull-left MylistRight">
							  <input type="text" class="InputTexy1 InputTexy2" name="auditOpinion" id="auditOpinion"  maxlength="50"  placeholder="限50字符(中文字符长度为2)" >
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
						
      <div class="modal-footer">
			<div class="text-center">
				<a style="cursor:pointer;" onclick="saveItemAudit();" class="default-btn btn-orange marginLR20 mt10">提 交</a>
				<a type="button" data-dismiss="modal" class="default-btn btn-gray marginLR20 mt10">取 消</a>
			</div>
		</div>
						
</div>	<!--隐藏结束-->			
				</div>
			</div>
		</form>
		</div>
		
	</div>
</div>
<style>
input.error { border: 1px solid red; }
.error {
    overflow: hidden;
    padding: 0 8px 0 0;
    position: relative;
    color:red;
}
</style>

	<script src="${ctx}/js/hzcj/itemcheck.js?v=${jsv}"></script>
