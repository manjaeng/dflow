<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:choose>
	<c:when test="${param.type eq 'fwers'}">
		<div class="tabCtn fwers">
			<ul class="list"></ul>
			<div class="uiLoadMore">
				<em></em>
				<button type="button" class="btnLoad" onclick="addItemFnc('fwers')"
					id="btnListMore">불러오기</button>
			</div>
		</div>
	</c:when>

	<c:when test="${param.type eq 'fwing'}">
		<div class="tabCtn fwing">
			<ul class="list"></ul>
			<div class="uiLoadMore">
				<em></em>
				<button type="button" class="btnLoad" onclick="addItemFnc('fwing')"
					id="btnListMore">불러오기</button>
			</div>
		</div>
	</c:when>
</c:choose>

