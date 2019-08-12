if ($.support.pjax) {
	$(document).on('click', 'a', function(e) {
		
		var url = $(this).attr('href');
		var bool = true;
		
		if (url.includes('.jsp')) {
			e.preventDefault();
			
			if('function' == typeof moveFunc) {
				
				bool = moveFunc();
				
				if(bool || 'undefined' == typeof bool) {
					moveFunc = null;
				}
				
			} else {
				$.pjax({
					url : url,
					fragment : '#wrap',
					container : '#wrap'
				});
			}
		}
	});
}

