<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join_login</title>
<script src="/resources/app/js/jquery.min.js"></script>
<script src="/resources/app/js/_common.js"></script>
<script>
	$(function() {

		$('#join').click(function() {
			fp.util.jsonAjax({
				url : '/rest/v1/user/join',
				data : {
					email : $.trim($("#joinDiv input[name=email]").val()),
					userId : $.trim($("#joinDiv input[name=userId]").val()),
					password : $.trim($("#joinDiv input[name=password]").val()),
				},
				success : function(data) {
					alert('join success');
				},
				error : function(x, s, e) {
					console.log(x);
				}
			});
		});
		
		$('#login').click(function() {
			fp.util.jsonAjax({
				url : '/rest/v1/user/login',
				data : {
					email : $.trim($("#loginDiv input[name=email]").val()),
					password : $.trim($("#loginDiv input[name=password]").val()),
				},
				success : function(data) {
					alert('login success');
					
					fp.util.setCookie({
						authToken : data.authToken,
						userIdKey : data.userIdKey,
						userId : data.userId,
						userType : data.userType,
						userName : data.userName
					});
				},
				error : function(x, s, e) {
					console.clear();
				}
			});
		});
	});
</script>
</head>
<body>
	<div id="joinDiv">
		<input type="text" name="email" placeholder="email"> <br>
		<input type="text" name="userId" placeholder="userId"> <br>
		<input type="text" name="password" placeholder="password"> <br>
		<button id="join">join</button>
	</div>
	<div id="loginDiv" style="margin-top: 50px;">
		<input type="text" name="email" placeholder="email"> <br>
		<input type="text" name="password" placeholder="password"> <br>
		<button id="login">login</button>
	</div>
</body>
</html>