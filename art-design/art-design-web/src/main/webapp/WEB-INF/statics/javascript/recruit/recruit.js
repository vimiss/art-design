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
//转单弹出
var diagnosis_id = null;
var teacher_id = null;
function given(diagnosisId,teacherId,teacherName,studentName){
	diagnosis_id = diagnosisId;
	teacher_id = teacherId;
	$("#teacher_name_given").text(teacherName);
	$("#student_name_given").text(studentName);
	$("#given_modal").modal({
	  	keyboard:'false',//true是默认可是使用esc退出弹窗，false是不能使用esc退出
	  	show:'true',// bool值，立即调用show
	  	backdrop:'static'//static是只在弹窗内点击关闭按钮可以关闭
	});
}
//转单提交
function given_submit(){
	var teacherId = $("#given_teacher_id").val();
	qingchu();
	$.ajax({
		type : "POST",
		url : ctx + "/recruit/given_submit",
		data : {
			assignTeacherId : teacherId, 
			diagnosisId : diagnosis_id,
			sourceTeacherId : teacher_id
		},
		async : false,
		dataType:"json",
		success : function(data) {
			if(data > 0){
				$("#modal_text").text("转单成功！");
				$("#given_modal").hide();
				$("#modal_ok").modal({
				  	keyboard:'false',//true是默认可是使用esc退出弹窗，false是不能使用esc退出
				  	show:'true',// bool值，立即调用show
				  	backdrop:'static'//static是只在弹窗内点击关闭按钮可以关闭
				});
				$("#zdjg").click(function(){
					$("#queryForm").submit();
				});
			}else if(data == -1){
				$("#modal_text").text("该单已属于当前招生教师！");
				$("#modal_ok").modal({
				  	keyboard:'false',//true是默认可是使用esc退出弹窗，false是不能使用esc退出
				  	show:'true',// bool值，立即调用show
				  	backdrop:'static'//static是只在弹窗内点击关闭按钮可以关闭
				});
				$("#zdjg").click(function(){
				});
			}else if(data == -2){
				$("#modal_text").text("该单已不属于当前招生教师！");
				$("#modal_ok").modal({
				  	keyboard:'false',//true是默认可是使用esc退出弹窗，false是不能使用esc退出
				  	show:'true',// bool值，立即调用show
				  	backdrop:'static'//static是只在弹窗内点击关闭按钮可以关闭
				});
				$("#zdjg").click(function(){
				});
			}else if(data == -3){
				$("#modal_text").text("请选择要转给的招生老师！");
				$("#modal_ok").modal({
				  	keyboard:'false',//true是默认可是使用esc退出弹窗，false是不能使用esc退出
				  	show:'true',// bool值，立即调用show
				  	backdrop:'static'//static是只在弹窗内点击关闭按钮可以关闭
				});
				$("#zdjg").click(function(){
				});
			}else{
				$("#modal_text").text("转单失败！");
				$("#given_modal").hide();
				$("#modal_ok").modal({
				  	keyboard:'false',//true是默认可是使用esc退出弹窗，false是不能使用esc退出
				  	show:'true',// bool值，立即调用show
				  	backdrop:'static'//static是只在弹窗内点击关闭按钮可以关闭
				});
				$("#zdjg").click(function(){
					$("#queryForm").submit();
				});
			}
		}
	});
}
//取消刷新
function quxiao(){
	$("#queryForm").submit();
}
//获得时长
function shichang(){
	$("#overtime_msg").empty();
	$("#overtime_modal").modal({
	  	keyboard:'false',//true是默认可是使用esc退出弹窗，false是不能使用esc退出
	  	show:'true',// bool值，立即调用show
	  	backdrop:'static'//static是只在弹窗内点击关闭按钮可以关闭
	});
	qingchu();
	$.ajax({
		type : "POST",
		url : ctx + "/recruit/overtime",
		async : false,
		dataType:"json",
		success : function(data) {
			$("#overtime").val(data);
		}
	});
}
//验证时长
function check_overtime(){
	var overtime = $("#overtime").val();
	var reg = /^[0-9]*[1-9][0-9]*$/;
	if(!(reg.test(overtime) && overtime.length < 4)){
		$("#overtime").val("");
	}else{
		$("#overtime_msg").empty();
	}
}
//修改时长
function update_overtime(){
	var overtime = $("#overtime").val();
	var reg = /^[0-9]*[1-9][0-9]*$/;
	if(reg.test(overtime) && overtime.length < 4){
		$("#overtime_msg").empty();
	}else{
	    $("#overtime_msg").empty();
	    $("#overtime_msg").append("格式错误！");
	    return;
	}
	qingchu();
	$.ajax({
		type : "POST",
		url : ctx + "/recruit/update_overtime",
		async : false,
		data : {
			overtime:overtime
		},
		dataType:"json",
		success : function(data) {
			if(data > 0){
				$("#modal_text").text("修改成功！");
				$("#overtime_modal").hide();
				$("#modal_ok").modal({
				  	keyboard:'false',//true是默认可是使用esc退出弹窗，false是不能使用esc退出
				  	show:'true',// bool值，立即调用show
				  	backdrop:'static'//static是只在弹窗内点击关闭按钮可以关闭
				});
				$("#zdjg").click(function(){
					$("#queryForm").submit();
				});
			}else{
				$("#modal_text").text("修改失败！");
				$("#overtime_modal").hide();
				$("#modal_ok").modal({
				  	keyboard:'false',//true是默认可是使用esc退出弹窗，false是不能使用esc退出
				  	show:'true',// bool值，立即调用show
				  	backdrop:'static'//static是只在弹窗内点击关闭按钮可以关闭
				});
				$("#zdjg").click(function(){
					$("#queryForm").submit();
				});
			}
			
		}
	});
}
//获取咨询记录详情
function consultation_detail(time,teacherName,intention,remarks,studentName){
	$("#consultation_student_name").html(studentName);
	$("#consultation_time").html(time);
	$("#consultation_teacher").html(teacherName);
	$("#consultation_remark").html(remarks);
	if(intention == 1){
		$("#consultation_intention").html("低");
	}else if(intention == 2){
		$("#consultation_intention").html("中");
	}else if(intention == 3){
		$("#consultation_intention").html("高");
	}
	$("#modal_query").modal({
	  	keyboard:'false',//true是默认可是使用esc退出弹窗，false是不能使用esc退出
	  	show:'true',// bool值，立即调用show
	  	backdrop:'static'//static是只在弹窗内点击关闭按钮可以关闭
	});
}

