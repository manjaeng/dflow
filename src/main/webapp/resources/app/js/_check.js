fp.check = {};

!function() {
	
	$(document).on({
		'pjax:success' : function() {
			if (fp.util.getCookie('authToken') == null || fp.util.getCookie('authToken') == "") {
				console.log('_check.js :','토큰없음',fp.util.getTime());
			} else {
				console.log('_check.js :','토큰있음',fp.util.getTime());
			}
		}
	});
	
}();