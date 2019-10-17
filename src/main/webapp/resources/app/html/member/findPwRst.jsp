<!doctype html>
<html lang="ko">
<head>
<%@ include file="../_inc/meta.jsp" %>
</head>
<body class="body">
<div class="wrap" id="wrap">
		
	<!-- 컨텐츠 시작 -->
	<div id="contain" class="contain findPw rst">
		<div class="pageHd">
			<div class="in">
				<div class="bts">
					<a href="javascript:history.back();" class="bt hisback">뒤로</a>
				</div>
			</div>
		</div>
		<main id="contents" class="contents">
			<div class="findForm">
				<div class="hdt"><em>비밀번호 재설정</em></div>
				<div class="form">
					<!-- <div class="pw now">
						<input type="password" class="input" placeholder="현재비밀번호 입력">
					</div> -->
					<div class="uiIptPlc pw new">
						<input type="password" class="input">
						<span class="plc">비밀번호 입력</span>
					</div>
					<div class="uiIptPlc pw com">
						<input type="password" class="input">
						<span class="plc">비밀번호 확인</span>
					</div>
					<div class="msg_error show" id="msg_sample1">비밀번호가 일치하지 않습니다.</div>
					<div class="msgs">* 영문숫자조합 6자 이상 조합으로 가능합니다. </div>
				</div>
			</div>
			<div class="botFixed">
				<div class="in">
					<div class="btnSet fit">
						<a href="./findPwCom.jsp" class="btn xl b fill btnDone">DONE</a>
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