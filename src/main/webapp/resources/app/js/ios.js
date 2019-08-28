var oHybridNative = {}
oHybridNative.callbackId = 0
oHybridNative.callbacks = []
oHybridNative.execIframe = null
oHybridNative.commandQueue = []
oHybridNative.exec = function() {
	var successCallback
	var failCallback
	var service
	var action
	var actionArgs
	var callbackId = null
	if (typeof arguments[0] !== 'string') {
		successCallback = arguments[0]
		failCallback = arguments[1]
		service = arguments[2]
		action = arguments[3]
		actionArgs = arguments[4]
		callbackId = 'INVALID'
	} else {
		alert('Wrong callback use function');
		return false;
	}
	
	if (actionArgs == undefined || actionArgs == null) {
		actionArgs = []
	}
	
	if (successCallback || failCallback) {
		callbackId = service + oHybridNative.callbackId++
		oHybridNative.callbacks[callbackId] = {success:successCallback, fail:failCallback}
	}
	
	actionArgs = oHybridNative.massageArgsJsToNative(actionArgs)
	var command = [callbackId, service, action, actionArgs]
	oHybridNative.commandQueue.push(JSON.stringify(command))
	if (oHybridNative.commandQueue.length == 1) {
		oHybridNative.pokeNative()
	}
}

oHybridNative.massageArgsJsToNative = function(args) {
	if (!args || typeof args != 'Array') {
		return args
	}
	var ret = []
	args.forEach(function(arg, i)
				 {
				 ret.push(arg)
				 })
	return ret
}

oHybridNative.pokeNative = function () {
	if (!document.body) {
		setTimeout(oHybridNative.pokeNative)
		return
	}
	
	//For WKWebView
	webkit.messageHandlers.gap.postMessage('gap://ready');
	
	//For UIWebView
//	if (oHybridNative.execIframe && oHybridNative.execIframe.contentWindow) {
//		oHybridNative.execIframe.contentWindow.location = 'gap://ready'
//	} else {
//		oHybridNative.execIframe = document.createElement('iframe')
//		oHybridNative.execIframe.style.display = 'none'
//		oHybridNative.execIframe.src = 'gap://ready'
//		document.body.appendChild(oHybridNative.execIframe)
//	}
}

oHybridNative.nativeFetchMessages = function() {
	// Each entry in commandQueue is a JSON string already.
	if (!oHybridNative.commandQueue.length) {
		return ''
	}
	var json = '[' + oHybridNative.commandQueue.join(',') + ']'
	oHybridNative.commandQueue.length = 0
	return json
}

oHybridNative.nativeCallback = function(callbackId, status, args) {
	var success = status === 0 || status === 1
	var func = oHybridNative.callbacks[callbackId]
	if (func) {
		if (success) {
			if (func.success) {
				func.success(success, status, args)
			}
		} else {
			if (func.fail) {
				func.fail(success, status, args)
			}
		}
	}
}

oHybridNative.callNativeBack = function() {
	oHybridNative.exec(callbackfunc, undefined, "App", "NativeBack", [])
}
