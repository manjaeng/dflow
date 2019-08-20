<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!doctype html>
<html lang="ko">
<head>
<tiles:insertAttribute name="meta" />
</head>
<body class="body">
	<tiles:insertAttribute name="content" />
	<tiles:insertAttribute name="bottom" />
	<tiles:insertAttribute name="js" />
</body>
</html>