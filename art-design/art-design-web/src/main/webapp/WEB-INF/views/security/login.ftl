<#assign ctx = request.contextPath>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />
		<title>登录</title>

		<meta name="description" content="">
    	<meta name="keywords" content="">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

		<!-- bootstrap & fontawesome -->
		<link rel="stylesheet" href="${ctx}/ace/css/bootstrap.css" />
		<link rel="stylesheet" href="${ctx}/ace/css/font-awesome.css" />
		
		<!-- text fonts -->
		<link rel="stylesheet" href="${ctx}/ace/css/ace-fonts.css" />

		<!-- ace styles -->
		<link rel="stylesheet" href="${ctx}/ace/css/ace.css" />

		<!--[if lte IE 9]>
			<link rel="stylesheet" href="${ctx}/ace/css/ace-part2.css" />
		<![endif]-->
		<link rel="stylesheet" href="${ctx}/ace/css/ace-rtl.css" />

		<!--[if lte IE 9]>
		  <link rel="stylesheet" href="${ctx}/ace/css/ace-ie.css" />
		<![endif]-->

		<!-- My style -->
		<link rel="stylesheet" href="${ctx}/css/smymain.css" />
		<link rel="stylesheet" href="${ctx}/css/mainsos.css" />
		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->

		<!--[if lt IE 9]>
		<script src="${ctx}/ace/js/html5shiv.js"></script>
		<script src="${ctx}/ace/js/respond.js"></script>
		<![endif]-->
        <link rel="stylesheet" href="${ctx}/css/smyIndex.css" />
	</head>

	<body class="login-layout Ifd_Login">
		<div class="main-container">
			<div class="main-content">
				<div class="row">
					<div class="col-xs-7 col-xs-offset-5">
						<div class="login-container login_Main">
                        <div class="logon_bg"></div>
							<div class="position-relative ">
								<!--<div id="login-box" class="login-box visible widget-box no-border">-->
                                <div id="login-box" class="login-box visible  no-border">
									<div class="widget-body login_con">
											
										<form id="loginForm" method="post" action="${ctx}/login/do">
											<fieldset>
												<label class="block clearfix ">
													<span class="block input-icon loginInputLabel">
                                                    	<i class="ace-icon fa fa-user"></i>
														<input type="text" class="form-control" id="username" name="username" placeholder="请输入用户名" required />  
													</span>
												</label>

												<label class="block clearfix ">
													<span class="block input-icon loginInputLabel">
                                                    	<i class="ace-icon fa fa-lock"></i>
														<input type="password" class="form-control" id="password" name="password" placeholder="请输入密码" required/>
													</span>
												</label>
                                                
                                                <label class="block clearfix ">
													<span class="block input-icon pull-left loginInputLabel inputVeCode">
														<input type="text" class="form-control" id="verifyCode" name="verifyCode" maxlength="4" autocomplete="off" placeholder="请输入验证码" required />
													</span>
													<span class="pull-right inputImgCode">
                                                    	<img src="${ctx}/kaptcha"  id="randImg">
                                                    </span>
												</label>
                                                <div class="Rtip1" id="Rtip" style=""><span id="checkResult" style="color:red;"></span></div>

												<div class="clearfix loginInputBut">

                                                    <a href="javascript:;" onclick="login();" class="default-btn btn-orange marginLR20 login-btn">登 录</a>
												</div>

												<div class="space-4"></div>
											</fieldset>
										</form>
									</div>	
								</div><!-- /.login-box -->

							</div><!-- /.position-relative -->

						</div>
					</div><!-- /.col -->
				</div><!-- /.row -->
			</div><!-- /.main-content -->
             <div class="logFooter">
				 合众云平台 &copy; 2015-2017 www.hezhongjinrong.com
             </div>
		</div><!-- /.main-container -->

		<!-- basic scripts -->

		<!--[if !IE]> -->
		<script type="text/javascript">
			window.jQuery || document.write("<script src='${ctx}/ace/js/jquery.js'>"+"<"+"/script>");
		</script>

		<!-- <![endif]-->

		<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='${ctx}/ace/js/jquery1x.js'>"+"<"+"/script>");
</script>
<![endif]-->
		<script type="text/javascript">
			if('ontouchstart' in document.documentElement) document.write("<script src='${ctx}/ace/js/jquery.mobile.custom.js'>"+"<"+"/script>");
		</script>

		<!-- 与此页相关的内联脚本 -->
        <script src="${ctx}/js/placeholder.js"></script>
		<script type="text/javascript">
		$(document).ready(function() {
			
			var message_login = "${message_login}";
			var username = "${username}";
			if(username){
			    $("#username").val(username);
			}
			$("#username").focus();
			if(message_login){
				$("#checkResult").html(message_login);
			}
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
			
			$("#randImg").click(function() {
				var randImg = $("#randImg");
				var src = $("#randImg").attr("src");
				var timestamp = (new Date()).valueOf();
				var url = "${ctx}/kaptcha?timestamp=" + timestamp;
				randImg.attr("src", url);
			});
			
			<#-- 解决ie获取焦点不放开的兼容性 -->
			$('.form-control').click(function(){
				$("#checkResult").html("");
			});
			
			$("#password").focus(function() {
				$("#checkResult").html("");
			});
		});
		
		<#-- 登录验证  -->
		function login() {
			$("#checkResult").html("");
			var username = $("#username")[0].value;
			if (username == null || username == "" || username == "请输入用户名") {
				$("#checkResult").html("用户名不能为空!");
				return false;
			}
			var password = $("#password")[0].value;
			if (password == null || password == "" || password == "请输入密码") {
				$("#checkResult").html("密码不能为空!");
				return false;
			}
			var verifyCode = $("#verifyCode").val();
			if (verifyCode == null || verifyCode == "" || verifyCode == "请输入验证码") {
				$("#checkResult").html("验证码不能为空!");
				return false;
			}
			
			$("#loginForm").submit();
		}
	
		if (window != top)
			top.location.href = location.href;
	</script>

		<script type="text/javascript">
			//禁止滚动条
			$(document.body).css({
				"overflow-x":"hidden",
				//"overflow-y":"hidden"
			});

		</script>
	</body>
</html>