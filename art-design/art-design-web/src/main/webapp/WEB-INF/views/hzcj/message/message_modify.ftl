<#assign ctx = request.contextPath>
<#include "hzcj/common/option.ftl">
<!-- Modal -->
<div class="modal-dialog modal-lg1" role="document" style="width:1400px;">
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
			<h4 class="modal-title" id="myModalLabel">修改消息</h4>
		</div>
		<div class="modal-body">
		<form id="msgpushForm" name="msgpushForm" method="post" >
			<!-- 文本内容开始 -->
							 <div class="col-xs-12 MylistCol">
								<div class="pull-left MylistLeft">
									<strong class="InputStrong"><span class="red">*</span>消息类型：</strong>
								</div>
								<div class="pull-left MylistRight">
									<select class="chosen-select AceSelect" name="messType"  id="messType">
											<@option name="message_type_param" status="1" value="${message.messType}"/>
									</select>
									<span id="checkMessType" class="red" style="margin-left: 20px;"></span>	
								</div>
							</div>
							 <div class="col-xs-12 MylistCol">
								<div class="pull-left MylistLeft">
									<strong class="InputStrong"><span class="red">*</span>消息标题：</strong>
								</div>
								<div class="pull-left MylistRight">
									<input type="hidden" name="messId" value="${message.messId}">
									<input type="text" name="messTitle" id="messTitle" class="InputName1" value="${message.messTitle}" maxlength="50"  placeholder="限50字符(中文字符长度为2)" >
									<span id="checkMessTitle" class="red" style="margin-left: 20px;"></span>
								</div>
							</div>
							 <div class="col-xs-12 MylistCol " >
								<div class="pull-left MylistLeft">
									<strong class="InputStrong"><span class="red">*</span>消息内容：</strong>
								</div>
								<div class="pull-left MylistRight">
									<script id="infoContent"   type="text/plain" style="width:1000px;height:700px;">${message.messContent}
						 			</script>
								</div>
							</div>
							<input type="hidden" name="messContent" id="messContent">
							<input type="hidden" name="modifyMessage" value="${modifyMessage?if_exists}" />
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
});
	function checkPersonalCenterForm(){
		var Reg_title = /^.{1,50}$/g;
		var messTitle = $("#messTitle").val();
		if(!Reg_title.test(messTitle)||len(messTitle)>50){
			$("#checkMessTitle").html("<font>限50字符(中文字符长度为2)!</font>");
			return;
		}else{
			$("#checkMessTitle").empty();
		}
		var messType=$("#messType").val();
			$("#messContent").val(UE.getEditor('infoContent').getContent());
		$.ajax({
			type : "POST",
			url : ctx + "/message/token/modify",
			data : $("#msgpushForm").serialize(),
			async : false,
			dataType:"json",
			error : function(request) {
			},
			success:function(data) {
				if(data.result == 'success'){
					Modal.alert({msg:"修改成功",okCallback:function(){
						$("#catalog_list_modal").modal("hide");
						$("#catalog_list_modal").on("hidden.bs.modal", function() {
							$("#queryCommit").click();
							$(this).off("hidden.bs.modal");
						});
					}
				});
				}else{
					$("input[name='modifyMessage']").val(data.newTokenName);
					Modal.alert({msg:data.message});
				}
			}
		});
	}
	</script>
