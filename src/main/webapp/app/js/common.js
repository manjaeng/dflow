var currentPageName = ""
var currentPageData;
var pageHistory =[]
var startFuncs
var titleBarConfig
var tabBarConfig
var requestParams = {};

function checkHistoryBack() {
	if (pageHistory.length == 0) {
		oHybridNative.callNativeBack()
	} else {
		historyBack()
	}
}

function historyBack() {
	var beforePage = popHistory()
	
	//이전페이지 실행시 저장된 페이지가 없을경우 alert 실행 - 최승훈(0605)
	if(beforePage == null ||beforePage.pn == "") {
		alert('common.js - historyBack() : NoStoredHistory')
		return
	}
	
	if (beforePage != null && beforePage != undefined) {
		currentPageName = beforePage.pn
		currentPageData = beforePage.pd
		currentStoredData = beforePage.sd
		loadToPort(beforePage.pn)
	}
}

function historyBackNoStoredData() {
	var beforePage = popHistory()
	if (beforePage != null && beforePage != undefined) {
		currentPageName = beforePage.pn
		currentPageData = beforePage.pd
		currentStoredData = undefined
		loadToPort(beforePage.pn)
	}
}

function pushHistory(pageName, pageData, storedData) {
	if (storedData) {
		storedData.scrollTop = $(document.body).scrollTop()
	}
	pageHistory[pageHistory.length] = {pn:pageName, pd:pageData, sd:storedData}
}

function popHistory() {
	if (pageHistory.length == 0)
		return null
	
	var beforePage = pageHistory[pageHistory.length - 1]
	pageHistory.length = pageHistory.length - 1
	return beforePage
}

function clearHistory() {
	pageHistory.length = 0
}
function loadPartial(fileUrl, parent, callbackfunc) {
	function innerLoadPartial(fileUrl, parent, callbackfunc) {
		$.ajax({
			url:fileUrl,
			type:"GET",
			contentType:"html/text; charset=utf-8",
			success: function(data) {
				startFuncs = []
				titleBarConfig = {}
				titleBarConfig.visible = false
				titleBarConfig.back = true
				tabBarConfig = {}
				tabBarConfig.visible = false
				parent.empty()
				parent.append("<div id=\"titleBarHolder\" style=\"width:100%;height:100px;display:none;\"></div>")
				var div = $(document.createElement("div"))
				div.html(data)
				var count = div.children().length
				for (var ii=0; ii<count; ii++) {
					parent.append(div.children()[0])
				}
				parent.append("<div id=\"tabBarHolder\" style=\"width:100%;height:100px;display:none;\"></div>")
				if (startFuncs != undefined && startFuncs != null) {
					for (var ii=0; ii<startFuncs.length; ii++) {
						startFuncs[ii]();
					}
					startFuncs = []
				}
				if (titleBarConfig.visible == true) {
					$("#titleBarHolder").show()
					$("#titleBarLayout").show()
					if (titleBarConfig.back == true) {
						$("#titleBackButton").show()
					} else {
						$("#titleBackButton").hide()
					}
				} else {
					$("#titleBarHolder").hide()
					$("#titleBarLayout").hide()
				}
				if (tabBarConfig.visible == true) {
					$("#tabBarHolder").show()
					$("#tabBarLayout").show()
				} else {
					$("#tabBarLayout").hide()
				}
				if (callbackfunc != undefined && callbackfunc != null) {
					callbackfunc()
				}
			},
			error: function(jqXHR, textStatus, errorThrown) {
				showServerErrorAlert()
			}
		});
	}
	innerLoadPartial(fileUrl, parent, callbackfunc);
}

function loadToPort(fileUrl, callbackfunc) {
	document.body.style.backgroundImage = ''
	document.body.style.backgroundColor = '#FFFFFF'
	loadPartial(fileUrl, $("#portDiv"),
		function() {
			if (currentStoredData == null) {
				$("html, body").animate({ scrollTop: 0 }, "slow")
			}
			if (callbackfunc != undefined && callbackfunc != null) {
				callbackfunc()
			}
		});
}

function addEle(parent, tagName, attr, css, clickfunc) {
	var element = $(document.createElement(tagName))
	if (parent != undefined && parent != null)
		parent.append(element)
	if (attr != undefined && attr != null)
		element.attr(attr)
	if (css != undefined && css != null)
		element.css(css);
	if (clickfunc != undefined && clickfunc != null)
		element.click(clickfunc)
	return element;
}

function pad(num, size) {
	var s = num+""
	while (s.length < size) s = "0" + s
	return s
}

function copyToClipboard(shareUrl) {
	oHybridNative.exec(undefined, undefined, "App", "CopyToClipboard", [shareUrl])
}

function nslog(message) {
	oHybridNative.exec(undefined, undefined, "Log", "Debug", [message])
}

function showAlert(title, message, callbackfunc) {
	oHybridNative.exec(callbackfunc, undefined, "Dialog", "Alert", [title, message, "확인"])
}

