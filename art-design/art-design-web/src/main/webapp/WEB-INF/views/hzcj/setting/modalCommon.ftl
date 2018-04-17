<!-- 修改密码成功跳转页面 --> 
<div class="modal fade HoranMyModals" id="updatePwd_operate_modal_ok" data-backdrop="static">
	<div class="modal-dialog" role="document" style="width: 430px; height: 230px;">
		<div class="modal-content">
			<div class="modal-body">
				<div class="container-fluid">
					<div class="row">
						<div class="text-center" style="font-size: 24px; padding: 50px 0" id="updatePwdOkDiv"></div>
					</div>
				</div>
			</div>
			<div class="modal-footer ">
				<div class="text-center">
					<a href="javascript:;" onclick="updatePwd();" class="default-btn btn-orange noBorder marginLR20">保 存</a>
					<a href="javascript:;" data-dismiss="modal" class="default-btn btn-gray marginLR20">取 消</a>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 修改用户名和手机号成功跳转页面 --> 
<div class="modal fade HoranMyModals" id="updateNameAndMobile_modal_ok" data-backdrop="static">
	<div class="modal-dialog" role="document" style="width: 430px; height: 230px;">
		<div class="modal-content">
			<div class="modal-body">
				<div class="container-fluid">
					<div class="row">
						<div class="text-center" style="font-size: 24px; padding: 50px 0" id="updateNameOkDiv"></div>
					</div>
				</div>
			</div>
			<div class="modal-footer ">
				<div class="text-center">
					<a href="javascript:;" onclick="updatePersonalCenter();" class="default-btn btn-orange noBorder marginLR20">保 存</a>
					<a href="javascript:;" data-dismiss="modal" class="default-btn btn-gray marginLR20">取 消</a>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 个人中心操作成功跳转页面 --> 
<div class="modal fade HoranMyModals" id="personalCenter_operate_modal_ok" data-backdrop="static">
	<div class="modal-dialog" role="document" style="width: 430px; height: 230px;">
		<div class="modal-content">
			<div class="modal-body">
				<div class="container-fluid">
					<div class="row">
						<div class="text-center" style="font-size: 24px; padding: 50px 0" id="personalCenterOkDiv"></div>
					</div>
				</div>
			</div>
			<div class="modal-footer ">
				<div class="text-center">
					<a href="javaScript:window.location.href='${ctx}/setting/personalCenter';" data-dismiss="modal" class="default-btn btn-orange noBorder marginLR20">关 闭</a>
				</div>
			</div>
		</div>
	</div>
</div>