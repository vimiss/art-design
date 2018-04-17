<#assign ctx = request.contextPath>

<#include "commons/head.ftl">
         
		<!-- /section:basics/navbar.layout -->
		<div class="main-container" id="main-container">
			
            <div id="sidebar" class="sidebar  responsive" data-sidebar="true" data-sidebar-scroll="true" data-sidebar-hover="true">
				<script type="text/javascript">
					try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
				</script>
				<div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
					<img src="${ctx}/img/line13.png" style="cursor: pointer">
				</div>
				<ul class="nav nav-list" style="top: 0px;">
					<#include "commons/menu.ftl">
				</ul><!-- /.nav-list -->



				<!-- /section:basics/sidebar.layout.minimize -->
				<script type="text/javascript">
					try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}
				</script>
			</div>

			<div class="main-content">
            <div class="main-content-inner">
            <!-- 面包屑div -->
					<div class="breadcrumbs" id="breadcrumbs">
						<script type="text/javascript">
										try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
									</script>
						<ul class="breadcrumb">
							<li><span><i class="ace-icon fa  fa-map-marker bigger-130"></i> 当前位置：</span></li>
							<li><a href="${ctx}/index">首页</a>
								<li><a href=""></a></li>
							<li></li>
						</ul>
					</div>
              <div class="page-content">
                	<div class="row" style="padding-top: 10px;">
                  <div class="col-xs-12">
                    <!-- PAGE CONTENT BEGINS -->
                    <div class=" Mylist clearfix">
                     
                    	<form id="msgpushForm" name="msgpushForm" method="post">
                    		<span>题目信息</span>
	                      	<!-- 文本内容开始 -->
	                      	<div class="col-xs-12 MylistCol">
								<div class="pull-left MylistLeft">
									<strong class="InputStrong"><span style="color:red">*</span>题目名称：</strong>
								</div>
								<div class="pull-left MylistRight">
										<input type="hidden" id="librId" name="librId" value="${library.librId}">
										<input type="hidden" id="quesId" name="quesId" value="${library.quesId}">
										<input type="text" id="librName" name="librName" class="InputName1" value="${library.librName}" maxlength="200"  placeholder="限200字符(中文字符长度为2)">
										<span id="checkLibrName" class="red" style="margin-left: 20px;"></span>
								</div>
							</div>
							 <div class="col-xs-12 MylistCol">
								<div class="pull-left MylistLeft">
									<strong class="InputStrong">题目描述：</strong>
								</div>
								<div class="pull-left MylistRight">
									<input name="librDesc" id="librDesc" type="text" class="InputName1" value="${library.librDesc}" maxlength="500"  placeholder="限500字符(中文字符长度为2)">
									<span id="checkLibrDesc" class="red" style="margin-left: 20px;"></span>
								</div>
							</div>
							<input type="hidden" name="modifyLibrary" value="${modifyLibrary?if_exists}" />
	                      	<!-- 文本内容结束 -->
	                  </form>
                      <div class="text-center col-xs-6 col-xs-offset-3" style="margin-top: 20px;">
                        <a type="button" class="default-btn btn-orange marginLR20" href="javascript:;" onClick="checkPersonalCenterForm()">保 存</a>
                        <a type="button" class="default-btn btn-gray marginLR20" href="javascript:;" onClick="fanhui()">返 回</a>
                      </div>
                    </div>
                    <!-- PAGE CONTENT ENDS -->
                   		 <div class="col-xs-12 ">
                         	<span class="BtnNormalSu default-btn btn-blue" onClick="add()">新增题项</span>
                         	
									<table class="table table-striped table-bordered table-hover RtableStriped RtableStropSOS">
										<thead>
										<tr role="row">
											<th class="center" width="10%">
												<span class="lbl" title="">序号</span>
											</th>
											<th class="center" width="20%">
												<span class="lbl" title="">题项的编码</span>
											</th>
											<th class="center" width="25%">
												题项的内容
											</th>
											<th class="center" width="15%">
												题项的分值
											</th>
											<th class="center" width="15%">
												排序
											</th>
											<th class="center" width="25%">
												操作
											</th>
										</tr>
										</thead>
										<tbody>
										<#if optionList>
											<#list optionList as option>
											<tr>
												<td class="center">
													<div>${option_index+1}</div>
												</td>
												<td class="center">
													<div>${option.librCode}</div>
												</td>
												<td class="center">
													<div>
													${option.optionContent}
													</div>
												</td>
												<td class="center">
													<div>
													${option.optionMark}
													</div>
												</td>
												<td class="center">
													<div>
													<#if optionList?size==1>
													--
													<#elseif option_index==0>
													<a href="#" style="color: #3eafe0" onclick="sort_desc(${option.optionId},${option.librId});">降序</a>
													<#elseif option_index+1==optionList?size>
													<a href="#" style="color: #3eafe0" onclick="sort_asc(${option.optionId},${option.librId});">升序 </a>
													<#else>
													<a href="#" style="color: #3eafe0" onclick="sort_desc(${option.optionId},${option.librId});">降序</a>
													<a href="#" style="color: #3eafe0" onclick="sort_asc(${option.optionId},${option.librId});">升序 </a>
													</#if>												
													</div>
												</td>
												<td class="center">
													<div><a href="#" style="color: #3eafe0" onclick="remove_opt(${option.optionId});">
														删除
													</a>
													<a href="#" style="color: #3eafe0" onclick="modify_opt(${option.optionId});">
														修改
													</a>
													</div>
												</td>
											</tr>
											</#list>
										<#else>
											<tr align="center"><td colspan="6"><font color="red" size="4">没有查询到数据！</font></td></tr>
										</#if>
										</tbody>
									</table>
								</div>
                  </div>
                  <!-- /.col -->
                </div>
                <!-- /.row -->
              </div>
              <!-- /.page-content -->
            </div>
          </div>
          <!-- /.main-content -->
			
		</div><!-- /.main-container -->

		<#include "commons/foot.ftl">
		<#include "hzcj/setting/modalCommon.ftl">
