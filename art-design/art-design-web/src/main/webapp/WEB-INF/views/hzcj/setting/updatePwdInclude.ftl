<div class="row" style="padding-top: 10px;">
                  <div class="col-xs-12">
                    <!-- PAGE CONTENT BEGINS -->
                    <div class=" Mylist clearfix">
                    	<form id="updatePwdForm" name="updatePwdForm" method="post" action="${ctx }/setting/update_pwd">
                    	 	<input name="accountId" id="accountId" type="hidden"  value="${account.id}">
		                   	  <!-- 文本内容开始 -->
		                      <div class="col-xs-12 MylistCol">
		                        <div class="pull-left MylistLeft">旧密码：</div>
		                        <div class="pull-left MylistRight">
		                          <div class="row">
		                            <div class="col-xs-12">
			                              <input id="oldPwd" class="InputName1" name="oldPwd" type="password" value="">
			                              <span id="checkOldPwd" class="red" style="margin-left: 20px;"></span>
		                            </div>
		                          </div>
		                        </div>
		                      </div>
		                       <div class="col-xs-12 MylistCol">
		                        <div class="pull-left MylistLeft">新密码：</div>
		                        <div class="pull-left MylistRight">
		                          <div class="row">
		                            <div class="col-xs-12">
		                              	  <input id="newPwd" class="InputName1" onkeyup="checkPassword()" name="newPwd" type="password">
			                              <span id="checkNewPwd" class="red" style="margin-left: 20px;"></span>
		                            </div>
		                          </div>
		                        </div>
		                      </div>
		                       <div class="col-xs-12 MylistCol" style="border-bottom: 1px solid #dcdcdc">
		                        <div class="pull-left MylistLeft">确认密码：</div>
		                        <div class="pull-left MylistRight">
		                          <div class="row">
		                            <div class="col-xs-12">
			                              <input id="confirmPwd" class="InputName1" name="confirmPwd" type="password">
		                              	  <span id="checkConfirmPwd"  class="red" style="margin-left: 20px;"></span>
		                            </div>
		                          </div>
		                        </div>
		                      </div>
		                      <!-- 文本内容结束 -->
                      	</form>
                      <div class="text-center col-xs-6 col-xs-offset-3" style="margin-top: 20px;">
                        <a type="button" class="default-btn btn-orange noBorder marginLR20" href="javascript:;" onClick="checkPwd();">保 存</a>
                      </div>
                    </div>
                    <!-- PAGE CONTENT ENDS -->
                  </div>
                  <!-- /.col -->
                </div>
                <!-- /.row -->