if ($.support.pjax) {
	$(document).on('click', 'a', function(e) {
		
		var url = $(this).attr('href');

		if (url.includes('.do')) {
			e.preventDefault();
			pjax(url);
		}
	});
	
	$(document).on({
		'pjax:success' : function() {
			console.log('_init.js : pjax success',fp.util.getTime());
			$('body').attr('class','body');
			ui.init();
		}
	});
	
	function pjax(url) {
		$.pjax({
			url : url,
			fragment : '#wrap',
			container : '#wrap'
		});
	};
	
	function pjaxReload() {
		$.pjax.reload({
			fragment : '#wrap',
			container : '#wrap'
		});
	}
}

