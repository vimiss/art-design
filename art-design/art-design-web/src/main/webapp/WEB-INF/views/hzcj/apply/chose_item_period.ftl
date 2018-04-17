<!-- 项目分期详情页面 -->
<#include "hzcj/common/option.ftl">
<#assign ctx = request.contextPath>
<div class="modal-dialog" role="document" style="width: 1600px;">
	<div class="modal-content">
		
		<div class="modal-header">
			<button type="button" class="bootbox-close-button close" data-dismiss="modal" aria-hidden="true">×</button>
			
			<h4 class="modal-title">&nbsp;选择项目分期</h4>
		</div>
		<div class="modal-body">
			<div class="page-content ">
				<div class="row" style="padding-top: 10px;">
				<div class="col-xs-12">
				<form action="${ctx}/periodApply/choseItemPeriod" method="POST" id="queryForm_ajax">
						<!-- PAGE CONTENT BEGINS -->
						<div class="col-xs-12">
						<div class="col-sm-4">
							<label>项目标题：</label>
							<input type="text" class="InputName0" name="itemName" value="${itemName}" />
							<a href="javascript:;" id="queryCommit_ajax" class="BtnSouSu default-btn btn-blue">查 询</a>
						</div>
					</div>
						
						<div class="col-xs-12">
							<a id="queryUnitChose" onclick="queryUnitChose();" class="BtnNormalSu default-btn btn-blue">确认项目分期</a>
								
							<table class="table table-striped table-bordered table-hover RtableStriped RtableStropSOS">
								<thead>
								<tr role="row">
									<th class="center" >选择</th>
									<th class="center" >项目标题</th>
									<th class="center" >分期标题</th>
									<th class="center" >剩余额度</th>
									<th class="center" >剩余人数</th>
									<th class="center" >开标时间</th>
									<th class="center" >结束时间</th>
									<th class="center" >打款截止日期</th>
									<th class="center" >是否浮动</th>
									<th class="center" >收益区间</th>
									<th class="center" >分期状态</th>
								</tr>
								</thead>
								<tbody>
								<#if itemPeriodList?if_exists>
									<#list itemPeriodList as itemPeriod>
										<#if itemPeriod>
												<tr>
												<td class="center">
														<div>   <input name="perIdRadio" type="radio" value="${itemPeriod.perId?if_exists}">  </div>
												</td>
													<td class="center">
														<div>
															<a href="#" style="color: #3eafe0" onclick="openItemInfo(${itemPeriod.itemId});" title="点击查看项目明细">
																${itemPeriod.itemName?if_exists}
															</a>
														</div>
													</td>
													<td class="center">
														<div>
															<a href="#" style="color: #3eafe0" onclick="openPeriodInfo(${itemPeriod.perId});" title="点击查看分期明细">
																${itemPeriod.perName?if_exists}
															</a>
														</div>
													</td>
													<td class="center">
														<div>${itemPeriod.perRemainQuota?if_exists}</div>
													</td>
													<td class="center">
														<div>${itemPeriod.perRemainPeopleNum?if_exists}</div>
													</td>
													<td class="center">
														<div><@date_sub value='${itemPeriod.perOpenTime?string("yyyy-MM-dd HH:mm:ss")}' /></div>
													</td>
													<td class="center">
														<div><@date_sub value='${itemPeriod.perOverTime?string("yyyy-MM-dd HH:mm:ss")}' /></div>
													</td>
													<td class="center">
														<div><@date_sub value='${itemPeriod.perPayEndDate?string("yyyy-MM-dd HH:mm:ss")}' /></div>
													</td>
													<td class="center">
														<div><@option name="yes_no_type_param" status="1" type="3" value="${itemPeriod.perDrift}" /></div>
													</td>
													<td class="center">
														<div>${itemPeriod.perMinFee?if_exists}%~${itemPeriod.perMaxFee?if_exists}%</div>
													</td>
													<td class="center">
														<div style=""><@option name="period_status_param" status="1" type="3" value="${itemPeriod.perStatus}"/></div>
													</td>
												</tr>
								    		</#if>
									</#list>
								<#else>
									<tr align="center"><td colspan="11"><font color="red" size="4">没有查询到数据！</font></td></tr>
								</#if>
								</tbody>
							</table>
							<input type="hidden" id="pageNow_ajax" name="pageNow_ajax" value="${pageView_ajax.pageNow?if_exists}" />
							<#if itemPeriodList>
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
			$("#chosePeriodModal").modal("hide");
			$("#chosePeriodModal").on("hidden.bs.modal", function() {
				choseItemPeriod($("#queryForm_ajax").serialize());
				$(this).off("hidden.bs.modal");
			});
		});
	});
	function queryUnitChose() {
		var perId = $('input:radio[name="perIdRadio"]:checked').val();
		if (!perId) {
			Modal.alert({msg:"请选择一条需要操作的数据"});
			return;
		}
		$("#chosePeriodModal").modal("hide");
		$('#choseUnitModal').html("加载中...").load('${ctx}/periodApply/queryInvestUnit?perId='+perId , function(res,sta,xhr){
			if(res){//判断是否正常返回了数据--登录拦截,res,sta,xhr
				$("#choseUnitModal").modal({
					keyboard:'false',//true是默认可是使用esc退出弹窗，false是不能使用esc退出
					show:'true',// bool值，立即调用show
					backdrop:'static'//static是只在弹窗内点击关闭按钮可以关闭
				});
			}
		});
	}
	//翻页动作
	function queryformPage_ajax() {
		$("#chosePeriodModal").modal("hide");
		$("#chosePeriodModal").on("hidden.bs.modal", function() {
			choseItemPeriod($("#queryForm_ajax").serialize());
			$(this).off("hidden.bs.modal");
		});
	}
</script>
