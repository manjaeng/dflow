fp.load = {};
fp.load.targetSelector = "#wrap";
fp.load.url_prefix = "/app/";

fp.load.move = function(obj) {
	
	if(typeof obj === 'string') {
		
		fp.history.pushPage(obj);
		
		$(this.targetSelector).load(this.url_prefix+obj);
		
		return
	}
	
	if(obj.clear) {
		fp.history.clearPage(obj.url);
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
		//oHybridNative.callNativeBack();
		alert('이전페이지없음');
	} else {
		
		//뒤로가기시 이전 URL을 임시 변수에 넣어놓음
		beforePageUrl = fp.history.popPage();
		fp.history.currentPageName = beforePageUrl;
		
		if(beforePageUrl === null || beforePageUrl === "") {
			return
		} else {
			
			$(fp.load.targetSelector).load(this.url_prefix+beforePageUrl);
		}
	}
}

fp.load.reload = function() {
	$(fp.load.targetSelector).load(this.url_prefix+fp.history.currentPageName);
}