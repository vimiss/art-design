//标识是否显示密码框
var pwdshow =true;
$(document).ready(function() {
	$("#addEmp").click(function(){
		$("#addOtherEmpForm :input").each(function(index,object){
			if($(object).prop("id")=="loginName"){
				$(object).prop("readonly","");
			}
//			if($(object).prop("type")=="text"||$(object).prop("type")=="hidden"){
//				$(object).prop("value","");
//			}else if($(object).prop("type")=="select-one"){
//				$(object).prop("value","");
//			}
		});
		$("#addOtherEmpForm").resetForm();
//		$("#addLeader").val(leader_default);
		$("#addSubject").val(subject_default);	
		$("#addStudySection").val(studySection_default);	
		$("#addEmpPWD").css("display","");
		$("#plainPassword").css("disabled","").val("000000");
		$("#rePassword").css("disabled","").val("000000");
		$("#warning").css("display","");
		$("#addOtherEmpSign").val("1");
		$("span.otheremp").each(function(){
			$(this).html("");
		});
		pwdshow =true;
		$("#add_part_time_job_modal").modal();
	});
	// 条件查询
	$("#queryTeacher").click(function() {
		$("#queryForm").submit();
	});
	// 清空
	$("#clean").click(function() {
		$("#empName")[0].value = "";
		$("#contact")[0].value = "";
		$("#mail")[0].value = "";
		$("#roleId").val("");
		$("#deptId").val("");
	});

	// 新增兼职员工
	$("#addOtherEmp").click(function() {
		$("#greyBackGround").css("display", "block");
		$("#addOtherEmpDiv").fadeIn("slow");
	});
	// 新增兼职员工 表单验证
	$("#loginName").keyup(function(){
		if($("#loginName").val().trim()!=""){
			$("#checkOtherEmpLoginName").html("");
		};
	});
	$("#otherEmpName").keyup(function(){
		if($("#otherEmpName").val().trim()!=""){
			$("#checkOtherEmpName").html("");
		};
	});
	$("#plainPassword").keyup(function(){
		if($("#plainPassword").val().trim()!=""){
			$("#checkPlainPassword").html("");
		};
	});
	$("#rePassword").keyup(function(){
		if($("#rePassword").val().trim()!=""){
			$("#checkRePassword").html("");
		};
	});
	$("#addStudySection").change(function(){
		if($("#addStudySection").val().trim()!=""){
			$("#checkAddStudySection").html("");
		};
	});
	$("#addSubject").change(function(){
		if($("#addSubject").val().trim()!=""){
			$("#checkAddSubject").html("");
		};
	});
	$("#mobilePhone").keyup(function(){
		if($("#mobilePhone").val().trim()!=""){
			$("#checkMobilePhone").html("");
		};
	});
	$("#qqNum").keyup(function(){
		if($("#qqNum").val().trim()!=""){
			$("#checkQqNum").html("");
		};
	});
	$("#email").keyup(function(){
		if($("#email").val().trim()!=""){
			$("#checkAddEmpEmail").html("");
		};
	});
	$("#school").keyup(function(){
		if($("#school").val().trim()!=""){
			$("#checkSchool").html("");
		};
	});
	$("#phone").keyup(function(){
		if($("#phone").val().trim()!=""){
			$("#checkPhone").html("");
		};
	});

	//
});

/**
 * 新增兼职员工
 */
