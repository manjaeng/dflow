
function loadPage_Clear(pageName) {
	clearHistory()
	currentPageName = pageName
	currentPageData = null
	currentStoredData = null
	loadToPort(currentPageName)
}

function loadPage_Normal(pageName) {
	pushHistory(currentPageName, currentPageData, currentStoredData)
	currentPageName = pageName
	currentPageData = null
	currentStoredData = null
	loadToPort(currentPageName)
}

