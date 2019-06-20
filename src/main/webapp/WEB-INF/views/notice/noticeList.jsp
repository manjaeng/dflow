<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:forEach var="item" items="${noticeList}">
	제목 : <c:out value="${item.title}" /><br>
	내용 : <c:out value="${item.content}" /><br>
	작성일 : <c:out value="${item.createDate}" /><br>
	조회수 : <c:out value="${item.viewCount}" /><br>
	기간 : <c:out value="${item.startDate}" />
	~<c:out value="${item.endDate}" /><br><br>
	
</c:forEach>
<c:if test="${empty noticeList}">
	No Data
</c:if>
</body>
</html>