function showConfirm(title, message, callbackfunc) {
	oHybridNative.exec(callbackfunc, undefined, "Dialog", "Confirm", [title, message, "아니오", "예"])
}

function showSheet(title, buttons, callbackfunc) {
	oHybridNative.exec(callbackfunc, undefined, "Dialog", "Sheet", [title, buttons])
}

function callTelephone(telNumber) {
	oHybridNative.exec(undefined, undefined, "TelAndMail", "TEL", [telNumber])
}

function sendSMS(telNumber, smsBody) {
	oHybridNative.exec(undefined, undefined, "TelAndMail", "SMS", [telNumber, smsBody])
}

function sendEMail(emailAddr, emailTitle, emailBody) {
	oHybridNative.exec(undefined, undefined, "TelAndMail", "MAIL", [emailAddr, emailTitle, emailBody])
}

function showServerErrorAlert() {
	showAlert("", "서버와의 통신에 문제가 생겼습니다.")
}

function userAborted(xhr) {
	return !xhr.getAllResponseHeaders()
}

function requestHttp($url, $data, $method, $requestKey) {
	$.ajax({
		type: $method,
		url: $url ,
		timeout: (60 * 1000),
		data: $data ,
		contentType:"application/json; charset=utf-8",
		dataType:"json",
		beforeSend: function(xhr) {
		},
		xhrFields: {
			withCredentials: true
		},
		success: function(data) {
			if (responseData) {
				responseData(0, 200, data, $requestKey)
			}
		},
		error : function(jqXHR, textStatus, errorThrown) {
			if (responseData) {
				responseData(-1, jqXHR.status, null, $requestKey)
			}
		}
	});
}

function nesAjax($url, $data, $func, $error, $method) {
	$.ajax({
		type: $method,
		url: $url ,
		timeout: (60 * 1000),
		data: $data ,
		contentType:"application/json; charset=utf-8",
		dataType:"json",
		xhrFields: {
			withCredentials: true
		},
		success: function(data) {
			$func(data);
		},
		error: function(data) {
			try {
				$error(data);
			} catch(e) {
			}
		}
	});
}

function setAuthToken(authToken) {
	createCookie("AuthToken", authToken)
}

function setUserIdKey(userIdKey) {
	createCookie("UserIdKey", userIdKey)
}

function setUserId(userId) {
	createCookie("UserId", userId)
}

function setUserType(userType) {
	createCookie("UserType", userType)
}

function setUserName(userName) {
	createCookie("UserName", userName)
}

function getAuthToken() {
	return readCookie("AuthToken")
}

function getUserIdKey() {
	return readCookie("UserIdKey")
}

function getUserId() {
	return readCookie("UserId")
}

function getUserType() {
	return readCookie("UserType")
}

function getUserName() {
	return readCookie("UserName")
}

function createCookie(name, value, days) {
	var expires;

	if (days) {
		var date = new Date();
		date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
		expires = "; expires=" + date.toGMTString();
	} else {
		expires = "";
	}
	document.cookie = encodeURIComponent(name) + "=" + encodeURIComponent(value) + expires + "; path=/";
}

function readCookie(name) {
	var nameEQ = encodeURIComponent(name) + "=";
	var ca = document.cookie.split(';');
	for (var i = 0; i < ca.length; i++) {
		var c = ca[i];
		while (c.charAt(0) === ' ')
			c = c.substring(1, c.length);
		if (c.indexOf(nameEQ) === 0)
			return decodeURIComponent(c.substring(nameEQ.length, c.length));
	}
	return null;
}

function eraseCookie(name) {
	createCookie(name, "", -1);
}

function getDateTimeToString(lTime) {
	if (lTime == undefined) {
		return ""
	}
	var d = new Date(lTime);
	var mm = d.getMonth() + 1; // getMonth() is zero-based
	var dd = d.getDate();

	return [d.getFullYear(),
			(mm>9 ? '' : '0') + mm,
			(dd>9 ? '' : '0') + dd].join('.');
}

function getDateTimeToFullString(lTime) {
	if (lTime == undefined) {
		return ""
	}
	var d = new Date(lTime);
	var mm = d.getMonth() + 1; // getMonth() is zero-based
	var dd = d.getDate();
	var hh = d.getHours();
	var min = d.getMinutes();
	var ss = d.getSeconds();
	return [d.getFullYear(),
			(mm>9 ? '' : '0') + mm,
			(dd>9 ? '' : '0') + dd].join('.') + " " +
			[(hh>9 ? '' : '0') + hh,
			 (min>9 ? '' : '0') + min,
			 (ss>9 ? '' : '0') + ss].join(':');
}

function isIOS() {
	var userAgent = navigator.userAgent.toLowerCase();
	if ((userAgent.indexOf('iphone') != -1) || (userAgent.indexOf('ipad') != -1)) {
		return true;
	}
	return false;
}

function isAndroid() {
	var userAgent = navigator.userAgent.toLowerCase();
	if ((userAgent.indexOf('android') != -1)) {
		return true;
	}
	return false;
}
