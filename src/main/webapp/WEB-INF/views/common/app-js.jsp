<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="/resources/app/js/iscroll.js"></script>
<script src="/resources/app/js/swiper.js"></script>
<script src="/resources/app/js/pullToRefresh.js"></script>
<script src="/resources/app/js/jquery-listswipe.js"></script>
<script src="/resources/app/js/autosize.js"></script>
<script src="/resources/app/js/ui.js"></script>

<script src="/resources/app/js/jquery.pjax.js"></script>
<script src="/resources/app/js/_common.js"></script>
<script src="/resources/app/js/_native.js"></script>
<script src="/resources/app/js/_init.js"></script>
<!--script src="/resources/app/js/android.js"></script-->
<script>
function loadNativeJavaScript(isIOS) {
	var nativeScript = document.createElement('script');
	if (isIOS) {
		nativeScript.src = '/resources/app/js/ios.js'
	} else {
		nativeScript.src = '/resources/app/js/android.js'
	}
	document.head.appendChild(nativeScript);
}
</script>
