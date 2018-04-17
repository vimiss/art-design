<#assign ctx = request.contextPath>
<#include "hzcj/common/option.ftl">
<!-- validate -->
<script src="${ctx}/pg/nice-validator-1.0.10/dist/jquery.validator.js?local=zh-CN"></script>
        
<!-- 新建或编辑员工-->
<!-- Modal -->
<div class="modal-dialog" role="document" style="width: 810px;">
	<div class="modal-content">
	  <form   method="POST" id="addEmployeeForm" name="form1" >
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
			<#if account>
				<h4 class="modal-title" id="myModalLabel">编辑系统用户</h4>
			<#else>
				<h4 class="modal-title" id="myModalLabel">新增系统用户</h4>
			</#if>
		</div>
		<div class="modal-body">
					<input type="hidden" name="id" id="accountId" value="${account.id?if_exists}"/>
					<div class="container-fluid">
						<div class="row">
							<div class=" Mylist clearfix">
								<div class="col-xs-12 MylistCol">
									<div class="pull-left MylistLeft"><span class="red">*</span>用户名：</div>
									<div class="pull-left MylistRight">
										<input type="text" class="InputName1" name="name" id="name" value="${account.name?html}" maxlength="20" data-rule="用户名:required;remote[${ctx}/account/checkName, id]" placeholder="用户名" >
									</div>
								</div>
								<div class="col-xs-12 MylistCol">
									<div class="pull-left MylistLeft"><span class="red">*</span>手机号：</div>
									<div class="pull-left MylistRight">
										<input type="text" class="InputName1" name="mobile" id="mobile" value="${account.mobile?html}" maxlength="11" data-rule="手机号:required;mobile;remote[${ctx}/account/checkMobile, id]" placeholder="手机号" >
									</div>
								</div>
								<div class="col-xs-12 MylistCol">
									<div class="pull-left MylistLeft"><span class="red"></span>真实姓名：</div>
									<div class="pull-left MylistRight">
										<input type="text" class="InputName1" name="realName"  id="realName" value="${account.realName?html}" maxlength="8" data-rule="chinese;" data-ok="" placeholder="真实姓名" >
									</div>
								</div>
								<div class="col-xs-12 MylistCol">
									<div class="pull-left MylistLeft"><span class="red"></span>身份证号：</div>
									<div class="pull-left MylistRight">
										<input type="text" class="InputName1" name="idCardNo" id="idCardNo"   value="${account.idCardNo?html}" maxlength="18" data-rule="IDcard;remote[${ctx}/account/checkIdCardNo, id]" placeholder="身份证号" >
									</div>
								</div>
								
							</div>
						</div>
					</div>
						
		</div>
		<div class="modal-footer">
			<div class="text-center">
				<input type="submit" class="default-btn btn-orange noBorder marginLR20" value="保 存">
				<a type="button" data-dismiss="modal" class="default-btn btn-gray marginLR20">取 消</a>
			</div>
		</div>
	   </form>	
	</div>
</div>
<script type="text/javascript">
$(function(){
	var url;
	if($("#accountId").val()==""){
		url=ctx+'/account/addAccount';
	}else{
		url=ctx+'/account/updateAccount';
	}
 $('#addEmployeeForm').validator({
 	theme: "yellow_right_effect",
 	valid: function(form){
        //表单验证通过，提交表单到服务器
        $.ajax({
        type        : 'POST',
        url         : url,
        data        : $(form).serialize(),
        dataType    : 'json',
        encode      : true
	    }).done(function(json) {
	    	 if (json.result== 'success') {
	         	Modal.alert({msg:json.msg,okCallback:function(){
	         		location.reload();
	 				}
	 			});
	             return true;
	         } else {
	         	Modal.alert({msg:json.msg,okCallback:function(){
	         		location.reload();
	 				}
	 			});
	         	return false;
	         }
	    }).fail(function (jqXHR, textStatus) {
	     	Modal.alert({msg:"网络错误", okCallback:function(){
				location.reload();
			}});
	    });
    }
 });
	
});
</script>
