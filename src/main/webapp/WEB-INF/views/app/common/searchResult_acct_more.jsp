<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:forEach var="look" items="${lookList}" varStatus="status">
	<c:set var="mainLoopimageUrl" value="${s3Url}${look.image[0]}"/>
	<div class="item">
		<span class="img"><a class="lk" href="/app/my/profile.do?id=${look.userId}"><img src="//placeimg.com/60/70" alt=""></a></span>
		<a href="/app/my/profile.do?id=${look.userId}" class="info">
			<div class="id">${look.userId}</div>
			<div class="nk">${look.nickName}</div>
		</a>
		<div class="foll"><label class="checkbox"><input type="checkbox" checked><span></span></label></div>
	</div>
</c:forEach>
<!-- 
<li>
	<div class="item">
		<span class="img"><a class="lk" href="../mypage/profile.jsp"><img src="//placeimg.com/100/120/any/1" alt=""></a></span>
		<a href="../mypage/profile.jsp" class="info">
			<div class="id">blue_Ocean</div>
			<div class="nk">바다</div>
		</a>
		<div class="foll"><label class="checkbox"><input type="checkbox" checked><span></span></label></div>
	</div>
</li>
<li>
	<div class="item">
		<span class="img"><a class="lk" href="../mypage/profile.jsp"><img src="//placeimg.com/100/120/any/2" alt=""></a></span>
		<a href="../mypage/profile.jsp" class="info">
			<div class="id">blue_Ocean</div>
			<div class="nk">바다</div>
		</a>
		<div class="foll"><label class="checkbox"><input type="checkbox"><span></span></label></div>
	</div>
</li>
<li>
	<div class="item">
		<span class="img"><a class="lk" href="../mypage/profile.jsp"><img src="//placeimg.com/100/120/any/3" alt=""></a></span>
		<a href="../mypage/profile.jsp" class="info">
			<div class="id">blue_Ocean</div>
			<div class="nk">바다</div>
		</a>
		<div class="foll"><label class="checkbox"><input type="checkbox" checked><span></span></label></div>
	</div>
</li>
<li>
	<div class="item">
		<span class="img"><a class="lk" href="../mypage/profile.jsp"><img src="//placeimg.com/100/120/any/4" alt=""></a></span>
		<a href="../mypage/profile.jsp" class="info">
			<div class="id">blue_Ocean</div>
			<div class="nk">바다</div>
		</a>
		<div class="foll"><label class="checkbox"><input type="checkbox" checked><span></span></label></div>
	</div>
</li>
<li>
	<div class="item">
		<span class="img"><a class="lk" href="../mypage/profile.jsp"><img src="//placeimg.com/100/120/any/5" alt=""></a></span>
		<a href="../mypage/profile.jsp" class="info">
			<div class="id">blue_Ocean</div>
			<div class="nk">바다</div>
		</a>
		<div class="foll"><label class="checkbox"><input type="checkbox"><span></span></label></div>
	</div>
</li>
<li>
	<div class="item">
		<span class="img"><a class="lk" href="../mypage/profile.jsp"><img src="//placeimg.com/100/120/any/6 alt=""></a></span>
		<a href="../mypage/profile.jsp" class="info">
			<div class="id">blue_Ocean</div>
			<div class="nk">바다</div>
		</a>
		<div class="foll"><label class="checkbox"><input type="checkbox"><span></span></label></div>
	</div>
</li>
<li>
	<div class="item">
		<span class="img"><a class="lk" href="../mypage/profile.jsp"><img src="//placeimg.com/100/120/any/7" alt=""></a></span>
		<a href="../mypage/profile.jsp" class="info">
			<div class="id">blue_Ocean</div>
			<div class="nk">바다</div>
		</a>
		<div class="foll"><label class="checkbox"><input type="checkbox"><span></span></label></div>
	</div>
</li>
<li>
	<div class="item">
		<span class="img"><a class="lk" href="../mypage/profile.jsp"><img src="//placeimg.com/100/120/any/8" alt=""></a></span>
		<a href="../mypage/profile.jsp" class="info">
			<div class="id">blue_Ocean</div>
			<div class="nk">바다</div>
		</a>
		<div class="foll"><label class="checkbox"><input type="checkbox"><span></span></label></div>
	</div>
</li>
<li>
	<div class="item">
		<span class="img"><a class="lk" href="../mypage/profile.jsp"><img src="//placeimg.com/100/120/any/9" alt=""></a></span>
		<a href="../mypage/profile.jsp" class="info">
			<div class="id">blue_Ocean</div>
			<div class="nk">바다</div>
		</a>
		<div class="foll"><label class="checkbox"><input type="checkbox"><span></span></label></div>
	</div>
</li>
<li>
	<div class="item">
		<span class="img"><a class="lk" href="../mypage/profile.jsp"><img src="//placeimg.com/100/120/any/10" alt=""></a></span>
		<a href="../mypage/profile.jsp" class="info">
			<div class="id">blue_Ocean</div>
			<div class="nk">바다</div>
		</a>
		<div class="foll"><label class="checkbox"><input type="checkbox"><span></span></label></div>
	</div>
</li>
 -->