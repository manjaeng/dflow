<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:forEach var="look" items="${lookList}" varStatus="status">
	<c:set var="mainLoopimageUrl" value="${s3Url}${look.image[0]}"/>
<li class="box">
	<div class="item">
		<span class="img"><a href="app/look/look_view.do?lookId=${look.idKey}"><img src="${mainLoopimageUrl}" alt=""></a></span>
	</div>
</li>


</c:forEach>