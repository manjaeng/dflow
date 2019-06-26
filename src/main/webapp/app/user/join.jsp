<!doctype html>
<html lang="ko">
<head>
<%@ include file="../_inc/meta.jsp" %>
</head>
<body class="body">
<div class="wrap" id="wrap">
		
	<!-- 컨텐츠 시작 -->
	
	<article class="popPage popJoin" id="popJoin">
		<div class="pbd">
			<button type="button" class="btnPopClose" onclick="history.back();">뒤로</button>
			<div class="pct">
				<main class="poptents">
					<div class="joinForm">
						<div class="hdt"><em>FAPEE SIGN UP</em></div>
						<div class="form">
							<div class="memcate">
								<label class="radio"><input type="radio" name="memcate1" checked="checked"><span>일반회원</span></label>
								<label class="radio"><input type="radio" name="memcate1"><span>전문가</span></label>
							</div>
							<div class="uiIptPlc email">
								<input type="text" class="input valid"  id="input_sample1" value="">
								<span class="plc">E-mail</span>
							</div>
							<div class="msgs">이메일은 비밀번호 찾기 및 로그인시 필요합니다.</div>
							<div class="btns">
								<a href="javascript:;" class="btn lg type c btnNext">NEXT</a>
							</div>
						</div>
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
		
	</script>

	<!--// 컨텐츠 끝 -->

	
</div>


<%@ include file="../_inc/bottom.jsp" %>
<%@ include file="../_inc/scripts.jsp" %>
</body>
</html>