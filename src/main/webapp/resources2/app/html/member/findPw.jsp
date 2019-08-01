<!doctype html>
<html lang="ko">
<head>
<%@ include file="../_inc/meta.jsp" %>
</head>
<body class="body">
<div class="wrap" id="wrap">
		
	<!-- 컨텐츠 시작 -->
	<div id="contain" class="contain findPw">
		<div class="pageHd">
			<div class="in">
				<div class="bts">
					<a href="javascript:history.back();" class="bt hisback">뒤로</a>
				</div>
			</div>
		</div>
		<main id="contents" class="contents">
			<div class="findForm">
				<div class="hdt"><em>비밀번호찾기</em></div>
				<div class="form">
					<div class="email">
						<span class="plc">이메일 입력</span>
						<input type="email" class="input"  id="input_sample1" value="">
					</div>
					<div class="msgs">가입시 입력한 에메일 주소를 입력하시면 비밀번호를 재설정할 수 있는 링크를 보내드립니다.</div>
				</div>
			</div>
			<div class="botFixed">
				<div class="in">
					<div class="btnSet fit">
						<a href="./certiEmail.jsp" class="btn xl b fill btnSend">이메일받기</a>
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