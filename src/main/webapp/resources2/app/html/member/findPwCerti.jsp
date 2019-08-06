<!doctype html>
<html lang="ko">
<head>
<%@ include file="../_inc/meta.jsp" %>
</head>
<body class="body">
<div class="wrap" id="wrap">
		
	<!-- 컨텐츠 시작 -->
	<div id="contain" class="contain findPwCerti">
		<div class="pageHd">
			<div class="in">
				<div class="bts">
					<a href="javascript:history.back();" class="bt hisback">뒤로</a>
				</div>
			</div>
		</div>
		<main id="contents" class="contents">
			<div class="hdt"><em>비밀번호 찾기</em></div>
			<div class="sec certi">
				<div class="infos">
					<div class="email">abcd1234@naver.com</div>
					<!-- <div class="bts"><a href="javascript:;" class="btn sm c btnSend">SEND</a></div> -->
				</div>
				<div class="guds">
					등록하신 이메일로 발송된 인증 코드를 확인하시고,<br> “인증확인”을 진행해 주세요. <br>
					메일이 도착하지 않았다면, 스팸함을 확인해 주세요.   
				</div>
				<div class="form">
					<input type="text" class="input code" placeholder="코드를 입력해주세요">
					<span class="time">2:59</span>
				</div>
			</div>
			<div class="botFixed">
				<div class="in">
					<div class="btnSet fit">
						<a href="./findPwRst.jsp" class="btn xl b fill btnNext">NEXT</a>
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