<#include "hzcj/common/option.ftl">
<#include "hzcj/common/number.ftl">

<#assign ctx = request.contextPath>
<div class="modal-dialog" role="document" style="width: 1600px;">
	<div class="modal-content">
		
		<div class="modal-header">
			<button type="button" class="bootbox-close-button close" data-dismiss="modal" aria-hidden="true">×</button>
			
			<h4 class="modal-title">&nbsp;订单列表</h4>
		</div>
		<div class="modal-body">
			<div class="page-content ">
				<div class="row">
				<div class="col-xs-12">
					<form action="${ctx}/periodApply/listConfirmApply" method="POST" id="queryForm_ajax">
								<div class="col-xs-12">
									<div class="col-sm-3">
										<label>投资人姓名：</label>
										<input type="hidden" name="perId" id="perId" value="${periodApplyVo.perId?if_exists}"  >
										<input type="hidden" name="itemId" id="itemId" value="${periodApplyVo.itemId?if_exists}"  >
										<input type="text" name="applyUserName" value="${periodApplyVo.applyUserName?if_exists}" class="InputName0" >
									</div>
									<div class="col-sm-3">
											<label>申请时间：</label>
											<input id="apply_start_time" name="applyStartTime" value="${periodApplyVo.applyStartTime}" class="Wdate WdateInput1" type="text" onfocus="var apply_end_time=$dp.$('apply_end_time');WdatePicker({onpicked:function(){apply_end_time.focus();},dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'apply_end_time\')}',isShowClear:true,isShowOthers:false,qsEnabled:false})">
											至
											<input id="apply_end_time" name="applyEndTime" value="${periodApplyVo.applyEndTime}" class="Wdate WdateInput1" type="text" onfocus="WdatePicker({minDate:'#F{$dp.$D(\'apply_start_time\')}',dateFmt:'yyyy-MM-dd',isShowClear:true,isShowOthers:false,qsEnabled:false})">
									</div>
									<div class="col-sm-4">
											<label>预约打款时间：</label>
											<input id="pay_start_time" name="payStartTime" value="${periodApplyVo.payStartTime}" class="Wdate WdateInput1" type="text" onfocus="var pay_end_time=$dp.$('pay_end_time');WdatePicker({onpicked:function(){pay_end_time.focus();},dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'pay_end_time\')}',isShowClear:true,isShowOthers:false,qsEnabled:false})">
											至
											<input id="pay_end_time" name="payEndTime" value="${periodApplyVo.payEndTime}" class="Wdate WdateInput1" type="text" onfocus="WdatePicker({minDate:'#F{$dp.$D(\'pay_start_time\')}',dateFmt:'yyyy-MM-dd',isShowClear:true,isShowOthers:false,qsEnabled:false})">
										<span id="queryCommit_ajax" class="BtnSouSu default-btn btn-blue" >搜 索</span>
									</div>
								</div>
						<div class="col-xs-12 ">
									<table class="table table-striped table-bordered table-hover RtableStriped RtableStropSOS">
										<thead>
										<tr role="row">
											<th class="center" >序号</th>
											<th class="center" >项目标题</th>
											<th class="center" >分期标题</th>
											<th class="center" >分期额度</th>
											<th class="center" >剩余额度</th>
											<th class="center" >申请额度</th>
											<th class="center" >投资单元</th>
											<th class="center" >投资期限</th>
											<th class="center" >投资人姓名</th>
											<th class="center" >投顾姓名</th>
											<th class="center" >机构简称</th>
											<th class="center" >申请时间</th>
											<th class="center" >预约打款时间</th>
											<th class="center" >实际打款时间</th>
											<th class="center" >申请状态</th>
										</tr>
										</thead>
										<tbody>
										<#if periodApplyList>
											<#list periodApplyList as periodApply>
											<tr>
												<td class="center">
													<div>${periodApply_index+1+(pageView_ajax.pageNow-1)*pageView_ajax.pageSize}</div>
												</td>
												<td class="center">
													<div>
														<a href="#"  style="color: #3eafe0" onclick="openItemInfo(${periodApply.itemId});"  title="查看项目明细 ">
															${periodApply.itemName?if_exists}
														</a>
													</div>
												</td>
												<td class="center">
													<div>
														<a href="#" style="color: #3eafe0" onclick="openPeriodInfo(${periodApply.perId});" title="点击查看分期明细">
															${periodApply.perName?if_exists}
														</a>
													</div>
												</td>
												<td class="center">
													<div><@amount_sub amount="${periodApply.perPlanQuota}" type=2 /></div>
												</td>
												<td class="center">
													<div><@amount_sub amount="${periodApply.perRemainQuota}" type=2 /></div>
												</td>
												<td class="center">
													<div><@amount_sub amount="${periodApply.applyQuota}" type=2 /></div>
												</td>
												<td class="center">
													<div>${periodApply.incUnit}</div>
												</td>
												<td class="center">
													<div>${periodApply.incTerm}</div>
												</td>
												<td class="center">
													<div>${periodApply.applyUserName}</div>
												</td>
												<td class="center">
													<div>${periodApply.applyAdvisorName}</div>
												</td>
												<td class="center">
													<div>${periodApply.orgShortName}</div>
												</td>
												<td class="center">
													<div><@date_sub value='${periodApply.applyTime?string("yyyy-MM-dd HH:mm:ss")}' /></div>
												</td>
												<td class="center">
													<div><@date_sub value='${periodApply.payTime?string("yyyy-MM-dd HH:mm:ss")}' /></div>
												</td>
												<td class="center">
													<div>
													<#if periodApply.truePayTime>
														<@date_sub value='${periodApply.truePayTime?string("yyyy-MM-dd HH:mm:ss")}' />
													<#else>
														--
													</#if>
													</div>
												</td>
												<td class="center">
													<div><@option name="apply_status_param" status="1" type="3" value="${periodApply.applyStatus}" /></div>
												</td>
											</tr>
											</#list>
										<#else>
											<tr align="center"><td colspan="15"><font color="red" size="4">没有查询到数据！</font></td></tr>
										</#if>
										</tbody>
									</table>
								<input type="hidden" id="pageNow_ajax" name="pageNow_ajax" value="${pageView_ajax.pageNow?if_exists}" />
									<#if periodApplyList>
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
			$("#periodApplyListModal").modal("hide");
			$("#periodApplyListModal").on("hidden.bs.modal", function() {
				queryPeriodApply($("#queryForm_ajax").serialize());
				$(this).off("hidden.bs.modal");
			});
		});
	});
	
	//翻页动作
	function queryformPage_ajax() {
		$("#periodApplyListModal").modal("hide");
		$("#periodApplyListModal").on("hidden.bs.modal", function() {
			queryPeriodApply($("#queryForm_ajax").serialize());
			$(this).off("hidden.bs.modal");
		});
	}
</script>
