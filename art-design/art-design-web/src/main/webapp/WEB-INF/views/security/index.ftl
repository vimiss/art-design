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
								<div style="width: 1100px; margin: 0 auto">
                                	<div class="  clearfix no-padding">
                                	<div class="pull-left indaxCon">
                                    	<div class="indexIcon1">
                                            <a href="${ctx}/recruit/list">
												<div class="IndexUp IndexUp1"></div>
												<div class="IndexDown IndexDown1"></div>
                                                <h3>招生系统</h3>
                                                <p>随时随地发布任务，数据分析及时查看</p>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="pull-left indaxCon">
                                    	<div class="indexIcon2">
                                            <a href="${ctx}/jiaoxue">
												<div class="IndexUp IndexUp2"></div>
												<div class="IndexDown IndexDown2"></div>

												<h3>教学系统</h3>
                                                <p>提高教师教学效率，帮助提升学生学习积极性和持久性</p>
                                        	</a>
                                         </div>
                                    </div>
                                    <div class="pull-left indaxCon indaxConmar0">
                                    	<div class="indexIcon3">
											<a href="${ctx}/guanli">
												<div class="IndexUp IndexUp3"></div>
												<div class="IndexDown IndexDown3"></div>

												<h3>管理系统</h3>
												<p>具有实训的多样化，体系化，综合化等特点</p>
											</a>

											<!--<div class="hover"></div> -->  <!--未开通的添加这个div-->
                                        </div>
                                    </div>
                                    <div class="pull-left indaxCon ">
                                    	<div class="indexIcon4">
                                            <a href="${ctx}/hudong">
												<div class="IndexUp IndexUp4"></div>
												<div class="IndexDown IndexDown4"></div>

												<h3>互动系统</h3>
                                                <p>安全稳定快捷，文件无丢失，完全私有部署</p>
                                            </a>

                                        </div>
                                    </div>
                                    <div class="pull-left indaxCon">
                                    	<div class="indexIcon5">
											<a href="${ctx}/zengzhi" >
												<div class="IndexUp IndexUp5"></div>
												<div class="IndexDown IndexDown5"></div>

												<h3>增值服务</h3>
												<p>实现对学情质量及时有效的监控、诊断和反馈</p>
											</a>
                                        </div>
                                    </div>
                                    <div class="pull-left indaxCon indaxConmar0">
                                    	<div class="indexIcon6">
                                            <a href="${ctx}/datacenter" >
												<div class="IndexUp IndexUp6"></div>
												<div class="IndexDown IndexDown6"></div>

												<h3>大数据中心</h3>
                                                <p>提高学生提交作业，教师批改作业的效率，方便互动交流</p>
                                            </a>
											<!--<div class="hover"></div>&lt;!&ndash;未开通的添加这个div&ndash;&gt;-->
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