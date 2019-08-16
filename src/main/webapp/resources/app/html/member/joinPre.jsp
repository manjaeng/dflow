<!doctype html>
<html lang="ko">
<head>
<%@ include file="../_inc/meta.jsp" %>
</head>
<body class="body">
<div class="wrap" id="wrap">
		
	<!-- 컨텐츠 시작 -->
	<div id="contain" class="contain popJoinPre">
		<div class="pageHd">
			<div class="in">
				<div class="bts">
					<a href="javascript:history.back();" class="bt hisback">뒤로</a>
				</div>
			</div>
		</div>
		<main id="contents" class="contents">
			<div class="box">
				<div class="hdt">JOIN <em>FAPEE</em></div>
				<div class="bts">
					<a href="./login.jsp" class="bt btnLogin">LOGIN</a>
					<a href="./joinId.jsp" class="bt btnJoin">SIGN UP</a>
				</div>
			</div>
			<div class="joinSet">
				
				<div class="hdt">Sign in with</div>
				<ul class="list">
					<li class="instar"><a href="javascript:;" class="bt"><span>Instargram</span></a></li>
					<li class="kakao"><a href="javascript:;" class="bt"><span>Kakaotalk</span></a></li>
					<li class="facebook"><a href="javascript:;" class="bt"><span>Facebook</span></a></li>
				</ul>
			
			</div>
		</main>
	</div>
	
	<div class="popLayerArea">
		<!-- 레이어팝업 자리 -->
		<%@ include file="../_inc/inc_layers.jsp" %>
	</div>

	<script>
		$(document).ready(function(){
			
		});
	</script>

	<!--// 컨텐츠 끝 -->
	
	

</div>


<%@ include file="../_inc/bottom.jsp" %>
<%@ include file="../_inc/scripts.jsp" %>
</body>
</html>