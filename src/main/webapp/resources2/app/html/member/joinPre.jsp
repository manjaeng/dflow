<!doctype html>
<html lang="ko">
<head>
<%@ include file="../_inc/meta.jsp" %>
</head>
<body class="body">
<div class="wrap" id="wrap">
		
	<!-- 컨텐츠 시작 -->
	
	<article class="popPage popJoinPre" id="popJoinPre">
		<div class="pbd">
			<button type="button" class="btnPopClose" onclick="history.back();">뒤로</button>
			<div class="pct">
				<main class="poptents">
					<div class="box">
						<div class="hdt">JOIN <em>FAPEE</em></div>
						<div class="bts">
							<a href="./login.jsp" class="btn xl type a btnLogin">LOGIN</a>
							<a href="./join.jsp" class="btn xl type b btnJoin">SIGN UP</a>
						</div>
					</div>
					<div class="joinSet">
						
						<div class="hdt">Sign in with</div>
						<ul class="list">
							<li class="instar"><a href="javascript:;" class="bt">Instargram</a></li>
							<li class="kakao"><a href="javascript:;" class="bt">Kakaotalk</a></li>
							<li class="facebook"><a href="javascript:;" class="bt">Facebook</a></li>
						</ul>
					
					</div>
				</main>
			</div>
		</div>
	</article>
	
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