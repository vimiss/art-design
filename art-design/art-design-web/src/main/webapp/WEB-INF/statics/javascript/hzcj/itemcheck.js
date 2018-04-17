var va ;
$(function(){
	$("#queryCommit").click(function(){
		$("#pageNow").val(1);
		$("#queryForm").submit();
	});
	
	$("#flashPage").click(function(){
		$("#queryForm").submit();
	});
	
	va=  $("#editForm").validate({
		 rules:{
				auditResult:{
					required:true,
				},    
				auditOpinion:{
					required:true,
				}
		 },
		   messages:{
			   	auditResult:{
	            	required:"请选择审核结果",
	            } ,
	            auditOpinion:{
					required:"必填",
				}
		   }
	});
	
	
});

//翻页动作
function queryformPage() {
	$("#lastQueryForm").submit();
}

//清除缓存
function qingchu(){
	$.ajaxSetup ({
	   cache: false //close AJAX cache
	});
}

function goItemAudit(){
	var itemId = getItemAuditRadio();
	if (!itemId) {
		Modal.alert({msg:"请选择一条需要操作的数据"});
		return;
	}
	$('#auditModalFade').html("加载中...").load(ctx +'/itemAudit/token/add/page?itemId='+itemId+'&r='+Math.random(),function(){
		$("#auditModalFade").modal();
   });
}
function getItemAuditRadio() {
	var itemAuditRadio = $('input:radio[name="itemAuditRadio"]:checked').val();
	return itemAuditRadio;
}

function saveItemAudit(){
	if(!$("#editForm").valid()){
		return;
	}
	$.ajax({
		type : "POST",
		url : ctx + "/itemAudit/token/addItemAudit",
		data : $("#editForm").serialize(),
		async : false,
		dataType:"json",
		success : function(result) {
			if(result.code==0){
				Modal.alert({msg:"提交成功", okCallback:function() {
					$("#queryCommit").click();
				}});
			}else{
				$("input[name='addItemAudit']").val(result.value.newTokenName);
				alert(result.msg);
			}
		}
	});
}

function openItemInfo(itemId){
	$('#itemInfoModal').html("加载中...").load(ctx + '/itemManagement/openItemInfo?itemId='+itemId+'&r='+Math.random(),function(){
			$("#itemInfoModal").modal();
	});
}

