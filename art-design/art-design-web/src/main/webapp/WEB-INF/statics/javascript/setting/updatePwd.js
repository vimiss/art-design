$(function(){
	//所有a标签点击时触发
	$("a").click(function(){
		if(checkLoginStatus() == false) return;
	})
})

//清空提示方法
function clearCheck(){
	$("#checkOldPwd").empty();
	$("#checkNewPwd").empty();
	$("#checkConfirmPwd").empty();
}

function isPwd(str){
	var filter = /^(?!_)[\w]{6,20}$/;
	if(!filter.test(str)) return false;
	return true;
}

function checkPwd(){
	clearCheck();
	var oldPwd = $("#oldPwd").val();
	if(!isPwd(oldPwd)){
		$("#checkOldPwd").html("<font>旧密码格式应为6-20位数字字母下划线组成且不能以下划线开头!</font>");
		return;
	}else{
		$("#checkOldPwd").empty();
	}
	
	var newPwd = $("#newPwd").val();
	if(!isPwd(newPwd)){
		$("#checkNewPwd").html("<font>新密码格式应为6-20位数字字母下划线组成且不能以下划线开头!</font>");
		return;
	}else if(newPwd==oldPwd){
		$("#checkNewPwd").html("<font>新密码和旧密码一样!</font>");
		return;
	}else{
		$("#checkNewPwd").empty();
	}
	
	var confirmPwd = $("#confirmPwd").val();
	if(!isPwd(confirmPwd)){
		$("#checkConfirmPwd").html("<font>确认密码格式应为6-20位数字字母下划线组成且不能以下划线开头!</font>");
		return;
	}else{
		if(newPwd != confirmPwd){
			$("#checkConfirmPwd").html("<font>新密码和确认密码不一致!</font>");
			return;
		}else{
			$("#checkConfirmPwd").empty();
		}
	}
	
	checkPwdOk();
}
//验证密码强度验证
function checkPassword(){
	var strongRegex = new RegExp("^(?=.{6,})(?=.*[_])(?=.*[a-zA-Z])(?=.*[0-9]).*$", "g"); 
	var mediumRegex = new RegExp("^(?=.{6,})(((?=.*[_])(?=.*[a-zA-Z]))|((?=.*[_])(?=.*[0-9]))|((?=.*[a-zA-Z])(?=.*[0-9]))).*$", "g"); 
	var enoughRegex = new RegExp("^(?=.{6,})((?=.*[0-9])|(?=.[a-zA-Z])).*$", "g"); 
	var psd = $("#newPwd").val();
	   $('#checkNewPwd').empty();
	if (enoughRegex.test(psd)){
		$('#checkNewPwd').html('密码强度等级弱'); 
	}
	if (mediumRegex.test(psd)) {  
		$('#checkNewPwd').html('密码强度等级中'); 
	}
	if (strongRegex.test(psd)) { 
		$('#checkNewPwd').html('密码强度等级强'); 
	} 
}
//验证旧密码是否正确
function checkPwdOk(){
	$.ajax({
		type : "POST",
		url : ctx + "/setting/check_pwd",
		data : $("#updatePwdForm").serialize(),
		async : false,
		dataType:"json",
		error : function(request) {
		},
		success:function(data) {
			if(data.result == 'success'){
				$("#updatePwdOkDiv").html("密码修改后将重新登录,确定修改吗？");
				$("#updatePwd_operate_modal_ok").modal({
					keyboard:'false',//true是默认可是使用esc退出弹窗，false是不能使用esc退出
					show:'true',// bool值，立即调用show
					backdrop:'static'//static是只在弹窗内点击关闭按钮可以关闭
				});
			}else{
				if(data.message == 'oldPwdError'){
					clearCheck();
					$("#checkOldPwd").html("<font>旧密码输入有误!</font>");
				}else{
					clearCheck();
					$("#checkOldPwd").html("<font>"+data.message+"</font>");
				}
			}
		}
	});
}

function updatePwd(){
	$("#updatePwdForm").submit();
}