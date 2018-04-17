<#assign ctx = request.contextPath>
<#include "hzcj/common/option.ftl">
<!-- Modal -->
<div class="modal-dialog modal-lg1" role="document">
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
			<h4 class="modal-title" id="myModalLabel">新增推送</h4>
		</div>
		<div class="modal-body">
		<form id="msgpushForm" name="msgpushForm" method="post" >
				<!-- 文本内容开始 -->
							<div class="col-xs-12 MylistCol">
								<div class="pull-left MylistLeft">
									<strong class="InputStrong"><span class="red">*</span>推送类型：</strong>
								</div>
								<div class="pull-left MylistRight">
									<select class="chosen-select AceSelect" name="pushType" id="pushType">
											<@option name="msgpush_push_type_param" status="1" />
									</select>
										<span id="checkType" class="red" style="margin-left: 20px;"></span>
								</div>
							</div>
							 <div class="col-xs-12 MylistCol">
								<div class="pull-left MylistLeft">
									<strong class="InputStrong"><span class="red">*</span>推送内容：</strong>
								</div>
								<div class="pull-left MylistRight">
									<input name="pushContent" id="pushContent" type="text" class="InputName1"  maxlength="100"  placeholder="限100字符(中文字符长度为2)">
									<span id="checkPushContent" class="red" style="margin-left: 20px;"></span>
								</div>
							</div>
							<div class="col-xs-12 MylistCol">
								<div class="pull-left MylistLeft">
									<strong class="InputStrong">推送标题：</strong>
								</div>
								<div class="pull-left MylistRight">
									<input type="text" name="pushTitle" id="pushTitle" class="InputName1"  maxlength="100" placeholder="限50字符(中文字符长度为2)">
									<span id="checkTitle" class="red" style="margin-left: 20px;"></span>
								</div>
							</div>
							<!--<div class="col-xs-12 MylistCol">
								<div class="pull-left MylistLeft">
									<strong class="InputStrong">推送url：</strong>
								</div>
								<div class="pull-left MylistRight" > 
										<input type="text" name="url" value="${url}" class="InputName1" style="width:500px;"  />
								</div>
							</div>-->
							<input type="hidden" name="addMsgpush" value="${addMsgpush?if_exists}"> 
	                      	<!-- 文本内容结束 -->
		</form>
		</div>
		<div class="modal-footer">
			<div class="text-center">
				<a href="javascript:;" onclick="checkPersonalCenterForm()" class="default-btn btn-orange noBorder marginLR20">保 存</a>
				<a href="javascript:;" data-dismiss="modal" class="default-btn btn-gray marginLR20">取 消</a>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript" charset="utf-8" src="${ctx}/javascript/hzcj/len.js"></script>
	<script >
	function checkPersonalCenterForm(){
		var pushType = $("#pushType").val();
		if(!pushType){
			$("#checkType").html("请选择推送类型");
			return;
		}else{
			$("#checkType").empty();
		}
		var Reg = /^.{1,100}$/g;
		var pushContent = $("#pushContent").val();
		if(!Reg.test(pushContent)||len(pushContent)>50){
			$("#checkPushContent").html("限100字符(中文字符长度为2)!</font>");
			return;
		}else{
			$("#checkPushContent").empty();
		}
		var Reg1 = /^.{1,50}$/g;
		var title = $("#pushTitle").val();
		if(title!=""&&(!Reg1.test(title)||len(title)>50)){
			$("#checkTitle").html("限50字符(中文字符长度为2)!</font>");
			return;
		}else{
			$("#checkTitle").empty();
		}
		updatePersonalCenter();
	}

	function updatePersonalCenter(){
		$.ajax({
			type : "POST",
			url : ctx + "/msgPushManagement/save_msgPush",
			data : $("#msgpushForm").serialize(),
			async : false,
			dataType:"json",
			error : function(request) {
			},
			success:function(data) {
				if(data.result == 'success'){
					Modal.alert({msg:"消息推送成功",okCallback:function(){
						$("#catalog_list_modal").modal("hide");
						$("#catalog_list_modal").on("hidden.bs.modal", function() {
							$("#queryCommit").click();
							$(this).off("hidden.bs.modal");
						});
					}
				});
				}else{
					$("input[name='addMsgpush']").val(data.newTokenName);
					Modal.alert({msg:data.message});
				}
			}
		});
	}
	</script>
