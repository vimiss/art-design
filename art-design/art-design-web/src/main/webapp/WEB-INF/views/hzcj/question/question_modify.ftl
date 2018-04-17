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
                    		<span>问卷信息</span>
	                      	<!-- 文本内容开始 -->
	                      	<div class="col-xs-12 MylistCol">
								<div class="pull-left MylistLeft">
									<strong class="InputStrong"><span style="color:red">*</span>问卷名称：</strong>
								</div>
								<div class="pull-left MylistRight">
										<input type="hidden" id="quesId" name="quesId" value="${question.quesId}">
										<input type="text" id="quesName" name="quesName" class="InputName1" style="width:200px;" value="${question.quesName}" maxlength="20"  placeholder="限20字符(中文字符长度为2)">
										<span id="checkQuesName" class="red" style="margin-left: 20px;"></span>
								</div>
							</div>
							 <div class="col-xs-12 MylistCol">
								<div class="pull-left MylistLeft">
									<strong class="InputStrong"><span style="color:red">*</span>问卷类别：</strong>
								</div>
								<div class="pull-left MylistRight">
								<select class="chosen-select AceSelect" id="quesType" name="quesType" >
											<@option name="question_type_param" status="1" value="${question.quesType}"/>
										</select>
										<span id="checkQuesType" class="red" style="margin-left: 20px;"></span>
								</div>
							</div>
								<div class="col-xs-12 MylistCol">
								<div class="pull-left MylistLeft">
									<strong class="InputStrong"><span style="color:red">*</span>发布状态：</strong>
								</div>
								<div class="pull-left MylistRight">
										<select class="chosen-select AceSelect" id="quesState" name="quesState" >
											<#if question.quesState=='1'>
											<option value="1" selected>是</option>
											<option value="0">否</option>
											<#else>
												<option value="1" >是</option>
											<option value="0" selected>否</option>
											</#if>
										</select>
								</div>
								</div>
								<input type="hidden" name="modifyQuestion" value="${modifyQuestion?if_exists}" />
	                      	<!-- 文本内容结束 -->
	                  </form>
                      <div class="text-center col-xs-6 col-xs-offset-3" style="margin-top: 20px;">
                        <a type="button" class="default-btn btn-orange marginLR20" href="javascript:;" onClick="checkPersonalCenterForm()">保 存</a>
                        <a type="button" class="default-btn btn-gray marginLR20" href="javascript:;" onClick="fanhui()">返 回</a>
                      </div>
                    </div>
                    <!-- PAGE CONTENT ENDS -->
                   		 <div class="col-xs-12 ">
	                        <span class="BtnNormalSu default-btn btn-blue" onClick="add();">新增题目</span>
	                        
									<table class="table table-striped table-bordered table-hover RtableStriped RtableStropSOS">
										<thead>
										<tr role="row">
											<th class="center" width="10%">
												<span class="lbl" title="">序号</span>
											</th>
											<th class="center" width="30%">
												<span class="lbl" title="">题目名称</span>
											</th>
											<th class="center" width="20%">
												题目描述
											</th>
											<th class="center" width="25%">
												操作
											</th>
										</tr>
										</thead>
										<tbody>
										<#if libraryList>
											<#list libraryList as library>
											<tr>
												<td class="center">
													<div>${library_index+1}</div>
												</td>
												<td class="center">
													<div>${library.librName}</div>
												</td>
												<td class="center">
													<div>
													${library.librDesc}
													</div>
												</td>
												<td class="center">
													<div>
														<#if libraryList?size==1>
														<#elseif library_index==0>
														<a class="btn btn-primary btn-sm" onclick="sort_desc(${library.quesId},${library.librId});">降序</a>
														<#elseif library_index+1==libraryList?size>
														<a class="btn btn-primary btn-sm" onclick="sort_asc(${library.quesId},${library.librId});">升序 </a>
														<#else>
														<a class="btn btn-primary btn-sm" onclick="sort_desc(${library.quesId},${library.librId});">降序</a>
														<a class="btn btn-primary btn-sm" onclick="sort_asc(${library.quesId},${library.librId});">升序 </a>
														</#if>		
														<a class="btn btn-primary btn-sm" onclick="remove_libr(${library.librId});">删除</a>
														<a class="btn btn-primary btn-sm" onclick="modify_libr(${library.librId});">修改</a>
													</div>
												</td>
											</tr>
											</#list>
										<#else>
											<tr align="center"><td colspan="4"><font color="red" size="4">没有查询到数据！</font></td></tr>
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
		var Reg = /^.{1,20}$/g;
		var quesName = $("#quesName").val();
		if(!Reg.test(quesName)||len(quesName)>20){
			$("#checkQuesName").html("<font>限20字符(中文字符长度为2)!</font>");
			return;
		}else{
			$("#checkQuesName").empty();
		}
		if($("#quesType").val()==""){
			$("#checkQuesType").html("<font>请选择问卷类别</font>");
			return;
		}else{
			$("#checkQuesType").empty();
		}
		modify($("#quesId").val());
	}
	function fanhui(){
		window.location.href=ctx+'/question/list';
	}
	function modify(id){
		$.ajax({
			type : "POST",
			url : ctx + "/question/token/modify",
			data : $("#msgpushForm").serialize(),
			async : false,
			dataType:"json",
			error : function(request) {
			},
			success:function(data) {
				if(data.result == 'success'){
					Modal.alert({msg:"问卷修改成功",okCallback:function(){
						window.location.href=ctx+'/question/token/modify/page?id='+id;
					}
				});
				}else{
					Modal.alert({msg:data.message});
				}
			}
		});
	}
	function add(){
		$("#msgpushForm").attr("action","${ctx}/question/token/library/add/page");
		$("#msgpushForm").submit();
	}
	function modify_libr(id){
		$("#msgpushForm").attr("action","${ctx}/question/token/library/modify/page?id="+id);
		$("#msgpushForm").submit();
	}
	function remove_libr(id){
		Modal.confirm({msg:"确定删除吗？", okCallback:function() {
			$(this).on("hidden.bs.modal", function() {
				$.ajax({
					type:"post",
					dataType:"json",
					data:{"id":id},
					async : false,
					url:"${ctx}/question/library/remove",
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
	
	function sort_desc(quesId,librId){
		$.ajax({
			type:"post",
			dataType:"json",
			data:{"quesId":quesId,"librId":librId},
			async : false,
			url:"${ctx}/question/library/desc",
			success:function(result) {
				if (result.code == "0") {
					Modal.alert({msg:"降序成功", okCallback:function() {
						location.reload();
					}});
				} else {
					Modal.alert({msg:result.msg});
				}
			}
		});
	}
		function sort_asc(quesId,librId){
			$.ajax({
				type:"post",
				dataType:"json",
				data:{"quesId":quesId,"librId":librId},
				async : false,
				url:"${ctx}/question/library/asc",
				success:function(result) {
					if (result.code == "0") {
						Modal.alert({msg:"升序成功", okCallback:function() {
							location.reload();
						}});
					} else {
						Modal.alert({msg:result.msg});
					}
				}
			});
		}
	</script>
		<!--body html end-->
		<#include "commons/end.ftl">