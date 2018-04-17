(function($) {
	$.fn.remotemodal = function() {
		$(this).each(function() {
			$(this).click(function(e) {
				var handler = $(this);
				var url = handler.attr('href');
				var target = handler.attr('data-target');
				
				if(url) {
					var modal = $(target);
					if(!modal.get(0)) {
						modal = $('<div class="modal fade"></div>').insertAfter(handler);
					}
					modal.load(url, function() {
						$(this).modal({
							backdrop: false,
							show: true
						});
					});
				}
				
				e.preventDefault();
			});
		});
	};
}(jQuery));

$(function() {
	$('a[data-toggle="remotemodal"]').remotemodal();
});