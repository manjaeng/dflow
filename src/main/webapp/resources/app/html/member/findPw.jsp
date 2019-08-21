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
				<div class="hdt"><em>비밀번호 찾기</em></div>
				<div class="msg">가입 시 인증한 전화 번호를 입력하시면 <br> 본인 확인 코드를 보내드립니다. </div>
				<div class="form">
					<div class="uiIptPlc phone">
						<input type="number" class="input" value="">
						<span class="plc">Mobile Phone</span>
						<a href="javascript:;" class="btn c sm btnSend">SEND</a>
					</div>
					
					<div class="uiIptPlc certi">
						<input type="number" class="input" value="">
						<span class="plc">Verification number </span>
						<span class="time">2:59</span>
					</div>
					<div class="msgcode">해당 번호로 코드를 전송하였습니다.</div>
					<div class="msg_error show" id="msg_sample1">인증 코드를 다시 확인하세요. </div>
				</div>
			</div>
			<div class="botFixed">
				<div class="in">
					<div class="btnSet fit">
						<a href="./findPwRst.jsp" class="btn xl b fill">NEXT</a>
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