//获取咨询详情
function getConsultDetail(consultationId,studentId){
	$('#modal_query').html("加载中...").load(ctx + '/recruit/consult_detail?consultationId='+consultationId+'&studentId='+studentId+'&r='+Math.random(),function(){
		$("#modal_query").modal();
	});
}


//获取学生详情
function goDetail(diagnosisId){
	$('#detailModal').html("加载中...").load(ctx + '/recruit/detail?diagnosisId='+diagnosisId+'&r='+Math.random(),function(res,sta,xhr){
		if(res){//判断是否正常返回了数据--登录拦截,res,sta,xhr
			$("#detailModal").modal();
		}
	});
}

//编辑学生信息
function goUpdate(diagnosisId){	
	$('#editModal').html("加载中...").load(ctx + '/recruit/edit?diagnosisId='+diagnosisId+'&r='+Math.random(),function(res,sta,xhr){
		if(res){//判断是否正常返回了数据--登录拦截,res,sta,xhr
			$("#editModal").modal();
		}
	});
}

//更新学生信息
function saveStudent() {
	
	//校验姓名 (必填)
	var studentName = $.trim($("#dname").val());
	if (studentName == null || studentName == "") {
		$("#checkStudentName").html("姓名不能为空！");
		return;
	}
	//检查输入内容是否规范
	if(!isRealStuName(studentName)){
		$("#checkStudentName").html("姓名只能为20位以内汉字或字母！");
		return;
	}
	
	//家长1手机号码 (必填)	
	var motherMobile = $.trim($("#dmotherMobile").val());
	//家长2手机号码(非必填)
	var fatherMobile = $.trim($("#dfatherMobile").val());
	
	if((motherMobile == null || "" == motherMobile) && (fatherMobile == null || "" == fatherMobile) ){
		$("#checkMotherMobile").html("请至少输入一个家长手机号！");
		$("#checkFatherMobile").html("请至少输入一个家长手机号！");
		return;
	}else{
		if((null != motherMobile && "" != motherMobile) && !isMobile(motherMobile)){
			$("#checkMotherMobile").html("请输入正确的手机号！");
			return;
		}
		if((null != fatherMobile && "" != fatherMobile) && !isMobile(fatherMobile)){
			$("#checkFatherMobile").html("请输入正确的手机号！");
			return;
		}
	}
	
	//其他手机号码(非必填)
	var otherMobile = $.trim($("#dotherMobile").val());
	if(null != otherMobile && "" != otherMobile){
		if(!isMobile(otherMobile)){
			$("#checkOtherMobile").html("请输入正确的手机号！");
			return;
		}
	}
	
	//学校名称(必填)
	var schoolName = $.trim($("#dschoolName").val());
	if(null == schoolName || "" == schoolName){
		$("#checkSchoolName").html("请输入学校名称！");
		return;
	}
	if(!isRealStr(schoolName)){
		$("#checkSchoolName").html("只能包含汉字、数字、英文，不能包含其他特殊字符！");
		return;
	}
	
	//班级名称
	var className = $.trim($("#dclassName").val());
	if(null != className && "" != className){
		if(!isRealStr(className)){
			$("#checkClassName").html("只能包含汉字、数字、英文，不能包含其他特殊字符！");
			return;
		}
	}
	
	//性别
	var isCheckgrade = $("input[name='sex']").is(':checked');
	if (!isCheckgrade) {
		$("#checkStudentSex").html("请选择性别！");
		return;
	}
	
	//组装生日数据
	var year = $("#sel_year").val();
	var month = $("#sel_month").val();
	var day = $("#sel_day").val();
	var birthdaystr = year+"-"+month+"-"+day;
	if(birthdaystr != "0-0-0"){
		if("0" == year || "0" == month || "0" == day) {
			$("#checkBirthday").html("请输入正确的生日信息！");
			return;
		}
		$("#birthdaystr").val(birthdaystr);
	}
	checkExit();
}

//学生是否存在校验的 ajax
var checkExit = function(){
	if($("#oldName").val()!=$("#dname").val() || $("#oldMotherMobile").val()!=$("#dmotherMobile").val() || $("#oldFatherMobile").val()!=$("#dfatherMobile").val()){
		$.ajax({
			type : "POST",
			url : ctx + "/recruit/isExit",
			data : $("#editForm").serialize(),
			async : false,
			dataType:"json",
			success : function(data) {
				if(data.success){
					$("#checkStudentName").html("该学生已被占用，请确认学生姓名和家长电话后，重试！");
					return;
				}else{
					$("#checkStudentName").html("");
					ajaxUpdate();
				}
			}
		});
	}else{
		ajaxUpdate();
	}
}

function ajaxUpdate(){
	$.ajax({
		type : "POST",
		url : ctx + "/recruit/update",
		data : $("#editForm").serialize(),
		async : false,
		dataType:"json",
		success : function(data) {
			if(data.success){
				$("#editModal").modal("hide");
				Modal.alert({msg:"保存成功",okCallback:function(){
						$("#queryForm").submit();
					}
				});
			}else{
				Modal.alert({msg:"保存失败"});
			}
		}
	});
}