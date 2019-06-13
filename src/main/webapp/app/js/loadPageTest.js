!function() {

	var loadTarget = '#main';

	var page = {

		load : function(url, callback) {

			$(loadTarget).load(url, function(resText, status, xhr) {
				
				if (status === 'success' && callback != undefined) {
					callback();
				}
			});

		}
	}

	window.page = page;
}()