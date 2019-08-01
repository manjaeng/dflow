<!doctype html>
<html lang="ko">
<head>
<%@ include file="../_inc/meta.jsp" %>
</head>
<body class="body">
<div class="wrap" id="wrap">
		
	<!-- 컨텐츠 시작 -->
	<div id="contain" class="contain popJoin pw">
		<div class="pageHd">
			<div class="in">
				<div class="bts">
					<a href="javascript:history.back();" class="bt hisback">뒤로</a>
				</div>
			</div>
		</div>
		<main id="contents" class="contents">
			<div class="joinForm">
				<div class="hdt"><em>SIGN UP</em></div>
				<div class="form">
					<div class="uiIptPlc pw">
						<input type="password" class="input"  id="input_sample1" value="">
						<span class="plc">PASSWORD</span>
					</div>
					<div class="msgs">비밀번호는 6자 이상의 영문, 숫자 조합으로 입력해주세요. </div>
					<div class="agree">
						<div class="txt">본인이 만 14세 이상인 것과 서비스 이용약관, <br> 개인정보 보호정책에 동의하십니까? </div>
						<label class="checkbox"><input type="checkbox"><span></span></label>
					</div>
				</div>
			</div>
			<div class="botFixed">
				<div class="in">
					<div class="btnSet fit">
						<a href="javascript:;" class="btn xl b fill btnDone">Done</a>
					</div>
				</div>
			</div>
		</main>
	</div>

	
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