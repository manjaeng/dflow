if ($.support.pjax) {
	$(document).on('click', 'a', function(e) {
		
		e.preventDefault();
		var url = $(this).attr('href');

		if (url.includes('.jsp')) {
			
			$.pjax({
				url : url,
				fragment : '#wrap',
				container : '#wrap'
			});
		}
	});
}

