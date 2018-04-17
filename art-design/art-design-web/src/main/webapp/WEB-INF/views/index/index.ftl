<#assign ctx = request.contextPath>
<#include "commons/head.ftl">
		<!-- /section:basics/navbar.layout -->
		<div class="main-container" id="main-container">
			<script type="text/javascript">
				try{ace.settings.check('main-container' , 'fixed')}catch(e){}
			</script>

			<!-- /section:basics/sidebar -->
			<div class="main-content">
				<div class="main-content-inner">

					<!-- /section:basics/content.breadcrumbs -->
					<div class="page-content page_cont">
						<!-- /section:settings.box -->
						<div class="row" style=" padding-top: 45px;">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->
								<div style="width: 340px; margin: 0 auto">
                                	<div class="  clearfix no-padding">
                                    <div class="pull-left indaxCon">
                                    	<div class="indexIcon2">
                                            <a href="${ctx}/hzy?menuIndex=0">
												<div class="IndexUp IndexUp2"></div>
												<div class="IndexDown IndexDown2"></div>

												<h3>合众云后台管理系统</h3>
                                                <p>提高工作效率，帮助投资顾问提高积极性和持久性</p>
                                        	</a>
                                         </div>
                                    </div>
                                </div>
								</div>
								<!-- PAGE CONTENT ENDS -->
							</div><!-- /.col -->
						</div><!-- /.row -->
					</div><!-- /.page-content -->
				</div>
			</div><!-- /.main-content -->
		</div><!-- /.main-container -->
<#include "commons/foot.ftl">
<!--body html end-->
<#include "commons/end.ftl">
