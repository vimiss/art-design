$(function(){
	$("#queryCommit").click(function(){
		$("#pageNow").val(1);
		$("#queryForm").submit();
	});
	
	$("#flashPage").click(function(){
		$("#queryForm").submit();
	});
	
	var va=  $("#addNoticeForm").validate({
		 rules:{
			 infoType:{
					required:true
				},    
				infoTitle:{
					required:true
				},
				itemIfList:{
					required:true
				}
		 },
		   messages:{
			   infoType:{
	            	required:"必填"
	            } ,
	            infoTitle:{
					 required:"必填"
				 },
	            itemIfList:{
	            	required:"必填"
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

function getRadioInput() {
	var radioInput = $('input:radio[name="chkItem"]:checked').val();
	return radioInput;
}



/**
 * 添加公告
 */
function submitNotice() {
	if(!$("#addNoticeForm").valid()){
		return;
	}
   	var titlePic = $("#titlePic").attr("src");
   	 $("#infoPhotoUrl").val(titlePic);
	var form = $("#addNoticeForm");
	$.ajax({
		type : "POST",
		url : ctx+"/noticeManagement/savenotice",
		data : $("#addNoticeForm").serialize(),
		async : false,
		dataType:"json",
		success : function(result) {
			if (result.code == "0") {
				Modal.alert({msg:"新增成功", okCallback:function() {
					$("#addModal").modal("hide");
					$("#addModal").on("hidden.bs.modal", function() {
						$("#queryCommit").click();
						$(this).off("hidden.bs.modal");
					});
				}});
			} else {
				 $("input[name='addNotice']").val(result.value.newTokenName);
				 Modal.alert({msg:result.msg});
			}
		}
	});
}




/**
 * 转PDF
 */
function goPdf() {
	  var vals = getRadioInput();
		if (!vals) {
			Modal.alert({msg:"请选择一条需要操作的数据"});
			return;
		}
	$.ajax({
		type : "POST",
		url : ctx+"/noticeManagement/noticetopdf",
		data : {"infoId":vals},
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

function goDel(infoId) {
	/*
	 var valArr = new Array; 
	    $("[name = chkItem]:checked ").each(function(i){ 
	    	   if(this.checked){    
	    		   valArr[i] = $(this).val(); 
	    	   }
	    }); 
	    var vals = valArr.join(',');
	    if(vals==''){
	    	Modal.alert({msg:"请选择需要删除的数据！"});
	    	return;
	    }
	 */
	
    var vals = getRadioInput();
	if (!vals) {
		Modal.alert({msg:"请选择一条需要操作的数据"});
		return;
	}
	
	Modal.confirm({msg:"确认要删除吗？", okCallback:function() {
		$(this).on("hidden.bs.modal", function() {
			$.ajax({
				type : "POST",
				url : ctx+"/noticeManagement/noticeDel",
				data : {"infoIds":vals},
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

function submitNoticeEdit() {
   	var titlePic = $("#titlePic").attr("src");
   	 $("#infoPhotoUrl").val(titlePic);
	var form = $("#editNoticeForm");
	$.ajax({
		type : "POST",
		url : ctx+"/noticeManagement/saveNoticeEdit",
		data : $("#editNoticeForm").serialize(),
		async : false,
		dataType:"json",
		success : function(result) {
			if (result.code == "0") {
				Modal.alert({msg:"修改成功", okCallback:function() {
					$("#editModal").modal("hide");
					$("#editModal").on("hidden.bs.modal", function() {
						$("#queryCommit").click();
						$(this).off("hidden.bs.modal");
					});
				}});
			} else {
				 Modal.alert({msg:result.msg});
			}
		}
	});
}


function goAddNotice(){
	$('#addModal').html("加载中...").load(ctx + '/noticeManagement/addnotice?r='+Math.random(),function(){
    $("#addModal").modal();
	});
}
function goEditNotice(){
    var infoId = getRadioInput();
	if (!infoId) {
		Modal.alert({msg:"请选择一条需要操作的数据"});
		return;
	}
	
	$('#editModal').html("加载中...").load(ctx + '/noticeManagement/noticeEdit?infoId='+infoId+'&r='+Math.random(),function(){
		$("#editModal").modal();
	});
}





