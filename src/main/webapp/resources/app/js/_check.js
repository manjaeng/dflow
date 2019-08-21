fp.check = {};

!function() {
	
	$(document).on({
		'pjax:success' : function() {
			console.log('_check.js : pjax success',fp.util.getTime());
		}
	});
	
}();