<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/resources/admin/vendor/jquery/jquery.min.js"></script>
<script>
$(function() {
	
	$('form').submit(function(e) {
		
		e.preventDefault();
		
		$.ajax({
			type : 'post',
			url : '/login.do',
			data : JSON.stringify({
				userId : $("input[name=userId]").val(),
				password : $("input[name=password]").val(),
				deviceType : "WEB",
				version : "1.0.0"
			}),
			contentType : 'application/json; charset=utf-8',
			dataType : 'json',
			success : function(data) {
				
				if(data.status === 'f') {
					alert(data.text);
				} else if (data.status === 't'){
					location.href='/user/list.do';
					alert('success');
				}
			},
			error : function(xhr,status,error) {
				console.log('status : ',xhr.status);
			}
		});
		
	});
});
</script>
</head>
<body>
	<form>
		<input type="text" name="userId" value="" required autocomplete="off"><br>
		<input type="text" name="password" required autocomplete="off"><br>
		<button>로그인</button>	
	</form>
	화면!
	<br> ${mainList }
</body>
</html>