<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!doctype html>
<html>
<head>
<tiles:insertAttribute name="header" />
</head>
<body>
	<div id="wrapper">
		<tiles:insertAttribute name="nav" />
		<tiles:insertAttribute name="left" />
		<tiles:insertAttribute name="content" />
		<div class="clearfix"></div>
	</div>
	<tiles:insertAttribute name="js" />
</body>

</html>
