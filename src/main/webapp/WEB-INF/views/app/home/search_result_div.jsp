<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:choose>
	<c:when test="${param.type eq 'look'}">
		<div class="tabCtn look">
			<div class="uiItemList resultList">
				<ul class="list" id="dp_list">
				</ul>
				<div class="uiLoadMore">
					<em></em> <button type="button" class="btnLoad" onclick="addItemFnc('look')" id="btnListMore">불러오기</button>
				</div>
			</div>
		</div>
	</c:when>

	<c:when test="${param.type eq 'acct'}">
		<div class="tabCtn acct">
			<div class="acctList">
				<ul class="list" id="acct_list">
				</ul>
				<div class="uiLoadMore">
					<em></em> <button type="button" class="btnLoad" onclick="addItemFnc('acct')" id="btnListMore">불러오기</button>
				</div>
			</div>
		</div>
	</c:when>
</c:choose>