function submitAddOtherEmp() {
	var $form = $("#addOtherEmpForm");
	var loginName = $form.find("input[name='loginName']").val();
/*	if (loginName == null || loginName == "") {
		$("#checkOtherEmpLoginName").html("登陆用户名不能为空！");
		return;
	}*/
	if(!/^[0-9a-zA-Z\.\-_]{6,20}$/.test(loginName)){
		$("#checkOtherEmpLoginName").html("员工账号格式不正确！");
		return;
	}
	var ename = $form.find("input[name='ename']").val().trim();
	if (ename == null || ename == "") {
		$("#checkOtherEmpName").html("员工姓名不能为空！");
		return;
	}
	if(pwdshow){
		
		var plainPassword = $form.find("input[name='plainPassword']").val();
		if (plainPassword == null || plainPassword == "") {
			$("#checkPlainPassword").html("密码不能为空！");
			return;
		}
		var pwdCheck =/^[0-9a-zA-Z`~!@#$%\^&*]{6,20}$/;
		if (!pwdCheck.test(plainPassword)) {
			$("#checkPlainPassword").html("密码格式不正确！");
			return;
		}
		var rePassword = $form.find("input[name='rePassword']").val();
		if (rePassword == null || rePassword == "") {
			$("#checkRePassword").html("确认密码不能为空！");
			return;
		}
		if (plainPassword != rePassword) {
			$("#checkRePassword").html("确认密码必须和密码一致！");
			return;
		}
	}
	var addStudySection = $form.find("select[name='studySectionCode.dictionaryItem.code'] option:selected").val();
	if (addStudySection == null || addStudySection == "") {
		$("#checkAddStudySection").html("学段不能为空！");
		return;
	}
	var addSubject = $form.find("select[name='subjectCode.dictionaryItem.code'] option:selected").val();
	if (addSubject == null || addSubject == "") {
		$("#checkAddSubject").html("学科不能为空！");
		return;
	}
	var mobileReg = /^1\d{10}$/;
	var mobilePhone =$form.find("input[name='mobilePhone']").val();
	if (mobilePhone == null || mobilePhone == ""){
		$("#checkMobilePhone").html("手机号不能为空");
		return
	}else if(!mobileReg.test(mobilePhone)){
		$("#checkMobilePhone").html("手机号不合法,请输入正确的手机号");
		return
	}

	var qqReg = /^[0-9]*$/;
	var qqNum =$form.find("input[name='qqNum']").val();
	if (qqNum == null || qqNum == ""){
		$("#checkQqNum").html("QQ号不能为空");
		return
	}else if(!qqReg.test(qqNum)){
		$("#checkQqNum").html("QQ 只能是数字.");
		return
	}
	
	var email = $form.find("input[name='email']").val();
	if (email == null || email == "") {
		$("#checkAddEmpEmail").html("电子邮件不能为空！");
		return;
	}
	var mailReg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
	if (!mailReg.test(email)) {
		$("#checkAddEmpEmail").html("邮件地址不合法，请输入合法的邮件地址！");
		return;
	}
	
/*	var leader = $form.find("select[name='leader'] option:selected").val();
	if (leader == null || leader == "") {
		$("#checkLeader").html("组长不能为空！");
		return;
	}*/
	
	var phone = $form.find("input[name='phone']").val().trim();
	var phoneReg = /^\d{3,4}-\d{7,8}$/;
	if (phone != null && phone!= "") {
		if (!phoneReg.test(phone)) {
			$("#checkPhone").html("联系电话格式不合法！示例：010-88889999");
			return;
		}
	}

	var school = $form.find("input[name='school']").val().trim();
	var schoolReg = /^[a-zA-Z0-9_\-\u4E00-\u9FA5]{0,30}$/;
	if (school != null && school!= "") {
		if (!schoolReg.test(school)) {
			$("#checkSchool").html("输入格式：0~30 位汉字、字母、数字、下划线和横线");
			return;
		}
	}
//	var empno = $("#addOtherEmpEmpno").val();
//	if (empno != null && empno != "") {
//		submitAddOtherEmpForm();
//	} else {
		validateLoginName("addOtherEmpForm");//验证账号和邮箱
//	}
}

function validateLoginName(formId) {
	$.ajax({
		type : "post",
		url : ctx+"/authority/employee/validateLoginName",
		data:$("#"+formId).serialize(),
		dataType : "json",
		async : false,
		error : function(request) {
			bootbox.alert("Connection error");
		},
		success : function(data) {
			if (data["message"] == "success") {
					submitAddOtherEmpForm();
			} else {
				delete data['message'];
           		for(var key in data){
           			$("#"+key).html(data[key]);
           		}
			}
		}
	});
}

function submitAddOtherEmpForm() {
	$.ajax({
		type : "POST",
		url : ctx+"/teacher/addOrUpdateEmp",
		data : $("#addOtherEmpForm").serialize(),
		async : false,
		error : function(request) {
			bootbox.alert("Connection error");
		},
		success : function(data) {
			$("#add_part_time_job_modal").modal("hide");
			bootbox.alert("保存成功",function(){
				location.reload();
			});
		}
	});
}

/**
 * 兼职员工信息修改
 * 
 * @param empno
 * @param deptId
 * @param roleId
 */
function otherEmpModify(empno) {
	$("span.otheremp").each(function(){
		$(this).html("");
	});
	$.ajax({
		type : "POST",
		url : ctx+"/teacher/getEmpInfo",
		data :{empno:empno},
		dataType:"json",
		async : false,
		error : function() {
			bootbox.alert("error");
		},
		success:function(data) {
			/*console.log(data);*/
			$("#addOtherEmpEmpno").val(data.empno);
			$("#addOtherEmpIsExpired").val(data.isExpired);
//			$("#addLeader").val(data.leader);
			$("#addStudySection").val(data.studySectionCode.dictionaryItem.code);
			$("#addSubject").val(data.subjectCode.dictionaryItem.code);
			$("#addEmpSex").val(data.sex);
			var $form = $("#addOtherEmpForm");
			$form.find("input[name='ename']").val(data.ename);
			$form.find("input[name='phone']").val(data.phone);
			$form.find("input[name='email']").val(data.email);
			$form.find("input[name='qqNum']").val(data.qqNum);
			$form.find("input[name='school']").val(data.school);
			$form.find("input[name='mobilePhone']").val(data.mobilePhone);
			$form.find("input[name='loginName']").val(data.loginName);
			$form.find("input[name='loginName']").attr("readonly", true);
			
			pwdshow= false;
			$("#addEmpPWD").css("display","none");
			$("#plainPassword").css("disabled","disabled").val("");
			$("#rePassword").css("disabled","disabled");
			$("#warning").css("display","none");
			$("#addOtherEmpSign").val("1");
			$("#add_part_time_job_modal").modal();
		}
	});
	
	
}

function getEmpList(pageNow) {
	$("#pageNow")[0].value = pageNow;
	$("#queryForm").submit();
}