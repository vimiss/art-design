$(function(){
	//查询
	$("#queryCommit").click(function(){
		if(checkLoginStatus() == false) return;
		$("#pageNow").val(1);
		$("#queryForm").submit();
	});
	
});
//加载新增角色弹窗
function addRoleShow(id){
	$('#add_role_modal').html("加载中...").load(ctx + '/account/toAddRole?r='+Math.random()+'&uId='+id,function(res,sta,xhr){
		if(res){//判断是否正常返回了数据--登录拦截,res,sta,xhr
			$("#add_role_modal").modal({
				keyboard:'false',//true是默认可是使用esc退出弹窗，false是不能使用esc退出
				show:'true',// bool值，立即调用show
				backdrop:'static'//static是只在弹窗内点击关闭按钮可以关闭
			});
		}
	});
}



//加载新增员工信息弹窗
function addEmployeeShow(){
	$('#add_employee_modal').html("加载中...").load(ctx + '/account/toAddAccount?r='+Math.random(),function(res,sta,xhr){
		if(res){//判断是否正常返回了数据--登录拦截,res,sta,xhr
			$("#add_employee_modal").modal({
				keyboard:'false',//true是默认可是使用esc退出弹窗，false是不能使用esc退出
				show:'true',// bool值，立即调用show
				backdrop:'static'//static是只在弹窗内点击关闭按钮可以关闭
			});
		}
	});
}
//加载修改员工信息弹窗
function updateEmployeeShow(id){
	$('#add_employee_modal').html("加载中...").load(ctx + '/account/toUpdateAccount?r='+Math.random()+'&id='+id,function(res,sta,xhr){
		if(res){//判断是否正常返回了数据--登录拦截,res,sta,xhr
			$("#add_employee_modal").modal({
				keyboard:'false',//true是默认可是使用esc退出弹窗，false是不能使用esc退出
				show:'true',// bool值，立即调用show
				backdrop:'static'//static是只在弹窗内点击关闭按钮可以关闭
			});
		}
	});
}



//激活账户
function activatesAccount(id){
    $.ajax({
        type        : 'POST',
        url         : ctx+'/account/activatesAccount',
        data        : "r="+Math.random()+"&id=" + id ,
        dataType    : 'json',
        encode      : true
    }).done(function(json) {
        if (json.result) {
        	Modal.alert({msg:json.success,okCallback:function(){
        		location.reload();
				}
			});
        } else {
        	Modal.alert({msg:json.error});
        	return false;
        }
    }).fail(function (jqXHR, textStatus) {
    	Modal.alert({msg:"网络错误："+json.error,okCallback:function(){
    		location.reload();
			}
		});

    });

}	
//注销账户
function logoutAccount(id){
	Modal.confirm({msg:"确认注销吗？",okCallback:function(){  
        $.ajax({
            type        : 'POST',
            url         : ctx+'/account/logoutAccount',
            data        : "r="+Math.random()+"&id=" + id ,
            dataType    : 'json',
            encode      : true
        }).done(function(json) {
            if (json.result) {
            	Modal.alert({msg:json.success,okCallback:function(){
            		location.reload();
					}
				});
            } else {
            	Modal.alert({msg:json.error,okCallback:function(){
            		location.reload();
					}
				});
            	return false;
            }
        }).fail(function (jqXHR, textStatus) {
        	Modal.alert({msg:"网络错误："+json.error,okCallback:function(){
        		location.reload();
    			}
    		});

        });  
	 } 
    });  


}

//删除账户
function deleteAccount(id){
	Modal.confirm({msg:"确认删除吗？",okCallback:function(){   
            $.ajax({
                type        : 'POST',
                url         : ctx+'/account/deleteAccount',
                data        : "r="+Math.random()+"&id=" + id ,
                dataType    : 'json',
                encode      : true
            }).done(function(json) {
                if (json.result) {
                	Modal.alert({msg:json.success,okCallback:function(){
                		location.reload();
    					}
    				});
                } else {
                	Modal.alert({msg:json.error});
                	return false;
                }
            }).fail(function (jqXHR, textStatus) {
            	Modal.alert({msg:"网络错误："+json.error,okCallback:function(){
            		location.reload();
        			}
        		});

            });  
        }
    });  


}

function saveRole(){
	var roleIds = $("input:checkbox[name='role']:checked").map(function(index,elem) {return $(elem).val();}).get().join(',');
	if(roleIds == ''){
		Modal.alert({msg:"请选择角色"});
		return false;
	}
	var uId = $('#uId').val();
    $.ajax({
        type        : 'POST',
        url         : ctx+'/account/saveRole',
        data        : {"roleIds[]":roleIds,"uId":uId,"r":Math.random()},
        dataType    : 'json',
        encode      : true
    }).done(function(json) {
        if (json.result) {
        	Modal.alert({msg:"角色分配成功",okCallback:function(){
        		location.reload();
				}
			});
            return true;
        } else {
        	Modal.alert({msg:"角色分配失败："+json.error,okCallback:function(){
        		location.reload();
				}
			});
        	return false;
        }
    }).fail(function (jqXHR, textStatus) {
    	Modal.alert({msg:"网络错误："+json.error,okCallback:function(){
    		location.reload();
			}
		});

    });
}





//翻页动作
function queryformPage() {
  $("#lastQueryForm").submit();
}

//开通app账号
function getRadioInput() {
	var radioInput = $("input:radio:checked").val();
	return radioInput;
}
function queryAccoChoice() {
	var idRadio = getRadioInput();
	if (!idRadio) {
		Modal.alert({msg:"请选择一条需要操作的数据"});
		return;
	}
	$.ajax({
		type: "post",
		dataType: "json",
		data: {"id":idRadio},
		url: ctx+"/account/app/open/check",
		success: function(result) {
			if (result.code == "0") {
				var userFpStaff = result.value.userFpStaff;
				if (userFpStaff) {
					registerApp("mobile=" + userFpStaff.fpMobile + "&orgId=" + userFpStaff.orgId);
				} 
			} else {
				Modal.alert({msg:result.msg});
			}
		}
	});
}
function registerApp(param) {
	
	$('#fp_staff_open_app_modal').html("加载中...").load(ctx+'/account/app/open/page',param, function(res,sta,xhr) {
		if(res){//判断是否正常返回了数据--登录拦截,res,sta,xhr
			$("#fp_staff_open_app_modal").modal({
				keyboard:'false',//true是默认可是使用esc退出弹窗，false是不能使用esc退出
				show:'true',// bool值，立即调用show
				backdrop:'static'//static是只在弹窗内点击关闭按钮可以关闭
			});
		}
	});
}
