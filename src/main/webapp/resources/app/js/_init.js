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
}

