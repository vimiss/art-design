<!-- 分期延期页面 -->
<#include "hzcj/common/option.ftl">
<#assign ctx = request.contextPath>
<!-- Modal -->
<div class="modal-dialog" role="document" style="width: 520px;">
	<div class="modal-content">
		
		<div class="modal-header">
			<button type="button" class="bootbox-close-button close" data-dismiss="modal" aria-hidden="true">×</button>
			
			<h4 class="modal-title">&nbsp;分期延期</h4>
		</div>
		<div class="modal-body">
			<div class="col-xs-12">
				<div class="col-xs-12" style="display: none;">
					<div class="col-sm-8">
						<label>分期ID：</label>
						<input type="text" class="InputName1" id="perId" value="${itemPeriod.perId}" readonly="readonly" />
						<input type="hidden" id="modPeriodDelay" name="modPeriodDelay" value="${modPeriodDelay?if_exists}" />
					</div>
				</div>
				<div class="col-xs-12">
					<div class="col-sm-8">
						<label>原分期结束时间：</label>
						<input id="oldPerOverTime" name="oldPerOverTime" value="${itemPeriod.perOverTime?string('yyyy-MM-dd') }" class="Wdate WdateInput2" type="text" readonly="readonly">					
					</div>
				</div>
				<div class="col-xs-12">
					<div class="col-sm-8">
						<label>新分期结束时间：</label>
						<input id="perOverTimeStr" name="perOverTimeStr" class="Wdate WdateInput2" type="text"  onfocus="WdatePicker({minDate:'#F{$dp.$D(\'oldPerOverTime\')}',dateFmt:'yyyy-MM-dd',isShowClear:true,isShowOthers:false,qsEnabled:false})">
					</div>
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<div class="text-center">
				<a type="button" href="javascript:;" onclick="submitPerOverTime();" class="default-btn btn-orange marginLR20">保 存</a>
				<a type="button" href="javascript:;" data-dismiss="modal" class="default-btn btn-gray marginLR20">取 消</a>
			</div>
		</div>
	</div>
</div>
<script>
	function submitPerOverTime() {
		var perId = $("#perId").val();
		var perOverTime = $("#perOverTimeStr").val();
		var modPeriodDelay = $("#modPeriodDelay").val();
		if (!perOverTime) {
			Modal.alert({msg:"请选择新的分期结束时间"});
			return;
		}
		Modal.confirm({msg:"确认让该分期延期吗？", okCallback:function() {
			$(this).on("hidden.bs.modal", function() {
				$.ajax({
					type: "post",
					dataType: "json",
					data: {"perId": perId, "perOverTimeStr": perOverTime,"modPeriodDelay":modPeriodDelay},
					url: ctx+"/itemPeriodAudit/token/modPeriodDelay",
					success: function(result) {
						if (result.code == "0") {
							Modal.alert({msg:"分期延期成功", okCallback:function() {
								$("#periodOverTimeModal").modal("hide");
								$("#periodOverTimeModal").on("hidden.bs.modal", function(){
									$("#queryCommit").click();
									$(this).off("hidden.bs.modal");
								});
							}});
						} else {
							$("input[name='modPeriodDelay']").val(result.value.newTokenName);
							Modal.alert({msg:result.msg});
						}
					}
				});
				
				$(this).off("hidden.bs.modal");
			});
		}});
	}
</script>
