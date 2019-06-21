fp.check = {};

!function() {
	
	if (fp.util.getCookie('authToken') == null || fp.util.getCookie('authToken') == "") {
		console.log('_check.js : '+'토큰없음');
	} else {
		console.log('_check.js : '+'토큰있음');
	}
}();