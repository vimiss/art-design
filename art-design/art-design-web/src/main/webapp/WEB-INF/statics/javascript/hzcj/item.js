var va ;
$(function(){
	$("#queryCommit").click(function(){
		$("#pageNow").val(1);
		$("#queryForm").submit();
	});
	
	$("#flashPage").click(function(){
		$("#queryForm").submit();
	});
	
	
	
	
	
	//////////////////////////////////////////////////////////////////////////
	//表单校验
	va=  $("#editForm").validate({
		 rules:{
			 itemName:{
                required:true
            }  ,              
            itemTypeCode:{
				required:true
			},                 
			itemShape:{
            	required:true
            },                 
			itemIncomeType:{
				required:true
			},        
			itemDrift:{
            	required:true
            },        
            itemMinFee:{
				required:true
			},        
			itemMaxFee:{
            	required:true,
            	digits:true
            },        
            itemTotalQuota:{
				required:true,
				digits:true
			},        
			itemTotalPeopleNumber:{
            	required:true,
            	digits:true
            },        
            itemPayEndDateStr:{
				required:true
			},        
			itemKeeper:{
            	required:true
            },        
            itemTrustee:{
				required:true
			},        
			itemFinancier:{
            	required:true
            },        
            itemInvestArea:{
				required:true
			},        
            itemAssetsTag:{
            	required:true
            },
			itemBeginQuota:{
            	required:true,
            	digits:true
            },
            itemIncrementQuota:{
            	required:true,
            	digits:true
            },
            itemTerm:{
            	required:true,
            	digits:true
            },
            itemReviseFee:{
            	required:true,
            	digits:true
            },
            riskType:{
            	required:true
            },
            itemAccountName:{
            	required:true
            },
            itemRaiseBankName:{
            	required:true
            },
            itemRaiseBankAccount:{
            	required:true,
            	digits:true
            },
            itemPlayNotes:{
            	required:true
            },
            itemRepaySource:{
            	required:true
            },
            itemDesc:{
            	required:true
            },
            TermUnit:{
            	required:true
            },
            itemDrift:{
            	required:true
            }
        },
        messages:{
       	    itemName:{
                required:"必填"
            },                                 
            itemTypeCode:{
            	required:"必填"
            },                                 
            itemShape:{
            	required:"必填"
            },                                 
            itemIncomeType:{
            	required:"必填"
            },                                 
            itemDrift:{
            	required:"必填"
            },                                 
            itemMinFee:{
            	required:"必填"
            },                                 
            itemMinFee:{
            	required:"必填",
            		digits:"输入正整数"
            },                                 
            itemTotalQuota:{
            	required:"必填",
            	digits:"输入正整数"
            },                                 
            itemTotalPeopleNumber:{
            	required:"必填",
            	digits:"输入正整数"
            },                                 
            itemPayEndDateStr:{
            	required:"必填"
            },                                 
            itemKeeper:{
            	required:"必填"
            },                                 
            itemTrustee:{
            	required:"必填"
            },                                 
            itemFinancier:{
            	required:"必填"
            },                                 
            itemInvestArea:{
            	required:"必填"
            },                                 
            itemAssetsTag:{
            	required:"必填"
            },
            itemBeginQuota:{
            	required:"必填",
            	digits:"输入正整数"
            },                           
            itemIncrementQuota:{
            	required:"必填",
            	digits:"输入正整数"
            },                           
            itemTerm:{
            	required:"必填",
            	digits:"输入正整数"
            },
            itemReviseFee:{
            	required:"必填",
            	digits:"输入正整数"
            },                          
            riskType:{
            	required:"必填"
            },                          
            itemAccountName:{
            	required:"必填"
            },                          
            itemRaiseBankName:{
            	required:"必填"
            },                          
            itemRaiseBankAccount:{
            	required:"必填"
            },                          
            itemPlayNotes:{
            	required:"必填"
            },                          
            itemRepaySource:{
            	required:"必填"
            },                          
            itemDesc:{
            	required:"必填"
            },                         
            TermUnit:{
            	required:"必填"
            },                         
            itemDrift:{
            	required:"必填"
            }                         
        }
		
	});
	
	function test100( num )
	{
	var r = /^[1-9]\d*00$/;
	 return r.test( num );
	}
	
	jQuery.validator.addMethod("incrementQuotaCheck100", function(value, element) { 
		var returnVal = false;  
		var itemIncrementQuota = $("#itemIncrementQuota").val();
		if(itemIncrementQuota!=""){
			returnVal =  test100( itemIncrementQuota ); 
		}
		 return returnVal;
	},"递增金额必须为100的倍数");  
	jQuery.validator.addMethod("beginQuotaCheck100", function(value, element) { 
		var returnVal = false;  
		var itemBeginQuota = $("#itemBeginQuota").val();
		if(itemBeginQuota!=""){
			returnVal =  test100( itemBeginQuota ); 
		}
		return returnVal;
	},"起投金额必须为100的倍数");  
	jQuery.validator.addMethod("totalQuotaCheck100", function(value, element) { 
		var returnVal = false;  
		var itemTotalQuota = $("#itemTotalQuota").val();
		if(itemTotalQuota!=""){
			returnVal =  test100( itemTotalQuota ); 
		}
		return returnVal;
	},"项目额度必须为100的倍数");  
	
	//金额校验
	jQuery.validator.addMethod("amountLimitOne", function(value, element) {  
		var returnVal = false;  
		var itemIncrementQuota = $("#itemIncrementQuota").val();
		var itemBeginQuota = $("#itemBeginQuota").val();
		if(parseFloat(itemBeginQuota)>parseFloat(itemIncrementQuota)){
		returnVal = true;
		}
		return returnVal;   
		},"递增金额必须小于起投金额");  
	
	jQuery.validator.addMethod("amountLimitTwo", function(value, element) {  
		var returnVal = false;  
		var itemTotalQuota = $("#itemTotalQuota").val();
		var itemBeginQuota = $("#itemBeginQuota").val();
		if(parseFloat(itemTotalQuota)>parseFloat(itemBeginQuota)){
			returnVal = true;
		}
		return returnVal;   
	},"起投金额必须小于项目额度");  
	
	jQuery.validator.addMethod("amountLimitThree", function(value, element) {  
		var returnVal = false;  
		var itemMaxFee = $("#itemMaxFee").val();
		var itemMinFee = $("#itemMinFee").val();
		if(itemMaxFee=="" || itemMinFee==""){
			returnVal = true;
		}
		if(parseFloat(itemMaxFee)>=parseFloat(itemMinFee)){
			returnVal = true;
		}
		return returnVal;   
	},"最高收益必须大于等于最低收益");  
	
	jQuery.validator.addMethod("checkItemName", function(value, element) {  
		var returnVal = false;  
		var itemName = $("#itemName").val();
		var itemOldName = $("#itemOldName").val();
		var itemCloums = $("#itemCloums").val();
		$.ajax({
			type : "POST",
			url : ctx+"/itemManagement/checkItemName",
			data : {"itemName":itemName,"itemOldName":itemOldName,"itemCloums":itemCloums},
			async : false,
			dataType:"json",
			success : function(result) {
				if (result.code == "0000") {
					$("#itemCloums").val(itemCloums);
					returnVal=true;   
				} 
				else {
					$("#itemCloums").val(itemCloums);
					returnVal=false; 
				}
			}
		});
		return returnVal;   
	},"项目标题已存在");  
	
	/////////////////////////////////////////////////////////////////////////
	
	$("#all").click(function(){    
        if(this.checked){    
            $("[name = chkItem]:checkbox").prop("checked", "checked"); 
        }else{    
            $("[name = chkItem]:checkbox").removeAttr("checked"); 
        }    
     });  
	$("#all").click(function(){    
		if(this.checked){    
			$("[name = chkItem]:checkbox").prop("checked", "checked"); 
		}else{    
			$("[name = chkItem]:checkbox").removeAttr("checked"); 
		}    
	});  
  
   
    //获取选中选项的值 新增项目栏目
    $("#subItemColum1").click(function(){ 
        var valArr = new Array; 
        var nameArr = new Array; 
        $("[name = chkItem]:checked ").each(function(i){ 
        	   if(this.checked){    
        		   valArr[i] = $(this).val(); 
        		   nameArr[i] = $(this).attr("fenceName"); 
        	   }
        }); 
        var vals = valArr.join(',');
        var names = nameArr.join(',');
        if(vals==''){
        	Modal.alert({msg:"请选择至少一条数据"});
        	return;
        }
        var olditemCloums =  $("#itemCloums").val();
       var itemCloumsName = $("#itemCloumsName").val();
        vals =vals+","+olditemCloums;
        names =names+","+itemCloumsName;
        
        $("#itemFenceModal").modal("hide");
        $("#itemFenceModal").on("hidden.bs.modal", function() {
        	$("#itemCloums").val(vals);
        	$("#itemCloumsName").val(names);
        	
        	$("#columName").html("&nbsp;&nbsp;|&nbsp;&nbsp;已选栏目(保存后生效)：["+names.substring(0,names.lastIndexOf(","))+"]");
       // 	goAddPage(vals);
        	$(this).off("hidden.bs.modal");
        });
    }); 
    
    
	
    
    //获取选中选项的值  编辑项目栏目新增时
    $("#subEditItemColum").click(function(){ 
       	var itemId = $("#itemId").val();
    	var valArr = new Array; 
    	var nameArr = new Array; 
    	$("[name = chkItem]:checked ").each(function(i){ 
    		if(this.checked){    
    			valArr[i] = $(this).val(); 
    			  nameArr[i] = $(this).attr("fenceName"); 
    		}
    	}); 
    	var vals = valArr.join(',');
    	var names = nameArr.join(',');
    	if(vals==''){
    		Modal.alert({msg:"请选择至少一条数据"});
    		return;
    	}
    	
    	   var olditemCloums =  $("#itemCloums").val();
    	   var itemCloumsName = $("#itemCloumsName").val();
           vals =vals+","+olditemCloums;
           names =names+","+itemCloumsName;
    	
    	$("#itemEditFenceModal").modal("hide");
    	$("#itemEditFenceModal").on("hidden.bs.modal", function() {
    		$("#itemCloums").val(vals);
    		$("#itemCloumsName").val(names);
    		
    		$("#columName").html("&nbsp;&nbsp;|&nbsp;&nbsp;新增栏目(保存后生效)：["+names.substring(0,names.lastIndexOf(","))+"]");
    		//goItemEdit('itemCloums='+vals+'&itemId='+itemId);
    		$(this).off("hidden.bs.modal");
    	});
    }); 
    
    
    // 编辑项目栏目删除时
    $("#subEditItemDelColum").click(function(){ 
    	var itemId = $("#itemId").val();
    	var valArr = new Array; 
    	var nameArr = new Array; 
    	var allArr = $("[name = chkItem]:checkbox");
    	var index = 0;
    	allArr.each(function(i){ 
    		if(this.checked){  
    			valArr[index] = $(this).val(); 
    			 nameArr[index] = $(this).attr("fenceName"); 
    			 index++;
    		}
    	}); 
    	
    	if(allArr.length == valArr.length){
    		Modal.alert({msg:"至少保留一个栏目"});
    		return;
    	}
    	
    	var vals = valArr.join(',');
    	var names = nameArr.join(',');
    	if(vals==''){
    		Modal.alert({msg:"请选择要删除的栏目"});
    		return;
    	}
    	
    	  var olditemDelCloums =  $("#itemDelCloums").val();
   	      var itemCloumsDelName = $("#itemCloumsDelName").val();
          vals =vals+","+olditemDelCloums;
          names =names+","+itemCloumsDelName;
    	
    	
    	$("#itemEditFenceModal").modal("hide");
    	$("#itemEditFenceModal").on("hidden.bs.modal", function() {
    		$("#itemDelCloums").val(vals);
    		$("#itemCloumsDelName").val(names);
    		
    		
    		$("#columNameDel").html("&nbsp;&nbsp;|&nbsp;&nbsp;删除栏目(保存后生效)：["+names.substring(0,names.lastIndexOf(","))+"]");
    		//goItemEdit('itemCloums='+vals+'&itemId='+itemId);
    		$(this).off("hidden.bs.modal");
    	});
    }); 
	
	
});

