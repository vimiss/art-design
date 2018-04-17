<#assign ctx = request.contextPath>
<#include "hzcj/common/option.ftl">
<!-- Modal -->
<div class="modal-dialog modal-lg1" role="document">
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
			<h4 class="modal-title" id="myModalLabel">新增商品类别</h4>
		</div>
		<div class="modal-body">
		<form id="msgpushForm" name="msgpushForm" method="post" >
			<!-- 文本内容开始 -->
	                      		<input type="hidden" name="clubId" id="clubId" value=""/>
							 <div class="col-xs-12 MylistCol">
								<div class="pull-left MylistLeft">
									<strong class="InputStrong"><span class="red">*</span>类别名称：</strong>
								</div>
								<div class="pull-left MylistRight">
									<input name="clubName" id="clubName" type="text" class="InputName1" placeholder="限20字符(中文字符长度为2)">
								</div>
							</div>
							<div class="col-xs-12 MylistCol">
								<div class="pull-left MylistLeft">
									<strong class="InputStrong"><span class="red">*</span>类别代码：</strong>
								</div>
								<div class="pull-left MylistRight">
									<input type="text" name="clubCode" id="clubCode" class="InputName1"placeholder="限数字，不能重复" >
								</div>
							</div>
							 <div class="col-xs-12 MylistCol">
								<div class="pull-left MylistLeft">
									<strong class="InputStrong"><span class="red">*</span>类别描述：</strong>
								</div>
								<div class="pull-left MylistRight">
									<input name="clubDesc" id="clubDesc" type="text" class="InputName1" placeholder="限100字符(中文字符长度为2)">
									<span class="BtnSouSu default-btn btn-blue" id="upLoadToServer" >添加类别图片</span>
								</div>
							</div>
							<script type="text/plain" id="uploadImg" style="display:none"></script>
							 <div class="col-xs-12 MylistCol">
								<div class="pull-left MylistLeft">
									<strong class="InputStrong"><span class="red">*</span>类别图片：</strong>
								</div>
								<div class="pull-left MylistRight">
									<img style="max-height: 60px; max-width: 250px;" id="titlePic" src="">
									<input type="hidden" name="clubUrl" id="clubUrl" >
								</div>
							</div>
							 <div class="col-xs-12 MylistCol">
								<div class="pull-left MylistLeft">
									<strong class="InputStrong"><span class="red">*</span>状态：</strong>
								</div>
								<div class="pull-left MylistRight">
									<select class="chosen-select AceSelect" name="clubState" id="clubState">
											<@option name="status_param" status="1" />
										</select>
								</div>
							</div>
	                      	<!-- 文本内容结束 -->
	                      	<input type="hidden" name="addCommClub" value="${addCommClub?if_exists}" />
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
		<script type="text/javascript" src="${ctx}/js/hzcj/jquery.validation.js"></script>
		<script type="text/javascript" src="${ctx}/js/hzcj/messages_cn.js"></script>
		<script type="text/javascript" charset="utf-8" src="${ctx}/javascript/hzcj/len.js"></script>
	<script >
	$(function(){
	        //点击上传图片按钮，打开上传窗口
		 	$("#upLoadToServer").click(function(){
				 	var dialog = ue.getDialog('insertimage');
						dialog.open();
						return ;
				 });
			
		    //实例化上传图片窗口 
			var ue = UE.getEditor('uploadImg',{
					disabledTableInTable:false,
					allowDivTransToP:false,
					wordCount:false,
					elementPathEnabled:false,
					zIndex:2147483647
				});	
			
			//上传图片之后的回调函数
			ue.addListener("afterInsertImage",function(t,arg){
			      $.each(arg,function(n,value) {
			 		       	var titlePic = $("#titlePic").attr("src",value.src);
			 		     	 $("#clubUrl").val($("#titlePic").attr("src"));
			 		  });
			});
        var validate = $("#msgpushForm").validate({
            //errorClass: "label.error", //默认为错误的样式类为：error   
            focusInvalid: false, //当为false时，验证无效时，没有焦点响应  
            onkeyup: false,   
            rules:{
            	clubName:{
                     required:true,
                     maxlength:20
                },
                clubCode:{
                    required:true,
                    maxlength:2,
                    remote:{
                        type:"POST",
                        url:ctx+"/commclub/checkCommClub",            
                        data:{
                        	clubCode:function(){return $("#clubCode").val();},
                        	clubId:function(){return $("#clubId").val();}
        
                        } 
                       } 
                },
                clubDesc:{
                    required:true,
                    maxlength:100
                },
                clubUrl:{
                    required:true,
                },
                clubState:{
                    required:true
                }
            },
            messages:{
            	clubName:{
                    required:"必填",
                    maxlength:"长度不能超过20"
                },
                clubCode:{
                    required:"必填",
                    maxlength:"长度不能超过2",
                    remote:$.validator.format("类别代码已经存在")
                },                
                clubDesc:{
                    required:"必填",
                    maxlength:"长度不能超过100"
                },
                clubUrl:{
                    required:"必填",
                },
                clubState:{
                    required:"必填"
                }
            }
                      
        });    

    });
	function checkPersonalCenterForm(){
		if(!$("#msgpushForm").valid()){
			return;
		}
		$.ajax({
			type : "POST",
			url : ctx + "/commclub/add",
			data : $("#msgpushForm").serialize(),
			async : false,
			dataType:"json",
			error : function(request) {
			},
			success:function(data) {
				if(data.result == 'success'){
					Modal.alert({msg:"新增类别成功",okCallback:function(){
						$("#catalog_list_modal").modal("hide");
						$("#catalog_list_modal").on("hidden.bs.modal", function() {
							$("#queryCommit").click();
							$(this).off("hidden.bs.modal");
						});
					}
				});
				}else{
					$("input[name='addCommClub']").val(data.newTokenName);
					Modal.alert({msg:data.message});
				}
			}
		});
	}
	</script>
