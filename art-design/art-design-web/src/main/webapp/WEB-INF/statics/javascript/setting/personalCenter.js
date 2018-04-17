function checkPersonalCenterForm(){
	var nameReg = /^([\u4E00-\u9FA5|a-zA-Z]){2,20}$/g;
	var name = $("#teacherName").val();
	if(!nameReg.test(name)){
		$("#checkTeacherName").html("<font>限中文或字母(2-20位)!</font>");
		return;
	}else{
		$("#checkTeacherName").empty();
	}
	var mobile = $("#mobile").val();
	if(!isMobile(mobile)){
		$("#checkMobile").html("<font>手机号不符合格式!</font>");
		return;
	}else{
		var id = $("#teacherId").val();
		if(!checkMobileExist(id,mobile)){
			return;
		}
	}
	updatePersonalCenter();
}

/**
*规则：	移动: 前3位 134-139  或者 150-159   一共11位
*		联通: 前3位 130-133  或者 150-159   一共11位
* 		新增18号段。17号段，14号段
*	     这是最新规则
*功能：	检查参数的电话号码格式是否正确（仅手机号）
*参数：	str：	字符串
*返回：	如果通过验证返回true,否则返回false
*/
function isMobile(str){   
	var regu =/^1[3|4|5|7|8][0-9]{9}$/;	
	var reg = new RegExp(regu);	
	if (reg.test(str)) {	
		return true;	
	}else{	
		return false;
	}
}

//判断手机号是否被占用
function checkMobileExist(id,mobile){
	var flag = false;
	$.ajax({
		type : "POST",
		url : ctx + "/guanli/usercenter/teacher/check_mobile_exist",
		data : {
			id:id,
			mobile:mobile
		},
		async : false,
		dataType:"json",
		error : function(request) {
		},
		success:function(data) {
			if(data.result == 'success'){
				$("#checkMobile").empty();
				flag = true;
			}else{
				$("#checkMobile").html("<font>招生老师手机号被占用!</font>");
				flag = false;
			}
		}
	});
	return flag;
}

function updatePersonalCenter(){
	$.ajax({
		type : "POST",
		url : ctx + "/setting/update_personal_center",
		data : $("#personalCenterForm").serialize(),
		async : false,
		dataType:"json",
		error : function(request) {
		},
		success:function(data) {
			if(data.result == 'success'){
				//$("#personalCenterOkDiv").html("保存成功!");
				//$("#personalCenter_operate_modal_ok").modal({
					//keyboard:'false',//true是默认可是使用esc退出弹窗，false是不能使用esc退出
					//show:'true',// bool值，立即调用show
					//backdrop:'static'//static是只在弹窗内点击关闭按钮可以关闭
				//});
				Modal.alert({msg:"保存成功!",okCallback:function(){
					window.location.href=ctx+'/setting/personalCenter';
				}
			});
			}else{
				$("#personalCenterOkDiv").html(data.message);
				$("#personalCenter_operate_modal_ok").modal({
					keyboard:'false',//true是默认可是使用esc退出弹窗，false是不能使用esc退出
					show:'true',// bool值，立即调用show
					backdrop:'static'//static是只在弹窗内点击关闭按钮可以关闭
				});
			}
		}
	});
}