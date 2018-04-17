<!-- 提示页面，可回调刷新 --> 
<!-- Modal -->
<div class="modal fade HoranMyModals" id="alert_reload_modal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel" style="z-index:2000;">
	<div class="modal-dialog" role="document" style="width: 430px; height: 230px;">
		<div class="modal-content">
			<div class="modal-body">
				<div class="container-fluid">
					<div class="row">
						<div class="text-center" style="font-size: 24px; padding: 50px 0" id="reload_message">[Message]</div>
					</div>
				</div>
			</div>
			<div class="modal-footer ">
				<div class="text-center">
					<a type="button" name="alertOk" href="javascript:;" data-dismiss="modal" class="default-btn btn-orange noBorder marginLR20">确 定</a>
					<a type="button" name="alertCancel" href="javascript:;" data-dismiss="modal" class="default-btn btn-gray marginLR20">取 消</a>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
$(function(){
	window.Modal = function() {
		var reg = new RegExp("\\[([^\\[\\]]*?)\\]", 'igm');
		var alr = $("#alert_reload_modal");
		var ahtml = alr.html();
		var _alert = function(options) {
			alr.html(ahtml); //复原
			alr.find('a[name="alertOk"]').removeClass('btn-success');
			alr.find('a[name="alertCancel"]').hide();
			_dialog(options);
			if (options.okCallback && options.okCallback instanceof Function) {
				alr.find('a[name="alertOk"]').click(function() {
					options.okCallback(true)
				});
			}
		};

		var _confirm = function(options) {
			alr.html(ahtml); //复原
			alr.find('a[name="alertOk"]').removeClass('btn-primary');
			alr.find('a[name="alertCancel"]').show();
			_dialog(options);
			var okCallback = options.okCallback;
			var cancelCallback = options.cancelCallback;
			if (okCallback && okCallback instanceof Function) {
				alr.find('a[name="alertOk"]').click(function() {
					okCallback(true);
				});
			}
			if (cancelCallback && cancelCallback instanceof Function) {
				alr.find('a[name="alertCancel"]').click(function() {
					cancelCallback(true);
				});
			}
		};

		var _dialog = function(options) {
			var ops = {
				msg : "提示内容",
				title : "操作提示",
				btnok : "确定",
				btncl : "取消"
			};

			$.extend(ops, options);

			var html = alr.html().replace(reg, function(node, key) {
				return {
					Title : ops.title,
					Message : ops.msg,
					BtnOk : ops.btnok,
					BtnCancel : ops.btncl
				}[key];
			});

			alr.html(html);
			alr.modal({
				width : 500,
				backdrop : 'static'
			});
		}

		return {
			alert : _alert,
			confirm : _confirm
		}

	}();
});
</script>