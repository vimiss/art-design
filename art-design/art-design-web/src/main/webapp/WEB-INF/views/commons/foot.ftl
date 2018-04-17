
		  <div class="footer">
				<div class="footer-inner">
					<!-- #section:basics/footer -->
					<div class="footer-content">
						<span class="bigger-120">
						</span>
					</div>

					<!-- /section:basics/footer -->
				</div>
			</div>

			<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
				<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
			</a>
		<!-- basic scripts -->
		<!--[if !IE]> -->
		<script type="text/javascript">
		<#if System.getProperty("project.env")=='pro'>
			window.jQuery || document.write("<script src='${ctx}/js/jquery-1.11.3.min.js'>"+"<"+"/script>");
		<#else>
			window.jQuery || document.write("<script src='${ctx}/js/jquery-1.11.3.js'>"+"<"+"/script>");
		</#if>
		</script>

		<!-- <![endif]-->

		<!--[if IE]>
		<script type="text/javascript">
		 window.jQuery || document.write("<script src='${ctx}/js/jquery-1.11.3.js'>"+"<"+"/script>");
		</script>
		<![endif]-->
		<script type="text/javascript">
			if('ontouchstart' in document.documentElement) document.write("<script src='${ctx}/ace/js/jquery.mobile.custom.js'>"+"<"+"/script>");
		</script>
		<script src="${ctx}/ace/js/bootstrap.js"></script>
		<script src="${ctx}/js/birthday.js"></script>

		<!-- page specific plugin scripts -->

		<!-- ace scripts -->
		<script src="${ctx}/ace/js/ace/elements.scroller.js"></script>
		<script src="${ctx}/ace/js/ace/elements.colorpicker.js"></script>
		<script src="${ctx}/ace/js/ace/elements.fileinput.js"></script>
		<script src="${ctx}/ace/js/ace/elements.typeahead.js"></script>
		<script src="${ctx}/ace/js/ace/elements.wysiwyg.js"></script>
		<script src="${ctx}/ace/js/ace/elements.spinner.js"></script>
		<script src="${ctx}/ace/js/ace/elements.treeview.js"></script>
		<script src="${ctx}/ace/js/ace/elements.wizard.js"></script>
		<script src="${ctx}/ace/js/ace/elements.aside.js"></script>
		<script src="${ctx}/ace/js/ace/ace.js"></script>
		<script src="${ctx}/ace/js/ace/ace.ajax-content.js"></script>
		<script src="${ctx}/ace/js/ace/ace.touch-drag.js"></script>
		<script src="${ctx}/ace/js/ace/ace.sidebar.js"></script>
		<script src="${ctx}/ace/js/ace/ace.sidebar-scroll-1.js"></script>
		<script src="${ctx}/ace/js/ace/ace.submenu-hover.js"></script>
		<script src="${ctx}/ace/js/ace/ace.widget-box.js"></script>
		<script src="${ctx}/ace/js/ace/ace.settings.js"></script>
		<script src="${ctx}/ace/js/ace/ace.settings-rtl.js"></script>
		<script src="${ctx}/ace/js/ace/ace.settings-skin.js"></script>
		<script src="${ctx}/ace/js/ace/ace.widget-on-reload.js"></script>
		<script src="${ctx}/ace/js/ace/ace.searchbox-autocomplete.js"></script>
		<!-- bootbox -->
		<script src="${ctx}/ace/js/bootbox.js"></script>

		<!-- inline scripts related to this page -->

		<script src="${ctx}/pg/My97DatePicker/WdatePicker.js"></script>
		<!-- chosen-select 模拟-select -->
		<script src="${ctx}/ace/js/chosen.jquery.js"></script>
		<link rel="stylesheet" href="${ctx}/ace/css/chosen.css" />

		<script>
			//select
			$(".chosen-select").chosen();
		</script>
		<!-- chosen-select 模拟-select***end -->

		<!-- Modal -->
		<div class="modal fade HoranMyModals" id="foot_operate_modal_ok" data-backdrop="static">
			<div class="modal-dialog" role="document" style="width: 430px; height: 230px;">
				<div class="modal-content">
					<div class="modal-body">
						<div class="container-fluid">
							<div class="row">
								<div class="text-center" style="font-size: 24px; padding: 50px 0" id="footOkDiv"></div>
							</div>
						</div>
					</div>
					<div class="modal-footer ">
						<div class="text-center">
							<a href="javascript:;" data-dismiss="modal" class="default-btn btn-gray marginLR20">确 定</a>
						</div>
					</div>
				</div>
			</div>
		</div>

		<script type="text/javascript">
			var unauthorized = "${unauthorized}";
			if(unauthorized){
				$.ajax({
			        type: "POST",
			        url: "${ctx}/security/unauthorizedurl",
			        success: function (data) {
			        	if(data.type == 2) {
			        		$("#footOkDiv").html("您无权访问该链接");
							$("#foot_operate_modal_ok").modal({
							  	keyboard:'false',//true是默认可是使用esc退出弹窗，false是不能使用esc退出 foot
							  	show:'true',// bool值，立即调用show
							  	backdrop:'static'//static是只在弹窗内点击关闭按钮可以关闭
							});
			        	}
			        }
			    });
			}
			
			$(function(){
				var winheight = $(window).height();
				$(window).resize(function() {
					winheight = $(window).height();
				});
				$('.modal').on('shown.bs.modal', function () {
					var m = $(".modal-body");  
					m.css("maxHeight", winheight/2*1.5 + 'px');
				})
			});
		</script>
		<#include "commons/authc.ftl">
		<#include "commons/alert.ftl">
		<script type="text/javascript">
			var accoutOverDays = "${accoutOverDays}";
			if(accoutOverDays){
				$.ajax({
			        type: "POST",
			        url: "${ctx}/login/overdays",
			        success: function (data) {
			        	if(data.success){
			        		if(data.accoutOverDays<3) {
			        			Modal.alert({msg:data.accoutOverDays+"天后账号将过期，过期后无法登录。"});
			        		}
			        	}
			        }
			    });
			}
		</script>
		<script>
		<#if System.getProperty("project.env")=='pro'>
		var _hmt = _hmt || [];
		(function() {
  			var hm = document.createElement("script");
  			hm.src = "//hm.baidu.com/hm.js?c36d1e2690b3d5141b9527b93362d25a";
  			var s = document.getElementsByTagName("script")[0]; 
  			s.parentNode.insertBefore(hm, s);
		})();
		</#if>
		</script>