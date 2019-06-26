var fp = {};
fp.intro = {};
fp.util = {};

fp.util.jsonAjax = function(obj) {
	$.ajax({
		type : 'post',
		url : obj.url,
		data : JSON.stringify(obj.data),
		contentType : 'application/json; charset=utf-8',
		dataType : 'json',
		success : function(data) {
			obj.success(data);
		},
		error : function(xhr,status,error) {
			if(obj.error) {
				obj.error(xhr,status,error);
			}
		}
	});
}

fp.util.setCookie = function(obj) {
	var date = new Date();
	date.setTime(date.getTime() + 1 * 24 * 60 * 60 * 1000);

	for ( var key in obj) {
		document.cookie = encodeURIComponent(key) + '='
				+ encodeURIComponent(obj[key]) + ';expires=' + date + ';path=/';
	}
}

fp.util.getCookie = function(name) {
	var value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
	return value ? decodeURIComponent(value[2]) : null;
};

fp.util.delCookie = function(name) {
	document.cookie = name + '=; expires=Thu, 01 Jan 1970 00:00:01 GMT;';
}

fp.util.isIOS = function() {
	var userAgent = navigator.userAgent.toLowerCase();
	if ((userAgent.indexOf('iphone') != -1)
			|| (userAgent.indexOf('ipad') != -1)) {
		return true;
	}
	return false;
}

fp.util.isAndroid = function() {
	var userAgent = navigator.userAgent.toLowerCase();
	if ((userAgent.indexOf('android') != -1)) {
		return true;
	}
	return false;
}