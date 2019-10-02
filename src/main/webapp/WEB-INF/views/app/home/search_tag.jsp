<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="wrap" id="wrap">
	<div id="contain" class="contain search result tag">
		<div class="pageHd">
			<div class="in">
				<div class="bts">
					<a href="javascript:history.back();" class="bt hisback">뒤로</a>
				</div>
				<h1 class="tit"><c:out value="${param.tag}"/></h1>
			</div>
		</div>
		<main id="contents" class="contents">
			<section class="secResult" id="searchResult"></section>
		</main>
	</div>

	<div class="popLayerArea">
		<%@ include file="/WEB-INF/views/common/app-layers.jsp"%>
	</div>

	<script>

	</script>
	
	<%@ include file="/WEB-INF/views/common/app-menubar.jsp" %>

</div>