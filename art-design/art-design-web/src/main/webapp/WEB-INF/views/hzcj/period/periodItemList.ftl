<#include "hzcj/common/option.ftl">
<#include "hzcj/common/number.ftl">
<#assign ctx = request.contextPath>
<div class="modal-dialog" role="document" style="width: 1600px;">
	<div class="modal-content">
		
		<div class="modal-header">
			<button type="button" class="bootbox-close-button close" data-dismiss="modal" aria-hidden="true">×</button>
			
			<h4 class="modal-title">&nbsp;可选项目</h4>
		</div>
		<div class="modal-body">
			<div class="page-content ">
				<div class="row" style="padding-top: 10px;">
				<div class="col-xs-12">
				<form action="${ctx}/itemManagement/goItemNoticList" method="POST" id="queryForm_ajax">
						<!-- PAGE CONTENT BEGINS -->
						<div class="col-xs-12">
							<div class="col-sm-4">
									<label>项目标题：</label>
									<input type="text" class="InputName0" name="itemName" value="${item.itemName}" placeholder="请输入项目名称" />
							</div>
							
									<div class="col-sm-6">
									<label>发布日期：</label>
										<input id="start_time" name="startTimeStr" value="${item.startTimeStr}" class="Wdate WdateInput2" type="text" onfocus="var end_time=$dp.$('end_time');WdatePicker({onpicked:function(){end_time.focus();},dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'end_time\')}',isShowClear:true,isShowOthers:false,qsEnabled:false})">
										至
										<input id="end_time" name="endTimeStr" value="${item.endTimeStr}" class="Wdate WdateInput2" type="text" onfocus="WdatePicker({minDate:'#F{$dp.$D(\'start_time\')}',dateFmt:'yyyy-MM-dd',isShowClear:true,isShowOthers:false,qsEnabled:false})">
								<span id="queryCommit_ajax" class="BtnSouSu default-btn btn-blue">搜 索</span>
							</div>
						</div>
					
							
						
						<div class="col-xs-12">
							 <span onclick="trueItem();" class="BtnNormalSu default-btn btn-blue">确 定</span>
							 
							<table class="table table-striped table-bordered table-hover RtableStriped RtableStropSOS" >
							<thead>
								<tr role="row">
								 <th class="center">选择</th>
									<th class="center">项目标题</th>
									<th class="center">总额度</th>
									<th class="center">剩余额度</th>
									<th class="center">收益区间</th>
									<th class="center">认购费率</th>
									<th class="center">创建时间</th>
									<th class="center">开始时间</th>
									<th class="center">项目状态</th>
									<th class="center">审核状态</th>
								</tr>
							</thead>
							
							<tbody>
								<#if itemList>
				            		<#list itemList as item>
				            			<#if item>
											<tr>
											<td class="center">
													<div class="aName"><input name="newChkItem" type="radio" value="${item.itemId?if_exists}" itemName="${item.itemName?if_exists}"></div>
											</td>
												<td class="center">
													<div class="aName">
															${item.itemName?if_exists}
													</div>
												</td>
												<td class="center">
													<div class="aName">
													<@amount_sub amount="${item.itemTotalQuota}" type=2 />
													</div>
												</td>
												<td class="center">
													<div class="aName">
													<@amount_sub amount="${item.itemRemainQuota}" type=2 />
													</div>
												</td>
												<td class="center">
													<div class="aName">${item.itemMinFee?if_exists}%~${item.itemMaxFee?if_exists}%</div>
												</td>
												<td class="center">
													<div class="aName">${item.itemReviseFee?if_exists}%</div>
												</td>
												<td class="center">
												<div class="aName"><@date_sub value='${item.itemTime?string("yyyy-MM-dd HH:mm:ss")}' /></div>
												</td>
												<td class="center">
												<div class="aName"><@date_sub value='${item.itemBeginTime?string("yyyy-MM-dd HH:mm:ss")}' /></div>
												</td>
												<td class="center">
													<div class="aName">
														<@option name="item_status_param"   status="1" type="3" value="${item.itemStatus}"/>
													</div>
												</td>
												<td class="center">
													<div class="aName">
														<@option name="audit_status_param"   status="1" type="3" value="${item.itemAuditStatus}"/>
													</div>
												</td>
											</tr>
							    		</#if>
									</#list>
								<#else>
									<tr align="center"><td colspan="10"><font color="red" size="4">没有查询到数据！</font></td></tr>
								</#if>
							</tbody>
						</table>
						<#if itemList>
							<input type="hidden" id="pageNow_ajax" name="pageNow_ajax" value="${pageView_ajax.pageNow?if_exists}" />
							<#include "hzcj/common/page_ajax.ftl">
							</#if>
						</div>
				</form>
				</div><!-- /.col -->
				</div><!-- /.row -->
			</div><!-- /.page-content -->
		</div>
		<div class="modal-footer">
			<div class="text-center">
				<a href="javascript:;" data-dismiss="modal" class="default-btn btn-gray noBorder marginLR20">关 闭</a>
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
			$("#choseItemModal").modal("hide");
			$("#choseItemModal").on("hidden.bs.modal", function() {
				choseItem($("#queryForm_ajax").serialize());
				$(this).off("hidden.bs.modal");
			});
		});
	});
	
	//翻页动作
	function queryformPage_ajax() {
		$("#choseItemModal").modal("hide");
		$("#choseItemModal").on("hidden.bs.modal", function() {
			choseItem($("#queryForm_ajax").serialize());
			$(this).off("hidden.bs.modal");
		});
	}
</script>