function goAddPage(){
	window.location.href=ctx+"/itemManagement/goAddItem";
	//$("#queryForm").attr("action",ctx+"/itemManagement/goAddItem?itemCloums="+itemCloums);
	//$("#queryForm").submit();
}



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





/**
 * 添加公告
 */
function submitItemNotice() {
   	var titlePic = $("#titlePic").attr("src");
   	 $("#infoPhotoUrl").val(titlePic);
	var form = $("#addNoticeForm");
	$.ajax({
		type : "POST",
		url : ctx+"/itemManagement/saveitemnotice",
		data : $("#addNoticeForm").serialize(),
		async : false,
		dataType:"json",
		success : function(result) {
			if (result.code == "0") {
				// $("#sid").val(result.msg);
				Modal.alert({msg:"新增成功"});
			} else {
				 Modal.alert({msg:result.msg});
			}
		}
	});
}

/**
 * 转PDF
 */
function goItemNoticePdf(infoId) {
	$.ajax({
		type : "POST",
		url : ctx+"/itemManagement/itemNoticeToPdf",
		data : {"infoId":infoId},
		async : false,
		dataType:"json",
		success : function(result) {
			 if(result.code==0){
				 Modal.alert({msg:"转化成功"});
			}else{
				 Modal.alert({msg:result.msg});
			}
		}
	});
}

