fp.history = {};
fp.history.page = [];

fp.history.pagePush = function(pageName) {
	fp.history.page.push(pageName);
}

fp.history.pagePop = function() {
	var beforePageName = fp.history.page[fp.history.page.length - 1];
	
	fp.history.page.pop();
	
	return beforePageName;
}

fp.history.pageClear = function() {
	fp.history.page = [];
}

fp.history.pageBack = function() {
	var beforePageName;

	if (fp.history.page.length === 0) {
		oHybridNative.callNativeBack();
	} else {
		beforePageName = fp.history.pagePop();
		
		if(beforePageName === null || beforePageName === "") {
			return
		} else {
			// load 호출
		}
	}
}
