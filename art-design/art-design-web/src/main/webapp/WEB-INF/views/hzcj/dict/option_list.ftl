<!-- 数据字典项详情页面 -->
<#assign ctx = request.contextPath>
<#include "hzcj/common/option.ftl">
<!-- Modal -->
<div class="modal-dialog" role="document" style="width: 1200px;">
	<div class="modal-content">
		
		<div class="modal-header">
			<button type="button" class="bootbox-close-button close" data-dismiss="modal" aria-hidden="true">×</button>
			
			<h4 class="modal-title">&nbsp;选项列表</h4>
		</div>
		<div class="modal-body" <#if optionListById?if_exists>style="height:600px;"</#if>>
			<div class="col-xs-12">
				<span onclick="queryOptionAdd(${paramId});" class="BtnNormalSu default-btn btn-blue">新 增</span>
				<span href="javascript:;" onclick="queryOptionDel(${paramId});" class="BtnNormalSu default-btn btn-blue">删 除</span>
				
				<table class="table table-striped table-bordered table-hover RtableStriped RtableStropSOS">
					<thead>
					<tr role="row">
						<th class="center">选择</th>
						<th class="center" width="5%">
							<span class="lbl" title="">序号</span>
						</th>
						<th class="center">选项名称</th>
						<th class="center">选项描述</th>
						<th class="center">选项状态</th>
						<th class="center">操作</th>
					</tr>
					</thead>
					<tbody>
					<#if optionListById?if_exists>
						<#list optionListById as optionListBy>
						<tr>
							<td class="center">
								<div class="aName"><input type="radio" value="${optionListBy.optionName}" name="optionNameRadio" /></div>
							</td>
							<td class="center">
								<div class="aName">${optionListBy_index+1}</div>
							</td>
							<td class="center">
								<div class="aName">${optionListBy.optionName?if_exists}</div>
							</td>
							<td class="center">
								<div class="aName">${optionListBy.optionDesc?if_exists}</div>
							</td>
							<td class="center">
								<div class="aName">
									<@option name="status_param" status="1" type="3" value="${optionListBy.optionStatus}"/>
								</div>
							</td>
							<td class="center">
								<div class="aName">
									<a class="btn btn-primary btn-sm" onclick="queryOptionDetail(${paramId}, '${optionListBy.optionName}');">修改</a>
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
		<div class="modal-footer">
			<div class="text-center">
				<a type="button" onclick="closeOptionList();" class="default-btn btn-gray marginLR20">关 闭</a>
			</div>
		</div>
	</div>
</div>
<script>
	function getOptionRadioInput() {
		var radioInput = $('input:radio[name="optionNameRadio"]:checked').val();
		return radioInput;
	}
	function queryOptionDel(paramId) {
		var optionNameRadio = getOptionRadioInput();
		if (!optionNameRadio) {
			Modal.alert({msg:"请选择一条需要操作的数据"});
			return;
		}
		Modal.confirm({msg:"确认要删除吗？", okCallback:function() {
			$(this).on("hidden.bs.modal", function() {
				$.ajax({
					type: "post",
					dataType: "json",
					data: {"paramId": paramId, "optionName": optionNameRadio},
					url: "${ctx}/dict/option/remove",
					success: function(result) {
						if (result.code == "0") {
							Modal.alert({msg:"删除成功", okCallback:function() {
								closeOptionList();
								$("#option_list_modal").on("hidden.bs.modal", function() {
									queryOptionList(paramId);
									$(this).off("hidden.bs.modal");
								});
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
