<#assign ctx = request.contextPath>
<#include "hzcj/common/option.ftl">
<!-- Modal -->
<div class="modal-dialog modal-lg1" role="document" style="width:1400px;">
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
			<h4 class="modal-title" id="myModalLabel">修改商品</h4>
		</div>
		<div class="modal-body">
		<form id="msgpushForm" name="msgpushForm" method="post" >
			<!-- 文本内容开始 -->
					<input type="hidden" name="commId" id="commId" value="${commodity.commId}"/>
	                      	<div class="col-xs-12 MylistCol">
								<div class="pull-left MylistLeft">
									<strong class="InputStrong"><span class="red">*</span>商品编号：</strong>
								</div>
								<div class="pull-left MylistRight">
									<input type="text" name="commNum" id="commNum" class="InputName1" value="${commodity.commNum}"  placeholder="限数字，不能重复" >
								</div>
							</div>
							 <div class="col-xs-12 MylistCol">
								<div class="pull-left MylistLeft">
									<strong class="InputStrong"><span class="red">*</span>商品名称：</strong>
								</div>
								<div class="pull-left MylistRight">
									<input name="commName" id="commName" type="text" class="InputName1" value="${commodity.commName}"   maxlength="40"  placeholder="限40字符(中文字符长度为2)">
									<span class="BtnSouSu default-btn btn-blue" id="upLoadToServer" >添加商品图片</span>
								</div>
							</div>
							<script type="text/plain" id="uploadImg" style="display:none"></script>
							 <div class="col-xs-12 MylistCol">
								<div class="pull-left MylistLeft">
									<strong class="InputStrong"><span class="red">*</span>商品图片：</strong>
								</div>
								<div class="pull-left MylistRight">
									<img style="max-height: 60px; max-width: 250px;" id="titlePic" src="${commodity.commUrl?if_exists}">
									<input name="commUrl" id="commUrl" type="hidden" value="${commodity.commUrl?if_exists}">
								</div>
							</div>
							 <div class="col-xs-12 MylistCol">
								<div class="pull-left MylistLeft">
									<strong class="InputStrong"><span class="red">*</span>商品类型：</strong>
								</div>
								<div class="pull-left MylistRight">
									<select class="chosen-select AceSelect" name="commType" id="commType">
											<@option name="comm_type_param" status="1" value="${commodity.commType}"/>
										</select>
								</div>
							</div>
							 <div class="col-xs-12 MylistCol">
								<div class="pull-left MylistLeft">
									<strong class="InputStrong"><span class="red">*</span>商品类别：</strong>
								</div>
								<div class="pull-left MylistRight">
									<select class="chosen-select AceSelect" name="commClub" id="commClub">
											<@option name="comm_club_param" status="1" value="${commodity.commClub}" method="getCommClubAsOption"/>
										</select>
								</div>
							</div>
							 <div class="col-xs-12 MylistCol">
								<div class="pull-left MylistLeft">
									<strong class="InputStrong"><span class="red">*</span>商品描述：</strong>
								</div>
								<div class="pull-left MylistRight">
									<script id="infoContent"  name ="commDesc" type="text/plain" style="width:1000px;height:700px;">${commodity.commDesc}
						 			</script>
								</div>
							</div>
							 <div class="col-xs-12 MylistCol">
								<div class="pull-left MylistLeft">
									<strong class="InputStrong"><span class="red">*</span>商品总量：</strong>
								</div>
								<div class="pull-left MylistRight">
									<input name="commAmount" id="commAmount" type="text" class="InputName1"  value="${commodity.commAmount}"   placeholder="0或正整数">
								</div>
							</div>
							 <div class="col-xs-12 MylistCol">
								<div class="pull-left MylistLeft">
									<strong class="InputStrong"><span class="red">*</span>剩余数量：</strong>
								</div>
								<div class="pull-left MylistRight">
									<input name="commRemNum" id="commRemNum" type="text" class="InputName1" value="${commodity.commRemNum}"   placeholder="0或正整数">
								</div>
							</div>
							 <div class="col-xs-12 MylistCol">
								<div class="pull-left MylistLeft">
									<strong class="InputStrong"><span class="red">*</span>可兑换数量：</strong>
								</div>
								<div class="pull-left MylistRight">
									<input name="commConNum" id="commConNum" type="text" class="InputName1" value="${commodity.commConNum}"  placeholder="0或正整数">
								</div>
							</div>
							 <div class="col-xs-12 MylistCol">
								<div class="pull-left MylistLeft">
									<strong class="InputStrong"><span class="red">*</span>商品积分：</strong>
								</div>
								<div class="pull-left MylistRight">
									<input name="commPoint" id="commPoint" type="text" class="InputName1"  value="${commodity.commPoint}"  placeholder="0或正整数">
								</div>
							</div>
							 <div class="col-xs-12 MylistCol">
								<div class="pull-left MylistLeft">
									<strong class="InputStrong"><span class="red">*</span>商品备注：</strong>
								</div>
								<div class="pull-left MylistRight">
									<input name="commRemark" id="commRemark" type="text" class="InputName1" value="${commodity.commRemark}"  maxlength="100"  placeholder="限100字符(中文字符长度为2)">
								</div>
							</div>
							 	 <div class="col-xs-12 MylistCol">
								<div class="pull-left MylistLeft">
									<strong class="InputStrong"><span class="red">*</span>商品状态：</strong>
								</div>
								<div class="pull-left MylistRight">
									<select class="chosen-select AceSelect" name="commState" id="commState">
											<@option name="status_param" status="1" value="${commodity.commState}" />
										</select>
								</div>
							</div>
	                      	<!-- 文本内容结束 -->
	                      	<input type="hidden" name="modifyCommodity" value="${modifyCommodity?if_exists}" />
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
			 		       $("#commUrl").val($("#titlePic").attr("src"));
			 		  });
			});

		UE.delEditor('infoContent');
		//实例化编辑器(图文详情)
		UE.getEditor('infoContent',{
			toolbars: [
		    [
		        'anchor', //锚点
		        'undo', //撤销
		        'redo', //重做
		        'bold', //加粗
		        'indent', //首行缩进
		        'snapscreen', //截图
		        'italic', //斜体
		        'underline', //下划线
		        'strikethrough', //删除线
		        'subscript', //下标
		        'fontborder', //字符边框
		        'superscript', //上标
		        'formatmatch', //格式刷
		        'source', //源代码
		        'blockquote', //引用
		        'pasteplain', //纯文本粘贴模式
		        'selectall', //全选
		        'print', //打印
		        'preview', //预览
		        'horizontal', //分隔线
		        'removeformat', //清除格式
		        'time', //时间
		        'date', //日期
		        'unlink', //取消链接
		        'insertrow', //前插入行
		        'insertcol', //前插入列
		        'mergeright', //右合并单元格
		        'mergedown', //下合并单元格
		        'deleterow', //删除行
		        'deletecol', //删除列
		        'splittorows', //拆分成行
		        'splittocols', //拆分成列
		        'splittocells', //完全拆分单元格
		        'deletecaption', //删除表格标题
		        'inserttitle', //插入标题
		        'mergecells', //合并多个单元格
		        'deletetable', //删除表格
		        'cleardoc', //清空文档
		        'insertparagraphbeforetable', //"表格前插入行"
		        'insertcode', //代码语言
		        'fontfamily', //字体
		        'fontsize', //字号
		        'paragraph', //段落格式
		        'simpleupload', //单图上传
		        'insertimage', //多图上传
		        'edittable', //表格属性
		        'edittd', //单元格属性
		        'link', //超链接
		        'emotion', //表情
		        'spechars', //特殊字符
		        'searchreplace', //查询替换
		        'map', //Baidu地图
		        'gmap', //Google地图
		        'insertvideo', //视频
		        'help', //帮助
		        'justifyleft', //居左对齐
		        'justifyright', //居右对齐
		        'justifycenter', //居中对齐
		        'justifyjustify', //两端对齐
		        'forecolor', //字体颜色
		        'backcolor', //背景色
		        'insertorderedlist', //有序列表
		        'insertunorderedlist', //无序列表
		        'fullscreen', //全屏
		        'directionalityltr', //从左向右输入
		        'directionalityrtl', //从右向左输入
		        'rowspacingtop', //段前距
		        'rowspacingbottom', //段后距
		        'pagebreak', //分页
		        'insertframe', //插入Iframe
		        'imagenone', //默认
		        'imageleft', //左浮动
		        'imageright', //右浮动
		        'attachment', //附件
		        'imagecenter', //居中
		        'wordimage', //图片转存
		        'lineheight', //行间距
		        'edittip ', //编辑提示
		        'customstyle', //自定义标题
		        'autotypeset', //自动排版
		        'webapp', //百度应用
		        'touppercase', //字母大写
		        'tolowercase', //字母小写
		        'background', //背景
		        'template', //模板
		        'scrawl', //涂鸦
		        'music', //音乐
		        'inserttable', //插入表格
		        'drafts', // 从草稿箱加载
		        'charts', // 图表
		    ]
		],
			disabledTableInTable:false,
			disabledInsertTable:true,
			allowDivTransToP:false,
			wordCount:false,
			elementPathEnabled:false,
			zIndex:2147483647
		});	
		
		
		jQuery.validator.addMethod("checkCommRemNum", function(value) {  
			var commAmount=$("#commAmount").val();
		return parseInt(commAmount) >=parseInt(value) ;  
		}, $.validator.format("剩余数量需要小于或等于商品总量!"));  
	jQuery.validator.addMethod("checkCommConNum", function(value) {  
			var commAmount=$("#commAmount").val();
		return parseInt(commAmount) >=parseInt(value) ;  
		}, $.validator.format("可兑换数量需要小于或等于商品总量!"));  
        var validate = $("#msgpushForm").validate({
            //errorClass: "label.error", //默认为错误的样式类为：error   
            focusInvalid: false, //当为false时，验证无效时，没有焦点响应  
            onkeyup: false,   
            rules:{
            	commNum:{
                    required:true,
                    digits:true,
                    remote:{
                        type:"POST",
                        url:ctx+"/commodity/checkCommodity",            
                        data:{
                        	commNum:function(){return $("#commNum").val();},
                        	commId:function(){return $("#commId").val();}
                        } 
                       } 
                },
                commName:{
                    required:true,
                    maxlength:20
                },
                commUrl:{
                    required:true,
                },
                commType:{
                    required:true,
                },
                commClub:{
                    required:true,
                },
                commDesc:{
                    required:true
                },
                commAmount:{
                    required:true,
                    digits:true
                },
                commRemNum:{
                    required:true,
                    digits:true,
                    checkCommRemNum:(commRemNum)
                },
                commConNum:{
                    required:true,
                    digits:true,
                    checkCommConNum:(commConNum)
                },
                commPoint:{
                    required:true,
                    digits:true
                },
                commRemark:{
                    required:true,
                    maxlength:100
                },
                commState:{
                    required:true
                }
            },
            messages:{
            	commNum:{
                    required:"必填",
                    digits:"输入正整数",
                    remote:$.validator.format("商品编号已经存在")
                },
                commName:{
                    required:"必填",
                    maxlength:"长度不能超过20"
                },
                commUrl:{
                    required:"必填",
                },
                commType:{
                    required:"必填",
                },
                commClub:{
                    required:"必填",
                },
                commDesc:{
                    required:"必填"
                },
                commAmount:{
                    required:"必填",
                    digits:"输入正整数"
                },
                commRemNum:{
                    required:"必填",
                    digits:"输入正整数"
                },
                commConNum:{
                    required:"必填",
                    digits:"输入正整数"
                },
                commPoint:{
                    required:"必填",
                    digits:"输入正整数"
                },
                commRemark:{
                    required:"必填",
                    maxlength:"长度不能超过200"
                },
                commState:{
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
			url : ctx + "/commodity/modify",
			data : $("#msgpushForm").serialize(),
			async : false,
			dataType:"json",
			error : function(request) {
			},
			success:function(data) {
				if(data.result == 'success'){
					Modal.alert({msg:"修改商品成功",okCallback:function(){
						$("#catalog_list_modal").modal("hide");
						$("#catalog_list_modal").on("hidden.bs.modal", function() {
							$("#queryCommit").click();
							$(this).off("hidden.bs.modal");
						});
					}
				});
				}else{
					$("input[name='modifyCommodity']").val(data.newTokenName);
					Modal.alert({msg:data.message});
				}
			}
		});
	}
	</script>
