<#assign ctx = request.contextPath>
<!-- 详情页面 -->
<!-- Modal -->
	<div class="modal-dialog modal-lg" role="document">
		<input type="hidden" id="fileId" value="${file.id}">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="bootbox-close-button close" data-dismiss="modal" aria-hidden="true">×</button>
				<h4 class="modal-title">专题详情</h4>
			</div>
			<div class="modal-body">
				<div class="container-fluid">
					<div class="container-fluid">
						<div class="col-xs-12 PullSeleDiv">
							<div class="pull-center" style="margin-left: 0px;width:250px">
								<label><b>名称：</b></label>${file.name}
							</div>
							<div class="pull-center" style="margin-left: 0px;width:450px">
								<label><b>学段：</b></label>
								<#if file.gradeFlag?if_exists && file.gradeFlag==2>
									<span class="lbl"> 初中</span>
								<#elseif file.gradeFlag?if_exists && file.gradeFlag==3>
									<span class="lbl"> 高中</span>
								<#elseif file.gradeFlag?if_exists && file.gradeFlag==4>
									<span class="lbl"> 初升高</span>
								</#if>
							</div>
						</div>
						<div id="calaListDiv">
						</div>
					 </div>
				</div>
			</div>
			<div class="modal-footer">
				<div class="text-center">
					<div id="addQuestionIds" style="display:none"></div>
					<a type="button" data-dismiss="modal" class="default-btn btn-orange marginLR20">关 闭</a>
				</div>
			</div>
		</div>
	</div>
<script type="text/javascript">
$(function(){
	ajaxQueryCalalogs();
});
function ajaxQueryCalalogs(){
	var id = $("#fileId").val();
	var pageNow = $("#pageNow2").val();
	if (!pageNow) {
		pageNow="";
	}
	$('#calaListDiv').html("加载中...").load('${ctx}/jiaoxue/file/calalogList?r='+Math.random()+'&id='+id+'&pageNow='+pageNow,function(res,sta,xhr){
		if(res){//判断是否正常返回了数据--登录拦截,res,sta,xhr
		}
	});
}
 </script>