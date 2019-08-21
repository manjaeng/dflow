var fp = {};
fp.data = {};
fp.util = {};

fp.util.jsonAjax = function(obj) {
	$.ajax({
		type : 'post',
		url : obj.url,
		data : JSON.stringify(obj.data),
		contentType : 'application/json; charset=utf-8',
		success : function(data) {
			obj.success(data);
		},
		error : function(xhr,status, error) {
			if (obj.error) {
				obj.error(xhr, status, error);
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

fp.util.getTime = function() {

	function checkTime(i) {
		return (i < 10) ? "0" + i : i;
	}

	var today = new Date(), h = checkTime(today.getHours()), m = checkTime(today
			.getMinutes()), s = checkTime(today.getSeconds());

	return h + ":" + m + ":" + s;
}

fp.util.getTimer = function(d, selector) {

	var duration = d;
	var timer, minutes, seconds, interval, endFlag;

	return {
		init : function() {
			endFlag = false;
			clearInterval(interval);
			timer = duration;
		},
		start : function() {

			this.init();
			
			interval = setInterval(function() {
				minutes = parseInt(timer / 60 % 60, 10);
				seconds = parseInt(timer % 60, 10);

				minutes = minutes < 10 ? "0" + minutes : minutes;
				seconds = seconds < 10 ? "0" + seconds : seconds;

				$(selector).text(minutes + ":" + seconds);
				$(selector).show();

				if (--timer < 0) {
					endFlag = true;
					timer = 0;
					clearInterval(interval);
				}
			}, 1000);
		},
		isEnd : function() {
			return endFlag;
		},
		isStart : function() {
			if('undefined' === typeof interval) {
				return false;
			} else {
				return true;
			}
		},
		destroy : function() {
			clearInterval(interval);
			$(selector).hide();
		}
	}
}

fp.util.checkRegEx = function(type,val1) {
	var regEx;
	
	if(type == 'mobile') {
		regEx = /(01[016789])([1-9]{1}[0-9]{2,3})([0-9]{4})$/;
	}
	
	return regEx.test(val1);
}