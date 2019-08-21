if ($.support.pjax) {
	$(document).on('click', 'a', function(e) {
		
		var url = $(this).attr('href');

		if (url.includes('.do')) {
			e.preventDefault();
			pjax(url);
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

