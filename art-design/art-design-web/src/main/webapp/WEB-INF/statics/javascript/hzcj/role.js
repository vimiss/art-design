//查询
$(function(){
	//查询
	$("#queryCommit").click(function(){
		if(checkLoginStatus() == false) return;
		$("#pageNow").val(1);
		$("#queryForm").submit();
	});
})
	
	
//新增角色弹窗
function addRole(){
	$('#add_role_modal').html("加载中...").load(ctx + '/role/manage/toAddRole?r='+Math.random(),function(res,
			sta,
			xhr){
		if(res){//判断是否正常返回了数据--登录拦截,res,sta,xhr
			$("#add_role_modal").modal({
				keyboard:'false',//true是默认可是使用esc退出弹窗，false是不能使用esc退出
				show:'true',// bool值，立即调用show
				backdrop:'static' //static是只在弹窗内点击关闭按钮可以关闭
			});
		}
	});
}

//修改角色弹窗
function updateRole(roleId){
	$('#update_role_modal').html("加载中...").load(ctx + '/role/manage/toUpdateRole?'+Math.random()+'&id='+roleId,function(res,	sta, xhr){
		if(res){//判断是否正常返回了数据--登录拦截,res,sta,xhr
			$("#update_role_modal").modal({
				keyboard:'false',//true是默认可是使用esc退出弹窗，false是不能使用esc退出
				show:'true',// bool值，立即调用show
				backdrop:'static' //static是只在弹窗内点击关闭按钮可以关闭
			});
		}
	});	
}

//删除角色
function deleteRole(id) {
	Modal.confirm({
		msg : "您确定要删除该角色吗？",
		okCallback : function() {
			$.ajax({
				type : "POST",
				url : ctx +'/role/manage/deleteRole',
				data : {id : id	},
				dataType : 'json',
				success : function(data) {
					if (data["success"]) {
			        	Modal.alert({msg:"删除角色成功",okCallback:function(){
			        		$("#delete_role_modal").modal("hide");
//			        		$("#delete_role_modal").on("hidden.bs.modal", function() {
			        			location.reload();
//			        			$(this).off("hidden.bs.modal");
//			        		});
							}
			        	});
					} else {
			        	 	Modal.alert({msg:data.msg,okCallback:function(){
				        		$("#delete_role_modal").modal("hide");
				        			location.reload();
								}
				        	});
					}
				}
			})
		}
	});
}

//分配权限
function assignPermission(roleId){
	$('#assign_permission_modal').html("加载中...").load(ctx + '/role/manage/toAssignPermission?'+Math.random()+'&id='+roleId,function(res,	sta, xhr){
		if(res){//判断是否正常返回了数据--登录拦截,res,sta,xhr
			$("#assign_permission_modal").modal({
				keyboard:'false',//true是默认可是使用esc退出弹窗，false是不能使用esc退出
				show:'true',// bool值，立即调用show
				backdrop:'static' //static是只在弹窗内点击关闭按钮可以关闭
			});
		}
	});		
}

//保存权限分配信息
function saveAssignPermission(){
	var permissonId = $("#permissonId").val();
	if(permissonId == ''){
		Modal.alert({msg:"请选择权限"});
	    return false;
	}
	
	$.ajax({
		type: 'post',
		url: ctx +'/role/manage/saveAssignPermission',
		data: {id:$("#roleId").val(),permissonId:permissonId},
		dataType: 'json',
		success:function(data){
			if(data["success"]){
	        	Modal.alert({msg:"保存成功",okCallback:function(){
		        		$("#assign_permission_modal").modal("hide");
		        		$("#assign_permission_modal").on("hidden.bs.modal", function() {
		        			location.reload();
		        			$(this).off("hidden.bs.modal");
		        		});
					}
	        	});
			}else{
				Modal.alert({msg:data.msg});
			}
		}
	})	
}

//保存新增的角色信息
function saveAddRole(){
	var roleName = $("#roleName").val();
	if(roleName == ''){
		Modal.alert({msg:"请输入角色名称"});
    	return false;
	}
	var code = $("#code").val();
	if(code == ''){
		Modal.alert({msg:"请选择角色编码"});
    	return false;
	}
	
	$.ajax({
		type: 'post',
		url: ctx +'/role/manage/saveAddRole',
		data: $("#addRoleForm").serialize(),
		dataType: 'json',
		success:function(data){
			if(data.result == 'success'){
				Modal.alert({msg:"保存成功!",okCallback:function(){
						$("#add_role_modal").modal("hide");
						$("#add_role_modal").on("hidden.bs.modal", function() {
							location.reload();
							$(this).off("hidden.bs.modal");
						});
					}
	        	});
			}else{
				$("input[name='addRole']").val(data.newTokenName);
				Modal.alert({msg:data.msg});
			}
		}
	})
}

// 保存修改的角色信息
function saveUpdateRole() {
	var roleName = $("#roleName").val();
	if(roleName == ''){
		Modal.alert({msg:"请输入角色名称"});
    	return false;
	}
	var code = $("#code").val();
	if(code == ''){
		Modal.alert({msg:"请选择角色编码"});
    	return false;
	}
	$.ajax({
		type : 'post',
		url : ctx + '/role/manage/saveUpdateRole',
		data : $("#updateRoleForm").serialize(),
		dataType : 'json',
		success : function(data) {
			if (data.result == 'success') {
				Modal.alert({msg:"保存成功!",okCallback:function(){
						$("#update_role_modal").modal("hide");
						$("#update_role_modal").on("hidden.bs.modal", function() {
							location.reload();
							$(this).off("hidden.bs.modal");
						});
					}
	        	});
			} else {
				$("input[name='modifyRole']").val(data.newTokenName);
				Modal.alert({msg:data.msg});
			}
		}
	})
}

function configPageController(value) {
		var pageCount=$("#pageCount").val();
		if(value<1){
			value=1;
		}
		if(parseInt(value)>parseInt(pageCount)){
			value=pageCount;
		}
		$("#pageNow").val(value);
		$("#queryForm").submit();
}