<script type="text/javascript" charset="utf-8" src="${ctx}/javascript/hzcj/len.js"></script>
	<script >
	function checkPersonalCenterForm(){
		var Reg = /^.{1,200}$/g;
		var librName = $("#librName").val();
		if(!Reg.test(librName)||len(librName)>200){
			$("#checkLibrName").html("<font>限200字符(中文字符长度为2)!</font>");
			return;
		}else{
			$("#checkLibrName").empty();
		}
		var Reg1 = /^.{1,500}$/g;
		var librDesc = $("#librDesc").val();
		if(librDesc!=""&&(!Reg1.test(librDesc)||len(librDesc)>500)){
			$("#checkLibrDesc").html("<font>限500字符(中文字符长度为2)!</font>");
			return;
		}else{
			$("#checkLibrDesc").empty();
		}
		modify($("#librId").val());
	}
	function fanhui(){
		$("#msgpushForm").attr("action","${ctx}/question/token/modify/page?id="+$("#quesId").val());
		$("#msgpushForm").submit();
	}
	function modify(id){
		$.ajax({
			type : "POST",
			url : ctx + "/question/token/library/modify",
			data : $("#msgpushForm").serialize(),
			async : false,
			dataType:"json",
			error : function(request) {
			},
			success:function(data) {
				if(data.result == 'success'){
					Modal.alert({msg:"题目修改成功",okCallback:function(){
						window.location.href=ctx+'/question/token/library/modify/page?id='+id;
					}
				});
				}else{
					Modal.alert({msg:data.message});
				}
			}
		});
	}
	function add(){
		$("#msgpushForm").attr("action","${ctx}/question/token/option/add/page?librId="+$("#librId").val());
		$("#msgpushForm").submit();
	}
	function modify_opt(id){
		$("#msgpushForm").attr("action","${ctx}/question/token/option/modify/page?id="+id);
		$("#msgpushForm").submit();
	}
	function sort_desc(optionId,librId){
				$.ajax({
					type:"post",
					dataType:"json",
					data:{"optionId":optionId,"librId":librId},
					async : false,
					url:"${ctx}/question/option/desc",
					success:function(result) {
						if (result.code == "0") {
							Modal.alert({msg:"降序成功", okCallback:function() {
								location.reload();
							}});
						} else {
							Modal.alert({msg:result.msg);
						}
					}
				});
		}
	function sort_asc(optionId,librId){
			$.ajax({
				type:"post",
				dataType:"json",
				data:{"optionId":optionId,"librId":librId},
				async : false,
				url:"${ctx}/question/option/asc",
				success:function(result) {
					if (result.code == "0") {
						Modal.alert({msg:"升序成功", okCallback:function() {
							location.reload();
						}});
					} else {
						Modal.alert({msg:result.msg);
					}
				}
			});
	}
	function remove_opt(id){
		Modal.confirm({msg:"确定删除吗？", okCallback:function() {
			$(this).on("hidden.bs.modal", function() {
				$.ajax({
					type:"post",
					dataType:"json",
					data:{"id":id},
					async : false,
					url:"${ctx}/question/option/remove",
					success:function(result) {
						if (result.code == "0") {
							Modal.alert({msg:"删除成功", okCallback:function() {
								location.reload();
							}});
						} else {
							Modal.alert({msg:result.msg});
						}
					}
				});
				
				$(this).off("hidden.bs.modal");
			});
		}});
	}
	</script>
		<!--body html end-->
		<#include "commons/end.ftl">