<#assign ctx = request.contextPath>
					<li>
							<a 	href="${ctx}/hzy?menuIndex=0">
								<i class="menu-icon fa fa-file-text"></i>
								<span class="menu-text">
									欢迎页
								</span>
							</a>
					</li>
	<#list resources as root>
						<#if root.parentId==0>
						<li>
							<a 	<#if root.url!="">href="${ctx}${(root.url)}?menuIndex=${root_index+1}"<#else>href="javascript:" </#if>>
								<i class="menu-icon fa fa-file-text"></i>
								<span class="menu-text">
									${root.name}
								</span>
							</a>
							<ul class="sub-menu">
							<#list resources as second>
								<#if second.parentId==root.id>
									<li>
										<a 	href="${ctx}${(second.url)}?menuIndex=${root_index+1}&secIndex=${second.orderId}">
											<i class="menu-icon fa fa-file-text"></i>
											<span class="menu-text">
												${second.name}
											</span>
										</a>
									</li>	
								</#if>
							</#list>
							</ul>
						</li>
						</#if>
	</#list>
	<span style="display:none;" class=menuIndex>${menuIndex}</span>
	<span style="display:none;" class=secIndex>${secIndex}</span>
	<script type="text/javascript"  src="${ctx}/js/jquery-1.11.3.js"></script>
	<script type="text/javascript">
		$(function(){
			//去掉左侧栏伸缩展开效果
			$('.sidebar-toggle').removeClass('sidebar-collapse').css('cursor','default');
		
			var menuIndex = $(".menuIndex").text();
			var nowSearch = window.location.search;
			if(!menuIndex&&nowSearch){
				 menuIndex = nowSearch.split('=')[1].split('&')[0];
				var secIndex = nowSearch.split('=')[2];
				if(menuIndex && secIndex){
					$('.nav-list>li').eq(menuIndex).addClass('active').siblings().removeClass('active');
					$('.nav-list>li').eq(menuIndex).find('ul').show().find('li').eq(secIndex-1).addClass('active').siblings().removeClass('active');
					
				}else{
					$('.nav-list>li').eq(menuIndex).addClass('active').siblings().removeClass('active');
				}
			}else{
				var secIndex =  $(".secIndex").text();
				if(menuIndex && secIndex){
					$('.nav-list>li').eq(menuIndex).addClass('active').siblings().removeClass('active');
					$('.nav-list>li').eq(menuIndex).find('ul').show().find('li').eq(secIndex-1).addClass('active').siblings().removeClass('active');
					
				}else{
					$('.nav-list>li').eq(menuIndex).addClass('active').siblings().removeClass('active');
				}
			}
			$('.nav-list>li>a').click(function(){
				$(this).parent("li").addClass('active');
				$(this).parent("li").siblings().removeClass('active');
				 var index = $(this).parent("li").index();//点击得哪个主菜单
				  var hasChild = $(this).siblings("ul");
				  
				  if(hasChild){
				  	$(hasChild).slideToggle();  	
				  }	
			})
			var len = $('.breadcrumb li').length;
			if(len ==4)
			{
				var firstTitle = $('.nav-list>li.active>a').text();
				var secTitle = $('.sub-menu li.active').text();
			
				$('.breadcrumb li').eq(2).find('a').text(firstTitle);
				var href = $('.sub-menu li.active').parent().find('li').eq(0).find('a').attr('href');
				$('.breadcrumb li').eq(2).find('a').attr('href', href);
				$('.breadcrumb li').eq(3).text(secTitle);
			}
		})
	</script>
	
				

