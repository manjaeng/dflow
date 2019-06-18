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

