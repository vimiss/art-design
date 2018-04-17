<!-- 数据字典项详情页面 -->
<#assign ctx = request.contextPath>
<#include "hzcj/common/option.ftl">
<!-- Modal -->
<div class="modal-dialog" role="document" style="width: 800px;">
	<div class="modal-content">
		
		<div class="modal-header">
			<button type="button" class="bootbox-close-button close" data-dismiss="modal" aria-hidden="true">×</button>
			
			<h4 class="modal-title">&nbsp;市列表</h4>
		</div>
		<div class="modal-body" <#if cityLists?if_exists>style="height:600px;"</#if>>
			<div class="col-xs-12">
				<span href="javascript:;" onclick="queryOptionPcAdd('${pcProvinceCode}');" class="BtnNormalSu default-btn btn-blue">新 增</span>
				<span href="javascript:;" onclick="queryOptionPcDel('${pcProvinceCode}');" class="BtnNormalSu default-btn btn-blue">删 除</span>
				
				<table class="table table-striped table-bordered table-hover RtableStriped RtableStropSOS">
					<thead>
					<tr role="row">
						<th class="center">选择</th>
						<th class="center">序号</th>
						<th class="center">城市编码</th>
						<th class="center">城市名称</th>
						<th class="center">操作</th>
					</tr>
					</thead>
					<tbody>
					<#if cityLists?if_exists>
						<#list cityLists as cityList>
						<tr>
							<td class="center">
								<div class="aName"><input type="radio" value="${cityList.pcCode}" name="optionPcCodeRadio" /></div>
							</td>
							<td class="center">
								<div class="aName">${cityList_index+1}</div>
							</td>
							<td class="center">
								<div class="aName">${cityList.pcCode?if_exists}</div>
							</td>
							<td class="center">
								<div class="aName">${cityList.pcName?if_exists}</div>
							</td>
							<td class="center">
								<div class="aName">
									<a class="btn btn-primary btn-sm" onclick="queryOptionPcMod('${cityList.pcCode}', '${pcProvinceCode}');">修改</a>
								</div>
							</td>
						</tr>
						</#list>
					<#else>
						<tr align="center"><td colspan="5"><font color="red" size="4">没有查询到数据！</font></td></tr>
					</#if>
					</tbody>
				</table>
			</div>
		</div>
		<div class="modal-footer">
			<div class="text-center">
				<a type="button" onclick="closeOptionPcList();" class="default-btn btn-gray marginLR20">关 闭</a>
			</div>
		</div>
	</div>
</div>
<script>
	function getOptionPcRadioInput() {
		var radioInput = $('input:radio[name="optionPcCodeRadio"]:checked').val();
		return radioInput;
	}
	function queryOptionPcDel(pcProvinceCode) {
		var optionPcRadio = getOptionPcRadioInput();
		if (!optionPcRadio) {
			Modal.alert({msg:"请选择一条需要操作的数据"});
			return;
		}
		Modal.confirm({msg:"确认要删除吗？", okCallback:function() {
			$(this).on("hidden.bs.modal", function() {
				$.ajax({
					type: "post",
					dataType: "json",
					data: {"pcCode": optionPcRadio},
					url: "${ctx}/dict/option/pc/remove",
					success: function(result) {
						if (result.code == "0") {
							Modal.alert({msg:"删除成功", okCallback:function() {
								closeOptionPcList();
								$("#option_pc_list_modal").on("hidden.bs.modal", function() {
									queryOptionPcList(pcProvinceCode);
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
