<#assign ctx = request.contextPath>
<#include "hzcj/common/option.ftl">
<!-- Modal -->
<div class="modal-dialog modal-lg1" role="document" style="width:1400px;">
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
			<h4 class="modal-title" id="myModalLabel">编辑收益基准</h4>
		</div>
		<div class="modal-body">
		<form id="form" name="form" method="post" enctype="multipart/form-data">
				<input type="hidden" name="itemId" value="${itemId}">
				<input type="hidden" name="perId" value="${perId}">
			<div class="container-fluid">
				<div class="row">
					 <div class=" Mylist clearfix">
						<div class="col-xs-12 MylistCol">
								<#if incomeList>
									<table   class="table table-striped table-bordered table-hover RtableStriped RtableStropSOS">
										<tr role="row">
											<th class="center">投资单元</th>
											<th class="center">投资期限</th>
											<th class="center">付息方式</th>
											<th class="center" colspan="100">投资描述</th>
										</tr>
										<#list incomeList as income>
										<tr >
											<td class="center">
												${income.incUnit}
											</td>
											<td class="center">
												${income.incTerm}
											</td>
											<td class="center">
												<#if income.incOrder!='0'>
												<@option name="pay_method_type_param" status="1" type="3" value="${income.payMethod}"/>
												</#if>
											</td>
											${income.incDesc}
										</tr>
										</#list>
									</table>		
									</#if>	
						</div>
						<div class="col-xs-12 upfile">选择文件上传，修改收益基准。( 注意事项：1、文件格式为：.xls或xlsx。)</div>						
						
						<div class="col-xs-3 upfile">
							<a class="default-btn btn-blue" href="${template_path}/syjzmb.xlsx" >模板下载</a>
						</div>
						<div class="col-xs-9 upfile">
							<span class="default-btn btn-blue uploadfileHover">选择文件</span>							
							<lable class="viewfile" id="viewfile"></lable>
				 			<input class="uploadfile" type="file" name="uploadfile" id="uploadfile" onchange="document.getElementById('viewfile').innerHTML=this.value.substring(12);"/>							
							<input type="hidden" id="itemIncomeEdit" name="itemIncomeEdit" value="${itemIncomeEdit?if_exists}"> 
						</div>
						
						
						
					</div>
				</div>
			</div>
		</form>
		</div>
		<div class="modal-footer">
			<div class="text-center">
				<a href="javascript:;" onclick="save();" class="default-btn btn-orange noBorder marginLR20">保 存</a>
				<a href="javascript:;" data-dismiss="modal" class="default-btn btn-gray marginLR20">取 消</a>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript" src="${ctx}/js/plugins/jquery.form/jquery.form.js"></script>
	<script >
	function save(){
		if($("#uploadfile").val()==""){
			Modal.alert({msg:"请选择文件"});
			return;
		}
		var wjmc = $("#uploadfile").val();
		var extName = wjmc.substring(wjmc.lastIndexOf("."),wjmc.length);
		if(extName != ".xls"&&extName != ".xlsx"){
			Modal.alert({msg:"请选择.xls格式或.xlsx格式的文件"});
			return;
		}
		 $("#form").ajaxSubmit({
		    url : ctx+"/itemIncome/modify",
			async : false,
			dataType:"json",
			success : function(result) {
				if (result.code == "0") {
					Modal.alert({msg:"修改成功", okCallback:function() {
						$("#periodEditModal").modal("hide");
						$("#periodEditModal").on("hidden.bs.modal", function() {
							$("#queryCommit").click();
						});
					}});
				} else {
					$("input[name='itemIncomeEdit']").val(result.value.newTokenName);
					Modal.alert({msg:result.msg});
				}
			}
		});
	}
	
	$('#uploadfile').on('change',function(e){ 
		console.log( e.currentTarget.files[0].name) 
	})
	$(".uploadfile").hover(function(){
		$(".uploadfileHover").css("background","-webkit-linear-gradient(#2e86cb 0%,#55b5ff 100%)");
	},function(){
		$(".uploadfileHover").css("background","-webkit-linear-gradient(#55b5ff 0%,#2e86cb 100%)");
	})
	</script>
