
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
