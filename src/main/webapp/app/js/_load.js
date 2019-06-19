fp.load = {};
fp.load.targetSelector = "#main";
fp.load.url_prefix = "/app/";

fp.load.move = function(obj) {
	
	if(obj.clear) {
		fp.history.clearPage();
	} else {
		fp.history.pushPage(obj.url);
	}
	
	$(this.targetSelector).load(this.url_prefix+obj.url, function(resText, status, xhr) {

		if (status === 'success' && obj.callBack !== undefined) {
			obj.callBack();
		}
	});

}

fp.load.back = function() {
	var beforePageUrl;

	if (fp.history.pageUrl.length === 0) {
		oHybridNative.callNativeBack();
	} else {
		beforePageUrl = fp.history.pagePop();
		
		if(beforePageName === null || beforePageName === "") {
			return
		} else {
			
			$(fp.load.targetSelector).load(this.url_prefix+beforePageUrl);
		}
	}
}

fp.load.reload = function() {
	$(fp.load.targetSelector).load(this.url_prefix+fp.history.currentPageName);
}