var va ;
$(function(){
	$("#queryCommit").click(function(){
		$("#pageNow").val(1);
		$("#queryForm").submit();
	});
	
	$("#flashPage").click(function(){
		$("#queryForm").submit();
	});
	
	va=  $("#addForm").validate({
		 rules:{
			 confName:{
					required:true
				},    
				confType:{
					required:true
				},
				confMinValue:{
					required:true,
					digits:true
				},
				confMaxValue:{
					required:true,
					digits:true
				},
				confSort:{
					required:true,
					digits:true
				},
				confResult:{
					required:true
				},
				confStatus:{
					required:true
				}
		 },
		   messages:{
			   confName:{
	            	required:"必填"
	            } ,
	            confType:{
					 required:"必填"
				 },  
				 confMinValue:{
	            	required:"必填",
					 digits:"输入正整数"
	            },  
	            confMaxValue:{
	            	required:"必填",
					 digits:"输入正整数"
	            },  
	            confSort:{
	            	required:"必填",
					 digits:"输入正整数"
	            },  
	            confResult:{
	            	required:"必填",
	            	digits:"输入正整数"
	            } , 
	            confStatus:{
	            	required:"必填"
	            }  
		   }
	});
	
	jQuery.validator.addMethod("checkConfResult", function(value) {  
		var confMinValue = $("#confMinValue").val();
		var confMaxValue = $("#confMaxValue").val();
	return parseInt(confMaxValue) >=parseInt(value)&&parseInt(confMinValue) <=parseInt(value) ;  
	}, $.validator.format("阀值结果需要在阀值最小值和最大值之间!"));  
	
	//阀值校验
	jQuery.validator.addMethod("checkConfValue", function(value, element) {  
		var returnVal = false;  
		var confMinValue = $("#confMinValue").val();
		var confMaxValue = $("#confMaxValue").val();
		$.ajax({
			type : "POST",
			url : ctx+"/configManagement/checkConfValue",
			data : {"confMinValue":confMinValue,"confMaxValue":confMaxValue},
			async : false,
			dataType:"json",
			success : function(result) {
				if (result.code == "0000") {
					returnVal=true;   
				} else {
					returnVal=false; 
				}
			}
		});
		return returnVal;   
	}," 最大阀值必须大于最小阀值");
	
	
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



function goAddConfig(){
	$('#addModal').html("加载中...").load(ctx + '/configManagement/goAddConfig',function(){
			$("#addModal").modal();
	});
}

function ajaxSaveConfig(){
	if(!$("#addForm").valid()){
		return;
	}
	$.ajax({
		type : "POST",
		url : ctx + "/configManagement/saveConfig",
		data : $("#addForm").serialize(),
		async : false,
		dataType:"json",
		success : function(result) {
			if(result.code==0){
				Modal.alert({msg:"保存成功", okCallback:function() {
					$("#queryCommit").click();
				}});
			 }else{
				 $("input[name='addConfig']").val(result.value.newTokenName);
				 Modal.alert({msg:result.msg});
				//$("#addModal").modal("hide");
			}
		}
	});
}

function openConfigInfo(confId){
	$('#cofigInfoModal').html("加载中...").load(ctx + '/configManagement/openConfigDtails?confId='+confId+'&r='+Math.random(),function(){
			$("#cofigInfoModal").modal();
	});
}


function goConfigEdit(){
	
	var confId;
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
	    	confId=valArr[0];
	    }
	
	$('#cofigEditModal').html("加载中...").load(ctx + '/configManagement/goConfigEdit?confId='+confId+'&r='+Math.random(),function(){
		$("#cofigEditModal").modal();
	});
}

function ajaxSaveUpdateConfig(){
	if(!$("#addForm").valid()){
		return;
	}
	$.ajax({
		type : "POST",
		url : ctx + "/configManagement/saveEditConfig",
		data : $("#addForm").serialize(),
		async : false,
		dataType:"json",
		success : function(result) {
			if(result.code==0){
				Modal.alert({msg:"修改成功", okCallback:function() {
					$("#queryCommit").click();
				}});
			}else{
				 Modal.alert({msg:result.msg});
			}
		}
	});
}
function delConfig(confId){
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
				url : ctx + "/configManagement/delConfig",
				data :{"confIds":vals},
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

