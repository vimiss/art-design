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
			 perPlanQuota:{
					required:true,
					digits:true
				},    
				perTotalPeopleNum:{
					required:true,
					digits:true
				},
				perOpenTimeStr:{
					required:true
				},
				perOverTimeStr:{
					required:true
				}
		 },
		   messages:{
			   perPlanQuota:{
	            	required:"必填",
	            		digits:"输入正整数"
	            } ,
	            perTotalPeopleNum:{
					 required:"必填",
					 digits:"输入正整数"
				 },  
				 perOpenTimeStr:{
	            	required:"必填"
	            },  
	            perOverTimeStr:{
	            	required:"必填"
	            }
		   }
	});
	var add=  $("#addForm").validate({
		rules:{
			perPlanQuota:{
				required:true,
				digits:true
			},    
			perTotalPeopleNum:{
				required:true,
				digits:true
			},
			perOpenTimeStr:{
				required:true
			},
			perOverTimeStr:{
				required:true
			},
			perDrift:{
				required:true
			}
		},
		messages:{
			perPlanQuota:{
				required:"必填",
				digits:"输入正整数"
			} ,
			perTotalPeopleNum:{
				required:"必填",
				digits:"输入正整数"
			},  
			perOpenTimeStr:{
				required:"必填"
			},  
			perOverTimeStr:{
				required:"必填"
			},  
			perDrift:{
				required:"必填",
				digits:"输入正整数"
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

$("#all").click(function(){    
    if(this.checked){    
        $("[name = chkItem]:checkbox").prop("checked", "checked"); 
    }else{    
        $("[name = chkItem]:checkbox").removeAttr("checked"); 
    }    
 });  


function subAudit(param){
	 var valArr = new Array; 
	 var itemIdArr = new Array; 
	    $("[name = chkItem]:checked ").each(function(i){ 
	    	   if(this.checked){    
	    		   valArr[i] = $(this).val(); 
	    		   itemIdArr[i] =$(this).attr('pitemId');
	    	   }
	    }); 
	    var vals = valArr.join(',');
	    var pitemIds = itemIdArr.join(',');
	    if(vals==''){
	    	Modal.alert({msg:"请选择一条需要操作的数据"});
	    	return;
	    }
		Modal.confirm({msg:"确认要提交审核吗？", okCallback:function() {
			$(this).on("hidden.bs.modal", function() {
				$.ajax({
					type : "POST",
					url : ctx+"/periodManagement/ajaxSubAudit",
					data : {"perIds":vals,"itemIds":pitemIds},
					async : false,
					dataType:"json",
					success : function(result) {
						if(result.code==0){
							Modal.alert({msg:"提交审核成功", okCallback:function() {
								$("#queryCommit").click();
							}});
						}else{
							Modal.alert({msg:result.msg});
						}
					}
				});
				
				$(this).off("hidden.bs.modal");
			});
		}});
	
}




function goAdd(param){
	$('#addModal').html("加载中...").load(ctx + '/periodManagement/goAddPeriod', param,function(){
			$("#addModal").modal();
	});
}

function ajaxSavePeriod(){
if(!$("#addForm").valid()){
		return;
	}
	$.ajax({
		type : "POST",
		url : ctx + "/periodManagement/saveItemPeriod",
		data : $("#addForm").serialize(),
		async : false,
		dataType:"json",
		success : function(result) {
			if(result.code==0){
				Modal.alert({msg:"保存成功", okCallback:function() {
					$("#addModal").modal("hide");
					$("#addModal").on("hidden.bs.modal", function() {
						$("#queryCommit").click();
						$(this).off("hidden.bs.modal");
					});
				}});
			 }else{
				 $("input[name='addPeriod']").val(result.value.newTokenName);
				 Modal.alert({msg:result.msg});
				//$("#addModal").modal("hide");
			}
		}
	});
}

function openPeriodInfo(perId){
	$('#periodInfoModal').html("加载中...").load(ctx + '/periodManagement/openPeriodInfo?perId='+perId+'&r='+Math.random(),function(){
			$("#periodInfoModal").modal();
	});
}

function openItemInfo(itemId){
	$('#itemInfoModal').html("加载中...").load(ctx + '/itemManagement/openItemInfo?itemId='+itemId+'&r='+Math.random(),function(){
			$("#itemInfoModal").modal();
	});
}
function openAddItemInfo(){
	var itemId = $("#trueItemId").val();
	if(itemId=="" || typeof(itemId)== "undefined"){
		Modal.alert({msg:"请先选择项目"});
		return;
	}
	$('#itemInfoModal').html("加载中...").load(ctx + '/itemManagement/openItemInfo?itemId='+itemId+'&r='+Math.random(),function(){
		$("#itemInfoModal").modal();
	});
}


function goPeriodEdit(){
	var perId;
	 var valArr = new Array; 
	    $("[name = chkItem]:checked ").each(function(i){ 
	    	   if(this.checked){    
	    		   valArr[i] = $(this).val(); 
	    	   }
	    }); 
	    if(valArr.length>1){
	    	Modal.alert({msg:"请选择单条数据"});
	    	return;
	    }
	    else if(valArr.length<=0){
	    	Modal.alert({msg:"请选择需要修改的数据"});
	    	return;
	    }
	    else{
	    	perId=valArr[0];
	    }
	$('#periodEditModal').html("加载中...").load(ctx + '/periodManagement/goPeriodEdit?perId='+perId+'&r='+new Date().getTime(),function(){
		$("#periodEditModal").modal();
	});
}
//编辑收益基准
function editIncome(itemId,perId){
	$('#periodEditModal').html("加载中...").load(ctx+'/itemIncome/list?itemId='+itemId+'&perId='+perId+'&r='+new Date().getTime(),function(){
		$("#periodEditModal").modal();
	});
}

function ajaxSaveUpdatePeriod(){
	if(!$("#editForm").valid()){
		return;
	}
	$.ajax({
		type : "POST",
		url : ctx + "/periodManagement/saveEditItemPeriod",
		data : $("#editForm").serialize(),
		async : false,
		dataType:"json",
		success : function(result) {
			if(result.code==0){
				Modal.alert({msg:"修改成功", okCallback:function() {
					$("#periodEditModal").modal("hide");
					$("#periodEditModal").on("hidden.bs.modal", function() {
						$("#queryCommit").click();
						$(this).off("hidden.bs.modal");
					});
				}});
			}else{
				Modal.alert({msg:result.msg});
			}
		}
	});
}
function delPeriod(){
	
	
	 var valArr = new Array; 
	    $("[name = chkItem]:checked ").each(function(i){ 
	    	   if(this.checked){    
	    		   valArr[i] = $(this).val(); 
	    	   }
	    }); 
	    var vals = valArr.join(',');
	    if(vals==''){
	    	Modal.alert({msg:"请选择需要删除的数据"});
	    	return;
	    }
	Modal.confirm({msg:"确认要删除吗？", okCallback:function() {
		$(this).on("hidden.bs.modal", function() {
			$.ajax({
				type : "POST",
				url : ctx + "/periodManagement/delItemPeriod",
				data :{"perIds":vals},
				async : false,
				dataType:"json",
				success : function(result) {
					if(result.code==0){
						Modal.alert({msg:"删除成功", okCallback:function() {
							$("#queryCommit").click();
						}});
					}else{
						Modal.alert({msg:result.msg});
					}
				}
			});
			
			$(this).off("hidden.bs.modal");
		});
	}});
	
}


function ajaxOpenPeriod(perId,itemId){
	$.ajax({
		type : "POST",
		url : ctx + "/periodManagement/controlPeriod",
		data :{"perId":perId,"itemId":itemId,"flag":"1"},
		async : false,
		dataType:"json",
		success : function(result) {
			if(result.code==0){
				Modal.alert({msg:"操作成功", okCallback:function() {
					$("#queryCommit").click();
				}});
			}else{
				Modal.alert({msg:result.msg});
			}
		}
	});
}

function ajaxClosePeriod(perId,itemId){
	$.ajax({
		type : "POST",
		url : ctx + "/periodManagement/controlPeriod",
		data :{"perId":perId,"itemId":itemId,"flag":"0"},
		async : false,
		dataType:"json",
		success : function(result) {
			if(result.code==0){
				Modal.alert({msg:"操作成功", okCallback:function() {
					$("#queryCommit").click();
				}});
			}else{
				Modal.alert({msg:result.msg});
			}
		}
	});
}

function checkPeriodAudit(itemId,perId){
	$.ajax({
		type: "post",
		dataType: "json",
		data: {"itemId":itemId,"perId":perId},
		url: ctx+"/itemPeriodAudit/opinion/check",
		success: function(result) {
			if (result.code == "0") {
				var periodAudit = result.value.itemPeriodAudit;
				if (periodAudit) {
					Modal.alert({msg:periodAudit.auditOpinion});
				}else {
					Modal.alert({msg:"该项目分期还未审核"});	
				}
			} else {
				Modal.alert({msg:result.msg});	
			}
		}
	});
}


function trueItem(){
	var itemId = $("input[name='newChkItem']:radio:checked").val();
	    if(itemId=="" || typeof(itemId)== "undefined"){
	    	Modal.alert({msg:"请选择数据"});
	    	return;
	    }
	   $("#trueItemId").val(itemId);
	   var itemName = $("input[name='newChkItem']:radio:checked").attr("itemName"); 
	   $("#itemNames").html("&nbsp;|&nbsp已选择项目["+itemName+"]");
	   $("#choseItemModal").modal("hide");
}

