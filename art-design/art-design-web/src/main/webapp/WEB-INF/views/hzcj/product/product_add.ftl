<#assign ctx = request.contextPath>
<#include "hzcj/common/option.ftl">
<!-- Modal -->
<div class="modal-dialog modal-lg1" role="document" >
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
			<h4 class="modal-title" id="myModalLabel">新增产品</h4>
		</div>
		<div class="modal-body">
		<form id="msgpushForm" name="msgpushForm" method="post" >
			<!-- 文本内容开始 -->
	                      	<div class="col-xs-12 MylistCol">
								<div class="pull-left MylistLeft">
									<strong class="InputStrong"><span style="color:red">*</span>产品名称：</strong>
								</div>
								<div class="pull-left MylistRight">
									<input type="hidden" id="prodId" name="prodId" value="${product.prodId}">
										<input type="text" id="prodName" name="prodName" class="InputName1"  value="${product.prodName}" onblur="checkProduct();" maxlength="100"  placeholder="限100字符(中文字符长度为2)">
								</div>
							</div>
							 <div class="col-xs-12 MylistCol">
								<div class="pull-left MylistLeft">
									<strong class="InputStrong"><span style="color:red">*</span>产品类别：</strong>
								</div>
								<div class="pull-left MylistRight">
									<select class="chosen-select AceSelect" id="prodTypeCode" name="prodTypeCode" >
										<@option name="product_type_param" status="1" value="${product.prodTypeCode}"/>
										</select>
								</div>
							</div>
							<div class="col-xs-12 MylistCol">
								<div class="pull-left MylistLeft">
									<strong class="InputStrong"><span style="color:red">*</span>产品描述：</strong>
								</div>
								<div class="pull-left MylistRight">
										<input type="text" id="prodDesc" name="prodDesc" class="InputName1" style="width:84%;" maxlength="500"  placeholder="限500字符(中文字符长度为2)">
										<span id="checkProdDesc" class="red" style="margin-left: 20px;"></span>
								</div>
							</div>
							<input type="hidden" name="addProduct" value="${addProduct?if_exists}" />
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
	<script >
	$(function(){
        var validate = $("#msgpushForm").validate({
            focusInvalid: false, //当为false时，验证无效时，没有焦点响应  
            onkeyup: false,   
            rules:{
            	prodName:{
                    required:true,
                    maxlength:100,
                    remote:{
                        type:"POST",
                        url:ctx+"/product/checkProduct",            
                        data:{
                        	prodName:function(){return $("#prodName").val();},
                        	prodId:function(){return $("#prodId").val();}
                        } 
                       } 
                },
                prodTypeCode:{
                    required:true                   
                },
                prodDesc:{
                    required:true,
                    maxlength:500
                }
              
            },
            messages:{
            	prodName:{
                    required:"必填",
                    maxlength:"长度不能超过100",
                    remote:$.validator.format("产品名称已经存在")
                },
                prodTypeCode:{
                    required:"必填"
                },
                prodDesc:{
                    required:"必填",
                    maxlength:"长度不能超过500"
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
			url : ctx + "/product/token/add",
			data : $("#msgpushForm").serialize(),
			async : false,
			dataType:"json",
			error : function(request) {
			},
			success:function(data) {
				if(data.result == 'success'){
					Modal.alert({msg:"产品新增成功",okCallback:function(){
						window.location.href=ctx+'/product/list';
					}
				});
				}else{
					$("input[name='addProduct']").val(data.newTokenName);
					Modal.alert({msg:data.message});
				}
			}
		});
	}
	</script>
