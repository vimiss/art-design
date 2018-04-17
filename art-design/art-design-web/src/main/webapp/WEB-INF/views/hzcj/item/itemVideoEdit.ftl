<#assign ctx = request.contextPath>
<!-- Modal -->
<div class="modal-dialog modal-lg1" role="document" style="width:1500px;">
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
			<h4 class="modal-title" id="myModalLabel">编辑</h4>
		</div>
		<div class="modal-body">
		<form role="form" class="form-group" action="${ctx}/recruit/update" method="POST" id="editForm" >
			<input type="hidden" id="videoId" name="videoId" value="${videos.videoId}"/>
			<input type="hidden" id="itemId" name="itemId" value="${itemId}"/>
		     <input id="wyVid" name="wyVid" value="${videos.wyVid}" type="hidden">
			<div class="container-fluid">
				<div class="row">
					 <div class=" Mylist clearfix">
						<div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>视频名称：</div>
							<div class="pull-left MylistRight">
								<input type="text" class="InputName1" name="videoTitle" id="videoTitle" value="${videos.videoTitle}"  disabled="disabled">
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
					     
				<div class="col-xs-12">
					<div class="form-group">
						<label class="control-label col-xs-2"  title="与项目相关的视频详细介绍"><span style='color: red'>*</span>详细描述：</label>
						<div class="col-xs-8 no-padding-left" style="z-index:10; width: 75%;">
						 	<script id="videoLocalDesc"  name ="videoLocalDesc" type="text/plain" style="width:1150px;height:700px;" >${videos.videoLocalDesc}
						 	</script>
						</div>
					</div>
				</div>
						
						
						
					</div>
				</div>
			</div>
		</form>
		</div>
		<div class="modal-footer">
			<div class="text-center">
				<a href="javascript:;" onclick="ajaxSaveItemVideoEdit();" class="default-btn btn-orange noBorder marginLR20">保 存</a>
				<a href="javascript:;" data-dismiss="modal" class="default-btn btn-gray marginLR20">取 消</a>
			</div>
		</div>
	</div>
</div>
	<script src="${ctx}/js/hzcj/video.js?v=${jsv}"></script>
	
	<script type="text/javascript" >
$(function(){

	UE.delEditor('videoLocalDesc');
	//实例化编辑器(图文详情)
	UE.getEditor('videoLocalDesc',{
		toolbars: [
	    [
	        'anchor', //锚点
	        'undo', //撤销
	        'redo', //重做
	        'bold', //加粗
	        'indent', //首行缩进
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
	        'edittable', //表格属性
	        'edittd', //单元格属性
	        'emotion', //表情
	        'spechars', //特殊字符
	        'searchreplace', //查询替换
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
	        'touppercase', //字母大写
	        'tolowercase', //字母小写
	        'background', //背景
	        'template', //模板
	        'scrawl', //涂鸦
	        'music', //音乐
	        'inserttable', //插入表格
	        'drafts', // 从草稿箱加载
	    ]
	],
	
	
	
		disabledTableInTable:false,
		disabledInsertTable:true,
		allowDivTransToP:false,
		wordCount:false,
		elementPathEnabled:false,
		zIndex:2147483647
	});	
	
	
});//--jquery_end
</script>
