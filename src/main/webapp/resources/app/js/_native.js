//fp.native = {};
//fp.native.android = {};
//fp.native.ios = {};


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

function nslog(message) {
	oHybridNative.exec(undefined, undefined, "Log", "Debug", [message])
}

function showCamera(callbackfunc) {
	oHybridNative.exec(callbackfunc, undefined, "Photo", "Camera", [])
}

function showPhotoForPickupThree(callbackfunc) {
	oHybridNative.exec(callbackfunc, undefined, "Photo", "PickupThree", [])
}

function getNativeData(key, callbackfunc) {
	oHybridNative.exec(callbackfunc, undefined, "App", "getData", [key])
}

function setNativeData(key, value) {
	oHybridNative.exec(undefined, undefined, "App", "setData", [key, value])
}

function showPhotoForPickupMulti(callbackfunc) {
	oHybridNative.exec(callbackfunc, undefined, "Photo", "PickupMulti", [])
}

function openSystemSharePopup(callbackfunc) {
	oHybridNative.exec(callbackfunc, undefined, "Dialog" , "System", [])
}