function goItemNoticeDel(infoId,itemId) {
	$.ajax({
		type : "POST",
		url : ctx+"/itemManagement/itemNoticeDel",
		data : {"infoId":infoId,"itemId":itemId},
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
}

function submitItem() {
	$.ajax({
		type : "POST",
		url : ctx+"/itemManagement/saveitem",
		data : $("#addItemForm").serialize(),
		dataType:"json",
		success : function(result) {
			if (result.code == "0") {
				Modal.alert({msg:"新增成功", okCallback:function() {
					window.location.href=ctx+"/itemManagement/listItem?querySign=1";
				}});
			} else {
				 Modal.alert({msg:result.msg});
			}
		}
	});
}

/*function goAdd(param){
	$('#addModal').html("加载中...").load(ctx + '/itemManagement/goAddItem', param,function(){
			$("#addModal").modal();
	});
}*/


function goAddNotice(itemId){
	$('#addNoticeModal').html("加载中...").load(ctx + '/itemManagement/goitemColumnEdit?itemId='+itemId+'&r='+Math.random(),function(){
    $("#addNoticeModal").modal();
	});
}

function goItemNoticeInfo(infoId,itemId){
	$('#itemNoticeEditModal').html("加载中...").load(ctx + '/itemManagement/goitemNoticeEdit?infoId='+infoId+'&itemId='+itemId+'&r='+Math.random(),function(){
		$("#itemNoticeEditModal").modal();
	});
}


function ajaxSaveItem(){
	var itemBeginTimeStr = $("#itemBeginTimeStr").val();
	if(itemBeginTimeStr=="" || typeof(itemBeginTimeStr)=="undefined"){
		Modal.alert({msg:"请输入项目开始时间"});
		return;
	}
	var itemCloums = $("#itemCloums").val();
	if(itemCloums=="" || typeof(itemCloums)=="undefined"){
		Modal.alert({msg:"请选择项目栏目"});
		return;
	}
	var itemListTitlePicBack = $("#itemListTitlePicBack").attr("src");
	 var itemInfoTitlePicBack = $("#itemInfoTitlePicBack").attr("src");
	 if(itemListTitlePicBack==""){
  		 $("#itemListTitlePicErr").html("选择列表背景图");
  		 return;
  	 }
  	 if(itemInfoTitlePicBack==""){
  		 $("#itemInfoTitlePicErr").html("选择详情背景图");
  		 return;
  	 }
  	
	if(!$("#editForm").valid()){
		return;
	}
  	 $("#itemListTitlePic").val(itemListTitlePicBack);
  	 $("#itemInfoTitlePic").val(itemInfoTitlePicBack);
	$.ajax({
		type : "POST",
		url : ctx + "/itemManagement/saveitem",
		data : $("#editForm").serialize(),
		async : false,
		dataType:"json",
		success : function(result) {
			if(result.code==0){
				Modal.alert({msg:"保存成功", okCallback:function() {
					window.location.href=ctx+'/itemManagement/listItem?querySign=1';
				}});
			}else{
				 $("input[name='addItem']").val(result.value.newTokenName);
				 Modal.alert({msg:result.msg});
			}
		}
	});
}

/**
 * 提交编辑好的栏目
 */
function submitItemNoticeEdit() {
   	var titlePic = $("#titlePic").attr("src");
   	 $("#infoPhotoUrl").val(titlePic);
	var form = $("#addNoticeForm");
	$.ajax({
		type : "POST",
		url : ctx+"/itemManagement/saveItemNoticeEdit",
		data : $("#addNoticeForm").serialize(),
		async : false,
		dataType:"json",
		success : function(result) {
			if (result.code == "0") {
				Modal.alert({msg:"新增成功", okCallback:function() {
					$("#itemNoticeEditModal").modal("hide");
					$("#itemNoticeEditModal").on("hidden.bs.modal", function() {
						$("#queryCommit_ajax").click();
						$(this).off("hidden.bs.modal");
					});
				}});
			} else {
				Modal.alert({msg:result.msg});
			}
		}
	});
}

function goList(){

	window.location.href=ctx+"/itemManagement/listItem?";
}

function submitItemDel(itemId) {
	
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
				url : ctx+"/itemManagement/itemDel",
				data : {"itemIds":vals},
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


function ajaxAssocVideo(videoId,itemId) {
	$.ajax({
		type : "POST",
		url : ctx+"/itemManagement/assocItemVideo",
		data : {"videoId":videoId,"itemId":itemId},
		dataType:"json",
		success : function(result) {
			if(result.code==0){
				Modal.alert({msg:"关联成功", okCallback:function() {
					$("#queryCommit_ajax").click();
				}});
			}else{
				Modal.alert({msg:result.msg});
			}
		}
	});
}

function ajaxReleaseAssocVideo(videoId,itemId) {
	$.ajax({
		type : "POST",
		url : ctx+"/itemManagement/releaseAssocVideo",
		data : {"videoId":videoId,"itemId":itemId},
		dataType:"json",
		success : function(result) {
			if(result.code==0){
				Modal.alert({msg:"解除关联成功", okCallback:function() {
					$("#queryCommit_ajax").click();
				}});
			}else{
				Modal.alert({msg:result.msg});
			}
		}
	});
}





function goItemVideoEdit(videoId,itemId){
		$('#itemVideoEditModal').html("加载中...").load(ctx + '/itemManagement/goItemVideoEdit?videoId='+videoId+'&itemId='+itemId+'&r='+Math.random(),function(){
	    $("#itemVideoEditModal").modal();
	});
}

function ajaxSaveItemVideoEdit(){
	$.ajax({
		type : "POST",
		url : ctx + "/itemManagement/saveItemVideoEdit",
		data : $("#editForm").serialize(),
		async : false,
		dataType:"json",
		success : function(result) {
			if(result.code==0){
				Modal.alert({msg:"编辑成功", okCallback:function() {
					$("#itemVideoEditModal").modal("hide");
					$("#itemVideoEditModal").on("hidden.bs.modal", function() {
						$("#queryCommit_ajax").click();
						$(this).off("hidden.bs.modal");
					});
				}});
			}else{
				Modal.alert({msg:result.msg});
			}
		}
	});
}



function ajaxAssocNotice(infoId,itemId,infoType) {
	$.ajax({
		type : "POST",
		url : ctx+"/itemManagement/assocNotice",
		data : {"infoId":infoId,"itemId":itemId,"infoType":infoType},
		dataType:"json",
		success : function(result) {
			if(result.code==0){
				Modal.alert({msg:"关联成功", okCallback:function() {
					$("#queryCommit_ajax").click();
				}});
			}else{
				Modal.alert({msg:result.msg});
			}
		}
	});
}

function ajaxReleaseAssocNotice(infoId,itemId) {
	$.ajax({
		type : "POST",
		url : ctx+"/itemManagement/releaseAssocInfo",
		data : {"infoId":infoId,"itemId":itemId},
		dataType:"json",
		success : function(result) {
			if(result.code==0){
				Modal.alert({msg:"解除关联成功", okCallback:function() {
					$("#queryCommit_ajax").click();
				}});
			}else{
				Modal.alert({msg:result.msg});
			}
		}
	});
}

function ajaxOpenItem(itemId) {
	$.ajax({
		type : "POST",
		url : ctx+"/itemManagement/openItem",
		data : {"itemId":itemId},
		dataType:"json",
		success : function(result) {
			if(result.code==0){
				Modal.alert({msg:"开启项目成功", okCallback:function() {
					$("#queryCommit").click();
				}});
			}else{
				Modal.alert({msg:result.msg});	
			}
		}
	});
}

function ajaxCloseItem(itemId) {
	$.ajax({
		type : "POST",
		url : ctx+"/itemManagement/closeItem",
		data : {"itemId":itemId},
		dataType:"json",
		success : function(result) {
			if(result.code==0){
				Modal.alert({msg:"关闭项目成功", okCallback:function() {
					$("#queryCommit").click();
				}});
			}else{
				Modal.alert({msg:result.msg});
			}
		}
	});
}

function openItemInfo(itemId){
	$('#itemInfoModal').html("加载中...").load(ctx + '/itemManagement/openItemInfo?itemId='+itemId+'&r='+Math.random(),function(){
			$("#itemInfoModal").modal();
	});
}
function goItemEdit(param){
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
	    	param='itemId='+valArr[0];
	    }
	    
	/*$('#itemEditModal').html("加载中...").load(ctx + '/itemManagement/itemEdit',param,function(){
		$("#itemEditModal").modal();
	});*/
		window.location.href= ctx+"/itemManagement/itemEdit?"+param;
	
	
	
}

function ajaxSaveUpdateItem() {
	var itemCloums = $("#itemCloums").val();
	if(itemCloums==""){
		Modal.alert({msg:"请在[修改栏目]处添加栏目"});
		return;
	}
	var itemListTitlePicBack = $("#itemListTitlePicBack").attr("src");
	 var itemInfoTitlePicBack = $("#itemInfoTitlePicBack").attr("src");
	 if(itemListTitlePicBack==""){
		 $("#itemListTitlePicErr").html("选择列表背景图");
		 return;
	 }
	 if(itemInfoTitlePicBack==""){
		 $("#itemInfoTitlePicErr").html("选择详情背景图");
		 return;
	 }
	
		if(!$("#editForm").valid()){
			return;
		}

 	 $("#itemListTitlePic").val(itemListTitlePicBack);
 	 $("#itemInfoTitlePic").val(itemInfoTitlePicBack);
	$.ajax({
		type : "POST",
		url : ctx+"/itemManagement/saveEditItem",
		data :$("#editForm").serialize(),
		dataType:"json",
		success : function(result) {
			if(result.code==0){
				Modal.alert({msg:"修改项目成功", okCallback:function() {
					window.location.href=ctx+'/itemManagement/listItem?querySign=1';
					//$("#queryCommit").click();
				}});
			}else{
				Modal.alert({msg:result.msg});	
			}
		}
	});
}

function subItemAudit(){
	 var valArr = new Array; 
	    $("[name = chkItem]:checked ").each(function(i){ 
	    	   if(this.checked){    
	    		   valArr[i] = $(this).val(); 
	    	   }
	    }); 
	    var vals = valArr.join(',');
	    if(vals==''){
	    	Modal.alert({msg:"请选择需要提交审核的数据"});
	    	return;
	    }
		Modal.confirm({msg:"确认要提交审核吗？", okCallback:function() {
			$(this).on("hidden.bs.modal", function() {
				$.ajax({
					type : "POST",
					url : ctx+"/itemManagement/ajaxSubAudit",
					data : {"itemIds":vals},
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

function checkItemAudit(itemId){
	$.ajax({
		type: "post",
		dataType: "json",
		data: {"itemId":itemId},
		url: ctx+"/itemAudit/opinion/check",
		success: function(result) {
			if (result.code == "0") {
				var itemAudit = result.value.itemAuditOpinion;
				if (itemAudit) {
					Modal.alert({msg:itemAudit.auditOpinion});
				}else {
					Modal.alert({msg:"该项目还未审核"});
				}
			} else {
				Modal.alert({msg:result.msg});	
			}
		}
	});
}





