<!-- 用户属性详情页面 -->
<#assign ctx = request.contextPath>
<div class="modal-dialog" role="document" style="width: 520px;">
	<div class="modal-content">
		
		<div class="modal-header">
			<button type="button" class="bootbox-close-button close" data-dismiss="modal" aria-hidden="true">×</button>
			
			<h4 class="modal-title">&nbsp;属性详情</h4>
		</div>
		<div class="modal-body">
			<div class="col-xs-12">
				<div class="col-xs-12">
					<div class="col-sm-8 mb10">
						<label>属性名称：</label>
						<input type="text" class="InputName1" name="attrName" value="${userAttr.attrName}" readonly="readonly" />
					</div>
				</div>
				<div class="col-xs-12">
					<div class="col-sm-8 mb10">
						<label>属性代码：</label>
						<input type="text" class="InputName1" name="attrCode" value="${userAttr.attrCode}" readonly="readonly" />
					</div>
				</div>
				<div class="col-xs-12">
					<div class="col-sm-8 mb10">
						<label>属<span style="margin-right:7px;"></span>性<span style="margin-right:7px;"></span>值：</label>
						<input type="text" class="InputName1" name="attrValue" value="${userAttr.attrValue}" readonly="readonly" />
					</div>
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<div class="text-center">
				<a href="javascript:;" data-dismiss="modal" class="default-btn btn-orange noBorder marginLR20">关 闭</a>
			</div>
		</div>
	</div>
</div>
