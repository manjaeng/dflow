fp.history = {};
fp.history.pageUrl = [];
//pageList
fp.history.currentPageName = "";

fp.history.pushPage = function(pageName) {

	if (this.currentPageName !== "") {
		fp.history.pageUrl.push(this.currentPageName);
	}
	this.currentPageName = pageName
	
}

fp.history.popPage = function() {
	var beforePageUrl = fp.history.pageUrl[fp.history.pageUrl.length - 1];

	fp.history.pageUrl.pop();

	return beforePageUrl;
}

fp.history.clearPage = function() {
	fp.history.pageUrl = [];
}