<!DOCTYPE html>
<#assign jsv = 1>
<html lang="en">
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />
		<title>合众云后台管理系统</title>

		<meta name="description" content="" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

		<!-- bootstrap & fontawesome -->
		<link rel="stylesheet" href="${ctx}/ace/css/bootstrap.css" />
		<link rel="stylesheet" href="${ctx}/ace/css/font-awesome.css" />

		<!-- page specific plugin styles -->

		<!-- text fonts -->
		<link rel="stylesheet" href="${ctx}/ace/css/ace-fonts.css" />

		<!-- ace styles -->
		<link rel="stylesheet" href="${ctx}/ace/css/ace.css" class="ace-main-stylesheet" id="main-ace-style" />

		<!--[if lte IE 9]>
			<link rel="stylesheet" href="${ctx}/ace/css/ace-part2.css" class="ace-main-stylesheet" />
		<![endif]-->

		<!--[if lte IE 9]>
		  <link rel="stylesheet" href="${ctx}/ace/css/ace-ie.css" />
		<![endif]-->
        
        <!-- My style -->
		<link rel="stylesheet" href="${ctx}/css/smymain.css" />
		<link rel="stylesheet" href="${ctx}/css/mainsos.css" />
		<link rel="stylesheet" href="${ctx}/css/indexStyle.css" />
		<link rel="stylesheet" type="text/css" href="${ctx}/pg/upload/res/uploadify.css">
		
		<!-- zx style -->
		<link rel="stylesheet" href="${ctx}/css/smyIndex.css" />
		

		<!-- inline styles related to this page -->

		<!-- ace settings handler -->
		<script src="${ctx}/ace/js/ace-extra.js"></script>

		<!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

		<!--[if lte IE 8]>
		<script src="${ctx}/ace/js/html5shiv.js"></script>
		<script src="${ctx}/ace/js/respond.js"></script>
		<![endif]-->
		<style>
			.aName a{color:#3eafe0;}
			.aName a:hover{color:#ff6600;}
		</style>
	</head>
	
	<body class="no-skin">
		<!-- #section:basics/navbar.layout -->
		<div id="navbar" class="navbar navbar-default ">
			<div class="navbar-container   Ifd_navbar" id="navbar-container">
				<div class="clearfix" >
					<div class="navbar-header pull-left ">
						<a href="${ctx}/index" class="navbar-brand no-padding-left no-padding-right">
							<img src="${ctx}/img/logo_new.png" alt="logo">
						</a>

					</div>
					<!-- #section:basics/navbar.dropdown -->
					<div class="navbar-buttons navbar-header pull-right" role="navigation">
						<ul class="nav ace-nav NavDiv">

							<span class="pull-left sosTiotit" style="margin-top: 20px;">
								<#if currentAccount.type==2>
									您好，${currentAccount.name}
								<#else>
									<#if roles>
										当前角色：
										<#list roles as role>
											${role.name}&nbsp;&nbsp;
										</#list>
									</#if>
									<br />
									您好，${currentAccount.name}
								</#if>
								
							
							</span>

							<li class="">
								<a class="" href="${ctx}/setting/index">
									<i class="ace-icon fa   fa-cog   bigger-180"></i>
									<br />
									<span>设置</span>
								</a>
							</li>

							<li class="endLi">
								<a href="${ctx}/login/logout">
									<i class="ace-icon fa fa-power-off  bigger-180"></i>
									<br />
									<span>退出</span>

								</a>
							</li>

						</ul>
					</div>
				</div>
				<!-- /section:basics/navbar.dropdown -->
			</div><!-- /.navbar-container -->
		</div>
		
		<div class="result" id="outdiv">  
		    <div class="indiv">  
		        <img class="imgresult" id="bigimg">  
		    </div>    
		</div> 

<#include "hzcj/common/number.ftl">
<#include "hzcj/common/option.ftl">
<script>
	var ctx="${ctx}";
	
	 function provinceCitySelect(provinceCode, citySelectId) {
	 	if (provinceCode) {
	 		$.ajax({
				type: "post",
				dataType: "json",
				data: {"paramName": "city_type_param", "pcCode": provinceCode},
				url: "${ctx}/dict/city/code",
				success: function(result) {
					if (result.code == "0") {
						var cityListVar = result.value.optionList;
						var cityObj = $("#" + citySelectId);
						
						cityObj.html('<option value="">请选择</option>');
						for (var i = 0; i < cityListVar.length; i++) {
							var cityVar = cityListVar[i];
							cityObj.append('<option value="' + cityVar.optionName + '">' + cityVar.optionDesc + '</option>');
						}
					}
				}
			});
	 	} else {
	 		var cityObj = $("#" + citySelectId);
			cityObj.html('<option value="">请选择</option>');
	 	}
	 }
</script>

<script>
	<!-- 高清大图 -->
	function showImg(thiselement){  
		var outdiv = $("#outdiv"); 
		var bigimg = $("#bigimg"); 
	    var winW = $(window).width();  
	    var winH = $(window).height();  
	    var src = $(thiselement).attr('src');  
	    bigimg.attr("src",src);  
	    $("<img/>").attr("src",src).load(function(){
	    	var imgStW = 1024;
	    	var imgStH = 768;
	        var imgW = this.width;
	        var imgH = this.height;
	        var scale= imgW/imgH;
	        if (imgW < imgStW) {
	        	 bigimg.css("width", imgW + "px").css("height", imgH + "px");  
	        } else {
	        	 bigimg.css("width", imgStW + "px").css("height", imgStH + "px");  
	        }
	        
	        outdiv.fadeIn("fast");  
	        outdiv.click(function(){  
	            $(this).fadeOut("fast");  
	        });                               
	    });  
	} 
	
</script>