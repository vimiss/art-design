<#assign ctx = request.contextPath>
<#include "hzcj/common/option.ftl">
<!-- Modal -->
<div class="modal-dialog modal-lg1" role="document" style="hight:800px;">
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
			<h4 class="modal-title" id="myModalLabel">阀值配置新增</h4>
		</div>
		<div class="modal-body">
		<form role="form" class="form-group" action="${ctx}/recruit/update" method="POST" id="addForm" >
				<input type="hidden" name="addConfig" value="${addConfig?if_exists}" />
			<div class="container-fluid">
				<div class="row">
					 <div class=" Mylist clearfix">
					 
	               <div>
						<div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>阀值名称：</div>
							<div class="pull-left MylistRight">
								<input type="text" class="InputName1" name="confName" id="confName"  maxlength="20"  placeholder="姓名只能为20位以内汉字或字母">
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
						
						
						
					<div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>阀值类型：</div>
							<div class="pull-left MylistRight">
							  <select class="chosen-select AceSelect" name="confType" >
										<@option name="config_type_param" status="1" type="2"/>
								</select>
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
						
					<div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>阀值最小值：</div>
							<div class="pull-left MylistRight">
							  <input type="text" class="InputName1" name="confMinValue" id="confMinValue"  maxlength="20"  placeholder="">
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
					<div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>阀值最大值：</div>
							<div class="pull-left MylistRight">
							  <input type="text" class="InputName1 checkConfValue " name="confMaxValue" id="confMaxValue"  maxlength="20"  placeholder="">
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
					<div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>阀值排序：</div>
							<div class="pull-left MylistRight">
							  <input type="text" class="InputName1" name="confSort" id="confSort"  maxlength="20"  placeholder="">
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
					<div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>阀值结果：</div>
							<div class="pull-left MylistRight">
							  <input type="text" class="InputName1 " name="confResult" id="confResult"  maxlength="20"  placeholder="">
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
					<div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>阀值描述：</div>
							<div class="pull-left MylistRight">
							  <input type="text" class="InputName1" name="confDesc" id="confDesc"  maxlength="20"  placeholder="">
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
					<div class="col-xs-12 MylistCol">
							<div class="pull-left MylistLeft"><span class="red">*</span>使用状态：</div>
							<div class="pull-left MylistRight">
							  <select class="chosen-select AceSelect" name="confStatus" >
										<@option name="status_param" status="1" type="2"/>
								</select>
								<span id="checkStudentName" class="light-red"></span>
							</div>
						</div>
						
						
						
      <div class="modal-footer">
			<div class="text-center">
				<a onclick="ajaxSaveConfig();" class="default-btn btn-orange marginLR20 mt10" >保 存</a>
				<a type="button" data-dismiss="modal" class="default-btn btn-gray marginLR20 mt10">取 消</a>
			</div>
		</div>
						
</div>	<!--隐藏结束-->			
				</div>
			</div>

			
		</form>
		</div>
		
	</div>
</div>
<style>
input.error { border: 1px solid red; }
.error {
    overflow: hidden;
    padding: 0 8px 0 0;
    position: relative;
    color:red;
}
</style>
<script type="text/javascript" src="${ctx}/js/hzcj/configs.js?v=${jsv}"></script>
	<script type="text/javascript" >

		</script>
