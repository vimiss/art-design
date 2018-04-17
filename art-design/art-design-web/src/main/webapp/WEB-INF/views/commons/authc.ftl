<#assign ctx = request.contextPath>

<script type="text/javascript">
	
	$(document).ready(function() {
		var message_login = "${message_login}";
		var username = "${username}";
		if(message_login){
			$("#checkResult").html(message_login);
			$("#Rtip").show();
		}
		if(username){
			$("#username").val(username);
		}
		$("#username").focus();
		$(this).keydown(function(evt) {
			var k = window.event ? evt.keyCode : evt.which;
			if (evt.target.id != "reset") {
				if (k == 13) {
					login();
				} else if (k == 40) {
					$("#username")[0].value = "";
					$("#password")[0].value = "";
				}
			} else {
				if (k == 13) {
					login();
				}
			}
		});
		
		$(".form-control").blur(function() {
			$("#Rtip").hide();
			$("#checkResult").html("");
		});
		$(".form-control").focus(function() {
			$("#Rtip").hide();
			$("#checkResult").html("");
		});
		
		
		$("#reset").click(function() {
			$("#username")[0].value = "";
			$("#password")[0].value = "";
		});

		$("#randImg").click(function() {
			var randImg = $("#randImg");
			var src = $("#randImg").attr("src");
			var timestamp = (new Date()).valueOf();
			var url = "${ctx}/kaptcha?timestamp=" + timestamp;
			randImg.attr("src", url);
		});
	});

    $(document).ajaxError(onError);
      
    function onError(event, XMLHttpRequest, ajaxOptions, thrownError) {

    	if(XMLHttpRequest.status=='4011'){
    		popAjaxLogin();
    	}else if(XMLHttpRequest.status=='4012'){
    		Modal.alert({msg:"无权操作"});
    	}else if(XMLHttpRequest.status=='4018'){
    		Modal.alert({msg:"请您不要重复提交"});
    	}else{
    	}
    }
    
    function popAjaxLogin() {
    	var randImg = $("#randImg");
			var src = $("#randImg").attr("src");
			var timestamp = (new Date()).valueOf();
			var url = "${ctx}/kaptcha?timestamp=" + timestamp;
			randImg.attr("src", url);
    		$("#loginModal").modal({
							  	keyboard:'false',//true是默认可是使用esc退出弹窗，false是不能使用esc退出 foot
							  	show:'true',// bool值，立即调用show
							  	backdrop:'static'//static是只在弹窗内点击关闭按钮可以关闭
							});
    }
    
    function checkLoginStatus(){
    	var loginStatus = false;
		$.ajax({
		        type: "POST",
		        url:"${ctx}/login/login_status",
		        data:"",
		        async: false,
		        success: function(data) {
		        	if(data==false){
		        		popAjaxLogin();
		        	} else {
		        		loginStatus = true;
		        	}
		        }
		});
		return loginStatus;
    }
    
	function login(){
    	$("#checkResult").html("");
		var username = $("#username")[0].value;
		if (username == null || username == "") {
			$("#checkResult").html("用户名不能为空!");
			$("#Rtip").show();
			return false;
		}
		var password = $("#password")[0].value;
		if (password == null || password == "") {
			$("#checkResult").html("密码不能为空!");
			$("#Rtip").show();
			return false;
		}
		var verifyCode = $("#verifyCode")[0].value;
		if (verifyCode == null || verifyCode == "") {
			$("#checkResult").html("请输入验证码!");
			$("#Rtip").show();
			return false;
		}
		
    	$.ajax({
				type : "POST",
				url : "${ctx}/login/loginForAjax",
				data : {
					"username":$("#username").val(),
					"password":$("#password").val(),
					"verifyCode":$("#verifyCode").val()
				},
				async : false,
				error : function(request) {
					location.reload();
				},
				success : function(data) {
					if (data == "true") {
						$("#loginModal").modal("hide");
						$("#loginModal").on("hidden.bs.modal", function() {
							window.location.href=ctx+'/index';
						});
					} else {
						$("#checkResult").html(data);
						$("#Rtip").show();
					}
				}
			});
    }
    $(function(){
    	$("#username").val("${currentAccount.name}");
    	$("#username").attr("readonly","readonly");
    });
</script>

<!-- 登录弹出框 -->
<div class="modal fade in" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="z-index:2000">
	<div class="modal-dialog" role="document" style="width:480px" >
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title">登录</h4>
			</div>
			<div class="login-container">
				<div class="position-relative">
					<div id="login-box" class="login-box visible widget-box no-border">
						<div class="widget-body">
							<div class="widget-main">
								<h4 class="header blue lighter bigger">
									<i class="icon-coffee green"></i>
									请输入登录信息
								</h4>

								<div class="space-6"></div>

								<form id="loginForm" method="post">
                                        <div style="display: none;" id="Rtip" class="Rtip"><span style="color:red;" id="checkResult"></span></div>
										<label class="block clearfix">
											<span class="block input-icon input-icon-right">
												<i class="ace-icon fa fa-user"></i>
												<input type="text" class="form-control" id="username" name="username" placeholder="请输入用户名" required/>
												<i class="icon-user"></i>
											</span>
										</label>

										<label class="block clearfix">
											<span class="block input-icon input-icon-right">
												<i class="ace-icon fa fa-lock"></i>
												<input type="password" class="form-control" id="password" name="password" placeholder="请输入密码" required/>
												<i class="icon-lock"></i>
											</span>
										</label>
										
										<label class="block clearfix ">
											<span class="block input-icon pull-left">
												<input type="text" class="form-control" id="verifyCode" name="verifyCode" maxlength="4" placeholder="请输入验证码" autocomplete="off" required />
											</span>
                                            <span class="pull-right inputImgCode">
                                            	<img src=""  id="randImg" style="width: 130px;height: 35px">
                                            </span>
										</label>

										<div class="space"></div>

										<div class="clearfix">
													<div class="clearfix loginInputBut">

                                                        <a onclick="login();" href="javascript:;" class="default-btn btn-orange marginLR20">登 录</a>
													</div>
										</div>

										<div class="space-4"></div>
								</form>
								
							</div><!-- /widget-main -->
						</div><!-- /widget-body -->
					</div><!-- /login-box -->
				</div><!-- /position-relative -->
			</div>
		</div>
	</div>
</div>