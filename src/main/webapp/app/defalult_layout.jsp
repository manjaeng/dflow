<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<meta name="viewport" content="user-scalable=no, width=720">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<link rel="stylesheet" href="/resources/app/css/mobile.css?ver=1"
	media="all" type="text/css">
<link rel="stylesheet" type="text/css"
	href="/resources/app/css/common.css" />
<title>Test</title>
<script src="/resources/app/js/jquery.min.js"></script>
<script src="/resources/app/js/_common.js"></script>
<script src="/resources/app/js/_history.js"></script>
<script src="/resources/app/js/_load.js"></script>
<script src="/resources/app/js/_check.js"></script>

<style>
#location {
	width: 100%;
	height: 50px;
	font-size: 30px;
}

.article1 {
	border: 1px solid black;
	margin: 30px;
	text-align: center;
}

.article1>button {
	font-size: 30px;
	padding: 10px;
	margin: 10px;
}

#sel {
	width: 100%;
	font-size: 30px;
	height: 50px;
	margin-bottom: 30px;
}

td {
	width: 10%;
}

tr {
	height: 60px;
}

#main {
	border: 1px solid black; 
	padding: 30px; 
	text-align:center;
	font-size:30px;
}
</style>
</head>
<body>
	<input type="text" id="location" placeholder="직접 페이지 입력 ">
	<div class="article1">
		<button type="button" onclick="fp.load.back()">이전페이지</button>
		<button type="button" onclick="fp.load.reload()">리로드</button>
		<button type="button" onclick="fp.load.move('user/login.html');">로그인</button>
		<button type="button" onclick="fp.load.move('intro/intro.html');">인트로</button>
	</div>
	<div id="main">

		<script>
			$(function() {

				fp.load.move('intro/intro.html');

				$('#location').keyup(function(k) {

					if (k.keyCode == 13) {

						fp.load.move({
							clear : false,
							url : $('#location').val(),
							callBack : function() {

							}
						});

					}
				})
			})

			function more() {
				$('#tbl').jqList({
					method : 'more',
					empty : function() {
						alert('더 없어..');
					}
				});
			}
		</script>

		<table id="tbl">
		</table>
	</div>
</body>
</html>