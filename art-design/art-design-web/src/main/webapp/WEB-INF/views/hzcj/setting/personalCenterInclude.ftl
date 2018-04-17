<div class="row" style="padding-top: 10px;">
                  <div class="col-xs-12">
                    <!-- PAGE CONTENT BEGINS -->
                    <div class=" Mylist clearfix">
                    	<form id="personalCenterForm" name="personalCenterForm" method="post" action="${ctx }/setting/update_personal_center">
	                      	<!-- 文本内容开始 -->
			                <div class="col-xs-12 MylistCol">
								<div class="pull-left MylistLeft">
									<strong class="InputStrong">登录用户名：</strong>
								</div>
								<div class="pull-left MylistRight">
									<input name="name" id="accountName" type="text" class="InputName1" value="${account.name}" maxlength="20"  placeholder="限中文(2-20位)">
									<span id="checkaccountName" class="red" style="margin-left: 20px;"></span>
								</div>
							</div>
							
							<div class="col-xs-12 MylistCol">
								<div class="pull-left MylistLeft">
									<strong class="InputStrong">手机号码：</strong>
								</div>
								<div class="pull-left MylistRight">
									<input type="text" name="mobile" id="mobile" class="InputName1" value="${account.mobile}" maxlength="11">
									<span id="checkMobile" class="red" style="margin-left: 20px;"></span>
								</div>
							</div>
	                      	<input type="hidden" value="${account.id}" id="id" name="id" >
	                  </form>
                      <div class="text-center col-xs-6 col-xs-offset-3" style="margin-top: 20px;">
                        <a type="button" class="default-btn btn-orange noBorder marginLR20" href="javascript:;" onClick="checkPersonalCenterForm()">保 存</a>
                      </div>
                    </div>
                    <!-- PAGE CONTENT ENDS -->
                  </div>
                  <!-- /.col -->
                </div>
                <!-- /.row -->