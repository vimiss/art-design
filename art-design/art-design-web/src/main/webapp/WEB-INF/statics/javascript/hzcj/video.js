$(function(){
	//查询学生诊断列表
	$("#queryCommit").click(function(){
		if(checkLoginStatus() == false) return;
		$("#pageNow").val(1);
		$("#queryForm").submit();
	});
	
	//刷新学生诊断列表
	$("#flashPage").click(function(){
		if(checkLoginStatus() == false) return;
		$("#queryForm").submit();
	});
	
	
	var va=  $("#editForm").validate({
		 rules:{
			 videoTitle:{
					required:true
				}
		 },
		   messages:{
			   videoTitle:{
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


//编辑视频信息
function goUpdate(){
	    var videoId = getRadioInput();
		if (!videoId) {
			Modal.alert({msg:"请选择一条需要操作的数据"});
			return;
		}
	
	$('#editModal').html("加载中...").load(ctx + '/videoManagement/videoEdit?videoId='+videoId+'&r='+Math.random(),function(){
			$("#editModal").modal();
	});
}

function ajaxUpdateVideo(){
	if(!$("#editForm").valid()){
		return;
	}
	$.ajax({
		type : "POST",
		url : ctx + "/videoManagement/updateVideo",
		data : $("#editForm").serialize(),
		async : false,
		dataType:"json",
		success : function(result) {
			if(result.code==0){
				Modal.alert({msg:"编辑成功", okCallback:function() {
					$("#editModal").modal("hide");
					$("#editModal").on("hidden.bs.modal", function() {
						$("#queryCommit").click();
						$(this).off("hidden.bs.modal");
					});
				}});
			}else{
				 $("input[name='editVideo']").val(result.value.newTokenName);
				 Modal.alert({msg:result.msg});
			}
		}
	});
}


function ajaxControllIssue(videoId,issueStatus){
		$.ajax({
			type : "POST",
			url : ctx + "/videoManagement/controllIssue",
			data : {"videoId":videoId,"issueStatus":issueStatus},
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
function getRadioInput() {
	var radioInput = $('input:radio[name="chkItem"]:checked').val();
	return radioInput;
}

function ajaxDelVideo(){
	    var videoId = getRadioInput();
		if (!videoId) {
			Modal.alert({msg:"请选择一条需要操作的数据"});
			return;
		}
	
		Modal.confirm({msg:"确认要删除吗？", okCallback:function() {
			$(this).on("hidden.bs.modal", function() {
				$.ajax({
					type : "POST",
					url : ctx + "/videoManagement/delVideo",
					data : {"videoIds":videoId},
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

