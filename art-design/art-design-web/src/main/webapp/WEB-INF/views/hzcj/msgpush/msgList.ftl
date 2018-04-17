<!-- 用户属性详情页面 -->
<#include "hzcj/common/option.ftl">
<#assign ctx = request.contextPath>
<div class="modal-dialog" role="document" style="width: 1600px;">
	<div class="modal-content">
		
		<div class="modal-header">
			<button type="button" class="bootbox-close-button close" data-dismiss="modal" aria-hidden="true">×</button>
			
			<h4 class="modal-title">&nbsp;推送统计</h4>
		</div>
		<div class="modal-body">
			<div class="page-content ">
				<div class="row" style="padding-top: 10px;">
				
				<form action="${ctx}/msgPushManagement/list" method="POST" id="queryForm_ajax">
						<!-- PAGE CONTENT BEGINS -->
						<div class="col-xs-12">
						<div class="col-sm-3" >
									<label>推送类型：</label>
									<select class="chosen-select AceSelect" name="pushType" >
										<@option name="msgpush_push_type_param" status="1" value="${msgPushVo.pushType}"/>
										</select>
								</div>
								 <div class="col-sm-6">
										<label>创建日期：</label>
										<input id="start_time" name="startTime" value="${msgPushVo.startTime}" class="Wdate WdateInput2" type="text" onfocus="var end_time=$dp.$('end_time');WdatePicker({onpicked:function(){end_time.focus();},dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'end_time\')}',isShowClear:true,isShowOthers:false,qsEnabled:false})">
										至
										<input id="end_time" name="endTime" value="${msgPushVo.endTime}" class="Wdate WdateInput2" type="text" onfocus="WdatePicker({minDate:'#F{$dp.$D(\'start_time\')}',dateFmt:'yyyy-MM-dd',isShowClear:true,isShowOthers:false,qsEnabled:false})">
								</div>	
								</div>	
						<div class="col-xs-12" style="margin-top:10px;"></div>		
						<div class="col-xs-12">								
								<div class="col-sm-4">
									<label>推送内容：</label>
									<input type="text" name="pushContent" value="${msgPushVo.pushContent?if_exists}" class="InputName0" maxlength="30" />
									<span id="queryCommit_ajax" class="BtnSouSu default-btn btn-blue" >搜 索</span>
						</div>
						</div>
						<div class="col-xs-12">
							<table class="table table-striped table-bordered table-hover RtableStriped RtableStropSOS">
								<thead>
								<tr role="row">
											<th class="center" width="5%">
												<span class="lbl" title="">序号</span>
											</th>
											<th class="center" width="15%">
												<span class="lbl" title="">推送标题</span>
											</th>
											<th class="center" width="25%">
												<span class="lbl" title="">推送内容</span>
											</th>
											<th class="center" width="5%">
												推送类型
											</th>
											<th class="center" width="10%">
												创建时间
											</th>
											<th class="center" width="8%">
												Android 送达
											</th>
											<th class="center has-slant " width="10%">
												<span class="up">iOS通知</span>
												<span class="down">iOS消息</span>
											</th>
											<th class="center" width="5%">
												操作
											</th>
										</tr>
								</thead>
								<tbody>
									<#if msgList>
											<#list msgList as msgPush>
											<tr>
												<td class="center">
													<div>${msgPush_index+1+(pageView_ajax.pageNow-1)*pageView_ajax.pageSize}</div>
												</td>
												<td class="center">
													<div>${msgPush.pushTitle}</div>
												</td>
												<td class="center">
													<div>${msgPush.pushContent}</div>
												</td>
												<td class="center">
													<div>
														<@option name="msgpush_push_type_param" status="1" type="3" value="${msgPush.pushType}"/>
													</div>
												</td>
												<td class="center">
													<div><@date_sub value='${msgPush.pushTime?string("yyyy-MM-dd HH:mm:ss")}' /></div>
												</td>
												<td class="center">
													<div>
													 <#assign x=msgPush_index> 
													<#if receivedsList>
														<#list receivedsList as received> 
															<#if msgPush_index  = received_index> 
																${received.android_received}
															 </#if> 
														 </#list> 
													<#else>
														--	 
													 </#if> 
													</div>
												</td>
												<td class="center">
														<#assign x=msgPush_index> 
														<#if receivedsList>
															<#list receivedsList as received> 
																<#if msgPush_index  = received_index> 
																	${received.ios_apns_sent}
																 </#if> 
															 </#list> 
														<#else>
															--		 
														 </#if>
														 /
														 <#assign x=msgPush_index> 
														<#if receivedsList>
															<#list receivedsList as received> 
																<#if msgPush_index  = received_index> 
																	${received.ios_msg_received}
																 </#if> 
															 </#list> 
														<#else>
															--		 
														 </#if>
												</td>
												<td>
												<div align="center">
													<a class="btn btn-primary btn-sm" onclick="remove(${msgPush.pushId});">删除</a>
												</div>	
												</td>
											</tr>
											</#list>
										<#else>
											<tr align="center"><td colspan="8"><font color="red" size="4">没有查询到数据！</font></td></tr>
										</#if>
								</tbody>
							</table>
							<input type="hidden" id="pageNow_ajax" name="pageNow_ajax" value="${pageView_ajax.pageNow?if_exists}" />
							<#include "hzcj/common/page_ajax.ftl">
						</div>
				</form>
				</div><!-- /.row -->
			</div><!-- /.page-content -->
		</div>
		<div class="modal-footer">
			<div class="text-center">
				<a href="javascript:;" data-dismiss="modal" class="default-btn btn-gray marginLR20">关 闭</a>
			</div>
		</div>
	</div>
</div>
<script>
	$(function(){
		//查询
		$("#queryCommit_ajax").click(function(){
			if(checkLoginStatus() == false) return;
			$("#pageNow_ajax").val(1);
			$("#user_relation_list_modal").modal("hide");
			$("#user_relation_list_modal").on("hidden.bs.modal", function() {
				pushList($("#queryForm_ajax").serialize());
				$(this).off("hidden.bs.modal");
			});
		});
	});
	
	//翻页动作
	function queryformPage_ajax() {
		$("#user_relation_list_modal").modal("hide");
		$("#user_relation_list_modal").on("hidden.bs.modal", function() {
			pushList($("#queryForm_ajax").serialize());
			$(this).off("hidden.bs.modal");
		});
	}
	function remove(id){
		Modal.confirm({msg:"确认删除吗？",okCallback:function(){   
            $.ajax({
                type        : 'POST',
                url         : ctx+'/msgPushManagement/remove',
                data        : "r="+Math.random()+"&id=" + id ,
                dataType    : 'json',
                encode      : true
            }).done(function(result) {
                if (result.code == "0") {
                	Modal.alert({msg:"删除成功",okCallback:function(){
                		location.reload();
    					}
    				});
                } else {
                	Modal.alert({msg:result.msg});
                	return false;
                }
            });  
        }
    });  
	}
</script>
